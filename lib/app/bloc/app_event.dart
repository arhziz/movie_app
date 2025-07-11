part of 'app_bloc.dart';

/// AppEvent class
/// This class represents the events that can occur in the app.
sealed class AppEvent {
  const AppEvent();
}

/// AppUserSubscriptionRequested event
/// This event is triggered when the user requests a subscription.
/// It is used to check if the user is authenticated or not.
final class AppUserSubscriptionRequested extends AppEvent {
  ///
  const AppUserSubscriptionRequested();
  
}

/// AppLoginSubscriptionRequested event
/// This event is triggered when the user requests a login subscription.
/// It is used to check if the user is authenticated or not.
/// This event is used to check if the user is authenticated or not.
final class AppLoginSubscriptionRequested extends AppEvent {
  ///
  const AppLoginSubscriptionRequested(); 
}

/// AppLogoutPressed event
/// This event is triggered when the user presses the logout button.
final class AppLogoutPressed extends AppEvent {
  ///
  const AppLogoutPressed();
}
