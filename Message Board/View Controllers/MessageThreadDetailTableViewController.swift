
import UIKit

class MessageThreadDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = messageThread?.title

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageThread?.messages.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)


        let message = messageThread?.messages[indexPath.row]
        
        cell.textLabel?.text = message?.messageText
        cell.detailTextLabel?.text = message?.sender
        
        return cell
    }

    // MARK: - Navigation
    
    // MARK: - Bug 2 Fixed Misspelling of "AddMessage"

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMessage" { // fixed misspelling
            guard let destinationVC = segue.destination as? MessageDetailViewController else { return }
            
            destinationVC.messageThreadController = messageThreadController
            destinationVC.messageThread = messageThread
        }
    }
    
    // MARK: - Properties


    var messageThread: MessageThread?
    var messageThreadController: MessageThreadController?
}
