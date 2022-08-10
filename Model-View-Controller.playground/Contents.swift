import UIKit

// MARK: - Address(Model)
public struct Address {
    public var street: String
    var city: String
    var state: String
    var zipCode: String
}


// MARK: - AddressView(View)
public final class AddressView: UIView {
    @IBOutlet public var streetTextField: UITextField!
    @IBOutlet public var cityTextField: UITextField!
    @IBOutlet public var stateTextField: UITextField!
    @IBOutlet public var zipCodeTextField: UITextField!
}

// MARK: - AddressViewController(Controller)
public final class AddressViewController: UIViewController {
    // MARK: Properties
    public var address: Address?
    public var addressView: AddressView! {
        guard isViewLoaded else { return nil }
        return view as! AddressView
    }
}
