import 'package:flutter/material.dart';
import 'package:myapp/pages/Home.dart';
import 'package:myapp/pages/Chating.dart';
class MainWidegetMaterialApp extends StatelessWidget {
  const MainWidegetMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      // 注册命名路由，构建时从路由 settings 读取传入的参数并传给 Chating
      routes: {
        '/chat': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          final String name = args is String ? args : '';
          return Chating(name: name);
        },
      },
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            '畅连(2)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu))
        ),
        body: HomeWidget(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[100],
          elevation: 0,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: '聊天'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '联系人'),
          ],
        ),
      ),
    );
  }
}
