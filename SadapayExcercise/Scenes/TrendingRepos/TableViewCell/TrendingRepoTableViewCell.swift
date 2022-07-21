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
        static let stackLeadingAnchor: CGFloat = 35
        static let stackTrailingAnchor: CGFloat = -10
        static let stackTopAnchor: CGFloat = 20
        static let stackBottomAnchor: CGFloat = -20
        static let stackHeightAnchor: CGFloat = 80
        static let seperatorViewLeadingAnchor: CGFloat = 15
        static let seperatorViewTrailingAnchor: CGFloat = -15
        static let seperatorViewHeightAnchor: CGFloat = 0.5
    }
    
    //MARK: UIElements
    let profileImage: UIImageView = UIImageViewFactory.createImageView(mode: .scaleToFill)
    lazy var languageName = UILabelFactory.createUILabel(with: .darkGray, textStyle: .small, fontWeight: .regular, alignment: .left, numberOfLines: 0)
    lazy var fullName = UILabelFactory.createUILabel(with: .black, textStyle: .regular, alignment: .left, numberOfLines: 0)
    lazy var starsLabel: UILabel = UILabelFactory.createUILabel(with: .gray, textStyle: .small)
    
    lazy var stack: UIStackView = UIStackViewFactory.createStackView(with: .vertical, alignment: .fill, distribution: .fillEqually, spacing: 5, arrangedSubviews: [fullName, languageName, starsLabel])
    
    lazy var seperatorView = UIViewFactory.createUIView(backgroundColor: .darkGray)
    
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
        backgroundColor = .white
        [profileImage,stack, seperatorView].forEach(addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.profileImageLeadingAnchor),
            profileImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: Constants.profileImageHeightAnchor),
            profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor),
            
            stack.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: Constants.stackLeadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.stackTrailingAnchor),
            stack.topAnchor.constraint(equalTo: topAnchor, constant: Constants.stackTopAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.stackBottomAnchor),
            stack.heightAnchor.constraint(equalToConstant: Constants.stackHeightAnchor),
            
            seperatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            seperatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.seperatorViewLeadingAnchor),
            seperatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.seperatorViewTrailingAnchor),
            seperatorView.heightAnchor.constraint(equalToConstant: Constants.seperatorViewHeightAnchor)
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
