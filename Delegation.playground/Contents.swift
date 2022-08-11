import UIKit

// At here, think about the IBOutlet tableView is a delegating object who needing a Delegate
// And MenuViewController as a delegate here, that need to conform to the DataSource and Delegate

public class MenuViewController: UIViewController {
    
    @IBOutlet public var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    private let items = ["Item 1", "Item 2", "Item 3", "Item 4"]
    
}

// MARK: - UITableViewDataSource
// DataSource groups delegate methods that provide data
extension MenuViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = items[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}

// MARK: - UITableViewDelegate
// Delegate groups methods that receive data or events
extension MenuViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Do somthing here when a row is selected...
    }
}
