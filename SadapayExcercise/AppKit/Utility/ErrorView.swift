//
//  ErrorView.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 22/07/2022.
//

import Foundation
import UIKit

final class ErrorView: UIView {
    
    private enum Constants {
        static let retryButtonLeadingAnchor: CGFloat = 20
        static let retryButtonTrailingAnchor: CGFloat = -20
        static let retryButtonBottomAnchor: CGFloat = -50
        static let retryButtonHeightAnchor: CGFloat = 50
        static let stackTopAnchor: CGFloat = 40
        static let stackLeadingAnchor: CGFloat = 30
        static let stackTrailingAnchor: CGFloat = -30
        static let stackBottomAnchor: CGFloat = -40
        static let animationViewHeightAnchorMultiplier: CGFloat = 0.4
        static let stackCustomSpacing: CGFloat = 60
        static let retryButtonBorderWidth: CGFloat = 0.4
        static let retryButtonCornerRadius: CGFloat = 5
    }
    
    private lazy var animationView: UIView = UIViewFactory.createUIView(backgroundColor: .color_white_black)
    
    private lazy var retryButton: UIButton = UIButtonFactory.createButton(title: "Retry", backgroundColor: .clear, textColor: #colorLiteral(red: 0.2352941176, green: 0.7607843137, blue: 0.4117647059, alpha: 1))
    
    private lazy var titleLabel: UILabel = UILabelFactory.createUILabel(with: .color_black_white,textStyle: .small, alignment: .center, text: "Something went wrong..")
    
    private lazy var descriptionLabel: UILabel = UILabelFactory.createUILabel(with: .darkGray,textStyle: .micro,alignment: .center, numberOfLines: 0,text: "An alien probably blocking your signal.")
    
    private lazy var stack = UIStackViewFactory.createStackView(with: .vertical, alignment: .fill, distribution: .fill, spacing: 5, arrangedSubviews: [animationView,titleLabel,descriptionLabel])
    
    var retryPressedClosure: (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        retryButton.layer.borderWidth = Constants.retryButtonBorderWidth
        retryButton.layer.cornerRadius = Constants.retryButtonCornerRadius
        retryButton.layer.borderColor = #colorLiteral(red: 0.2352941176, green: 0.7607843137, blue: 0.4117647059, alpha: 1)
    }
    
}

extension ErrorView {
    
    func setupViews() {
        backgroundColor = .color_cell_background
        [retryButton, stack].forEach(addSubview)
        
        stack.setCustomSpacing(Constants.stackCustomSpacing, after: animationView)
        animationView.backgroundColor = .color_cell_background
        
        retryButton.addTarget(self, action: #selector(retryData), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            retryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.retryButtonLeadingAnchor),
            retryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.retryButtonTrailingAnchor),
            retryButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.retryButtonBottomAnchor),
            retryButton.heightAnchor.constraint(equalToConstant: Constants.retryButtonHeightAnchor),
            
            stack.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: topAnchor, multiplier: Constants.stackTopAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.stackLeadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.stackTrailingAnchor),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.bottomAnchor.constraint(equalTo: retryButton.topAnchor, constant: Constants.stackBottomAnchor),

            animationView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Constants.animationViewHeightAnchorMultiplier)
        ])
        
    }
    
    @objc
    func retryData() {
        retryPressedClosure?()
    }
    
    public func startAnimating() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.animationView.showAnimation(aimationName: "network_error")
        })
    }
}
