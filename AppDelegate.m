#define KScreenWidth (CGRectGetWidth([UIScreen mainScreen].bounds)) //屏幕宽度
#define KScreenHeight (CGRectGetHeight([UIScreen mainScreen].bounds)) //屏幕高度
#define appDelegate ((AppDelegate *)([UIApplication sharedApplication].delegate))

UIKIT_EXTERN//简单来说，就是将函数修饰为兼容以往C编译方式的、具有extern属性(文件外可见性)、public修饰的方法或变量库外仍可见的属性

#pragma mark UIWindow

    /*
     UI的窗口类，用于显示界面，一般由一个应用至少要有一个window
     iOS中的空间都是矩形，决定一个空间的位置以及大小，用结构体CGRect
     CGPoint, 结构体, 用来存储x, y轴坐标
     CGSize, 结构体, 用于存储宽度和高度
     CGRect, 结构体, 用于存储矩形的位置和大小
     */
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];//建立屏幕（UIScreen）等大的window
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];//让window 显示在屏幕上

#pragma mark- UIView

//----------------------坐标转换------------------------
// 将像素point由point所在视图转换到目标视图view中，返回在目标视图view中的像素值
- (CGPoint)convertPoint:(CGPoint)point toView:(UIView *)view;
// 将像素point从view中转换到当前视图中，返回在当前视图中的位置
- (CGPoint)convertPoint:(CGPoint)point fromView:(UIView *)view;
// 将rect由rect所在视图转换到目标视图view中，返回在目标视图view中的rect
- (CGRect)convertRect:(CGRect)rect toView:(UIView *)view;
// 将rect从view中转换到当前视图中，返回在当前视图中的rect
- (CGRect)convertRect:(CGRect)rect fromView:(UIView *)view;

/*
例把UITableViewCell中的subview(btn)的frame转换到 controllerA中
// controllerA 中有一个UITableView, UITableView里有多行UITableVieCell，cell上放有一个button
// 在controllerA中实现:
CGRect rc = [cell convertRect:cell.btn.frame toView:self.view];
或
CGRect rc = [self.view convertRect:cell.btn.frame fromView:cell];
// 此rc为btn在controllerA中的rect

或当已知btn时：
CGRect rc = [btn.superview convertRect:btn.frame toView:self.view];
或
CGRect rc = [self.view convertRect:btn.frame fromView:btn.superview];
*/
    
#pragma mark 角半径 圆角属性
    //设置角半径
    CGFloat radius = CGRectGetWidth(aView.bounds) / 2.0;
    aView.layer.cornerRadius = radius;
    Button.layer.masksToBounds = YES;(圆角属性)
    //funcButton.layer.masksToBounds = YES;//是否裁切视图(按钮时候需要 待检测)
    
    
#pragma mark 背景图片
    /*
     添加背景图片：
     1.定义一个UIColor 用colorWithPatternImage方法添加一个UIImage类型的图片
     2.用UIColor类型的图片 作为view的背景色
     
     */
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@".jpeg"]];
    aView.backgroundColor = color;

    
    
#pragma mark UIView-视图层次
    
    
    /*
     //把视图作为一个一维数组来看
     
     //添加：
     
     //在指定的index 处插入子视图
     self.window insertSubview:(UIView *) atIndex:(NSInteger)
     
     //在指定视图上面添加子视图
     self.window insertSubview:(UIView *) aboveSubview:(UIView *)
     
     //在指定视图之下添加子视图
      self.window insertSubview:(UIView *) belowSubview:(UIView *)
     
     */
    
    
    //指定视图移动到最前
    [self.window bringSubviewToFront:aView];
    
    //指定视图移动到最后
    [self.window sendSubviewToBack:aView];
    
    //交换两个指定索引位置的子视图
    [self.window exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
    
    //移除指定视图
    [aView removeFromSuperview];
   
    //移除所有
    for (UIView *temp in self.window.subviews) {
        [temp removeFromSuperview];
    }
    
    
    //获取本视图的父视图
    UIView *superView = [aView superview];
    
    //获取本视图的所有的子视图
    NSArray *subViewss = [aView subviews];
    
  
#pragma mark- 图片相关 UIImage & UIImageView

//UIImage和UIView使用的是左上原点坐标，Core Image和Core Graphics使用的是左下原点坐标。这个概念很重要，当你遇到图像绘制倒立问题的时候你就知道了。

//UIImage继承与NSObject ,UIImageView 继承与UIView
    
//  imageNamed便利构造器创建的对象不适用于大型图片资源，因为第一次使用该方法加载图片对象时，系统就会对该图片做缓存，方便下次直接使用，也就是该方法创建的图片对象并不销毁内存。小的图片使用它会提高加载效率。
    UIImage *image = [UIImage imageNamed:@"200711912453162_2.jpg"];
    
//  获取图片在应用程序包中的路径
    NSString *imagePath = [[NSBundle mainBundle]pathForResource:@"111" ofType:@"jpg"];
//  根据文件路径创建对象
    UIImage *image = [[UIImage alloc]initWithContentsOfFile:imagePath];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];


//设置允许裁切图片
   imagePickerController.allowsEditing = YES;
   Button.layer.masksToBounds = YES;(圆角属性)

#pragma mark 纯色图片
//方法一
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = [self bounds];
    [[UIColor blackColor] set];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClipToMask(context, bounds, [myImage CGImage]);
    CGContextFillRect(context, bounds);
}

//方法二
CGSize imageSize =CGSizeMake(50,50);
UIGraphicsBeginImageContextWithOptions(imageSize,0, [UIScreenmainScreen].scale);
[RGBA(206,58, 216, 1) set];
UIRectFill(CGRectMake(0,0, imageSize.width, imageSize.height));
UIImage *pressedColorImg =UIGraphicsGetImageFromCurrentImageContext();
UIGraphicsEndImageContext();

#pragma mark 获得图片大小
CGFloat imageWidth = CGImageGetWidth(_imageSource.CGImage);
CGFloat imageHeight = CGImageGetHeight(_imageSource.CGImage);

#pragma mark 图片自适应大小

imageView.contentMode = UIViewContentModeScaleAspectFit;
imageView.autoresizesSubviews = YES;
imageView.autoresizingMask =UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;


/*
UIImageView 的contentMode这个属性是用来设置图片的显示方式，如居中、居右，是否缩放等，有以下几个常量可供设定：

UIViewContentModeScaleToFill
UIViewContentModeScaleAspectFit
UIViewContentModeScaleAspectFill
UIViewContentModeRedraw
UIViewContentModeCenter
UIViewContentModeTop
UIViewContentModeBottom
UIViewContentModeLeft
UIViewContentModeRight
UIViewContentModeTopLeft
UIViewContentModeTopRight
UIViewContentModeBottomLeft
UIViewContentModeBottomRight

注意以上几个常量，凡是没有带Scale(比例、变形)的，当图片尺寸超过 ImageView尺寸时，只有部分显示在ImageView中。UIViewContentModeScaleToFill属性会导致图片变形。UIViewContentModeScaleAspectFit会保证图片比例不变，而且全部显示在ImageView中，这意味着ImageView会有部分空白。UIViewContentModeScaleAspectFill也会证图片比例不变，但是是填充整个ImageView的，可能只有部分图片显示出来。


*/




#pragma mark 保持原来的长宽比，生成一个缩略图
- (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)newSize
{
    UIImage *newImage;
    if (nil == image) {
        newImage = nil;
    }
    else{
        CGSize oldSize = image.size;
        CGRect rect;
        if (newSize.width/newSize.height > oldSize.width/oldSize.height) {
            rect.size.width = newSize.height*oldSize.width/oldSize.height;
            rect.size.height = newSize.height;
            rect.origin.x = (newSize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = newSize.width;
            rect.size.height = newSize.width*oldSize.height/oldSize.width;
            rect.origin.x = 0;
            rect.origin.y = (newSize.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(newSize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, newSize.width, newSize.height));//clear background
        [image drawInRect:rect];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newImage;
}




#pragma mark 相机拍照取照片自动旋转90度的问题

//方法1(Category)
- (UIImage *)imageWithFixedOrientation {
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [self drawInRect:(CGRect){0, 0, self.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}


//方法2
- (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

#pragma mark Core Graphics


#pragma mark UIImagePickerController(图片拾取器)

UIImageWriteToSavedPhotosAlbum(self.workingImage, nil, nil, nil);//保存图片

/***
 
 1.遵循双代理
 <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
 
 2.点击按钮时候 实现方法中 创建图片拾取器
 
 3.实现图片拾取器的代理
 
 */
- (void)handlePickImageAction:(UIButton *)sender{
    //创建图片选取器
    UIImagePickerController * imagePickerController = [[UIImagePickerController alloc]init];
    //指定代理对象
    imagePickerController.delegate = self;//遵守双协议
    //设置允许裁切图片
    imagePickerController.allowsEditing = YES;
    
    //让图片选取器显示出来(用模态方式)
    [self presentViewController:imagePickerController animated:YES completion:nil];
    [imagePickerController release];
    
    //4.实现图片选取器的代理方法
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //    NSLog(@"%@",info);
    UIImage *editedImage = info[@"UIImagePickerControllerEditedImage"];//获取选取到 裁切好的照片
    //获取按钮对象
    UIButton * button = (UIButton *)[self.view viewWithTag:1111];
    
    
#pragma mark 图片渲染
    //给按钮设置图片（需要用渲染模式）
    [button setImage:[editedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    //撤销选取器
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 动图
   //用可变数组保存图片对象
   NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i < 21; i ++) {
    NSString *name = [NSString stringWithFormat:@"1－%d.tiff",i];
    
    UIImage *image = [UIImage imageNamed:name];
    [images addObject:image];
     }

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.center =self.view.center;
    //要播放动态图片的基本设置

    //设置要被播放的一组有序图片数组
    imageView.animationImages = images;

    //设置动态播放图片的时长S
    imageView.animationDuration = 4;

    //设置重复播放次数,设置为0，表示无限次
    imageView.animationRepeatCount = 0;

    //调用开始动画的方法
    [imageView startAnimating];

    [self.view addSubview:imageView];
    [imageView release];

    }

    
    
    
#pragma mark- UILabel
    
    //创建UILabel 主要作用就是用来展现文本
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) / 50, CGRectGetHeight([UIScreen mainScreen].bounds) / 50, self.window.bounds.size.width, self.window.frame.size.height / 4)];


    
        //背景颜色
        lable.backgroundColor = [UIColor orangeColor];
    
        //设置文本信息
        lable.text = @"哈哈3";
    
        //设置字体大小
        lable.font = [UIFont systemFontOfSize:20.0f];
        label.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];//加粗
    
       //====自动调整字体宽度=====
       label.adjustsFontSizeToFitWidth = YES;
    
        //打印所有字体格式
        NSArray *fonArray = [UIFont familyNames];
        //NSLog(@"%@",fonArray);
    
        //设置字体格式与大小
        lable.font = [UIFont fontWithName:@"Bangla Sangam MN" size:20.0f];
    
        //设置字体颜色
        lable.textColor = [UIColor whiteColor];
    
        //设置文本对齐方式(水平方向)
        lable.textAlignment = NSTextAlignmentCenter ;
    
        //设置行数
        lable.numberOfLines = 3;
    
        //断行模式
        lable.lineBreakMode = NSLineBreakByTruncatingMiddle;
    
        //设置阴影的颜色
        lable.shadowColor = [UIColor blackColor];
    
        //设置阴影大小(阴影向x正方向偏移5，向y正方向偏移5)
        lable.shadowOffset = CGSizeMake(5, 5);
    
    
        //添加到子视图
        [self.window addSubview:lable];
        //[lable release];
    
    
#pragma mark UILabel-背景图片
    
    //方法1
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"itemkaung2.png"]];
    [myLabel setBackgroundColor:color];
    
    
    //方法2
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"calculator_b.png"]];
    
        imgView.frame = self.view.bounds;
    
        imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
        [a insertSubview:imgView atIndex:0];
    
    //添加图片（非背景）
    
    UIImage *image = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"81" ofType:@"jpg"]];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    
    imageView.frame = CGRectMake(0, 0, 200, 200 * image.size.height / image.size.width);
    
    imageView.tag = 1234;
    imageView.center = scrollView.center;
    
    [scrollView addSubview:imageView];
    
    [self.view addSubview:scrollView];
    
    //图片渲染模式
    [button setImage:[editedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    
    
#pragma mark- UITextField
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake((CGRectGetWidth(self.window.frame) - 300) / 2, 300, 300, 40)];
    
    textField.backgroundColor = [UIColor orangeColor];
    
    textField.text = @"账户";
    
    //设置对齐方式
    textField.textAlignment = NSTextAlignmentCenter;
    
    //设置边框样式
    textField.borderStyle = UITextBorderStyleBezel;
    
    //清除按钮模式(出现小叉叉)
    textField.clearButtonMode = UITextFieldViewModeAlways;
    
    //是否允许输入
    textField.enabled = YES;
    
    //重新编辑是否清除
    textField.clearsOnBeginEditing = YES;
    
    //密码模式
    textField.secureTextEntry = NO;
    
    //键盘模式
    textField.keyboardType = UIKeyboardTypeDefault;
    
    //textField.keyboardType = UIKeyboardTypeNamePhonePad;
    
    //控制return 键的样式
    textField.returnKeyType = UIReturnKeyNext;
    
    //占位文字
    textField.placeholder = @"请输入账号";
    
#pragma mark UITextField-左右视图
    
    /*
     
     创建左视图
     UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
     leftView.backgroundColor = [UIColor purpleColor];
     
     //左视图显示模式（不设置 就不会出现）
     textField.leftViewMode = UITextFieldViewModeAlways;
     
     //（设置）左视图
     textField.rightViewMode = UITextFieldViewModeAlways;
     textField.rightView = leftView;
     //[leftView release];
     
     //创建右视图
     UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
     rightView.backgroundColor = [UIColor purpleColor];
     textField.rightViewMode = UITextFieldViewModeAlways;
     textField.rightViewMode = UITextFieldViewModeAlways;
     
     textField.rightView = leftView;
     [rightView release];
     
     */
    

    
#pragma mark UITextField-自定义键盘
    
        UIView *inputView = [[UIView alloc]initWithFrame:CGRectMake(0,0, self.frame.size.width, 300)];
        inputView.backgroundColor = [UIColor cyanColor];
        textField.inputView = inputView;
        [inputView release];
    
    
    //自定义键盘的辅助键盘
    //  UIView *inputAccessoryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,  self.frame.size.width, 20)];
    //  inputAccessoryView.backgroundColor = [UIColor blackColor];
    //  textField.inputAccessoryView = inputAccessoryView;
    //  [inputAccessoryView release];
    
    [self.window addSubview:textField];
    //[textField release];
    

#pragma mark UITextField-placehoder 的位置重写
@interface CustomTextField : UITextField
//经过这样的方法可以简单快捷地改变textField（包括placehoder） 文字的位置、大小、颜色等
@end

@implementation CustomTextField

- (CGRect)textRectForBounds:(CGRect)bounds{
    return CGRectMake(25, 0, bounds.size.width, bounds.size.height);
}

- (CGRect)editingRectForBounds:(CGRect)bounds{
    return CGRectMake(25, 0, bounds.size.width, bounds.size.height);
}

@end

#pragma mark 键盘通知
/*
 键盘的通知：
 UIKeyboardWillShowNotification // 键盘即将显示
 UIKeyboardDidShowNotification // 键盘显示完毕
 UIKeyboardWillHideNotification // 键盘即将隐藏
 UIKeyboardDidHideNotification // 键盘隐藏完毕
 UIKeyboardWillChangeFrameNotification // 键盘的位置尺寸即将发生改变
 UIKeyboardDidChangeFrameNotification // 键盘的位置尺寸改变完毕
 */


/*
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
[[NSNotificationCenter defaultCenter ] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
*/

//键盘显示事件
- (void) keyboardWillShow:(NSNotification *)notification {

    CGFloat kbHeight = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;

    UIView *currentView = [self findFirstResponderBeneathView:self.view];//用到找第一响应者（本文有）
    if (currentView) {
        //滚动多少 = [currentView 的下边Y值(即y+h)] 减去 [键盘升起y值(屏幕高 - 键盘高)] 加 [一定间隔（美观）]
        CGFloat offset = (currentView.frame.origin.y + currentView.frame.size.height+INTERVAL_KEYBOARD) - (self.View.frame.size.height - kbHeight);
        //动画时间
        double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        //大于0 需要滚动
        if(offset > 0) {
            [UIView animateWithDuration:duration animations:^{
                self.view.frame = CGRectMake(0.0f, -offset, self.View.frame.size.width, self.scrollView.frame.size.height);
            }];
        }
    }
}

///键盘消失事件
- (void) keyboardWillHide:(NSNotification *)notification {
    // 键盘动画时间
    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];

    //视图下沉恢复原状
    [UIView animateWithDuration:duration animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}


//scrollView 用这个【http:~~~~//blog.csdn.net/woaifen3344/article/details/38382197】
- (void)keyboardWillShow:(NSNotification *)notification {
    self.previousOffset = self.scrollView.contentOffset;//需要定义一个上一次偏移量
    NSDictionary *userInfo = [notification userInfo];

    CGRect keyboardRect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // convert keyboard rect from window coordinate to scroll view coordinate
    keyboardRect = [self.scrollView convertRect:keyboardRect fromView:nil];
    // get keybord anmation duration
    NSTimeInterval animationDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];

    // get first responder textfield
    UIView *currentResponder = [self findFirstResponderBeneathView:self.scrollView];
    if (currentResponder != nil) {
        // convert textfield left bottom point to scroll view coordinate
        CGPoint point = [currentResponder convertPoint:CGPointMake(0, currentResponder.frame.size.height) toView:self.scrollView];
        // 计算textfield左下角和键盘上面20像素 之间是不是差值
        float scrollY = point.y - (keyboardRect.origin.y - 20);
        if (scrollY > 0) {
            [UIView animateWithDuration:animationDuration animations:^{
                //移动textfield到键盘上面20个像素
                self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x, self.scrollView.contentOffset.y + scrollY);
            }];
        }
    }
    self.scrollView.scrollEnabled = NO;
    return;
}


- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    NSTimeInterval animationDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:animationDuration animations:^{
        self.scrollView.contentOffset = self.previousOffset;
    }];
    self.scrollView.scrollEnabled = YES;

    return;
}


#pragma mark 收起键盘

//简单粗暴 代替tap手势
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


/*
 1 文件头引入代理UITextFieldDelegate
 2 设置代理对象 textField.delegate = self;
 3 重写实现方法- (BOOL)textFieldShouldReturn:(UITextField *)textField
 */


- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    //调试工具 （执行 函数的行数  函数）
    //NSLog(@"%d__%s",__LINE__,__func__);
    [textField resignFirstResponder];
    return YES;
}


- (BOOL)textFieldShouldReturn1:(UITextField *)textField{
    [[self.window viewWithTag:120] resignFirstResponder];
    [[self.window viewWithTag:121] becomeFirstResponder];
    [textField resignFirstResponder];

    return YES;
    //简便方法
    [self.view endediting YES];
}

//手势识别 + 上下判断
- (void)handleSwipeGesture:(UISwipeGestureRecognizer *)sender{
    if ([[self.window viewWithTag:120] isFirstResponder]) {
        [[self.window viewWithTag:120] resignFirstResponder];
        [[self.window viewWithTag:121] becomeFirstResponder];
    }else{
        [[self.window viewWithTag:121] resignFirstResponder];
    }
}



    
#pragma mark- UIButton
    
    //创建一个button （便利构造器）
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 能够定义的button类型有以下6种，
    // typedef enum {
    // UIButtonTypeCustom = 0, 自定义风格
    // UIButtonTypeRoundedRect, 圆角矩形
    // UIButtonTypeDetailDisclosure, 蓝色小箭头按钮，主要做详细说明用
    // UIButtonTypeInfoLight, 亮色感叹号
    // UIButtonTypeInfoDark, 暗色感叹号
    // UIButtonTypeContactAdd, 十字加号按钮
    // } UIButtonType;
    
    //设置frame(给定button在view上的位置)
    button.frame = CGRectMake((CGRectGetWidth(self.window.frame) - 50) /2, 350, 50, 50);
    
    
    //******指定代理方(委托方 textfield ，代理方 self)******
    textField.delegate = self;
    
    button.backgroundColor = [UIColor clearColor];
    
    //设置指定状态下地前景图
    [button setImage:[UIImage imageNamed:@"enhance_press@2x.png"] forState:UIControlStateNormal];
    
    //设置背景图片
    [button setBackgroundImage:[UIImage imageNamed:@"enhance_press@2x.png"] forState:UIControlStateNormal];
    
    //设置（某种状态下的）标题
    [button setTitle:@"开始" forState:UIControlStateNormal];
    [button setTitle:@"停止" forState:UIControlStateSelected];

    //获取指定状态下地标题
    //  NSLog(@"%@",[sender titleForState:UIControlStateNormal]);

    //获取指定状态下地前景图片
    UIImage *image = [sender imageForState:UIControlStateNormal];
    //  NSLog(@"指定状态下地图片是：%@",image);

    //获取指定状态下地背景图片
    UIImage *backgroundImage = [sender backgroundImageForState:UIControlStateNormal];


#pragma mark  按钮点谁 谁变色 其他还原
- (void)topicButtonChange:(UIButton *)sender{
    
    static NSInteger currentSelectButtonIndex = 0;
    static  NSInteger previousSelectButtonIndex = 100;//注意
    
    currentSelectButtonIndex = sender.tag;
    UIButton *currentBtn = (UIButton *)[self.view viewWithTag:currentSelectButtonIndex];;
    [currentBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    currentBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    currentBtn.userInteractionEnabled = NO;//注意
    
    UIButton *previousBtn=(UIButton *)[self.view viewWithTag:previousSelectButtonIndex];
    [previousBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    previousBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    previousBtn.userInteractionEnabled = YES;//注意
    previousSelectButtonIndex = currentSelectButtonIndex;
}

#pragma mark UIButton-标题&功能切换

- (void)handleButtonAction:(UIButton *)sender{
    //selected BOOL 类型 拿之前状态取反 再赋值给自己（按钮标题切换）
    sender.selected = !sender.selected;
        
    //判断如果是选中状态，就让霓虹灯闪烁 否则 停止
    if (sender.selected) {
        //启动
        self.timer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(changeNeonLightColor:) userInfo:nil repeats:YES];
            
    } else {
        //停止
        [self.timer invalidate];
        self.timer = nil;
            
    }
}
    
    /* forState: 这个参数的作用是定义按钮的文字或图片在何种状态下才会显现
     enum {
     UIControlStateNormal = 0, 常规状态显现
     UIControlStateHighlighted = 1 << 0, 高亮状态显现
     UIControlStateDisabled = 1 << 1, 禁用的状态才会显现
     UIControlStateSelected = 1 << 2, 选中状态
     UIControlStateApplication = 0x00FF0000, 当应用程序标志时
     UIControlStateReserved = 0xFF000000 为内部框架预留，可以不管他
     };
     */
    
    //设置字体颜色
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    
    //设置边框
    [button.layer setBorderWidth:1.0];
    
    //设置边框颜色
    [button.layer setBorderColor:[UIColor whiteColor].CGColor];

    //设置聚光灯的效果
    button.showsTouchWhenHighlighted = YES;


[self.button setTintColor:[UIColor redColor]];//
[self.button.layer setBorderColor:[UIColor redColor].CGColor];//边框颜色
[self.button.layer setBorderWidth:1];//边框宽
[self.button.layer setCornerRadius:5];//圆角

self.button.titleLabel.font = [UIFont systemFontOfSize:11];
[self.button setTitle:@"专题" forState:UIControlStateNormal];
self.button.userInteractionEnabled = NO;//关交互

#pragma mark UIButton-添加点击事件
    
    //对象 事件 动作
    [button addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
    //移除关联
    [sender removeTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchDragInside];


    
#pragma mark - UIMenuController
- (void)longPressAction:(UILongPressGestureRecognizer  *)sender{
    CGPoint touchPoint = [sender locationInView:self.hallCollection];
    NSIndexPath *indexPath = [self.hallCollection indexPathForItemAtPoint:touchPoint];
    if (indexPath == nil) {
        //NSLog(@"kong");
    }else{
        //NSLog(@"%ld,%ld",(long)indexPath.section,(long)indexPath.row);
        UICollectionViewCell * cell = [self.hallCollection cellForItemAtIndexPath:indexPath];
        [self becomeFirstResponder];
        UIMenuController *menu = [UIMenuController sharedMenuController];
        UIMenuItem *report = [[UIMenuItem alloc]initWithTitle:@"举报" action:@selector(reportAction:)];
        [menu setTargetRect:cell.frame inView:cell.superview];
        [menu setMenuItems:@[report]];
        [menu setMenuVisible:YES animated:YES];
    }
    
    
}

//MenuController 必须实现的两个方法
- (BOOL)canBecomeFirstResponder{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(reportAction:) ) {
        return YES;
    }
    return NO;
}


#pragma mark- UIAlert
    
    /*
     1、创建并且初始化，
     
     视图控制器必须得实现协议UIAlertViewDelegate中的方法，并指定delegate为self，才能使弹出的Alert窗口响应点击事件。
     
     */

    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"你的手机将要爆炸" delegate:self cancelButtonTitle:@"扔手机" otherButtonTitles:@"打含猪",@"吃饭饭",nil];
    
    //让alert 显示（重要）
    [alertView show];

    //相关方法
    - (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

        return YES;
    }

#pragma mark UIwebView

继承关系：UIWebView : UIView <NSCoding, UIScrollViewDelegate>

//UIWebView继承与UIView，因此，其初始化方法和一般的view一样，通过alloc和init进行初始化
_webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height - 60)];

_webView.suppressesIncrementalRendering = YES;

//设置是否缩放到适合屏幕大小
_webView.scalesPageToFit = NO;

//将网页超出部分分页，从左向右进行翻页
_webView.paginationMode =UIWebPaginationModeTopToBottom;

//设置是否使用内联播放器播放视频
_webView.allowsInlineMediaPlayback = YES;
//设置代理
_webView.delegate = self;



 加载：[self.webView loadHTMLString:model.body baseURL:nil];
      [self.webView loadRequest:<#(NSURLRequest *)#>];


//代理方法
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    //字体大小
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '330%'"];
    //字体颜色
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= 'gray'"];
    //页面背景色
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='#2E2E2E'"];
    
    
   //自适应图片
    NSString *meta = [NSString stringWithFormat:@"document.getElementsByName(\"meta\")[0].content = \"width=%f, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no\"", webView.frame.size.width];
    [webView stringByEvaluatingJavaScriptFromString:meta];
    
    
}


//webView协议中的方法

//准备加载内容时调用的方法，通过返回值来进行是否加载的设置

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    //NSLog(@"%@",request);
    return YES;
}


//开始加载时调用的方法
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    //NSLog(@"webViewDidStartLoad");
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height - 60)];
    [view setTag:108];
    [view setBackgroundColor:[UIColor blackColor]];
    [view setAlpha:0.5];
    [self.view addSubview:view];
    
    
    //活动指示器视图
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [_activityIndicator setCenter:view.center];
    [_activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [view addSubview:_activityIndicator];
    
    [_activityIndicator startAnimating];
    
}

//结束加载时调用的方法
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //NSLog(@"webViewDidFinishLoad");
    [_activityIndicator stopAnimating];
    UIView *view = (UIView*)[self.view viewWithTag:108];
    [view removeFromSuperview];
    
    
}
//加载失败时调用的方法
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    //NSLog(@"didFailLoadWithError");
    [_activityIndicator stopAnimating];
    UIView *view = (UIView*)[self.view viewWithTag:108];
    [view removeFromSuperview];
    
    
    
}



#pragma mark 按钮功能 + 计时器

- (void)buttonFunction:(UIButton *)sender{

    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(计时器要实现的功能函数) userInfo:nil repeats:YES];
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        [timer fire];
    } else {
        [timer invalidate];
        timer = nil;
    }
    
}



#pragma mark-  viewContrller

/*
 生命周期
 init -
 loadView - viewDidLoad - viewWillAppear - viewDidAppear - viewWillDisappear - viewDidDisappear - viewDidUnload - dealloc
 
*/


/*
 
 loadView和viewDidLoad方法时在第一次调用视图控制器的view属性的getter方法时被调用一次。view属性的getter方法内部实现是基于懒加载的，类似于下面的形式。视图控制器设计这样的格式，是因为子类可以继承到view属性，但是不能直接在自己的实现中使用_view实例变量，相反，视图控制器定义的方法，一定可以在子类中重写来完成自定义
 
 - (UIView *)view{
 if(!_view){
 [self loadView];
 [self viewDidLoad];
 }
 return _view;
 }
 */

#pragma mark 内存警告

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //NSLog(@"%s",__func__);
    
    if (self.isViewLoaded && !self.view.window) {
        self.view = nil;
    }
}


#pragma mark- 应用程序的生命周期

/*
 
 1、application didFinishLaunchingWithOptions：当应用程序启动时执行，应用程序启动入口，只在应用程序启动时执行一次。若用户直接启动，lauchOptions内无数据,若通过其他方式启动应用，lauchOptions包含对应方式的内容。
 2、applicationWillResignActive：在应用程序将要由活动状态切换到非活动状态时候，要执行的委托调用，如 按下 home 按钮，返回主屏幕，或全屏之间切换应用程序等。
 3、applicationDidEnterBackground：在应用程序已进入后台程序时，要执行的委托调用。
 4、applicationWillEnterForeground：在应用程序将要进入前台时(被激活)，要执行的委托调用，刚好与applicationWillResignActive 方法相对应。
 5、applicationDidBecomeActive：在应用程序已被激活后，要执行的委托调用，刚好与applicationDidEnterBackground 方法相对应。
 6、applicationWillTerminate：在应用程序要完全推出的时候，要执行的委托调用，这个需要要设置UIApplicationExitsOnSuspend的键值。
 
 */



#pragma mark 响应者链

/*
 
 查询：
 第一响应者查询是通过：硬件捕获触摸发送给当前的应用程序，应用程序传递给代理对象，代理对象传递给window，window传递给根视图控制器，跟视图控制器传递给自己的view，view通过遍历子视图确定第一响应者。
 
 处理触摸事件：应该首先由第一响应者处理，如果处理不了则逆向传递给上一级响应，一级一级传递，知道有响应者处理或者没有任何响应者处理而结束
 
 */

//视图的userInteractionEnabled属性可以阻断响应者链，导致响应者链无法检测第一响应者而不对触摸作出处理，view默认值为yes,label和imageView默认为no

self.view.userInteractionEnabled = YES;

#pragma mark 找到第一响应者
- (UIView *)findFirstResponderBeneathView:(UIView *)view{
    for (UIView *childView in view.subviews) {
        if ([childView respondsToSelector:@selector(isFirstResponder)] && [childView isFirstResponder]) {
            return childView;
        }

        UIView *resultView = [self findFirstResponderBeneathView:childView];
        if (resultView) {
            return resultView;
        }
    }
    return nil;
}

#pragma mark UITouch

/*
 
 - (CGPoint)locationInView:(UIView *)view：函数返回一个CGPoint类型的值，表示触摸在view这个视图上的位置，这里返回的位置是针对view的坐标系的。调用时传入的view参数为空的话，返回的时触摸点在整个窗口的位置。
 - (CGPoint)previousLocationInView:(UIView *)view：该方法记录了前一个坐标值，函数返回也是一个CGPoint类型的值， 表示触摸在view这个视图上的位置，这里返回的位置是针对view的坐标系的。调用时传入的view参数为空的话，返回的时触摸点在整个窗口的位置。
 
 */


//当触摸开始可以通过此方法来处理开始触摸事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //获取当前触摸对象在指定视图中的位置
    UITouch *aTouch = touches.anyObject;
    CGPoint startPoint = [aTouch locationInView:self.superview];//locationInView 的值为nil的话表示返回触摸点在整个窗口的位置
}


//触摸在屏幕上移动时会频繁响应此方法，表示触摸正在移动
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent*)event{
    
    
    UITouch *aTouch = touches.anyObject;
    CGPoint position = [aTouch locationInView:self.superview];
    
    //计算当前点和前一个点之间的x轴y轴增量
    CGFloat dalta_x = position.x - self.startPoint.x;
    CGFloat dalta_y = position.y - self.startPoint.y;
    CGPoint currentCenter = self.center;
    currentCenter.x += dalta_x;
    currentCenter.y += dalta_y;
    //重新修改视图的中心点
    self.center = currentCenter;
    //让起始点指向当前的点（下一次移动的点跟当前点做差值）
    self.startPoint = position;
    
    
}

#pragma mark- 屏幕旋转


/***
 在屏幕旋转时候，子控件自动调整：
 
 typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
 UIViewAutoresizingNone                 = 0,不自动调整
 UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,自动调整与superView左侧距离
 UIViewAutoresizingFlexibleWidth        = 1 << 1,自动调整自身宽度，保证与superView左右不变
 UIViewAutoresizingFlexibleRightMargin  = 1 << 2,自动调整与superVew右侧距离
 UIViewAutoresizingFlexibleTopMargin    = 1 << 3,自动调整与superView顶部距离
 UIViewAutoresizingFlexibleHeight       = 1 << 4,自动调整自身高度
 UIViewAutoresizingFlexibleBottomMargin = 1 << 5,自动调整与superView底部距离
 };
 
 */

NSUInteger i = 1 << 2;//左移 * 2
NSLog(@"%lu",(unsigned long)i);

_button.autoresizingMask = 751;



#pragma mark layoutSubviews（屏幕旋转）

/*
 在layoutSubViews方法中可以处理来自视图控制器的屏幕旋转，通过判断状态栏的方向来处理子视图的位置和大小
 
 
 layoutSubviews在以下情况下会被调用：
 
 1、init初始化不会触发layoutSubviews(但是是用initWithFrame 进行初始化时，当rect的值不为CGRectZero时,也会触发
 
)
 2、addSubview会触发layoutSubviews
 3、设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化
 4、滚动一个UIScrollView会触发layoutSubviews
 5、旋转Screen会触发父UIView上的layoutSubviews事件
 6、改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件
 
 
 */


- (void)layoutSubviews{
    [super layoutSubviews];
    //NSLog(@"frame:%@ , %s",NSStringFromCGRect(self.frame),__func__);
    //NSLog(@"bounds:%@, %s",NSStringFromCGRect(self.bounds),__func__);
    
    //获取当前状态栏的方向，以此为依据对视图的子视图做重新布局
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    switch (orientation) {
            
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:self.label.frame = CGRectMake(0, 100, 90, 30);
            self.textField.frame = CGRectMake(100, 100, kScreenWidth - 110, 30);
            //NSLog(@"竖直frame:%@ , %s",NSStringFromCGRect(self.frame),__func__);
            //NSLog(@"竖直bounds:%@, %s",NSStringFromCGRect(self.bounds),__func__);
            break;
            
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
        {
                    CGRect labelFrame = self.label.frame;
                    labelFrame.origin.x += 73;
                    self.label.frame = labelFrame;
                    CGRect textFieldFrame = self.textField.frame;
                    textFieldFrame.origin.x += 73;
                    self.textField.frame = textFieldFrame;
            
            
            
            //NSLog(@"水平frame:%@ , %s",NSStringFromCGRect(self.frame),__func__);
            //NSLog(@"水平bounds:%@, %s",NSStringFromCGRect(self.bounds),__func__);
            
        }
            break;
            
        default:
            break;
    }
}


#pragma mark UISegmentedControl 分段控制器

NSArray *array = @[@"1",@"吃饭",@"睡觉",@"玩耍"];
//初始化，
UISegmentedControl *segmented = [[UISegmentedControl alloc]initWithItems:array];//初始化方法的参数是数组类型的，对应的数组对象必须是字符串类型，这些字符串作为分段的标题从左到右依次显示，所以数组元素的个数也决定了分段的个数

segmented.frame = CGRectMake((self.view.bounds.size.width - 200)/2, 30, 200, 30);

//为指定的下标设置标题
[segmented setTitle:@"好友" forSegmentAtIndex:0];

//设置选中的分段下标（默认）
//    segmented.selectedSegmentIndex = 0;
//    [self handleSegment:segmented];//自己调用一次，让让触发事件执行


//    设置颜色
segmented.tintColor = [UIColor whiteColor];
//
//    设置是否可用
//    [segmented setEnabled:NO forSegmentAtIndex:2];

//点击是否恢复原样
segmented.momentary = YES;

//是否根据内容调整宽度
segmented.apportionsSegmentWidthsByContent = NO;


//移除
//[segmented removeAllSegments ];

//设置图片(要修改图片的渲染模式)
UIImage *image = [[UIImage imageNamed:@"3.jpeg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
[segmented setImage:image forSegmentAtIndex:1];

//添加事件
[segmented addTarget:self action:@selector(handleSegment:) forControlEvents:UIControlEventValueChanged];

//segmented.center = self.view.center;
segmented.tag = 100;
[self.view addSubview:segmented];
[segmented release];


#pragma mark UISlider

UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(30, 75, 300, 5)];

//调整滑块轨道颜色
slider.minimumTrackTintColor = [UIColor blackColor];
slider.maximumTrackTintColor = [UIColor redColor];

//初值&最大最小值
slider.value = 0;
slider.minimumValue = 0;
slider.maximumValue = 1;

//值是否在滑动时改变
slider.continuous = YES;

[slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];


[self.view addSubview:slider];
[slider release];

#pragma mark UISwitch

/*
 @property(nonatomic, retain) UIColor *onTintColor NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
 @property(nonatomic, retain) UIColor *tintColor NS_AVAILABLE_IOS(6_0);
 @property(nonatomic, retain) UIColor *thumbTintColor NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;
 
 @property(nonatomic, retain) UIImage *onImage NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;
 @property(nonatomic, retain) UIImage *offImage NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;
 
 @property(nonatomic,getter=isOn) BOOL on;
 
 - (instancetype)initWithFrame:(CGRect)frame;              // This class enforces a size appropriate for the control. The frame size is ignored.
 
 - (void)setOn:(BOOL)on animated:(BOOL)animated; // does not send action
 */

UISwitch * switch1 = [[UISwitch alloc]initWithFrame:CGRectMake(187, 140, 50, 50)];

//默认开关状态
//switch1.on = YES;
[switch1 setOn:YES];

//[switch1 addTarget:self action:@selector(handleSwitch:) forControlEvents:UIControlEventValueChanged];

[self.view addSubview:switch1];
[switch1 release];



for (int i = 0; i < 3; i ++) {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    switch (i) {
        case 0:
            view.backgroundColor = [UIColor blueColor];
            break;
        case 1:
            view.backgroundColor = [UIColor greenColor];
            break;
        case 2:
            view.backgroundColor = [UIColor redColor];
            break;
        default:
            break;
    }
    view.tag = 100 + i;
    [self.view addSubview:view];
    [view release];
    
}

UISegmentedControl *segnmentControl = [[UISegmentedControl alloc]initWithItems:@[@"红色",@"绿色",@"蓝色"]];
segnmentControl.frame = CGRectMake((CGRectGetWidth(self.view.bounds)- 300) / 2, (CGRectGetHeight(self.view.bounds) - 60), 300, 40);


[segnmentControl addTarget:self action:@selector(handleSegmentControlAction:) forControlEvents:UIControlEventValueChanged];


[self.view addSubview:segnmentControl];
[segnmentControl release];



- (void)handleSegment:(UISegmentedControl *)sender{
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.view.backgroundColor = [UIColor yellowColor];
            break;
        case 1:
            self.view.backgroundColor = [UIColor grayColor];
            break;
        case 2:
            self.view.backgroundColor = [UIColor purpleColor];
            break;
        case 3:
            self.view.backgroundColor = [UIColor clearColor];
            break;
        default:
            break;
    }
}

- (void)sliderAction:(UISlider *)sender{
    //UISegmentedControl *segment = (UISegmentedControl *)[self.view viewWithTag:100];
    
    self.view.alpha = sender.value;
    //NSLog(@"%f",sender.value);
    
}



- (void)handleSegmentControlAction:(UISegmentedControl *)sender{
    //UIView *view = [self.view viewWithTag:100];
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self.view insertSubview:[self.view viewWithTag:102] belowSubview:sender];
            break;
        case 1:
            [self.view insertSubview:[self.view viewWithTag:101] belowSubview:sender];
            break;
        case 2:
            [self.view insertSubview:[self.view viewWithTag:100] belowSubview:sender];
            break;
        default:
            break;
    }
}


#pragma mark UIStepper

UIStepper *stepper = [[UIStepper alloc]initWithFrame:CGRectMake(235, 585, 100, 30)];
[stepper addTarget:self action:@selector(stepperAction:) forControlEvents:UIControlEventValueChanged];
[stepper setStepValue:10];
stepper.minimumValue = 10;
stepper.maximumValue = 400;
stepper.value = 220;
[self.view addSubview:stepper];
[stepper release];







#pragma mark- 手势识别器

#pragma mark 平移手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];

    //要作用在哪个视图上，手势识别器就添加在哪个视图上
    [imageView addGestureRecognizer:pan];
    [pan release];


- (void)handlePanGesture:(UIPanGestureRecognizer *)sender{
    
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:5644];
    注意： sender.view 就是上面通过tag值获得的view ！！！
    
    //获取平移产生的点
    CGPoint currentPoint = [sender translationInView:self.view];//返回一系列在触摸中产生的点
    
#pragma mark 获取当前的点
    locationInView:获取到的是手指点击屏幕实时的坐标点；
    translationInView：获取到的是手指移动后，在相对坐标中的偏移量
    
    //通过修改view的transform属性，让视图平移
    imageView.transform = CGAffineTransformTranslate(imageView.transform, currentPoint.x, currentPoint.y);//在上一次形变的基础上产生新的增量
    
    //重新将translation置为0
    [sender setTranslation:CGPointZero inView:self.view];
    
    
}






#pragma mark 旋转手势
    UIRotationGestureRecognizer *rotaion = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleRotaionGesture:)];

    //rotaion.delegate = self;
    [imageView addGestureRecognizer:rotaion];
    [rotaion release];

- (void)handleRotaionGesture:(UIRotationGestureRecognizer *)sender{
    
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:5644];
    
    imageView.transform =CGAffineTransformRotate(imageView.transform, sender.rotation);
    
    //设置完当前旋转形变后一定要将旋转产生的角度归零。
    sender.rotation = 0;
}








#pragma mark 捏合手势

    UIPinchGestureRecognizer *pinch =[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinthGesture:)];
    [imageView addGestureRecognizer:pinch];
    //pinch.delegate = self;
    [pinch release];

- (void)handlePinthGesture:(UIPinchGestureRecognizer *)sender{
    
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:5644];
    imageView.transform = CGAffineTransformScale(imageView.transform, sender.scale, sender.scale);
    
    //要将手势识别器的scale属性设置为1，表示当前是原始比例，下一次的缩放是以当前比例为基础缩放的
    sender.scale = 1;
    
}







#pragma mark 轻扫手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeGesture:)];

    //设置swipe轻扫的方法

#pragma mark 触发方向direction
    swipe.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;//轻扫的方向属于相同的行为可以同时支持，比如水平向左水平向右。不支持不同行为

    [self.view addGestureRecognizer:swipe];
    [swipe release];


- (void)handleSwipeGesture:(UISwipeGestureRecognizer *)sender{
    self.view.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
}







#pragma mark 轻拍手势
//创建轻拍手势 和方法
UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changViewBackGroundColor:)];
//设置点击触发次数 默认为1
tapGesture.numberOfTapsRequired = 2;//点击两次触发
//需要几个手指
tapGesture.numberOfTouchesRequired = 2;
//添加到视图
[view addGestureRecognizer:tapGesture];
[tapGesture release];


- (void)handleTapGesture:(UITapGestureRecognizer *)sender{
    self.view.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
}







#pragma mark 长按手势

    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPressGesture:)];

    [self.view addGestureRecognizer:longPress];
    [longPress release];


- (void)handleLongPressGesture:(UILongPressGestureRecognizer *)sender{
    self.view.backgroundColor = [UIColor clearColor];
}






#pragma mark 屏幕边缘轻扫

    UIScreenEdgePanGestureRecognizer *screenEdgePan = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(handleScreenEdgePanGesture:)];
    //设置从边缘轻扫的方向
    screenEdgePan.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:screenEdgePan];
    [screenEdgePan release];


- (void)handleScreenEdgePanGesture:(UIScreenEdgePanGestureRecognizer *)sender{
    UITextField *textField = (UITextField *)[self.view viewWithTag:1234];
    
    [textField resignFirstResponder];
}





#pragma mark  询问代理对象是否允许两个手势识别器同时识别自己的手势，默认为NO

// 【 1、需要遵守该协议<UIGestureRecognizerDelegate> 2、（捏合和旋转方法）指定了代理对象   3、通过该函数设置允许手势识别器同时识别】
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}







#pragma mark- UIScrollView

# TableView/CollectionView 是scrollView 的子类 （只要是scrollView的子类都可以使用它的代理方法）

contentSize  //定义内容区域大小，决定是否能够滑动
contentOffset    //内容左上角距离坐标原点的偏移量
contentInset  //内容区域相对frame上下左右从哪儿显示(内边距)

/***
 contentSize是scrollview可以滚动的区域，比如frame = (0 ,0 ,320 ,480) contentSize = (320 ,960)，代表你的scrollview可以上下滚动，滚动区域为frame大小的两倍。
 
 contentOffset是scrollview当前显示区域顶点相对于frame顶点的偏移量，比如上个例子你拉到最下面，contentoffset就是(0 ,480)，也就是y偏移了480
 
 contentInset是scrollview的contentview的顶点相对于scrollview的位置，例如你的contentInset = (0 ,100)，那么你的contentview就是从scrollview的(0 ,100)开始显示
 
 */


scrollEnabled     //判断控件是否能够滚动
directionalLockEnabled   //限定滚动方向
showsHorizontalScrollIndicator //控制是否显示水平方向的滚动条
showVerticalScrollIndicator       //控制是否显示垂直方向的滚动条
scrollsToTop      //滑动到顶部（点状态条的时候）

pagingEnabled   //是否整屏翻动
bounces           //边界是否回弹


scrollEnabled     //判断控件是否能够滚动
directionalLockEnabled   //限定滚动方向
showsHorizontalScrollIndicator //控制是否显示水平方向的滚动条
showVerticalScrollIndicator       //控制是否显示垂直方向的滚动条
scrollsToTop      //滑动到顶部（点状态条的时候）





//创建UIScrollView对象

UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
scrollView.backgroundColor = [UIColor grayColor];

scrollView.delegate = self;

//contentSize用于设定滑动区域的大小，实质上是限定scrollView可滑动的范围（超过scrollView本身大小就能滑动）
scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 5, CGRectGetHeight(scrollView.bounds) );

//控制scrollView整屏滑动(默认NO)
// scrollView.pagingEnabled = YES;

//是否显示滑动指示器(默认YES)
scrollView.showsVerticalScrollIndicator = NO;

//是否通过状态栏回到顶部(默认为YES，只对纵向有用)
scrollView.scrollsToTop = NO;

//是否使用边界回弹动画(默认YES)
scrollView.bounces = NO;

//通过设置内容区域的偏移量来控制视图的显示(默认起始位置)
//scrollView.contentOffset = CGPointMake(0, CGRectGetHeight(scrollView.bounds));
scrollView.contentOffset = CGPointMake(CGRectGetWidth(scrollView.bounds), 0);


for (int i = 0; i < 5; i ++) {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(scrollView.bounds) * i, 0, CGRectGetWidth(scrollView.bounds), CGRectGetHeight(scrollView.bounds))];
    
    label.text = [NSString stringWithFormat:@"第%d个视图", 1 + i ];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:50];
    label.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
    [scrollView addSubview:label];
    [label release];
}

[self.view addSubview:scrollView];
[scrollView release];








//创建UIPageControl对象
UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds) - 60, CGRectGetWidth(self.view.bounds), 40)];

//通过numberOfPages来设置有几个页面
pageControl.numberOfPages = 5;

//设置当前页码
pageControl.currentPage = 0;

pageControl.tag = 5644;

//为pageControl对应事件添加响应方法
[pageControl addTarget:self action:@selector(handlePageControlAction:) forControlEvents:UIControlEventValueChanged];

//pageControl.backgroundColor = [UIColor blackColor];

[self.view addSubview:pageControl];

pageControl.pageIndicatorTintColor = [UIColor yellowColor];//其它点得颜色
pageControl.currentPageIndicatorTintColor = [UIColor blueColor];//高亮点颜色



#pragma PageControl 和 scrollView 的相互关联

/**
 *  通过当前pageControl的currentPage来修改scrollView的偏移量
 */
- (void)handlePageControlAction:(UIPageControl *)sender{
//    UIScrollView *scrollView = nil;
//    for (id object in self.view.subviews) {
//        if ([object isKindOfClass:[UIScrollView class]]) {
//            scrollView = object;
//            break;
//        }
//    }
    CGPoint offset = CGPointMake(CGRectGetWidth(scrollView.bounds) * sender.currentPage, 0);
    
    //根据计算出来的偏移量来修改scrollView的偏移量
    //scrollView.contentOffset = offset;
    [scrollView setContentOffset:offset animated:YES];//修改偏移量并且有动画效果
}


/**
 * （代理方法：结束减速时触发）通过scrollView的偏移量计算currentPage
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //获取scrollView滑动结束后的偏移量
    CGPoint offSet = scrollView.contentOffset;
    
    //通过offset计算当前是第几个页面
    NSInteger index = offSet.x / CGRectGetWidth(scrollView.bounds);
    
    //访问pagecontrol，给其currentPage属性赋值
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:5644];
    pageControl.currentPage = index;
}









#pragma mark UIScrollView缩放

UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];

scrollView.delegate = self;

//设置最小缩放比例
scrollView.minimumZoomScale = 0.3;

//设置最大缩放比例
scrollView.maximumZoomScale = 5;

//设置是否使用回弹动画
scrollView.bouncesZoom = YES;


UIImage *image = [[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"81" ofType:@"jpg"]];

UIImageView *imageView = [[UIImageView alloc]initWithImage:image];

imageView.frame = CGRectMake(0, 0, 200, 200 * image.size.height / image.size.width);

imageView.tag = 1234;
imageView.center = scrollView.center;

[scrollView addSubview:imageView];

[self.view addSubview:scrollView];

[image release];
[imageView release];
[scrollView release];


}


//指定某个UIScrollView的某个子视图可以放大缩小
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    //为scrollView指定要被缩放的子视图
    UIImageView *imageView = (UIImageView *)[scrollView viewWithTag:1234];
    return imageView;
}

//scrollView在缩放时会重复响应该协议方法
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    //    NSLog(@"%@",NSStringFromCGSize(scrollView.contentSize));
    //
    //    CGFloat bounds_w = CGRectGetWidth(scrollView.bounds);//scrollView的宽
    //    CGFloat bounds_h = CGRectGetHeight(scrollView.bounds);
    //
    //    CGFloat content_w = scrollView.contentSize.width;//内容区域的宽
    //    CGFloat content_h = scrollView.contentSize.height;
    //
    //    CGFloat delta_x = bounds_w > content_w ? (bounds_w - content_w) / 2 : 0;
    //    CGFloat delta_y = bounds_h > content_h ? (bounds_h - content_h) / 2 : 0;
    //
    //
    //    //获取被缩放的imageView
    //    UIImageView *imageView = (UIImageView *)[scrollView viewWithTag:1234];
    //
    //    //在缩放的过程中实时修正imageView的中心点
    //    imageView.center = CGPointMake(content_w / 2 + delta_x, content_h / 2 + delta_y);
    
    UIImageView *imageView = (UIImageView *)[scrollView viewWithTag:1234];
    imageView.center = scrollView.center;
    
}




#pragma mark UIScrollView代理方法（滚动代理）

//在滑动的时候频繁响应
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //NSLog(@"\nbounds:%@",NSStringFromCGRect(scrollView.bounds));//通过滑动修改自身bounds来使自身的子视图移动
    //NSLog(@"\n,%s",__func__);
}

//开始拖拽时触发
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //NSLog(@"\n,%s",__func__);
}

//结束拖拽时触发
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
   // NSLog(@"\n,%s",__func__);
}

//开始减速时触发
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    //NSLog(@"\n,%s",__func__);
}


//结束减速时触发
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //获取scrollView滑动结束后的偏移量
    CGPoint offSet = scrollView.contentOffset;
    
    //通过offset计算当前是第几个页面
    NSInteger index = offSet.x / CGRectGetWidth(scrollView.bounds);
    
    //访问pagecontrol，给其currentPage属性赋值
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:5644];
    pageControl.currentPage = index;
    
}




#pragma mark- UITableView


int row = (int)self.allDataMutableArr.count - 1;
if (row < 0) {
    row = 0;
}
//让新数据插入到tableView的最后一行
NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];

[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];

//将tableView 滚动到最后一行
[self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];




/***
 
 tableView 是scrollView 的子类 可以使用scrollView 的代理方法
 
 创建
 1.初始化
 2.注册
 3.添加到
 4.代理/实现代理方法
 */

新建一个tableView 要做的两件事
//1.取消cell选中时候的背景色
[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//2.取消cell分割线
tableView.separatorStyle = UITableViewCellSeparatorStyleNone;






/***
 
 属性：
 */

//设置表视图的行高（通过属性设置的行高可以限定每一行的相同高度）
tableView.rowHeight = 60;

//设置分割线的颜色
tableView.separatorColor = [UIColor blackColor];

//分割线的样式（两种：单线，没有）
tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine ;


//获得正在显示的所有的indexPath。
NSArray *indexPaths = [_myTableView indexPathsForVisibleRows];

//设置某个视图为tableView的表头 （取消表头漂浮）
tableView.tableHeaderView = scrollView;//注意这句


//cell 选择打勾
cell.accessoryType = UITableViewCellAccessoryCheckmark;


#pragma mark 右划删除

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.names removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

//例二：必须先删除数据库 再删除数组
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        DatabaseHelper *helper = [[DatabaseHelper alloc] init];
        [helper connectDatabase:@"database.sqlite"];
        [helper executeSQL:[NSString stringWithFormat:@"delete from MyNews where title = '%@'", [self.dataArr[indexPath.row] objectForKey:@"title"]]];
        [helper closeDatabase];
        
        [self.dataArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    //[self.tableView reloadData];
    
}

//右划删除 多个选项
- (nullable NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark 编辑 移动 & 步骤
// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//下面这行语句是为当前视图控制器提供一个可以控制表视图的编辑状态的按钮，默认响应setEditing:animated:方法
self.navigationItem.rightBarButtonItem = self.editButtonItem;


//编辑 步骤2
//询问代理对象当前这一行是否可以进行编辑
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // 该协议方法时为了控制指定行是否可以编辑
    //    if (indexPath.row ==0 ) {
    //        return NO;
    //    }
    return YES;
}
//编辑 步骤3
//给进入编辑的这一行指定一个编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return UITableViewCellEditingStyleDelete;//删除
    }else if (indexPath.row == 1){
        return UITableViewCellEditingStyleInsert;//插入
    }
    return  UITableViewCellEditingStyleInsert | UITableViewCellEditingStyleDelete;
}
// 编辑 步骤4
//编辑完成 （先操作数据源，再修改UI）
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 删除操作先删除对应的数据源数组中对应行的对象，再删除对应单元格
        [self.datasource removeObjectAtIndex:indexPath.row];//1.跟新数据源（重要）
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];//2.修改UI
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        //实例
        [self.datasource addObject:@"新添加的含猪"];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
// 重载数据（刷新界面）
        //reloadData方法时用于刷新数据，保证UI界面与数据源中的数据保持一致
        [tableView performSelector:@selector(reloadData) withObject:nil afterDelay:0.5];
        [tableView reloadData];
    }
}



// 移动 步骤2
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    //通过此协议方法的返回值来限定行是否可以移动
    return YES;
}

//移动 步骤3
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    id object = [[self.datasource objectAtIndex:fromIndexPath.row]retain];
    
    //移除原下标
    [self.datasource removeObjectAtIndex:fromIndexPath.row];
    
    //把对象插入到目标下标
    [self.datasource insertObject:object atIndex:toIndexPath.row];
    
    [object release];
}

//快速索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    // 设定表视图的分区索引数组
    return @[@"今",@"天",@"是",@"个",@"好"];
}


#pragma mark 获取当前cell

//注意这些的区别
[self.collection indexPathsForSelectedItems];

self.collection.visibleCells[indexPath.row];

[self.collection cellForItemAtIndexPath:indexPath];//具体某一个

----
[self.collectionView visibleCells];//所有可见的

[self.collectionView indexPathsForVisibleItems];//可见的indexPath
[self.collectionView indexPathsForSelectedItems];//选中的



#pragma mark 文本自适应高度
//得到一段字的大小
CGSize size = [text  sizeWithAttributes:
               @{NSFontAttributeName:
                     titleLabel.font}];

//计算一段文本在限定宽高内所占矩形大小
- (CGSize)contentSize{
    CGRect rect = [self.content boundingRectWithSize:CGSizeMake(220, 20000) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    //1.字体边界 2.绘制时候 依照 字体像素大小 以及段首起始点 ，3.字体大小参照：系统15号
    return rect.size;
}

//UI-17解析 需要计算两次，第一次 cell上的label的高度 第二次 cell自己的高度
CGRect textSize = [self.desclabel.text boundingRectWithSize:CGSizeMake(340, 10000) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]} context:nil];
[self.desclabel setFrame:CGRectMake(self.desclabel.frame.origin.x, self.desclabel.frame.origin.y, 340, textSize.size.height  )];

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *text = [self.array[indexPath.row] objectForKey:@"desc"];
    
    CGRect textSize = [text boundingRectWithSize:CGSizeMake(340, 10000) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]} context:nil];
    return textSize.size.height + 20 ;
}

/*
//更解耦的方法 - AFN iOS Example
- (CGFloat)tableView:(__unused UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [PostTableViewCell heightForCellWithPost:self.posts[(NSUInteger)indexPath.row]];
}

//70.0跟计算高度取较大值
+ (CGFloat)heightForCellWithPost:(Post *)post {
    return (CGFloat)fmaxf(70.0f, (float)[self detailTextHeight:post.text] + 45.0f);
}

//自适应高度
+ (CGFloat)detailTextHeight:(NSString *)text {
    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(240.0f, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0f]} context:nil];
    return rectToFit.size.height;
}

*/


#pragma mark 图片的局部拉伸
- (UIImage *)resizedImageWithName:(NSString *)name{
    //创建一个原始图片对象
    UIImage *normalImage = [UIImage imageNamed:name];
    CGFloat fixed_x = normalImage.size.width * 0.5 - 2;
    CGFloat fixed_y = normalImage.size.height * 0.5 - 2;
    return [normalImage resizableImageWithCapInsets:UIEdgeInsetsMake(fixed_y, fixed_x, fixed_y, fixed_x)];
}


#pragma mark  键盘弹出动画

- (void)handleKeyboardShow:(NSNotification *)sender{
    //NSLog(@"%@",sender.userInfo);
    CGRect  keyboardFrame = [sender.userInfo[@"UIKeyboardFrameEndUserInfoKey"]CGRectValue];//键盘弹出最终的frame
    CGFloat delta_y = keyboardFrame.origin.y - self.view.bounds.size.height;
    [UIView animateWithDuration:0.25 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, delta_y);}];
    
}

#pragma mark 视图滑动到底部
//让视图自动滑动到底部（每发送一个消息都让聊天界面滑下来）
[self.tableView scrollToRowAtIndexPath: [NSIndexPath indexPathForRow:self.datasource.count - 1 inSection:0]atScrollPosition:UITableViewScrollPositionBottom animated:YES];


#pragma mark 新数据插入到tableView && 滚动
- (void)rowsScroll{
    int row = (int)self.allDataMutableArr.count - 1;
    if (row < 0) {
        row = 0;
    }
    //让新数据插入到tableView的最后一行
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
    //将tableView 滚动到最后一行
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    
    /**
     
     [self rowsScroll]; //这个方法和reloadData 不同时存在
     
     
     [[self tableView] reloadData];
     [[self tableView] performSelector:@selector(reloadData) withObject:nil afterDelay:0.3];
     
     **/
    
}








#pragma mark- UICollectionView

/***
 
 继承自scrollView
 
 1.创建FlowLayout，并设置相关参数
 2.初始化collectionView
 3.设置代理方法，并实现
 4.添加
 */

//0.FlowLayout 布局使用
UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];

//这里的设置是统一设置，每个设置都可以使用代理

//设置每个item的大小
[layout setItemSize:CGSizeMake(50, 50)];

//设置行间距
[layout setMinimumLineSpacing:10];

//设置列间距
[layout setMinimumInteritemSpacing:10];

//seciton(内)边距
[layout setSectionInset:UIEdgeInsetsMake(30, 90, 30, 90)];

//当数据不多，collectionView.contentSize小于collectionView.frame.size的时候，UICollectionView是不会滚动的
self.Cov.alwaysBounceVertical = YES;


// 选择一个 （并且滚动  到）
[self.collection selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionTop];

滚动到下一页
/*
 
 
 //1）获取位置
 NSIndexPath *currentIndexPath=[[self.collectionView indexPathsForVisibleItems]lastObject];
 
 　  //2）计算出下一个需要展示的位置
 NSInteger nextItem=currentIndexPath.item+1;
 NSInteger nextSection=currentIndexPath.section;
 //        if (nextItem==self.news.count) {
 //                 nextItem=0;
 //                 nextSection++;
 //             }
 NSIndexPath *nextIndexPath=[NSIndexPath indexPathForItem:nextItem inSection:nextSection];
 
 　　//3）通过动画滚动到下一个位置
 [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];

 
 */



// ** scrollDirection属性
 //设定滚动方向，有UICollectionViewScrollDirectionVertical和UICollectionViewScrollDirectionHorizontal两个值。
 
 //** headerReferenceSize属性与footerReferenceSize属性
 //设定页眉和页脚的全局尺寸，需要注意的是，根据滚动方向不同，header和footer的width和height中只有一个会起作用。如果要单独设置指定区内的页面和页脚尺寸，可以使用下面方法：
 
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
 
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
 
 
 //** sectionInset属性
 
 //** 设定全局的区内边距，如果想要设定指定区的内边距，可以使用下面方法：
 
 - (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
 
 //然后需要实现三种类型的委托：UICollectionViewDataSource, UICollectionViewDelagate和UICollectionViewDelegateFlowLayout。
 
 
 
// ** UICollectionViewDataSource

// 返回collection view里区(section)的个数，如果没有实现该方法，将默认返回1：
 
 - (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
 {
 return 2;
 }

 //返回指定区(section)包含的数据源条目数(number of items)，该方法必须实现：
 
 - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
 {
 return 7;
 }

 //返回某个indexPath对应的cell，该方法必须实现：
 - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
 {
 UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
 if(indexPath.section==0)
 {
 cell.backgroundColor = [UIColor redColor];
 }
 else if(indexPath.section==1)
 {
 cell.backgroundColor = [UIColor greenColor];
 }
 return cell;
 }


/**
 *UICollectionViewCell结构上相对比较简单，由下至上：
 
  首先是cell本身作为容器view
  然后是一个大小自动适应整个cell的backgroundView，用作cell平时的背景
  再其次是selectedBackgroundView，是cell被选中时的背景
  最后是一个contentView，自定义内容应被加在这个view上

 */

 - (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 
 为collection view添加一个补充视图(页眉或页脚)

 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
 
 设定页眉的尺寸
 
 
 
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
 
 设定页脚的尺寸
 
 
 
 - (void)registerClass:(Class)viewClass forSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier
 
 添加页眉和页脚以前需要注册类和标识：
 
 
 
 添加补充视图的代码示例：
 

 [self.myCollectionView registerClass:[MyHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"hxwHeader"];
 [self.myCollectionView registerClass:[MyHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"hxwHeader"];
 
 -(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
 {
 CGSize size = {240,25};
 return size;
 }
 
 -(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
 {
 CGSize size = {240,25};
 return size;
 }
 
 - (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 MyHeadView *headView;
 
 if([kind isEqual:UICollectionElementKindSectionHeader])
 {
 headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"hxwHeader" forIndexPath:indexPath];
 [headView setLabelText:[NSString stringWithFormat:@"section %d's header",indexPath.section]];
 }
 else if([kind isEqual:UICollectionElementKindSectionFooter])
 {
 headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"hxwHeader" forIndexPath:indexPath];
 [headView setLabelText:[NSString stringWithFormat:@"section %d's footer",indexPath.section]];
 }
 return headView;
 }
 
 
 

 
 
 //在注册Cell和补充视图时，也可以用新建xib文件的方式：
 [self.myCollectionView registerNib:[UINib nibWithNibName:@"MyCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"hxwCell"];
 
 [self.myCollectionView registerNib:[UINib nibWithNibName:@"MySupplementaryView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"hxwHeader"];
 
 [self.myCollectionView registerNib:[UINib nibWithNibName:@"MySupplementaryView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"hxwFooter"];
 
 //用这种方式注册后，甚至可以不用新建类去绑定这个xib，直接通过viewWithTag的方式获取xib里的控件：
 
 UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind withReuseIdentifier:@"hxwHeader" forIndexPath:indexPath];
 
 UILabel *label = (UILabel *)[view viewWithTag:1];
 
 label.text = @"empty";
 
 
 
 
 //*********- UICollectionViewDelegateFlowLayout -*********

 //设定指定Cell的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0 && indexPath.row==1)
    {
        return CGSizeMake(50, 50);
    }
    else
    {
        return CGSizeMake(75, 30);
    }
 }

 

 //设定collectionView(指定区)的边距

 
 - (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;

// 设定collectionView(指定区)的边距

 - (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
 {
 if(section==0)
 {
 return UIEdgeInsetsMake(35, 25, 15, 25);
 }
 else
 {
 return UIEdgeInsetsMake(15, 15, 15, 15);
 }
 }

 
 

  //设定指定区内Cell的最小行距，也可以直接设置UICollectionViewFlowLayout的minimumLineSpacing属性
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
 {
 if(section==0)
 {
 return 10.0;
 }
 else
 {
 return 20.0;
 }
 }

 
 //设定指定区内Cell的最小间距，也可以直接设置UICollectionViewFlowLayout的minimumInteritemSpacing属性

 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
 {
 if(section==0)
 {
 return 10.0;
 }
 else
 {
 return 20.0;
 }
 }

 
 
 //************* UICollectionViewDelegate ***************

 //当指定indexPath处的item被选择时触发
 
 - (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
 {
 [self.myArray removeObjectAtIndex:indexPath.row];
 
 [collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
 }
 P.s. 当你删除或添加元素时，一定要更新numberOfItemsInSection的返回情况。
 
 
 //当指定indexPath处的item被取消选择时触发，仅在允许多选时被调用
 - (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
 

 //下面是三个和高亮有关的方法：
 
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
 
 - (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
 
 - (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
 
 
 
 //事件的处理顺序如下：
 
 //手指按下
 shouldHighlightItemAtIndexPath (如果返回YES则向下执行，否则执行到这里为止)
 didHighlightItemAtIndexPath (高亮)
 //手指松开
 didUnhighlightItemAtIndexPath (取消高亮)
 shouldSelectItemAtIndexPath (如果返回YES则向下执行，否则执行到这里为止)
 didSelectItemAtIndexPath (执行选择事件)
 //如果只是简单实现点击后cell改变显示状态，只需要在cellForItemAtIndexPath方法里返回cell时，指定cell的selectedBackgroundView：
 

 - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
 {
 UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
 
 UIView* selectedBGView = [[UIView alloc] initWithFrame:cell.bounds];
 selectedBGView.backgroundColor = [UIColor blueColor];
 cell.selectedBackgroundView = selectedBGView;
 
 return cell;
 }

 //如果要实现点击时(手指未松开)的显示状态与点击后(手指松开)的显示状态，则需要通过上面提到的方法来实现：
 

 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
 {
 return YES;
 }
 
 - (void)collectionView:(UICollectionView *)colView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
 {
 UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
 
 [cell setBackgroundColor:[UIColor purpleColor]];
 }
 
 - (void)collectionView:(UICollectionView *)colView  didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
 {
 UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
 
 [cell setBackgroundColor:[UIColor yellowColor]];
 }


/****************************/

//1.初始化collectionView
UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];

//2.设置代理方法
collectionView.delegate = self;
collectionView.dataSource = self;

//3.添加
[collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"item"];
collectionView.backgroundColor = [UIColor whiteColor];
[self.view addSubview:collectionView];


#pragma mark 相关代理

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    CGSize a = CGSizeMake(20, 20);
    return a;
}


//每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.item == 2) {
        return CGSizeMake(40, 40);
    }
    
    return CGSizeMake(50, 50);
    
}

//是否选中
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"%ld",indexPath.item);
}

//最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

//内边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(-50, 0, -5, 0);
}






#pragma mark-  TabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.初始化需要添加的视图控制器ViewController
    MainViewController *first = [[MainViewController alloc]init];
    SecondViewController *second = [[SecondViewController alloc]init];
    
    //2.添加到导航控制器
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:first];
    UINavigationController *navi2 = [[UINavigationController alloc]initWithRootViewController:second];
    
    //3.将navi作为tabbarController的子viewController
    [self setViewControllers:@[navi,navi2] animated:YES];//错误 self.tabBarController ,注意
    //这样也行 -- [self addChildViewController:navi];
    
    //4.设置标题和图片
    navi.tabBarItem.title = @"first";
    navi2.tabBarItem.title = @"second";
    
    
    navi.tabBarItem.image = [UIImage imageNamed:@"2"];//imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navi2.tabBarItem.image= [[UIImage imageNamed:@"2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //改变item的选中之后的颜色
    self.tabBar.tintColor = [UIColor redColor];
    //改变tabbar的显色显示
    [self.tabBar setBarTintColor:[UIColor yellowColor]];
}

//设置tabBarController子viewController
//[TabBarC setViewControllers:@[navi,navi2]];
[TabBarC setViewControllers:@[navi,navi2] animated:YES];
//设置子viewController的tabBarItem
navi.tabBarItem.title = @"first";
navi.tabBarItem.image = [[UIImage imageNamed:@"2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];

navi2.tabBarItem.title = @"second";
navi2.tabBarItem.image = [[UIImage imageNamed:@"2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

//设置tabBar 的默认值（注意这句的位置）
TabBarC.selectedIndex = 1;//()



//初始化tabBarController
TabBarController  *tabBar = [[TabBarController alloc]init];

tabBar.delegate = self;


//注意一下这两句的区别
//[self setViewControllers:@[moveieVC,ActivityVC,cinemaVC,userVC]];
[self setViewControllers:@[activityNav,moveieNav,cinemaNav,userNav]];

activityNav.tabBarItem.title = @"活动";
moveieNav.tabBarItem.title = @"电影";

//半透明属性
activityNav.navigationBar.translucent = YES;

activityNav.tabBarItem.image = [UIImage imageNamed:@"activity"];
moveieNav.tabBarItem.image = [UIImage imageNamed:@"movie"];


#pragma mark tabBar代理
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    //NSLog(@"%@",viewController);
}



- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
   // NSLog(@"%@",viewController);
    return YES;
}


#pragma mark  UINavigationController 导航控制器
//如果需要多视图控制器开发，就应该将多视图控制器作为window的根视图控制器
MainViewController *mainVC = [[MainViewController alloc]init];

//创建导航控制器对象，并将mainVC作为导航控制器的根视图控制器(在创建的时候指定一个)
UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:mainVC];

//将导航控制器指定为window的跟视图控制器
self.window.rootViewController = navi;



#pragma mark  NavigationBar 导航条

//注意：
self.navigationController.navigationItem.title = @"d";//这个是错的 赋不上值
self.navigationItem.title = @"通讯录";

navi.navigationBar.barTintColor = [UIColor blueColor];//导航条表面颜色
navi.navigationBar.tintColor = [UIColor whiteColor];//依赖导航条的系统样式控件的颜色

//自动布局
self.automaticallyAdjustsScrollViewInsets = NO;

//导航栏透明
[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];

//去掉导航栏下的线
self.navigationController.navigationBar.shadowImage = [UIImage new];

//为导航条设置背景图片
[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"5"] forBarMetrics:UIBarMetricsCompactPrompt];
//导航条的半透明属性
self.navigationController.navigationBar.translucent = YES;
/***
 共四种样式
 UIBarMetricsCompact 透明(简洁)   --  设置这个属性 去不掉shadowImage
 UIBarMetricsDefault 默认
 */



#pragma mark 导航栏标题
self.navigationItem.title = @"";//不赋值的话默认Back,赋空值为 <

UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
label.text = @"设置";

self.navigationItem.titleView = label;



#pragma mark 导航条左/右按钮

UIBarButtonItem *rigtBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:nil];

UIBarButtonItem *secondRightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:nil];

self.navigationItem.rightBarButtonItems =@[ rigtBarButtonItem,secondRightBarButton ];

UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:nil];
self.navigationItem.leftBarButtonItem = leftBarButton;

//（技巧）当自定义左按钮时，会导致屏幕边缘平移返回上一级视图失效，如下代码可以激活返回手势（技巧）
self.navigationController.interactivePopGestureRecognizer.delegate = self;



/*
 initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target action:(SEL)action;  --用系统样式初始化
 initWithCustomView:(UIView *)customView;  --把已定义好的视图对象作为参数封装成UIBarButtonItem显示
 initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action;  --自定义标题
 initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action;  --用图片样式
 initWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style target:(id) --用横屏下图片样式
 
 
 UIBarButtonSystemItemDone,  --Done
 UIBarButtonSystemItemCancel, --Cancel
 UIBarButtonSystemItemEdit,   --Edit
 UIBarButtonSystemItemSave,  --Save
 UIBarButtonSystemItemAdd,    --加号
 UIBarButtonSystemItemFlexibleSpace,  --
 UIBarButtonSystemItemFixedSpace,  --
 UIBarButtonSystemItemCompose,   --记事本样式
 UIBarButtonSystemItemReply,   --返回箭头
 UIBarButtonSystemItemAction,  --分享样式
 UIBarButtonSystemItemOrganize,  --文件夹样式
 UIBarButtonSystemItemBookmarks,  --书本样式（打开）
 UIBarButtonSystemItemSearch,  --放大镜样式
 UIBarButtonSystemItemRefresh, --刷新
 UIBarButtonSystemItemStop,  --停止X
 UIBarButtonSystemItemCamera, --相机
 UIBarButtonSystemItemTrash, --删除（垃圾桶）
 UIBarButtonSystemItemPlay,  --播放
 UIBarButtonSystemItemPause, --暂停
 UIBarButtonSystemItemRewind, --快退
 UIBarButtonSystemItemFastForward, --快进
 
 */



#pragma mark 视图切换

//出栈
- (void)handleButtonAction:(UIButton *)sender{
    
    //点击按钮出栈撤销对应的视图控制器
    
    
    //方法1、撤销当前显示的视图控制器，返回到上一级视图控制器
    //[self.navigationController popViewControllerAnimated:YES];
    
    //方法2、直接回到根视图控制器
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
    //方法3、回到指定视图控制器
    
    //    NSLog(@"%@",self.navigationController.viewControllers);//打印根视图控制器的所有子视图控制器
    //
    //    [self.navigationController popToViewController:self.navigationController.viewControllers.firstObject animated:YES];
    
    HanPigViewController *hanPig = [[HanPigViewController alloc ]init ];
    [self.navigationController pushViewController:hanPig animated:YES];
    [hanPig release];
    
}

//入栈
- (void)handleButtonAction:(UIButton *)sender{
    
    //创建DetailViewController对象
    DetailViewController *detailVc = [[DetailViewController alloc]init];
    
    //让导航控制器调用PUSH方法 入栈显示新的视图控制器 detailVC
    //视图控制器拥有一个navigationController属性，一旦该视图控制器被导航控制器管理时，可以通过该属性获得对应导航控制器
    [self.navigationController pushViewController:detailVc animated:YES];
    
    //自己创建的视图控制器，需要自己释放
    [detailVc release];
    
}

#pragma mark 模态
-(void)handleAddAction: (UIBarButtonItem *)sender{
    
    AddAddressController *addAddressVC = [[AddAddressController alloc]init];
    //创建导航控制器，将新建联系人控制器作为根
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:addAddressVC];
    
    //模态视图控制器添加过度效果(默认：纵向覆盖，即从下往上)
    //navi.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;//水平翻转
    //navi.modalTransitionStyle = UIModalTransitionStylePartialCurl;//卷帘
    //navi.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;//渐渐地
    
    //使用模态显示新建联系人控制器
    [self presentViewController:navi animated:YES completion:nil];//允许一个视图控制器显示另外一个视图控制器（不会产生层级关系 可以在任何地方出现 ）
    [addAddressVC release];
    [navi release];
    
}

- (void)hanleCancelAction:(UIBarButtonItem *)sender{
    //模态撤销视图
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}







#pragma mark- 界面传值

/*
 
 ---- 属性传值 ----
 (前一个内部创建的时候 给定数据，通过属性传递)
 
 注意：从前往后的时候ViewDidLoad被提前调用（如果遇到，需要大断点）
 
 1.哪个对象需要值，则声明值
 @property (nonatomic, retain) NSString *passString;
 
 2.属性传值(触发事件中写)

 DateilViewController *dateVC = [[DateilViewController alloc]init];
 
 [self.navigationController pushViewController:dateVC animated:YES];
 
 UILabel *label = (UILabel *)[self.view viewWithTag:1234];
 //属性传值
 dateVC.passString = label.text;
 
 //给block属性赋值
 dateVC.passValueBlock =^(NSString *text){
 label.text = text;
 };
 
 dateVC.delegate = self;
 [dateVC release];

 
 3.使用属性传值得到的数据
 textField.text = self.passString; - (void)viewDidLoad（展现的时候写）
 
 
 
 ---- 代理传值 ----
 回传数据，使用代理，（第二个委托方）
 
 1.（委托方）定义协议，声明代理方法，声明
 @protocol DateilDetegate <NSObject>//定义协议
 
 - (void)viewController:(DateilViewController *)viewController
 didFinishEditingWithText:(NSString *)text;
 
 @end
 
 @property (nonatomic,assign)id<DateilDetegate> delegate;
 
 
 2.
 if (self.delegate && [self.delegate respondsToSelector:@selector(viewController:didFinishEditingWithText:)]) {
 [self.delegate viewController:self didFinishEditingWithText:textFeild.text];
 }
 
 
 3.指定代理对象
 dateVC.delegate = self;
 
 4.实现方法
 - (void)viewController:(DateilViewController *)viewController didFinishEditingWithText:(NSString *)text{
 UILabel *lable = (UILabel *)[self.view viewWithTag:1234];
 
 lable.text = text;
 
 }
 
 
 ---- block传值 ----
 
 1.声明block函数(变量) 注意 block作为属性 是copy
 @property (nonatomic, copy) void(^passValueBlock)(NSString *);
 
 2.给block属性赋值(跳转事件触发时)
 dateVC.passValueBlock =^(NSString *text){
 label.text = text;
 };
 
 3.通过block传值(返回事件触发时)
 self.passValueBlock(textFeild.text);
 */

Block类型定义：返回值类型(^ 变量名)(参数列表)（注意Block也是一种类型）；
Block的typedef定义：返回值类型(^类型名称)(参数列表)；
Block的实现：^(参数列表){操作主体}；
Block中可以读取块外面定义的变量但是不能修改，如果要修改那么这个变量必须声明_block修饰；

#pragma mark 通知中心


/***
 
 传值 - 由后向前
 
 1.添加一个通知中心
 2.给这个通知中心添加观察
 3.实现这个通知中心的回调方法
 */



- (void)handleButtonAction:(UIButton *)sender{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter ];
    
    //1.
    //参数：post name 通知中心的名称 -- object:发送通知时要给别人的信息（参数）
    [notificationCenter postNotificationName:@"firstVCDisplay" object:_textField.text];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


/***
 2.
 observer:观察者（想要监听通知中心所发信息的类）
 selector 当有广播的时候出发回调方法，参数为 （NSNotification *）
 name 你所监听的广播信息的名称
 object 通常赋值为nil就可以
 
 */
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(displaySecond:) name:@"firstVCDisplay" object:nil];




//3.回调方法
- (void)displaySecond:(NSNotification *)notification{
    //通过notification得到刚才发送通知信息时候所要传递的信息（发送通知时的参数object）
    NSString *str = (NSString *)notification.object;
    [_label setText:str];
    
    //    //移除所有广播的观察者
    //    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //
    //    //移除单条
    //    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"firstVCDisplay" object:nil];
    
}


#pragma mark KVO

/****/

/***
 给person增加观察者
 observer观察者，用来随时监听person类中name属性的变化
 keyPath:被观察者的属性
 optionsNew:当name值发生变化时调用回调方法
 context:上下文，在这里常作为传值使用
 */
[_person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];//走set方法，就会触发回调


/***
 kvo的回调方法 『只要执行被观察者的set方法，回调方法就会执行』
 keyPath:被观察者的属性名
 object:被观察的类
 change:该字典中保存的是被观察的属性值
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    //取出该被观察属性的新值
    if ([keyPath isEqualToString:@"name"]) {
        NSString *newNameStr = [change objectForKey:NSKeyValueChangeNewKey ];
        NSString *oldNameStr = [change objectForKey:NSKeyValueChangeOldKey];
        NSLog(@"%@",oldNameStr);
        NSLog(@"%@",newNameStr);
        [self.view setBackgroundColor:[self randomColor]];
    }
}









#pragma mark- 数据持久化

#pragma mark 沙盒
//沙盒在iOS系统中是由一个随机编号（UUID）命名的文件夹描述的
NSString *sandboxPath = NSHomeDirectory();//获取主沙盒路径
//NSLog(@"sandbox path :%@",sandboxPath);

//获取沙盒目录下临时文件夹tmp的路径
NSString *tmpPath = NSTemporaryDirectory();
//NSLog(@"tmp path:%@",tmpPath);

//获取Docment文件夹路径(文件夹,检索域.搜索的范围,绝对路径)
NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
NSString *documentPath = paths.firstObject;
//NSLog(@"document path %@",documentPath);

//获取library文件夹路径
NSArray *lar = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
NSString *library = lar.firstObject;
//NSLog(@"%@",library);

#pragma mark    读取     写入
NSString    initWithContentsOfFile:encoding:error:  writeToFile:atomically:encoding:error
NSDictionary    initWithContentsOfFile      writeToFile:atomically
NSArray     initWithContentsOfFile          writeToFile:atomically
NSData      initWithContentsOfFile          writeToFile:atomically

/**例子**/
NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
NSString *dicFilePath = [documentPath stringByAppendingPathComponent:@"dic.plist"];
[valueDic writeToFile:dicFilePath atomically:YES];//写入
//NSLog(@"%@",dicFilePath);

NSDictionary *tempDic = [[NSDictionary alloc]initWithContentsOfFile:dicFilePath];//读取
//NSLog(@"____%@",tempDic);



#pragma mark 将字符串对象写入文本文件中

//1.构造文件路径
NSString *stringFilePath = [documentPath stringByAppendingPathComponent:@"content.txt"];
//NSLog(@"%@",stringFilePath);
//2.要写入的对象
NSString *textString = @"this is a beautiful world";
//3.（通过字符串的写入文件的方法）将字符串保存在指定文件中（要写入文件的路径，原子特性,编码格式,错误信息）
[textString writeToFile:stringFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];

#pragma mark 数组对象写入文件的方式
NSString * arrayFilePath = [documentPath stringByAppendingPathComponent:@"array.plist"];
//NSLog(@"%@",arrayFilePath);
NSArray * array = @[@"少壮不努力",@"老大送快递"];

[array writeToFile:arrayFilePath atomically:YES];

#pragma mark 字典对象写入文件

NSString *dicFilePath = [documentPath stringByAppendingPathComponent:@"dic.plist"];
//NSLog(@"%@",dicFilePath);
NSDictionary *dic = @{@"key1":@"value1",@"key2":@"value2"};
[dic writeToFile:dicFilePath atomically:YES];


#pragma mark 二进制对象写入文件
UIImage *image = [UIImage imageNamed:@"2"];
NSData *data = UIImageJPEGRepresentation(image, 0.1);
//UIImagePNGRepresentation(<#UIImage *image#>)
NSString *dataFielPath = [documentPath stringByAppendingPathComponent:@"data.jpg"];
//将NSData类型的数据写入对应文件中
[data writeToFile:dataFielPath atomically:YES];


#pragma mark 复杂对象写入文件

/***
 1.先遵守协议<NSCoding>//一个自定义类的对象要进行持久化操作时，需要对应类遵守NSCoding协议并实现编码和解码协议方法
 2.实现编码和解码方法
 //编码协议
 - (void)encodeWithCoder:(NSCoder *)aCoder{
 [aCoder encodeObject:self.name forKey:@"name"];//编码的时候key可以随意定义，解码的时候必须一致（最好使用宏定义）
 [aCoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
 [aCoder encodeObject:self.add forKey:@"add"];
 NSLog(@"%s",__func__);
 }
 
 //解码协议
 - (id)initWithCoder:(NSCoder *)aDecoder{
 self = [super init];
 if (self) {
 self.name = [aDecoder decodeObjectForKey:@"name"];
 self.phoneNumber = [aDecoder decodeObjectForKey:@"phoneNumber"];
 self.add = [aDecoder decodeObjectForKey:@"add"];
 }
 NSLog(@"%s",__func__);
 return self;
 }
 3.
 NSString *personFilePath = [documentPath stringByAppendingString:@"person.plist"];
 //系统提供的归档类完成对自定义类对象或者保存自定义类对象的容器进行归档
 [NSKeyedArchiver archiveRootObject:persons toFile:personFilePath];
 
 //使用反归档类对已知归档文件做反归档操作
 NSArray *resultArray = [NSKeyedUnarchiver unarchiveObjectWithFile:personFilePath];
 */






#pragma mark SQL语句
/***
 
 
create table if not exists UserInfo (u_id integer primary key,u_name text,u_age integer,u_gender text);
insert into UserInfo (u_id,u_name,u_age,u_gender) values (1000,"zhouqiang",25,"男");/插入/
update UserInfo set u_name = "Leo",u_age = 18 where u_id = 1000;/更新/
select * from UserInfo;/查询/
select * from UserInfo where u_id = 1000;
select u_name from UserInfo where u_id = 1000;
select * from UserInfo where u_age > 12 and u_age < 100;
select * from UserInfo where u_name like "L%%";/模糊查询/
delete from UserInfo where u_name like "%%l%%";/删除/

 
 */

#pragma mark SQLite

/***
 
 //1.创建helper对象
 DatabaseHelper *helper = [DatabaseHelper shareHelper];
 //2.打开数据库
 [helper connectDatabase:@"database.sqlite"];
 
 //3.执行sql语句
 [helper execuateSQL:@"create table if not exists UserInfo(u_id integer primary key, u_name text,u_age integer,u_gender text)"];
 
 //4.执行插入操作
 [helper execuateSQL:@"insert into UserInfo(u_id,u_name,u_age,u_gender) values (100,'Duck',18,'男')"];
 [helper execuateSQL:@"insert into UserInfo(u_id,u_name,u_age,u_gender) values (101,'Leo',28,'男')"];
 [helper execuateSQL:@"insert into UserInfo(u_id,u_name,u_age,u_gender) values (102,'hanPig',19,'女')"];
 
 //带参数输入的
 [helper execuateSQL:[NSString stringWithFormat:@"update AddressInfo set address_name = '%@',address_phone = '%@',address_avatar = '%@' where address_id = %ld",name,phone,[UIImageJPEGRepresentation(avatar, 0.2) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength],self.model.address_id]];
 
 
 //删除
 [helper execuateSQL:@"delete from UserInfo where u_name = 'Leo'"];
 
 //改
 [helper execuateSQL:@"update UserInfo set u_age = 1000 where u_id = 100"];
 
 //查
 NSArray *array =  [helper execuateQuerySQL:@"select * from UserInfo"];
 NSLog(@"%@",array);
 
 //关闭数据库
 [helper closeDatabase];
 
 
 */



#pragma mark coreData

步骤：
/***
 1.新建时候选中coredata
 2.在.xcdatamodeld 里面建表（即实体 .xcdatamodeld在编译阶段，后缀名会编译为mimd）「Attribute 建立字段、字段类型  relationship 建立表关联」
 3.
 
 
*/

AppDelegata.h中属性的含义：
/***
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;//被管理对象的上下文，相当于临时数据库
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;//被管理者的模型，在里面有表结构。如果是多表的话，还有表关系
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;//持久化数据助理，通过NSPersistentStore从底层取得数据，并转换为对象类型，以供context操作

- (void)saveContext;//用来同步上下文的更改到本地数据库
- (NSURL *)applicationDocumentsDirectory;//沙盒路径，本地数据库存放的地址

 
 
.m中：
 #pragma mark 程序中断 
 abort();
 在程序调试阶段可以使用，在正式阶段应该去掉这句
*/



//得到appdelegate类
- (AppDelegate *)appDelegate{
    return [UIApplication sharedApplication].delegate;
}

//得到上下文（临时数据库）
- (NSManagedObjectContext *)context{
    return [[self appDelegate] managedObjectContext];
}



#pragma mark 查询
- (void)fetchData{
    
    /***
     查询4步
     1.
     
     
     */
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"LanOuClass" inManagedObjectContext:[self context]];
    [fetchRequest setEntity:entity];
    //    // Specify criteria for filtering which objects to fetch
    //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"<#format string#>", <#arguments#>];
    //    [fetchRequest setPredicate:predicate];
    //    // Specify how the fetched objects should be sorted
    //    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"stuName"
    //                                                                   ascending:YES];
    //    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [[self context] executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects && fetchedObjects.count) {
        [self.allDataMutableArr setArray:fetchedObjects ];
    }
}


- (void)fecthStudents{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"LanOuStudent" inManagedObjectContext:[self context]];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"lanOuClass == %@", self.currentClass];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted 按年龄排序
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"stuAge"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [[self context] executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects  && fetchedObjects.count) {
        [self.dataSource setArray:fetchedObjects];
    }
    
    [self.tableView reloadData];
}




#pragma mark 增加
- (void)addData{
    //将对象插入临时数据库中(通过实体描述，具象化一个该实体中的对象，insertIntoManagedObjectContext 是将该对象插入到临时数据库中「插入的是占位符」)
    LanOuClass *lanouClass = [[LanOuClass alloc]initWithEntity:[self entity] insertIntoManagedObjectContext:[self context]];
    
    //给已经插入的对象进行初次赋值
    lanouClass.lanouClassName = @"大西安一班";
    lanouClass.classCity = @"西安";
    lanouClass.classNO = [NSNumber numberWithInt:1];
    
    //同步
    [[self appDelegate] saveContext];
    
    
    //假装已经成功（增加用户体验）
    //[self.allDataMutableArray addObject:lanouClass];
    
}


#pragma mark 增加-多表
- (void)addData{
    LanOuClass *lanouClass = [NSEntityDescription insertNewObjectForEntityForName:@"LanOuClass" inManagedObjectContext:[self context]];
    //LanOuClass *textClass = [self entity];
    
    lanouClass.classCity = @"西安";
    lanouClass.classNumber = [NSNumber numberWithInt:1];
    lanouClass.lanOuClassName = @"First Class";
    
    
    for (int i = 0; i < 8 ; i ++) {
        
        LanOuStudent *student = [NSEntityDescription insertNewObjectForEntityForName:@"LanOuStudent" inManagedObjectContext:[self context]];
        student.stuName = [NSString stringWithFormat:@"name%d",i];
        student.stuAge = [NSNumber numberWithInt:arc4random() % 29] ;
        student.stuGender = @"男";
        
        //将当前的学生和班级创建关联「重点句」
        [lanouClass addStudentObject:student];
        
        //同步
        NSError *error;
        [[self context] save: &error];
        if (!error) {
            
        }
        //同步2;
        //[[self appDelegate] saveContext];
        
        
        [self.allDataMutableArr addObject:student];//
        //[self rowsScroll];
    }
}





#pragma mark 删除
- (void)deleteData:(LanOuClass *)sender{
    [[self context] deleteObject:sender];
    [[self appDelegate] saveContext];
}


//tableView上删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self deleteData:self.allDataMutableArr[indexPath.row]];
        [[self allDataMutableArr] removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
    }
}


#pragma mark 更新
- (void)updateWithIndex:(int)index{
    LanOuClass *class = [self.allDataMutableArray objectAtIndex:index];
    class.classCity = @"上海";
    [[self appDelegate] saveContext];
}



    











#pragma mark- 解析 - 所有的数据都需要进行空判断

所有的数据都需要进行空判断

/*
 本地解析：
 json 解析
 xml 解析  ① sax (它逐行扫描文档，一边扫描一边解析。) ②dom(一层一层剥)
 
*/

//json
NSString *jsonPath = [[NSBundle mainBundle]pathForResource:@"ActivityList" ofType:@"txt"];
NSData *data = [[NSData alloc]initWithContentsOfFile:jsonPath];

NSDictionary * jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//NSLog(@"%@",jsonDic);






#pragma mark 网络解析
/***
 1.NSUrl 『需要网址』(方法：urlWithString)
 2.NSURLResquest/NSMutableURLRequest(都是get请求)『需要请求』
    a.方法：requestWithUrl初始化
    b.NSMutableURLRequest:可以设置请求方法(常用请求方式有两种get,POST,默认是get)设置请求方式的方法：sethttpmethod:(参数 为@"GET"或@"POST")
    如果是post请求，还需要设置参数，方法为 setHTTPbody:(参数为data类型，先把str转为data,方法为：dataUsingEncoding)
 3.NSURLConnection(负责将请求发送到服务端，并接收服务端的响应）
 
    异步请求的两种初始化方法：
    a.代理 [NSURLConnection connectionWithRequest:mutableRequest delegate:self]
    遵循的协议：<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
    b.block回调 
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];(队列)
    [NSURLConnection sendAsynchronousRequest:mutableRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {（有三个参数，其中data为返回的数据）
    //解析
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",jsonDic);
    刷新数据：reloaddata;要写在block里面
    }];
 
    同步请求:
    NSError *error;
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
 
    同步请求回来的数据，就是上面同步初始化方法的返回值
 
 4.『相关』
    get和post是请求方式，是通过request设置的
    同步请求还是异步请求是通过connection设置的
 
 */


#pragma mark 字典-model

//键值对不匹配： this class is not key value coding-compliant for the key xxxx.'
NSDictionary * dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"Qiang",@"name",@"23",@"age",@"男",@"sex", @"蓝田县",@"地址",nil];

Person *aPerson = [[Person alloc]init];
[aPerson setValuesForKeysWithDictionary:dic];



//处理字典转换为model类时候键值对不匹配（类中写）

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    //NSLog(@"%@:%@",key,value);
    
    if ([key isEqual:@"id"]) {
        self.myId = value;
    }
    
}

#pragma mark 单例
+(id)shareSingleton{
    //和线程锁功能类似（nslock）
    //NSLock
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        if (singleton == nil) {
            singleton = [[Singleton alloc]init];
        }
        
    });
    
    return singleton;
}


+(instancetype)shareTestSingleton{
    //    static TestSingleton* testSingleton = nil;
    //防止多个线程同时访问该实例方法的两种方式
    @synchronized(self){
        if (!testSingleton) {
            testSingleton = [TestSingleton new];
            testSingleton.shareMutableArray = [NSMutableArray array];
        }
    }



#pragma mark 多线程
    /**
     一句话回到主线程
     [self performSelectorOnMainThread:@selector(mainMethod) withObject:nil waitUntilDone:NO];
     */
    
    
    注意：在多线程共同访问一个资源时候，如有必要，需要加线程锁。NSLock;
    
    /*
     1.NSThead
    target：发送消息的对象 selector：子线程回调方法，在此方法中实现子线程中所要进行的操作 object：回调方法的参数
     */
    
    //自己手动开辟的线程。得放到自动释放池中进行操作，系统开辟线程不用
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(gogogo:) object:@"我是参数"];
    //[thread start];//执行子线程回调方法
    
    //NSThead第二种开辟线程的方式，通过便利构造器。此方法不用调用start启动线程
    [NSThread detachNewThreadSelector:@selector(gogogo:) toTarget:self withObject:@"我也是参数"];
    
    
    
    /**
     2.NSOperation 是一个抽象类 『不具备实际开辟线程的作用，将NSOperation放在哪个线程中，它就在哪个线程中执行回调方法』
     
     
     NSOperation简介
     
     1.简单说明
     
     NSOperation的作⽤：配合使用NSOperation和NSOperationQueue也能实现多线程编程
     
     NSOperation和NSOperationQueue实现多线程的具体步骤：
     
     （1）先将需要执行的操作封装到一个NSOperation对象中
     
     （2）然后将NSOperation对象添加到NSOperationQueue中
     
     （3）系统会⾃动将NSOperationQueue中的NSOperation取出来
     
     （4）将取出的NSOperation封装的操作放到⼀条新线程中执⾏
     
     2.NSOperation的子类
     
     NSOperation是个抽象类,并不具备封装操作的能力,必须使⽤它的子类
     
     使用NSOperation⼦类的方式有3种：
     
     （1）NSInvocationOperation
     
     （2）NSBlockOperation
     
     （3）自定义子类继承NSOperation,实现内部相应的⽅法
     */
    
    //子类1  NSInvocationOperation 参数和NSTherad alloc中的三个参数功能相同
    NSInvocationOperation * invovationOperation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(gogogo:) object:@"1operation回调方法的参数"];
    //执行operation回调方法
    [invovationOperation start];
    
    //子类2 NSBlockOperation
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2---%@",[NSThread currentThread]);
    }];
    [blockOperation start];
    
    //operationQueue 队列。将operation 加入队列中之后，operation将会自动在子线程中执行，并且是并发执行，不用手动调用start方法，系统会调用。
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    //添加operation『在OperationQueue队列中，执行是无序的，当需要队列有序执行的时候，就需要添加依赖关系,添加完依赖关系，先执行的始终是参数』
    //[blockOperation addDependency:invovationOperation];//依赖关系影响执行顺序
    [invovationOperation addDependency:blockOperation];
    
    [queue addOperation:invovationOperation];
    [queue addOperation:blockOperation];
    

#pragma mark 动画
    
    

#pragma mark 毛玻璃

1. 创建UIBlurEffect类的实例，并指定某一种毛玻璃效果。

2. 创建UIVisualEffectView类的实例，将步骤1中的UIBlurEffect类的实例应用到UIVisualEffectView类的实例上。

3. 将UIVisualEffectView类的实例置于待毛玻璃化的视图之上即可。


//  创建需要的毛玻璃特效类型
UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//  毛玻璃view 视图
UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//添加到要有毛玻璃特效的控件中
effectView.frame = self.imageV.bounds;
[self.imageV addSubview:effectView];
//设置模糊透明度
effectView.alpha = .8f;


#pragma mark 推送
1.注册：设备标识 应用程序标识
2.APNS通过代理返回 （成功失败），把值存到本地服务器
3.推送 - APNS - 设备


#pragma mark 搜索控制器

[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];

//初始化搜索控制器
UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
//当搜索时隐藏导航栏
searchController.hidesNavigationBarDuringPresentation = YES	;
//设置代理为self
searchController.searchResultsUpdater = self;
//是否在搜索时使背景变暗
searchController.dimsBackgroundDuringPresentation = YES;
//使搜索条自适应当前视图的尺寸
[searchController.searchBar sizeToFit];
//搜索框是否为活跃状态
//searchController.active = YES;


self.tableView.tableHeaderView = searchController.searchBar;


#pragma mark- StoryBoard & XIB

    
UIStoryboard *storyBoard  = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
RootViewController *rootVC = [storyBoard instantiateViewControllerWithIdentifier:@"RootViewController"];
    
    
//用nib文件来初始化
MainViewController *mainVC = [[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
self.window.rootViewController = mainVC;

View *view = [[[NSBundle mainBundle]loadNibNamed:@"View" owner:nil options:nil] objectAtIndex:0];
    
#pragma mark Storyboard 跳转传值
//故事板跳转传值使用（在不使用didSelect情况下）
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    StudentTableViewController *stuVC = segue.destinationViewController;
    
    //通过cell得到行数(取得点击cell的班级对象)
    MyTableViewCell *cell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    LanOuClass *lanouClass = [self.allDataMutableArr objectAtIndex:indexPath.row];
    stuVC.currentClass = lanouClass;
    
#pragma mark 代码创建约束
    /**
     代码创建约束
     1.禁用autoresizing
     blueView.translatesAutoresizingMaskIntoConstraints = NO;
     2.不需要设置frame
     3.添加约束一定要注意 要给谁添加（父控件  还是自身控件）
     
     
     添加约束的规则
     1.如果添加的约束和其他控件没关系，会添加到自己身上
     2.如果是父子关系，设置子控件的约束，会添加到父控件上
     3.如果是兄弟关系，设置兄弟的约束，约束会添加到第一个共同的父控件上
     
     
     状态栏
     self.topLayoutGuide
     */
    
    
    
    
    1.创建约束
    //创建蓝色高度 A对象 的 某属性的 等于 B对象 的 某属性 乘以multiplier 加constant [参数1 的 参数2 参数3  参数4 的 参数5 乘参数6 加参数7]
    
    NSLayoutConstraint *blueHC = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
    
    2.添加约束[注意添加约束的规则]
    [blueView addConstraint:blueHC];
    [self.view addConstraint:blueLeft];

    
    
    /***
     屏幕适配思路
     1.设置一张图片，在容器中居中水平、垂直居中对齐，
     
     
     */


#pragma mark- 实用相关

UINavigationBar * navBar = [UINavigationBar appearance]; //注意这个属性
[navBar setBarTintColor:[UIColor lightGrayColor]];

//工厂方法
- (void)creatButtonWithTitle:(NSString *)title y:(float)y tag:(int)tag color:(UIColor *)color{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTag:tag];
    [self.view1 addSubview:btn];
    btn.backgroundColor = color;
    btn.frame = CGRectMake((CGRectGetWidth(self.view.bounds) - 60) / 2, y, 60, 60);
    btn.layer.cornerRadius = 30;
    [btn addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}



//ios开发中有时会需要对已添加过的view进行删除、隐藏等操作。通常可以通过以下方法来完成：
for（UIView *View in [self.View subviews]）
{
    if(（[View isKindofClass:[UILable class]]）
       &&（1 == View.tag）)//如果有多个同类型的View可以通过tag来区分
    {
        [View SetHidden:YES];//隐藏此控件
        [View removeFromSuperview];//删除此控件
    }
}

#pragma mark 状态栏相关

    
    /**
     隐藏
     */
    
    //（全局）在info.plist中设置
    Status bar is initially hidden = YES
    viewContrller-based status bar appearance = NO
    
    
    //ios8 导航栏设置背景为透明图片后，下面还是有一条黑线啊，请问如何隐藏

    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    

    /**
     *  字体改为白色【已废弃】
     */
    
    1.viewContrller-based status bar appearance = NO
    2.[[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    
    /**
     *  iOS 9 改导航栏字体颜色
     */
    -(UIStatusBarStyle)preferredStatusBarStyle
    {
        return UIStatusBarStyleLightContent;
    }
    
    
#pragma mark SDwebImagge

[[SDImageCache sharedImageCache] clearDisk];
[[SDImageCache sharedImageCache] clearMemory];//可有可无
//
//        DLog(@"clear disk");
//
//        float tmpSize = [[SDImageCache sharedImageCache] checkTmpSize];
//
//        NSString *clearCacheName = tmpSize >= 1 ? [NSString stringWithFormat:@"清理缓存(%.2fM)",tmpSize] : [NSString stringWithFormat:@"清理缓存(%.2fK)",tmpSize * 1024];
//
//        [configDataArray replaceObjectAtIndex:2 withObject:clearCacheName];
//
//        [configTableView reloadData];
