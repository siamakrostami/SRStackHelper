//
//  ViewModel.swift
//  SRStackBuilder
//
//  Created by Siamak on 12/9/23.
//

import Combine
import Foundation
import SRStackHelper
import UIKit

// MARK: - ViewModel

class ViewModel {
    // MARK: Lifecycle

    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.dynamicValue.send("dynamic text")
        }
    }
    
    // MARK: Internal

    lazy var stackBuilder: StackBuilder = .init()
    
    lazy var stackResultBuilder: StackResultBuilder = .init()
    
    var dynamicValue = CurrentValueSubject<String?, Never>(nil)
}

extension ViewModel {
    func generateStackBuilderStackView() -> UIStackView {
        lazy var textfield: UITextField = {
            let textfield = UITextField(frame: .init(origin: .zero, size: .init(width: 300, height: 40)))
            textfield.layer.borderColor = UIColor.red.cgColor
            textfield.layer.borderWidth = 2
            return textfield
        }()
        
        // Stack Builder Samples
        let stackBuilderFirstRowRightItems: [StackItem] = [.text(label: StackObservableLabel(frame: .zero, dynamicText: dynamicValue), properties: StackLabelProperties(font: .systemFont(ofSize: 16), alignment: .center, textColor: .label)), .text(label: StackObservableLabel(frame: .zero, text: "Test"), properties: StackLabelProperties(font: .systemFont(ofSize: 12), alignment: .center, textColor: .red))]
        
        let stackBuilderFirstRowLeftItems: [StackItem] = [.text(label: StackObservableLabel(frame: .zero, text: "left stack first row"), properties: StackLabelProperties(font: .systemFont(ofSize: 16), alignment: .center, textColor: .label)), .text(label: StackObservableLabel(frame: .zero, text: "Test 2"), properties: StackLabelProperties(font: .systemFont(ofSize: 12), alignment: .center, textColor: .red))]
        
        let singleStackItem: StackItem = .text(label: StackObservableLabel(frame: .zero, text: "Some long text to show"), properties: StackLabelProperties(font: .systemFont(ofSize: 20), alignment: .left, textColor: .systemGray))
        
        return stackBuilder
            .createStackRow(rowRightItems: stackBuilderFirstRowRightItems, rowLeftItems: stackBuilderFirstRowLeftItems, rowRightInternalStackType: StackType(axis: .horizontal, alignment: .fill, distribution: .fillProportionally, spacing: 4), rowLeftInternalStackType: StackType(axis: .horizontal, alignment: .fill, distribution: .fillProportionally, spacing: 4), rowStackType: StackType(axis: .horizontal, alignment: .fill, distribution: .equalSpacing))
            .createStackRow(item: singleStackItem)
            .createStackRow(item: .anyView(view: textfield))
            .build()
    }
    
    func generateStackResultBuilderStackView() -> UIStackView {
        // Stack Result Builder Samples
        let stackBuilderFirstRowRightItems: [StackItem] = [.text(label: StackObservableLabel(frame: .zero, dynamicText: dynamicValue), properties: StackLabelProperties(font: .systemFont(ofSize: 16), alignment: .center, textColor: .cyan)), .text(label: StackObservableLabel(frame: .zero, text: "Test"), properties: StackLabelProperties(font: .systemFont(ofSize: 12), alignment: .center, textColor: .lightGray))]
        
        let stackBuilderFirstRowLeftItems: [StackItem] = [.text(label: StackObservableLabel(frame: .zero, text: "left stack first row"), properties: StackLabelProperties(font: .systemFont(ofSize: 16), alignment: .center, textColor: .yellow)), .text(label: StackObservableLabel(frame: .zero, text: "Test 2"), properties: StackLabelProperties(font: .systemFont(ofSize: 12), alignment: .center, textColor: .systemRed))]
        
        let singleStackItem: StackItem = .text(label: StackObservableLabel(frame: .zero, text: "Some long text to show"), properties: StackLabelProperties(font: .systemFont(ofSize: 20), alignment: .left, textColor: .systemFill))
        
        return stackResultBuilder.createStackRow(rowRightItems: {
            stackBuilderFirstRowRightItems
        }, rowLeftItems: {
            stackBuilderFirstRowLeftItems
        }, rowRightInternalStackType: {
            StackType(axis: .horizontal, alignment: .fill, distribution: .fillProportionally, spacing: 4)
        }, rowLeftInternalStackType: {
            StackType(axis: .horizontal, alignment: .fill, distribution: .fillProportionally, spacing: 4)
        }, rowStackType: {
            StackType(axis: .horizontal, alignment: .fill, distribution: .equalSpacing)
        })
        .createStackRow(item: {
            singleStackItem
        })
        .build()
    }
}
