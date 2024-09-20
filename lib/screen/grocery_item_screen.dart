import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';
import '../components/grocery_tile.dart';


class GroceryItemScreen extends StatefulWidget{
  // onCreate: callback when a new item is created
  final Function(GroceryItem) onCreate;
  // onUpdate: callback return the updated grocery item
  final Function(GroceryItem) onUpdate;
  // originalItem: the grocery item that the user clicked
  final GroceryItem? originalItem;
  // isUpdating: determine whether the user creating or editing an item
  final bool isUpdating;

  const GroceryItemScreen({
    super.key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  }) : isUpdating = (originalItem != null);

  @override
  GroceryItemScreenState createState() => GroceryItemScreenState();
}

class GroceryItemScreenState extends State<GroceryItemScreen>{
  // TODO: Add grocery item screen state properties
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  //TODO: Add initState()
  @override
  void initState(){
    super.initState();
    final originalItem = widget.originalItem;
    if(originalItem != null){
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _currentColor = originalItem.color;
      _importance = originalItem.importance;
      final date = originalItem.date;
      _dueDate = date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
    }

    _nameController.addListener((){
      setState(() {
       _name = _nameController.text;
      });
    });
  }
  //TODO: Add dispose()
  @override
  void dispose(){
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    //TODO: Add GroceryItemScreen Scaffold
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                //TODO: Add callback handler
                final groceryItem = GroceryItem(
                    id: widget.originalItem?.id ?? const Uuid().v1(),
                    name: _nameController.text,
                    importance: _importance,
                    color: _currentColor,
                    quantity: _currentSliderValue,
                    date: DateTime(
                      _dueDate.year,
                      _dueDate.month,
                      _dueDate.day,
                      _timeOfDay.hour,
                      _timeOfDay.minute,
                    )
                );
                if(widget.isUpdating){
                  widget.onUpdate(groceryItem);
                }
                else
                  {
                    widget.onCreate(groceryItem);
                  }
              },
              icon: const Icon(Icons.check),
          ),
        ],
        elevation: 0.0,
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // TODO: Add name TextFiled
            buildNameField(),
            //TODO: Add Importance selection
            buildImportanceField(),
            //TODO: Add date picker
            buildDateField(),
            //TODO: Add time picker
            buildTimeField(),
            //TODO: Add color picker
            const SizedBox(height: 10.0,),
            buildColorPicker(),
            //TODO: Add slider
            const SizedBox(height: 10.0,),
            buildQuantityField(),
            //TODO: Add Grocery title
            GroceryTile(
                item: GroceryItem(
                    id: 'previewMode',
                    name: _name,
                    importance: _importance,
                    color: _currentColor,
                    quantity: _currentSliderValue,
                    date: DateTime(
                      _dueDate.year,
                      _dueDate.month,
                      _dueDate.day,
                      _timeOfDay.hour,
                      _timeOfDay.minute,
                    )
                )
            )
          ],
        ),
      ),
    );
  }

  // TODO: Add buildNameField()
Widget buildNameField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item Name',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
            hintText: 'E.g. Apple, Banana, 1 Bag of salt',
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            )
          ),
        )
      ],
    );
}

  // TODO: Add buildImportanceField()
Widget buildImportanceField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Importamce Item',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        Wrap(
          spacing: 10.0,
          children: [
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.low,
              label: const Text(
                'low',
                style: TextStyle(color: Colors.green),
              ),
              onSelected: (selected){
                setState(() => _importance = Importance.low);
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.medium,
              label: Text(
                'medium',
                style: TextStyle(color: Colors.green),
              ),
              onSelected: (selected){
                setState(() {
                  _importance = Importance.medium;
                });
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.high,
              label: Text(
                'high',
                style: TextStyle(color: Colors.green),
              ),
              onSelected: (selected){
                setState(() {
                  _importance = Importance.high;
                });
              },
            )
          ],
        )
      ],
    );
}
  // TODO: Add buildDateField()
Widget buildDateField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                    context: context,
                    firstDate: currentDate,
                    lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if(selectedDate != null){
                    _dueDate = selectedDate;
                  }
                });
              },
            )
          ],
        ),
        Text(DateFormat('yyyy-MM-dd').format(_dueDate)),
      ],
    );
}
  // TODO: Add buildTimeField()
Widget buildTimeField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time of day',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                );
                setState(() {
                  if(timeOfDay != null){
                    _timeOfDay = timeOfDay;
                  }
                });
              },
            )
          ],
        ),
        Text(_timeOfDay.format(context)),
      ],
    );
}
  //TODO: Add buildColorPicker()
Widget buildColorPicker(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 10,
              color: _currentColor,
            ),
            const SizedBox(width: 10,),
            Text(
              'Color',
              style: GoogleFonts.lato(fontSize: 28.0),
            )
          ],
        ),
        TextButton(
          child: const Text('Select'),
          onPressed: (){
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    content: BlockPicker(
                        pickerColor: Colors.white,
                        onColorChanged: (color){
                          setState(() {
                            _currentColor = color;
                          });
                        },
                    ),
                    actions: [
                      TextButton(
                        child: const Text('Save'),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                }
            );
          },
        )
      ],
    );
}
  //TODO: Add buildQuantityField()
Widget buildQuantityField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            Text(
                _currentSliderValue.toInt().toString(),
              style: TextStyle(fontSize: 25.0),
            ),
          ],
        ),
        Slider(
          inactiveColor: _currentColor.withOpacity(0.5),
            activeColor: _currentColor,
            value: _currentSliderValue.toDouble(),
            min: 0.0,
            max: 100.0,
            divisions: 100,
            label: _currentSliderValue.toInt().toString(),
            onChanged: (double value){
              setState(() {
                _currentSliderValue = value.toInt();
              });
            }
        ),
      ],
    );
}
}