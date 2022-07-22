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
        static let profileImageHeightAnchor: CGFloat = 65
        static let stackLeadingAnchor: CGFloat = 35
        static let stackTrailingAnchor: CGFloat = -10
        static let stackTopAnchor: CGFloat = 20
        static let stackBottomAnchor: CGFloat = -20
        static let stackHeightAnchor: CGFloat = 80
        static let backViewAllSides: CGFloat = 5
        static let backViewCornerRadius: CGFloat = 5
        static let backViewBorderWidth: CGFloat = 0.3
    }
    
    //MARK: UIElements
    let profileImage: UIImageView = UIImageViewFactory.createImageView(mode: .scaleAspectFill)
    lazy var languageName = UILabelFactory.createUILabel(with: .darkGray, textStyle: .small, fontWeight: .regular, alignment: .left, numberOfLines: 0)
    lazy var fullName = UILabelFactory.createUILabel(with: UIColor.color_black_white, textStyle: .regular, alignment: .left, numberOfLines: 0)
    lazy var starsLabel: UILabel = UILabelFactory.createUILabel(with: .gray, textStyle: .small)
    lazy var backView = UIViewFactory.createUIView()
    
    lazy var stack: UIStackView = UIStackViewFactory.createStackView(with: .vertical, alignment: .fill, distribution: .fillEqually, spacing: 5, arrangedSubviews: [fullName, languageName, starsLabel])
    
    private var viewModel: TrendingRepoTableViewCellViewModelType!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backView.layer.cornerRadius = Constants.backViewCornerRadius
        backView.layer.borderColor = UIColor.color_black_white.cgColor
        backView.applyShadow()
        backView.layer.borderWidth = Constants.backViewBorderWidth
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
        backView.backgroundColor = UIColor.color_cell_background
        profileImage.backgroundColor = UIColor.color_black_white
        [backView].forEach(addSubview)
        [profileImage,stack].forEach(backView.addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.backViewAllSides),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.backViewAllSides),
            backView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.backViewAllSides),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.backViewAllSides),
            
            profileImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: Constants.profileImageLeadingAnchor),
            profileImage.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: Constants.profileImageHeightAnchor),
            profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor),
            
            stack.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: Constants.stackLeadingAnchor),
            stack.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: Constants.stackTrailingAnchor),
            stack.topAnchor.constraint(equalTo: backView.topAnchor, constant: Constants.stackTopAnchor),
            stack.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: Constants.stackBottomAnchor),
            stack.heightAnchor.constraint(equalToConstant: Constants.stackHeightAnchor)
        ])
    }
}

extension TrendingRepoTableViewCell {
    
    func bindViews(){
        viewModel.postDataClosure = {[weak self] val1,val2, val3, val4 in
            guard let self = self else { return }
            self.fullName.text = val1
            self.languageName.text = val2
            self.starsLabel.text = val3
            self.profileImage.loadImage(with: val4, showsIndicator: true)
        }
    }
}
