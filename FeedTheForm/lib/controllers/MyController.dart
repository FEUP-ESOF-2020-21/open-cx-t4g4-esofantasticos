import 'DatabaseController.dart';
import "dart:math";

class MyController implements DatabaseController {
  String currentUser;
  Map<String,  Map<String, double>> ratingsPerLecture;
  Map<int, String> winnersPerLecture;

  MyController(String currentUser) {
    this.currentUser = currentUser;
    ratingsPerLecture = new Map<String,  Map<String, double>>();
    winnersPerLecture = new Map<int, String>();

    winnersPerLecture.update(1, (_) => "To be announced", ifAbsent: () => "To be announced");
    winnersPerLecture.update(2, (_) => "To be announced", ifAbsent: () => "To be announced");
    winnersPerLecture.update(3, (_) => "To be announced", ifAbsent: () => "To be announced");

    Map<String, double> ratingsFirstLecture = new Map<String, double>();
    Map<String, double> ratingsSecondLecture = new Map<String, double>();
    Map<String, double> ratingsThirdLecture = new Map<String, double>();
    ratingsFirstLecture.update("user1", (_) => 2, ifAbsent: () => 2);
    ratingsFirstLecture.update("user2", (_) => 1, ifAbsent: () => 1);
    ratingsFirstLecture.update("user3", (_) => 5, ifAbsent: () => 5);
    ratingsSecondLecture.update("user1", (_) => 5, ifAbsent: () => 5);
    ratingsSecondLecture.update("user2", (_) => 4, ifAbsent: () => 4);
    ratingsSecondLecture.update("user3", (_) => 5, ifAbsent: () => 5);
    ratingsThirdLecture.update("user1", (_) => 2, ifAbsent: () => 2);
    ratingsThirdLecture.update("user2", (_) => 1, ifAbsent: () => 1);
    ratingsThirdLecture.update("user3", (_) => 3, ifAbsent: () => 3);
    ratingsPerLecture.update("Applying AI to Real World Use Cases", (_) => ratingsFirstLecture, ifAbsent: () => ratingsFirstLecture);
    ratingsPerLecture.update("Targeting Metabolism to Treat the Aging Brain", (_) => ratingsSecondLecture, ifAbsent: () => ratingsSecondLecture);
    ratingsPerLecture.update("Machine design innovation through technology and education", (_) => ratingsThirdLecture, ifAbsent: () => ratingsThirdLecture);
  }

  @override
  bool isAdmin() {
    if(currentUser.compareTo("admin") == 0) return true;
    else return false;
  }

  @override
  String getCurrentUser() {
    return currentUser;
  }

  String getPrizeWinner(prizeID) {
    return(winnersPerLecture[prizeID]);
  }

  void addRating(String lecture, String user, double rating) {
    if(ratingsPerLecture.keys.contains(lecture)) {
      ratingsPerLecture.forEach((key, ratings) {
        if(lecture == key) {
          ratings.update(user, (_) => rating, ifAbsent: () => rating);
          ratingsPerLecture.update(lecture, (_) => ratings);
        }
      });
    } else {
      Map<String, double> ratings;
      ratings.update(user, (_) => rating, ifAbsent: () => rating);
      ratingsPerLecture.update(lecture, (_) => ratings, ifAbsent: () => ratings);
    }
  }

  String generateWinner(int prizeID) {
    String randomWinner;
    List<String> participants = new List<String>();
    final _random = new Random();

    if(ratingsPerLecture.isNotEmpty) {
      ratingsPerLecture.forEach((_, ratings) {
        ratings.forEach((user, _) {
          participants.add(user);
        });
      });

      randomWinner = participants[_random.nextInt(participants.length)];
      winnersPerLecture.update(prizeID, (_) => randomWinner + "!");
      return randomWinner;
    } else return null;
  }
}
