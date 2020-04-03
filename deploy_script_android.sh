#!/bin/sh

openssl aes-256-cbc -k "$ENCRYPT_PASSWORD" -d -a -in ./android/key.properties.enc -out ./android/key.properties
openssl aes-256-cbc -k "$ENCRYPT_PASSWORD" -d -a -in ./android/keystore.enc -d -a -out ./android/app/key.jks
openssl aes-256-cbc -k "$ENCRYPT_PASSWORD" -d -a -in ./android/app/google-services.json.enc -d -out ./android/app/google-services.json
curl -sL firebase.tools | bash
firebase appdistribution:distribute "build/app/outputs/apk/release/app-release.apk" --app 1:239216846304:android:5e7b91e0de1dbbba583785 --groups android-testers --token $FIREBASE_CLI_TOKEN