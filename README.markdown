# 試用 VMFive

（此為實驗性專案）

## Install

1. via CocoaPods

``` 
pod 'VMFiveAdNetwork', '~> 2.1.12'
```

2. Add `#import <VMFiveAdNetwork/VMFiveAdNetwork.h>` to bridging header

## Custom Cell

- must conforms `VANativeAdViewRenderProtocol` to provide custom view's items.

## Cell Provider in View Controller

using

```
VAAdCellProvider
```
