// This program is written by Akhil Benny as part of the Round 2 Selection of internship program at The Internet Folks
// This program is developed by following clean architure and bloc state management for high scalabillty and perfomance

import 'package:events/core/config/myColors.dart';
import 'package:events/features/event/presentation/bloc/event_detail_bloc/event_detail_bloc.dart';
import 'package:events/features/event/presentation/bloc/event_list_bloc/event_bloc.dart';
import 'package:events/features/event/presentation/bloc/event_search_bloc/bloc/event_search_bloc.dart';
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
        BlocProvider<EventSearchBloc>(create: (context)=> sl()..add(EventFetchSearchEvent(''))),
        BlocProvider<EventDetailBloc>(create: (context)=> sl()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: MyColors.scaffoldBg
        ),
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