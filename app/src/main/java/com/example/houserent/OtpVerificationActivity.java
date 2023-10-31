package com.example.houserent;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.button.MaterialButton;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.PhoneAuthCredential;
import com.google.firebase.auth.PhoneAuthProvider;

public class OtpVerificationActivity extends AppCompatActivity {
    private EditText input1,input2,input3,input4,input5,input6;
    private TextView txtMobile;
    private MaterialButton verifyButton;
    private FirebaseAuth mAuth;
    private ProgressBar progressBar;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_otp_verification);

        mAuth = FirebaseAuth.getInstance();
        verifyButton = findViewById(R.id._otpVerify);
        progressBar = findViewById(R.id.progress_bar);

        input1 = findViewById(R.id.inputCode1);
        input2 = findViewById(R.id.inputCode2);
        input3 = findViewById(R.id.inputCode3);
        input4 = findViewById(R.id.inputCode4);
        input5 = findViewById(R.id.inputCode5);
        input6 = findViewById(R.id.inputCode6);
        txtMobile = findViewById(R.id.phn_num_holder);
        txtMobile.setText(String.format("+880-%s",getIntent().getStringExtra("mobile")));

        String Verificationid = getIntent().getStringExtra("VerificationId");
        verifyButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (input1.getText().toString().isEmpty()
                ||input2.getText().toString().isEmpty()
                ||input3.getText().toString().isEmpty()
                ||input4.getText().toString().isEmpty()
                ||input5.getText().toString().isEmpty()
                ||input6.getText().toString().isEmpty()){
                    Toast.makeText(OtpVerificationActivity.this, "Enter Valid Code", Toast.LENGTH_SHORT).show();
                    return;
                }

                String otp = input1.getText().toString()+ input2.getText().toString()
                        + input3.getText().toString()+ input4.getText().toString()
                        + input5.getText().toString()+ input6.getText().toString();

                if (Verificationid != null){
                    progressBar.setVisibility(View.VISIBLE);
                    verifyButton.setVisibility(View.INVISIBLE);

                    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.getCredential( Verificationid, otp);
                        FirebaseAuth.getInstance().signInWithCredential(phoneAuthCredential)
                            .addOnCompleteListener(new OnCompleteListener<AuthResult>() {
                                @Override
                                public void onComplete(@NonNull Task<AuthResult> task) {
                                    progressBar.setVisibility(View.GONE);
                                    verifyButton.setVisibility(View.VISIBLE);
                                    if (task.isSuccessful()){
                                        Intent intent = new Intent(getApplicationContext(),NewsFeed.class);
                                        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                                        startActivity(intent);
                                    }else {
                                        Toast.makeText(OtpVerificationActivity.this, "CODE Invaild", Toast.LENGTH_SHORT).show();

                                    }
                                }
                            });
                }
            }
        });
        //Log.d("otp",otp);
        setUpOTPInputs();
    }// onCreate ends here

    // this method is for otp input field verification
    private  void setUpOTPInputs(){
        input1.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                if (! charSequence.toString().trim().isEmpty())
                    input2.requestFocus();
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });
        input2.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                if (! charSequence.toString().trim().isEmpty())
                    input3.requestFocus();
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });
        input3.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                if (! charSequence.toString().trim().isEmpty())
                    input4.requestFocus();
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });
        input4.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                if (! charSequence.toString().trim().isEmpty())
                    input5.requestFocus();
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });
        input5.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                if (! charSequence.toString().trim().isEmpty())
                    input6.requestFocus();
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });
    }



}