//
//  AttributeLabelTag.swift
//  AttributeLabel
//
//  Created by xthk_lmc on 2020/12/17.
//

import UIKit

extension String {
    
    /// 给label前面添加标签
    /// - Parameters:
    ///   - titleFont: 主标题字体大小
    ///   - typeTitle: 标签标题
    ///   - typeColor: 标签背景颜色
    /// - Returns: NSMutableAttributedString
    func attributeLabelTag(titleFont: CGFloat,  typeTitle: String, typeColor: UIColor) -> NSMutableAttributedString {
        
        let att = NSMutableAttributedString(string: self)
        let typeFont = UIFont.systemFont(ofSize: 12)
        let titFont = UIFont.systemFont(ofSize: titleFont)
        let typeLabelW = p_widthWithFont(text: typeTitle, font: UIFont.systemFont(ofSize: 12)) + 10.0
        let attachH: CGFloat = 16.0
        // 这个系数可调节标签的相对位置
        let attachTop: CGFloat = p_heightWithFont(font: titFont)/2.0 - attachH + 4

        let typeLabel = UILabel()
        typeLabel.frame = CGRect(x: 0, y: 0, width: typeLabelW, height: attachH)
        typeLabel.text = typeTitle;
        typeLabel.font = typeFont;
        typeLabel.textColor = UIColor.white
        typeLabel.backgroundColor = typeColor;
        typeLabel.clipsToBounds = true
        typeLabel.layer.cornerRadius = 6
        typeLabel.textAlignment = .center
        //转化成imgage
//        let image = asImage(layer: typeLayer)
        let image = p_asImage(view: typeLabel)
        // 创建image富文本
        let attach = NSTextAttachment()
        attach.bounds = CGRect(x: 0, y: attachTop, width: typeLabelW, height: attachH)
        attach.image = image
        // 添加到富文本对象里
        let imageAttStr = NSAttributedString.init(attachment: attach)
        att.insert(imageAttStr, at: 0)
        //注意 ：创建这个Label的时候，frame，font，cornerRadius要设置成所生成的图片的3倍，也就是说要生成一个三倍图，否则生成的图片会虚，同学们可以试一试。
        return att
    }
    
    //将当前视图转为UIImage
    private func p_asImage(view: UIView) -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: view.bounds)
            return renderer.image { rendererContext in
                view.layer.render(in: rendererContext.cgContext)
            }
        } else {
            guard view.bounds.size.height > 0 && view.bounds.size.width > 0 else {return UIImage()}
            UIGraphicsBeginImageContextWithOptions(CGSize(width: view.bounds.width, height: view.bounds.height), false, 0)
            
            // 之前解决不了的模糊问题就是出在这个方法上
            //        layer.render(in: UIGraphicsGetCurrentContext()!)
            
            view.drawHierarchy(in: view.frame, afterScreenUpdates: true)  // 高清截图
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return image ?? UIImage()
            
        }
    }
    
    /// 文字宽度
    private func p_widthWithFont(text: String, font : UIFont) -> CGFloat {

        let size = CGSize()
        let rect = text.boundingRect(with: size,options: NSStringDrawingOptions.usesFontLeading,attributes: [NSAttributedString.Key.font: font],context: nil)
        
        return rect.size.width
    }

    /// 文字高度
    private func p_heightWithFont(_ text: String = "课", font : UIFont) -> CGFloat {

        let size = CGSize()
        let rect = text.boundingRect(with: size,options: NSStringDrawingOptions.usesFontLeading,attributes: [NSAttributedString.Key.font: font],context: nil)
        
        return rect.size.height
    }
    
}
