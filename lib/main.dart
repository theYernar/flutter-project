import 'dart:async';

import 'package:project/src/core/utils/refined_logger.dart';
import 'package:project/src/feature/app/logic/app_runner.dart';

void main() {
  runZonedGuarded(
    () => const AppRunner().initializeAndRun(),
    logger.logZoneError,
  );
}
