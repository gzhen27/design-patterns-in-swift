//
//  SelectQuestionGroupViewChontroller.swift
//  RabbleWabble
//
//  Created by G Zhen on 8/13/22.
//

import UIKit

public class SelectQuestionGroupViewController: UIViewController {
    // MARK: - Properties
    public let questionGroups = QuestionGroup.allGroups()
    private var selectedQuestionGroup: QuestionGroup!
    
    // MARK: - Outlets
    @IBOutlet internal var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
}

extension SelectQuestionGroupViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionGroupCell") as! QuestionGroupCell
        let questionGroup = questionGroups[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = questionGroup.title
        cell.contentConfiguration = content
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questionGroups.count
    }
}
