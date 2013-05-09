package com.example.dobaron;

//import android.app.Activity;
import org.apache.cordova.DroidGap;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.view.KeyEvent;

public class MainActivity extends DroidGap {
    /** Called when the activity is first created. */

	
	
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		//종료버튼 눌렀을때 앱 종료 시키기 위한 재정의
		if(keyCode ==KeyEvent.KEYCODE_BACK){
			finish();
			return true;
		}
		return super.onKeyDown(keyCode, event);
	}
   /* private void confirmAppExit() {
		AlertDialog.Builder db = new AlertDialog.Builder(this);
		db.setTitle(R.string.exit_app_title)
		.setMessage(R.string.exit_app_message)//"프로그램 종료할래?"
		.setCancelable(true)
		.setPositiveButton(android.R.string.ok,new OnClickListener(){
			public void onClick(DialogInterface dialog,int which){
				finish();//확인버튼 누르면 종료
			}
			
		})
		.setNegativeButton(android.R.string.cancel,null)
		.show();
		
	}*/
	
	public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
       // setContentView(R.layout.main);
        
      //Android TelephonyManager 초기화

        TelephonyManager tm = null ;

        //TelephonyManager 시스템서비스 사용등록
        tm=(TelephonyManager)getSystemService(Context.TELEPHONY_SERVICE);

        //	휴대폰 소유자의 휴대폰번호를 userPhone 에 저장
        String userPhone = tm.getLine1Number();
       // super.loadUrl("http://poncoo.com/janghwan.jsp?userPhone="+userPhone);
        super.loadUrl("file:///android_asset/www/code128.html?userPhone="+userPhone);
        
       //나중에 폰번호는 암호화 시켜서 보내주길 바란다 후킹 당해요 ~  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //외부페이지 연동 부분
        
    }
}