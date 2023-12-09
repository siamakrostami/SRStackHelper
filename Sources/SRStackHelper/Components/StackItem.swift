//
//  StackItem.swift
//  SRStackBuilder
//
//  Created by Siamak on 12/9/23.
//

import Foundation
import UIKit

public enum StackItem {
    case text(label: StackObservableLabel, properties: StackLabelProperties)
    case button(button: StackButton)
    case imageView(frame: CGRect?, image: UIImage?)
}
