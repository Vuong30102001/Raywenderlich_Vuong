import 'package:flutter/material.dart';
import 'package:one_project/components/circle_image.dart';
import '../components/components.dart';
import '../models/models.dart';

class FriendPostTitle extends StatelessWidget{
  final Post post;
  const FriendPostTitle({
    super.key,
    required this.post,
  });
  @override
  Widget build(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleImage(
          imageProvider: AssetImage(post.profileImageUrl),
          imageRadius: 20,
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.comment),
              Text(
                '${post.timestamp} min ago',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        )
      ],
    );
  }
}