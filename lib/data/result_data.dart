import 'package:blended_learning_system/screens/result_screen.dart';

class ResultData {
  final String subjectName;
  final int totalMarks;
  final int obtainMarks;
  final String grade;

  ResultData(this.subjectName, this.totalMarks, this.obtainMarks, this.grade);
}

List<ResultData> result = [
  ResultData("English", 100, 98, 'A'),
  
  ResultData("Computer Science", 100, 50, 'D'),

  ResultData("Physics", 100, 89, 'B'),

  ResultData("English", 100, 98, 'A'),

  ResultData("English", 100, 98, 'A'),





];

