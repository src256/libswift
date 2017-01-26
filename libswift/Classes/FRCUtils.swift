import UIKit
import CoreData

public class FRCUtils {
    // MARK: - Misc Utils
    
    public class func createFrc<T>(managedObjectContext: NSManagedObjectContext, entityName: String, sortKey: String, delegate: NSFetchedResultsControllerDelegate) -> NSFetchedResultsController<T> {
        return FRCUtils.createFrc(managedObjectContext: managedObjectContext, entityName: entityName, sortKey: sortKey, pred:nil, delegate: delegate)
    }

    public class func createFrc<T>(managedObjectContext: NSManagedObjectContext, entityName: String, sortKey: String, pred: NSPredicate?, delegate: NSFetchedResultsControllerDelegate) -> NSFetchedResultsController<T> {
        let fetchRequest: NSFetchRequest<T> = NSFetchRequest<T>(entityName: entityName);
        let sortDescriptor = NSSortDescriptor(key: sortKey, ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchRequest.predicate = pred
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil) //cacheNameはnil?
        aFetchedResultsController.delegate = delegate
        do {
            try aFetchedResultsController.performFetch()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        return aFetchedResultsController
    }
    
    public class func moveRowAt<T>(fetchedResultsController: NSFetchedResultsController<T>, sourceIndexPath: IndexPath, destinationIndexPath: IndexPath, sortKey: String) {
        //canMoveRowAtIndexPath*そっどの移動処理
        //このメソッドを実装しないと三本ラインのアイコンが表示されない
        //print("sourceIndexPath.row=\(sourceIndexPath.row) destinationIndexPath.row=\(destinationIndexPath.row)")
        var minRowIdx = 0
        var maxRowIdx = 0
        var isMoveDirectionSmallToLarge = false
        if sourceIndexPath.row == destinationIndexPath.row {
            return
        } else if sourceIndexPath.row < destinationIndexPath.row {
            minRowIdx = sourceIndexPath.row
            maxRowIdx = destinationIndexPath.row
            isMoveDirectionSmallToLarge = true
        } else {
            minRowIdx = destinationIndexPath.row
            maxRowIdx = sourceIndexPath.row
            isMoveDirectionSmallToLarge = false
        }
        //print("minRowIdx=\(minRowIdx) maxRowIdx=\(maxRowIdx)")
        for i in minRowIdx...maxRowIdx {
            //print("i=\(i)")
            let obj = fetchedResultsController.object(at: IndexPath(row: i, section: 0)) as! NSManagedObject
            var displayOrder: Int32 = 0
            if i == sourceIndexPath.row {
                //移動したセルの表示順の設定(どちらにしろ移動先のセルの順番となる)
                displayOrder = Int32(destinationIndexPath.row) + 1
            } else {
                //それ以外のセルはどちらかにずれるだけ
                let curOrder = obj.value(forKey: sortKey) as! Int32
                if isMoveDirectionSmallToLarge {
                    //セルが下方向に移動した場合、それ以外のセルは上に移動
                    displayOrder = curOrder - 1
                } else {
                    //セルが上方向に移動した場合、それ以外のセルは下に移動
                    displayOrder = curOrder + 1
                }
            }
            obj.setValue(displayOrder, forKey: sortKey)
        }
    }
    
    public class func deleteRowAt<T>(fetchedResultsController: NSFetchedResultsController<T>, indexPath: IndexPath, sortKey: String) -> NSManagedObject {
        for i in indexPath.row + 1..<fetchedResultsController.fetchedObjects!.count {
            let obj = fetchedResultsController.object(at: IndexPath(row: i, section: 0)) as! NSManagedObject
            let displayOrder = Int32(i) // (番号-1となる)
            obj.setValue(displayOrder, forKey: sortKey)
        }
        let deleteObj = fetchedResultsController.object(at: indexPath) as! NSManagedObject
        fetchedResultsController.managedObjectContext.delete(deleteObj)
        return deleteObj
    }
    
    // MARK: - Fetched Results Controller Delegate
    
    public class func controllerWillChangeContent(tableView: UITableView) {
        tableView.beginUpdates()
    }
    
    public class func controllerDidChangeSectionInfo(tableView: UITableView, sectionIndex: Int, type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        default:
            return
        }
    }
    
    public class func controllerDidChangeObject(tableView: UITableView, object: Any, indexPath: IndexPath?, type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        //★空状態で特別なビューを表示する場合、reloadRowsAtIndexPathsの呼び出しが必要。
        //http://stackoverflow.com/questions/17761221/custom-cell-on-empty-table-with-nsfetchedresultscontroller
        //
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! ConfiguableCell
                cell.configure(value: object)
            }
        case .move:
            if let indexPath = indexPath {
                if let newIndexPath = newIndexPath {
                    tableView.moveRow(at: indexPath, to: newIndexPath)
                }
            }
        }
    }
    
    public class func controllerDidChangeContent(tableView: UITableView) {
        tableView.endUpdates()
    }
        
    public class func sectionRowCount<T>(fetchedResultsController: NSFetchedResultsController<T>, section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        let rowCount =  sectionInfo.numberOfObjects
        return rowCount
    }
    
    public class func totalRowCount<T>(fetchedResultsController: NSFetchedResultsController<T>) -> Int {
        return fetchedResultsController.fetchedObjects!.count
    }
    
}
