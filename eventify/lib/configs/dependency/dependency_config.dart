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
  }

  static void _registerTasks() {}

  static void _registerCubits() {}

  static void _registerUseCases() {}

  static void _registerRepositories() {}

  static void _registerRemoteServices() {}

  static void _registerLocalStorages() {}

  static void _registerModels() {}

  static void _registerOther() {}
}
