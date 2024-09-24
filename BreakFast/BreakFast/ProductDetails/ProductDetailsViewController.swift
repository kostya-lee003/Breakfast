//
//  ProductDetailsViewController.swift
//  BreakFast
//
//  Created by Kostya Lee on 24/09/24.
//
import Foundation
import UIKit
import SnapKit
import RxSwift

class ProductDetailsViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Rice porridge with abalone"
        label.textColor = UIColor.Label.titleLabel
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "QUESOS LA RICUSA DE"
        label.textColor = UIColor.Label.subtitleLabel
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let detailsView = ProductDetailsView()
    
    private let viewModel = ProductDetailsViewModel()
    private let disposeBag = DisposeBag()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(product: AbridgedFoodItem) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel.product.onNext(product)
        self.viewModel.items.onNext(product.foodNutrients ?? [])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindVM()
        
        let value = (try? self.viewModel.product.value().foodNutrients ?? []) ?? []
        self.viewModel.items.onNext(value)
    }
    
    private func setupViews() {
        self.view.backgroundColor = UIColor.Common.background
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(titleLabel)
        
        contentView.addSubview(subtitleLabel)
        
        detailsView.setupViews()
        contentView.addSubview(detailsView)
        
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func layout() {
        let topOffset = view.safeAreaInsets.top
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.height.equalTo(detailsView.contentViewHeight + 100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(padding)
            make.right.equalToSuperview().offset(-padding)
            make.top.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(titleLabel.snp.right)
        }
        
        detailsView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(20)
            make.left.equalTo(scrollView.snp.left)
            make.right.equalTo(scrollView.snp.right)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-20)
        }
        
        scrollView.contentOffset = CGPoint(x: 0, y: -topOffset - 50)
    }
    
    private func bindVM() {
        // Table View
        viewModel.items
            .bind(to: detailsView.nutritionFactsTableView.rx.items(cellIdentifier: "NutritionCell", cellType: UITableViewCell.self)) { index, model, cell in
                cell.textLabel?.text = "\(model.name ?? "")  -  \(model.amount ?? 0) g"
            }
            .disposed(by: disposeBag)
        
        detailsView.nutritionFactsTableView.rx.itemSelected
            .subscribe(onNext: { indexPath in
                print("item \(indexPath.row)")
            })
            .disposed(by: disposeBag)
    }
}
