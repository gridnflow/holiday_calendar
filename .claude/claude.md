#  German Federal State Holiday Calendar

### **Enterprise-Grade Flutter Mobile Application**

This project is a high-performance Flutter application designed to provide accurate public holiday data for all 16 German federal states. By shifting from local data to a **REST API-driven architecture**, the app ensures real-time accuracy and long-term scalability.

--

## Architecture & Tech Stack

The app follows a **Clean Architecture** pattern to separate concerns and ensure testability.

* **Framework:** Flutter (Latest Stable, Null Safety)
* **State Management:** Riverpod (for predictable, testable state)
* **UI Components:** `table_calendar` for calendar rendering
* **Data Source:** Local JSON files (offline-first)
* **Monetization:** Planned integration with ads (Banner & Native)

> Note: Networking and database layers are not needed at this early stage.  
> API and local database (Hive/Isar) can be added later if we want real-time updates or persistent caching.


---

##  Data Flow (API-First Strategy)

To ensure the app remains functional in Germany’s occasionally spotty network areas, we implement an **API-First** logic:

1. **Request:** UI triggers a request for a specific year and federal state.
2. **API Call:** The app directly calls the Public Holiday API to fetch data.
3. **State Update:** The API response is parsed and pushed into the Riverpod state.
4. **UI:** Reactively updates via AsyncValue, showing a loading indicator (Shimmer or spinner) during the fetch.
5. **Error Handling:** If the API fails, the UI displays an error message.

---

##  Key Features for Users

* **Regional Accuracy:** Precise filtering for holidays like *Fronleichnam* or *Allerheiligen* based on the selected **Bundesland**.
* **Bridge Day (Brückentage) Optimizer:** A logic-driven feature that suggests the best days to take off to maximize vacation time (A key retention driver for the German market).
* **Offline Access:** Once synced, the calendar works 100% offline.
* **Multi-Year Support:** Seamlessly toggle between past, current, and future years.

---

##  Monetization & UI Integration

The UI is designed with a **"Revenue-First"** mindset without sacrificing aesthetics:

* **Safe-Zone Ad Placement:** Dedicated slots in the layout for `Anchored Adaptive Banners`.
* **Native Ad Injection:** Holiday detail lists include native ad templates that mimic the app's design.
* **Pro Tier Path:** The architecture includes a `UserSubscriptionProvider` to easily toggle off ads and unlock "Bridge Day Push Notifications" for premium users.

---

##  Scalability Roadmap

1. **Phase 1 (MVP):** API integration for Germany, basic state selection, and caching.
2. **Phase 2 (UX/Monetization):** AdMob integration and "Bridge Day" calculation logic.
3. **Phase 3 (Advanced):** Integration with Google/Outlook Calendars.

---

##  Development Principles

* **DRY (Don't Repeat Yourself):** Reusable UI components for ad containers and list tiles.
* **Performance:** No heavy computations on the Main Thread; use Isolates for complex holiday calculations if necessary.
* **Localization:** Built-in support for German (DE) and English (EN) using `intl`.

--