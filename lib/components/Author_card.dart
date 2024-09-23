import 'package:flutter/material.dart';
import 'circle_image.dart';
import '../fooderlich_theme.dart';

class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  const AuthorCard({
    super.key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  });

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleImage(
            imageProvider: widget.imageProvider,
            imageRadius: 28,
          ),
          const SizedBox(width: 8),
          Expanded(  // Sử dụng Expanded để Column chiếm hết không gian còn lại
            child: Column(
              //TODO: Add a alignment
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.authorName,
                  style: FooderlichTheme.darkTextTheme.headlineMedium,
                ),
                Text(
                  widget.title,
                  style: FooderlichTheme.darkTextTheme.headlineSmall,
                ),
              ],
            ),
          ),
          //TODO: Add IconButton
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            iconSize: 30,
            color: Colors.red[400],
            onPressed: (){
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
          )
        ],
      ),
    );
  }
}
