//
//  TrendingRepoTableViewCell.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import UIKit

final class TrendingRepoTableViewCell: ReusableTableViewCell {
    
    private enum Constants {
        static let profileImageLeadingAnchor: CGFloat = 20
        static let profileImageHeightAnchor: CGFloat = 45
        static let mainStackLeadingAnchor: CGFloat = 35
        static let mainStackTrailingAnchor: CGFloat = -10
        static let mainStackTopAnchor: CGFloat = 20
        static let mainStackBottomAnchor: CGFloat = -20
        static let seperatorViewLeadingAnchor: CGFloat = 15
        static let seperatorViewTrailingAnchor: CGFloat = -15
        static let seperatorViewHeightAnchor: CGFloat = 0.5
    }
    
    //MARK: UIElements
    let profileImage: UIImageView = UIImageViewFactory.createImageView(mode: .scaleToFill)
    
    lazy var fullName = UILabelFactory.createUILabel(with: UIColor.color_black_white, textStyle: .regular, alignment: .left, numberOfLines: 0)
    
    lazy var descriptionLabel: UILabel = UILabelFactory.createUILabel(with: .gray, textStyle: .small, numberOfLines: 0)
    
    lazy var languageName = UILabelFactory.createUILabel(with: .darkGray, textStyle: .small, fontWeight: .regular, alignment: .left, numberOfLines: 0)
    
    lazy var starsLabel: UILabel = UILabelFactory.createUILabel(with: .gray, textStyle: .small)
    
    lazy var bottomStack: UIStackView = UIStackViewFactory.createStackView(with: .horizontal, alignment: .fill, distribution: .fill, spacing: 15, arrangedSubviews: [languageName, starsLabel])
    
    lazy var mainStack: UIStackView = UIStackViewFactory.createStackView(with: .vertical, alignment: .fill, distribution: .fill, spacing: 5, arrangedSubviews: [fullName, descriptionLabel, bottomStack])
    
    
    lazy var seperatorView = UIViewFactory.createUIView(backgroundColor: .darkGray)
    
    private var viewModel: TrendingRepoTableViewCellViewModelType!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        profileImage.makeCircular()
    }
    
    override func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? TrendingRepoTableViewCellViewModelType else { return }
        self.viewModel = viewModel
        setupViews()
        setupConstraints()
        bindViews()
        viewModel.fetchData()
    }
}

extension TrendingRepoTableViewCell {
    func setupViews() {
        backgroundColor = UIColor.color_white_black
        profileImage.backgroundColor = UIColor.color_black_white
        [profileImage,mainStack, seperatorView].forEach(addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.profileImageLeadingAnchor),
            profileImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: Constants.profileImageHeightAnchor),
            profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor),
            
            mainStack.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: Constants.mainStackLeadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.mainStackTrailingAnchor),
            mainStack.topAnchor.constraint(equalTo: topAnchor, constant: Constants.mainStackTopAnchor),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.mainStackBottomAnchor),
            
            seperatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            seperatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.seperatorViewLeadingAnchor),
            seperatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.seperatorViewTrailingAnchor),
            seperatorView.heightAnchor.constraint(equalToConstant: Constants.seperatorViewHeightAnchor)
        ])
    }
}

extension TrendingRepoTableViewCell {
    
    func bindViews(){
        viewModel.postDataClosure = {[weak self] val1,val2, val3, val4, val5 in
            guard let self = self else { return }
            self.fullName.text = val1
            self.descriptionLabel.text = val2
            self.languageName.text = val3
            self.starsLabel.text = val4
            self.profileImage.loadImage(with: val5, showsIndicator: true)
        }
    }
}
