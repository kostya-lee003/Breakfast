//
//  ProductListCell.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//

import Foundation
import SnapKit
import UIKit

public class ProductListCell: UITableViewCell {

    private let background = UIView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    public func update(_ item: AbridgedFoodItem) {
        titleLabel.text = item.dataType
        subtitleLabel.text = item.description
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        background.backgroundColor = UIColor.Common.foreground
        self.contentView.addSubview(background)
        
        titleLabel.font = .systemFont(ofSize: 17)
        titleLabel.textColor = UIColor.Label.titleLabel
        self.background.addSubview(titleLabel)
        
        subtitleLabel.font = .systemFont(ofSize: 17)
        subtitleLabel.textColor = UIColor.Label.subtitleLabel
        self.background.addSubview(subtitleLabel)

        self.textLabel?.textAlignment = .left
        self.detailTextLabel?.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.background.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(padding)
            make.right.equalToSuperview().offset(-padding)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().offset(-padding/2)
        }
        background.layer.cornerRadius = 8
        background.layer.masksToBounds = true
        
        self.titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(background.snp.centerY)
            make.left.equalTo(padding)
            make.width.equalToSuperview().offset(-padding*2-30)
        }
        
        self.subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(padding)
            make.width.equalToSuperview().offset(-padding*2-30)
        }
    }
}

extension UIButton {
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let relativeFrame = self.bounds
        let hitTestEdgeInsets = UIEdgeInsets(top: -15, left: -15, bottom: -15, right: -15)
        let hitFrame = relativeFrame.inset(by: hitTestEdgeInsets)
        return hitFrame.contains(point)
    }
}
