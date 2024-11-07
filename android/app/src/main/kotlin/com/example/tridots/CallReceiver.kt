package com.example.tridots

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.telephony.TelephonyManager
import androidx.core.content.ContextCompat

class CallReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {

        if (intent.action == "android.intent.action.PHONE_STATE") {
            val state = intent.getStringExtra(TelephonyManager.EXTRA_STATE)
            if (state == TelephonyManager.EXTRA_STATE_RINGING) {
                // Start the overlay service on an incoming call
                val serviceIntent = Intent(context, MyOverlayService::class.java)
                ContextCompat.startForegroundService(context, serviceIntent)
            }
        }
    }
}
