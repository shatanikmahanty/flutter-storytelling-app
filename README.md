<p align="center">
  <img src="assets%2Fimages%2Fapp_logo.png">
</p>

# dial_my_fable
A flutter project that uses the callchimp and cron-job APIs to send a daily call to the user and narrate a story to them based on selected category in app.

## Getting Started

- Clone the repository
- Run `flutter pub get`
- Refer to env setup directions given below
- Refer to firebase setup directions given below
- Run `dart run build_runner build -d` to generate the required files
- Run `flutter run` to start the app

## Env Setup

This project uses the `flutter_dotenv` package to manage environment variables. An example of the environment variables file is provided in the `env.example` file.

To set up the environment variables, follow these steps:

- Rename `env.example` file in the root of the project to `env`
- Generate api keys from the consoles of https://callchimp.ai/ and https://console.cron-job.org/
- Replace the `CRON_JOB_ORG_API_KEY` value and `CALL_CHIMP_API_KEY` value with the generated api keys

## Firebase Setup

This project uses Firebase for authentication and database. To set up Firebase, follow these steps:

- Create a new project in the Firebase console
- Enable phone authentication in the Firebase console
- Enable firestore in the Firebase console
- Use `flutterfire cli` to generate the required project files by running `flutterfire configure` 

## Project Structure

The project uses clean architecture. Key directories are:

- `lib/features`: Contains the features of the app. They are sub-divided into `data`, `blocs`, and `presentation` directories.
- `lib/configurations`: Contains the configurations of the app. They are sub-divided into `constants`, `router`, and `theme` directories.
- `lib/utils`: Contains the utility classes and functions used in the app.
