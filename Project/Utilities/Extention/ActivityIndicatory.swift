//
//  ActivityIndicatory.swift
//  Project
//
//  Created by Ahmed Elmemy on 10/07/2022.
//

import UIKit
import SwiftEntryKit
import Localize_Swift
@available(iOS 13.0, *)
extension UIView{
    
    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor) {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        
        self.addSubview(backgroundView)
    }
    
    func activityStopAnimating() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
}

extension UIViewController {
    func startAnimating  () {
        view.activityStartAnimating(activityColor: .appColor(.MainColor)!, backgroundColor: UIColor.black.withAlphaComponent(0.5))
    }
    
    func stopAnimating() {
        view.activityStopAnimating()
    }
    
}


class FloatingAlert  {
    
    static func displayError (description : String) {
        
        let image = EKProperty.ImageContent(image: #imageLiteral(resourceName: "logo"), size: CGSize(width: 32, height: 32))
        
        
        
        displayNotficationAlert(_title: "", _description: description , image: image, shadowColor: .appColor(.MainFontColor)!)
    }
    
    
    static func displaySuccess (description : String) {
        
        let image = EKProperty.ImageContent(image: #imageLiteral(resourceName: "logo"), size: CGSize(width: 32, height: 32))
        
        
        
        displayNotficationAlert(_title: "", _description: description , image: image, shadowColor: .green)
        
    }
    
    static func displayNotification (description : String) {
        let image = EKProperty.ImageContent(image: #imageLiteral(resourceName: "logo"), size: CGSize(width: 32, height: 32))
        displayNotficationAlert(_title: "Notification".localized(), _description: description , image: image, shadowColor: .green , color: .color(color: .init(.green)) )
    }
    
    private static func displayNotficationAlert (_title : String , _description : String, image : EKProperty.ImageContent , shadowColor : UIColor , color : EKAttributes.BackgroundStyle = .color(color: .init(UIColor.appColor(.MainColor)!))) {
        
        
        var attributes = EKAttributes.topFloat
        attributes.entryBackground = color
        
        
        attributes.positionConstraints.verticalOffset += 12
        
        attributes.entranceAnimation = .init(
            translate: .init(duration: 0.7, anchorPosition: .top, spring: .init(damping: 0.5, initialVelocity: 2)),
            scale: .init(from: 1, to: 1, duration: 0.7),
            fade: .init(from: 0.8, to: 1, duration: 0.3))
        
        attributes.shadow = .active(with: .init(color: .init(.lightGray), opacity: 1, radius: 5, offset: .zero))
        
        attributes.statusBar = .dark
        
        
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        let minEdge = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        attributes.positionConstraints.maxSize = .init(width: .constant(value: minEdge), height: .intrinsic)
        
        var title = EKProperty.LabelContent(text: _title ,style: .init(font: AppFonts.medium(size: 16), color: .init(.appColor(.MainFontColor)!)))
        
        
        
        var description = EKProperty.LabelContent(text: _description ,style: .init(font: AppFonts.medium(size: 16), color: .init(.appColor(.MainFontColor)!)))
        
        
        
        if Localize.currentLanguage() == "en" {
            title.style.alignment = .left
            description.style.alignment = .left
        }else{
            title.style.alignment = .right
            description.style.alignment = .right
        }
        
        
        let simpleMessage = EKSimpleMessage(image: image, title: title, description: description)
        
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
        
        
        let contentView = EKNotificationMessageView(with: notificationMessage)
        
        
        SwiftEntryKit.display(entry: contentView, using: attributes)
        
    }
    
    
}
