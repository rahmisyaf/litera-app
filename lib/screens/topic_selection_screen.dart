import 'package:flutter/material.dart';
import 'package:litera/screens/main_screen.dart';
import 'package:litera/widgets/selectable_topic_chip.dart';

class TopicSelection extends StatefulWidget {
  const TopicSelection({super.key});

  @override
  State<TopicSelection> createState() => _TopicSelectionState();
}

class _TopicSelectionState extends State<TopicSelection> {
    final Set<String> selectedTopics = {
      "Artificial Intelligence",
      "Human-Computer Interaction",
      "Cognitive Psychology",
    };
    final List<String> csTopics = [
      "Artificial Intelligence",
      "Human-Computer Interaction",
      "Software Engineering",
      "Information Systems",
      "Computer Networks",
      "Data Science",
    ];
    final List<String> psychTopics = [
      "Cognitive Psychology",
      "Social Psychology",
      "Educational Psychology",
    ];
    final List<String> otherTopics = [
      "Education",
      "Medicine",
      "Economics",
      "Environmental Science",
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: const [
                  Text(
                    "What are you\ninterested in?",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                      height: 1.2,
                    ),
                  ),
                  Text(
                    "Choose a few topics so we can recommend academic papers you may enjoy reading.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF64748B),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  const Row(
                    spacing: 8,
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
                      Text(
                        "Core Tech",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    children: csTopics.map((topic) {
                      return SelectableTopicChip(
                        label: topic,
                        isSelected: selectedTopics.contains(topic),
                        onTap: () {
                          setState(() {
                            if (selectedTopics.contains(topic)) {
                              selectedTopics.remove(topic);
                            } else {
                              selectedTopics.add(topic);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  const Row(
                    spacing: 8,
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
                      Text(
                        "Human Behavior",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    children: psychTopics.map((topic) {
                      return SelectableTopicChip(
                        label: topic,
                        activeColor: const Color(0xFFC2410C),
                        isSelected: selectedTopics.contains(topic),
                        onTap: () {
                          setState(() {
                            if (selectedTopics.contains(topic)) {
                              selectedTopics.remove(topic);
                            } else {
                              selectedTopics.add(topic);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  const Row(
                    spacing: 8,
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
                      Text(
                        "Interdisciplinary",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    children: otherTopics.map((topic) {
                      return SelectableTopicChip(
                        label: topic,
                        isSelected: selectedTopics.contains(topic),
                        onTap: () {
                          setState(() {
                            if (selectedTopics.contains(topic)) {
                              selectedTopics.remove(topic);
                            } else {
                              selectedTopics.add(topic);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Text(
              "${selectedTopics.length} topics selected",
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontSize: 13,
              ),
            ),
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