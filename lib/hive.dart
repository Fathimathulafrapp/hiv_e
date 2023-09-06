import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('shopping box');
  runApp( hive(),);

}
class hive extends StatefulWidget{
  @override
  State<hive> createState() => _hiveState();
}

class _hiveState extends State<hive> {
  List<Map<String,dynamic>>items=[];
  final shoppingbox= Hive.box("shopping box");
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('hive_demo'),),
    body: items.isEmpty
      ? const Center(
      child: Text('No data',style: TextStyle(fontSize: 30),
      ),



    )
        : ListView.builder(itemCount: items.length,
        itemBuilder: (context,index){
          final currentitem =items[index];
          return Card(
            color: Colors.blue,
            child: ListTile(
              title: Text(items[index]['name']),
              subtitle: Text(items[index]['quantity'].toString()),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_calendar_outlined)),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.delete))
                  ],
                ),
              ),
            ),
          );
    }),
    floatingActionButton: FloatingActionButton(onPressed: (){},
      child: const Icon(Icons.add),

    ),



  );
  }
}