import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class AnimatedSeacrhBar extends StatefulWidget {
  const AnimatedSeacrhBar({super.key});

  @override
  State<AnimatedSeacrhBar> createState() => _AnimatedSeacrhBarState();
}

class _AnimatedSeacrhBarState extends State<AnimatedSeacrhBar> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    return  AnimSearchBar(
      helpText: "Search...",
      searchIconColor: Colors.black,
      width: 370,
      onSubmitted: (p0) {},
      textController: textController,
      onSuffixTap: () {
       setState(() {
      textController.clear();
        });

      },
    );
  }

}
