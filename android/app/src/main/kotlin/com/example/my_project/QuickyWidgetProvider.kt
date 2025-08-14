package com.nagazakisoftware.quick

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.graphics.BitmapFactory
import android.view.View
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider
import java.net.URL

class QuickyWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.quicky_widget_layout).apply {
                val name = widgetData.getString("display_name", "")
                setTextViewText(R.id.widget_display_name, name)

                setTextViewText(R.id.widget_balance_value, widgetData.getString("saldo", ""))
                setTextViewText(R.id.widget_next_task_value, widgetData.getString("nexttask", ""))
                setTextViewText(R.id.widget_rating_value, widgetData.getString("rating", ""))

                val photoUrl = widgetData.getString("photo_url", null)
                if (photoUrl != null && photoUrl.isNotEmpty()) {
                    try {
                        val url = URL(photoUrl)
                        val bmp = BitmapFactory.decodeStream(url.openConnection().getInputStream())
                        setImageViewBitmap(R.id.widget_avatar, bmp)
                    } catch (_: Exception) {
                        setViewVisibility(R.id.widget_avatar, View.GONE)
                    }
                } else {
                    setViewVisibility(R.id.widget_avatar, View.GONE)
                }
            }
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
