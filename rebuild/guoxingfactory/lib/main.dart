import 'package:flutter/material.dart';
// import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import './service/LocalStorage.dart';
import './App.dart';
import './pages/Welcome.dart';

GlobalKey<AppState> appPageKey = GlobalKey();

Future main() async {
  // 初始化必须
  WidgetsFlutterBinding.ensureInitialized();

  // 首次运行，需前往欢迎
  String? isInitLoad = await LocalStorage.getValue('isInitLoad');
  if (isInitLoad == null) {
    await LocalStorage.setValue('isInitLoad', 'true');
    runApp(const MaterialApp(home: Welcome()));
  } else {
    runApp(const MainApp());
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<StatefulWidget> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(key: appPageKey),
      // initialRoute: "/main",
      // routes: {
      //   // web 主页
      //   '/main': (context) => App(key: appPageKey),
      //   // // 服务器地址配置页
      //   // // 此页面可指定 web 主页的地址指向
      //   // '/ipconfig': (context) => const Ipconfig(),
      // },
    );
  }
}
