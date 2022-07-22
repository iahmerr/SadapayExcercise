//
//  ShimmeringTableViewCell.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import UIKit

final class ShimmeringTableViewCell: ReusableTableViewCell {
    
    private enum Constants {
        static let profileImageViewLeadingAnchor: CGFloat = 20
        static let profileImageViewHeightAnchor: CGFloat = 60
        
        static let topHorizontalViewLeadingAnchor: CGFloat = 20
        static let topHorizontalViewTopAnchor: CGFloat = 20
        static let topHorizontalViewTrailingAnchor: CGFloat = -20
        static let topHorizontalViewHeightAnchor: CGFloat = 15
        
        static let bottomHorizontalViewLeadingAnchor: CGFloat = 20
        static let bottomHorizontalViewTopAnchor: CGFloat = 20
        static let bottomHorizontalViewTrailingAnchor: CGFloat = -20
        static let bottomHorizontalViewBottomAnchor: CGFloat = -20
        static let bottomHorizontalViewHeightAnchor: CGFloat = 15
        
    }

    private let profileImageView: UIView = UIViewFactory.createUIView()
    private let topHorizontalView: UIView = UIViewFactory.createUIView()
    private let bottomHorizontalView: UIView = UIViewFactory.createUIView()
    
    private var viewModel: ShimmeringTableViewCellViewModelType!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.color_white_black
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.makeCircular()
        profileImageView.startShimmeringEffect()
        topHorizontalView.startShimmeringEffect()
        bottomHorizontalView.startShimmeringEffect()
    }
    
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? ShimmeringTableViewCellViewModelType else {
        return }
        self.viewModel = viewModel
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        [profileImageView, topHorizontalView, bottomHorizontalView].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.profileImageViewLeadingAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: Constants.profileImageViewHeightAnchor),
            profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor),
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            topHorizontalView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: Constants.topHorizontalViewLeadingAnchor),
            topHorizontalView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topHorizontalViewTopAnchor),
            topHorizontalView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.topHorizontalViewTrailingAnchor),
            topHorizontalView.heightAnchor.constraint(equalToConstant: Constants.topHorizontalViewHeightAnchor),
            
            bottomHorizontalView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: Constants.bottomHorizontalViewLeadingAnchor),
            bottomHorizontalView.topAnchor.constraint(equalTo: topHorizontalView.bottomAnchor, constant: Constants.bottomHorizontalViewTopAnchor),
            bottomHorizontalView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.bottomHorizontalViewTrailingAnchor),
            bottomHorizontalView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.bottomHorizontalViewBottomAnchor),
            bottomHorizontalView.heightAnchor.constraint(equalToConstant: Constants.bottomHorizontalViewHeightAnchor)
        ])
    }
}
