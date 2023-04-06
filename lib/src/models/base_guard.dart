/// Base class for defining guards of the route.
///
/// If the concrete implementation of the [BaseGuard]'s [call()] method
/// returns true, it means that guard rules has been passed and
/// the route that integrates this same guard, will be allowed
/// to be navigated,
abstract class BaseGuard {
  bool call();
}
