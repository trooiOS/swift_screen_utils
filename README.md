# ScreenUtilsSwiftUI

This package helps developer to manage resizable UI in SwiftUI project with different iOS devices like iPhone or iPad.

Just need to set design screen size (XD/FIGMA/ANY-OTHER) at app initialization.

### Required

```swift

func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
    
    // set up to add design size
    ScreenUtilsSwiftUI.shared.setUp(designSize: CGSize(width: 428, height: 926))
    
    return true
}

```


| Command | Description |
| --- | --- |
| `.w` | Resize the width as per the decive and design scale |
| `.h` | Resize the height as per the decive and design scale |
| `.sp` | Resize the font size as per the decive and design scale |
| `.sp` | Resize the radius as per the decive and design scale |


### Swift Package Manager

Added ScreenUtilsSwiftUI in Package Dependencies
```
https://github.com/trooiOS/swift_screen_utils
```


### Example

```swift

Image("Acatar")
    .frame(width: 100.w, height: 100.h)
    .overlay{
        RoundedRectangle(cornerRadius: 16.r)
    }

Text("Hello World")
    .font(.system(size: 24.sp))

```

#### Created by Azruddin Shaikh :sunglasses:
