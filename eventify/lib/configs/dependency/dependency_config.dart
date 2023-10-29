import '../../features/discover/data/repositories/event_repository_impl.dart';
import '../../features/discover/domain/repositories/event_repository.dart';
import '../../features/discover/domain/use_cases/get_events.dart';
import '../../features/discover/presentation/cubits/event_cubit.dart';
import '../../features/discover/presentation/ui/controllers/discover_controller.dart';
import '../../shared/presentation/ui/controllers/main_controller.dart';
import '../../stack/core/ioc/service_locator.dart';

abstract class DependencyConfig {
  static void register() {
    // Controllers
    _registerControllers();
    // Tasks
    _registerTasks();
    // Cubits
    _registerCubits();
    // Use Cases
    _registerUseCases();
    // Repositories
    _registerRepositories();
    // Remote Services
    _registerRemoteServices();
    // Local Storages
    _registerLocalStorages();
    // Models
    _registerModels();
    // Other
    _registerOther();
  }

  static void _registerControllers() {
    locator.registerFactory(
      () => MainController(
        locator(),
        locator(),
        locator(),
        locator(),
      ),
    );
    locator.registerFactory(
      () => DiscoverController(
        locator(),
        locator(),
        locator(),
        locator(),
      ),
    );
  }

  static void _registerTasks() {}

  static void _registerCubits() {
    locator.registerFactory(
      () => EventCubit(locator()),
    );
  }

  static void _registerUseCases() {
    locator.registerFactory(
      () => GetEvents(locator(), locator()),
    );
  }

  static void _registerRepositories() {
    locator.registerLazySingleton<EventRepository>(
      () => EventRepositoryImpl(),
    );
  }

  static void _registerRemoteServices() {}

  static void _registerLocalStorages() {}

  static void _registerModels() {}

  static void _registerOther() {}
}
