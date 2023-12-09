//
//  StackButton.swift
//  SRStackBuilder
//
//  Created by Siamak on 12/9/23.
//

import Foundation
import UIKit

// MARK: - StackButton

open class StackButton: UIButton {
    // MARK: Lifecycle

    public init(frame: CGRect?,
         title: String?,
         titleColor: UIColor?,
         image: UIImage?,
         backgroundColor: UIColor?,
         tintColor: UIColor?,
         action: (() -> Void)?)
    {
        super.init(frame: frame ?? .zero)
        setTitle(title, for: .normal)
        setImage(image, for: .normal)
        self.backgroundColor = backgroundColor ?? .blue
        self.tintColor = tintColor ?? .blue
        setTitleColor(titleColor, for: .normal)
        addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private

    private var action: (() -> Void)?
}

extension StackButton {
    @objc private func buttonAction() {
        action?()
    }
}
