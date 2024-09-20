import 'package:flutter/material.dart';
import 'grocery_item_screen.dart';
import '../models/models.dart';
import '../components/grocery_tile.dart';

class GroceryListScreen extends StatelessWidget{
  final GroceryManager manager;
  const GroceryListScreen({
    super.key,
    required this.manager,
  });

  @override
  Widget build(BuildContext context){
    //TODO: Replace with ListView
    // return Container(
    //   color: Colors.green,
    // );
    final groceryItems = manager.groceryItems;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: groceryItems.length,
        itemBuilder: (context, index){
          final item = groceryItems[index];
          //TODO: Wrap in a Dismissable
          //TODO: Wrap in a InkWell
          return Dismissible(
              key: Key(item.id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: Icon(
                    Icons.delete_forever,
                  color: Colors.white,
                  size: 50.0,
                ),

              ),
              onDismissed: (direction){
                manager.deleteItem(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.name} dimissed!')),
                );
              },
              child: InkWell(
                child: GroceryTile(
                  key: Key(item.id),
                  item: item,
                  onComplete: (change){
                    if(change != null){
                      manager.completeItem(index, change);
                    }
                  },
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GroceryItemScreen(
                            originalItem: item,
                              onUpdate: (item){
                                manager.updateItem(item, index);
                                Navigator.pop(context);
                              },
                            onCreate: (item){

                            },
                          )
                      )
                  );
                },
              )
          );
          // return InkWell(
          //   child: GroceryTile(
          //     key: Key(item.id),
          //     item: item,
          //     onComplete: (change){
          //       if(change != null){
          //         manager.completeItem(index, change);
          //       }
          //     },
          //   ),
          //   onTap: (){
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => GroceryItemScreen(
          //               originalItem: item,
          //                 onUpdate: (item){
          //                   manager.updateItem(item, index);
          //                   Navigator.pop(context);
          //                 },
          //                 onCreate: (item){
          //
          //                 },
          //             )
          //         )
          //     );
          //   },
          // );
          // return GroceryTile(
          //   key: Key(item.id),
          //   item: item,
          //   onComplete: (change){
          //     if(change!= null){
          //       manager.completeItem(index, change);
          //     }
          //   },
          // );
        },
        separatorBuilder: (context, index){
          return const SizedBox(height: 16.0,);
        },
      ),
    );
  }
}