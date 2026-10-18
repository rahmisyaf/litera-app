import 'package:flutter/material.dart';

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

            }, 
            icon: Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,   
          spacing: 16,       
          children: [
            Text("Good Morning!"),
            Text("Here are some papers for you"),
            SearchBar(
              leading: const Icon(Icons.search),
              hintText: "Search papers, topics, authors...",
              elevation: const WidgetStatePropertyAll(0),
              onChanged: (text){
                print("user typed: $text");
              },
            ),
            Row(
              children: [
                Text("Topic: "),
                DropdownMenu<String>(
                  initialSelection: 'For You (Personalized)', // Simple initial setup
                  enableSearch: true,  // Users can type to filter long lists
                  enableFilter: true,  // Hides non-matching entries as they type
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
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}