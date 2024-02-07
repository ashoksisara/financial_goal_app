# Personal Finance Goal App


### Prerequisites

Before you begin, ensure you have the following installed on your machine:

- [Flutter 3.16.5](https://flutter.dev/docs/get-started/install) 

### Setting up Firebase

1. Create a new project on the [Firebase Console](https://console.firebase.google.com/).
2. Set up Cloud Firestore for your project.

## Seeding Dummy Data in Firestore

To seed the dummy data in Firestore, follow these steps:

1. Navigate to [Firebase Console](https://console.firebase.google.com/).
2. Select your project.
3. In the left sidebar, click on "Firestore database"
4. Click on "Start Collection."
5. Set the collection ID as "goals" and click "Next."
6. Add a document ID as "goal1" and click "Save."
7. Click "Add Field" and add the following fields:
   - `completionDate`: `January 2, 2030 at 10:32:46 AM UTC+5:30`, Type: `timestamp`
   - `contributionAmount`: `25000`, Type: `number`
   - `contributionList`: `array`
   - `goalAmount`: `50000`, Type: `number`
   - `title`: `"Buy a dream house"`, Type: `string`
8. Click on the "Edit" icon for `contributionList` and add three maps:

   - Map 0:
      - `amount`: `15000`, Type: `number`
      - `date`: `February 6, 2024 at 12:35:11 PM UTC+5:30`, Type: `timestamp`
      - `title`: `"Monthly Salary"`, Type: `string`

   - Map 1:
      - `amount`: `9000`, Type: `number`
      - `date`: `February 5, 2024 at 11:35:54 AM UTC+5:30`, Type: `timestamp`
      - `title`: `"Contribution2"`, Type: `string`

   - Map 2:
      - `amount`: `1000`, Type: `number`
      - `date`: `February 4, 2024 at 12:38:30 PM UTC+5:30`, Type: `timestamp`
      - `title`: `"Contribution3"`, Type: `string`

### Running the App

1. Ensure your device (emulator or physical device) is connected.

2. Run the app.

```bash
flutter run
```

### screenshot

<img src="https://github.com/ashoksisara/financial_goal_app/assets/48236083/a180fdaf-011b-4c9c-acb9-68ca60a7ce40" width="300">

 
