package com.example.holiday_calendar

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews

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
            val days = prefs.getLong("flutter.widget_next_holiday_days", -1L)

            val daysText = when {
                days == 0L -> "Heute!"
                days == 1L -> "Morgen"
                days > 0 -> "in ${days}T"
                else -> "—"
            }

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
    }
}
