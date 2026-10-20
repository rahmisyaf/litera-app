
import 'package:flutter/material.dart';

class PaperCard extends StatefulWidget {
  final String title;
  final String authors;
  final String year;
  final String abstractText;
  final String citations;
  final List<String> topics;
  final bool isBookmarked;
  final VoidCallback? onBookmarkTap;
  final bool isRead;

  const PaperCard({
    super.key,
    required this.title,
    required this.authors,
    required this.year,
    required this.abstractText,
    required this.citations,
    this.topics = const [],
    this.isBookmarked = false,
    this.isRead = false,
    this.onBookmarkTap
    });

  @override 
  State<PaperCard> createState() => _PaperCardState();
}

class _PaperCardState extends State<PaperCard> {
  late bool isBookmarked;
  late bool isRead;

  @override  
  void initState(){
    super.initState();
    isBookmarked = widget.isBookmarked;
    isRead = widget.isRead;
  }

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
                          widget.onBookmarkTap?.call();
                        }, 
                        icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border,),
                        color: isBookmarked ? const Color(0xFF9333EA) : Colors.grey,
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