import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:one_project/components/friend_post_list_view.dart';
import '../models/models.dart';
import '../components/components.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatefulWidget {

  ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
// 1
  final mockService = MockFooderlichService();
  late ScrollController _scrollController;

  void initState(){
    super.initState();
    // Add instance in the initState()
    _scrollController = ScrollController();
    // Add scroll listener
    _scrollController.addListener(scrollListener);
  }

  // Add method listen position scroll
  void scrollListener(){
    if(_scrollController.position.atEdge){
      bool isTop = _scrollController.position.pixels == 0;
      if(isTop){
        log('i am at the top!');
      }
      else
        {
          log('i am at the bottom!');
        }
    }
  }

  @override
  void dispose(){
    _scrollController.removeListener(scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 2
    // TODO: Add TodayRecipeListView FutureBuilder
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot){
        if(snapshot.connectionState == ConnectionState.done) {
          return ListView(
            // Add the scroll controller to the ListView
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(
                recipes: snapshot.data?.todayRecipes ?? [],
              ),
              const SizedBox(height: 16,),
              //TODO: Replace this with FriendPostListView
              FriendPostListView(
                friendPosts: snapshot.data?.friendPosts ?? [],
              ),
            ],
          );
        }
        else
          {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red,),
            );
          }
      },
    );
  }
}