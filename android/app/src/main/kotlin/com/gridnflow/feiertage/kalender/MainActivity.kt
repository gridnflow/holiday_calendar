package com.gridnflow.feiertage.kalender

import android.content.Intent
import android.os.Bundle
import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.provider.CalendarContract
import androidx.activity.enableEdgeToEdge
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        enableEdgeToEdge()
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "com.gridnflow.feiertage.kalender/widget"
        ).setMethodCallHandler { call, result ->
            if (call.method == "updateWidget") {
                val appWidgetManager = AppWidgetManager.getInstance(this)
                val componentName = ComponentName(this, HolidayWidget::class.java)
                val widgetIds = appWidgetManager.getAppWidgetIds(componentName)
                for (id in widgetIds) {
                    HolidayWidget.updateAppWidget(this, appWidgetManager, id)
                }
                result.success(null)
            } else {
                result.notImplemented()
            }
        }

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "com.gridnflow.feiertage.kalender/calendar"
        ).setMethodCallHandler { call, result ->
            if (call.method == "addEvent") {
                val title = call.argument<String>("title") ?: ""
                val beginMs = call.argument<Long>("beginMs") ?: 0L
                val endMs = call.argument<Long>("endMs") ?: 0L
                val allDay = call.argument<Boolean>("allDay") ?: true
                val description = call.argument<String>("description") ?: ""

                val intent = Intent(Intent.ACTION_INSERT).apply {
                    data = CalendarContract.Events.CONTENT_URI
                    putExtra(CalendarContract.Events.TITLE, title)
                    putExtra(CalendarContract.EXTRA_EVENT_BEGIN_TIME, beginMs)
                    putExtra(CalendarContract.EXTRA_EVENT_END_TIME, endMs + 86400000L)
                    putExtra(CalendarContract.Events.ALL_DAY, allDay)
                    putExtra(CalendarContract.Events.DESCRIPTION, description)
                    putExtra(CalendarContract.Events.EVENT_TIMEZONE, "Europe/Berlin")
                }
                startActivity(intent)
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }
}
