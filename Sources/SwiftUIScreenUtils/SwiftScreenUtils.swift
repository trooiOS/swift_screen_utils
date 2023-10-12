//  Created by Azruddin Shaikh.

import UIKit

private enum CGFloatOrDoubleOrInt {
    case cgfloat(CGFloat)
    case double(Double)
    case int(Int)
}

class SwiftUIScreenUtils {
    
    static let shared = SwiftUIScreenUtils()
    
    private var designWidth: CGFloat
    private var designHeight: CGFloat
    
    private let deviceWidth: CGFloat = UIScreen.main.bounds.size.width
    private let deviceHeight: CGFloat = UIScreen.main.bounds.size.height
    
    private init() {
        self.designWidth = deviceWidth
        self.designHeight = deviceHeight
    }
    
    func setUp(designSize size: CGSize) {
        self.designWidth = size.width
        self.designHeight = size.height
    }
    
    private func getMinScale() -> CGFloat {
        return min(getScaleWidth(), getScaleHeight())
    }
    
    private func getScaleWidth() -> CGFloat {
        return deviceWidth / designWidth
    }
    
    private func getScaleHeight() -> CGFloat {
        return deviceHeight / designHeight
    }
    
    fileprivate func setSP<T>(_ value: CGFloatOrDoubleOrInt) -> T {
        switch value {
        case .cgfloat(let this):
            return (this * getMinScale()) as! T
        case .double(let this):
            let value = CGFloat(this)
            return (value * getMinScale()) as! T
        case .int(let this):
            let value = CGFloat(this)
            return (value * getMinScale()) as! T
        }
    }
    
    fileprivate func setR<T>(_ value: CGFloatOrDoubleOrInt) -> T {
        return setSP(value)
    }
    
    fileprivate func setW<T>(_ value: CGFloatOrDoubleOrInt) -> T {
        switch value {
        case .cgfloat(let this):
            return (this * getScaleWidth()) as! T
        case .double(let this):
            let value = CGFloat(this)
            return (value * getScaleWidth()) as! T
        case .int(let this):
            let value = CGFloat(this)
            return (value * getScaleWidth()) as! T
        }
    }
    
    fileprivate func setH<T>(_ value: CGFloatOrDoubleOrInt) -> T {
        switch value {
        case .cgfloat(let this):
            return (this * getScaleHeight()) as! T
        case .double(let this):
            let value = CGFloat(this)
            return (value * getScaleHeight()) as! T
        case .int(let this):
            let value = CGFloat(this)
            return (value * getScaleHeight()) as! T
        }
    }
    
    
}

extension CGFloat {
    var sp: CGFloat {
        return SwiftUIScreenUtils.shared.setSP(.cgfloat(self))
    }
    
    var w: CGFloat {
        return SwiftUIScreenUtils.shared.setW(.cgfloat(self))
    }
    
    var h: CGFloat {
        return SwiftUIScreenUtils.shared.setH(.cgfloat(self))
    }
    
    var r: CGFloat {
        return SwiftUIScreenUtils.shared.setR(.cgfloat(self))
    }
}

extension Int {
    var sp: CGFloat {
        return SwiftUIScreenUtils.shared.setSP(.int(self))
    }
    
    var w: CGFloat {
        return SwiftUIScreenUtils.shared.setW(.int(self))
    }
    
    var h: CGFloat {
        return SwiftUIScreenUtils.shared.setH(.int(self))
    }
    
    var r: CGFloat {
        return SwiftUIScreenUtils.shared.setR(.int(self))
    }
}

extension Double {
    var sp: CGFloat {
        return SwiftUIScreenUtils.shared.setSP(.double(self))
    }
    
    var w: CGFloat {
        return SwiftUIScreenUtils.shared.setW(.double(self))
    }
    
    var h: CGFloat {
        return SwiftUIScreenUtils.shared.setH(.double(self))
    }
    
    var r: CGFloat {
        return SwiftUIScreenUtils.shared.setR(.double(self))
    }
}
