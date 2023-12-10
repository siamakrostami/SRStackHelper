//
//  StackResultBuilder.swift
//  SRStackBuilder
//
//  Created by Siamak on 12/9/23.
//

import Foundation
import UIKit

// MARK: - StackResultBuilder

open class StackResultBuilder {
    // MARK: Lifecycle

    public init() {}

    // MARK: Private

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
}

// MARK: - StackBlockBuilder

@resultBuilder
public enum StackBlockBuilder {
    public static func buildBlock(_ components: StackItem...) -> [StackItem] {
        return components
    }

    public static func buildBlock(_ components: [StackItem]) -> [StackItem] {
        return components
    }

    public static func buildBlock(_ components: StackType) -> StackType {
        return components
    }

    public static func buildBlock(_ components: StackItem) -> StackItem {
        return components
    }
}

public extension StackResultBuilder {
    @discardableResult
    func createStackRow(@StackBlockBuilder item: () -> StackItem) -> StackResultBuilder {
        switch item() {
        case .text(let label, let properties):
            label.textColor = properties.textColor
            label.textAlignment = properties.alignment
            label.font = properties.font
            label.numberOfLines = properties.numberOfLines
            stackView.addArrangedSubview(label)

        case .button(let button):
            button.translatesAutoresizingMaskIntoConstraints = false
            let size = button.frame.size
            guard size.height > 0, size.width > 0 else {
                stackView.addArrangedSubview(button)
                return self
            }
            button.heightAnchor.constraint(equalToConstant: size.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: size.width).isActive = true
            stackView.addArrangedSubview(button)

        case .imageView(let frame, let image, let contentMode):
            let imageView = UIImageView()
            imageView.frame = frame ?? .zero
            imageView.image = image
            imageView.contentMode = contentMode
            imageView.translatesAutoresizingMaskIntoConstraints = false
            let size = imageView.frame.size
            guard size.height > 0, size.width > 0 else {
                stackView.addArrangedSubview(imageView)
                return self
            }
            imageView.heightAnchor.constraint(equalToConstant: size.height).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: size.width).isActive = true
            stackView.addArrangedSubview(imageView)
        }

        return self
    }

    @discardableResult
    func createStackRow(
        @StackBlockBuilder rowRightItems: () -> [StackItem]?,
        @StackBlockBuilder rowLeftItems: () -> [StackItem]?,
        @StackBlockBuilder rowRightInternalStackType: () -> StackType?,
        @StackBlockBuilder rowLeftInternalStackType: () -> StackType?,
        @StackBlockBuilder rowStackType: () -> StackType
    ) -> StackResultBuilder {
        let rightInternalStack = createInternalStack(stackType: rowRightInternalStackType())
        let leftInternalStack = createInternalStack(stackType: rowLeftInternalStackType())
        let externalStack = createExternalStack(stackType: rowStackType())

        addItemsToStack(items: rowRightItems(), stack: rightInternalStack)
        addItemsToStack(items: rowLeftItems(), stack: leftInternalStack)

        externalStack.addArrangedSubview(leftInternalStack)
        externalStack.addArrangedSubview(rightInternalStack)
        stackView.addArrangedSubview(externalStack)

        return self
    }

    func build() -> UIStackView {
        return stackView
    }

    func hideStack() {
        stackView.arrangedSubviews.forEach { $0.isHidden = true }
    }
    
    public func avadaKedavra() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        stackView.removeFromSuperview()
    }

    func showStack() {
        stackView.arrangedSubviews.forEach { $0.isHidden = false }
    }

    private func createInternalStack(stackType: StackType?) -> UIStackView {
        let internalStack = UIStackView(frame: .zero)
        internalStack.axis = stackType?.axis ?? .horizontal
        internalStack.distribution = stackType?.distribution ?? .fill
        internalStack.alignment = stackType?.alignment ?? .fill
        internalStack.spacing = stackType?.spacing ?? 0
        return internalStack
    }

    private func createExternalStack(stackType: StackType) -> UIStackView {
        let externalStack = UIStackView(frame: .zero)
        externalStack.axis = stackType.axis
        externalStack.distribution = stackType.distribution
        externalStack.alignment = stackType.alignment
        externalStack.spacing = stackType.spacing ?? 0
        return externalStack
    }

    private func addItemsToStack(items: [StackItem]?, stack: UIStackView) {
        items?.forEach { [weak self] item in
            guard let _ = self else {
                return
            }
            switch item {
            case .text(let label, let properties):
                label.textColor = properties.textColor
                label.textAlignment = properties.alignment
                label.font = properties.font
                label.numberOfLines = properties.numberOfLines
                stack.addArrangedSubview(label)

            case .button(let button):
                button.translatesAutoresizingMaskIntoConstraints = false
                let size = button.frame.size
                guard size.height > 0, size.width > 0 else {
                    stack.addArrangedSubview(button)
                    return
                }
                button.heightAnchor.constraint(equalToConstant: size.height).isActive = true
                button.widthAnchor.constraint(equalToConstant: size.width).isActive = true
                stack.addArrangedSubview(button)

            case .imageView(let frame, let image, let contentMode):
                let imageView = UIImageView()
                imageView.frame = frame ?? .zero
                imageView.image = image
                imageView.contentMode = contentMode
                imageView.translatesAutoresizingMaskIntoConstraints = false
                let size = imageView.frame.size
                guard size.height > 0, size.width > 0 else {
                    stack.addArrangedSubview(imageView)
                    return
                }
                imageView.heightAnchor.constraint(equalToConstant: size.height).isActive = true
                imageView.widthAnchor.constraint(equalToConstant: size.width).isActive = true
                stack.addArrangedSubview(imageView)
            }
        }
    }
}
