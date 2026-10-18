# Harsh's Olympiad Lab — Android Studio Project

This folder is the Android Studio project root. It contains the Android app under `app/`, the Gradle wrapper, and the production web app in `app/src/main/assets/public/`.

## Build the APK with GitHub Actions

1. Upload the contents of this folder to the root of your GitHub repository (preserve the folders).
2. The workflow `.github/workflows/main.yml` runs on pushes to `main` or `master`, or when started manually.
3. Open the repository's **Actions** tab and choose the successful **Build Android APK** run.
4. Download the `harsh-olympiad-lab-debug-apk` artifact. Extract its ZIP to get `app-debug.apk`.

The workflow verifies that an APK file was actually created. It fails if the APK is missing instead of reporting a misleading green build.

## Build locally

Open this project root in Android Studio, let Gradle sync, then select **Build → Build Bundle(s) / APK(s) → Build APK(s)**.

Or run from this folder:

```sh
chmod +x gradlew
./gradlew assembleDebug
```

The debug APK output is normally:

`app/build/outputs/apk/debug/app-debug.apk`

## Notes

- This is a debug APK for testing, not a Play Store signed release.
- Google Sheets / Gemini access depends on the backend and credentials configured in the web app. Never commit API keys or credentials.
