import 'package:flutter/material.dart';
import 'package:jsontolistview/detail_page.dart';
import 'package:jsontolistview/network.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("1 build");
    return Scaffold(
        appBar: AppBar(title: Text('FutureBuilder')),
        body: Container(
          child: FutureBuilder(
              future: fetchSmsService(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print("3 FutureBuilder not done");
                if (snapshot.connectionState == ConnectionState.done) {
                  print("3 FutureBuilder done");
                  if (snapshot.hasData) {
                    final sl = snapshot.data;
                    final currentSvc = sl.value.service.currentService;
                    List<String> installedServices = sl.value.installed;
                    installedServices.forEach((element) {
                      print(element);
                    });
                    print("currentService: ${sl.value.service.currentService}");
                    return ListView.builder(
                      itemCount: installedServices.length,
                      itemBuilder: (context, index) {
                        print("itemBuilder: ${installedServices[index]}");
                        return ListTile(
                          leading: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 44,
                              minHeight: 44,
                              maxWidth: 64,
                              maxHeight: 64,
                            ),
                            child: Image.asset(
                                "assets/" + installedServices[index] + ".png",
                                fit: BoxFit.cover),
                          ),
                          title: Text(
                            installedServices[index],
                            style: (currentSvc == installedServices[index])
                                ? TextStyle(
                                    fontSize: 16,
                                    color: Colors.red.withOpacity(1.0))
                                : TextStyle(
                                    color: Colors.black.withOpacity(1.0)),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                        child: Center(child: Text('Not Found Data!')));
                  } else {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
        ));
  }
}
