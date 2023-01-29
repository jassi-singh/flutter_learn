import 'package:flutter/material.dart';

class LearnImage extends StatelessWidget {
  const LearnImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        width: 300,
        child: Ink.image(
          image: Image.network("https://picsum.photos/300?image=9").image,
          child: InkWell(
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
