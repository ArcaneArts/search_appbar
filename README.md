## Usage

```dart
import 'package:search_app_bar/search_app_bar.dart';

SearchAppBar(
    query: (query) => _searchSubject.add(query),
    typeName: "Projects",
    title: const Text("Projects"),
    actions: const [
        AnotherAction(),
    ],
)
```