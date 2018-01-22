#!/usr/bin/env bash

set -e

SKIP_OKBUCK= ./buckw --version
./buckw targets --type android_binary android_instrumentation_apk java_test groovy_test robolectric_test kotlin_test scala_test | xargs ./buckw build -v 0
./buckw targets --type genrule | grep -v lintErrorLibrary | xargs ./buckw build -v 0