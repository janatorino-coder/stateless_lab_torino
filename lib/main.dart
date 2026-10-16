import 'package:flutter/material.dart';

void main() {
  runApp(const DirectoryApp());
}

// Stores student information that does not change after creation.
class Student {
  final String name;  
  
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

// Hard-coded sample data for the campus directory.
const List<Student> students = [
  Student(
    name: 'Jana D. Torino',
    course: 'Information Technology',
    yearLevel: 3,
    email: 'jana.torino@example.com'
  ),
  Student(
    name: 'Yaohan M. Macoto',
    course: 'Information Technology',
    yearLevel: 2,
    email: 'yaohan.macoto@example.com'
  ),
  Student(
    name: 'Jelyn T. Tac-an',
    course: 'Computer Science',
    yearLevel: 4,
    email: 'jelyn.tac-an@example.com'
  ),
  Student(
    name: 'Ramil S. Fervis',
    course: 'Social Worker',
    yearLevel: 4,
    email: 'ramil.fervis@example.com'
  ),
  Student(
    name: 'Eunice Ann S. Galon',
    course: 'Human Resource',
    yearLevel: 1,
    email: 'eunice.galon@example.com'
  )
];

// Starts the app with a fixed theme and directory screen.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 136, 25, 158), // Customization 7: blue theme.
        useMaterial3: true,
      ),
      home: const DirectoryScreen(),
    );
  }
}

// Builds the directory screen from fixed student data and reusable widgets.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Campus Directory',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionHeader(title: 'Students'),
          const SizedBox(height: 12),
          ...students.map(
            (student) => StudentCard(student: student),
          ),
        ],
      ),
    );
  }
}

// Displays a heading because its title and appearance do not change internally.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22, // Customization 1: larger heading text.
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 185, 48, 137), // Customization 2: blue heading.
          ),
        ),
        const Divider(thickness: 1.5),
      ],
    );
  }
}

// Shows the supplied student's details without modifying student data.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Customization 4: rounded corners and subtle elevation.
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16), // Customization 5: card padding.
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor:
                  Theme.of(context).colorScheme.primary,
              child: Text(
                student.name[0].toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 17, // Customization 6: emphasized name.
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    student.course,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                  ),
                  InfoRow(
                    icon: Icons.school,
                    text: 'Year Level: ${student.yearLevel}',
                  ),
                  InfoRow(
                    icon: Icons.email,
                    text: student.email,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Displays one icon and its text without managing changing state.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5), // Customization 3: row spacing.
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}




