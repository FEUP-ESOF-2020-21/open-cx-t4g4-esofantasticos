String getWeekdayName(int weekday) {
  String weekdayName;
  switch (weekday) {
    case 1:
      weekdayName = "Monday";
      break;
    case 2:
      weekdayName = "Tuesday";
      break;
    case 3:
      weekdayName = "Wednesday";
      break;
    case 4:
      weekdayName = "Thursday";
      break;
    case 5:
      weekdayName = "Friday";
      break;
    case 6:
      weekdayName = "Saturday";
      break;
    case 7:
      weekdayName = "Sunday";
      break;
    default:
      weekdayName = "Error";
      break;
  }

  return weekdayName;
}
