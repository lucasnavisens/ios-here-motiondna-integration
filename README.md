
This is an example of Navisens' SDK integration with Here's SDK.

Get a key from Here's [website](https://developer.here.com/develop/mobile-sdks?create=Freemium-Basic&keepState=true&step=terms).
Then fill in the `YOUR_APP_ID` and `YOUR_APP_CODE` with the given tokens.

Then retrieve a Navisens SDK key [here](https://navisens.com/).  
And add it to the `runMotionDna` method in the `ViewController.swift` file.

When you are done with all your key retrievals, run:
```
pod install // Will install MotionDna SDK and MapBox SDK
open  ios-here-helloworld.xcworkspace // Will launch xcode
```

After completing these steps should be seeing the Navisens position on the Here canvas.

Have fun!



