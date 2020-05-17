import 'package:appwrite/appwrite.dart';

// Init SDK
Client client = Client();
Teams teams = Teams(client);

client
    .setProject('5df5acd0d48c2') // Your project ID
;

Future result = teams.updateMembershipStatus(
    teamId: '[TEAM_ID]',
    inviteId: '[INVITE_ID]',
    userId: '[USER_ID]',
    secret: '[SECRET]',
);

result
  .then((response) {
    print(response);
  }).catchError((error) {
    print(error);
  });