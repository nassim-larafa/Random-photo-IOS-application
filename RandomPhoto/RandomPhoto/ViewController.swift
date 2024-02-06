//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Nassim Larafa on 1/4/2023.
//

import UIKit

class ViewController: UIViewController {
    private let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    private let button:UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Change Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    let colors : [UIColor] = [
        .systemCyan,
        .systemGray,
        .systemPink,
        .systemTeal,
        .systemBrown,
        .systemGreen,
        .systemIndigo,
        .systemOrange
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemMint
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        GetRandomPhoto()
        view.addSubview(button)
        button.addTarget(self, action: #selector (didTapButton), for: .touchUpInside)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 20,
                              y: view.frame.size.height-50-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-40,
                              height: 50)
    }
    @objc func didTapButton()  {
        GetRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    func GetRandomPhoto() {
        let urlString =
                 "https://source.unsplash.com/random/600*600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }


}

