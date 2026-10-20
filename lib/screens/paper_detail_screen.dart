import 'package:flutter/material.dart';

class DetailPaperScreen extends StatefulWidget{
  final Map<String, dynamic> paper;

  const DetailPaperScreen({
    super.key,
    required this.paper
  });

  @override
  State<DetailPaperScreen> createState() => _DetailPaperScreenState();
}

class _DetailPaperScreenState extends State<DetailPaperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('this is appbar in Detail Paper'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,   
          spacing: 16,       
          children: [
            Row(
              children: [
                ...(widget.paper["topics"] as List).map((topic) => 
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(topic),
                    )
                  )
              ],
            ),
            Text(widget.paper["title"]),
            Text(widget.paper["authors"]),
            Text(widget.paper["year"]),
            Row(
              children: [
                Icon(Icons.format_quote_outlined),
                      Text("${widget.paper["citations"]} Citations")
              ],
            ),
            InkWell(
              onTap: (){
                print("link is clicked");
              },
              child:  const Text("Open Original Paper")
            ),
            InkWell(
              onTap: (){
                print("link is clicked");
              },
              child: Text("Open Paper URL")
            ),
            Container(
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.auto_awesome),
                        Text("AI Summary"),
                      ],
                    ),
                    Text(widget.paper["ai_summary"]),
                   ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.paper["isRead"] = ! (widget.paper["isRead"] ?? false);
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          (widget.paper["isRead"] ?? false) ? Icons.check_circle : Icons.access_time,
                          color: (widget.paper["isRead"] ?? false) ? Colors.green : Colors.grey,
                        ),
                        const SizedBox(width: 6),
                        Text(
                            (widget.paper["isRead"] ?? false) ? "Read ✓" : "Mark as Read",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () {
                      setState(() {
                          widget.paper["isBookmarked"] = ! (widget.paper["isBookmarked"] ?? false);
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                            (widget.paper["isBookmarked"] ?? false) ? Icons.bookmark : Icons.bookmark_border,
                            color: (widget.paper["isBookmarked"] ?? false) ? Colors.purple : Colors.grey,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          (widget.paper["isBookmarked"] ?? false) ? "Saved ✓" : "Save Paper",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    const Text("ORIGINAL ABSTRACT"),
                    Text(widget.paper["abstract"]),
                  ],
                ),
              ),
          ],
        ),
      )

    );
  }
}