# SRStackHelper

`SRStackHelper` is a Swift class designed to facilitate the creation of complex UIStackViews, particularly for use in bottom sheets or similar layout scenarios. It allows you to build a stack view by adding various UI elements, such as labels, buttons, and image views, in a structured and customizable way.

## Features

- **Dynamic Stacks:** Easily create dynamic stacks with text labels, buttons, and image views.
- **Internal Stacks:** Configure internal stacks within the main stack to organize content efficiently.
- **Customization:** Customize stack alignment, distribution, and spacing to achieve the desired layout.
- **ResultBuilder Integration:** Utilizes Swift's result builder feature for a clean and expressive syntax when building stacks.

## Usage

```swift
// Create an instance of SRStackHelper
let SRStackHelper = SRStackHelper()

// Add individual items to the stack
SRStackHelper.createStack {
    StackItems.text(label: observableLabel, properties: labelProperties)
    StackItems.button(button: stackButton)
}

// Or create more complex stacks with internal stacks
SRStackHelper.createStack {
    StackItems.text(label: observableLabel, properties: labelProperties)
    StackItems.button(button: stackButton)
    StackItems.imageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), image: UIImage(named: "example"))
}

// Build the final UIStackView
let stackView = SRStackHelper.build()

// Customize, hide, or show the stack as needed
SRStackHelper.hideStack()
SRStackHelper.showStack()
```

## Example

For a detailed example, see the [SRStackHelperExample](https://github.com/siamakrostami/SRStackHelperExample) repository. It demonstrates how to use SRStackHelper in a real-world project.
