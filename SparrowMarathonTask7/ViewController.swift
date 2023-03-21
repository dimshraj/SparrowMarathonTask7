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
    
    private lazy var contentView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: headerHeight, width: view.bounds.width, height: headerHeight + view.bounds.height))
        view.backgroundColor = .white
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(headerView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        var headerFrame = headerView.frame
        if offset <= 0 {
            headerFrame.size.height = headerHeight - offset
        }
        headerView.frame = headerFrame
        scrollView.verticalScrollIndicatorInsets.top = headerHeight - offset - self.view.safeAreaInsets.top
    }
}
