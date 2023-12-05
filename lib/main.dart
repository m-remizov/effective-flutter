import 'package:effective_lab/page/profile.dart';
import 'package:effective_lab/widgets/custom_chip.dart';
import 'package:effective_lab/widgets/header.dart';
import 'package:effective_lab/widgets/menu_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [],
      supportedLocales: [Locale("en")],
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color(0xff22215b),
            ),
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          outline: Color.fromRGBO(6, 132, 65, 1),
          onPrimary: const Color(0x00000000),
          seedColor: Colors.deepPurple,
          onBackground: const Color(0x00000000),
          primary: Color.fromRGBO(0, 0, 0, 1),
          secondary: const Color.fromRGBO(0, 0, 0, 0.55),
          secondaryContainer: const Color.fromRGBO(0, 0, 0, 0.08),
          background: const Color(0xfffffffff),
          onSurface: const Color(0xFFFA8ADB7),
          tertiary: const Color(0xFFFF4D144),
          onSecondaryContainer: const Color(0xFFF41A0E7),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: NestedScrollView(
            body: TabBarView(children: [Profile(), SizedBox()]),
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                elevation: 5,
                shadowColor: Colors.black,
                surfaceTintColor: Colors.white,
                toolbarHeight: 240,
                centerTitle: true,
                title: Column(
                  children: [
                    Header(
                      imageUrl: "assets/images/ekat_photo.png",
                      name: "Екатерина",
                    )
                  ],
                ),
                pinned: true,
                floating: true,
                snap: false,
                bottom: TabBar(
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 4.0,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary),
                    unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.secondary),
                    tabs: [
                      Tab(
                        height: 56,
                        child: Text("Профиль"),
                      ),
                      Tab(
                        height: 56,
                        text: "Настройки",
                      )
                    ]),
              )
            ],
          ),
        ));
  }
}
