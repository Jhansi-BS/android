<RelativeLayout xmlns:androclass="http://schemas.android.com/apk/res/android"  
    xmlns:tools="http://schemas.android.com/tools"  
    android:layout_width="match_parent"  
    android:layout_height="match_parent"  
    tools:context=".MainActivity" >  
  
    <Button  
        android:id="@+id/button1"  
        android:layout_width="wrap_content"  
        android:layout_height="wrap_content"  
        android:layout_alignParentTop="true"  
        android:layout_centerHorizontal="true"  
        android:layout_marginTop="118dp"  
        android:text="Call" />  
  
    <EditText  
        android:id="@+id/editText1"  
        android:layout_width="wrap_content"  
        android:layout_height="wrap_content"  
        android:layout_alignParentTop="true"  
        android:layout_centerHorizontal="true"  
        android:layout_marginTop="25dp"  
        android:ems="10" />  
  
</RelativeLayout>
Android-Manifest.xml

<?xml version="1.0" encoding="utf-8"?>  
  
<manifest xmlns:androclass="http://schemas.android.com/apk/res/android"  
    package="com.example.phonecall"  
    android:versionCode="1"  
    android:versionName="1.0" >  
  
    <uses-sdk  
        android:minSdkVersion="8"  
        android:targetSdkVersion="16" />  
  
    <uses-permission android:name="android.permission.CALL_PHONE" />  
    <application  
        android:allowBackup="true"  
        android:icon="@drawable/ic_launcher"  
        android:label="@string/app_name"  
        android:theme="@style/AppTheme" >  
        <activity  
            android:name="com.example.phonecall.MainActivity"  
            android:label="@string/app_name" >  
            <intent-filter>  
                <action android:name="android.intent.action.MAIN" />  
  
                <category android:name="android.intent.category.LAUNCHER" />  
            </intent-filter>  
        </activity>  
    </application>  
  
</manifest>

Activity class

import android.net.Uri;  
import android.os.Bundle;  
import android.app.Activity;  
import android.content.Intent;  
import android.view.Menu;  
import android.view.View;  
import android.view.View.OnClickListener;  
import android.widget.Button;  
import android.widget.EditText;  
  
public class MainActivity extends Activity {  
    EditText edittext1;  
    Button button1;  
    @Override  
    protected void onCreate(Bundle savedInstanceState) {  
        super.onCreate(savedInstanceState);  
        setContentView(R.layout.activity_main);  
  
        //Getting the edittext and button instance  
        edittext1=(EditText)findViewById(R.id.editText1);  
        button1=(Button)findViewById(R.id.button1);  
  
        //Performing action on button click  
        button1.setOnClickListener(new OnClickListener(){  
  
            @Override  
            public void onClick(View arg0) {  
                String number=edittext1.getText().toString();  
                Intent callIntent = new Intent(Intent.ACTION_CALL);  
                callIntent.setData(Uri.parse("tel:"+number));  
                startActivity(callIntent);  
            }  
              
        });  
    }  
  
    @Override  
    public boolean onCreateOptionsMenu(Menu menu) {  
        // Inflate the menu; this adds items to the action bar if it is present.  
        getMenuInflater().inflate(R.menu.activity_main, menu);  
        return true;  
    }  
      
}
