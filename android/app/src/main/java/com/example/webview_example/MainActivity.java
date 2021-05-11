package com.example.webview_example;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import android.app.Activity;
import android.os.Bundle;
import android.os.Message;
import android.util.Log;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;

public class MainActivity extends FlutterActivity {

  private WebView wv;
  private String TAG = "MainActivity";
  private static final int REQUEST_INTERNET = 200;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_home);
      WebView wv = (WebView) findViewById(R.id.webView);
      wv.getSettings().setJavaScriptEnabled(true);
      wv.getSettings().setJavaScriptCanOpenWindowsAutomatically(true);


      wv.setWebViewClient(new WebViewClient());
      wv.setWebChromeClient(new WebChromeClient());

      wv.loadUrl("https://waidai.netlify.app");
    }
  }
//  @Override
//  protected void onCreate(Bundle savedInstanceState) {
//    super.onCreate(savedInstanceState);
//    GeneratedPluginRegistrant.registerWith(this);

//    WebView payWeb;
//  WebView payWeb = (WebView) findViewById(R.id.mywebview);
//
//  payWeb.setWebViewClient(new WebViewClient() {
//    @Override;
//    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
//    public void onPermissionRequest(final PermissionRequest request) {
//      request.grant(request.getResources());
//    }
//  });

//  }
////
//}
