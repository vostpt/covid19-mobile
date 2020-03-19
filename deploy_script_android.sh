#!/bin/sh

curl -sL firebase.tools | bash
firebase appdistribution:distribute "build/app/outputs/apk/release/app-release.apk" --app 1:239216846304:android:5e7b91e0de1dbbba583785 --groups android-testers --token $FIREBASE_CLI_TOKEN