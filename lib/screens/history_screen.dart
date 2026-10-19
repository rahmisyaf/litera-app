import 'package:flutter/material.dart';
import 'package:litera/widgets/paper_card.dart';
import 'package:litera/data/papers_data.dart';

class HistoryScreen extends StatefulWidget{
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {

    final historyPapers = papersData.where((p) => 
      p["isRead"] == true).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('this is appbar in History'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,   
          spacing: 16,       
          children: [
            SearchBar(
              leading: const Icon(Icons.search),
              hintText: "Search papers, topics, authors...",
              elevation: const WidgetStatePropertyAll(0),
              onChanged: (text){
                print("user typed: $text");
              },
            ),
            if (historyPapers.isEmpty)
            const Center(child: Text("No saved papers yet.\nBookmark papers to read them later!"),)

            else
            ...historyPapers.map((paper) => PaperCard(
                    title: paper["title"], 
                    authors: paper["authors"], 
                    year: paper["year"], 
                    abstractText: paper["abstract"], 
                    citations: paper["citations"],
                    topics: List<String>.from(paper["topics"]),
                    )
            ),
          ],
        ),
      )

    );
  }
}