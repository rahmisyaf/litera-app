
import 'package:flutter/material.dart';
import 'package:litera/widgets/topic_chip.dart';

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
              padding: const EdgeInsets.all(16.0),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Wrap(
                          // alignment: WrapAlignment.,
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: widget.topics.map((topic) => TopicChip(label: topic)).toList(),
                      )
                      
                      ),
                      // Icon(Icons.bookmark)
                      IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: isBookmarked ? const Color(0xFFFDE8F3) : Colors.transparent,
                          ),
                          onPressed: () {
                            // setState(() {
                            //   isBookmarked = !isBookmarked;
                            // });
                            widget.onBookmarkTap?.call();
                          },
                          icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
                          color: isBookmarked ? const Color(0xFFEC4899) : Colors.grey,
                        )

                    ],
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  Row(
                    spacing: 6,
                    children: [
                      Text(
                        widget.authors,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      Text(
                        widget.year,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.abstractText,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF475569),
                      height: 1.4,
                    ),
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      const Icon(
                        Icons.format_quote_outlined,
                        size: 16,
                        color: Color(0xFF64748B),
                      ),
                      Text(
                        "${widget.citations} Citations",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF64748B),
                        ),
                      )
                    ],
                  )
                ],
              ),
          );
  }
}