abstract class IVideoController {
  Future<void> init();

  Future<void> start({int? duration});

  Future<void> stop();

  Future<void> dispose();
}
