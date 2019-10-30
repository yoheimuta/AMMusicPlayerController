# AMMusicPlayerController

AMMusicPlayerController is an UI Controller with Apple Music-ish Player.

## Runtime Requirements

- iOS 10.0 or later

## Installation

### Carthage

```
github "yoheimuta/AMMusicPlayerController"
```

## Usage

For details, refer to the [Demo project](https://github.com/yoheimuta/AMMusicPlayerController/tree/master/Demo).

### Demo

```swift
import AMMusicPlayerController
import UIKit

class ViewController: UIViewController {

    let urls = [
        "https://storage.googleapis.com/maison-great-dev/oss/musicplayer/tagmp3_1473200_1.mp3",
        "https://storage.googleapis.com/maison-great-dev/oss/musicplayer/tagmp3_2160166.mp3",
        "https://storage.googleapis.com/maison-great-dev/oss/musicplayer/tagmp3_4690995.mp3",
        "https://storage.googleapis.com/maison-great-dev/oss/musicplayer/tagmp3_9179181.mp3",
    ].map { URL(string: $0)! }
    ...
    func presentModalViewController(index: Int) {
        let modal = AMMusicPlayerController.make(urls: urls,
                                                 index: index)
        modal.delegate = self
        modal.presentPlayer(src: self)
    }
}

```

## Contributing

- Fork it
- Create your feature branch: git checkout -b your-new-feature
- Commit changes: git commit -m 'Add your feature'
- Push to the branch: git push origin your-new-feature
- Submit a pull request

## License

The MIT License (MIT)
