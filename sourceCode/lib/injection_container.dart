import 'package:events/features/event/data/datasources/remote_datasource.dart';
import 'package:events/features/event/data/repositories/event_repository_implementation.dart';
import 'package:events/features/event/domain/repositories/event_repository.dart';
import 'package:events/features/event/domain/usecases/event_detail_usecase.dart';
import 'package:events/features/event/domain/usecases/event_search_usecase..dart';
import 'package:events/features/event/domain/usecases/event_usecases.dart';
import 'package:events/features/event/presentation/bloc/event_detail_bloc/event_detail_bloc.dart';
import 'package:events/features/event/presentation/bloc/event_list_bloc/event_bloc.dart';
import 'package:events/features/event/presentation/bloc/event_search_bloc/bloc/event_search_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> registerDependencies()async{
  sl.registerSingleton<RemoteDataSource>(RemoteDataSource());
  sl.registerSingleton<EventRepository>(EventRepositoryImplementation(remoteDataSource: sl()));
  sl.registerSingleton<EventFetchUsecase>(EventFetchUsecase(eventRepository: sl()));
  sl.registerSingleton<EventSearchUsecase>(EventSearchUsecase(eventRepository: sl()));
  sl.registerSingleton<EventDetailUseCase>(EventDetailUseCase(eventRepository: sl()));
  sl.registerFactory<EventBloc>(() => EventBloc(eventFetchUsecase: sl()));
  sl.registerFactory<EventSearchBloc>(() => EventSearchBloc(eventSearchUsecase: sl()));
  sl.registerFactory<EventDetailBloc>(() => EventDetailBloc(eventDetailUseCase: sl()));
}