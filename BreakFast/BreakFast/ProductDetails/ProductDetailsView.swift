//
//  ProductDetailsView.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//

import Foundation
import UIKit
import SnapKit

class ProductDetailsView: UIView {
    
    private(set) var contentViewHeight = 1000.0
    
    let boardBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Common.background
        return view
    }()
    
    let nutritionValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Nutrition value per 100g"
        label.textColor = UIColor.Label.subtitleLabel
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    let kcalValueLabel: UILabel = {
        let label = UILabel()
        label.text = "0.0 g"
        label.textColor = UIColor.Label.titleLabel
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let kcalLabel: UILabel = {
        let label = UILabel()
        label.text = "kcal"
        label.textColor = UIColor.Label.subtitleLabel
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    let proteinIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Tint.protein
        return view
    }()
    
    let fatIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Tint.fat
        return view
    }()
    
    let carbsIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Tint.carbs
        return view
    }()
    
    let nutritionFactsBackground: UIView = {
        let bg = UIView()
        bg.backgroundColor = UIColor.Common.foreground
        return bg
    }()
    
    let nutritionFactsLabel: UILabel = {
        let label = UILabel()
        label.text = "Nutrition facts"
        label.textColor = UIColor.Label.titleLabel
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let nutritionFactsTableView: UITableView = {
        return UITableView()
    }()
    
    public func setupViews() {
        boardBackgroundView.backgroundColor = UIColor.Common.foreground
        self.addSubview(boardBackgroundView)
        
        boardBackgroundView.addSubview(nutritionValueLabel)
        boardBackgroundView.addSubview(kcalValueLabel)
        boardBackgroundView.addSubview(kcalLabel)
        boardBackgroundView.addSubview(proteinIndicatorView)
        boardBackgroundView.addSubview(fatIndicatorView)
        boardBackgroundView.addSubview(carbsIndicatorView)
        
        self.addSubview(nutritionFactsBackground)
        nutritionFactsBackground.addSubview(nutritionFactsLabel)
        
        nutritionFactsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "NutritionCell")
        nutritionFactsTableView.isScrollEnabled = false
        nutritionFactsBackground.addSubview(nutritionFactsTableView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    private func layout() {
        let foregroundWidth = UIScreen.main.bounds.width - padding*2
        
        boardBackgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(foregroundWidth)
            make.left.equalToSuperview().offset(padding)
            make.height.equalTo(164)
        }
        boardBackgroundView.layer.cornerRadius = 12
        boardBackgroundView.layer.masksToBounds = true
        
        nutritionValueLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(padding)
        }
        
        kcalValueLabel.snp.makeConstraints { make in
            make.top.equalTo(nutritionValueLabel.snp.bottom).offset(6)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        kcalLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(kcalValueLabel.snp.bottom).offset(6)
        }
        
        let indicatorWidth = (boardBackgroundView.frame.width - padding*2) / 3 - 12
        let indicatorHeight = 7.0
        
        proteinIndicatorView.snp.makeConstraints { make in
            make.top.equalTo(kcalLabel.snp.bottom).offset(padding*2)
            make.height.equalTo(indicatorHeight)
            make.width.equalTo(indicatorWidth)
            make.left.equalToSuperview().offset(padding)
        }
        
        fatIndicatorView.snp.makeConstraints { make in
            make.top.equalTo(kcalLabel.snp.bottom).offset(padding*2)
            make.height.equalTo(indicatorHeight)
            make.width.equalTo(indicatorWidth)
            make.centerX.equalToSuperview()
        }
        
        carbsIndicatorView.snp.makeConstraints { make in
            make.top.equalTo(kcalLabel.snp.bottom).offset(padding*2)
            make.height.equalTo(indicatorHeight)
            make.width.equalTo(indicatorWidth)
            make.right.equalToSuperview().offset(-padding)
        }
        
        nutritionFactsBackground.snp.makeConstraints { make in
            make.top.equalTo(boardBackgroundView.snp.bottom).offset(padding)
            make.width.equalTo(foregroundWidth)
            make.left.equalToSuperview().offset(padding)
            make.height.equalTo(800)
        }
        nutritionFactsBackground.layer.cornerRadius = 12
        
        nutritionFactsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding)
            make.left.equalToSuperview().offset(padding)
            make.right.equalToSuperview().offset(-padding)
        }
        
        nutritionFactsTableView.snp.makeConstraints { make in
            make.top.equalTo(nutritionFactsLabel.snp.bottom).offset(padding)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(nutritionFactsBackground.snp.bottom)
        }
        
        self.contentViewHeight = nutritionFactsBackground.frame.maxY
    }
}
