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
### **Define initial route:** <br>
Defining `isInitial` as `true`, makes route initial.
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

If you don'd define the `isInitial:true` for the route and will not have the'/' route or you will define `isInitial:true` for multiple routes it will throw the runtime exception.


---
### **Screen as modal window.**
It is possible to define the route as modal bottom sheet window directly from the `@KissRoute` annotation by passing the `modalConfig` argument to the `@KissRoute`. 

`modalConfig` is by default null and until it is null route will behave as 
normal route, But as soon as you pass modalConfig argument a value it will become the modal.
```dart
@KissRoute(
    '/',
     modalConfig: ModalConfig(),
)
class ProfileScreen() {
    Widget build(BuildContext context) {

    }
}
```
---
### **`ModalConfig`**
You can modify modal windows configuration in many ways, some of the arguments that you can pass are:
```dart
ModalConfig(
    modalExpanded:true, //bool
    modalEnableDrag:true, //bool
    modalType: true, //ModalType
)
```

`modalExtended`: makes modal to stretch fully on the screen. fir IOS it still has some space between modal and the edge of the screen.

`modalEnableDrag`: make modal draggable up and down for closing purposes.

`modalType`: by default `kiss_router` differentiates platforms and creates android and IOS modal bottom sheets respectievely, but in case you want to have one of which strictly defined you can use `modalType` with values `ModalType.cupertino` or `ModalType.android`


---
## Nested routing
To achieve nested routing, you need to define the child routes.

//TODO: think better way <br><br>
*/screens/profile.dart*
```dart
@KissRoute(
    '/',
    children: [
        '/change_password',
        '/change_email'
    ]
)
class ProfileScreen() {
    Widget build(BuildContext context) {

    }
}
```
<br>

*/screens/change_password.dart*
```dart
@KissRoute(
    '/change_password',
)
class ChangePasswordScreen() {
    Widget build(BuildContext context) {

    }
}
```
<br>

*/screens/change_email.dart*
```dart
@KissRoute(
    '/change_email',
)
class ChangeEmailScreen() {
    Widget build(BuildContext context) {

    }
}
```