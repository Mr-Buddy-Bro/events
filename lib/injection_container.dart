import 'package:events/features/event/data/datasources/remote_datasource.dart';
import 'package:events/features/event/data/repositories/event_repository_implementation.dart';
import 'package:events/features/event/domain/repositories/event_repository.dart';
import 'package:events/features/event/domain/usecases/event_usecases.dart';
import 'package:events/features/event/presentation/bloc/event_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> registerDependencies()async{
  sl.registerSingleton<RemoteDataSource>(RemoteDataSource());
  sl.registerSingleton<EventRepository>(EventRepositoryImplementation(remoteDataSource: sl()));
  sl.registerSingleton<EventFetchUsecase>(EventFetchUsecase(eventRepository: sl()));
  sl.registerFactory<EventBloc>(() => EventBloc(eventFetchUsecase: sl()));
}