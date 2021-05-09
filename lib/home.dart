import 'package:final_task_app/todo%20list/Drawer.dart';
import 'package:final_task_app/todo%20list/list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int navBarIndex = 0;
  bool checkBoxValue=false;
  addNews(String input) {
    News.homeNews.add(input);
    print(News.homeNews);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyWidgets = [
      Center(
        child: ListView.builder(
            itemCount: News.homeNews.length,
            itemBuilder: (context, i) => NewsContainer(
              index: i,
            )),
      ),
      Center(
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            hintText: 'Add list',
          ),
          onSubmitted: (input) => addNews(input),
        ),
      ),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: bodyWidgets[navBarIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          iconSize: 30.0,
          onTap: (index) {
            setState(() {
              navBarIndex = index;
            });
          },
          selectedItemColor: Colors.blueAccent,
          currentIndex: navBarIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.featured_play_list_rounded),
              label: 'My ToDo List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add to list',
            ),
          ],
        ),
        drawer: drawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          //leading: Icon(Icons.description),
          title: Text(" "),
          iconTheme: IconThemeData(color: Colors.blueGrey),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.blueGrey,
              ),
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.blueGrey,
              ),
              onPressed: () {
                // do something
              },
            ),
          ],
        ),
      ),
    );
  }
}



class NewsContainer extends StatelessWidget {
  final int index;

  NewsContainer({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      margin: EdgeInsets.all(3.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey, spreadRadius: 1),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: true,
            onChanged: (bool value){
            },
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                News.homeNews[index],
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
