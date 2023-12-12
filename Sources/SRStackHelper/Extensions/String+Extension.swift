//
//  File.swift
//
//
//  Created by Siamak on 12/12/23.
//

import Foundation
import UIKit

public extension String {
    func height(withConstrainedWidth width: CGFloat, _ font: UIFont?) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        if let font = font {
            let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
            return ceil(boundingBox.height)
        } else {
            let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: nil, context: nil)
            return ceil(boundingBox.height)
        }
    }
}
