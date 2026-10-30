import 'package:flutter/material.dart';
import 'package:litera/widgets/paper_card.dart';
import 'package:litera/data/papers_data.dart';
import 'package:litera/screens/topic_selection_screen.dart';
import 'package:litera/screens/paper_detail_screen.dart';
import 'package:litera/widgets/custom_search_bar.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<String> topics = [
    'For You (Personalized)',
    'Artificial Intelligence',
    'Human-Computer Interaction',
    'Software Engineering',
    'Data Science',
    'Information Systems',
    'Computer Networks',
    'Cognitive Psychology',
    'Social Psychology',
    'Educational Psychology',
    'Economics',
    'Medicine',
    'Environmental Science',
  ];

  String? selectedTopic = 'For You (Personalized)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const TopicSelection()),
                );              
            }, 
            icon: Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,   
          spacing: 10,       
          children: [
            Text(
              "Hello, Welcome!",
              style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
              ),
            ),
            Text(
              "Here are some papers for you",
              style: TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              ),
            ),
            CustomSearchBar(
              onChanged: (text){
                print("user typed: $text");
              },
            ),
            Row(
              spacing: 8,
              children: [
                const Text(
                  "Topic: ",
                   style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF475569),
                   ),
                  ),
                Expanded(
                  child: DropdownMenu<String>(
                    expandedInsets: EdgeInsets.zero,
                    initialSelection: 'For You (Personalized)', // Simple initial setup
                    enableSearch: true,  // Users can type to filter long lists
                    enableFilter: true,  // Hides non-matching entries as they type
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1E293B),
                    ),
                    trailingIcon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF64748B),
                    ),
                    inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF1D4ED8), width: 1.5),
                        ),
                    ),
                    menuStyle: MenuStyle(
                        backgroundColor: const WidgetStatePropertyAll(Colors.white),
                        elevation: const WidgetStatePropertyAll(4),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                        ),
                   ),
                    onSelected: (String? value) {
                      // Capture the value for your business logic
                      setState(() {
                        selectedTopic = value;
                      });
                      print('Selected: $value'); 
                    },
                    dropdownMenuEntries: topics.map((String value) {
                      return DropdownMenuEntry<String>(
                        value: value,
                        label: value, // Takes a plain String label
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            ...papersData.map((paper) => 
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)  => DetailPaperScreen(paper: paper))
                );
              },
            
            child: PaperCard(
                    title: paper["title"], 
                    authors: paper["authors"], 
                    year: paper["year"], 
                    abstractText: paper["abstract"], 
                    citations: paper["citations"],
                    topics: List<String>.from(paper["topics"]),
                    isBookmarked: paper["isBookmarked"] ?? false,

                    onBookmarkTap: () {
                      paper["isBookmarked"] = !(paper["isBookmarked"] ?? false);
                    },
  
                )
              )
            ),
          ],
        ),
      )
    );
  }
}