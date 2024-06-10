#!/bin/bash

# Create coverage directory if it doesn't exist
mkdir -p coverage

# Run Flutter tests with coverage
flutter test --coverage

flutter test integration_test --coverage

# Remove unnecessary files and directories
lcov --remove coverage/lcov.info 'lib/*/*.g.dart' 'test/*' -o coverage/lcov.info

# Generate LCOV report from coverage files
genhtml coverage/lcov.info --output=coverage/report

# Open the coverage report in default browser (optional)
open coverage/report/index.html