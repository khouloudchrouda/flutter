package com.example.prianou_app

import io.flutter.embedding.android.FlutterActivity

class Application : FlutterApplication(), PluginRegistrantCallback {
    override fun onCreate() {
        super.onCreate();
        GeofencingService.setPluginRegistrant(this);
    }

    override fun registerWith(registry: PluginRegistry) {
        GeneratedPluginRegistrant.registerWith(registry);
    }
}