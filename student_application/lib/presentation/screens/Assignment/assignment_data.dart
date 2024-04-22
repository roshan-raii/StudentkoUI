class AssignmentData {
  final String subjectName;
  final String topicName;
  final String assignDate;
  final String lastDate;
  final String status;

  AssignmentData(this.subjectName, this.topicName, this.assignDate,
      this.lastDate, this.status);
}

List<AssignmentData> assignment = [
  AssignmentData(
      "Database", "Query Set", "12 Nov 2023", "19 Nov 2023", "Pending"),
  AssignmentData("Java", "GUI design", "29 Oct 2023", "17 Nov 2023", "Pending"),
  AssignmentData("Software Engineering", "Methodology", "1 Dec 2023",
      "25 Dec 2023", "Submitted"),
  AssignmentData(
      "Networking", "Week 4 workshop", "14 Jun 2023", "29 Jun 2023", "Missed"),
];
