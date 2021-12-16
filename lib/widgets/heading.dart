import 'package:contentful_rich_text/types/blocks.dart';
import 'package:contentful_rich_text/types/types.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final BLOCKS level;
  final String text;
  final List<dynamic>? content;
  final FontWeight fontWeight;
  final Next next;

  Heading({
    this.text = '',
    this.level = BLOCKS.HEADING_1,
    this.content,
    this.fontWeight = FontWeight.bold,
    required this.next,
  });

  TextStyle getTextStyle(BuildContext context, BLOCKS block) {
    switch (block) {
      case BLOCKS.HEADING_1:
        return Theme.of(context).textTheme.heading1;
      case BLOCKS.HEADING_2:
        return Theme.of(context).textTheme.heading2;
      case BLOCKS.HEADING_3:
        return Theme.of(context).textTheme.heading3;
      case BLOCKS.HEADING_4:
        return Theme.of(context).textTheme.heading4;
      case BLOCKS.HEADING_5:
        return Theme.of(context).textTheme.heading5;
      case BLOCKS.HEADING_6:
        return Theme.of(context).textTheme.heading6;
      default:
        throw Exception("Unimplemented block type");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text,
            children: next(content),
            style: getTextStyle(context, level),
          ),
        ],
      ),
      textAlign: TextAlign.start,
    );
  }
}
