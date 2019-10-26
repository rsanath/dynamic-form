assertEquals<T>({T actual, T expected, String testName = ""}) {
  if (actual == expected) {
    print("✅  $testName");
  } else {
    print("❌  $testName");
  }
}

assertListEquals<T>(List<T> actual, List<T> expected, {String testName = ""}) {
  if (actual.length != expected.length) {
    print("❌  $testName");
    return;
  }
  for (var i = 0; i < actual.length; i++) {
    if (actual[i] != expected[i]) {
      print(actual[i]);
      print(expected[i]);
      print("❌  $testName");
      return;
    }
  }
  print("✅  $testName");
}

printTestName(String name) {
  print("========== $name ==========");
}