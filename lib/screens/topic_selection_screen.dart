import 'package:flutter/material.dart';
import 'package:litera/screens/main_screen.dart';

class TopicSelection extends StatefulWidget {
  const TopicSelection({super.key});

  @override
  State<TopicSelection> createState() => _TopicSelectionState();
}

class _TopicSelectionState extends State<TopicSelection> {
  Widget buildChip({
    required String label,
    Color bgColor = Colors.white,
    Color borderColor = const Color(0xFFE2E8F0),
    Color textColor = const Color(0xFF334155),
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3E8FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "STEP 1 OF 1",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9333EA),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "What are you\ninterested in?",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
                height: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Choose a few topics so we can recommend academic papers you may enjoy reading.",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF64748B),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            const Row(
              children: [
                Text(
                  "COMPUTER SCIENCE",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF475569),
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "Core Tech",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 10,
              children: [
                buildChip(
                  label: "Artificial Intelligence",
                  bgColor: const Color(0xFFEFF6FF),
                  borderColor: const Color(0xFF93C5FD),
                  textColor: const Color(0xFF1D4ED8),
                ),
                buildChip(
                  label: "Human-Computer Interaction",
                  bgColor: const Color(0xFFEFF6FF),
                  borderColor: const Color(0xFF93C5FD),
                  textColor: const Color(0xFF1D4ED8),
                ),
                buildChip(
                  label: "Software Engineering",
                ),
                buildChip(
                  label: "Information Systems",
                ),
                buildChip(
                  label: "Computer Networks",
                ),
                buildChip(
                  label: "Data Science",
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Row(
              children: [
                Text(
                  "PSYCHOLOGY",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF475569),
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "Human Behavior",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 10,
              children: [
                buildChip(
                  label: "Cognitive Psychology",
                  bgColor: const Color(0xFFFFF7ED),
                  borderColor: const Color(0xFFFDBA74),
                  textColor: const Color(0xFFC2410C),
                ),
                buildChip(
                  label: "Social Psychology",
                ),
                buildChip(
                  label: "Educational Psychology",
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Row(
              children: [
                Text(
                  "OTHER DOMAINS",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF475569),
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "Interdisciplinary",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 10,
              children: [
                buildChip(
                  label: "Education",
                ),
                buildChip(
                  label: "Medicine",
                ),
                buildChip(
                  label: "Economics",
                ),
                buildChip(
                  label: "Environmental Science",
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "3 topics selected",
              style: TextStyle(
                color: Color(0xFF64748B),
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}