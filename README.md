# iOSAnimationSample
UIView基础动画

iOS的动画多种多样，动画做的好的应用会更加吸引人，用起来也会更加炫目，本文介绍iOS几种基础动画，单个讲解便于理解，但真正使用时，结合起来用会看起来更加帅，这就看具体的应用场景和大家的想象力啦。

所有的基础动画都给予UIView一个基础的方法：animateWithDuration。这个方法可以包含一个代码块，里面设置要改变的东西，在执行的时候iOS会自动以动画的形式展现出来，代码如下：

```Objective-c
[UIView animateWithDuration:1 animations:^{
        // 要执行的动作
}];
```
其中的参数“1”表示动画在一秒时间下完成。
现在分别讲解位置、透明度、大小、颜色、旋转的动画。

## 位置动画
我们在界面上放置一个方块，然后想要他通过动画移动到另一个位置，怎么做呢？很简单，在上面的代码块的位置改变方块的中心就好了，如下：

```Objective-c
	[UIView animateWithDuration:1 animations:^{
        // 改变蓝色方块的位置
        CGPoint blueCenter = self.blueSquare.center;// 获取原来的方块中心位置
        blueCenter.x = self.view.bounds.size.width - self.blueSquare.center.x;// 改变中心位置的X坐标
        self.blueSquare.center = blueCenter;// 设置方块的中心位置到新的位置
	}];
```
这样运行就可以看到动画了，很简单吧。
此外，还可以延迟动画的执行时间，比如想延迟半秒后执行，那么还是同样的方法，但是参数要多一点：

```Objective-c
    [UIView animateWithDuration:1 delay:0.5 options:nil animations:^{
        // 改变蓝色方块的位置
        CGPoint blueCenter = self.blueSquare.center;// 获取原来的方块中心位置
        blueCenter.x = self.view.bounds.size.width - self.blueSquare.center.x;// 改变中心位置的X坐标
        self.blueSquare.center = blueCenter;// 设置方块的中心位置到新的位置
    } completion:nil];
```
delay参数表示延迟0.5秒执行动画，options可以不填，completion是完成后的操作，也可以不填。这样就实现了。

## 透明度动画
假设我们想通过动画渐变一个控件的透明度，比如慢慢变成基本看不见，也很简单，还是那个方法：

```Objective-c
    // 开始透明度动画（一秒完成）
    [UIView animateWithDuration:1 animations:^{
        // 透明度变为0.1
        self.blueSquare.alpha = 0.1;
    }];
```
方块原来就有透明度，当然默认为1，通过这个设置，就可以让它在一秒钟时间里慢慢将透明度变成0.1，是不是很简单！

## 大小动画
如果想改变一个控件的大小，需要在代码块里用到一个改变大小的函数：CGAffineTransformMakeScale，这个函数的参数分别为设置长和宽为原来的多少倍，比如我们通过动画将控件放大到原来的两倍：

```Objective-c
    // 进行一秒钟的动画
    [UIView animateWithDuration:1 animations:^{
        self.blueSquare.transform = CGAffineTransformMakeScale(2.0, 2.0);// 长和宽分别变成原来的两倍
    }];
```
这里就将方块通过一秒钟的动画慢慢放大到原来的两倍，这里要明确的是放大过程中，方块的中心点不变，也就是说是从中心向四周放大的。要缩小也可以改变参数的倍数就可以了。
这里可以稍作想象，我们把放大动画和透明度动画组合到一起，变放大到整个屏幕边渐变到看不见，是不是就很像一些见过的动画了~

## 颜色动画
现在来到颜色的渐变动画，同样简单的很：

```Objective-c
    // 改变颜色
    [UIView animateWithDuration:1 animations:^{
        self.blueSquare.backgroundColor = [UIColor redColor];
    }];
```
在代码块里重新设置一下方块的颜色，就可以实现渐变效果了，简单到哭。。。

## 旋转动画
上面的动画操作都很简单，都是在动画的代码块内重新设置一下就可以达到动画的效果了，而旋转就稍微复杂一点。
假设我们有一个轮子的图片wheelImg，要旋转他，还是需要用到方法CGAffineTransformMakeRotation，刚才我们伸缩大小用到了CGAffineTransformMakeScale，看起来差不多，用起来也差不多，参数是旋转的角度，我们可以尝试一下这样写：

```Objective-c
    [UIView animateWithDuration:1 animations:^{
        self.wheelImg.transform = CGAffineTransformMakeRotation(M_PI);
    }];
```
这样确实可以达到旋转的目的，根据参数，运行的时候会旋转半圆，然后停住。如果只是想旋转一下停住，按照这种方式写，改变角度就可以了，但是如果想要旋转一个整圆，第一个想到的可能是把角度改成整圆：

```Objective-c
    [UIView animateWithDuration:1 animations:^{
        self.wheelImg.transform = CGAffineTransformMakeRotation(2*M_PI);
    }];
```
这样写，运行起来其实是不会动的，可以试一下，因为它的最终位置，也就是转了一个整圆后，还是在原位置，所以iOS选择不动。就跟改变位置，位置还是原来的位置时，也不会动一样。那怎么办呢。另外，这里的旋转都是一次性的，如果想要一直转，怎么做呢，是不是很容易想到循环？其实就是循环，但是我们可以用比for循环更加优雅的动画循环方式，还记得刚才做延迟动画的时候的方法，最后有一个参数是completion嘛，这个参数的功能是提供动画结束时执行的内容，那我们可不可以在这里调用它自己呢？当然可以：

```Objective-c
// 持续旋转动画
- (void)spin {
    // options属性设置可以让其顺畅地循环转动，completion让其不断在完成之后调用自己
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.wheelImg.transform = CGAffineTransformRotate(self.wheelImg.transform, M_PI);// 第一个参数为开始旋转的角度，第二个为旋转的角度
    }completion:^(BOOL finished){// 结束时继续执行
        [self spin];
    }];
}
```
这里我们把动画放到一个函数里，方便我们在completion里调用，这样就实现了持续旋转了，当然，如果想只旋转一个整圆，可以用for循环，条条大路通罗马嘛。

以上就是基本的iOS UIView动画了，单个看各自都挺简单的，在我们的真实使用当中，当然也要注意结合使用，发挥想象力，简单的功能也是可以组合出帅气的效果的~

查看[我的博客](http://blog.csdn.net/cloudox_/article/details/50736092)
