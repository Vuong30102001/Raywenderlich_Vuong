import 'package:flutter/material.dart';
import '../models/models.dart'; // Đảm bảo bạn import đúng file chứa lớp Post
import '../components/friend_post_title.dart'; // Import widget FriendPostTitle

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;

  const FriendPostListView({
    super.key,
    required this.friendPosts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Chefs',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16,),
          ListView.separated(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: friendPosts.length,
            itemBuilder: (context, index) {
              final post = friendPosts[index];
              return FriendPostTitle(post: post); // Sử dụng FriendPostTitle để hiển thị thông tin của bài viết
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16,);
            },
          ),
        ],
      ),
    );
  }
}
