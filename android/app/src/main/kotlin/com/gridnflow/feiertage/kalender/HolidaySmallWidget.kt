package com.gridnflow.feiertage.kalender

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import java.time.LocalDate

/**
 * Compact 1x1 home-screen widget showing just the D-day countdown to the next
 * holiday, e.g. "D-36". Reads the same SharedPreferences the app writes via
 * [WidgetService] and reuses [HolidayWidget]'s recompute logic, so the count
 * keeps decreasing on every update even when the app is never reopened.
 */
class HolidaySmallWidget : AppWidgetProvider() {
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
            val isoDate = prefs.getString("flutter.widget_next_holiday_iso", "") ?: ""
            val fallbackDays = prefs.getLong("flutter.widget_next_holiday_days", -1L)

            val dDay = HolidayWidget.dDayLabel(isoDate, fallbackDays, LocalDate.now())

            val views = RemoteViews(context.packageName, R.layout.holiday_widget_small)
            views.setTextViewText(R.id.widget_small_days, dDay)
            views.setTextViewText(R.id.widget_small_name, name)

            val intent = Intent(context, MainActivity::class.java)
            val pendingIntent = PendingIntent.getActivity(
                context, 0, intent, PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_small_root, pendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
