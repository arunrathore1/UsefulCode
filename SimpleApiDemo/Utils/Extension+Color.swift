//
//  Extension+Color.swift
//  SimpleApiDemo
//
//  Created by Arun Rathore on 01/09/22.
//

import SwiftUI

extension Color {
  init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (1, 1, 1, 0)
    }

    self.init(
      .sRGB,
      red: Double(r) / 255,
      green: Double(g) / 255,
      blue:  Double(b) / 255,
      opacity: Double(a) / 255
    )
  }
}


  enum ColorType: String, CaseIterable {
    /// Branding colors
    case branding
    case secondaryBranding

    /// Text colors
    case headline
    case subheadline

    /// Button colors
    case primaryAction
    case secondaryAction

    /// Background colors
    case background
    case systemBackground
    case secondaryBackground

    /// Progress bar color for the portion completed
    case progress

    case divider

    var name: String {
      self.rawValue
    }
  }

extension View {
  func color(_ color: ColorType) -> some View {
    self.foregroundColor(Color(color.name))
  }

  func background(_ color: ColorType) -> some View {
    self.background(Color(color.name))
  }
}

extension Shape {
  func fill(_ color: ColorType) -> some View {
    self.fill(Color(color.name))
  }

  func stroke(_ color: ColorType) -> some View {
    self.stroke(Color(color.name))
  }
}

//
//extension UIColor {
//    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
//        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
//    }
//
//    static let backgroundColor = UIColor.rgb(red: 25, green: 25, blue: 25)
//    static let mainBlueTint = UIColor.rgb(red: 17, green: 154, blue: 237)
//    static let outlineStrokeColor = UIColor.rgb(red: 234, green: 46, blue: 111)
//    static let trackStrokeColor = UIColor.rgb(red: 56, green: 25, blue: 49)
//    static let pulsatingFillColor = UIColor.rgb(red: 86, green: 30, blue: 63)
//}

//import UIKit
//
//@IBDesignable
//class GradientView: UIView {
//
//    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
//    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
//    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
//    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
//    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
//    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
//
//    override class var layerClass: AnyClass { return CAGradientLayer.self }
//
//    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
//
//    func updatePoints() {
//        if horizontalMode {
//            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
//            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
//        } else {
//            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
//            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
//        }
//    }
//    func updateLocations() {
//        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
//    }
//    func updateColors() {
//        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        updatePoints()
//        updateLocations()
//        updateColors()
//    }
//}
//
//cell Animation
// it will be use like this
//func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    if let cell = collectionView.cellForItem(at: indexPath) as? CB3DSelectCell {
//        cell.select(animated: true)
//    }
//}
//
//func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//    if let cell = collectionView.cellForItem(at: indexPath) as? CB3DSelectCell {
//        cell.deselect(animated: true)
//    }

//class TestCell: CB3DSelectCell {
//
//}
//import UIKit
//
//class CB3DSelectCell: UICollectionViewCell {
//
//    enum OffsetDirection {
//        case left
//        case right
//    }
//
//    var offsetDirection: OffsetDirection = .right
//    var animationDuration: CFTimeInterval = 0.35
//    var maxCornerRadius: CGFloat = 14.0
//    var selectionColor: UIColor = #colorLiteral(red: 1, green: 0.737254902, blue: 0.2549019608, alpha: 1)
//    var selectionTimingFunction: CAMediaTimingFunction = CAMediaTimingFunction(name: .easeOut)
//
//    private static let animationKey: String = "CBAnimationSelectionCellSelectAnimation"
//
//    private var snapshotContainer: UIView =  {
//        let view = UIView()
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    private var snapshotView: UIImageView =  {
//        let imageView = UIImageView()
//        imageView.layer.shadowColor = UIColor.black.cgColor
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//    private var overlayView: UIView = UIView()
//    private var overlaySideView: UIView = UIView()
//    private var csCenterX: NSLayoutConstraint?
//    private var csCenterY: NSLayoutConstraint?
//    private var csOverlaySideViewLeft: NSLayoutConstraint?
//    private var csOverlaySideViewRight: NSLayoutConstraint?
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configureViews()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        configureViews()
//    }
//
//    private func configureViews() {
//        configureOverlay()
//        configureSnapshot()
//    }
//
//    private func configureOverlay() {
//        addSubview(overlayView)
//        overlayView.translatesAutoresizingMaskIntoConstraints = false
//        overlayView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        overlayView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        overlayView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        overlayView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        overlayView.isHidden = true
//
//        overlayView.addSubview(overlaySideView)
//        overlaySideView.translatesAutoresizingMaskIntoConstraints = false
//        overlaySideView.topAnchor.constraint(equalTo: overlayView.topAnchor).isActive = true
//        overlaySideView.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor).isActive = true
//        overlaySideView.widthAnchor.constraint(equalToConstant: 5.0).isActive = true
//        csOverlaySideViewLeft = overlaySideView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor)
//        csOverlaySideViewRight = overlaySideView.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor)
//        csOverlaySideViewLeft?.isActive = true
//    }
//
//    private func configureSnapshot() {
//        snapshotContainer.addSubview(snapshotView)
//        snapshotView.topAnchor.constraint(equalTo: snapshotContainer.topAnchor).isActive = true
//        snapshotView.leadingAnchor.constraint(equalTo: snapshotContainer.leadingAnchor).isActive = true
//        snapshotView.trailingAnchor.constraint(equalTo: snapshotContainer.trailingAnchor).isActive = true
//        snapshotView.bottomAnchor.constraint(equalTo: snapshotContainer.bottomAnchor).isActive = true
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(snapshotTapped))
//        snapshotContainer.addGestureRecognizer(gesture)
//    }
//
//    @objc private func snapshotTapped() {
//        guard _selected else { return }
//        deselect(animated: true)
//        if let collectionView = superview as? UICollectionView,
//           let indexPath = collectionView.indexPath(for: self) {
//            collectionView.deselectItem(at: indexPath, animated: true)
//        }
//    }
//
//    var _selected: Bool = false
//
//    func deselect(animated: Bool) {
//        guard _selected else { return }
//        _selected = false
//        let finishDeselection: ()->Void = { [weak self] in
//            if let csCenterX = self?.csCenterX {
//                self?.snapshotView.superview?.removeConstraint(csCenterX)
//            }
//            if let csCenterY = self?.csCenterY {
//                self?.snapshotView.superview?.removeConstraint(csCenterY)
//            }
//            self?.csCenterX = nil
//            self?.csCenterY = nil
//            self?.overlayView.isHidden = true
//            self?.snapshotContainer.removeFromSuperview()
//            self?.snapshotContainer.layer.removeAllAnimations()
//            self?.snapshotView.layer.removeAllAnimations()
//            self?.snapshotContainer.layer.transform = CATransform3DIdentity
//            self?.overlayView.isHidden = true
//        }
//        guard animated else {
//            finishDeselection()
//            return
//        }
//        let presentationLayer = snapshotContainer.layer.presentation() ?? snapshotContainer.layer
//        let currentTransform: CGAffineTransform = CATransform3DGetAffineTransform(presentationLayer.transform)
//
//        let animationGroup = CAAnimationGroup()
//        let translate = CABasicAnimation(keyPath: "transform.translation")
//        translate.fromValue = CGSize(width: currentTransform.tx, height: currentTransform.ty)
//        translate.toValue = CGSize.zero
//        translate.timingFunction = selectionTimingFunction
//
//        let shadowOpacity = CABasicAnimation(keyPath: "shadowOpacity")
//        shadowOpacity.fromValue = presentationLayer.shadowOpacity
//        shadowOpacity.toValue = 0.0
//        shadowOpacity.timingFunction = selectionTimingFunction
//
//        let shadowOffset = CABasicAnimation(keyPath: "shadowOffset")
//        shadowOffset.fromValue = presentationLayer.shadowOffset
//        shadowOffset.toValue = CGSize.zero
//        shadowOffset.timingFunction = selectionTimingFunction
//
//        let shadowRadius = CABasicAnimation(keyPath: "shadowRadius")
//        shadowRadius.fromValue = presentationLayer.shadowRadius
//        shadowRadius.toValue = 0.0
//        shadowRadius.timingFunction = selectionTimingFunction
//
//        let cornerRadius = CABasicAnimation(keyPath: "cornerRadius")
//        cornerRadius.fromValue = presentationLayer.shadowRadius
//        cornerRadius.toValue = layer.cornerRadius
//        cornerRadius.isRemovedOnCompletion = false
//        cornerRadius.timingFunction = selectionTimingFunction
//        cornerRadius.duration = animationDuration
//        cornerRadius.fillMode = .forwards
//
//        let animations: [CAAnimation] = [translate, shadowOpacity, shadowOffset, shadowRadius, cornerRadius]
//        animationGroup.animations = animations
//        animationGroup.timingFunction = selectionTimingFunction
//        animationGroup.isRemovedOnCompletion = false
//        animationGroup.duration = animationDuration
//        animationGroup.fillMode = .forwards
//
//        CATransaction.begin()
//        CATransaction.setCompletionBlock {
//            finishDeselection()
//        }
//        snapshotView.layer.add(cornerRadius, forKey: type(of: self).animationKey)
//        snapshotContainer.layer.add(animationGroup, forKey: type(of: self).animationKey)
//        CATransaction.commit()
//    }
//
//    func select(animated: Bool) {
//        guard !_selected else { return }
//        _selected = true
//        guard let superview = superview else {
//            return
//        }
//        let wasHidden = layer.isHidden
//        layer.isHidden = false
//        UIGraphicsBeginImageContextWithOptions(CGSize(width: frame.width, height: frame.height), false, UIScreen.main.scale)
//        layer.render(in: UIGraphicsGetCurrentContext()!)
//
//        let capturedImage = UIGraphicsGetImageFromCurrentImageContext()
//
//        UIGraphicsEndImageContext()
//        layer.isHidden = wasHidden
//        overlayView.backgroundColor = superview.backgroundColor
//        overlaySideView.backgroundColor = selectionColor
//        overlayView.isHidden = false
//        bringSubviewToFront(overlayView)
//
//        snapshotView.image = capturedImage
//        superview.addSubview(snapshotContainer)
//        superview.bringSubviewToFront(snapshotContainer)
//        snapshotContainer.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
//        snapshotContainer.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
//
//        if let csCenterX = csCenterX {
//            snapshotContainer.superview?.removeConstraint(csCenterX)
//        }
//        if let csCenterY = csCenterY {
//            snapshotContainer.superview?.removeConstraint(csCenterY)
//        }
//        csCenterX = snapshotContainer.centerXAnchor.constraint(equalTo: centerXAnchor)
//        csCenterY = snapshotContainer.centerYAnchor.constraint(equalTo: centerYAnchor)
//        csCenterX?.isActive = true
//        csCenterY?.isActive = true
//        snapshotContainer.layoutIfNeeded()
//
//        let horOffsetMultiplier: CGFloat
//        switch offsetDirection {
//        case .left:
//            horOffsetMultiplier = -1.0
//            csOverlaySideViewRight?.isActive = true
//            csOverlaySideViewLeft?.isActive = false
//        case .right:
//            horOffsetMultiplier = 1.0
//            csOverlaySideViewLeft?.isActive = true
//            csOverlaySideViewRight?.isActive = false
//        }
//
//        if animated {
//            let animationGroup = CAAnimationGroup()
//            let translate = CABasicAnimation(keyPath: "transform.translation")
//            translate.fromValue = CGSize.zero
//            translate.toValue = CGSize(width: horOffsetMultiplier * frame.width * 0.2,
//                                       height: -frame.height * 0.2)
//            translate.timingFunction = selectionTimingFunction
//
//            let shadowOpacity = CABasicAnimation(keyPath: "shadowOpacity")
//            shadowOpacity.fromValue = 0
//            shadowOpacity.toValue = 0.3
//            shadowOpacity.timingFunction = selectionTimingFunction
//
//            let shadowOffset = CABasicAnimation(keyPath: "shadowOffset")
//            shadowOffset.fromValue = CGSize.zero
//            shadowOffset.toValue = CGSize(width: horOffsetMultiplier * -20, height: 45)
//            shadowOffset.timingFunction = selectionTimingFunction
//
//            let shadowRadius = CABasicAnimation(keyPath: "shadowRadius")
//            shadowRadius.fromValue = 0
//            shadowRadius.toValue = 35.0
//            shadowRadius.timingFunction = selectionTimingFunction
//
//            let cornerRadius = CABasicAnimation(keyPath: "cornerRadius")
//            cornerRadius.fromValue = layer.cornerRadius
//            cornerRadius.toValue = maxCornerRadius
//            cornerRadius.timingFunction = selectionTimingFunction
//            cornerRadius.isRemovedOnCompletion = false
//            cornerRadius.fillMode = .forwards
//            cornerRadius.duration =  animationDuration
//
//            let animations: [CAAnimation] = [translate, shadowOpacity, shadowOffset, shadowRadius, cornerRadius]
//
//            animationGroup.animations = animations
//            animationGroup.timingFunction = selectionTimingFunction
//            animationGroup.isRemovedOnCompletion = false
//            animationGroup.fillMode = .forwards
//            animationGroup.duration =  animationDuration
//            snapshotContainer.layer.add(animationGroup, forKey: type(of: self).animationKey)
//            snapshotView.layer.add(cornerRadius, forKey: type(of: self).animationKey)
//        } else {
//            snapshotContainer.layer.transform = CATransform3DTranslate(CATransform3DIdentity,
//                                                                  horOffsetMultiplier * frame.width * 0.2,
//                                                                  -frame.height * 0.2, 0)
//            snapshotContainer.layer.shadowOpacity = 0.3
//            snapshotContainer.layer.shadowOffset = CGSize(width: horOffsetMultiplier * -20.0, height: 45.0)
//            snapshotContainer.layer.shadowRadius = 35.0
//            snapshotContainer.layer.cornerRadius = maxCornerRadius
//        }
//    }
//
//}

