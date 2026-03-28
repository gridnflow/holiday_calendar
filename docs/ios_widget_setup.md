# iOS WidgetKit Setup Guide

## Overview

This guide explains how to add the iOS home screen widget to the Holiday Calendar app. The widget displays the next upcoming holiday with a D-day countdown, matching the existing Android widget.

## Architecture

```
Flutter (widget_service.dart)
  → MethodChannel("com.example.holiday_calendar/widget")
  → AppDelegate.swift
  → UserDefaults(suiteName: "group.com.example.holidayCalendar")
  → WidgetKit Widget Extension reads UserDefaults
  → WidgetCenter.shared.reloadAllTimelines()
```

## Step 1: Add Widget Extension Target in Xcode

1. Open `ios/Runner.xcworkspace` in Xcode
2. File → New → Target → **Widget Extension**
3. Product Name: `HolidayWidget`
4. Language: **Swift**
5. Uncheck "Include Configuration Intent" (we use a static widget)
6. Click **Finish**

## Step 2: Configure App Group

Both the main app and the Widget Extension must share the same App Group.

1. Select the **Runner** target → Signing & Capabilities → **+ Capability** → **App Groups**
2. Add group: `group.com.example.holidayCalendar`
3. Select the **HolidayWidgetExtension** target → Signing & Capabilities → **+ Capability** → **App Groups**
4. Add the same group: `group.com.example.holidayCalendar`

## Step 3: Set Deployment Target

1. Select the **HolidayWidgetExtension** target → General
2. Set **Minimum Deployments** to iOS 14.0 (WidgetKit minimum)

## Step 4: Replace Widget Code

Replace the contents of `HolidayWidget/HolidayWidget.swift` with:

```swift
import WidgetKit
import SwiftUI

// MARK: - Data Provider

struct HolidayEntry: TimelineEntry {
    let date: Date
    let holidayName: String
    let holidayDate: String
    let daysUntil: Int
}

struct HolidayProvider: TimelineProvider {
    private let appGroupId = "group.com.example.holidayCalendar"

    func placeholder(in context: Context) -> HolidayEntry {
        HolidayEntry(
            date: Date(),
            holidayName: "Feiertag",
            holidayDate: "1. Jan",
            daysUntil: 7
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (HolidayEntry) -> Void) {
        completion(readEntry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<HolidayEntry>) -> Void) {
        let entry = readEntry()

        // Refresh at midnight so the D-day counter updates daily
        let calendar = Calendar.current
        let tomorrow = calendar.startOfDay(for: calendar.date(byAdding: .day, value: 1, to: Date())!)
        let timeline = Timeline(entries: [entry], policy: .after(tomorrow))
        completion(timeline)
    }

    private func readEntry() -> HolidayEntry {
        let userDefaults = UserDefaults(suiteName: appGroupId)
        let name = userDefaults?.string(forKey: "widget_next_holiday_name") ?? "Kein Feiertag"
        let date = userDefaults?.string(forKey: "widget_next_holiday_date") ?? "—"
        let days = userDefaults?.integer(forKey: "widget_next_holiday_days") ?? -1

        return HolidayEntry(
            date: Date(),
            holidayName: name,
            holidayDate: date,
            daysUntil: days
        )
    }
}

// MARK: - Widget View

struct HolidayWidgetEntryView: View {
    var entry: HolidayEntry
    @Environment(\.widgetFamily) var family

    private var daysText: String {
        switch entry.daysUntil {
        case 0: return "Heute!"
        case 1: return "Morgen"
        case let d where d > 0: return "in \(d)T"
        default: return "—"
        }
    }

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.118, green: 0.533, blue: 0.898),  // #1E88E5
                    Color(red: 0.098, green: 0.439, blue: 0.784),
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            VStack(alignment: .leading, spacing: 4) {
                // Header
                Text("NÄCHSTER FEIERTAG")
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(.white.opacity(0.6))
                    .tracking(0.5)

                Spacer()

                // Holiday name
                Text(entry.holidayName)
                    .font(.system(size: family == .systemSmall ? 15 : 17, weight: .bold))
                    .foregroundColor(.white)
                    .lineLimit(2)

                Spacer()

                // Bottom row: date + D-day
                HStack {
                    Text(entry.holidayDate)
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.8))

                    Spacer()

                    Text(daysText)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(Color(red: 0.31, green: 0.76, blue: 0.97))  // #4FC3F7
                }
            }
            .padding(16)
        }
    }
}

// MARK: - Widget Configuration

@main
struct HolidayCalendarWidget: Widget {
    let kind: String = "HolidayWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: HolidayProvider()) { entry in
            if #available(iOS 17.0, *) {
                HolidayWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                HolidayWidgetEntryView(entry: entry)
            }
        }
        .configurationDisplayName("Nächster Feiertag")
        .description("Zeigt den nächsten Feiertag mit Countdown an.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

// MARK: - Preview

#Preview(as: .systemSmall) {
    HolidayCalendarWidget()
} timeline: {
    HolidayEntry(date: Date(), holidayName: "Tag der Deutschen Einheit", holidayDate: "3. Okt", daysUntil: 12)
    HolidayEntry(date: Date(), holidayName: "Weihnachtstag", holidayDate: "25. Dez", daysUntil: 95)
}
```

## Step 5: Remove Auto-generated Files

Xcode may generate extra files like `HolidayWidgetBundle.swift`. Delete any files that conflict with the `@main` attribute in the widget code above.

## Step 6: Build and Test

1. Select the **HolidayWidgetExtension** scheme in Xcode
2. Build and run on a simulator or device
3. Long-press on the home screen → tap **+** → search "Feiertage" or "Holiday"
4. Add the widget

## Verification Checklist

- [ ] App Group `group.com.example.holidayCalendar` added to both targets
- [ ] Widget Extension deployment target set to iOS 14.0+
- [ ] `HolidayWidget.swift` contains the code from Step 4
- [ ] Main app successfully writes to App Group UserDefaults (check via `AppDelegate.swift`)
- [ ] Widget displays correct holiday name, date, and D-day count
- [ ] Widget updates at midnight (timeline policy: `.after(tomorrow)`)
- [ ] Tapping widget opens the main app

## Troubleshooting

**Widget shows placeholder data:**
- Ensure App Group identifiers match exactly in both targets
- Open the main app at least once so it writes data to UserDefaults

**Widget doesn't update:**
- `WidgetCenter.shared.reloadAllTimelines()` is called in `AppDelegate.swift`
- Check that `widget_service.dart` passes data via MethodChannel on iOS

**Build error "WidgetKit not found":**
- Ensure the Widget Extension target's deployment target is iOS 14.0+
