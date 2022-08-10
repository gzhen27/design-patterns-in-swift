import UIKit

// MARK: - Address(Model)
public struct Address {
    public var street: String
    public var city: String
    public var state: String
    public var zipCode: String
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
        return (view as! AddressView)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Controller should update the View using the values from the Model.
        updateViewFromAddress()
    }
    
    private func updateViewFromAddress() {
        guard let addressView = addressView, let address = address else { return }
        addressView.streetTextField.text = address.street
        addressView.cityTextField.text = address.city
        addressView.stateTextField.text = address.state
        addressView.zipCodeTextField.text = address.zipCode
    }
}
