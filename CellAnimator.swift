//
//  CellAnimator.swift
//  MzTableView
//
//  Created by Mohammad Zakizadeh on 4/24/20.
//

import Foundation

public enum AnimationType {
    case none
    case type1(TimeInterval)
    case type2(TimeInterval)
}

class CellAnimator {
    
    static func animateCellUsing(type: AnimationType, cell: UITableViewCell) {
        switch type {
        case .type1(let duration):
            cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
            UIView.animate(withDuration: duration, animations: {
                cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
            }, completion: { finished in
                UIView.animate(withDuration: 0.1, animations: {
                    cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
                })
            })
        case .type2(let duration):
            cell.alpha = 0
            let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
            cell.layer.transform = transform
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                cell.alpha = 1
                cell.layer.transform = CATransform3DIdentity
            }, completion: { _ in
            })
        case .none:
            break
        }
    }
}
