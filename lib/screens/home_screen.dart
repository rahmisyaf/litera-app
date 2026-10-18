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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8F0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 12,
                  )
                ]
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Artificial Intelligence"),
                      Text("Education"),
                      Icon(Icons.bookmark)
                    ],
                  ),
                  Text("Retrieval-Augmented Generation for Educational Applications"),
                  Row(children: [
                      Text("Jakub Swacha, Elena Vance et al."),
                      Text("2025"),
                    ],
                  ),
                  Text(
                    "Retrieval-Augmented Generation (RAG) has increasingly been adopted to overcome factual hallucinations in large language models applied within pedagogical environments. This paper evaluates a domain-grounded RAG architecture deployed across 1,200 undergraduate engineering students. By pairing an indexed textbook vector database with sparse-dense hybrid retrieval, the system achieves a 68% reduction in hallucinated explanations compared to raw LLM baselines while fostering self-regulated study habits.",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis),
                  Row(
                    children: [
                      Icon(Icons.format_quote_outlined),
                      Text("152 Citations")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}