//
//  BaseCollectionViewController.swift
//  CollectionView
//
//  Created by xingl on 2019/1/25.
//  Copyright © 2019 xingl. All rights reserved.
//

import UIKit

private let kBaseCellID = "baseCellID"
private let kBaseReuseHeaderID = "baseReuseHeaderID"
private let kBaseReuseFooterID = "baseReuseFooterID"

class BaseCollectionViewController: UIViewController {

    lazy var collectionView: UICollectionView = { [weak self] in
        
        let layout = UICollectionViewFlowLayout()
        let margin: CGFloat = 8
        let itemW = (view.bounds.width - margin * 4) / 3
        let itemH = itemW
        layout.itemSize = CGSize(width: itemW, height: itemH)
        // 最小行间距
        layout.minimumLineSpacing = margin
        // 最小item之间的距离
        layout.minimumInteritemSpacing = margin
        // 每组item的边缘切距
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        // 区头大小
        layout.headerReferenceSize = CGSize(width: 11, height: 30)
        layout.footerReferenceSize = CGSize(width: 11, height: 30)

        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.register(BaseCollectionViewCell.self, forCellWithReuseIdentifier: kBaseCellID)
        
        collectionView.register(UINib(nibName: "BaseHeaderAndFooterCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kBaseReuseHeaderID)
        collectionView.register(UINib(nibName: "BaseHeaderAndFooterCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: kBaseReuseFooterID)
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "基本使用"
        
        view.addSubview(collectionView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BaseCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kBaseCellID, for: indexPath) as! BaseCollectionViewCell
        cell.cellIndex = indexPath.item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kBaseReuseHeaderID, for: indexPath) as! BaseHeaderAndFooterCollectionReusableView
            headerView.backgroundColor = .purple
            headerView.textLabel.text = "第 \(indexPath.section) 组的头部"
            return headerView
        }
        
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kBaseReuseFooterID, for: indexPath) as! BaseHeaderAndFooterCollectionReusableView
        footer.textLabel.text = "第 \(indexPath.section) 组的尾部"
        footer.backgroundColor = .lightGray
        return footer
    }
    // 点击事件
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("选中了第\(indexPath.section)组 第 \(indexPath.item) 个");
    }
    
    //  实现以下三个方法，长按会弹出编辑菜单
    func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        
    }
}

//// MARK: - flowLayout协议
//extension BaseCollectionViewController: UICollectionViewDelegateFlowLayout {
//
//    // section的header的大小，宽度设置不影响，如果固定，最好直接设置，别走代理方法
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: 0, height: CGFloat(36 + 10 * section))
//    }
//
//    // section的footer的大小，宽度设置不影响，如果固定，最好直接设置，别走代理方法
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: 0, height: CGFloat(36 + 10 * section))
//    }
//
//}
