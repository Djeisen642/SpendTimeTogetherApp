import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:firebase_ui_oauth_facebook/firebase_ui_oauth_facebook.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:spend_time_together_app/src/views/registration_view.dart';

import '../utils/constants.dart';
import './main_menu_item_list_view.dart';

class AuthGate extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/images/sample_logo.jpg'),
                ),
              );
            },
            providers: [
              EmailAuthProvider(),
              GoogleProvider(clientId: GoogleWebClientId),
              FacebookProvider(
                  clientId: FacebookClientId, redirectUri: FacebookRedirectUrl),
            ],
          );
        }

        if (snapshot.data!.displayName == null) {
          return RegistrationView();
        }

        return const MainMenuItemListView();
      },
    );
  }
}
