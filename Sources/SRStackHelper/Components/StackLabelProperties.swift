//
//  StackLabelProperties.swift
//  SRStackBuilder
//
//  Created by Siamak on 12/9/23.
//

import Foundation
import UIKit

open class StackLabelProperties {
    // MARK: Lifecycle

    public init(font: UIFont, alignment: NSTextAlignment, textColor: UIColor, numberOfLines: Int? = 1) {
        self.font = font
        self.alignment = alignment
        self.textColor = textColor
        self.numberOfLines = numberOfLines ?? 1
    }

    // MARK: Internal

    var font: UIFont
    var alignment: NSTextAlignment
    var textColor: UIColor
    var numberOfLines: Int
}
