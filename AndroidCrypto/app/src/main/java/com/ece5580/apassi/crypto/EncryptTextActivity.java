package com.ece5580.apassi.crypto;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Button;

public class EncryptTextActivity extends ActionBarActivity {

    private LED m_LED = new LED();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_encrypt_text);

        LED led = new LED();
        Log.i("MainActivity", led.getMyString());

        byte [] input = new byte[]{0, 0, 0, 0, 0, 0, 0, 0};
        byte [] key = new byte[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        byte [] result = led.encrypt(input, key);

        String str = "";
        for (byte b: input) {
            str += " " + String.format("%x ", b);
        }

        setupEncryptButton();

    }

    private void setupEncryptButton() {
        Button b = (Button) findViewById(R.id.encryptButton);
        b.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {

                byte [] cipher = getCipherText().getBytes();
                byte [] key = getKey().getBytes();

                if (cipher.length < 8) {
                    cipher = new byte[8];

                    for (int i = 0; i < getCipherText().getBytes().length; i++) {
                        cipher[i] = getCipherText().getBytes()[i];
                    }

                    for (int i = getCipherText().getBytes().length; i < 8; i++) {
                        cipher[i] = 0;
                    }
                }

                if (key.length < 16) {
                    key = new byte[16];

                    for (int i = 0; i < getKey().getBytes().length; i++) {
                        key[i] = getKey().getBytes()[i];
                    }

                    for (int i = getKey().getBytes().length; i < 16; i++) {
                        key[i] = 0;
                    }
                }

                m_LED.encrypt(cipher, key);

                String str = "";
                for (byte b: cipher) {
                    str += " " + String.format("%x ", b);
                }

                setTextString(str);
            }
        });
    }

    private String getCipherText() {
        return ((EditText) findViewById(R.id.cipherEditText)).getText().toString();
    }

    private String getKey() {
        return ((EditText) findViewById(R.id.keyEditText)).getText().toString();
    }

    private void setTextString(String str) {
        TextView textView = (TextView) findViewById(R.id.textView);
        textView.setText(str);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_encrypt_text, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
