import 'package:flutter/material.dart';
import 'package:litera/screens/paper_detail_screen.dart';
import 'package:litera/widgets/paper_card.dart';
import 'package:litera/widgets/custom_search_bar.dart';
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
        centerTitle: true,
        title: const Text('History'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,   
          spacing: 16,       
          children: [
            CustomSearchBar(
              onChanged: (text){
                print("user typed: $text");
              },
            ),
            if (historyPapers.isEmpty)
                const Center(child: Text("No papers yet.\nRead any papers and mark them as read!"),)

            else
                ...historyPapers.map((paper) => 
                GestureDetector(
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPaperScreen(paper: paper))
                        );
                    },
                    child: PaperCard(
                        title: paper["title"], 
                        authors: paper["authors"], 
                        year: paper["year"], 
                        abstractText: paper["abstract"], 
                        citations: paper["citations"],
                        topics: List<String>.from(paper["topics"]),
                        isRead: paper["isRead"] ?? false,
                        isBookmarked: paper["isBookmarked"] ?? false,
                    )
                )
            ),
          ],
        ),
      )

    );
  }
}