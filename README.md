New Router for Flutter.

Keep same old `Navigator.of(context)` but do much more.

# Simplest usages:
This generates route name depending on the camel case. <br>
i.e: ProfileScreen() -> /profile_screen 
```dart

@KissRoute()
class ProfileScreen() {
    Widget build(BuildContext context) {

    }
}
```

 ---

Defining the route name:<br>
add the route name(`String`) as a first argument to `@KissRoute`
```dart

@KissRoute('/profile')
class ProfileScreen() {
    Widget build(BuildContext context) {

    }
}
```

 