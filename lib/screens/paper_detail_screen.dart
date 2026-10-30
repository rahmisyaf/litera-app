import 'package:flutter/material.dart';
import 'package:litera/widgets/topic_chip.dart';

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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,   
          spacing: 16,       
          children: [
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: (widget.paper["topics"] as List).map((topic) => 
                TopicChip(label: topic.toString()),
              ).toList(),
            ),
            Text(
              widget.paper["title"],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0F172A),
              ),
            ),
            Row(
              spacing: 6,
              children: [
                Text(
                  widget.paper["authors"],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                  ),
                ),
                Text(
                  widget.paper["year"],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
            Row(
              spacing: 4,
              children: [
                const Icon(
                  Icons.format_quote_outlined,
                  size: 18,
                  color: Color(0xFF64748B),
                ),
                Text(
                  "${widget.paper["citations"]} Citations",
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      print("link is clicked");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D4ED8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Open Original Paper",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      print("link is clicked");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Open Paper URL",
                        style: TextStyle(
                          color: Color(0xFF1E293B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFBFDBFE)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Row(
                    spacing: 8,
                    children: const [
                      Icon(
                        Icons.auto_awesome,
                        color: Color(0xFF1D4ED8),
                        size: 18,
                      ),
                      Text(
                        "AI Summary",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1D4ED8),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.paper["ai_summary"],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1E3A8A),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  const Text(
                    "ORIGINAL ABSTRACT",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  Text(
                    widget.paper["abstract"],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF334155),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        child: Row(
          spacing: 12,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.paper["isRead"] = ! (widget.paper["isRead"] ?? false);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: (widget.paper["isRead"] ?? false)
                        ? const Color(0xFFDCFCE7)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: (widget.paper["isRead"] ?? false)
                          ? const Color(0xFF86EFAC)
                          : const Color(0xFFE2E8F0),
                    ),
                  ),
                  child: Row(
                    spacing: 6,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        (widget.paper["isRead"] ?? false) ? Icons.check_circle : Icons.access_time,
                        color: (widget.paper["isRead"] ?? false) ? Colors.green : Colors.grey,
                        size: 18,
                      ),
                      Text(
                        (widget.paper["isRead"] ?? false) ? "Read ✓" : "Mark as Read",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: (widget.paper["isRead"] ?? false) ? Colors.green : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.paper["isBookmarked"] = ! (widget.paper["isBookmarked"] ?? false);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: (widget.paper["isBookmarked"] ?? false)
                        ? const Color(0xFFFDE8F3)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: (widget.paper["isBookmarked"] ?? false)
                          ? const Color(0xFFF9A8D4)
                          : const Color(0xFFE2E8F0),
                    ),
                  ),
                  child: Row(
                    spacing: 6,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        (widget.paper["isBookmarked"] ?? false) ? Icons.bookmark : Icons.bookmark_border,
                        color: (widget.paper["isBookmarked"] ?? false) ? const Color(0xFFEC4899) : Colors.grey,
                        size: 18,
                      ),
                      Text(
                        (widget.paper["isBookmarked"] ?? false) ? "Saved ✓" : "Save Paper",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: (widget.paper["isBookmarked"] ?? false) ? const Color(0xFFEC4899) : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}