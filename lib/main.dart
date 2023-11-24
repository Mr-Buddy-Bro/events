import 'package:events/features/event/presentation/bloc/event_bloc.dart';
import 'package:events/features/event/presentation/pages/event_detailed.dart';
import 'package:events/features/event/presentation/pages/event_list.dart';
import 'package:events/features/event/presentation/pages/event_search.dart';
import 'package:events/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async{
  await registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EventBloc>(create: (context)=> sl()..add(EventFetchEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const EventList(),
          '/event_detailed': (context)=> const EventDetailed(),
          '/event_search': (context)=> const EventSearch(),
        },
      ),
    );
  }
}