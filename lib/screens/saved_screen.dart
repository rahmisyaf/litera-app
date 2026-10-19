import 'package:flutter/material.dart';
import 'package:litera/widgets/paper_card.dart';
import 'package:litera/data/papers_data.dart';

class SavedScreen extends StatefulWidget{
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {

    final savedPapers = papersData.where((p) => 
      p["isBookmarked"] == true).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Saved'),
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
            if (savedPapers.isEmpty)
            const Center(child: Text("No saved papers yet.\nBookmark papers to read them later!"),)

            else
            ...savedPapers.map((paper) => PaperCard(
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