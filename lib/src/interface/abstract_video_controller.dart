abstract class IVideoController {
  Future<void> init();

  void start({int? duration});

  Future<void> stop();

  Future<void> dispose();
}
