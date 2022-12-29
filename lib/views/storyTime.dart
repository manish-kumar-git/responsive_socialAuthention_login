import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryPoint extends StatefulWidget {
  const StoryPoint({super.key});

  @override
  State<StoryPoint> createState() => _StoryPointState();
}

class _StoryPointState extends State<StoryPoint> {
  final controller = StoryController();
  @override
  Widget build(BuildContext context) {
    return Material(
        child: StoryView(
      controller: controller,
      storyItems: [
        StoryItem.text(
            title: "Nice!\n\nTap to continue.",
            backgroundColor: Colors.red.shade300,
            textStyle: const TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
        StoryItem.text(title: 'Hello World',textStyle: const TextStyle(fontSize: 40), backgroundColor: Colors.blueGrey),
       StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side",
            controller: controller,
          ),
        StoryItem.pageImage(
            url:
                'https://images.unsplash.com/photo-1580820267682-426da823b514?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydHJhaXQlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
            controller: controller,caption: 'this is caption')
      ],
      inline: false,
      repeat: false,
      onComplete: () => Navigator.pop(context),
      onVerticalSwipeComplete: (p0) => Navigator.pop(context),
    ));
  }
}
