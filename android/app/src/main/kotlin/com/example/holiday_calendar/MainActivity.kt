package com.example.holiday_calendar

import android.os.Bundle
import android.appwidget.AppWidgetManager
import android.content.ComponentName
import androidx.activity.enableEdgeToEdge
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        enableEdgeToEdge()
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "com.example.holiday_calendar/widget"
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
    }
}
