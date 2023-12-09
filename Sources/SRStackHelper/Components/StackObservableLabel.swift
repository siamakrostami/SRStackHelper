//
//  ObservableLabel.swift
//  SRStackBuilder
//
//  Created by Siamak on 12/9/23.
//

import Combine
import Foundation
import UIKit

// MARK: - ObservableLabel

open class StackObservableLabel: UILabel {
    // MARK: Lifecycle

    public init(frame: CGRect, dynamicText: CurrentValueSubject<String?, Never>) {
        super.init(frame: frame)
        commonInit(dynamicText: dynamicText)
    }
    
    public init(frame: CGRect, text: String?) {
        super.init(frame: frame)
        commonInit(text: text)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit(text: textValue.value)
    }
    
    // MARK: Private

    private var textValue = CurrentValueSubject<String?, Never>(nil)
    
    private var cancellables: Set<AnyCancellable> = []

    private func commonInit(dynamicText: CurrentValueSubject<String?, Never>) {
        textValue = dynamicText
        textValue.sink { [weak self] newText in
            self?.text = newText
        }.store(in: &cancellables)
    }
    
    private func commonInit(text: String?) {
        self.text = text
    }
}
