import 'package:flutter/material.dart';
import 'package:menutask/models/menus.dart';
import 'package:menutask/providers/menuProvider.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  TextEditingController TitleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final menuprovider = Provider.of<Menuprovider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title:const Text('Menu add Screen', style:  TextStyle(color:Colors.white ),),
           centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: TitleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: ' Enter the Title',
                  labelText: 'Title'
                ),

              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: bodyController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: ' Enter the body',
                    labelText: 'body'
                ),
              ),
            ),
           ElevatedButton(onPressed: (){
             final menuItem = Menus(title: TitleController.text,
                 body: bodyController.text);
             menuprovider.addData(menuItem);

           },
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.blue,
               shape: const RoundedRectangleBorder(),
               minimumSize: const Size(100, 50),
             ),
               child: const Text('Add Post'),
           )


          ],
        ),
      ),
    );
  }
}
