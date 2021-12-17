part of appwrite;

class Account extends Service {
    Account(Client client): super(client);

     /// Get Account
     ///
     /// Get currently logged in user data as JSON object.
     ///
     Future<models.User> get() async {
        final String path = '/account';

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.get, path: path, params: params, headers: headers);
        return models.User.fromMap(res.data);
    }

     /// Create Account
     ///
     /// Use this endpoint to allow a new user to register a new account in your
     /// project. After the user registration completes successfully, you can use
     /// the [/account/verfication](/docs/client/account#accountCreateVerification)
     /// route to start verifying the user email address. To allow the new user to
     /// login to their new account, you need to create a new [account
     /// session](/docs/client/account#accountCreateSession).
     ///
     Future<models.User> create({required String email, required String password, String? name}) async {
        final String path = '/account';

        final Map<String, dynamic> params = {
            'email': email,
            'password': password,
            'name': name,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.post, path: path, params: params, headers: headers);
        return models.User.fromMap(res.data);
    }

     /// Delete Account
     ///
     /// Delete a currently logged in user account. Behind the scene, the user
     /// record is not deleted but permanently blocked from any access. This is done
     /// to avoid deleted accounts being overtaken by new users with the same email
     /// address. Any user-related resources like documents or storage files should
     /// be deleted separately.
     ///
     Future delete() async {
        final String path = '/account';

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.delete, path: path, params: params, headers: headers);
        return  res.data;
    }

     /// Update Account Email
     ///
     /// Update currently logged in user account email address. After changing user
     /// address, user confirmation status is being reset and a new confirmation
     /// mail is sent. For security measures, user password is required to complete
     /// this request.
     /// This endpoint can also be used to convert an anonymous account to a normal
     /// one, by passing an email address and a new password.
     ///
     Future<models.User> updateEmail({required String email, required String password}) async {
        final String path = '/account/email';

        final Map<String, dynamic> params = {
            'email': email,
            'password': password,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.patch, path: path, params: params, headers: headers);
        return models.User.fromMap(res.data);
    }

     /// Create Account JWT
     ///
     /// Use this endpoint to create a JSON Web Token. You can use the resulting JWT
     /// to authenticate on behalf of the current user when working with the
     /// Appwrite server-side API and SDKs. The JWT secret is valid for 15 minutes
     /// from its creation and will be invalid if the user will logout in that time
     /// frame.
     ///
     Future<models.Jwt> createJWT() async {
        final String path = '/account/jwt';

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.post, path: path, params: params, headers: headers);
        return models.Jwt.fromMap(res.data);
    }

     /// Get Account Logs
     ///
     /// Get currently logged in user list of latest security activity logs. Each
     /// log returns user IP address, location and date and time of log.
     ///
     Future<models.LogList> getLogs() async {
        final String path = '/account/logs';

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.get, path: path, params: params, headers: headers);
        return models.LogList.fromMap(res.data);
    }

     /// Update Account Name
     ///
     /// Update currently logged in user account name.
     ///
     Future<models.User> updateName({required String name}) async {
        final String path = '/account/name';

        final Map<String, dynamic> params = {
            'name': name,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.patch, path: path, params: params, headers: headers);
        return models.User.fromMap(res.data);
    }

     /// Update Account Password
     ///
     /// Update currently logged in user password. For validation, user is required
     /// to pass in the new password, and the old password. For users created with
     /// OAuth and Team Invites, oldPassword is optional.
     ///
     Future<models.User> updatePassword({required String password, String? oldPassword}) async {
        final String path = '/account/password';

        final Map<String, dynamic> params = {
            'password': password,
            'oldPassword': oldPassword,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.patch, path: path, params: params, headers: headers);
        return models.User.fromMap(res.data);
    }

     /// Get Account Preferences
     ///
     /// Get currently logged in user preferences as a key-value object.
     ///
     Future<models.Preferences> getPrefs() async {
        final String path = '/account/prefs';

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.get, path: path, params: params, headers: headers);
        return models.Preferences.fromMap(res.data);
    }

     /// Update Account Preferences
     ///
     /// Update currently logged in user account preferences. You can pass only the
     /// specific settings you wish to update.
     ///
     Future<models.User> updatePrefs({required Map prefs}) async {
        final String path = '/account/prefs';

        final Map<String, dynamic> params = {
            'prefs': prefs,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.patch, path: path, params: params, headers: headers);
        return models.User.fromMap(res.data);
    }

     /// Create Password Recovery
     ///
     /// Sends the user an email with a temporary secret key for password reset.
     /// When the user clicks the confirmation link he is redirected back to your
     /// app password reset URL with the secret key and email address values
     /// attached to the URL query string. Use the query string params to submit a
     /// request to the [PUT
     /// /account/recovery](/docs/client/account#accountUpdateRecovery) endpoint to
     /// complete the process. The verification link sent to the user's email
     /// address is valid for 1 hour.
     ///
     Future<models.Token> createRecovery({required String email, required String url}) async {
        final String path = '/account/recovery';

        final Map<String, dynamic> params = {
            'email': email,
            'url': url,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.post, path: path, params: params, headers: headers);
        return models.Token.fromMap(res.data);
    }

     /// Create Password Recovery (confirmation)
     ///
     /// Use this endpoint to complete the user account password reset. Both the
     /// **userId** and **secret** arguments will be passed as query parameters to
     /// the redirect URL you have provided when sending your request to the [POST
     /// /account/recovery](/docs/client/account#accountCreateRecovery) endpoint.
     /// 
     /// Please note that in order to avoid a [Redirect
     /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
     /// the only valid redirect URLs are the ones from domains you have set when
     /// adding your platforms in the console interface.
     ///
     Future<models.Token> updateRecovery({required String userId, required String secret, required String password, required String passwordAgain}) async {
        final String path = '/account/recovery';

        final Map<String, dynamic> params = {
            'userId': userId,
            'secret': secret,
            'password': password,
            'passwordAgain': passwordAgain,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.put, path: path, params: params, headers: headers);
        return models.Token.fromMap(res.data);
    }

     /// Get Account Sessions
     ///
     /// Get currently logged in user list of active sessions across different
     /// devices.
     ///
     Future<models.SessionList> getSessions() async {
        final String path = '/account/sessions';

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.get, path: path, params: params, headers: headers);
        return models.SessionList.fromMap(res.data);
    }

     /// Create Account Session
     ///
     /// Allow the user to login into their account by providing a valid email and
     /// password combination. This route will create a new session for the user.
     ///
     Future<models.Session> createSession({required String email, required String password}) async {
        final String path = '/account/sessions';

        final Map<String, dynamic> params = {
            'email': email,
            'password': password,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.post, path: path, params: params, headers: headers);
        return models.Session.fromMap(res.data);
    }

     /// Delete All Account Sessions
     ///
     /// Delete all sessions from the user account and remove any sessions cookies
     /// from the end client.
     ///
     Future deleteSessions() async {
        final String path = '/account/sessions';

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.delete, path: path, params: params, headers: headers);
        return  res.data;
    }

     /// Create Anonymous Session
     ///
     /// Use this endpoint to allow a new user to register an anonymous account in
     /// your project. This route will also create a new session for the user. To
     /// allow the new user to convert an anonymous account to a normal account, you
     /// need to update its [email and
     /// password](/docs/client/account#accountUpdateEmail) or create an [OAuth2
     /// session](/docs/client/account#accountCreateOAuth2Session).
     ///
     Future<models.Session> createAnonymousSession() async {
        final String path = '/account/sessions/anonymous';

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.post, path: path, params: params, headers: headers);
        return models.Session.fromMap(res.data);
    }

     /// Create Magic URL session
     ///
     /// Sends the user an email with a secret key for creating a session. When the
     /// user clicks the link in the email, the user is redirected back to the URL
     /// you provided with the secret key and userId values attached to the URL
     /// query string. Use the query string parameters to submit a request to the
     /// [PUT
     /// /account/sessions/magic-url](/docs/client/account#accountUpdateMagicURLSession)
     /// endpoint to complete the login process. The link sent to the user's email
     /// address is valid for 1 hour. If you are on a mobile device you can leave
     /// the URL parameter empty, so that the login completion will be handled by
     /// your Appwrite instance by default.
     ///
     Future<models.Token> createMagicURLSession({required String email, String? url}) async {
        final String path = '/account/sessions/magic-url';

        final Map<String, dynamic> params = {
            'email': email,
            'url': url,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.post, path: path, params: params, headers: headers);
        return models.Token.fromMap(res.data);
    }

     /// Create Magic URL session (confirmation)
     ///
     /// Use this endpoint to complete creating the session with the Magic URL. Both
     /// the **userId** and **secret** arguments will be passed as query parameters
     /// to the redirect URL you have provided when sending your request to the
     /// [POST
     /// /account/sessions/magic-url](/docs/client/account#accountCreateMagicURLSession)
     /// endpoint.
     /// 
     /// Please note that in order to avoid a [Redirect
     /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
     /// the only valid redirect URLs are the ones from domains you have set when
     /// adding your platforms in the console interface.
     ///
     Future<models.Session> updateMagicURLSession({required String userId, required String secret}) async {
        final String path = '/account/sessions/magic-url';

        final Map<String, dynamic> params = {
            'userId': userId,
            'secret': secret,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.put, path: path, params: params, headers: headers);
        return models.Session.fromMap(res.data);
    }

     /// Create Account Session with OAuth2
     ///
     /// Allow the user to login to their account using the OAuth2 provider of their
     /// choice. Each OAuth2 provider should be enabled from the Appwrite console
     /// first. Use the success and failure arguments to provide a redirect URL's
     /// back to your app when login is completed.
     /// 
     /// If there is already an active session, the new session will be attached to
     /// the logged-in account. If there are no active sessions, the server will
     /// attempt to look for a user with the same email address as the email
     /// received from the OAuth2 provider and attach the new session to the
     /// existing user. If no matching user is found - the server will create a new
     /// user..
     /// 
     ///
    Future createOAuth2Session({required String provider, String? success, String? failure, List? scopes}) async {
        final String path = '/account/sessions/oauth2/{provider}'.replaceAll(RegExp('{provider}'), provider);

        final Map<String, dynamic> params = {
            'success': success,
            'failure': failure,
            'scopes': scopes,
            'project': client.config['project'],
        };


        final List query = [];

        params.forEach((key, value) {
          if (value is List) { 
            for (var item in value) {
              query.add(Uri.encodeComponent(key + '[]') + '=' + Uri.encodeComponent(item));
            }
          } else if(value != null) {
              query.add(Uri.encodeComponent(key) + '=' + Uri.encodeComponent(value));
          }
        });

        Uri endpoint = Uri.parse(client.endPoint);
        Uri url = Uri(scheme: endpoint.scheme,
          host: endpoint.host,
          port: endpoint.port,
          path: endpoint.path + path,
          query: query.join('&')
        );

      return client.webAuth(url);

    }

     /// Get Session By ID
     ///
     /// Use this endpoint to get a logged in user's session using a Session ID.
     /// Inputting 'current' will return the current session being used.
     ///
     Future<models.Session> getSession({required String sessionId}) async {
        final String path = '/account/sessions/{sessionId}'.replaceAll(RegExp('{sessionId}'), sessionId);

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.get, path: path, params: params, headers: headers);
        return models.Session.fromMap(res.data);
    }

     /// Delete Account Session
     ///
     /// Use this endpoint to log out the currently logged in user from all their
     /// account sessions across all of their different devices. When using the
     /// option id argument, only the session unique ID provider will be deleted.
     ///
     Future deleteSession({required String sessionId}) async {
        final String path = '/account/sessions/{sessionId}'.replaceAll(RegExp('{sessionId}'), sessionId);

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.delete, path: path, params: params, headers: headers);
        return  res.data;
    }

     /// Create Email Verification
     ///
     /// Use this endpoint to send a verification message to your user email address
     /// to confirm they are the valid owners of that address. Both the **userId**
     /// and **secret** arguments will be passed as query parameters to the URL you
     /// have provided to be attached to the verification email. The provided URL
     /// should redirect the user back to your app and allow you to complete the
     /// verification process by verifying both the **userId** and **secret**
     /// parameters. Learn more about how to [complete the verification
     /// process](/docs/client/account#accountUpdateVerification). The verification
     /// link sent to the user's email address is valid for 7 days.
     /// 
     /// Please note that in order to avoid a [Redirect
     /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md),
     /// the only valid redirect URLs are the ones from domains you have set when
     /// adding your platforms in the console interface.
     /// 
     ///
     Future<models.Token> createVerification({required String url}) async {
        final String path = '/account/verification';

        final Map<String, dynamic> params = {
            'url': url,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.post, path: path, params: params, headers: headers);
        return models.Token.fromMap(res.data);
    }

     /// Create Email Verification (confirmation)
     ///
     /// Use this endpoint to complete the user email verification process. Use both
     /// the **userId** and **secret** parameters that were attached to your app URL
     /// to verify the user email ownership. If confirmed this route will return a
     /// 200 status code.
     ///
     Future<models.Token> updateVerification({required String userId, required String secret}) async {
        final String path = '/account/verification';

        final Map<String, dynamic> params = {
            'userId': userId,
            'secret': secret,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        final res = await client.call(HttpMethod.put, path: path, params: params, headers: headers);
        return models.Token.fromMap(res.data);
    }
}