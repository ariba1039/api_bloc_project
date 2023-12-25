import 'package:api_bloc_project/bloc/products_bloc.dart';
import 'package:api_bloc_project/cubit/users_cubit.dart';
import 'package:api_bloc_project/debug/bloc_observer.dart';
import 'package:api_bloc_project/repo/products_repo.dart';
import 'package:api_bloc_project/repo/users_repo.dart';
import 'package:api_bloc_project/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider(
      create: (context) => ProductsRepo(),
    ),
    RepositoryProvider(
      create: (context) => UsersRepo(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(ProductsRepo()),
          // providers: [
          //   BlocProvider(
          //     create: (context) => ProductsBloc(),
          //   ),
          //  BlocProvider(
          //   create: (context) => ProductsBloc(),
          // ),

          // ],
        ),
        BlocProvider(
          create: (context) => UsersCubit(UsersRepo()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc tutorial',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
