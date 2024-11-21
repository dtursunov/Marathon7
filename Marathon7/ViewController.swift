//
//  ViewController.swift
//  Marathon7
//
//  Created by Diyor Tursunov on 21/11/24.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let imageView = UIImageView(image: .init(named: "cat")?.resized(to: .init(width: UIScreen.main.bounds.width, height: 270)))
    let scrollView = UIScrollView()
    let emptyView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageView.contentMode = .scaleAspectFill
        
        imageView.frame = .init(origin: .zero, size: .init(width: UIScreen.main.bounds.width, height: 270))
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.delegate = self
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 270),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        emptyView.backgroundColor = .red
        scrollView.addSubview(emptyView)
        scrollView.contentSize = .init(width: UIScreen.main.bounds.width, height: 2000)
    }
    
 

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 270 - scrollView.contentOffset.y
        print(y)
        let height = max(0, y)
        let newFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height)
        print(newFrame)
        DispatchQueue.main.async {
            self.imageView.frame = newFrame
        }
    }
    
}


extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
