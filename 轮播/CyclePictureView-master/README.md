#CyclePictureView
用swift写的一个无限图片轮播器。使用十分简单。支持storyboard

![](http://7xnwdv.com1.z0.glb.clouddn.com/CyclePictureViewCyclePictureView1.gif)
![](http://7xnwdv.com1.z0.glb.clouddn.com/CyclePictureViewCyclePictureView2.gif)

#使用
* 要求

网络图片加载依赖**SDWebImage**框架

* 基本集成

```
//使用本地图片
let cyclePictureView = CyclePictureView(frame: frame, localImageArray: localImageArray)

//使用网络图片
let cyclePictureView = CyclePictureView(frame: frame, imageURLArray: imageURLArray)

```
* 更多功能


```
var imageDetailArray: [String]?		//文字描述
var showPageControl: Bool //pageControl
var detailLableTextFont: UIFont?	//文字属性
var detailLableTextColor: UIColor?
...
//详细请看源码注释，或者示例程序
    
```

#支持
* ios9+
* xode7+

#完善
如果您发现任何BUG,或者有更好的建议或者意见，欢迎您的指出。
 *邮箱:wxl19950606@163.com.感谢您的支持。
