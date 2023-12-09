//
//  StackItem.swift
//  SRStackBuilder
//
//  Created by Siamak on 12/9/23.
//

import Foundation
import UIKit

//TODO: - Add more UI components
public enum StackItem {
    case text(label: StackObservableLabel, properties: StackLabelProperties)
    case button(button: StackButton)
    case imageView(frame: CGRect?, image: UIImage?)
}
