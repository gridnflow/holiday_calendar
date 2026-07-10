package com.gridnflow.feiertage.kalender

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import java.time.LocalDate
import java.time.temporal.ChronoUnit

class HolidayWidget : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
    ) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    companion object {
        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int,
        ) {
            val prefs = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            val name = prefs.getString("flutter.widget_next_holiday_name", "—") ?: "—"
            val date = prefs.getString("flutter.widget_next_holiday_date", "—") ?: "—"
            val isoDate = prefs.getString("flutter.widget_next_holiday_iso", "") ?: ""
            val fallbackDays = prefs.getLong("flutter.widget_next_holiday_days", -1L)

            val daysText = daysText(isoDate, fallbackDays, LocalDate.now())

            val views = RemoteViews(context.packageName, R.layout.holiday_widget)
            views.setTextViewText(R.id.widget_holiday_name, name)
            views.setTextViewText(R.id.widget_holiday_date, date)
            views.setTextViewText(R.id.widget_days_text, daysText)

            val intent = Intent(context, MainActivity::class.java)
            val pendingIntent = PendingIntent.getActivity(
                context, 0, intent, PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }

        /// Countdown label for the widget.
        ///
        /// Recomputes the day count from [isoDate] (`yyyy-MM-dd`) against
        /// [today] so it keeps decreasing on every `onUpdate` even if the app
        /// is never reopened. Falls back to [fallbackDays] (the last value the
        /// app wrote) when the ISO date is missing or unparseable — e.g. prefs
        /// written by an older app version.
        fun daysText(isoDate: String, fallbackDays: Long, today: LocalDate): String {
            val days: Long = try {
                if (isoDate.isNotEmpty()) {
                    ChronoUnit.DAYS.between(today, LocalDate.parse(isoDate))
                } else {
                    fallbackDays
                }
            } catch (_: Exception) {
                fallbackDays
            }

            return when {
                days == 0L -> "Heute!"
                days == 1L -> "Morgen"
                days > 0 -> "in ${days}T"
                else -> "—"
            }
        }
    }
}
