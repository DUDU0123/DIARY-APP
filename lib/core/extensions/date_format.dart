extension DateTimeFormatting on DateTime {
  String formatToMMMddyyyy() {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];

    String month = months[this.month - 1];  
    String day = this.day.toString();
    String year = this.year.toString();

    return '$month $day, $year';
  }
}
