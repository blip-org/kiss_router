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

# More Control
Define initial route: <br>
Defining isInitial as true, makes route initial.
If you don't define it kiss_router will search for '/' route

and will make it initial.
```dart
@KissRoute('/profile', isInitial: true)
class ProfileScreen() {
    Widget build(BuildContext context) {

    }
}
```

```dart
// this is also the initial route
@KissRoute('/')
class ProfileScreen() {
    Widget build(BuildContext context) {

    }
}
```

