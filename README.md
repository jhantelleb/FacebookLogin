# Facebook Authentication

## Set Up
Follow the steps on how to integrate the Facebook SDK thru the link below. I used Cocoapods to install the SDK in my app.

For this exercise we will only use these APIs.
* Facebook Login - use Facebook profile for user authentication
* Facebook Core - to get the details for the user profile i.e. First Name, Last Name, Email and Profile Image via the Graph API

### Facebook Login
#### Important Notes
Add the following in the App Delegate to allow Facebook's delegate to launch your app after signing in.
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {        
  SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
  return true
}
    
func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
  let handled = SDKApplicationDelegate.shared.application(app, open: url, options: options)
  return handled
}
```
### Graph API
We'll display the First Name, Last Name, Profile Picture and Email Address of person using the app in a Table View Controller. To get these details, we use the Facebook Graph API. We can access Facebook Graph through the FB Core Kit.

## Requirements
* Runs on iOS 9+

## Built With
* [Facebook SDK for Swift] (https://developers.facebook.com/docs/swift) Facebook SD for Swift
* [SDWebImage] (https://github.com/rs/SDWebImage) - Asynchronous Image Download

## Testing
* UI Testing done in iPhone5s, iPhone7, and iPhone7s

### Architecture
* MVC

## Author
Jhantelle Belleza - [JhantelleB](https://github.com/jhantelleb)
