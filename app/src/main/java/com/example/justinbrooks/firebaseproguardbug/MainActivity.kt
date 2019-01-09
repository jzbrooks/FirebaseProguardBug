package com.example.justinbrooks.firebaseproguardbug

import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.crashlytics.android.Crashlytics

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        findViewById<Button>(R.id.crasher).setOnClickListener {
            Crashlytics.getInstance().crash()
        }
    }
}
