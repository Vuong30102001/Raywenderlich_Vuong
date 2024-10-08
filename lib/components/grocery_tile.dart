import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/grocery_item.dart';

class GroceryTile extends StatelessWidget{
  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;
  GroceryTile({
    super.key,
    required this.item,
    this.onComplete,
  }) : textDecoration = item.isComplete ? TextDecoration.lineThrough : TextDecoration.none;

  @override
  Widget build(BuildContext context){
    return Container(
      height: 100.0,
      //TODO: Replace this color
      // return color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //TODO: Add Row to group (name, date, importance)
          Row(
            children: [
              Container(width: 5.0, color: item.color,),
              const SizedBox(width: 16.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: GoogleFonts.lato(
                      decoration: textDecoration,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0,),
                  buildDate(),
                  const SizedBox(height: 4.0),
                  buildImportance(),
                ],
              )
            ],
          ),
          //TODO: Add Row to group (quantity, checkbox)
          Row(
            children: [
              Text(
                item.quantity.toString(),
                style: GoogleFonts.lato(
                  decoration: textDecoration,
                  fontSize: 21.0,
                ),
              ),
              buildCheckbox(),
            ],
          )
        ],
      ),
    );
  }

  //TODO: Add buildImportance()
  Widget buildImportance(){
    if(item.importance == Importance.low){
      return Text(
        'low',
        style: GoogleFonts.lato(decoration: textDecoration),
      );
    }
    else if(item.importance == Importance.medium){
      return Text(
        'medium',
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w700,
            decoration: textDecoration,
        ),
      );
    }
    else if(item.importance == Importance.high){
      return Text(
        'high',
        style: GoogleFonts.lato(
          color: Colors.red,
          fontWeight: FontWeight.w800,
          decoration: textDecoration,
        ),
      );
    }
    else{
      throw Exception('This importance type does not exits');
    }
  }
  //TODO: Add buildDate()
  Widget buildDate(){
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString  = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }
  //TODO: Add buildCheckbox()
  Widget buildCheckbox(){
    return Checkbox(
        value: item.isComplete,
        onChanged: onComplete,
    );
  }
}