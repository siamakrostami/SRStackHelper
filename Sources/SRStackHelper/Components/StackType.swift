//
//  StackType.swift
//  SRStackBuilder
//
//  Created by Siamak on 12/9/23.
//

import Foundation
import UIKit

public struct StackType {
    var axis: NSLayoutConstraint.Axis
    var alignment: UIStackView.Alignment
    var distribution: UIStackView.Distribution
    var spacing: CGFloat?
    
    public init(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat? = nil) {
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
    }
}
