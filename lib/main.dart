import 'dart:async';

import 'package:flutter_project/src/core/utils/refined_logger.dart';
import 'package:flutter_project/src/feature/app/logic/app_runner.dart';

void main() {
  runZonedGuarded(
    () => const AppRunner().initializeAndRun(),
    logger.logZoneError,
  );
}
