//
//  ViewController.swift
//  SRStackBuilder
//
//  Created by Siamak on 12/9/23.
//

import UIKit

// MARK: - ViewController

class ViewController: UIViewController {
    // MARK: Internal

    override func viewDidLoad() {
        super.viewDidLoad()
        generateStackBuilderData()
        generateStackResultBuilderData()
        // Do any additional setup after loading the view.
    }

    // MARK: Private

    private lazy var viewModel: ViewModel = .init()

    private var builderStackView: UIStackView?
    private var resultBuilderStackView: UIStackView?

    // Stack Result Builder Samples
}

extension ViewController {
    private func generateStackBuilderData() {
        builderStackView = viewModel.generateStackBuilderStackView()
        layoutStackBuilderStackView()
    }

    private func layoutStackBuilderStackView() {
        guard let builderStackView else {
            return
        }
        builderStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(builderStackView)
        builderStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        builderStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        builderStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    }

    private func generateStackResultBuilderData() {
        resultBuilderStackView = viewModel.generateStackResultBuilderStackView()
        layoutStackResultBuilderStackView()
    }

    private func layoutStackResultBuilderStackView() {
        guard let resultBuilderStackView else {
            return
        }
        guard let builderStackView else {
            return
        }
        resultBuilderStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultBuilderStackView)
        resultBuilderStackView.topAnchor.constraint(equalTo: builderStackView.bottomAnchor, constant: 16).isActive = true
        resultBuilderStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultBuilderStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    }
}
