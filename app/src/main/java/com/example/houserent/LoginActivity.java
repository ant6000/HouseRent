package com.example.houserent;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.nfc.Tag;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.auth.api.signin.GoogleSignIn;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInClient;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.button.MaterialButton;
import com.google.firebase.FirebaseException;
import com.google.firebase.FirebaseTooManyRequestsException;
import com.google.firebase.auth.AuthCredential;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthInvalidCredentialsException;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.auth.GoogleAuthProvider;
import com.google.firebase.auth.PhoneAuthCredential;
import com.google.firebase.auth.PhoneAuthOptions;
import com.google.firebase.auth.PhoneAuthProvider;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import java.util.concurrent.TimeUnit;

public class LoginActivity extends AppCompatActivity {

    MaterialButton Continue,LgninGoogle,LgninFb;
    EditText editTextPhoneNumber;
    ProgressBar progressBar;

    private static final int RC_SIGN_IN = 9001;
    private GoogleSignInClient mGoogleSignInClient;
    private FirebaseAuth mAuth;
    private String VerificationId;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        // Initializing all the button & edittext view
        Continue = findViewById(R.id.continue_);
        LgninGoogle = findViewById(R.id.continue_with_google);
        LgninFb = findViewById(R.id.continue_with_facebook);
        editTextPhoneNumber = findViewById(R.id.login_phone_num);
        progressBar = findViewById(R.id._progressbar);

        // continue with phone number button click
        Continue.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (editTextPhoneNumber.getText().toString().trim().isEmpty()|| editTextPhoneNumber.length()<10){
                    editTextPhoneNumber.requestFocus();
                    Toast.makeText(LoginActivity.this, "Enter Valid Phone Number", Toast.LENGTH_SHORT).show();
                    return;
                }
                else {
                    progressBar.setVisibility(view.VISIBLE);
                    Continue.setVisibility(View.INVISIBLE);
                    String phone = editTextPhoneNumber.getText().toString();
                    startPhoneNumberVerification(phone);
                }
            }
        });

        // Configure Google Sign In
        GoogleSignInOptions gso = new GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
                .requestIdToken(getString(R.string.default_web_client_id))
                .requestEmail()
                .build();

        mGoogleSignInClient = GoogleSignIn.getClient(this, gso);

        mAuth = FirebaseAuth.getInstance();
        LgninGoogle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                signIn();
            }
        });

    } // onCreate() ends
    private void signIn() {
        Intent signInIntent = mGoogleSignInClient.getSignInIntent();
        startActivityForResult(signInIntent, RC_SIGN_IN);
    }
    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        // Result returned from launching the Intent from GoogleSignInApi.getSignInIntent(...);
        if (requestCode == RC_SIGN_IN) {
            Task<GoogleSignInAccount> task = GoogleSignIn.getSignedInAccountFromIntent(data);
            try {
                // Google Sign In was successful, authenticate with Firebase
                GoogleSignInAccount account = task.getResult(ApiException.class);
                firebaseAuthWithGoogle(account);
            } catch (ApiException e) {
                // Google Sign In failed, update UI appropriately
                Toast.makeText(this, "Error", Toast.LENGTH_SHORT).show();
            }
        }
    }

    private void firebaseAuthWithGoogle(GoogleSignInAccount acct) {
        AuthCredential credential = GoogleAuthProvider.getCredential(acct.getIdToken(), null);
        mAuth.signInWithCredential(credential)
                .addOnCompleteListener(this, new OnCompleteListener<AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task<AuthResult> task) {
                        if (task.isSuccessful()) {
                            // Sign in success, update UI with the signed-in user's information
                            Toast.makeText(LoginActivity.this, "Signed in Successfully", Toast.LENGTH_SHORT).show();
                            FirebaseUser user = mAuth.getCurrentUser();
                            saveUserDataToFirebase( user);
                            // go to newsfeed
                            Intent intent = new Intent(getApplicationContext(),NewsFeed.class);
                            startActivity(intent);
                        } else {
                            // If sign in fails, display a message to the user.
                            Toast.makeText(LoginActivity.this, "Failure", Toast.LENGTH_SHORT).show();
                        }
                    }
                });
    }

    private void saveUserDataToFirebase(FirebaseUser user) {
        // Create a new user object with the user data from Google Sign-In
        User data = new User(user.getDisplayName(), user.getEmail());

        // Get the Firebase Realtime Database reference
        FirebaseDatabase database = FirebaseDatabase.getInstance();
        DatabaseReference myRef = database.getReference("Users");

        // Push the user data to the "Users" node in the database
        myRef.child(user.getUid()).setValue(data)
                .addOnSuccessListener(new OnSuccessListener<Void>() {
                    @Override
                    public void onSuccess(Void aVoid) {
                        //Log.d("abc", "User data saved to Firebase Realtime Database");
                        Toast.makeText(LoginActivity.this, "Data Saved", Toast.LENGTH_SHORT).show();
                    }
                })
                .addOnFailureListener(new OnFailureListener() {
                    @Override
                    public void onFailure(@NonNull Exception e) {
                        //Log.e("abc", "Error saving user data to Firebase Realtime Database", e);
                        Toast.makeText(LoginActivity.this, "Error Saving Data", Toast.LENGTH_SHORT).show();
                    }
                });

    }

    private void startPhoneNumberVerification(String phoneNumber) {
        PhoneAuthOptions options =
                PhoneAuthOptions.newBuilder(mAuth)
                        .setPhoneNumber(phoneNumber)       // Phone number to verify
                        .setTimeout(60L, TimeUnit.SECONDS) // Timeout and unit
                        .setActivity(this)                 // Activity (for callback binding)
                        .setCallbacks(mCallbacks)          // OnVerificationStateChangedCallbacks
                        .build();
        PhoneAuthProvider.verifyPhoneNumber(options);
    }
    private PhoneAuthProvider.OnVerificationStateChangedCallbacks
    mCallbacks = new PhoneAuthProvider.OnVerificationStateChangedCallbacks() {

        @Override
        public void onVerificationCompleted(@NonNull PhoneAuthCredential credential) {
            progressBar.setVisibility(View.GONE);
            Continue.setVisibility(View.VISIBLE);
        }

        @Override
        public void onVerificationFailed(@NonNull FirebaseException e) {
            progressBar.setVisibility(View.GONE);
            Continue.setVisibility(View.VISIBLE);
            Toast.makeText(LoginActivity.this, e.getMessage(), Toast.LENGTH_SHORT).show();

            if (e instanceof FirebaseAuthInvalidCredentialsException) {
                // Invalid request
                Toast.makeText(LoginActivity.this, "Invalid request", Toast.LENGTH_SHORT).show();
            } else if (e instanceof FirebaseTooManyRequestsException) {
                // The SMS quota for the project has been exceeded
                Toast.makeText(LoginActivity.this, "SMS quota exceeded", Toast.LENGTH_SHORT).show();
            }

        }

        @Override
        public void onCodeSent(@NonNull String verificationId,
                @NonNull PhoneAuthProvider.ForceResendingToken token) {
            // Save verification ID and resending token so we can use them later
            VerificationId = verificationId;
            progressBar.setVisibility(View.GONE);
            Continue.setVisibility(View.VISIBLE);
            Intent intent = new Intent(getApplicationContext(),OtpVerificationActivity.class);
            intent.putExtra("mobile",editTextPhoneNumber.getText().toString());
            intent.putExtra("VerificationId",VerificationId);
            startActivity(intent);

        }
    };




}