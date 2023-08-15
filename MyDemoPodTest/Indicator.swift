

import UIKit

//This indicator class is being used for show indicator while hitting API.
final class Indicator {
    static let shared = Indicator()
    
    private var blurImg = UIImageView()
    var indicator = UIActivityIndicatorView()
    private init() {
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = .clear
        blurImg.isUserInteractionEnabled = true
        indicator.style = .whiteLarge
        indicator.center = blurImg.center
        indicator.startAnimating()
        indicator.color = .white
    }
    
    func show(withBackground value: Bool = false) {
        DispatchQueue.main.async() { [unowned self] in
            self.blurImg.backgroundColor = value ? .white : .clear
            UIApplication.shared.keyWindow?.addSubview(self.blurImg)
            UIApplication.shared.keyWindow?.addSubview(self.indicator)
        }
    }
    
    func hide(){
        DispatchQueue.main.async() { [weak self] in
            self?.blurImg.removeFromSuperview()
            self?.indicator.removeFromSuperview()
        }
    }
}

