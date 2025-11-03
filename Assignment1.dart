import 'dart:io';

List<Map<String, dynamic>> stdlist = [];
void main() {
  bool loop = true;

  do {
    print('1. Add Student info.\n2. Show Details.\n3. Exit.\n');
    final choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        addStudent();
      case '2':
        print('\n${'=' * 100}');
        showDetails();

      default:
        loop = false;
    }
  } while (loop);
}

void addStudent() {
  print('Enter Student name: ');
  final name = stdin.readLineSync();
  print('Enter Student ID: ');
  final id = stdin.readLineSync();
  print('Enter Student score: ');
  final score = stdin.readLineSync();

  if (!validateFunc(name!, id!, score!)) {
    print('Invalid Data.');
    return;
  }

  stdlist.add({
    'name': name,
    'id': id,
    'score': double.parse(score),
    "grade": gradingSystem(score),
  });
  stdlist.sort((a, b) => b['score'].compareTo(a['score']));
  print('Studet Added Successfully!');
}

void showDetails() {
  for (var student in stdlist) {
    print(
      'ID: ${student['id']}\t\tName: ${student['name']}\t\t\tScore: ${student['score']}\t\tGrade: ${student['grade']}',
    );
  }
  print('${'=' * 100}');
  print('Total Student: ${stdlist.length}');
  print("Highest Score: ${stdlist[0]['score']}");
  print('Lowest Score: ${stdlist[stdlist.length - 1]['score']}');
}

String gradingSystem(String score) {
  double parseScore = double.parse(score);
  if (parseScore >= 80)
    return "A+";
  else if (parseScore >= 70)
    return 'A';
  else if (parseScore >= 60)
    return 'A-';
  else if (parseScore >= 55)
    return 'B';
  else if (parseScore >= 50)
    return 'C';
  else if (parseScore >= 40)
    return 'D';
  else
    return 'F';
}

bool validateFunc(String name, String id, String score) {
  final index = stdlist.indexWhere((a) => a['id'] == id);
  //print(index);

  final validScore = double.tryParse(score);
  //print(validScore);
  if (name.isEmpty ||
      id.isEmpty ||
      score.isEmpty ||
      index != -1 ||
      validScore == null)
    return false;
  return true;
}
