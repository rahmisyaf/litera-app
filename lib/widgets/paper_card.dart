import 'package:flutter/material.dart';

class PaperCard extends StatefulWidget {
  const PaperCard({super.key});

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
                      Text("Artificial Intelligence"),
                      Text("Education"),
                      // Icon(Icons.bookmark)
                      const Spacer(), //to create adjustable space between first element and second element
                      IconButton(
                        onPressed: (){
                          setState(() {
                            // isBookmarked = !isBookmarked;
                          });
                        }, 
                        icon: Icon(Icons.bookmark)
                      )
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
          );
  }
}