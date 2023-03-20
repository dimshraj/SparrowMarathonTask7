//
//  ViewController.swift
//  SparrowMarathonTask7
//
//  Created by Dmitriy Shrayber on 19.03.2023.
//

import UIKit

class ViewController: UIViewController {

    private let headerHeight: CGFloat = 270

    private lazy var headerView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = UIView(frame: CGRect(x: 0, y: headerHeight, width: view.bounds.width, height: headerHeight + view.bounds.height))
        contentView.backgroundColor = .white
        scrollView.addSubview(contentView)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + headerHeight)
        
        view.addSubview(headerView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.contentInsetAdjustmentBehavior = .never
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
            var headerFrame = headerView.frame
            if offset <= 0 {
                headerFrame.size.height = headerHeight - offset
            } else {
                headerFrame.size.height = 0
            }
            headerView.frame = headerFrame
        scrollView.verticalScrollIndicatorInsets.top = headerHeight - offset
    }
}
