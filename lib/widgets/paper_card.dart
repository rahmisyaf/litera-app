import 'package:flutter/material.dart';

class PaperCard extends StatefulWidget {
  final String title;
  final String authors;
  final String year;
  final String abstractText;
  final String citations;
  final List<String> topics;

  const PaperCard({
    super.key,
    required this.title,
    required this.authors,
    required this.year,
    required this.abstractText,
    required this.citations,
    this.topics = const [],
    });

  @override 
  State<PaperCard> createState() => _PaperCardState();
}

class _PaperCardState extends State<PaperCard> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
                      ...widget.topics.map((topic) => Text(topic)),
                      // Icon(Icons.bookmark)
                      const Spacer(), //to create adjustable space between first element and second element
                      IconButton(
                        onPressed: (){
                          setState(() {
                            isBookmarked = !isBookmarked;
                          });
                        }, 
                        icon: Icon(Icons.bookmark)
                      )
                    ],
                  ),
                  Text(widget.title),
                  Row(children: [
                      Text(widget.authors),
                      Text(widget.year),
                    ],
                  ),
                  Text(
                    widget.abstractText,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis),
                  Row(
                    children: [
                      Icon(Icons.format_quote_outlined),
                      Text("${widget.citations} Citations")
                    ],
                  )
                ],
              ),
          );
  }
}