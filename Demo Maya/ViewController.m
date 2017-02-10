//
//  ViewController.m
//  Demo Maya
//
//  Created by apple on 2016/12/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>{
    //原始底图
    UIScrollView *_scrollView;
    
    //菜单栏
    UIScrollView *_scrollV;
    
    //菜单栏偏移量
    CGFloat _offsetX;
    
    //菜单视图
    UIView *_canDView ;
    
    //菜单button
    UIButton *_canDButton;
    
    //曲面曲线 多边形 雕刻 装备 图标底图
    UIView *_gongJuView;
    UIScrollView *_scrollView3;
    UIView *_view3;
    
    //视图 着色 照明 显示 渲染器 面板
    UIView *_shituView;
   
    UIView *_zhuKuangTuView;
    
    //右侧视图View
    UIScrollView* _tongDaoSView;
    UIView *_tongDaoView;
    UIView *_moRenView;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建底图收缩
    [self createScrollView];
    //创建菜单栏
    [self createCaiD];
    //创建工具栏
    [self gongJuLan];
    //创建顶部关闭按钮
    [self topView];
    //左侧栏
    [self zuoCeLan];
    //主框图
    [self zhuKuangLan];
    //底部视图
    [self createBottomView];
    //右侧视图
    [self rightView];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //控制菜单栏的关闭
    _canDView.hidden = YES;
    for (int i = 0; i < 19; i++) {
        UIButton *canDButton = [_scrollV viewWithTag:1001+i];
        canDButton.selected = NO;
    }
    
    //控制视图view的隐藏
    _shituView.hidden = YES;
    for (int i = 0; i < 6; i++) {
        UIButton *shituButton = [_zhuKuangTuView viewWithTag:1000+i];
        shituButton.selected = NO;
    }

}
//顶部蓝框
-(void)topView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, 20)];
    view.backgroundColor = [UIColor blueColor];
    UIScrollView *scrollView = [self.view viewWithTag:10000];
    [scrollView addSubview:view];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    imageView.image = [UIImage imageNamed:@"MAYA标志.jpg"];
    [view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(22, 0, 200, 20)];
    label.text = @"Autodesk Maya 2017:无标题*";
    label.font = [UIFont systemFontOfSize:14];
    [view addSubview:label];
    
    NSArray *arrayCancle = @[@"最小化",@"窗口化",@"关闭"];
    for (int i = 0; i < 3; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.height - (3-i)*25, 0, 25, 16)];
        [button setImage:[UIImage imageNamed:arrayCancle[i]] forState:UIControlStateNormal];
        [view addSubview:button];
    }
    
    [self caiDNEXTView];

}
//创建地图收缩
-(void)createScrollView{
 
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenH, kScreenW)];
    _scrollView.maximumZoomScale = 4;
    _scrollView.minimumZoomScale = 1;
    _scrollView.userInteractionEnabled = YES;
    _scrollView.delegate = self;
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:_scrollView.bounds];
    [_scrollView addSubview:imageV];
    imageV.image = [UIImage imageNamed:@"黑背.jpg"];
    imageV.tag = 10000;
    imageV.userInteractionEnabled = YES;

    [self.view addSubview:_scrollView];
    
}
//捏合手势放大或者缩小所要操作的视图
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    UIView* view;
    //底图
    if (scrollView == _scrollView) {
     view =  [scrollView viewWithTag:10000];
    }
    return view;
    
    
}

//当菜单栏开始移动 的时候，让view隐藏,让button变为非选择状态
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == _scrollV) {
        _canDView.hidden = YES;
      
        for (int i = 0; i < 19; i++) {
            UIButton *canDButton = [_scrollV viewWithTag:1001+i];
            canDButton.selected = NO;
        }
       
    }
}
//底部视图
-(void)createBottomView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.width - 49, self.view.frame.size.height, 49)];
    view.backgroundColor = [UIColor redColor];
    
    //添加到底图上
    UIScrollView *scrollView = [self.view viewWithTag:10000];
    [scrollView addSubview:view];
    
    //底部视图的第一栏
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 20)];
    view1.backgroundColor = [UIColor grayColor];
    [view addSubview:view1];
    //内层视图
    UIView *view11 = [[UIView alloc]initWithFrame:CGRectMake(5, 2, view1.frame.size.width - 200, 16)];
    view11.backgroundColor = [UIColor redColor];
    [view1 addSubview:view11];
    //1
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 1, 10, 14)];
    label1.text = @"1";
    label1.font = [UIFont systemFontOfSize:12];
    label1.backgroundColor = [UIColor grayColor];
    label1.textColor = [UIColor whiteColor];
    [view11 addSubview:label1];
    
    NSArray *array11 = @[@"5",@"10",@"15",@"20",@"25",@"30",@"35",@"40",@"45",@"50",@"55"];
    for (int i = 0; i < 11; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(40+40*i , 10, 1, 6)];
        imageView.image = [UIImage imageNamed:@"黑背.jpg"];
        [view11 addSubview:imageView];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(38+40*i, 0, 15, 10)];
        label.text = array11[i];
        label.font = [UIFont systemFontOfSize:8];
        [view11 addSubview:label];
    }
    
    
    
    UIView *view12 = [[UIView alloc]initWithFrame:CGRectMake(view1.frame.size.width - 190, 5, 35, 13)];
    view12.backgroundColor = [UIColor blackColor];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(5, 1, 10, 10)];
    label2.text = @"1";
    label2.font = [UIFont systemFontOfSize:8];
    label2.textColor = [UIColor whiteColor];
    [view12 addSubview:label2];
    
    [view1 addSubview:view12];
    
    //底部视图 播放 前进 后退 按钮
    NSArray *array13 = @[@"",@"",@"",@"",@"",@"",@"",@""];
    for(int i = 0;i < array13.count;i++){
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(515+19*i, 0, 19, 20)];
        [button setImage:[UIImage imageNamed:array13[i]] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor yellowColor];
        [view1 addSubview:button];
    }
    
    //第二栏
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 21, view.frame.size.width, 15)];
    view2.backgroundColor = [UIColor blackColor];
    [view addSubview:view2];
    //第一个1
    UIView *view21 = [[UIView alloc]initWithFrame:CGRectMake(5, 2, 35, 12)];
    view21.backgroundColor = [UIColor grayColor];
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(5, 1, 10, 10)];
    label3.text = @"1";
    label3.font = [UIFont systemFontOfSize:8];
    label3.textColor = [UIColor whiteColor];
    [view21 addSubview:label3];
    [view2 addSubview:view21];
    //第二个1
    UIView *view22 = [[UIView alloc]initWithFrame:CGRectMake(45, 2, 35, 12)];
    view22.backgroundColor = [UIColor grayColor];
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(5, 1, 10, 10)];
    label4.text = @"1";
    label4.font = [UIFont systemFontOfSize:8];
    label4.textColor = [UIColor whiteColor];
    [view22 addSubview:label4];
    [view2 addSubview:view22];
    //大长框
    UIView *view23 = [[UIView alloc]initWithFrame:CGRectMake(85, 2, 300, 12)];
    view23.backgroundColor = [UIColor grayColor];
    [view2 addSubview:view23];
    //大长框里面的小框框
    UIView *view24 = [[UIView alloc]initWithFrame:CGRectMake(2, 1, 200, 10)];
    view24.backgroundColor = [UIColor blackColor];
    [view23 addSubview:view24];
    //小框框里面的数字
    UIImageView *imageView23 = [[UIImageView alloc]initWithFrame:CGRectMake(1, 1, 8, 8)];
    imageView23.image = [UIImage imageNamed:@"25"];
    [view24 addSubview:imageView23];
    UILabel *label23 = [[UILabel alloc]initWithFrame:CGRectMake(10, 1, 8, 8)];
    label23.text = @"1";
    label23.textColor = [UIColor whiteColor];
    label23.font = [UIFont systemFontOfSize:8];
    [view24 addSubview:label23];
    
    UIImageView *imageView24 = [[UIImageView alloc]initWithFrame:CGRectMake(view24.frame.size.width - 10, 1, 8, 8)];
    imageView24.image = [UIImage imageNamed:@"25"];
    [view24 addSubview:imageView24];
    UILabel *label24 = [[UILabel alloc]initWithFrame:CGRectMake(view24.frame.size.width - 25, 1, 18, 8)];
    label24.text = @"120";
    label24.textColor = [UIColor whiteColor];
    label24.font = [UIFont systemFontOfSize:8];
    [view24 addSubview:label24];
    
    //120 200
    UIView *view25 = [[UIView alloc]initWithFrame:CGRectMake(387, 2, 35, 12)];
    view25.backgroundColor = [UIColor grayColor];
    
    UILabel *label25 = [[UILabel alloc]initWithFrame:CGRectMake(5, 1, 20, 10)];
    label25.text = @"120";
    label25.font = [UIFont systemFontOfSize:8];
    label25.textColor = [UIColor whiteColor];
    [view25 addSubview:label25];
    [view2 addSubview:view25];
    
    UIView *view26 = [[UIView alloc]initWithFrame:CGRectMake(423, 2, 35, 12)];
    view26.backgroundColor = [UIColor grayColor];
    
    UILabel *label26 = [[UILabel alloc]initWithFrame:CGRectMake(5, 1, 20, 10)];
    label26.text = @"200";
    label26.font = [UIFont systemFontOfSize:8];
    label26.textColor = [UIColor whiteColor];
    [view26 addSubview:label26];
    [view2 addSubview:view26];
    //无动画层
    UIButton *button27 = [[UIButton alloc]initWithFrame:CGRectMake(460, 2, 12, 12)];
    button27.backgroundColor = [UIColor yellowColor];
    [view2 addSubview:button27];
    
    UIButton *button28 = [[UIButton alloc]initWithFrame:CGRectMake(475, 2, 60, 12)];
    button28.backgroundColor = [UIColor redColor];
    [button28 setTitle:@"无动画层" forState:UIControlStateNormal ];
    button28.titleLabel.font = [UIFont systemFontOfSize:8];
    button28.titleLabel.textAlignment = NSTextAlignmentLeft;
    button28.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //    　　但是问题又出来，此时文字会紧贴到做边框，我们可以设置
    button28.contentEdgeInsets = UIEdgeInsetsMake(0,2, 0, 0);
    [view2 addSubview:button28];
    
    //无角色集
    UIButton *button29 = [[UIButton alloc]initWithFrame:CGRectMake(537, 2, 12, 12)];
    button29.backgroundColor = [UIColor yellowColor];
    [view2 addSubview:button29];
    
    UIButton *button30 = [[UIButton alloc]initWithFrame:CGRectMake(555, 2, 60, 12)];
    button30.backgroundColor = [UIColor redColor];
    [button30 setTitle:@"无角色集" forState:UIControlStateNormal ];
    button30.titleLabel.font = [UIFont systemFontOfSize:8];
    button30.titleLabel.textAlignment = NSTextAlignmentLeft;
    button30.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //    　　但是问题又出来，此时文字会紧贴到做边框，我们可以设置
    button30.contentEdgeInsets = UIEdgeInsetsMake(0,2, 0, 0);
    [view2 addSubview:button30];
    
    //后面两个图标
    UIButton *button31 = [[UIButton alloc]initWithFrame:CGRectMake(620, 2, 12, 12)];
    button31.backgroundColor = [UIColor yellowColor];
    [view2 addSubview:button31];
    
    UIButton *button32 = [[UIButton alloc]initWithFrame:CGRectMake(635, 2, 12, 12)];
    button32.backgroundColor = [UIColor yellowColor];
    [view2 addSubview:button32];
    
    //第三栏
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 37, view.frame.size.width, 12)];
    view3.backgroundColor = [UIColor grayColor];
    [view addSubview:view3];
    //MEL
    UILabel *label31 = [[UILabel alloc]initWithFrame:CGRectMake(10, 1, 20, 10)];
    label31.text = @"MEL";
    label31.textColor = [UIColor whiteColor];
    label31.font = [UIFont systemFontOfSize:8];
    [view3 addSubview:label31];
    //第一个黑框
    UIView* view32 = [[UIView alloc]initWithFrame:CGRectMake(35, 1, 200, 10)];
    view32.backgroundColor = [UIColor blackColor];
    [view3 addSubview:view32];
    //第二个黑框
    UIView* view33 = [[UIView alloc]initWithFrame:CGRectMake(245, 1, 400, 10)];
    view33.backgroundColor = [UIColor blackColor];
    [view3 addSubview:view33];
    //最后一个button
    UIButton *button34 = [[UIButton alloc]initWithFrame:CGRectMake(650, 1, 10, 10)];
    button34.backgroundColor = [UIColor yellowColor];
    [view3 addSubview:button34];
    
}
//右侧视图
-(void)rightView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.height - 199, 115, 199, self.view.frame.size.height - 460 )];
    view.backgroundColor = [UIColor redColor];
    //添加到底图上
    UIScrollView *scrollView = [self.view viewWithTag:10000];
    [scrollView addSubview:view];

    
     _tongDaoSView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    _tongDaoSView.contentSize = CGSizeMake(_tongDaoSView.frame.size.width, _tongDaoSView.frame.size.height*2) ;
    _tongDaoSView.showsVerticalScrollIndicator = NO;
    _tongDaoSView.bounces = NO;
    [view addSubview:_tongDaoSView];
    
    //右侧按钮组
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(view.frame.size.width - 20, 0, 20, _tongDaoSView.contentSize.height)];
    [_tongDaoSView addSubview:view1];
    //左侧面板栏
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(view.frame.size.width - 199, 0, 179, _tongDaoSView.contentSize.height)];
    view2.backgroundColor = [UIColor orangeColor];
    [_tongDaoSView addSubview:view2];
    
    
    _tongDaoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 179, _tongDaoSView.contentSize.height)];
    [_tongDaoSView addSubview:_tongDaoView];
    
    
    
  
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(-40, 40, 100, 20)];
    [button setTitle:@"通道盒/层编辑器" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
    button.transform = CGAffineTransformMakeRotation(M_PI_2);
    button.backgroundColor = [UIColor blackColor];
    button.tag = 1001;
    [button addTarget:self action:@selector(tongDaoHeAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"25"] forState:UIControlStateSelected];
    button.selected = YES;
    [view1 addSubview:button];
    
    
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(-40, 141, 100, 20)];
    [button1 setTitle:@"Modeling Toolkit" forState:UIControlStateNormal];
    [button1.titleLabel setFont:[UIFont systemFontOfSize:12]];
    button1.transform = CGAffineTransformMakeRotation(M_PI_2);
    button1.backgroundColor = [UIColor blackColor];
    button1.tag = 1002;
    [button1 addTarget:self action:@selector(tongDaoHeAction:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setBackgroundImage:[UIImage imageNamed:@"25"] forState:UIControlStateSelected];
    [view1 addSubview:button1];
//
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(-40, 242, 100, 20)];
    [button2 setTitle:@"属性编辑器" forState:UIControlStateNormal];
    [button2.titleLabel setFont:[UIFont systemFontOfSize:12]];
    button2.transform = CGAffineTransformMakeRotation(M_PI_2);
    button2.backgroundColor = [UIColor blackColor];
    button2.tag = 1003;
    [button2 addTarget:self action:@selector(tongDaoHeAction:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setBackgroundImage:[UIImage imageNamed:@"25"] forState:UIControlStateSelected];
    [view1 addSubview:button2];

    _moRenView = [self tongDaoHe:_tongDaoSView.frame];

}
//右侧栏点击事件 通道盒 modeling 属性编辑器
-(void)tongDaoHeAction:(UIButton*)sender{
    _moRenView.hidden = YES;
    UIButton *button = (UIButton*)sender;
    button.selected = !button.selected;
    NSInteger num = button.tag - 1000;
    static UIView *lastView;
    static UIButton *lastButton;
    if (lastView != _moRenView) {
        lastView.hidden = YES;
        lastView = _moRenView;
    }
    if (lastButton != button) {
        lastButton.selected = NO;
        lastButton = button;
    }
    if (lastButton== button) {
        lastButton.selected = YES;
        lastButton = button;
    }
    
 
    switch (num) {
        case 1:
            _moRenView = [self tongDaoHe:_tongDaoView.frame];
            break;
        case 2:
            _moRenView = [self ModelingTool:_tongDaoView.frame];
            break;
        case 3:
            _moRenView = [self shuXingBianJi:_tongDaoView.frame];
            break;
            
        default:
            break;
    }
    
   
    
}
//通道盒
-(UIView*)tongDaoHe:(CGRect)frame{

    UIView *view  = [[UIView alloc]initWithFrame:frame];
     [_tongDaoView addSubview:view];
    
    NSArray *array = @[@"通道",@"编辑",@"对象",@"显示"];
    for(int i = 0; i < 4;i++){
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(2+30*i, 2, 28, 18)];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [view addSubview:button];

    }
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(2, 20, 172, 200)];
    view1.backgroundColor = [UIColor blackColor];
    [view addSubview:view1];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(2, 222, 172, 60)];
    view2.backgroundColor = [UIColor redColor];
    [view addSubview:view2];
    
    UIButton *button21 = [[UIButton alloc]initWithFrame:CGRectMake(2, 2, 28, 18)];
    [button21 setTitle:@"显示" forState:UIControlStateNormal];
    [button21.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [view2 addSubview:button21];
    
    UIButton *button22 = [[UIButton alloc]initWithFrame:CGRectMake(32, 2, 28, 18)];
    [button22 setTitle:@"动画" forState:UIControlStateNormal];
    [button22.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [view2 addSubview:button22];
    
    //层 选项 帮助
    
    
    NSArray *array2 = @[@"层",@"选项",@"帮助"];
    for(int i = 0;i < 3;i++){
        UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(0+25*i, 20, 25, 20)];
        [button3 setTitle:array2[i] forState:UIControlStateNormal];
        [button3.titleLabel setFont:[UIFont systemFontOfSize:10]];
        [view2 addSubview:button3];
    
    }
//    NSArray *array3 = @[@"",@"",@"",@""];
//    for(int i = 0; i < 4;i++){
//        UIButton *button4 = [[UIButton alloc]initWithFrame:CGRectMake(0+26*i, 20, 25, 25)];
//        [button4 setBackgroundColor:[UIColor yellowColor]];
//        [button4 setImage:array3[i] forState:UIControlStateNormal];
//        [view2 addSubview:button4];
//    
//    }
    return view;
}
//Modeling
-(UIView*)ModelingTool:(CGRect)frame{
  
    UIView *view  = [[UIView alloc]initWithFrame:frame];
    [_tongDaoView addSubview:view];
    

    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(2, 222, 172, 40)];
    view2.backgroundColor = [UIColor redColor];
    [view addSubview:view2];
    UIButton *button22 = [[UIButton alloc]initWithFrame:CGRectMake(32, 2, 28, 18)];
    [button22 setTitle:@"动画" forState:UIControlStateNormal];
    [button22.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [view2 addSubview:button22];
    
    return view;
}
//属性编辑器
-(UIView*)shuXingBianJi:(CGRect)frame{
    
    UIView *view  = [[UIView alloc]initWithFrame:frame];
    [_tongDaoView addSubview:view];
    
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(2, 20, 172, 200)];
    view1.backgroundColor = [UIColor blackColor];
    [view addSubview:view1];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(2, 222, 172, 40)];
    view2.backgroundColor = [UIColor redColor];
    [view addSubview:view2];
    
    UIButton *button21 = [[UIButton alloc]initWithFrame:CGRectMake(2, 2, 28, 18)];
    [button21 setTitle:@"显示" forState:UIControlStateNormal];
    [button21.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [view2 addSubview:button21];
    
    UIButton *button22 = [[UIButton alloc]initWithFrame:CGRectMake(32, 2, 28, 18)];
    [button22 setTitle:@"动画" forState:UIControlStateNormal];
    [button22.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [view2 addSubview:button22];
    
    return view;
}
//主框栏 视图 着色 照明 显示 渲染器 面板
-(void)zhuKuangLan{
    _zhuKuangTuView = [[UIView alloc]initWithFrame:CGRectMake(35, 115, self.view.frame.size.height - 235,self.view.frame.size.height - 460 )];
    _zhuKuangTuView.backgroundColor = [UIColor grayColor];
   
    
    //添加到底图上
    UIScrollView *scrollView = [self.view viewWithTag:10000];
    [scrollView addSubview:_zhuKuangTuView];


    
    NSArray *array = @[@"视图",@"着色",@"照明",@"显示",@"渲染器",@"面板"];
    for (int i = 0;  i < array.count; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(2+62*i, 2, 60, 20)];
        [button setTitle:array[i] forState:UIControlStateNormal];
        button.tag = 1000 + i;
        [button addTarget:self action:@selector(shituAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:@"25"] forState:UIControlStateSelected];
        [_zhuKuangTuView addSubview:button];
        
      
    }
    
    
    //下侧图标
    for(int i = 0;i < array.count;i++){
        UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(2+22*i, 22, 20, 20)];
        [button2 setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        button2.backgroundColor = [UIColor redColor];
        [_zhuKuangTuView addSubview:button2];
    
    }
    
    
}
//视图 着色 照明 显示 渲染器 画板动作
-(void)shituAction:(UIButton*)sender{
    UIButton *button = (UIButton*)sender;
    button.selected = !button.selected;
    
    
    //控制菜单栏的关闭
    _canDView.hidden = YES;
    for (int i = 0; i < 19; i++) {
        UIButton *canDButton = [_scrollV viewWithTag:1001+i];
        canDButton.selected = NO;
    }
 
    
    NSInteger num = button.tag - 1000;
    
    CGRect frame = CGRectMake(button.frame.origin.x, button.frame.origin.y+button.frame.size.height,200, 185);
    
    
    static UIButton* lastButton;
    static UIView* lastView;
    
   
    
    if (button.selected) {

        switch (num) {
            case 0:
                _shituView = [self ShiTu:frame];
                break;
            case 1:
                _shituView = [self ZhuoSe:frame];
                break;
            case 2:
                _shituView = [self ZhaoMing:frame];
                break;
            case 3:
                _shituView = [self XianShi:frame];
                break;
            case 4:
                _shituView = [self XuanRanQi:frame];
                break;
            case 5:
                _shituView = [self MianBan:frame];
                break;
                
            default:
                break;
        }
    }else{
        _shituView.hidden = YES;
    }
    if (lastButton != button) {
        lastButton.selected = NO;
        lastButton = button;
    }
    
    
    if (lastView != _shituView) {
        lastView.hidden = YES;
        lastView = _shituView;
    }
   
}
//左侧栏
-(void)zuoCeLan{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 115, 30, self.view.frame.size.height - 460)];
    view.backgroundColor = [UIColor yellowColor];
    //添加到底图上
    UIScrollView *scrollView = [self.view viewWithTag:10000];
    [scrollView addSubview:view];

    //曲面  曲线  多边形  雕刻  滑动底图
    UIScrollView *scrollView1 = [[UIScrollView alloc]initWithFrame:view.bounds];
    scrollView1.contentSize = CGSizeMake(30, view.frame.size.height*1.5);
    scrollView1.showsVerticalScrollIndicator = NO;
    scrollView1.bounces = NO;
    scrollView1.delegate = self;
    [view addSubview:scrollView1];
    
    for(int i = 0; i < 6;i++){
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(5, 5+i*22, 20, 20)];
        [button setBackgroundColor:[UIColor grayColor]];
        [scrollView1 addSubview:button];
    
    }
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 140, 30, 2)];
    imageView.image = [UIImage imageNamed:@"黑背.jpg"];
    [scrollView1 addSubview:imageView];
    
    for(int i = 0; i < 4;i++){
        UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(5, 145+i*22, 20, 20)];
        [button1 setBackgroundColor:[UIColor grayColor]];
        [scrollView1 addSubview:button1];
        
    }
    
    UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(0, scrollView1.contentSize.height - 30, 30, 30)];
    [button3 setBackgroundColor:[UIColor grayColor]];
    [scrollView1 addSubview:button3];
}

//工具栏 曲线/曲面一栏
-(void)gongJuLan{
    _gongJuView = [[UIView alloc]initWithFrame:CGRectMake(0, 62, kScreenH, 50)];
    _gongJuView.backgroundColor = [UIColor orangeColor];
    
    //添加到底图上
    UIScrollView *scrollView = [self.view viewWithTag:10000];
    [scrollView addSubview:_gongJuView];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 5, 50)];
    imageView.image = [UIImage imageNamed:@""];
    imageView.backgroundColor = [UIColor grayColor];
    [_gongJuView addSubview:imageView];
    
    //设置图标
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(10, 2, 20, 46)];
    view1.backgroundColor = [UIColor blackColor];
    UIButton *button11 = [[UIButton alloc]initWithFrame:CGRectMake(2, 2, 16, 16)];
    
    [button11 setImage:[UIImage imageNamed:@"更改显示哪个工具架"] forState:UIControlStateNormal];
    [view1 addSubview:button11];
    
    UIButton *button22 = [[UIButton alloc]initWithFrame:CGRectMake(2, 28, 16, 16)];
    [button22 setImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
    
    [view1 addSubview:button22];
    
    [_gongJuView addSubview:view1];
    
    //字的底图
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(35, 0, _gongJuView.frame.size.width - 35, 20)];
    [_gongJuView addSubview:view2];

    //曲面  曲线  多边形  雕刻  滑动底图
    UIScrollView *scrollView2 = [[UIScrollView alloc]initWithFrame:_gongJuView.bounds];
    scrollView2.contentSize = CGSizeMake(view2.frame.size.width*1.5, 20);
    scrollView2.showsHorizontalScrollIndicator = NO;
    scrollView2.bounces = NO;
    scrollView2.delegate = self;
    [view2 addSubview:scrollView2];

    
    NSArray *array1 = @[@"曲线/曲面",@"多边形",@"雕刻",@"装备",@"动画",@"渲染",@"FX",@"FX缓存",@"自定义",@"Arnold",@"Bifrost",@"MASH",@"Motion Craphics",@"XGen"];
    
    UIImageView *imageView11 = [[UIImageView alloc]initWithFrame:CGRectMake(556, 0, 4, 20)];
    imageView11.image = [UIImage imageNamed:@"绿框左"];
    [scrollView2 addSubview:imageView11];
    
    UIImageView *imageView12 = [[UIImageView alloc]initWithFrame:CGRectMake(612, 0, 4, 20)];
    imageView12.image = [UIImage imageNamed:@"绿框右"];
    [scrollView2 addSubview:imageView12];
    
    UIImageView *imageView21 = [[UIImageView alloc]initWithFrame:CGRectMake(620, 0, 4, 20)];
    imageView21.image = [UIImage imageNamed:@"绿框左"];
    [scrollView2 addSubview:imageView21];
    
    UIImageView *imageView22 = [[UIImageView alloc]initWithFrame:CGRectMake(672, 0, 4, 20)];
    imageView22.image = [UIImage imageNamed:@"绿框右"];
    [scrollView2 addSubview:imageView22];
    
    UIImageView *imageView31 = [[UIImageView alloc]initWithFrame:CGRectMake(680, 0, 4, 20)];
    imageView31.image = [UIImage imageNamed:@"绿框左"];
    [scrollView2 addSubview:imageView31];
    
    UIImageView *imageView32 = [[UIImageView alloc]initWithFrame:CGRectMake(815, 0, 4, 20)];
    imageView32.image = [UIImage imageNamed:@"绿框右"];
    [scrollView2 addSubview:imageView32];
    
    
    for (int i = 0; i < array1.count; i++) {
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(82*i, 0, 80, 20);
        if (i > 1) {
            button1.frame = CGRectMake(160+42*(i-2), 0, 40, 20);
        }
        if (i > 6) {
            button1.frame = CGRectMake(370+62*(i-7), 0, 60, 20);
        }
        if (i > 11) {
             button1.frame = CGRectMake(680+142*(i-12), 0, 140, 20);
        }
        if (i > 12) {
            button1.frame = CGRectMake(820+52*(i-13), 0, 50, 20);
        }
        button1.tag = 1000+i;
        [button1 setTitle:array1[i] forState:UIControlStateNormal];
        
        NSDictionary* selectedTextAttributes = @{
                                                 NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:16]};
        NSAttributedString *attributedS = [[NSAttributedString alloc]initWithString:button1.titleLabel.text attributes:selectedTextAttributes];
        [button1 setAttributedTitle:attributedS forState:UIControlStateSelected];
        
        
        NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],
                                                   NSForegroundColorAttributeName: [UIColor lightTextColor]};
        NSAttributedString *attributedUnSelected = [[NSAttributedString alloc]initWithString:button1.titleLabel.text attributes:unselectedTextAttributes];
        [button1 setAttributedTitle:attributedUnSelected forState:UIControlStateNormal];
                //设置选中时的背景颜色
        [button1 setBackgroundImage:[UIImage imageNamed:@"25"] forState:UIControlStateSelected];
        [button1 addTarget:self action:@selector(gongJuAction:) forControlEvents:UIControlEventTouchUpInside];
       
        [scrollView2 addSubview:button1];
    }

}
//曲线曲面栏 切换图标
-(void)gongJuAction:(UIButton*)button{
    button.selected = !button.selected;
    
    static UIButton *lastButton;
    if (lastButton != button) {
        lastButton.selected = NO;
        lastButton = button;
    }
    if (lastButton == button) {
        lastButton.selected = YES;
        lastButton = button;
    }
    
    _view3 = [[UIView alloc]initWithFrame:CGRectMake(35, 20,_gongJuView.frame.size.width - 35 ,30)];
    _view3.backgroundColor = [UIColor redColor];
    [_gongJuView addSubview:_view3];
    
    _scrollView3 = [[UIScrollView alloc]initWithFrame:_view3.bounds];
    _scrollView3.contentSize = CGSizeMake(_view3.frame.size.width*1.8, 20);
    _scrollView3.showsHorizontalScrollIndicator = NO;
    _scrollView3.bounces = NO;
    _scrollView3.delegate = self;
    
    [_view3 addSubview:_scrollView3];

    
    NSInteger num = button.tag - 1000;
   
    static UIView *lastView;
    if (lastView != _view3) {
        lastView.hidden = YES;
        lastView = _view3;
    }
    switch (num) {
        case 0:
           [self quxianQumian:_scrollView3];
            break;
        case 1:
           [self duoBianXing:_scrollView3];
            break;
        case 2:
           [self diaoKe:_scrollView3];
            break;
        case 3:
           [self zhuangBei:_scrollView3];
            break;
        case 4:
           [self dongHua:_scrollView3];
            break;
        case 5:
           [self xuanRan:_scrollView3];
            break;
        case 6:
           [self FX:_scrollView3];
            break;
        case 7:
           [self FXHuanCun:_scrollView3];
            break;
        case 8:
           [self ziDingYi:_scrollView3];
            break;
        case 9:
           [self Arnold:_scrollView3];
            break;
        case 10:
           [self Bifrost:_scrollView3];
            break;
        case 11:
           [self MASH:_scrollView3];
            break;
        case 12:
           [self MotionGraphics:_scrollView3];
            break;
        case 13:
           [self XGen:_scrollView3];
            break;
            
        default:
            break;
    }
    
}
//曲线/曲面
-(void)quxianQumian:(UIScrollView*)scrollView{

    NSArray *array = @[@"NURBS圆形",@"NURBS方形",@"EP曲线工具",@"铅笔曲线工具",@"三点圆弧",@"附加曲线",@"分离曲线",@"插入结",@"延伸曲线",@"偏移曲线",@"重建曲线",@"添加点工具",@"曲线编辑工具",@"Bezier曲线工具"];
    NSArray *array2 = @[@"NURBS球体",@"NURBS立方体",@"NURBS圆柱体",@"NURBS圆锥体",@"NURBS平面",@"NURBS圆环",@"旋转",@"放样",@"平面",@"挤出",@"双轨成形",@"倒角+",@"在曲面上投影曲线",@"曲面相交",@"修剪工具",@"取消修剪曲面",@"附加曲面",@"分离曲面",@"开放曲面",@"插入等参线",@"延伸曲面",@"重建曲面",@"雕刻几何体工具",@"曲面编辑工具"];
    //图标
    for(int i = 0;i < array.count;i++){
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0+26*i, 2, 25, 25)];
        
        [button setImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
        [scrollView addSubview:button];
    }
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(364, 2, 2, 26)];
    imageView.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView];
    
    //图标
    for(int i = 0;i < array2.count;i++){
        UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(367+26*i, 2, 25, 25)];
       
        [button1 setImage:[UIImage imageNamed:array2[i]] forState:UIControlStateNormal];
        [scrollView addSubview:button1];
    }
 
  
}
//多边形
-(void)duoBianXing:(UIScrollView*)scrollView{
    NSArray *array = @[@"多边形球体",@"多边形立方体",@"多边形圆柱体",@"多边形圆柱体",@"多边形平面",@"多边形圆环",@"多边形棱锥",@"多边形管道",@"多边形类型",@"SVG"];
    NSArray *array1 = @[@"结合",@"分离",@"镜像",@"平滑",@"细分曲面代理",@"减少",@"多切割工具",@"挤出",@"桥接",@"倒角组件",@"合并",@"目标焊接工具",@"翻转三角形边",@"收拢",@"提取",@"平面映射",@"圆柱形映射",@"球形映射",@"自动投影",@"创建轮廓拉伸贴图",@"UV编辑器",@"3DUV抓取工具"];
    NSArray *array2 = @[@"平面映射",@"圆柱形映射",@"球形映射",@"自动投影",@"创建轮廓拉伸贴图",@"UV编辑器",@"3DUV抓取工具"];
    
    //图标
    for(int i = 0;i < 10;i++){
        UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(0+26*i, 2, 25, 25)];
        [button1 setImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
        [scrollView addSubview:button1];
    }
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(261, 2, 2, 26)];
    imageView1.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView1];
    
    //图标
    for(int i = 0;i < 15;i++){
        UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(264+26*i, 2, 25, 25)];
        [button2 setImage:[UIImage imageNamed:array1[i]] forState:UIControlStateNormal];
        [scrollView addSubview:button2];
    }
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(655, 2, 2, 26)];
    imageView2.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView2];

    //图标
    for(int i = 0;i < 7;i++){
        UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(658+26*i, 2, 25, 25)];
        [button3 setImage:[UIImage imageNamed:array2[i]] forState:UIControlStateNormal];
        [scrollView addSubview:button3];
    }
  
}
//雕刻
-(void)diaoKe:(UIScrollView*)scrollView{
    //图标
    for(int i = 0;i < 18;i++){
        UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(0+26*i, 2, 25, 25)];
        button1.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button1];
    }
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(468, 2, 2, 26)];
    imageView1.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView1];
    
    //图标
    for(int i = 0;i < 2;i++){
        UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(472+26*i, 2, 25, 25)];
        button2.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button2];
    }
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(524, 2, 2, 26)];
    imageView2.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView2];

    //图标
    for(int i = 0;i < 2;i++){
        UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(528+26*i, 2, 25, 25)];
        button3.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button3];
    }
    
    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(580, 2, 2, 26)];
    imageView3.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView3];
    
    //图标
    for(int i = 0;i < 4;i++){
        UIButton *button4 = [[UIButton alloc]initWithFrame:CGRectMake(584+26*i, 2, 25, 25)];
        button4.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button4];
    }
   

}
//装备
-(void)zhuangBei:(UIScrollView*)scrollView{
    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, 30) ;
    //图标
    for(int i = 0;i < 6;i++){
        UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(0+26*i, 2, 25, 25)];
        button1.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button1];
    }
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(156, 2, 2, 26)];
    imageView1.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView1];
    
    //图标
    for(int i = 0;i < 4;i++){
        UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(160+26*i, 2, 25, 25)];
        button2.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button2];
    }
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(264, 2, 2, 26)];
    imageView2.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView2];
    
    //图标
    for(int i = 0;i < 6;i++){
        UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(268+26*i, 2, 25, 25)];
        button3.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button3];
    }

    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(424, 2, 2, 26)];
    imageView3.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView3];
    
    //图标
    for(int i = 0;i < 6;i++){
        UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(428+26*i, 2, 25, 25)];
        button3.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button3];
    }
   

}
//动画
-(void)dongHua:(UIScrollView*)scrollView{
    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, 30) ;
    //图标
    for(int i = 0;i < 5;i++){
        UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(26*i, 2, 25, 25)];
        button1.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button1];
    }
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(130, 2, 2, 26)];
    imageView1.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView1];
    
    //图标
    for(int i = 0;i < 5;i++){
        UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(134+26*i, 2, 25, 25)];
        button2.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button2];
    }
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(264, 2, 2, 26)];
    imageView2.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView2];
    
    //图标
    for(int i = 0;i < 6;i++){
        UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(268+26*i, 2, 25, 25)];
        button3.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button3];
    }

}
//渲染
-(void)xuanRan:(UIScrollView*)scrollView{
    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, 30) ;
    //图标
    NSArray *array =@[@"环境光",@"平行光",@"点光源",@"聚光灯",@"区域光",@"体积光",@"创建摄影机",@"编辑材质属性",@"各向异性材质",@"Blinn材质",@"Lambert材质",@"Blinn材质",@"Blinn材质",@"分层材质",@"渐变材质",@"着色贴图",@"表面材质",@"使用背景",@"渲染判断",@"批渲染",@"取消批渲染",@"显示批渲染",@"3D绘制工具"];
    for(int i = 0;i < 23;i++){
        UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(26*i, 2, 25, 25)];
        [button1 setImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
//        button1.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button1];
    }

}
//FX
-(void)FX:(UIScrollView*)scrollView{
    NSArray *array1 = @[@"FX发射器",@"添加发射器"];
    NSArray *array2 = @[@"3D流体容器",@"2D流体容器",@"从对象发射流体",@"使碰撞"];
    NSArray *array3 = @[@"创建头发",@"绘制头发工具选项",@"动力学化选定曲线",@"当前位置",@"开始位置",@"静止位置",@"到头发系统",@"到毛囊",@"到开始曲线",@"到静止曲线",@"缩放头发工具",@"到开始曲线末端",@"到静止曲线末端",@"来自当前",@"当前和开始",@"来自当前R",@"当前和静止"];
    NSArray *array4 = @[@"针对选定的网格",@"发生碰撞",@"移除nCloth",@"显示输入网格",@"显示当前网格"];
    //图标
    for(int i = 0;i < 2;i++){
        UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(26*i, 2, 25, 25)];
        [button1 setImage:[UIImage imageNamed:array1[i]] forState:UIControlStateNormal];
        [scrollView addSubview:button1];
    }
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(52, 2, 2, 26)];
    imageView1.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView1];
    
    //图标
    for(int i = 0;i < 4;i++){
        UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(56+26*i, 2, 25, 25)];
        [button2 setImage:[UIImage imageNamed:array2[i]] forState:UIControlStateNormal];
        [scrollView addSubview:button2];
    }
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(160, 2, 2, 26)];
    imageView2.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView2];
    
    //图标
    for(int i = 0;i < 17;i++){
        UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(164+26*i, 2, 25, 25)];
        [button3 setImage:[UIImage imageNamed:array3[i]] forState:UIControlStateNormal];
        [scrollView addSubview:button3];
    }

    
    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(606, 2, 2, 26)];
    imageView3.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView3];
    
    //图标
    for(int i = 0;i < 5;i++){
        UIButton *button4 = [[UIButton alloc]initWithFrame:CGRectMake(610+26*i, 2, 25, 25)];
        [button4 setImage:[UIImage imageNamed:array4[i]] forState:UIControlStateNormal];
        [scrollView addSubview:button4];
    }

    
    UIImageView *imageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(740, 2, 2, 26)];
    imageView4.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView4];
    
    //图标
    for(int i = 0;i < 1;i++){
        UIButton *button5 = [[UIButton alloc]initWithFrame:CGRectMake(744+26*i, 2, 25, 25)];
        [button5 setImage:[UIImage imageNamed:@"启动交互式播放"] forState:UIControlStateNormal];
        [scrollView addSubview:button5];
    }



}
//FX缓存
-(void)FXHuanCun:(UIScrollView*)scrollView{
    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, 30) ;
    NSArray *array1 = @[@"设置初始状态",@"清除初始状态"];
    NSArray *array2 = @[@"创建缓存",@"删除缓存"];
    NSArray *array3 = @[@"创建缓存",@"删除缓存",@"启用选定nCloth",@"禁用选定nCloth",@"合并到新缓存",@"替换nCached的帧"];
    //图标
    for(int i = 0;i < 2;i++){
        UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(26*i, 2, 25, 25)];
        [button1 setImage:[UIImage imageNamed:array1[i]] forState:UIControlStateNormal];
        [scrollView addSubview:button1];
    }
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(52, 2, 2, 26)];
    imageView1.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView1];
    
    //图标
    for(int i = 0;i < 2;i++){
        UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(56+26*i, 2, 25, 25)];
        [button2 setImage:[UIImage imageNamed:array2[i]] forState:UIControlStateNormal];
        [scrollView addSubview:button2];
    }
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(108, 2, 2, 26)];
    imageView2.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView2];
    
    //图标
    for(int i = 0;i < 6;i++){
        UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(112+26*i, 2, 25, 25)];
        [button3 setImage:[UIImage imageNamed:array3[i]] forState:UIControlStateNormal];
        [scrollView addSubview:button3];
    }

}
//自定义
-(void)ziDingYi:(UIScrollView*)scrollView{}
//Arnold
-(void)Arnold:(UIScrollView*)scrollView{}
//Bifrost
-(void)Bifrost:(UIScrollView*)scrollView{
    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, 30) ;
    NSArray *array = @[@"液体",@"Aero",@"发射器",@"碰撞对象",@"泡沫",@"导向",@"发射区域",@"场"];
    //图标
    for(int i = 0;i < 8;i++){
        UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(26*i, 2, 25, 25)];
        [button1 setImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
        [scrollView addSubview:button1];
    }


}
//MASH
-(void)MASH:(UIScrollView*)scrollView{
    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, 30) ;
    //图标
    for(int i = 0;i < 1;i++){
        UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(26*i, 2, 25, 25)];
        button1.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button1];
    }
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(26, 2, 2, 26)];
    imageView1.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView1];
    
    //图标
    for(int i = 0;i < 7;i++){
        UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(30+26*i, 2, 25, 25)];
        button2.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button2];
    }
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(212, 2, 2, 26)];
    imageView2.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView2];
    
    //图标
    for(int i = 0;i < 2;i++){
        UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(216+26*i, 2, 25, 25)];
        button3.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button3];
    }
    
    
    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(268, 2, 2, 26)];
    imageView3.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView3];
    
    //图标
    for(int i = 0;i < 5;i++){
        UIButton *button4 = [[UIButton alloc]initWithFrame:CGRectMake(272+26*i, 2, 25, 25)];
        button4.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button4];
    }
    
    
    UIImageView *imageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(402, 2, 2, 26)];
    imageView4.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView4];
    
    //图标
    for(int i = 0;i < 1;i++){
        UIButton *button5 = [[UIButton alloc]initWithFrame:CGRectMake(406+26*i, 2, 25, 25)];
        button5.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button5];
    }
    


}
//Motion Graphics
-(void)MotionGraphics:(UIScrollView*)scrollView{
    //图标
    for(int i = 0;i < 3;i++){
        UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(26*i, 2, 25, 25)];
        button1.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button1];
    }
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(78, 2, 2, 26)];
    imageView1.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView1];
    
    //图标
    for(int i = 0;i < 8;i++){
        UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(82+26*i, 2, 25, 25)];
        button2.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button2];
    }
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(290, 2, 2, 26)];
    imageView2.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView2];
    
    //图标
    for(int i = 0;i < 4;i++){
        UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(294+26*i, 2, 25, 25)];
        button3.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button3];
    }
    
    
    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(398, 2, 2, 26)];
    imageView3.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView3];
    
    //图标
    for(int i = 0;i < 2;i++){
        UIButton *button4 = [[UIButton alloc]initWithFrame:CGRectMake(402+26*i, 2, 25, 25)];
        button4.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button4];
    }
    
    
    UIImageView *imageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(454, 2, 2, 26)];
    imageView4.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView4];
    
    //图标
    for(int i = 0;i < 7;i++){
        UIButton *button5 = [[UIButton alloc]initWithFrame:CGRectMake(458+26*i, 2, 25, 25)];
        button5.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button5];
    }
    
    UIImageView *imageView5 = [[UIImageView alloc]initWithFrame:CGRectMake(640, 2, 2, 26)];
    imageView5.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView5];
    
    //图标
    for(int i = 0;i < 1;i++){
        UIButton *button6 = [[UIButton alloc]initWithFrame:CGRectMake(644+26*i, 2, 25, 25)];
        button6.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button6];
    }
    

}
//XGen
-(void)XGen:(UIScrollView*)scrollView{
    //图标
    for(int i = 0;i < 15;i++){
        UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(26*i, 2, 25, 25)];
        button1.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button1];
    }
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(390, 2, 2, 26)];
    imageView1.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:imageView1];
    
    //图标
    for(int i = 0;i < 15;i++){
        UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(394+26*i, 2, 25, 25)];
        button2.backgroundColor = [UIColor grayColor];
        [scrollView addSubview:button2];
    }

}
//建模 切换一栏
-(void)caiDNEXTView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 40, kScreenH, 20)];
    //添加到底图上
    UIScrollView *scrollView = [self.view viewWithTag:10000];
    [scrollView addSubview:view];
    

    UIScrollView *scrollView1 = [[UIScrollView alloc]initWithFrame:view.bounds];
    scrollView1.contentSize = CGSizeMake(view.frame.size.width*1.6, 20);
    scrollView1.showsHorizontalScrollIndicator = NO;
    scrollView1.bounces = NO;
    scrollView1.delegate = self;
    [view addSubview:scrollView1];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 5, 20)];
    imageView.image = [UIImage imageNamed:@""];
    imageView.backgroundColor = [UIColor grayColor];
    [scrollView1 addSubview:imageView];
    
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(10, 1, 80, 18)];
    [button1 setTitle:@"建模" forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:12];
    button1.titleLabel.textAlignment = NSTextAlignmentLeft;
    button1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //    　　但是问题又出来，此时文字会紧贴到做边框，我们可以设置
    button1.contentEdgeInsets = UIEdgeInsetsMake(0,2, 0, 0);
    button1.backgroundColor = [UIColor grayColor];
    [scrollView1 addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(92, 1, 20, 18)];
    [button2 setBackgroundImage:[UIImage imageNamed:@"箭头2222"] forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor grayColor];
    [scrollView1 addSubview:button2];
    
     NSArray *array2 = @[@"显示选择模式图标",@"新建场景",@"打开场景",@"保存场景",@"撤销上次操作",@"重做上次撤销的操作",@"显示选择集图标",@"显示选择模式图标",@"按层次和组合选择",@"按对象类型选择",@"按组件类型选择",@"显示选择集图标",@"显示选择模式图标",@"捕捉到栅格",@"捕捉到曲线",@"捕捉到点",@"捕捉到投影中心",@"捕捉到视图平面",@"激活选定对象"];
    for (int i = 0; i < 19; i++) {
        UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(115+22*i, 0, 20, 20)];
        [button3 setImage:[UIImage imageNamed:array2[i]] forState:UIControlStateNormal];
        [scrollView1 addSubview:button3];
    }
    
    UIButton *button4 = [[UIButton alloc]initWithFrame:CGRectMake(535, 2, 100, 16)];
    [button4 setTitle:@"无激活曲面" forState:UIControlStateNormal];
    button4.titleLabel.font = [UIFont systemFontOfSize:12];
    button4.titleLabel.textAlignment = NSTextAlignmentLeft;
    button4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //    　　但是问题又出来，此时文字会紧贴到做边框，我们可以设置
    button4.contentEdgeInsets = UIEdgeInsetsMake(0,2, 0, 0);
    [button4 setBackgroundImage:[UIImage imageNamed:@"无激活曲面"] forState:UIControlStateNormal];
    [scrollView1 addSubview:button4];
    
    for (int i = 0; i < 12; i++) {
        UIButton *button5 = [[UIButton alloc]initWithFrame:CGRectMake(637+22*i, 0, 20, 20)];
        NSArray *array3 = @[@"显示选择集图标",@"显示选择模式图标",@"打开渲染视图",@"渲染当前帧",@"IPR渲染当前帧",@"显示渲染设置",@"显示窗口",@"启动渲染设置",@"打开灯光编辑器",@"切换暂停",@"显示选择集图标",@"显示选择集图标"];
        [button5 setImage:[UIImage imageNamed:array3[i]] forState:UIControlStateNormal];
        [scrollView1 addSubview:button5];
    }
    
    
}

//菜单栏
-(void)createCaiD{

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.height, 20)];
    //添加到底图上
    UIScrollView *scrollView = [self.view viewWithTag:10000];
    [scrollView addSubview:view];
    
    _scrollV = [[UIScrollView alloc]initWithFrame:view.bounds];
    _scrollV.contentSize = CGSizeMake(view.frame.size.width*1.65, 20);
    _scrollV.showsHorizontalScrollIndicator = NO;
    _scrollV.bounces = NO;
    _scrollV.delegate = self;
   
    [view addSubview:_scrollV];
    
    [self createJianM:_scrollV];

}

//建模
-(void)createJianM:(UIScrollView*)scrollView{

    NSArray *array = @[@"文件",@"编辑",@"创建",@"选择",@"修改",@"显示",@"窗口",@"网格",@"编辑网格",@"网格工具",@"网格显示",@"曲线",@"曲面",@"变形",@"UV",@"生成",@"缓存",@"Arnold",@"帮助"];
    for (int i = 0; i < array.count; i++) {
        _canDButton = [[UIButton alloc]initWithFrame:CGRectMake(2+40*i, 0, 40, 20) ];
        
        if(i > 7){
            _canDButton.frame = CGRectMake(245+(i-7)*80, 0, 80, 20);
        }
        if(i > 10){
            _canDButton.frame = CGRectMake(525+(i-10)*40, 0, 40, 20);
        }
        if(i > 16){
            _canDButton.frame = CGRectMake(750+(i-16)*62, 0, 60, 20);
        }
        
        _canDButton.tag = 1001+i;
        [_canDButton addTarget:self action:@selector(buttonCaiDAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_canDButton setBackgroundImage:[UIImage imageNamed:@"黑背.jpg"] forState:UIControlStateSelected];
        
        if(i == 17){
            [_canDButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        }
        [_canDButton setTitle:array[i] forState:UIControlStateNormal];
        [_canDButton setBackgroundImage:[UIImage imageNamed:@"25"] forState:UIControlStateSelected];
        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(810, 0, 4, 20)];
        imageView1.image = [UIImage imageNamed:@"绿框左"];
        [scrollView addSubview:imageView1];
        
        UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(868, 0, 4, 20)];
        imageView2.image = [UIImage imageNamed:@"绿框右"];
        [scrollView addSubview:imageView2];
        
        [scrollView addSubview:_canDButton];
    }
}
//菜单栏动作
-(void)buttonCaiDAction:(UIButton*)sender{
    UIButton *button = (UIButton*)sender;
    
    button.selected = !button.selected;
    
    //获取菜单栏偏移量
    _offsetX = _scrollV.contentOffset.x;
 
    //控制视图view的隐藏
    _shituView.hidden = YES;
    for (int i = 0; i < 6; i++) {
        UIButton *shituButton = [_zhuKuangTuView viewWithTag:1000+i];
        shituButton.selected = NO;
    }
    
    CGRect frame = CGRectMake(button.frame.origin.x-_offsetX, 40, 210, 320);
    
    static UIView* lastView;
    static UIButton* lastButton;
    
    NSInteger num = button.tag - 1000;
    
    if (button.selected) {
        
    switch (num) {
        case 1:
            _canDView = [self createFileView:frame];
            break;
        case 2:
            _canDView = [self createBianJView:frame];
            break;
        case 3:
            _canDView = [self createChuangJ:frame];
            break;
        case 4:
            _canDView = [self createXuanZ:frame];
            break;
        case 5:
            _canDView = [self createXiuG:frame];
            break;
        case 6:
            _canDView = [self createXianS:frame];
            break;
        case 7:
            _canDView = [self createChuangK:frame];
            break;
        case 8:
            _canDView = [self createWangG:frame];
            break;
        case 9:
            _canDView = [self createBianJWG:frame];
            break;
        case 10:
            _canDView = [self createWangGGJ:frame];
            break;
        case 11:
            _canDView = [self createWangGXS:frame];
            break;
        case 12:
            _canDView = [self createQuX:frame];
            break;
        case 13:
            _canDView = [self createQuM:frame];
            break;
        case 14:
            _canDView = [self createBianX:frame];
            break;
        case 15:
            _canDView = [self createUV:frame];
            break;
        case 16:
            _canDView = [self createShengC:frame];
            break;
        case 17:
            _canDView = [self createHuanC:frame];
            break;
        case 18:
            _canDView = [self createArnold:frame];
            break;
        case 19:
            _canDView = [self createBangZ:frame];
            break;
            
        default:
            break;
    }
    }else{
    
        _canDView.hidden = YES;
    }
    if (lastButton != button) {
        lastButton.selected = NO;
        lastButton = button;
    }
    
    
    if (lastView != _canDView) {
        lastView.hidden = YES;
        lastView = _canDView;
    }
}
//帮助
-(UIView*)createBangZ:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
   
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*1.38);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    NSArray *array1 = @[@"查找菜单",@"查找菜单",@"查找菜单",@"Creative Market",@"查找菜单",@"查找菜单",@"查找菜单",@"查找菜单"];
    for (int i = 0; i < array1.count; i++) {
        CGRect frame1 = CGRectMake(0, i*20+13, 20, 20);
        if(i > 1){
            frame1 = CGRectMake(0, 108+(i-2)*20, 20, 20);
        }
        if(i > 2){
            frame1 = CGRectMake(0, 313+(i-3)*20, 20, 20);
        }
        if(i > 5){
            frame1 = CGRectMake(0, 393+(i-6)*20, 20, 20);
        }
        
        
        [self createImageViewButton:subView withFrame:frame1 withName:array1 [i]];
    }

    
    [scrollView addSubview:subView];

    //横线
    UIView *imageView1 = [self createImageView2:CGRectMake(5, 0, 210, 20) withName:@"查找"];
    [scrollView addSubview:imageView1];
    //查找菜单 Autodesk Maya帮助  新特性
    NSArray *array10 = @[@"查找菜单",@"Autodesk Maya帮助",@"新特性"];
    NSArray *array11 = @[@"",@"F1",@""];
    NSArray *array12 = @[@"",@"",@"2"];
    for (int i = 0; i< 3; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 15+i*20, 180, 20) withName1:array10[i] withName2:array11[i] withN:array12[i] withTrue:NO];
        [scrollView addSubview:view1];
    }

    //横线
    UIView *imageView2 = [self createImageView2:CGRectMake(5, 75, 210, 20) withName:@"了解"];
    [scrollView addSubview:imageView2];
    //1分钟启动影片 Maya教学频道 教程
    NSArray *array20 = @[@"1分钟启动影片",@"Maya教学频道",@"教程"];
    NSArray *array21 = @[@"",@"F1",@""];
    NSArray *array22 = @[@"",@"",@"2"];
    for (int i = 0; i< 3; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 90+i*20, 180, 20) withName1:array20[i] withName2:array21[i] withN:array22[i] withTrue:NO];
        [scrollView addSubview:view2];
    }
    
    //横线
    UIView *imageView3 = [self createImageView2:CGRectMake(5, 150, 210, 20) withName:@"前进"];
    [scrollView addSubview:imageView3];
    //学习途径 Maya 脚本参考 教程
    NSArray *array30 = @[@"学习途径",@"Maya脚本参考",@"Maya社区",@"Maya资源和工具"];
    NSArray *array32 = @[@"",@"2",@"2",@"2"];
    for (int i = 0; i< 4; i++) {
        UIView *view3 = [self cellView:CGRectMake(20, 165+i*20, 180, 20) withName1:array30[i] withName2:@"" withN:array32[i] withTrue:NO];
        [scrollView addSubview:view3];
    }
    
    //横线
    UIView *imageView4 = [self createImageView2:CGRectMake(5, 245, 210, 20) withName:@"支持"];
    [scrollView addSubview:imageView4];
    //Maya服务和支持 反馈
    NSArray *array40 = @[@"Maya服务和支持",@"反馈"];
    for (int i = 0; i< 2; i++) {
        UIView *view4 = [self cellView:CGRectMake(20, 260+i*20, 180, 20) withName1:array40[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view4];
    }
    
    //横线
    UIView *imageView5 = [self createImageView2:CGRectMake(5, 300, 210, 20) withName:@"展开"];
    [scrollView addSubview:imageView5];
    //Creative Market
    UIView *view5 = [self cellView:CGRectMake(20, 315, 180, 20) withName1:@"Creative Market" withName2:@"" withN:@"" withTrue:YES];
    [scrollView addSubview:view5];
    //Autodesk Exchange Apps  尝试使用其他Autodesk产品
    NSArray *array60 = @[@"Autodesk Exchange Apps",@"尝试使用其他Autodesk产品"];
    NSArray *array62 = @[@"",@"2"];
    for (int i = 0; i< 2; i++) {
        UIView *view6 = [self cellView:CGRectMake(20, 335+i*20, 180, 20) withName1:array60[i] withName2:@"" withN:array62[i] withTrue:NO];
        [scrollView addSubview:view6];
    }

    //横线
    UIView *imageView7 = [self createImageView2:CGRectMake(5, 375, 210, 20) withName:@"关于"];
    [scrollView addSubview:imageView7];
    //关于Maya Maya主页
    NSArray *array70 = @[@"关于Maya",@"Maya主页"];
    for (int i = 0; i< 2; i++) {
        UIView *view7 = [self cellView:CGRectMake(20, 395+i*20, 180, 20) withName1:array70[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view7];
    }
    return view;
}
//Arnold
-(UIView*)createArnold:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 170)];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height-10);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    [scrollView addSubview:subView];
    
    //Arnold RenderView
    UIView *view2 = [self cellView:CGRectMake(20, 0, 180, 20) withName1:@"Arnold RenderView" withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view2];
    //横线
    UIImageView *imageView2 = [self createImageView:CGRectMake(20, 20, 190, 1)];
    [scrollView addSubview:imageView2];
    
    
    //StandIn Lights Volume Flush Caches Utilities Help About
    NSArray *array10 = @[@"StandIn",@"Lights",@"Volume",@"Flush Caches",@"Utilities",@"Help",@"About"];
    NSArray *array12 = @[@"2",@"2",@"",@"2",@"2",@"2",@""];
    for (int i = 0; i< 7; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 20+i*20, 180, 20) withName1:array10[i] withName2:@"" withN:array12[i] withTrue:NO];
        [scrollView addSubview:view1];
    }
    return view;
}
//缓存
-(UIView*)createHuanC:(CGRect)frame{

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 70)];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height-10);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    [scrollView addSubview:subView];
    
    //Alembic缓存 几何缓存 GPU缓存
    NSArray *array10 = @[@"Alembic缓存",@"几何缓存",@"GPU缓存"];
    for (int i = 0; i< 3; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, i*20, 180, 20) withName1:array10[i] withName2:@"" withN:@"2" withTrue:NO];
        [scrollView addSubview:view1];
    }
    return view;
}
//生成
-(UIView*)createShengC:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];

    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*2.75);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    NSArray *array1 = @[@"XGen编辑器",@"XGen库",@"创建描述...",@"导入集合或描述...",@"将XGen基本体转化为多边形...",@"转化为交互式修饰...",@"创建交互式修饰样条线",@"交互式修饰编辑器",@"显示HUD",@"Paint Effects工具",@"使可绘制",@"获取笔刷...",@"模板笔刷设置...",@"重置模板笔刷",@"翻转管方向",@"使碰撞",@"在可绘制对象上绘制",@"在视图平面上绘制",@"显示HUD"];
    for (int i = 0; i < array1.count; i++) {
        CGRect frame1 = CGRectMake(0, i*20, 20, 20);
        if(i > 3){
            frame1 = CGRectMake(0, 138+(i-4)*20, 20, 20);
        }
        if(i > 5){
            frame1 = CGRectMake(0, 220+(i-6)*20, 20, 20);
        }
        if(i > 7){
            frame1 = CGRectMake(0, 300+(i-8)*20, 20, 20);
        }
        if(i > 8){
            frame1 = CGRectMake(0, 393+(i-9)*20, 20, 20);
        }
        if(i > 17){
            frame1 = CGRectMake(0, 833+(i-18)*20, 20, 20);
        }
        
        [self createImageViewButton:subView withFrame:frame1 withName:array1 [i]];
    }

    
    [scrollView addSubview:subView];

    //XGen编辑器 XGen库
    NSArray *array10 = @[@"XGen编辑器",@"XGen库"];
    for (int i = 0; i< 2; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, i*20, 180, 20) withName1:array10[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view2];
    }
    
    //横线
    UIImageView *imageView2 = [self createImageView:CGRectMake(30, 40, 180, 1)];
    [scrollView addSubview:imageView2];
    //创建描述... 导入集合或描述... 导出集合或描述... 将当前选择项导出为归档... 场景批量转化为归档...
    NSArray *array20 = @[@"创建描述...",@"导入集合或描述...",@"导出集合或描述...",@"将当前选择项导出为归档...",@"场景批量转化为归档..."];
    for (int i = 0; i < 5; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 40+20*i, 180, 20) withName1:array20[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view2];
    }

    //将XGen基本体转化为多边形... 转化为交互式修饰...
    NSArray *array30 = @[@"将XGen基本体转化为多边形...",@"转化为交互式修饰..."];
    for (int i = 0; i < 2; i++) {
    UIView *view3 = [self cellView:CGRectMake(20, 140+20*i, 180, 20) withName1:array30[i] withName2:@"" withN:@"" withTrue:YES];
    [scrollView addSubview:view3];
    }
    //导入预设... 导出为预设...
    NSArray *array40 = @[@"导入预设...",@"导出为预设..."];
    for (int i = 0; i < 2; i++) {
        UIView *view4 = [self cellView:CGRectMake(20, 180+20*i, 180, 20) withName1:array40[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view4];
    }
    
    //横线
    UIImageView *imageView5 = [self createImageView:CGRectMake(20, 220, 190, 1)];
    [scrollView addSubview:imageView5];
    //创建交互式修饰样条线 交互式修饰编辑器 交互式修饰工具 缓存 显示HUD
    NSArray *array50 = @[@"创建交互式修饰样条线",@"交互式修饰编辑器",@"交互式修饰工具",@"缓存",@"显示HUD"];
    NSArray *array52 = @[@"1",@"",@"2",@"2",@""];
    for (int i = 0; i < 5; i++) {
        UIView *view5 = [self cellView:CGRectMake(20, 222+20*i, 180, 20) withName1:array50[i] withName2:@"" withN:array52[i] withTrue:YES];
        [scrollView addSubview:view5];
    }
    
    //横线
    UIView *imageView6 = [self createImageView2:CGRectMake(10, 322, 205, 20) withName:@"云服务"];
    [scrollView addSubview:imageView6];
    //角色生成器 ReCap
    NSArray *array60 = @[@"角色生成器",@"ReCap"];
    for (int i = 0; i< 2; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 340+i*20, 180, 20) withName1:array60[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view2];
    }
    
    //横线
    UIView *imageView7 = [self createImageView2:CGRectMake(20, 380, 195, 20) withName:@"Paint Effects"];
    [scrollView addSubview:imageView7];
    //Paint Effects工具
    NSArray *array70 = @[@"Paint Effects工具",@"使可绘制"];
    NSArray *array72 = @[@"1",@""];
    for (int i = 0; i< 2; i++) {
        UIView *view7 = [self cellView:CGRectMake(20, 395+i*20, 180, 20) withName1:array70[i] withName2:@"" withN:array72[i] withTrue:NO];
        [scrollView addSubview:view7];
    }

    //横线
    UIImageView *imageView8 = [self createImageView:CGRectMake(30, 435, 180, 1)];
    [scrollView addSubview:imageView8];
    //获取笔刷... 模板笔刷设置... 重置模板笔刷... 翻转管方向 使碰撞
    NSArray *array80 = @[@"获取笔刷...",@"模板笔刷设置...",@"重置模板笔刷",@"翻转管方向",@"使碰撞"];
    NSArray *array81 = @[@"",@"Ctrl+B",@"",@"",@""];
    for (int i = 0; i < 5; i++) {
        UIView *view8 = [self cellView:CGRectMake(20, 435+20*i, 180, 20) withName1:array80[i] withName2:array81[i] withN:@"" withTrue:NO];
        [scrollView addSubview:view8];
    }
    
    //横线
    UIImageView *imageView9 = [self createImageView:CGRectMake(30, 535, 180, 1)];
    [scrollView addSubview:imageView9];
    //在可绘制对象上绘制 在视图平面上绘制
    NSArray *array90 = @[@"在可绘制对象上绘制",@"在视图平面上绘制"];
    for (int i = 0; i < 2; i++) {
        UIView *view8 = [self cellView:CGRectMake(20, 535+20*i, 180, 20) withName1:array90[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view8];
    }

    //横线
    UIImageView *imageView10 = [self createImageView:CGRectMake(30, 575, 180, 1)];
    [scrollView addSubview:imageView10];
    //将设置应用于上一笔划 从选定笔划获取设置 将设置应用于选定笔划
    NSArray *array100 = @[@"将设置应用于上一笔划",@"从选定笔划获取设置",@"将设置应用于选定笔划"];
    for (int i = 0; i < 3; i++) {
        UIView *view10 = [self cellView:CGRectMake(20, 575+20*i, 180, 20) withName1:array100[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view10];
    }
    
    //横线
    UIImageView *imageView11 = [self createImageView:CGRectMake(30, 635, 180, 1)];
    [scrollView addSubview:imageView11];
    //共享一个笔刷 移除笔刷共享 选择包含指定字符的笔刷
    NSArray *array110 = @[@"共享一个笔刷",@"移除笔刷共享",@"选择包含指定字符的笔刷"];
    for (int i = 0; i < 3; i++) {
        UIView *view11 = [self cellView:CGRectMake(20, 635+20*i, 180, 20) withName1:array110[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view11];
    }

    //横线
    UIImageView *imageView12 = [self createImageView:CGRectMake(30, 695, 180, 1)];
    [scrollView addSubview:imageView12];
    //创建修改器 设置修改器填充对象
    NSArray *array120 = @[@"创建修改器",@"设置修改器填充对象"];
    for (int i = 0; i < 2; i++) {
        UIView *view12 = [self cellView:CGRectMake(20, 695+20*i, 180, 20) withName1:array120[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view12];
    }
    
    //横线
    UIImageView *imageView13 = [self createImageView:CGRectMake(30, 735, 180, 1)];
    [scrollView addSubview:imageView13];
    //笔刷动画 曲线工具 自动绘制
    NSArray *array130 = @[@"笔刷动画",@"曲线工具",@"自动绘制"];
    for (int i = 0; i < 3; i++) {
        UIView *view13 = [self cellView:CGRectMake(20, 735+20*i, 180, 20) withName1:array130[i] withName2:@"" withN:@"2" withTrue:NO];
        [scrollView addSubview:view13];
    }
    
    //横线
    UIImageView *imageView14 = [self createImageView:CGRectMake(30, 795, 180, 1)];
    [scrollView addSubview:imageView14];
    //Paint Effects全局参数  网络质量属性 预设混合 保存笔刷预设...
    NSArray *array140 = @[@"Paint Effects全局参数",@"网格质量属性",@"预设混合",@"保存笔刷预设..."];
    NSArray *array142 = @[@"",@"",@"1",@""];
    for (int i = 0; i < 4; i++) {
        UIView *view14 = [self cellView:CGRectMake(20, 795+20*i, 180, 20) withName1:array140[i] withName2:@"" withN:array142[i] withTrue:NO];
        [scrollView addSubview:view14];
    }

    return view;
}
//UV
-(UIView*)createUV:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];

    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*2.55);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    //图标
    NSArray *array1 = @[@"UV编辑器",@"UV集编辑器",@"指定着色器",@"自动",@"最佳平面纹理工具",@"基于摄影机",@"圆柱体",@"平面",@"球形",@"轮廓拉伸",@"对齐",@"翻转",@"栅格",@"排布矩形",@"规格化",@"旋转",@"单位化",@"映射UV边界",@"拉直UV边界",@"优化",@"展开",@"排布",@"扭曲图像...",@"自动接缝",@"切割UV边",@"删除UV",@"合并UV",@"移动并缝合UV边",@"缝合UV边",@"分割UV",@"3DUV抓取工具",@"创建空UV集",@"删除当前UV集",@"重命名当前UV集...",@"设定当前UV集..."];
    for (int i = 0; i < 35; i++) {
        CGRect frame1 = CGRectMake(0, i*20+13, 20, 20);
        if(i > 1){
            frame1 = CGRectMake(0, 67+(i-2)*20, 20, 20);
        }
        if(i > 9){
            frame1 = CGRectMake(0, 243+(i-10)*20, 20, 20);
        }
        if(i > 22){
            frame1 = CGRectMake(0, 515+(i-23)*20, 20, 20);
        }
        if(i > 30){
            frame1 = CGRectMake(0, 710+(i-31)*20, 20, 20);
        }
        
        [self createImageViewButton:subView withFrame:frame1 withName:array1 [i]];
    }

    [scrollView addSubview:subView];
    
    //横线
    UIView *imageView1 = [self createImageView2:CGRectMake(10, 0, 205, 20) withName:@"编辑器"];
    [scrollView addSubview:imageView1];
    //UV编辑器 UV集编辑器
    NSArray *array10 = @[@"UV编辑器",@"UV集编辑器"];
    for (int i = 0; i< 2; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 15+i*20, 180, 20) withName1:array10[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view2];
    }
    
    //横线
    UIView *imageView2 = [self createImageView2:CGRectMake(10, 55, 205, 20) withName:@"创建"];
    [scrollView addSubview:imageView2];
    //自定着色器
    UIView *view2 = [self cellView:CGRectMake(20, 70, 180, 20) withName1:@"指定着色器" withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view2];
    
    //横线
    UIImageView *imageView3 = [self createImageView:CGRectMake(30, 90, 180, 1)];
    [scrollView addSubview:imageView3];
    //自动 最佳平面纹理工具 基于摄像机
    NSArray *array30 = @[@"自动",@"最佳平面纹理工具",@"基于摄影机"];
    NSArray *array32 = @[@"1",@"0",@"1"];
    for (int i = 0; i < 3; i++) {
        UIView *view3 = [self cellView:CGRectMake(20, 90+20*i, 180, 20) withName1:array30[i] withName2:@"" withN:array32[i] withTrue:NO];
        [scrollView addSubview:view3];
    }
    
    //横线
    UIImageView *imageView4 = [self createImageView:CGRectMake(30, 150, 180, 1)];
    [scrollView addSubview:imageView4];
    //圆柱体 平面 球形 轮廓拉伸
    NSArray *array40 = @[@"圆柱体",@"平面",@"球形",@"轮廓拉伸"];
    for (int i = 0; i < 4; i++) {
        UIView *view4 = [self cellView:CGRectMake(20, 150+20*i, 180, 20) withName1:array40[i] withName2:@"" withN:@"2" withTrue:NO];
        [scrollView addSubview:view4];
    }
    
    //横线
    UIView *imageView5 = [self createImageView2:CGRectMake(10, 230, 205, 20) withName:@"修改"];
    [scrollView addSubview:imageView5];
    //@"对齐",@"翻转",@"栅格",@"排布矩阵",@"规格化",@"旋转",@"单位化"
    NSArray *array50 = @[@"对齐",@"翻转",@"栅格",@"排布矩阵",@"规格化",@"旋转",@"单位化"];
    NSArray *array52 = @[@"1",@"1",@"1",@"",@"1",@"1",@"1"];
    for (int i = 0; i< 7; i++) {
        UIView *view5 = [self cellView:CGRectMake(20, 245+i*20, 180, 20) withName1:array50[i] withName2:@"" withN:array52[i] withTrue:NO];
        [scrollView addSubview:view5];
    }
    
    //横线
    UIImageView *imageView6 = [self createImageView:CGRectMake(30, 385, 180, 1)];
    [scrollView addSubview:imageView6];
    //映射UV边界 拉直UV边界
    NSArray *array60 = @[@"映射UV边界",@"拉直UV边界"];
    for (int i = 0; i < 2; i++) {
        UIView *view6 = [self cellView:CGRectMake(20, 385+20*i, 180, 20) withName1:array60[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view6];
    }
    
    //横线
    UIImageView *imageView7 = [self createImageView:CGRectMake(30, 425, 180, 1)];
    [scrollView addSubview:imageView7];
    //优化 展开
    NSArray *array70 = @[@"优化",@"展开"];
    for (int i = 0; i < 2; i++) {
        UIView *view7 = [self cellView:CGRectMake(20, 425+20*i, 180, 20) withName1:array70[i] withName2:@"" withN:@"2" withTrue:NO];
        [scrollView addSubview:view7];
    }
    
    //排布
    UIView *view8 = [self cellView:CGRectMake(20, 465, 180, 20) withName1:@"排布" withName2:@"" withN:@"1" withTrue:YES];
    [scrollView addSubview:view8];
    
    //横线
    UIImageView *imageView9 = [self createImageView:CGRectMake(30, 485, 180, 1)];
    [scrollView addSubview:imageView9];
    //扭曲图像...
    UIView *view9 = [self cellView:CGRectMake(20, 485, 180, 20) withName1:@"扭曲图像..." withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view9];
    
    //横线
    UIView *imageView10 = [self createImageView2:CGRectMake(10, 505, 205, 20) withName:@"编辑"];
    [scrollView addSubview:imageView10];
    //自动接缝
    UIView *view10 = [self cellView:CGRectMake(20, 520, 180, 20) withName1:@"自动接缝" withName2:@"" withN:@"1" withTrue:YES];
    [scrollView addSubview:view10];
    //切割UV边 删除UV边 合并UV边 移动并缝合UV边 缝合UV边 分割UV边 3DUV抓取工具
    NSArray *array110 = @[@"抓取UV边",@"删除UV边",@"合并UV边",@"移动并缝合UV边",@"缝合UV边",@"分割UV边",@"3DUV抓取工具"];
    NSArray *array112 = @[@"",@"",@"1",@"1",@"",@"",@"1"];
    for (int i = 0; i< 7; i++) {
        UIView *view11 = [self cellView:CGRectMake(20, 540+i*20, 180, 20) withName1:array110[i] withName2:@"" withN:array112[i] withTrue:NO];
        [scrollView addSubview:view11];
    }
    
    //横线
    UIView *imageView120 = [self createImageView2:CGRectMake(5, 680, 210, 20) withName:@"集"];
    [scrollView addSubview:imageView120];

    //将UV复制到UV集 创建空UV集 删除当前UV集 重命名当前UV集 设定当前UV集...
    NSArray *array120 = @[@"将UV复制到UV集",@"创建空UV集",@"删除当前UV集",@"重命名当前UV集...",@"设定当前UV集..."];
    NSArray *array122 = @[@"2",@"1",@"",@"",@""];
    for (int i = 0; i< 5; i++) {
        UIView *view11 = [self cellView:CGRectMake(20, 695+i*20, 180, 20) withName1:array120[i] withName2:@"" withN:array122[i] withTrue:NO];
        [scrollView addSubview:view11];
    }
    
    //横线
    UIImageView *imageView13 = [self createImageView:CGRectMake(30, 795, 180, 1)];
    [scrollView addSubview:imageView13];
    UIView *view13 = [self cellView:CGRectMake(20, 795, 180, 20) withName1:@"逐实例共享" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view13];
    
    return view;
}
//变形
-(UIView*)createBianX:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];

    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*2.58);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    //图标
    NSArray *array1 = @[@"混合变形",@"簇",@"晶格",@"包裹",@"收缩包裹",@"线",@"褶皱",@"软修改",@"雕刻",@"纹理",@"曲线上的点",@"编辑成员身份工具",@"镜像变形器权重",@"显示中间对象",@"隐藏中间对象",@"混合变形",@"簇",@"收缩包裹",@"线",@"抖动",@"纹理变形器",@"集成员身份"];
    for (int i = 0; i < 22; i++) {
        CGRect frame1 = CGRectMake(0, i*20+13, 20, 20);
        if(i > 1){
            frame1 = CGRectMake(0, 95+(i-2)*20, 20, 20);
        }
        if(i > 6){
            frame1 = CGRectMake(0, 255+(i-7)*20, 20, 20);
        }
        if(i > 9){
            frame1 = CGRectMake(0, 335+(i-10)*20, 20, 20);
        }
        if(i > 10){
            frame1 = CGRectMake(0, 470+(i-11)*20, 20, 20);
        }
        if(i > 11){
            frame1 = CGRectMake(0, 507+(i-12)*20, 20, 20);
        }
        if (i > 14) {
            frame1 = CGRectMake(0, 585+(i-15)*20, 20, 20);
        }
        if (i > 16) {
            frame1 = CGRectMake(0, 625+(i-16)*20, 20, 20);
        }
        if (i > 18) {
            frame1 = CGRectMake(0, 705+(i-19)*20, 20, 20);
        }
        
        [self createImageViewButton:subView withFrame:frame1 withName:array1 [i]];
    }
    

    [scrollView addSubview:subView];
    
    //横线
    UIView *imageView1 = [self createImageView2:CGRectMake(10, 0, 205, 20) withName:@"创建"];
    [scrollView addSubview:imageView1];
    //混合变形 簇 曲线扭曲 Delta Mush 晶格 包裹 收缩包裹 线 褶皱 姿势空间变形
    NSArray *array10 = @[@"混合变形",@"簇",@"曲线扭曲",@"Delta Mush",@"晶格",@"包裹",@"收缩包裹",@"线",@"褶皱",@"姿势空间变形"];
    for (int i = 0; i< 10; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 15+i*20, 180, 20) withName1:array10[i] withName2:@"" withN:@"1" withTrue:NO];
        if(i == 2){
        view1 = [self cellView:CGRectMake(20, 15+i*20, 180, 20) withName1:array10[i] withName2:@"" withN:@"" withTrue:YES];
        }
        if (i == 9) {
        view1 = [self cellView:CGRectMake(20, 15+i*20, 180, 20) withName1:array10[i] withName2:@"" withN:@"2" withTrue:YES];
        }
        [scrollView addSubview:view1];
        
    }
    
    //横线
    UIImageView *imageView2 = [self createImageView:CGRectMake(30, 215, 180, 1)];
    [scrollView addSubview:imageView2];
    //肌肉
    UIView *view2 = [self cellView:CGRectMake(20, 215, 180, 20) withName1:@"肌肉" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view2];
    
    //横线
    UIImageView *imageView3 = [self createImageView:CGRectMake(30, 235, 180, 1)];
    [scrollView addSubview:imageView3];
    //非线性 软修改 雕刻 纹理 抖动 曲线上的点
    NSArray *array30 = @[@"非线性",@"软修改",@"雕刻",@"纹理",@"抖动",@"曲线上的点"];
    NSArray *array32 = @[@"2",@"1",@"1",@"1",@"2",@"1"];
    for (int i = 0; i < 6; i++) {
        UIView *view3 = [self cellView:CGRectMake(20, 235+20*i, 180, 20) withName1:array30[i] withName2:@"" withN:array32[i] withTrue:NO];
        [scrollView addSubview:view3];
    }
   
    //横线
    UIView *imageView4 = [self createImageView2:CGRectMake(10, 355, 205, 20) withName:@"编辑"];
    [scrollView addSubview:imageView4];
    //混合变形 晶格 包裹 收缩包裹 线
    NSArray *array40 = @[@"混合变形",@"晶格",@"包裹",@"收缩包裹",@"线"];
    for (int i = 0; i< 5; i++) {
        UIView *view4 = [self cellView:CGRectMake(20, 370+i*20, 180, 20) withName1:array40[i] withName2:@"" withN:@"2" withTrue:NO];
        [scrollView addSubview:view4];
    }

    //横线
    UIImageView *imageView5 = [self createImageView:CGRectMake(30, 470, 180, 1)];
    [scrollView addSubview:imageView5];
    //编辑成员身份工具
    UIView *view5 = [self cellView:CGRectMake(20, 470, 180, 20) withName1:@"编辑成员身份工具" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view5];

    
    //横线
    UIImageView *imageView6 = [self createImageView:CGRectMake(30, 490, 180, 1)];
    [scrollView addSubview:imageView6];
    //删减成员身份 镜像变形器权重
    NSArray *array60 = @[@"删减成员身份",@"镜像变形器权重"];
    NSArray *array62 = @[@"2",@"1"];
    for (int i = 0; i< 2; i++) {
        UIView *view6 = [self cellView:CGRectMake(20, 490+i*20, 180, 20) withName1:array60[i] withName2:@"" withN:array62[i] withTrue:NO];
        [scrollView addSubview:view6];
    }
    
    //横线
    UIImageView *imageView7 = [self createImageView:CGRectMake(30, 530, 180, 1)];
    [scrollView addSubview:imageView7];
    //显示中间对象 隐藏中间对象
    NSArray *array70 = @[@"显示中间对象",@"隐藏中间对象"];
    for (int i = 0; i< 2; i++) {
        UIView *view7 = [self cellView:CGRectMake(20, 530+i*20, 180, 20) withName1:array70[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view7];
    }
    
    
    //横线
    UIView *imageView8 = [self createImageView2:CGRectMake(15, 570, 200, 20) withName:@"绘制权重"];
    [scrollView addSubview:imageView8];
    //混合变形 簇 Delta Mush 收缩包裹 线
    NSArray *array80 = @[@"混合变形",@"簇",@"Delta Mush",@"收缩包裹",@"线"];
    for (int i = 0; i< 5; i++) {
        UIView *view8 = [self cellView:CGRectMake(20, 585+i*20, 180, 20) withName1:array80[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view8];
    }
    
    //横线
    UIView *imageView9 = [self createImageView:CGRectMake(30, 685, 205, 1)];
    [scrollView addSubview:imageView9];
    //非线性 抖动 纹理变形器
    NSArray *array90 = @[@"非线性",@"抖动",@"纹理变形器"];
    for (int i = 0; i< 3; i++) {
        UIView *view9 = [self cellView:CGRectMake(20, 685+i*20, 180, 20) withName1:array90[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view9];
    }
    
    //横线
    UIImageView *imageView10 = [self createImageView:CGRectMake(30, 745, 180, 1)];
    [scrollView addSubview:imageView10];
    //集成员身份
    UIView *view10 = [self cellView:CGRectMake(20, 745, 180, 20) withName1:@"集成员身份" withName2:@"" withN:@"1" withTrue:NO];
    [scrollView addSubview:view10];
    
    //横线
    UIView *imageView11 = [self createImageView2:CGRectMake(10, 765, 205, 20) withName:@"权重"];
    [scrollView addSubview:imageView11];
    //导出权重... 导入权重...
    NSArray *array110 = @[@"导出权重...",@"导入权重..."];
    for (int i = 0; i< 2; i++) {
        UIView *view11 = [self cellView:CGRectMake(20, 785+i*20, 180, 20) withName1:array110[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view11];
    }
    
    return view;
}
//曲面
-(UIView*)createQuM:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];

    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*2.05);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    //图标
    NSArray *array1 = @[@"放样",@"平面",@"旋转",@"挤出",@"边界",@"方形",@"倒角",@"倒角",@"复制NURBS面片",@"对齐",@"附加",@"附加而不移动",@"分离",@"移动接缝",@"开放闭合",@"相交",@"在曲面上投影曲线",@"修剪工具",@"取消修剪",@"延伸",@"插入等参线",@"偏移",@"圆化工具",@"雕刻几何体工具",@"重建",@"反转方向"];
    for (int i = 0; i < array1.count; i++) {
        CGRect frame1 = CGRectMake(0, i*20+13, 20, 20);
        if(i > 2){
            frame1 = CGRectMake(0, 95+(i-3)*20, 20, 20);
        }
        if(i > 7){
            frame1 = CGRectMake(0, 210+(i-8)*20, 20, 20);
        }
        if(i > 22){
            frame1 = CGRectMake(0, 550+(i-23)*20, 20, 20);
        }
        if(i > 23){
            frame1 = CGRectMake(0, 610+(i-24)*20, 20, 20);
        }
        
        
        [self createImageViewButton:subView withFrame:frame1 withName:array1 [i]];
    }

    [scrollView addSubview:subView];
    
    //横线
    UIView *imageView1 = [self createImageView2:CGRectMake(10, 0, 205, 20) withName:@"创建"];
    [scrollView addSubview:imageView1];
    //放样 平面 旋转
    NSArray *array10 = @[@"放样",@"平面",@"旋转"];
    for (int i = 0; i< 3; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 15+i*20, 180, 20) withName1:array10[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view1];
    }
    
    //横线
    UIImageView *imageView2 = [self createImageView:CGRectMake(30, 75, 180, 1)];
    [scrollView addSubview:imageView2];
    //双轨成形 挤出
    NSArray *array20 = @[@"双轨成形",@"挤出"];
    NSArray *array22 = @[@"2",@"1"];
    for (int i = 0; i< 2; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 75+i*20, 180, 20) withName1:array20[i] withName2:@"" withN:array22[i] withTrue:NO];
        [scrollView addSubview:view2];
    }
    
    //横线
    UIImageView *imageView3 = [self createImageView:CGRectMake(30, 115, 180, 1)];
    [scrollView addSubview:imageView3];
    //边界 方形
    NSArray *array30 = @[@"边界",@"方形"];
    for (int i = 0; i< 2; i++) {
        UIView *view3 = [self cellView:CGRectMake(20, 115+i*20, 180, 20) withName1:array30[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view3];
    }
    
    //横线
    UIImageView *imageView4 = [self createImageView:CGRectMake(30, 155, 180, 1)];
    [scrollView addSubview:imageView4];
    //倒角 倒角+
    NSArray *array40 = @[@"倒角",@"倒角+"];
    for (int i = 0; i< 2; i++) {
        UIView *view4 = [self cellView:CGRectMake(20, 155+i*20, 180, 20) withName1:array40[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view4];
    }
    
    //横线
    UIView *imageView5 = [self createImageView2:CGRectMake(20, 195, 195, 20) withName:@"编辑NURBS曲面"];
    [scrollView addSubview:imageView5];
    //复制NURBS 面片
    UIView *view5 = [self cellView:CGRectMake(20, 210, 180, 20) withName1:@"复制NURBS面片" withName2:@"" withN:@"1" withTrue:NO];
    [scrollView addSubview:view5];
    
    //横线
    UIImageView *imageView6 = [self createImageView:CGRectMake(30, 230, 180, 1)];
    [scrollView addSubview:imageView6];
    //对齐 附加 附加而不移动 分离 移动接缝 开放/闭合
    NSArray *array60 = @[@"对齐",@"附加",@"附加而不移动",@"分离",@"移动接缝",@"开放/闭合"];
    for (int i = 0; i< 6; i++) {
        UIView *view6 = [self cellView:CGRectMake(20, 230+i*20, 180, 20) withName1:array60[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view6];
    }
    
    //横线
    UIImageView *imageView7 = [self createImageView:CGRectMake(30, 350, 180, 1)];
    [scrollView addSubview:imageView7];
    //相交 在曲面上投影曲线 修剪工具 取消修剪
    NSArray *array70 = @[@"相交",@"在曲面上投影曲线",@"修剪工具",@"取消修剪"];
    for (int i = 0; i< 4; i++) {
        UIView *view7 = [self cellView:CGRectMake(20, 350+i*20, 180, 20) withName1:array70[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view7];
    }
    
    //横线
    UIImageView *imageView8 = [self createImageView:CGRectMake(30, 430, 180, 1)];
    [scrollView addSubview:imageView8];
    //延伸 插入等参线 偏移
    NSArray *array80 = @[@"延伸",@"插入等参线",@"偏移"];
    for (int i = 0; i< 3; i++) {
        UIView *view8 = [self cellView:CGRectMake(20, 430+i*20, 180, 20) withName1:array80[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view8];
    }
    
    //横线
    UIImageView *imageView9 = [self createImageView:CGRectMake(30, 490, 180, 1)];
    [scrollView addSubview:imageView9];
    //圆化工具 缝合 曲面圆角
    NSArray *array90 = @[@"圆化工具",@"缝合",@"曲面圆角"];
    NSArray *array92 = @[@"1",@"2",@"2"];
    for (int i = 0; i< 3; i++) {
        UIView *view9 = [self cellView:CGRectMake(20, 490+i*20, 180, 20) withName1:array90[i] withName2:@"" withN:array92[i] withTrue:NO];
        [scrollView addSubview:view9];
    }
    
    //横线
    UIImageView *imageView10 = [self createImageView:CGRectMake(30, 550, 180, 1)];
    [scrollView addSubview:imageView10];
    //雕刻几何体工具 曲面编辑
    NSArray *array100 = @[@"雕刻几何体工具",@"曲面编辑"];
    NSArray *array102 = @[@"1",@"2"];
    for (int i = 0; i< 2; i++) {
        UIView *view10 = [self cellView:CGRectMake(20, 550+i*20, 180, 20) withName1:array100[i] withName2:@"" withN:array102[i] withTrue:NO];
        [scrollView addSubview:view10];
    }
    
    //横线
    UIImageView *imageView11 = [self createImageView:CGRectMake(30, 590, 180, 1)];
    [scrollView addSubview:imageView11];
    //布尔
    UIView *view10 = [self cellView:CGRectMake(20, 590, 180, 20) withName1:@"布尔" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view10];
   
    //横线
    UIImageView *imageView12 = [self createImageView:CGRectMake(30, 610, 180, 1)];
    [scrollView addSubview:imageView12];
    //重建 反转方向
    NSArray *array120 = @[@"重建",@"反转方向"];
    for (int i = 0; i< 2; i++) {
        UIView *view12 = [self cellView:CGRectMake(20, 610+i*20, 180, 20) withName1:array120[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view12];
    }
    return view;
}
//曲线
-(UIView*)createQuX:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];

    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*1.85);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
 
    //图标
    NSArray *array1 = @[@"锁定长度",@"解除锁定长度",@"弯曲",@"卷曲",@"缩放曲率",@"平滑",@"拉直",@"复制曲面曲线",@"对齐",@"添加点工具",@"附加",@"分离",@"编辑曲线工具",@"移动接缝",@"开放闭合",@"圆角",@"切割",@"相交",@"插入结",@"CV硬度",@"拟合B样条线",@"投影切线",@"平滑",@"重建",@"反转方向"];
    for (int i = 0; i < 25; i++) {
        CGRect frame1 = CGRectMake(0, i*20+13, 20, 20);
        if(i > 6){
            frame1 = CGRectMake(0, 170+(i-7)*20, 20, 20);
        }
        if(i > 17){
            frame1 = CGRectMake(0, 390+(i-17)*20, 20, 20);
        }
        if(i > 18){
            frame1 = CGRectMake(0, 430+(i-18)*20, 20, 20);
        }
        if (i > 22) {
            frame1 = CGRectMake(0, 550+(i-23)*20, 20, 20);
        }
     [self createImageViewButton:subView withFrame:frame1 withName:array1 [i]];
    }
    [scrollView addSubview:subView];
    
    //横线
    UIView *imageView1 = [self createImageView2:CGRectMake(10, 0, 205, 20) withName:@"修改"];
    [scrollView addSubview:imageView1];
    //平均 一致 反转 设定法线角度... 设定为面 设定顶点法线
    NSArray *array10 = @[@"锁定长度",@"解除锁定长度"];
    for (int i = 0; i< 2; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 15+i*20, 180, 20) withName1:array10[i] withName2:@"L" withN:@"" withTrue:NO];
        [scrollView addSubview:view1];
    }
    
    //横线
    UIImageView *imageView2 = [self createImageView:CGRectMake(30, 55, 180, 1)];
    [scrollView addSubview:imageView2];
    //@"弯曲",@"卷曲",@"缩放曲率",@"平滑",@"拉直"
    NSArray *array20 = @[@"弯曲",@"卷曲",@"缩放曲率",@"平滑",@"拉直"];
    for (int i = 0; i< 5; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 55+i*20, 180, 20) withName1:array20[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view2];
    }
    
    //横线
    UIView *imageView3 = [self createImageView2:CGRectMake(10, 155, 205, 20) withName:@"编辑"];
    [scrollView addSubview:imageView3];
    //复制曲面曲线
    UIView *view3 = [self cellView:CGRectMake(20, 170, 180, 20) withName1:@"复制曲面曲线" withName2:@"" withN:@"1" withTrue:NO];
    [scrollView addSubview:view3];
    
    //横线
    UIImageView *imageView4 = [self createImageView:CGRectMake(30, 190, 180, 1)];
    [scrollView addSubview:imageView4];
    //对齐 添加点工具 附加 分离 编辑曲线工具 移动接缝 开放/闭合
    NSArray *array40 = @[@"对齐",@"添加点工具",@"附加",@"分离",@"编辑曲线工具",@"移动接缝",@"开放/闭合"];
    NSArray *array42 = @[@"1",@"",@"1",@"1",@"",@"",@""];
    for (int i = 0; i< 7; i++) {
        UIView *view4 = [self cellView:CGRectMake(20, 190+i*20, 180, 20) withName1:array40[i] withName2:@"" withN:array42[i] withTrue:NO];
        [scrollView addSubview:view4];
    }
    
    //横线
    UIImageView *imageView5 = [self createImageView:CGRectMake(30, 330, 180, 1)];
    [scrollView addSubview:imageView5];
    //圆角 切割 相交
    NSArray *array50 = @[@"圆角",@"切割",@"相交"];
    for (int i = 0; i< 3; i++) {
        UIView *view5 = [self cellView:CGRectMake(20, 330+i*20, 180, 20) withName1:array50[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view5];
    }
    
    //横线
    UIImageView *imageView6 = [self createImageView:CGRectMake(30, 390, 180, 1)];
    [scrollView addSubview:imageView6];
    //延伸 插入结 偏移
    NSArray *array60 = @[@"延伸",@"插入结",@"偏移"];
    NSArray *array62 = @[@"2",@"1",@"2"];
    for (int i = 0; i< 3; i++) {
        UIView *view6 = [self cellView:CGRectMake(20, 390+i*20, 180, 20) withName1:array60[i] withName2:@"" withN:array62[i] withTrue:NO];
        [scrollView addSubview:view6];
    }
    
    //横线
    UIImageView *imageView7 = [self createImageView:CGRectMake(30, 450, 180, 1)];
    [scrollView addSubview:imageView7];
    //@"CV硬度",@"拟合B样条线",@"投影射线",@"平滑"
    NSArray *array70 = @[@"CV硬度",@"拟合B样条线",@"投影切线",@"平滑"];
    for (int i = 0; i< 4; i++) {
        UIView *view7 = [self cellView:CGRectMake(20, 450+i*20, 180, 20) withName1:array70[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view7];
    }
    
    //横线
    UIImageView *imageView8 = [self createImageView:CGRectMake(30, 530, 180, 1)];
    [scrollView addSubview:imageView8];
    //
    UIView *view9 = [self cellView:CGRectMake(20, 530, 180, 20) withName1:@"Bezier曲线" withName2:@"" withN:@"2" withTrue:NO];
        [scrollView addSubview:view9];
   
    //横线
    UIImageView *imageView9 = [self createImageView:CGRectMake(30, 550, 180, 1)];
    [scrollView addSubview:imageView9];
    //重建 反转方向
    NSArray *array90 = @[@"重建",@"反转方向"];
    for (int i = 0; i< 2; i++) {
        UIView *view7 = [self cellView:CGRectMake(20, 550+i*20, 180, 20) withName1:array90[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view7];
    }
    return view;
}
//网格显示
-(UIView*)createWangGXS:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*1.93);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    //11
    NSArray *array1 = @[@"24",@"23",@"22",@"21",@"20",@"19",@"18",@"17",@"16",@"15",@"14",@"13",@"12",@"11",@"10",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2",@"1"];
    for (int i = 24; i > 0; i--) {
        CGRect frame1 = CGRectMake(0, (24-i)*20+13, 20, 20);
        if(i <= 13){
            frame1 = CGRectMake(0, 248+(13-i)*20, 20, 20);
        }
        if (i <= 11) {
            frame1 = CGRectMake(0,300+(11-i)*20, 20, 20);
        }
        if (i <= 5) {
            frame1 = CGRectMake(0,438+(5-i)*20, 20, 20);
        }
        if (i == 1) {
             frame1 = CGRectMake(0,535, 20, 20);
        }
        
        [self createImageViewButton:subView withFrame:frame1 withName:array1 [24-i]];
    }
    
    [scrollView addSubview:subView];
    
    //横线
    UIView *imageView1 = [self createImageView2:CGRectMake(10, 0, 205, 20) withName:@"法线"];
    [scrollView addSubview:imageView1];
    //平均 一致 反转 设定法线角度... 设定为面 设定顶点法线
    NSArray *array10 = @[@"平均",@"一致",@"反转",@"设定法线角度...",@"设定为面",@"设定顶点法线"];
    NSArray *array12 = @[@"1",@"",@"1",@"",@"1",@"1"];
    for (int i = 0; i< 6; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 15+i*20, 180, 20) withName1:array10[i] withName2:@"" withN:array12[i] withTrue:NO];
        [scrollView addSubview:view1];
    }
    
    //横线
    UIImageView *imageView2 = [self createImageView:CGRectMake(30, 135, 180, 1)];
    [scrollView addSubview:imageView2];
    //硬边化 软边化
    NSArray *array20 = @[@"硬边化",@"软边化"];
    for (int i = 0; i< 2; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 135+i*20, 180, 20) withName1:array20[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view2];
    }
    
    //横线
    UIImageView *imageView3 = [self createImageView:CGRectMake(30, 175, 180, 1)];
    [scrollView addSubview:imageView3];
    //锁定法线 解除锁定法线
    NSArray *array30 = @[@"锁定法线",@"解除锁定法线"];
    for (int i = 0; i< 2; i++) {
        UIView *view3 = [self cellView:CGRectMake(20, 175+i*20, 180, 20) withName1:array30[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view3];
    }
    
    //横线
    UIImageView *imageView4 = [self createImageView:CGRectMake(30, 215, 180, 1)];
    [scrollView addSubview:imageView4];
    //顶点法线编辑工具
    UIView *view4 = [self cellView:CGRectMake(20, 215, 180, 20) withName1:@"顶点法线编辑工具" withName2:@"" withN:@"1" withTrue:NO];
    [scrollView addSubview:view4];
    
    //横线
    UIView *imageView5 = [self createImageView2:CGRectMake(15, 235, 200, 20) withName:@"顶点颜色"];
    [scrollView addSubview:imageView5];
    //应用颜色 绘制顶点颜色工具
    NSArray *array50 = @[@"应用颜色",@"绘制顶点颜色工具"];
    
    for (int i = 0; i< 2; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 250+i*20, 180, 20) withName1:array50[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view1];
    }
    
    //横线
    UIView *imageView6 = [self createImageView2:CGRectMake(20, 290, 195, 20) withName:@"顶点颜色集"];
    [scrollView addSubview:imageView6];
    //创建空集  删除当前集 重命名当前集... 修改当前集
    NSArray *array60 = @[@"创建空集",@"删除当前集",@"重命名当前集...",@"修改当前集"];
    NSArray *array62 = @[@"1",@"",@"",@""];
    for (int i = 0; i< 4; i++) {
        UIView *view6 = [self cellView:CGRectMake(20, 305+i*20, 180, 20) withName1:array60[i] withName2:@"" withN:array62[i] withTrue:NO];
        [scrollView addSubview:view6];
    }
    
    //横线
    UIImageView *imageView7 = [self createImageView:CGRectMake(30, 385, 180, 1)];
    [scrollView addSubview:imageView7];
    //为顶点颜色设置关键帧
    UIView *view7 = [self cellView:CGRectMake(20, 385, 180, 20) withName1:@"为顶点颜色设置关键帧" withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view7];
    
    //横线
    UIImageView *imageView8 = [self createImageView:CGRectMake(30, 405, 180, 1)];
    [scrollView addSubview:imageView8];
    //颜色集编辑器
    UIView *view8 = [self cellView:CGRectMake(20, 405, 180, 20) withName1:@"颜色集编辑器" withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view8];
    
    //横线
    UIView *imageView9 = [self createImageView2:CGRectMake(20, 425, 195, 20) withName:@"顶点烘焙集"];
    [scrollView addSubview:imageView9];
    //创建空集  删除当前集 重命名当前集... 修改当前集
    NSArray *array90 = @[@"预照明(Maya)",@"指定新集",@"指定现有集",@"编辑指定的集"];
    NSArray *array92 = @[@"1",@"",@"2",@""];
    for (int i = 0; i< 4; i++) {
        UIView *view9 = [self cellView:CGRectMake(20, 440+i*20, 180, 20) withName1:array90[i] withName2:@"" withN:array92[i] withTrue:NO];
        [scrollView addSubview:view9];
    }
    
    //横线
    UIView *imageView10 = [self createImageView2:CGRectMake(20, 520, 195, 20) withName:@"显示属性"];
    [scrollView addSubview:imageView10];
    //切换显示颜色属性 对材质通道上色 材质混合设置 逐实例共享
    NSArray *array100 = @[@"切换显示颜色属性",@"对材质通道上色",@"材质混合设置",@"逐实例共享"];
    NSArray *array102 = @[@"",@"2",@"2",@"2"];
    for (int i = 0; i< 4; i++) {
        UIView *view10 = [self cellView:CGRectMake(20, 535+i*20, 180, 20) withName1:array100[i] withName2:@"" withN:array102[i] withTrue:NO];
        [scrollView addSubview:view10];
    }
    return view;
}
//网格工具
-(UIView*)createWangGGJ:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*1);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];

   //附加到多边形 连接 折痕 创建多边形 插入循环边 生成洞 多切割 偏移循环边 绘制减少权重 绘制传递属性 四边形绘制 雕刻工具 滑动边 目标焊接
    NSArray *array1 =@[@"附加到多边形",@"连接",@"折痕",@"创建多边形",@"插入循环边",@"生成洞",@"多切割",@"偏移循环边",@"绘制减少权重",@"绘制传递属性",@"四边形绘制",@"雕刻工具",@"滑动边",@"目标焊接"];
    for (int i = 0; i<14; i++) {
        CGRect frame1 = CGRectMake(0, 33+i*20, 20, 20);
        [self createImageViewButton:subView withFrame:frame1 withName:array1[i]];
    }
   
    
    [scrollView addSubview:subView];
  
   
    //隐藏建模工具包
    UIView *view1 = [self cellView:CGRectMake(20, 0, 180, 20) withName1:@"隐藏建模工具包" withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view1];
    //横线
    UIView *imageView1 = [self createImageView2:CGRectMake(5, 20, 215, 20) withName:@"工具"];
    [scrollView addSubview:imageView1];
    
    //附加到多边形 连接 折痕 创建多边形 插入循环边 生成洞 多切割 偏移循环边 绘制减少权重 绘制传递属性 四边形绘制 雕刻工具 滑动边 目标焊接
    NSArray *array20 = @[@"附加到多边形",@"连接",@"折痕",@"创建多边形",@"插入循环边",@"生成洞",@"多切割",@"偏移循环边",@"绘制减少权重",@"绘制传递属性",@"四边形绘制",@"雕刻工具",@"滑动边",@"目标焊接"];
    NSArray *array22 = @[@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"2",@"1",@"1"];
  
    for (int i = 0; i< 14; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 35+i*20, 180, 20) withName1:array20[i] withName2:@"" withN:array22[i] withTrue:NO];
        [scrollView addSubview:view2];
    }
    return view;
}
//编辑网格
-(UIView*)createBianJWG:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];

    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*1.92);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    //@"添加分段",@"倒角",@"桥接",@"收拢",@"连接",@"分离",@"挤出",@"合并",@"合并到中心",@"变换"
    NSArray *array1 = @[@"添加分段",@"倒角",@"桥接",@"收拢",@"连接",@"分离",@"挤出",@"合并",@"合并到中心",@"变换"];
    for(int i = 0;i < 10;i++){
    CGRect frame1 = CGRectMake(0, 13+i*20, 20, 20);
    [self createImageViewButton:subView withFrame:frame1 withName:array1[i]];
    }
    //翻转 对称
    NSArray *array2 = @[@"翻转",@"对称"];
    for(int i = 0;i < 2;i++){
        CGRect frame2 = CGRectMake(0, 213+i*20, 20, 20);
        [self createImageViewButton:subView withFrame:frame2 withName:array2[i]];
    }
    
    //平均化顶点 切角顶点 对顶点重新排序
    NSArray *array3 = @[@"平均化顶点",@"切角顶点",@"对顶点重新排序"];
    for(int i = 0;i < 3;i++){
        CGRect frame3 = CGRectMake(0, 267+i*20, 20, 20);
        [self createImageViewButton:subView withFrame:frame3 withName:array3[i]];
    }
    
    //删除边/顶点 编辑边流 翻转三角形边 反向自旋边 正向自旋边
    
    NSArray *array4 = @[@"删除边",@"编辑边流",@"翻转三角形边",@"反向自旋边",@"正向自旋边"];
    for(int i = 0;i < 5;i++){
    CGRect frame4 = CGRectMake(0, 342+i*20, 20, 20);
    [self createImageViewButton:subView withFrame:frame4 withName:array4[i]];
    }
    //指定不可见面 复制 提取 刺破 楔形
    NSArray *array5 = @[@"指定不可见面",@"复制",@"提取",@"刺破",@"楔形"];
    for(int i = 0;i < 5;i++){
        CGRect frame5 = CGRectMake(0, 457+i*20, 20, 20);
        [self createImageViewButton:subView withFrame:frame5 withName:array5[i]];
    }
    
    //在网格上投影射线  使用投影的曲线分割网格
    NSArray *array6 = @[@"在网格上投影曲线",@"使用投影的曲线分割网格"];
    for(int i = 0;i < 2;i++){
        CGRect frame6 = CGRectMake(0, 573+i*20, 20, 20);
        [self createImageViewButton:subView withFrame:frame6 withName:array6[i]];
    }

    [scrollView addSubview:subView];
    
    //横线
    UIView *imageView1 = [self createImageView2:CGRectMake(10, 0, 205, 20) withName:@"组件"];
    [scrollView addSubview:imageView1];
    //添加分段 倒角 桥接 收拢 连接 分离 挤出 合并 合并到中心 变换
    NSArray *array10 = @[@"添加分段",@"倒角",@"桥接",@"收拢",@"连接",@"分离",@"挤出",@"合并",@"合并到中心",@"变换"];
    NSArray *array12 = @[@"1",@"1",@"1",@"",@"1",@"",@"1",@"1",@"",@"1"];
    for (int i = 0; i< 10; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 15+i*20, 180, 20) withName1:array10[i] withName2:@"" withN:array12[i] withTrue:NO];
        [scrollView addSubview:view1];
    }
    
    //横线
    UIImageView *imageView2 = [self createImageView:CGRectMake(30, 215, 180, 1)];
    [scrollView addSubview:imageView2];
    //翻转  对称
    NSArray *array20 = @[@"翻转",@"对称"];
    for (int i = 0; i< 2; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 215+i*20, 180, 20) withName1:array20[i] withName2:@"" withN:@"" withTrue:YES];
        [scrollView addSubview:view2];
    }
    
    //横线
    UIView *imageView3 = [self createImageView2:CGRectMake(5, 255, 210, 20) withName:@"顶点"];
    [scrollView addSubview:imageView3];
    //平均化顶点 切角顶点
    NSArray *array30 = @[@"平均化顶点",@"切角顶点"];
    for (int i = 0; i< 2; i++) {
        UIView *view3 = [self cellView:CGRectMake(20, 270+i*20, 180, 20) withName1:array30[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view3];
    }
    //对顶点重新排序
    UIView *view4 = [self cellView:CGRectMake(20, 310, 180, 20) withName1:@"对顶点重新排序" withName2:@"" withN:@"" withTrue:YES];
    [scrollView addSubview:view4];
    
    //横线
    UIView *imageView5 = [self createImageView2:CGRectMake(0, 330, 215, 20) withName:@"边"];
    [scrollView addSubview:imageView5];
    //删除边/顶点 编辑边流 翻转三角形边 反向自旋边 正向自旋边
    NSArray *array50 = @[@"删除边/顶点",@"编辑边流",@"翻转三角形边",@"反向自旋边",@"正向自旋边"];
    NSArray *array51 = @[@"Ctrl+Del",@"",@"",@"Ctrl+Alt+Left",@"Ctrl+Alt+Right"];
    NSArray *array52 = @[@"",@"1",@"",@"",@""];
    for (int i = 0; i< 5; i++) {
        UIView *view5 = [self cellView:CGRectMake(20, 345+i*20, 180, 20) withName1:array50[i] withName2:array51[i] withN:array52[i] withTrue:NO];
        [scrollView addSubview:view5];
    }
    
    //横线
    UIView *imageView6 = [self createImageView2:CGRectMake(0, 445, 215, 20) withName:@"边"];
    [scrollView addSubview:imageView6];
    //删除边/顶点 编辑边流 翻转三角形边 反向自旋边 正向自旋边
    NSArray *array60 = @[@"指定不可见面",@"复制",@"提取",@"刺破"];
    for (int i = 0; i< 4; i++) {
        UIView *view6 = [self cellView:CGRectMake(20, 460+i*20, 180, 20) withName1:array60[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view6];
    }
    
    //楔形
    UIView *view7 = [self cellView:CGRectMake(20, 540, 180, 20) withName1:@"楔形" withName2:@"" withN:@"" withTrue:YES];
    [scrollView addSubview:view7];
    
    //横线
    UIView *imageView8 = [self createImageView2:CGRectMake(10, 560, 215, 20) withName:@"曲线"];
    [scrollView addSubview:imageView8];
    //在网格上投影曲线  使用投影的曲线分割网格
    NSArray *array80 = @[@"在网格上投影曲线",@"使用投影的曲线分割网格"];
    for (int i = 0; i< 2; i++) {
        UIView *view8 = [self cellView:CGRectMake(20, 575+i*20, 180, 20) withName1:array80[i] withName2:@"" withN:@"1" withTrue:NO];
        [scrollView addSubview:view8];
    }
    return view;
}
//网格
-(UIView*)createWangG:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*1.28);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    
    //结合
    CGRect frame1 = CGRectMake(0, 33, 20, 20);
    [self createImageViewButton:subView withFrame:frame1 withName:@"结合"];
    //分离
    CGRect frame2 = CGRectMake(0, 53, 20, 20);
    [self createImageViewButton:subView withFrame:frame2 withName:@"分离"];
    //填充洞
    CGRect frame3 = CGRectMake(0, 107, 20, 20);
    [self createImageViewButton:subView withFrame:frame3 withName:@"填充洞"];
    //减少
    CGRect frame4 = CGRectMake(0, 127, 20, 20);
    [self createImageViewButton:subView withFrame:frame4 withName:@"减少"];
    //平滑
    CGRect frame5 = CGRectMake(0, 147, 20, 20);
    [self createImageViewButton:subView withFrame:frame5 withName:@"平滑"];
    //三角化
    CGRect frame6 = CGRectMake(0, 167, 20, 20);
    [self createImageViewButton:subView withFrame:frame6 withName:@"三角化"];
    //四边形化
    CGRect frame7 = CGRectMake(0, 187, 20, 20);
    [self createImageViewButton:subView withFrame:frame7 withName:@"四边形化"];
    //镜像
    CGRect frame8 = CGRectMake(0, 223, 20, 20);
    [self createImageViewButton:subView withFrame:frame8 withName:@"镜像"];
    //传递属性
    CGRect frame9 = CGRectMake(0, 283, 20, 20);
    [self createImageViewButton:subView withFrame:frame9 withName:@"传递属性"];
    //传递着色集
    CGRect frame10 = CGRectMake(0, 303, 20, 20);
    [self createImageViewButton:subView withFrame:frame10 withName:@"传递着色集"];
    //传递顶点顺序
    CGRect frame11 = CGRectMake(0, 323, 20, 20);
    [self createImageViewButton:subView withFrame:frame11 withName:@"传递顶点顺序"];
    //清理
    CGRect frame12 = CGRectMake(0, 363, 20, 20);
    [self createImageViewButton:subView withFrame:frame12 withName:@"清理"];
    
     [scrollView addSubview:subView];
    
    //横线
    UIView *imageView1 = [self createImageView2:CGRectMake(10, 0, 205, 20) withName:@"结合"];
    [scrollView addSubview:imageView1];
    //布尔  结合  分离
    NSArray *array10 = @[@"布尔",@"结合",@"分离"];
    NSArray *array12 = @[@"2",@"1",@""];
    for (int i = 0; i< 3; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 15+i*20, 180, 20) withName1:array10[i] withName2:@"" withN:array12[i] withTrue:NO];
        [scrollView addSubview:view1];
    }
    
    //横线
    UIView *imageView2 = [self createImageView2:CGRectMake(15, 75, 200, 20) withName:@"划分网格"];
    [scrollView addSubview:imageView2];
    //一致 填充词 减少 平滑
    NSArray *array20 = @[@"一致",@"填充词",@"减少",@"平滑"];
    NSArray *array22 = @[@"1",@"",@"1",@"1"];
    for (int i = 0; i< 4; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 90+i*20, 180, 20) withName1:array20[i] withName2:@"" withN:array22[i] withTrue:NO];
        [scrollView addSubview:view1];
    }
    
    //横线
    UIImageView *imageView3 = [self createImageView:CGRectMake(30, 170, 180, 1)];
    [scrollView addSubview:imageView3];
    //三角化 四边形化
    NSArray *array30 = @[@"三角化",@"四边形化"];
    NSArray *array32 = @[@"",@"1"];
    for (int i = 0; i< 2; i++) {
        UIView *view3 = [self cellView:CGRectMake(20, 170+i*20, 180, 20) withName1:array30[i] withName2:@"" withN:array32[i] withTrue:NO];
        [scrollView addSubview:view3];
    }
    
    //横线
    UIView *imageView4 = [self createImageView2:CGRectMake(10, 210, 205, 20) withName:@"镜像"];
    [scrollView addSubview:imageView4];
    //镜像
    UIView *view4 = [self cellView:CGRectMake(20, 225, 180, 20) withName1:@"镜像" withName2:@"" withN:@"1" withTrue:YES];
    [scrollView addSubview:view4];
    
    //横线
    UIView *imageView5 = [self createImageView2:CGRectMake(10, 245, 205, 20) withName:@"传递"];
    [scrollView addSubview:imageView5];
    //剪贴板操作 传递属性 传递着色集
    NSArray *array50 = @[@"剪贴板操作",@"传递属性",@"传递着色集"];
    NSArray *array52 = @[@"2",@"1",@"1"];
    for (int i = 0; i< 3; i++) {
        UIView *view5 = [self cellView:CGRectMake(20, 265+i*20, 180, 20) withName1:array50[i] withName2:@"" withN:array52[i] withTrue:NO];
        [scrollView addSubview:view5];
    }
    
    //传递顶点顺序
    UIView *view6 = [self cellView:CGRectMake(20,325, 180, 20) withName1:@"传递顶点顺序" withName2:@"" withN:@"" withTrue:YES];
    [scrollView addSubview:view6];
    
    //横线
    UIView *imageView7 = [self createImageView2:CGRectMake(10, 345, 205, 20) withName:@"优化"];
    [scrollView addSubview:imageView7];
    //清理...
    UIView *view7 = [self cellView:CGRectMake(20, 365, 180, 20) withName1:@"清理..." withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view7];
    
    //横线
    UIView *imageView8 = [self createImageView:CGRectMake(20, 385, 190, 1)];
    [scrollView addSubview:imageView8];
    //平滑代理
    UIView *view8 = [self cellView:CGRectMake(20, 385, 180, 20) withName1:@"平滑代理" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view8];
    
    return view;
}

//窗口
-(UIView*)createChuangK:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];

    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*1);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    //播放预览
    UIImageView *imageView00 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 213, 20, 20)];
    imageView00.image = [UIImage imageNamed:@"窗口"];
    [subView addSubview:imageView00];
    
    [scrollView addSubview:subView];

    //工作区
    UIView *view1 = [self cellView:CGRectMake(20, 0, 180, 20) withName1:@"工作区" withName2:@"" withN:@"2" withTrue:YES];
    [scrollView addSubview:view1];
    
    //横线
    UIView *imageView2 = [self createImageView2:CGRectMake(10, 20, 205, 20) withName:@"编辑器"];
    [scrollView addSubview:imageView2];
    //常规编辑器 建模编辑器 动画编辑器 渲染编辑器 关系编辑器 UI元素 设置/首选项
    NSArray *array20 = @[@"常规编辑器",@"建模编辑器",@"动画编辑器",@"渲染编辑器",@"关系编辑器",@"UI元素",@"设置/首选项"];
    for (int i = 0; i< 7; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 35+i*20, 180, 20) withName1:array20[i] withName2:@"" withN:@"2" withTrue:NO];
        [scrollView addSubview:view1];
    }
    
    //横线
    UIImageView *imageView3 = [self createImageView:CGRectMake(30, 175, 180, 1)];
    [scrollView addSubview:imageView3];
    //大纲视图 节点编辑器 播放预览
    NSArray *array30 = @[@"大纲视图",@"节点编辑器",@"播放预览"];
    NSArray *array32 = @[@"",@"",@"1"];
    for (int i = 0; i< 3; i++) {
        UIView *view3 = [self cellView:CGRectMake(20, 175+i*20, 180, 20) withName1:array30[i] withName2:@"" withN:array32[i] withTrue:NO];
        [scrollView addSubview:view3];
    }
    
    //横线
    UIImageView *imageView4 = [self createImageView:CGRectMake(30, 235, 180, 1)];
    [scrollView addSubview:imageView4];
    //最小化应用程序 提升主窗口 提升应用程序窗口
    NSArray *array40 = @[@"最小化应用程序",@"提升主窗口",@"提升应用程序窗口"];

    for (int i = 0; i< 3; i++) {
        UIView *view4 = [self cellView:CGRectMake(20, 235+i*20, 180, 20) withName1:array40[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view4];
    }
    
    return view;
}
//显示
-(UIView*)createXianS:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];

    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*1.1);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    [scrollView addSubview:subView];
    
    //横线
    UIView *imageView1 = [self createImageView2:CGRectMake(10, 0, 205, 20) withName:@"视口"];
    [scrollView addSubview:imageView1];
    //栅格 题头显示
    NSArray *array10 = @[@"栅格",@"题头显示"];
    NSArray *array12 = @[@"1",@"2"];
    for (int i = 0; i< 2; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 15+i*20, 180, 20) withName1:array10[i] withName2:@"" withN:array12[i] withTrue:NO];
        [scrollView addSubview:view1];
    }
    
    //横线
    UIView *imageView2 = [self createImageView2:CGRectMake(10, 55, 205, 20) withName:@"对象"];
    [scrollView addSubview:imageView2];
    //隐藏 显示 切换显示/隐藏 根据摄影机可见性
    NSArray *array20 = @[@"隐藏",@"显示",@"切换显示/隐藏",@"根据摄影机可见性"];
    NSArray *array22 = @[@"2",@"2",@"1",@"2"];
    for (int i = 0; i< 4; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 70+i*20, 180, 20) withName1:array20[i] withName2:@"" withN:array22[i] withTrue:NO];
        [scrollView addSubview:view2];
    }
    
    //横线
    UIImageView *imageView3 = [self createImageView:CGRectMake(30, 150, 180, 1)];
    [scrollView addSubview:imageView3];
    //线框颜色... 对象显示 变换显示
    NSArray *array30 = @[@"线框颜色...",@"对象显示",@"变换显示"];
    NSArray *array32 = @[@"",@"2",@"2"];
    for (int i = 0; i< 3; i++) {
        UIView *view3 = [self cellView:CGRectMake(20, 150+i*20, 180, 20) withName1:array30[i] withName2:@"" withN:array32[i] withTrue:NO];
        [scrollView addSubview:view3];
    }
    
    
    
    //横线
    UIImageView *imageView5 = [self createImageView:CGRectMake(30, 210, 180, 1)];
    [scrollView addSubview:imageView5];
    //多边形 NURBS 动画 渲染
    NSArray *array50 = @[@"多边形",@"NURBS",@"动画",@"渲染"];
    for (int i = 0; i< 4; i++) {
        UIView *view5 = [self cellView:CGRectMake(20, 210+i*20, 180, 20) withName1:array50[i] withName2:@"" withN:@"2" withTrue:NO];
        [scrollView addSubview:view5];
    }
    
    //横线
    UIImageView *imageView6 = [self createImageView:CGRectMake(30, 290, 180, 1)];
    [scrollView addSubview:imageView6];
    //在所有视图中框显所有内容
    UIView *view5 = [self cellView:CGRectMake(20, 290, 180, 20) withName1:@"在所有视图中框显所有内容" withName2:@"Shift+A" withN:@"" withTrue:NO];
    [scrollView addSubview:view5];
    //在所有视图中框显当前选择(包括子对象) 在所有视图中框显当前选择
    NSArray *array60 = @[@"在所有视图中框显当前选择",@"在所有视图中框显当前选择(包含子对象)"];
     NSArray *array61 = @[@"Shift+F",@"Ctrl+Shift+F"];
    for (int i = 0; i< 2; i++) {
        UIView *view6 = [self cellView:CGRectMake(20, 310+i*20, 180, 20) withName1:array60[i] withName2:array61[i] withN:@"" withTrue:YES];
        [scrollView addSubview:view6];
    }
    return view;
}
//修改
-(UIView*)createXiuG:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];

    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*1.75);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    //对齐工具
    UIImageView *imageView00 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 183, 20, 20)];
    imageView00.image = [UIImage imageNamed:@"对齐"];
    [subView addSubview:imageView00];
    
    //捕捉到一起工具
    UIImageView *imageView01 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 203, 20, 20)];
    imageView01.image = [UIImage imageNamed:@"捕捉到一起工具"];
    [subView addSubview:imageView01];
    
    
    //激活
    UIImageView *imageView02 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 405, 20, 20)];
    imageView02.image = [UIImage imageNamed:@"激活"];
    [subView addSubview:imageView02];
    
    
    //绘制脚本工具
    UIImageView *imageView03 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 477, 20, 20)];
    imageView03.image = [UIImage imageNamed:@"绘制脚本工具"];
    [subView addSubview:imageView03];
    
    
    //绘制属性工具
    UIImageView *imageView04 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 497, 20, 20)];
    imageView04.image = [UIImage imageNamed:@"绘制属性工具"];
    [subView addSubview:imageView04];
    
    [scrollView addSubview:subView];
    
    //横线
    UIView *imageView1 = [self createImageView2:CGRectMake(10, 0, 205, 20) withName:@"变换"];
    [scrollView addSubview:imageView1];
    
    //变换工具 重置变换 冻结变换
    NSArray *array10 = @[@"变换工具",@"重置变换",@"冻结变换"];
    NSArray *array12 = @[@"2",@"1",@"1"];
    
    for (int i = 0; i< 3; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 15+i*20, 180, 20) withName1:array10[i] withName2:@"" withN:array12[i] withTrue:NO];
        [scrollView addSubview:view1];
    }
    
    //匹配变换
    UIView *view2 = [self cellView:CGRectMake(20, 75, 180, 20) withName1:@"匹配变换" withName2:@"" withN:@"2" withTrue:YES];
    [scrollView addSubview:view2];
    
    //横线
    UIView *imageView3 = [self createImageView2:CGRectMake(10, 95, 205, 20) withName:@"枢轴"];
    [scrollView addSubview:imageView3];
    
    //居中枢轴  烘焙枢轴
    NSArray *array30 = @[@"居中枢轴",@"烘焙枢轴"];
    NSArray *array32 = @[@"",@"1"];
    for (int i = 0; i< 2; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 110+i*20, 180, 20) withName1:array30[i] withName2:@"" withN:array32[i] withTrue:NO];
        [scrollView addSubview:view1];
    }
    
    //横线
    UIView *imageView4 = [self createImageView2:CGRectMake(10, 150, 205, 20) withName:@"对齐"];
    [scrollView addSubview:imageView4];
    //捕捉对齐对象 对齐工具 捕捉到一起工具
    NSArray *array40 = @[@"捕捉对齐对象",@"对齐工具",@"捕捉到一起工具"];
    NSArray *array42 = @[@"2",@"",@"1"];
    for (int i = 0; i< 3; i++) {
        UIView *view4 = [self cellView:CGRectMake(20, 165+i*20, 180, 20) withName1:array40[i] withName2:@"" withN:array42[i] withTrue:NO];
        [scrollView addSubview:view4];
    }
    
    //横线
    UIView *imageView5 = [self createImageView2:CGRectMake(10, 225, 205, 20) withName:@"节点"];
    [scrollView addSubview:imageView5];
    //节点求值
    UIView *view5 = [self cellView:CGRectMake(20, 240, 180, 20) withName1:@"节点求值" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view5];

    //横线
    UIView *imageView6 = [self createImageView2:CGRectMake(10, 260, 205, 20) withName:@"命名"];
    [scrollView addSubview:imageView6];
    //添加层次名称前缀... 搜索和替换名称...
    NSArray *array60 = @[@"添加层次名称前缀...",@"搜索和替换名称..."];
    for (int i = 0; i< 2; i++) {
        UIView *view6 = [self cellView:CGRectMake(20, 275+i*20, 180, 20) withName1:array60[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view6];
    }
    
    //横线
    UIView *imageView7 = [self createImageView2:CGRectMake(10, 315, 205, 20) withName:@"属性"];
    [scrollView addSubview:imageView7];
    //添加属性... 编辑属性... 删除属性...
    NSArray *array70 = @[@"添加属性...",@"编辑属性...",@"删除属性..."];
    for (int i = 0; i< 3; i++) {
        UIView *view7 = [self cellView:CGRectMake(20, 330+i*20, 180, 20) withName1:array70[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view7];
    }
    
    //横线
    UIView *imageView8 = [self createImageView2:CGRectMake(10, 390, 205, 20) withName:@"对象"];
    [scrollView addSubview:imageView8];
    //激活 替换对象
    NSArray *array80 = @[@"激活",@"替换对象"];
    NSArray *array82 = @[@"",@"1"];
    for (int i = 0; i< 2; i++) {
        UIView *view8 = [self cellView:CGRectMake(20,405+i*20, 180, 20) withName1:array80[i] withName2:@"" withN:array82[i] withTrue:NO];
        [scrollView addSubview:view8];
    }
    
    //横线
    UIImageView *imageView9 = [self createImageView:CGRectMake(30, 445, 180, 1)];
    [scrollView addSubview:imageView9];
    //转化
    UIView *view9 = [self cellView:CGRectMake(20, 445, 180, 20) withName1:@"转化" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view9];
    
    //横线
    UIView *imageView10 = [self createImageView2:CGRectMake(15, 465,200, 20) withName:@"绘制工具"];
    [scrollView addSubview:imageView10];
    //绘制脚本工具 绘制属性工具
    NSArray *array100 = @[@"绘制脚本工具",@"绘制属性工具"];
    NSArray *array102 = @[@"1",@"1"];
    for (int i = 0; i< 2; i++) {
        UIView *view10 = [self cellView:CGRectMake(20,480+i*20, 180, 20) withName1:array100[i] withName2:@"" withN:array102[i] withTrue:NO];
        [scrollView addSubview:view10];
    }
    
    //横线
    UIView *imageView11 = [self createImageView2:CGRectMake(10,520, 205, 20) withName:@"资源"];
    [scrollView addSubview:imageView11];
    //资源
    UIView *view11 = [self cellView:CGRectMake(20,535, 180, 20) withName1:@"资源" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view11];

    return view;
}
//选择
-(UIView*)createXuanZ:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];

    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*1.7);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    //类似 增长 收缩
    UIImageView *imageView01 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 97, 20, 20)];
    imageView01.image = [UIImage imageNamed:@"类似"];
    [subView addSubview:imageView01];
    
    UIImageView *imageView02 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 117, 20, 20)];
    imageView02.image = [UIImage imageNamed:@"增长"];
    [subView addSubview:imageView02];
    
    UIImageView *imageView03 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 137, 20, 20)];
    imageView03.image = [UIImage imageNamed:@"收缩"];
    [subView addSubview:imageView03];
    //对象/组件
    UIImageView *imageView04 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 197, 20, 20)];
    imageView04.image = [UIImage imageNamed:@"对象/组件"];
    [subView addSubview:imageView04];
    //连续边 最短边路径工具
    UIImageView *imageView05 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 257, 20, 20)];
    imageView05.image = [UIImage imageNamed:@"连续边"];
    [subView addSubview:imageView05];
    
    UIImageView *imageView06 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 277, 20, 20)];
    imageView06.image = [UIImage imageNamed:@"最短边路径工具"];
    [subView addSubview:imageView06];
    //使用约束
    UIImageView *imageView07 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 317, 20, 20)];
    imageView07.image = [UIImage imageNamed:@"使用约束..."];
    [subView addSubview:imageView07];
    //所有CV 第一个CV 最后一个CV 簇曲线
    UIImageView *imageView08 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 377, 20, 20)];
    imageView08.image = [UIImage imageNamed:@"所有CV"];
    [subView addSubview:imageView08];
    
    UIImageView *imageView09 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 397, 20, 20)];
    imageView09.image = [UIImage imageNamed:@"第一个CV"];
    [subView addSubview:imageView09];
    
    UIImageView *imageView010 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 417, 20, 20)];
    imageView010.image = [UIImage imageNamed:@"最后一个CV"];
    [subView addSubview:imageView010];
    
    UIImageView *imageView011 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 437, 20, 20)];
    imageView011.image = [UIImage imageNamed:@"簇曲线"];
    [subView addSubview:imageView011];
    
    //CV选择边界 曲面边界
    UIImageView *imageView012 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 497, 20, 20)];
    imageView012.image = [UIImage imageNamed:@"CV选择边界"];
    [subView addSubview:imageView012];
    
    UIImageView *imageView013 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 517, 20, 20)];
    imageView013.image = [UIImage imageNamed:@"曲面边界"];
    [subView addSubview:imageView013];
    
    [scrollView addSubview:subView];

    //全部 全部按类型 取消选择全部 层次 反转 类似
    NSArray *array10 = @[@"全部",@"全部按类型",@"取消选择全部",@"层次",@"反转",@"类似"];
    NSArray *array11 = @[@"Ctrl+Shift+A",@"",@"Alt+D",@"",@"Ctrl+Shift+I",@""];
    NSArray *array12 = @[@"",@"2",@"",@"",@"",@"1"];
    
    for (int i = 0; i< 6; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, i*20, 180, 20) withName1:array10[i] withName2:array11[i] withN:array12[i] withTrue:NO];
        [scrollView addSubview:view1];
    }
    //横线
    UIImageView *imageView1 = [self createImageView:CGRectMake(30, 120, 180, 1)];
    [scrollView addSubview:imageView1];
    
    //增长 收缩
    NSArray *array20 = @[@"增长",@"收缩"];
    NSArray *array21 = @[@">",@"<"];
    for (int i = 0; i< 2; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 120+i*20, 180, 20) withName1:array20[i] withName2:array21[i] withN:@"" withTrue:NO];
        [scrollView addSubview:view2];
    }
    //横线
    UIImageView *imageView2 = [self createImageView:CGRectMake(30, 160, 180, 1)];
    [scrollView addSubview:imageView2];
    
    //快速选择集
    UIView *view3 = [self cellView:CGRectMake(20, 160, 180, 20) withName1:@"快速选择集" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view3];
    //横线
    UIView *imageView3 = [self createImageView2:CGRectMake(10, 180, 200, 20) withName:@"类型"];
    [scrollView addSubview:imageView3];
    
    //对象/组件
    UIView *view4 = [self cellView:CGRectMake(20, 200, 180, 20) withName1:@"对象/组件" withName2:@"F8" withN:@"" withTrue:NO];
    [scrollView addSubview:view4];
    //横线
    UIView *imageView4 = [self createImageView2:CGRectMake(10, 220, 200, 20) withName:@"多边形"];
    [scrollView addSubview:imageView4];
    
    //组件
    UIView *view5 = [self cellView:CGRectMake(20, 240, 180, 20) withName1:@"组件" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view5];
    //横线
    UIImageView *imageView5 = [self createImageView:CGRectMake(30, 260, 180, 1)];
    [scrollView addSubview:imageView5];
    
    //连续边  最短路径工具
    NSArray *array60 = @[@"连续边",@"最短边路径工具"];
    NSArray *array62 = @[@"1",@""];
    for (int i = 0; i< 2; i++) {
        UIView *view6 = [self cellView:CGRectMake(20, 260+i*20, 180, 20) withName1:array60[i] withName2:@"" withN:array62[i] withTrue:NO];
        [scrollView addSubview:view6];
    }
    //横线
    UIImageView *imageView6 = [self createImageView:CGRectMake(30, 300, 180, 1)];
    [scrollView addSubview:imageView6];
    
    //转化当前选择  使用约束...
    NSArray *array70 = @[@"转化当前选择",@"使用约束..."];
    NSArray *array72 = @[@"2",@""];
    for (int i = 0; i< 2; i++) {
        UIView *view7 = [self cellView:CGRectMake(20, 300+i*20, 180, 20) withName1:array70[i] withName2:@"" withN:array72[i] withTrue:NO];
        [scrollView addSubview:view7];
    }
    //横线
    UIView *imageView7 = [self createImageView2:CGRectMake(20, 340, 190, 20) withName:@"NURBS 曲线"];
    [scrollView addSubview:imageView7];
    
    //组件
    UIView *view8 = [self cellView:CGRectMake(20, 360, 180, 20) withName1:@"组件" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view8];
    //横线
    UIView *imageView8 = [self createImageView:CGRectMake(30, 380, 180, 1) ];
    [scrollView addSubview:imageView8];
    
    //所有CV 第一个CV 最后一个CV
    NSArray *array90 = @[@"所有CV",@"第一个CV",@"最后一个CV"];
    for (int i = 0; i< 3; i++) {
        UIView *view9 = [self cellView:CGRectMake(20, 380+i*20, 180, 20) withName1:array90[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view9];
    }
    //横线
    UIView *imageView9 = [self createImageView:CGRectMake(20, 440, 200, 1)];
    [scrollView addSubview:imageView9];
    
    //簇曲线
    UIView *view10 = [self cellView:CGRectMake(20, 440, 180, 20) withName1:@"簇曲线" withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view10];
    //横线
    UIView *imageView10 = [self createImageView2:CGRectMake(20, 460, 190, 20) withName:@"NURBS 曲线"];
    [scrollView addSubview:imageView10];
    
    //组件
    UIView *view11 = [self cellView:CGRectMake(20, 480, 180, 20) withName1:@"组件" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view11];
    //横线
    UIView *imageView11 = [self createImageView:CGRectMake(30, 500, 180, 1) ];
    [scrollView addSubview:imageView11];

    //CV选择边界  曲面边界
    NSArray *array120 = @[@"CV选择边界",@"曲面边界"];
    NSArray *array122 = @[@"",@"1"];
    for (int i = 0; i< 2; i++) {
        UIView *view12 = [self cellView:CGRectMake(20, 500+i*20, 180, 20) withName1:array120[i] withName2:@"" withN:array122[i] withTrue:NO];
        [scrollView addSubview:view12];
    }

    return view;
}
//创建
-(UIView*)createChuangJ:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    

    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*1.28);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    //类型前的标志
    UIImageView *imageView01 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 133, 20, 20)];
    imageView01.image = [UIImage imageNamed:@"类型"];
    [subView addSubview:imageView01];
    //SVG前的标志
    UIImageView *imageView02 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 153, 20, 20)];
    imageView02.image = [UIImage imageNamed:@"SVG"];
    [subView addSubview:imageView02];
    //Adobe(R) Illustrator(R) 对象...
    UIImageView *imageView03 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 173, 20, 20)];
    imageView03.image = [UIImage imageNamed:@"ai"];
    [subView addSubview:imageView03];
    //构造平面
    UIImageView *imageView04 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 207, 20, 20)];
    imageView04.image = [UIImage imageNamed:@"构造平面"];
    [subView addSubview:imageView04];
    //定位器
    UIImageView *imageView05 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 247, 20, 20)];
    imageView05.image = [UIImage imageNamed:@"定位器"];
    [subView addSubview:imageView05];
    //注释
    UIImageView *imageView06 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 267, 20, 20)];
    imageView06.image = [UIImage imageNamed:@"注释"];
    [subView addSubview:imageView06];
    [scrollView addSubview:subView];
    
    //横线
    UIView *imageView1 = [self createImageView2:CGRectMake(10, 0, 200, 20) withName:@"对象"];
    [scrollView addSubview:imageView1];

    //NURBS 基本体  多边形基本体 体积基本体 灯光 摄影机 曲线工具
    NSArray *array10 = @[@"NURBS 基本体",@"多边形基本体",@"体积基本体",@"灯光",@"摄影机",@"曲线工具"];
    for (int i = 0; i< 6; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, 15+i*20, 180, 20) withName1:array10[i] withName2:@"" withN:@"2" withTrue:NO];
        [scrollView addSubview:view1];
    }
    
    //横线
    UIImageView *imageView2 = [self createImageView:CGRectMake(30, 135, 180, 1)];
    [scrollView addSubview:imageView2];

    //类型 SVG
    NSArray *array20 = @[@"类型",@"SVG"];
    for (int i = 0; i< 2; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 136+i*20, 180, 20) withName1:array20[i] withName2:@"" withN:@"" withTrue:YES];
        [scrollView addSubview:view2];
    }
    //Adobe(R) Illustrator(R) 对象...
    UIView *view3 = [self cellView:CGRectMake(20, 176, 180, 20) withName1:@"Adobe(R) Illustrator(R) 对象..." withName2:@"" withN:@"1" withTrue:NO];
    [scrollView addSubview:view3];
    
    //横线
    UIView *imageView4 = [self createImageView2:CGRectMake(20, 196, 200, 20) withName:@"构建辅助"];
    [scrollView addSubview:imageView4];
    
    //构造平面 自由图像平面 定位器 注释... 测量工具
    NSArray *array40 = @[@"构造平面",@"自由图像平面",@"定位器",@"注释...",@"测量工具"];
    NSArray *array42 = @[@"1",@"1",@"",@"",@"2"];
    for (int i = 0; i< 5; i++) {
        UIView *view4 = [self cellView:CGRectMake(20, 210+i*20, 180, 20) withName1:array40[i] withName2:@"" withN:array42[i] withTrue:NO];
        [scrollView addSubview:view4];
    }
    
    //横线
    UIView *imageView5 = [self createImageView2:CGRectMake(20, 310, 200, 20) withName:@"场景管理"];
    [scrollView addSubview:imageView5];
    
    //场景集合 空组 集 资源
    NSArray *array50 = @[@"场景集合",@"空组",@"集",@"资源"];
    NSArray *array52 = @[@"2",@"2",@"",@"2"];
    for (int i = 0; i< 4; i++) {
        UIView *view5 = [self cellView:CGRectMake(20, 325+i*20, 180, 20) withName1:array50[i] withName2:@"" withN:array52[i] withTrue:NO];
        [scrollView addSubview:view5];
    }

    return view;
}
//编辑
-(UIView*)createBianJView:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];
    


    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height - 10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*1.4);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height - 3)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    [scrollView addSubview:subView];

    //撤销  重做 重复 最近命令列表
    NSArray *array10 = @[@"撤销",@"重做",@"重复",@"最近命令列表"];
    NSArray *array11 = @[@"Ctrl+Z",@"Ctrl+Y",@"G",@""];
    for (int i = 0; i< 4; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, i*20, 180, 20) withName1:array10[i] withName2:array11[i] withN:@"" withTrue:NO];
        [scrollView addSubview:view1];
    }
    //横线
    UIImageView *imageView1 = [self createImageView:CGRectMake(30, 80, 180, 1)];
    [scrollView addSubview:imageView1];
    
    //撤销  重做 重复 最近命令列表
    NSArray *array20 = @[@"剪切",@"复制",@"粘贴",@"关键帧"];
    NSArray *array21 = @[@"Ctrl+X",@"Ctrl+C",@"Ctrl+V",@""];
    NSArray *array22 = @[@"",@"",@"",@"2"];
    for (int i = 0; i< 4; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 80+i*20, 180, 20) withName1:array20[i] withName2:array21[i] withN:array22[i] withTrue:NO];
        [scrollView addSubview:view2];
    }
    //横线
    UIView *imageView2 = [self createImageView2:CGRectMake(10, 160, 200, 20) withName:@"删除"];
    [scrollView addSubview:imageView2];
    
    //删除 按类型删除  按类型删除全部
    NSArray *array30 = @[@"删除",@"按类型删除",@"按类型删除全部"];
    NSArray *array32 = @[@"",@"2",@"2"];
    for (int i = 0; i< 3; i++) {
        UIView *view3 = [self cellView:CGRectMake(20, 175+i*20, 180, 20) withName1:array30[i] withName2:@"" withN:array32[i] withTrue:NO];
        [scrollView addSubview:view3];
    }
    //横线
    UIView *imageView3 = [self createImageView2:CGRectMake(10, 235, 200, 20) withName:@"复制"];
    [scrollView addSubview:imageView3];
    
    //复制 特殊复制  复制并变换 传递属性值
    NSArray *array40 = @[@"复制",@"特殊复制",@"复制并变换",@"传递属性值"];
    NSArray *array41 = @[@"Ctrl+D",@"Ctrl+Shift+D",@"Shift+D",@""];
    NSArray *array42 = @[@"",@"1",@"",@"1"];
    for (int i = 0; i< 4; i++) {
        UIView *view4 = [self cellView:CGRectMake(20, 250+i*20, 180, 20) withName1:array40[i] withName2:array41[i] withN:array42[i] withTrue:NO];
        [scrollView addSubview:view4];
    }
    //横线
    UIView *imageView4 = [self createImageView2:CGRectMake(10, 330, 200, 20) withName:@"层次"];
    [scrollView addSubview:imageView4];
    
    
    //分组 解组 LOD（详细级别）
    NSArray *array50 = @[@"分组",@"解组"];
    NSArray *array51 = @[@"Ctrl+G",@""];
    NSArray *array52 = @[@"1",@"1"];
   
    for (int i = 0; i< 2; i++) {
        UIView *view5 = [self cellView:CGRectMake(20, 350+i*20, 180, 20) withName1:array50[i] withName2:array51[i] withN:array52[i] withTrue:NO];
        [scrollView addSubview:view5];
    }
    UIView *view7 = [self cellView:CGRectMake(20, 390, 180, 20) withName1:@"LOD(详细级别)" withName2:@"" withN:@"2" withTrue:YES];
    [scrollView addSubview:view7];
    //横线
    UIView *imageView5 = [self createImageView:CGRectMake(30, 410, 200, 1)];
    [scrollView addSubview:imageView5];
    
    //父对象  断开父子关系
    NSArray *array60 = @[@"父对象",@"断开父子关系"];
    NSArray *array61 = @[@"P",@"Shift+P"];

    for (int i = 0; i< 2; i++) {
        UIView *view6 = [self cellView:CGRectMake(20, 410+i*20, 180, 20) withName1:array60[i] withName2:array61[i] withN:@"1" withTrue:NO];
        [scrollView addSubview:view6];
    }
    return view;
}

//视图 着色 照明 显示 渲染器 面板
-(UIView*)ShiTu:(CGRect)frame{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(35, 135, frame.size.width, frame.size.height)];
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];
   
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height-10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*2.5);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    [scrollView addSubview:subView];
    
    //选择摄影机
    UIView *view1 = [self cellView:CGRectMake(20, 0, 180, 20) withName1:@"选择摄影机" withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view1];
    //锁定摄影机
    UIView *view2 = [self cellView:CGRectMake(20, 20, 180, 20) withName1:@"锁定摄影机" withName2:@"" withN:@"" withTrue:YES];
    [scrollView addSubview:view2];
    //横线
    UIImageView *imageView2 = [self createImageView:CGRectMake(20, 40, 180, 1)];
    [scrollView addSubview:imageView2];
    
    //从视图创建摄影机 在摄影机之间循环切换
    NSArray *array31 = @[@"从视图创建摄影机",@"在摄影机之间循环切换"];
    NSArray *array32 = @[@"Ctrl+Shift+C",@""];
    for (int i = 0; i< 2; i++) {
        UIView *view3 = [self cellView:CGRectMake(20, 42+i*20, 180, 20) withName1:array31[i] withName2:array32[i] withN:@"" withTrue:NO];
        [scrollView addSubview:view3];
    }
    //横线
    UIImageView *imageView3 = [self createImageView:CGRectMake(20, 82, 180, 1)];
    [scrollView addSubview:imageView3];
    
    NSArray *array41 = @[@"撤销视图更改",@"重做视图更改",@"默认视图"];
    NSArray *array42 = @[@"Alt+Z",@"Alt+Y",@"Alt+Home"];
    for (int i = 0; i< 3; i++) {
        UIView *view4 = [self cellView:CGRectMake(20, 85+i*20, 180, 20) withName1:array41[i] withName2:array42[i] withN:@"" withTrue:NO];
        [scrollView addSubview:view4];
    }
    //沿轴查看
    UIView *view5 = [self cellView:CGRectMake(20, 145, 180, 20) withName1:@"沿轴查看" withName2:@"" withN:@"2" withTrue:YES];
    [scrollView addSubview:view5];
    //横线
    UIImageView *imageView5 = [self createImageView:CGRectMake(20, 165, 180, 1)];
    [scrollView addSubview:imageView5];
    
    //注视当前选择
    UIView *view6 = [self cellView:CGRectMake(20, 165, 180, 20) withName1:@"注视当前选择" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view6];
    
     //当前选择的中心视图
    UIView *view7 = [self cellView:CGRectMake(20, 185, 180, 20) withName1:@"当前选择的中心视图" withName2:@"" withN:@"" withTrue:YES];
    [scrollView addSubview:view7];
    
    //框显全部
    UIView *view8 = [self cellView:CGRectMake(20, 205, 180, 20) withName1:@"框显全部" withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view8];
    
    //框显当前选择
    UIView *view9 = [self cellView:CGRectMake(20, 225, 180, 20) withName1:@"框显当前选择" withName2:@"F" withN:@"" withTrue:YES];
    [scrollView addSubview:view9];
    
    //框显当前选择(包含子对象)
    UIView *view10 = [self cellView:CGRectMake(20, 245, 180, 20) withName1:@"框显当前选择(包含子对象)" withName2:@"Ctrl+F" withN:@"" withTrue:YES];
    [scrollView addSubview:view10];
    
    //将摄影机与多边形对齐
    UIView *view11 = [self cellView:CGRectMake(20, 265, 180, 20) withName1:@"将摄影机与多边形对齐" withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view11];
    
    //横线
    UIImageView *imageView11 = [self createImageView:CGRectMake(20, 285, 180, 1)];
    [scrollView addSubview:imageView11];
    
    //预定义书签
    UIView *view12 = [self cellView:CGRectMake(20, 285, 180, 20) withName1:@"预定义书签" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view12];
    
    //书签
    UIView *view13 = [self cellView:CGRectMake(20, 305, 180, 20) withName1:@"书签" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view13];
    
    //横线
    UIImageView *imageView13 = [self createImageView:CGRectMake(20, 325, 180, 1)];
    [scrollView addSubview:imageView13];

    //摄影机设置 摄影机属性编辑器... 摄影机工具
    NSArray *array141 = @[@"摄影机设置",@"摄影机属性编辑器...",@"摄影机工具"];
    NSArray *array142 = @[@"2",@"",@"2"];
    for (int i = 0; i< 3; i++) {
        UIView *view14 = [self cellView:CGRectMake(20, 325+i*20, 180, 20) withName1:array141[i] withName2:@"" withN:array142[i] withTrue:NO];
        [scrollView addSubview:view14];
    }
    //横线
    UIImageView *imageView14 = [self createImageView:CGRectMake(20, 385, 180, 1)];
    [scrollView addSubview:imageView14];
    //图像平面
    UIView *view15 = [self cellView:CGRectMake(20, 385, 180, 20) withName1:@"图像平面" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view15];
    //横线
    UIImageView *imageView15 = [self createImageView:CGRectMake(20, 405, 180, 1)];
    [scrollView addSubview:imageView15];
    //查看序列时间
    UIView *view16 = [self cellView:CGRectMake(20, 405, 180, 20) withName1:@"查看序列时间" withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view16];
    return view;
}
-(UIView*)ZhuoSe:(CGRect)frame{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(95, 135, frame.size.width, frame.size.height)];
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height-10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*2.2);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    [scrollView addSubview:subView];
    
    //线框 对所有项目进行平滑着色处理 对选定项目进行平滑着色处理 对所有项目进行平面着色 对选定项目进行平面着色 边界框 点
    NSArray *array10 = @[@"线框",@"对所有项目进行平滑着色处理",@"对选定项目进行平滑着色处理",@"对选定项目进行平面着色",@"边界框",@"点"];
    NSArray *array11 = @[@"4",@"",@"",@"",@"",@"",@""];
    for (int i = 0; i< 6; i++) {
        UIView *view1 = [self cellView:CGRectMake(12, i*20, 180, 20) withName1:array10[i] withName2:array11[i] withN:@"" withTrue:NO];
        [scrollView addSubview:view1];
    }
    //横线
    UIImageView *imageView1 = [self createImageView:CGRectMake(20, 120, 180, 1)];
    [scrollView addSubview:imageView1];
    
    //使用默认材质 着色对象上的线框 X射线显示 X射线显示关节 X射线显示活动组件 对象透明度排序 多边形透明度排序
    NSArray *array20 = @[@"使用默认材质",@"着色对象上的线框",@"X射线显示",@"X射线显示关节",@"X射线显示活动组件",@"对象透明度排序",@"多边形透明度排序"];
    for (int i = 0; i< 7; i++) {
        UIView *view2 = [self cellView:CGRectMake(12, 120+i*20, 180, 20) withName1:array20[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view2];
    }
    //横线
    UIImageView *imageView2 = [self createImageView:CGRectMake(20, 260, 180, 1)];
    [scrollView addSubview:imageView2];
    
    //交互式着色
    UIView *view3 = [self cellView:CGRectMake(12, 260, 180, 20) withName1:@"交互式着色" withName2:@"" withN:@"1" withTrue:NO];
    [scrollView addSubview:view3];
    
    //横线
    UIImageView *imageView3 = [self createImageView:CGRectMake(20, 280, 180, 1)];
    [scrollView addSubview:imageView3];
    //背面消隐 平滑线框
     NSArray *array40 = @[@"背面消隐",@"平滑线框"];
    for (int i = 0; i< 2; i++) {
        UIView *view4 = [self cellView:CGRectMake(12, 280+i*20, 180, 20) withName1:array40[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view4];
    }
    //横线
    UIImageView *imageView4 = [self createImageView:CGRectMake(20, 320, 180, 1)];
    [scrollView addSubview:imageView4];
    
    //硬件纹理 硬件雾 景深
    NSArray *array50 = @[@"硬件纹理",@"硬件雾",@"景深"];
    NSArray *array52 = @[@"1",@"1",@""];
    for (int i = 0; i< 3; i++) {
        UIView *view5 = [self cellView:CGRectMake(12, 320+i*20, 180, 20) withName1:array50[i] withName2:@"" withN:array52[i] withTrue:NO];
        [scrollView addSubview:view5];
    }
    //横线
    UIImageView *imageView5 = [self createImageView:CGRectMake(20, 380, 180, 1)];
    [scrollView addSubview:imageView5];
    
    UIView *view6 = [self cellView:CGRectMake(12, 380, 180, 20) withName1:@"将当前样式应用于所有对象" withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view6];
    return view;
}
-(UIView*)ZhaoMing:(CGRect)frame{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(155, 135, frame.size.width, frame.size.height)];
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height-10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    [scrollView addSubview:subView];
    
    //使用默认照明 使用所有灯光 使用选定灯光 使用平面照明 不使用灯光
    NSArray *array10 = @[@"使用默认照明",@"使用所有灯光",@"使用选定灯光",@"使用平面照明",@"不使用灯光"];
    NSArray *array11 = @[@"",@"7",@"",@"",@""];
    for (int i = 0; i< 5; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, i*20, 180, 20) withName1:array10[i] withName2:array11[i] withN:@"" withTrue:NO];
        [scrollView addSubview:view1];
    }
    //横线
    UIImageView *imageView1 = [self createImageView:CGRectMake(20, 100, 180, 1)];
    [scrollView addSubview:imageView1];
    
    //双面照明 阴影
    NSArray *array20 = @[@"双面照明",@"阴影"];
    for (int i = 0; i< 2; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 100+i*20, 180, 20) withName1:array20[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view2];
    }
    
    return view;

}
-(UIView*)XianShi:(CGRect)frame{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(215, 135, frame.size.width, frame.size.height)];
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height-10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*4.55);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    [scrollView addSubview:subView];
    
    //隔离选择
    UIView *view1 = [self cellView:CGRectMake(20, 0, 180, 20) withName1:@"隔离选择" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view1];
    
    //全部
    UIView *view2 = [self cellView:CGRectMake(20, 20, 180, 20) withName1:@"全部" withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view2];
    //无
    UIView *view3 = [self cellView:CGRectMake(20, 40, 180, 20) withName1:@"无" withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view3];
    //横线
    UIImageView *imageView3 = [self createImageView:CGRectMake(20, 60, 180, 1)];
    [scrollView addSubview:imageView3];
    
    //NURBS曲线 NURBS曲面 NURBS CV NURBS壳线 多边形 细分曲面 平面
    NSArray *array40 = @[@"NURBS曲线",@"NURBS曲面",@"NURBS CV",@"NURBS壳线",@"多边形",@"细分曲面",@"平面",@"灯光",@"摄影机",@"图像平面",@"关节",@"IK控制柄",@"变形器",@"动力学",@"粒子实例化器",@"流体",@"头发系统",@"毛襄",@"nCloth",@"nParticle",@"nRigid",@"动态约束",@"定位器",@"尺度",@"枢轴",@"控制柄",@"纹理放置",@"笔划",@"运动轨迹",@"插件形状",@"片段重影",@"油性铅笔",@"GPU缓存"];
    for (int i = 0; i< array40.count; i++) {
        UIView *view4 = [self cellView:CGRectMake(20, 60+i*20, 180, 20) withName1:array40[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view4];
    }
    //横线
    UIImageView *imageView4 = [self createImageView:CGRectMake(30, 720, 180, 1)];
    [scrollView addSubview:imageView4];

    //操纵器 栅格 HUD 透底 选择壳显
    NSArray *array50 = @[@"操纵器",@"栅格",@"HUD",@"透底",@"选择壳显"];
    for (int i = 0; i< array50.count; i++) {
        UIView *view5 = [self cellView:CGRectMake(20, 720+i*20, 180, 20) withName1:array50[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view5];
    }
    //横线
    UIImageView *imageView6 = [self createImageView:CGRectMake(30, 820, 180, 1)];
    [scrollView addSubview:imageView6];
    
    //播放预览显示
    UIView *view5 = [self cellView:CGRectMake(20, 820, 180, 20) withName1:@"播放预览显示" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view5];
    
    return view;

}
-(UIView*)XuanRanQi:(CGRect)frame{
        
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(275,135, frame.size.width, frame.size.height)];
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
        imageView.image = [UIImage imageNamed:@"编辑器"];
        imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
        [view addSubview:imageView];
        
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height-10)];
        scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height);
        scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
        scrollView.bounces = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        [view addSubview:scrollView];
        
        UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height)];
        subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
        [scrollView addSubview:subView];
        
        //Viewport 2.0 旧版默认视口 旧版高质量视口
        NSArray *array10 = @[@"Viewport 2.0",@"旧版默认视口",@"旧版高质量视口"];
        NSArray *array11 = @[@"1",@"",@"2"];
        for (int i = 0; i< 3; i++) {
            UIView *view1 = [self cellView:CGRectMake(12, i*20, 180, 20) withName1:array10[i] withName2:@"" withN:array11[i] withTrue:NO];
            [scrollView addSubview:view1];
        }

    return view;
}
-(UIView*)MianBan:(CGRect)frame{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(335, 135, frame.size.width, frame.size.height)];
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height-10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*1.2);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    [scrollView addSubview:subView];
    
    //透视 立体 正交 沿选定对象观看
    NSArray *array10 = @[@"透视",@"立体",@"正交",@"沿选定对象观看"];
    NSArray *array11 = @[@"2",@"2",@"2",@"1"];
    for (int i = 0; i< 4; i++) {
        UIView *view1 = [self cellView:CGRectMake(12, i*20, 180, 20) withName1:array10[i] withName2:@"" withN:array11[i] withTrue:NO];
        [scrollView addSubview:view1];
    }
   
    //横线
    UIImageView *imageView1 = [self createImageView:CGRectMake(20, 80, 180, 1)];
    [scrollView addSubview:imageView1];
    
    
    //面板 Hypergraph 布局 保存布局
    NSArray *array20 = @[@"面板",@"Hypergraph",@"布局",@"保存布局"];
    for (int i = 0; i< 4; i++) {
        UIView *view2 = [self cellView:CGRectMake(12, 80+i*20, 180, 20) withName1:array20[i] withName2:@"" withN:@"2" withTrue:NO];
        [scrollView addSubview:view2];
    }
    
    //横线
    UIImageView *imageView2 = [self createImageView:CGRectMake(20, 160, 180, 1)];
    [scrollView addSubview:imageView2];
    
    //撕下... 撕下副本...
    NSArray *array30 = @[@"撕下...",@"撕下副本..."];
    for (int i = 0; i< 2; i++) {
        UIView *view3 = [self cellView:CGRectMake(12, 160+i*20, 180, 20) withName1:array30[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view3];
    }
    
    //横线
    UIImageView *imageView3 = [self createImageView:CGRectMake(20, 200, 180, 1)];
    [scrollView addSubview:imageView3];
    
    //面板编辑器...
    UIView *view4 = [self cellView:CGRectMake(12, 200, 180, 20) withName1:@"面板编辑器..." withName2:@"" withN:@"" withTrue:NO];
    [scrollView addSubview:view4];
    
    return view;
}

//文件
-(UIView*)createFileView:(CGRect)frame{
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    //添加到底图上
    UIScrollView *scrollView1 = [self.view viewWithTag:10000];
    [scrollView1 addSubview:view];
    

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 10)];
    imageView.image = [UIImage imageNamed:@"编辑器"];
    imageView.backgroundColor = [UIColor colorWithRed:0.25098 green:0.25098 blue:0.25098 alpha:1];
    [view addSubview:imageView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, view.frame.size.width, view.frame.size.height-10)];
    scrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height*2.1);
    scrollView.backgroundColor = [UIColor colorWithRed:0.325 green:0.325 blue:0.325 alpha:1];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [view addSubview:scrollView];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 3, 20, scrollView.contentSize.height)];
    subView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    [scrollView addSubview:subView];
    
    //新建场景    打开场景
    NSArray *array10 = @[@"新建场景",@"打开场景..."];
    NSArray *array11 = @[@"Ctrl+N",@"Ctrl+O"];
    NSArray *array12 = @[@"1",@"1"];
    for (int i = 0; i< 2; i++) {
        UIView *view1 = [self cellView:CGRectMake(20, i*20, 180, 20) withName1:array10[i] withName2:array11[i] withN:array12[i] withTrue:NO];
        [scrollView addSubview:view1];
    }
    //横线
    UIImageView *imageView1 = [self createImageView:CGRectMake(30, 40, 180, 1)];
    [scrollView addSubview:imageView1];
    
    //保存场景 场景另存为... 递增并保存 归档场景 保存首选项
    NSArray *array20 = @[@"保存场景",@"场景另存为...",@"递增并保存",@"归档场景",@"保存首选项"];
    NSArray *array21 = @[@"Ctrl+S",@"Ctrl+Shift+S",@"Ctrl+Alt+S",@"",@""];
    NSArray *array22 = @[@"1",@"1",@"",@"1",@""];
    for (int i = 0; i< 5; i++) {
        UIView *view2 = [self cellView:CGRectMake(20, 40+i*20, 180, 20) withName1:array20[i] withName2:array21[i] withN:array22[i]withTrue:NO];
        [scrollView addSubview:view2];
    }
    //横线
    UIImageView *imageView2 = [self createImageView:CGRectMake(30, 140, 180, 1)];
    [scrollView addSubview:imageView2];
    
    //优化场景大小
    UIView *view3 = [self cellView:CGRectMake(20, 142, 180, 20) withName1:@"优化场景大小" withName2:@"" withN:@"1" withTrue:NO];
    [scrollView addSubview:view3];
    //横线
    UIView *imageView3 = [self createImageView2:CGRectMake(20, 160, 190, 20) withName:@"导入/导出"];
    [scrollView addSubview:imageView3];
    
    //导入... 导出全部... 导出当前选择
    NSArray *array40 = @[@"导入...",@"导出全部...",@"导出当前选择"];
    NSArray *array42 = @[@"1",@"1",@"1"];
    for (int i = 0; i< 3; i++) {
        UIView *view4 = [self cellView:CGRectMake(20, 175+i*20, 180, 20) withName1:array40[i] withName2:@"" withN:array42[i] withTrue:NO];
        [scrollView addSubview:view4];
    }
    //横线
    UIImageView *imageView4 = [self createImageView:CGRectMake(20, 235, 190, 1)];
    [scrollView addSubview:imageView4];
    
    //游戏导出器 云导入/导出...
   NSArray *array50 = @[@"游戏导出器",@"云导入/导出..."];
    for (int i = 0; i< 2; i++) {
        UIView *view5 = [self cellView:CGRectMake(20, 236+i*20, 180, 20) withName1:array50[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view5];
    }
    //横线
    UIImageView *imageView5 = [self createImageView:CGRectMake(20, 276, 190, 1)];
    [scrollView addSubview:imageView5];
    
    //发送到Unity 发送到Unreal 2
    NSArray *array60 = @[@"发送到Unity",@"发送到Unreal"];
    NSArray *array62 = @[@"2",@"2"];
    for (int i = 0; i< 2; i++) {
        UIView *view6 = [self cellView:CGRectMake(20, 277+i*20, 180, 20) withName1:array60[i] withName2:@"" withN:array62[i] withTrue:NO];
        [scrollView addSubview:view6];
    }
    //横线
    UIImageView *imageView6 = [self createImageView:CGRectMake(30, 318, 180, 1)];
    [scrollView addSubview:imageView6];
    
    //发送到AE 2
    UIView *view7 = [self cellView:CGRectMake(20, 319, 180, 20) withName1:@"发送到AE" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view7];
    //横线
    UIImageView *imageView7 = [self createImageView:CGRectMake(30, 339, 180, 1)];
    [scrollView addSubview:imageView7];
    
    //发送到Print Studio
    UIView *view8 = [self cellView:CGRectMake(20, 340, 180, 20) withName1:@"发送到Print Studio" withName2:@"" withN:@"" withTrue:YES];
    [scrollView addSubview:view8];
    //横线
    UIImageView *imageView8 = [self createImageView:CGRectMake(30, 361, 180, 1)];
    [scrollView addSubview:imageView8];
    
    //导出到脱机文件... 指定到脱机文件...
    NSArray *array90 = @[@"导出到脱机文件...",@"指定脱机文件..."];
    NSArray *array92 = @[@"1",@"1"];
    for (int i = 0; i< 2; i++) {
        UIView *view9 = [self cellView:CGRectMake(20, 362+i*20, 180, 20) withName1:array90[i] withName2:@"" withN:array92[i] withTrue:NO];
        [scrollView addSubview:view9];
    }
    //横线
    UIImageView *imageView9 = [self createImageView:CGRectMake(30, 403, 180, 1)];
    [scrollView addSubview:imageView9];
    
    //ATOM
    UIView *view100 = [self cellView:CGRectMake(20, 404, 180, 20) withName1:@"ATOM" withName2:@"" withN:@"2" withTrue:NO];
    [scrollView addSubview:view100];
    //横线
    UIView *imageView10 = [self createImageView2:CGRectMake(10, 420, 200, 20) withName:@"引用"];
    [scrollView addSubview:imageView10];
    
    //创建引用... 引用编辑器
    NSArray *array110 = @[@"创建引用...",@"引用编辑器"];
    NSArray *array111 = @[@"Ctrl+R",@""];
    NSArray *array112 = @[@"1",@""];
    for (int i = 0; i< 2; i++) {
        UIView *view11 = [self cellView:CGRectMake(20, 440+i*20, 180, 20) withName1:array110[i] withName2:array111[i] withN:array112[i] withTrue:NO];
        [scrollView addSubview:view11];
    }
    //横线
    UIView *imageView11 = [self createImageView2:CGRectMake(10, 475, 200, 20) withName:@"视图"];
    [scrollView addSubview:imageView11];
    
    //查看图像... 查看序列...
    NSArray *array120 = @[@"查看图像...",@"查看序列..."];
  
    for (int i = 0; i< 2; i++) {
        UIView *view12 = [self cellView:CGRectMake(20, 490+i*20, 180, 20) withName1:array120[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view12];
    }
    //横线
    UIView *imageView12 = [self createImageView2:CGRectMake(10, 525, 200, 20) withName:@"投影"];
    [scrollView addSubview:imageView12];
    
    //项目窗口 设置项目...
    NSArray *array130 = @[@"项目窗口",@"设置项目..."];
    
    for (int i = 0; i< 2; i++) {
        UIView *view13 = [self cellView:CGRectMake(20, 540+i*20, 180, 20) withName1:array130[i] withName2:@"" withN:@"" withTrue:NO];
        [scrollView addSubview:view13];
    }
    //横线
    UIView *imageView13 = [self createImageView2:CGRectMake(10, 575, 200, 20) withName:@"最近"];
    [scrollView addSubview:imageView13];
    
    //最近的文件 最近的递增文件  最近的项目
    NSArray *array140 = @[@"最近的文件",@"最近的递增文件",@"最近的项目"];
    
    for (int i = 0; i< 3; i++) {
        UIView *view14 = [self cellView:CGRectMake(20, 590+i*20, 180, 20) withName1:array140[i] withName2:@"" withN:@"2" withTrue:NO];
        [scrollView addSubview:view14];
    }
    //横线
    UIImageView *imageView14 = [self createImageView:CGRectMake(20, 650, 190, 1)];
    [scrollView addSubview:imageView14];
    
    //退出
    UIView *view15 = [self cellView:CGRectMake(20, 652, 180, 20) withName1:@"退出" withName2:@"Ctrl+Q" withN:@"" withTrue:NO];
    [scrollView addSubview:view15];
    
    
    return view;
}
//自定义每一行cell
-(UIView*)cellView:(CGRect)frame withName1:(NSString*)name1 withName2:(NSString*)name2 withN:(NSString*)num withTrue:(BOOL)isGreen{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    UILabel *label = [self createLableShortC:CGRectMake(10, 0, 105, 20) withName:name1];
    [view addSubview:label];
    
    UILabel *label2 = [self createLableShortC:CGRectMake(105, 0, 60, 20) withName:name2];
    label2.textAlignment = NSTextAlignmentRight;
    label2.font = [UIFont systemFontOfSize:10];
    [view addSubview:label2];
    
    //21 255 9
    if(isGreen){
        label.textColor = [UIColor colorWithRed:0.1098 green:1 blue:0.3529 alpha:1];
        label2.textColor = [UIColor colorWithRed:0.1098 green:1 blue:0.3529 alpha:1];
        
        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 5, 20)];
        imageView1.image = [UIImage imageNamed:@"绿框左"];
        [view addSubview:imageView1];
        
        UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(185, 0, 5, 20)];
        imageView2.image = [UIImage imageNamed:@"绿框右"];
        [view addSubview:imageView2];
    
    }
    
   //确定后面是方框还是三角
    if ([num isEqualToString:@"1"]) {
         UIButton *button = [self createButtonFangK:CGRectMake(170, 5, 10, 10)];
        
        if (isGreen) {
            [button setImage:[UIImage imageNamed:@"方框绿"] forState:UIControlStateNormal];
        }
        
        [view addSubview:button];
    }else if([num isEqualToString:@"2"]){
        UIButton *button = [self createButtonSanJ:CGRectMake(170, 5, 10, 10)];
        
        if (isGreen) {
            [button setImage:[UIImage imageNamed:@"三角绿"] forState:UIControlStateNormal];
        }
        
        [view addSubview:button];
    }

    //确定每一行点击事件
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(createNewAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    if([name1 isEqualToString:@"新建场景"]){
        button.tag = 10001;
    }else if([name1 isEqualToString:@"打开场景..."]){
        button.tag = 10002;
    }else if ([name1 isEqualToString:@"保存场景"]){
        button.tag = 10003;
    }else if ([name1 isEqualToString:@"场景另存为..."]){
        button.tag = 10004;
    }else if ([name1 isEqualToString:@"递增并保存"]){
        button.tag = 10005;
    }else if ([name1 isEqualToString:@"归档场景"]){
        button.tag = 10006;
    }else if ([name1 isEqualToString:@"保存首选项"]){
        button.tag = 10007;
    }else if ([name1 isEqualToString:@"优化场景大小"]){
        button.tag = 10008;
    }else if ([name1 isEqualToString:@"导入..."]){
        button.tag = 10009;
    }else if ([name1 isEqualToString:@"导出全部..."]){
        button.tag = 10010;
    }else if ([name1 isEqualToString:@"导出当前选择"]){
        button.tag = 10011;
    }else if ([name1 isEqualToString:@"游戏导出器"]){
        button.tag = 10012;
    }else if ([name1 isEqualToString:@"云导入/导出..."]){
        button.tag = 10013;
    }else if ([name1 isEqualToString:@"发送到Unity"]){
        button.tag = 10014;
    }else if ([name1 isEqualToString:@"发送到Unreal"]){
        button.tag = 10015;
    }else if ([name1 isEqualToString:@"发送到AE"]){
        button.tag = 10016;
    }else if ([name1 isEqualToString:@"发送到Print Studio"]){
        button.tag = 10017;
    }else if ([name1 isEqualToString:@"导出到脱机文件..."]){
        button.tag = 10018;
    }else if ([name1 isEqualToString:@"指定脱机文件..."]){
        button.tag = 10019;
    }else if ([name1 isEqualToString:@"ATOM"]){
        button.tag = 10020;
    }else if ([name1 isEqualToString:@"创建引用..."]){
        button.tag = 10021;
    }else if ([name1 isEqualToString:@"引用编辑器"]){
        button.tag = 10022;
    }else if ([name1 isEqualToString:@"查看图像..."]){
        button.tag = 10023;
    }else if ([name1 isEqualToString:@"查看序列..."]){
        button.tag = 10024;
    }else if ([name1 isEqualToString:@"项目窗口"]){
        button.tag = 10025;
    }else if ([name1 isEqualToString:@"设置项目..."]){
        button.tag = 10026;
    }else if ([name1 isEqualToString:@"最近的文件"]){
        button.tag = 10027;
    }else if ([name1 isEqualToString:@"最近的递增文件"]){
        button.tag = 10028;
    }else if ([name1 isEqualToString:@"最近的项目"]){
        button.tag = 10029;
    }else if ([name1 isEqualToString:@"退出"]){
        button.tag = 10030;
    }else if ([name1 isEqualToString:@"撤销"]){
        button.tag = 20001;
    }else if ([name1 isEqualToString:@"重做"]){
        button.tag = 20002;
    }else if ([name1 isEqualToString:@"重复"]){
        button.tag = 20003;
    }else if ([name1 isEqualToString:@"最近命令列表"]){
        button.tag = 20004;
    }else if ([name1 isEqualToString:@"剪切"]){
        button.tag = 20005;
    }else if ([name1 isEqualToString:@"复制"]){
        button.tag = 20006;
    }else if ([name1 isEqualToString:@"粘贴"]){
        button.tag = 20007;
    }else if ([name1 isEqualToString:@"关键帧"]){
        button.tag = 20008;
    }else if ([name1 isEqualToString:@"删除"]){
        button.tag = 20009;
    }else if ([name1 isEqualToString:@"按类型删除"]){
        button.tag = 20010;
    }else if ([name1 isEqualToString:@"按类型删除全部"]){
        button.tag = 20011;
    }else if ([name1 isEqualToString:@"复制"]){
        button.tag = 20012;
    }else if ([name1 isEqualToString:@"特殊复制"]){
        button.tag = 20013;
    }else if ([name1 isEqualToString:@"复制并变换"]){
        button.tag = 20014;
    }else if ([name1 isEqualToString:@"传递属性值"]){
        button.tag = 20015;
    }else if ([name1 isEqualToString:@"分组"]){
        button.tag = 20016;
    }else if ([name1 isEqualToString:@"解组"]){
        button.tag = 20017;
    }else if ([name1 isEqualToString:@"LOD(详细级别)"]){
        button.tag = 20018;
    }else if ([name1 isEqualToString:@"父对象"]){
        button.tag = 20019;
    }else if ([name1 isEqualToString:@"断开父子关系"]){
        button.tag = 20020;
    }else if ([name1 isEqualToString:@"NURBS 基本体"]){
    button.tag = 30001;
    }else if ([name1 isEqualToString:@"多边形基本体"]){
        button.tag = 30002;
    }else if ([name1 isEqualToString:@"体积基本体"]){
        button.tag = 30003;
    }else if ([name1 isEqualToString:@"灯光"]){
        button.tag = 30004;
    }else if ([name1 isEqualToString:@"摄影机"]){
        button.tag = 30005;
    }else if ([name1 isEqualToString:@"曲线工具"]){
        button.tag = 30006;
    }else if ([name1 isEqualToString:@"类型"]){
        button.tag = 30007;
    }else if ([name1 isEqualToString:@"SVG"]){
        button.tag = 30008;
    }else if ([name1 isEqualToString:@"Adobe(R) Illustrator(R) 对象..."]){
        button.tag = 30009;
    }else if ([name1 isEqualToString:@"构造平面"]){
        button.tag = 30010;
    }else if ([name1 isEqualToString:@"自由图像平面"]){
        button.tag = 30011;
    }else if ([name1 isEqualToString:@"定位器"]){
        button.tag = 30012;
    }else if ([name1 isEqualToString:@"注释..."]){
        button.tag = 30013;
    }else if ([name1 isEqualToString:@"测量工具"]){
        button.tag = 30014;
    }else if ([name1 isEqualToString:@"场景集合"]){
        button.tag = 30015;
    }else if ([name1 isEqualToString:@"空组"]){
        button.tag = 30016;
    }else if ([name1 isEqualToString:@"集"]){
        button.tag = 30017;
    }else if ([name1 isEqualToString:@"资源"]){
        button.tag = 30018;
    }else if ([name1 isEqualToString:@"全部"]){
        button.tag = 40001;
    }else if ([name1 isEqualToString:@"全部按类型"]){
        button.tag = 40002;
    }else if ([name1 isEqualToString:@"取消选择全部"]){
        button.tag = 40003;
    }else if ([name1 isEqualToString:@"层次"]){
        button.tag = 40004;
    }else if ([name1 isEqualToString:@"反转"]){
        button.tag = 40005;
    }else if ([name1 isEqualToString:@"类似"]){
        button.tag = 40006;
    }else if ([name1 isEqualToString:@"增长"]){
        button.tag = 40007;
    }else if ([name1 isEqualToString:@"收缩"]){
        button.tag = 40008;
    }else if ([name1 isEqualToString:@"快速选择集"]){
        button.tag = 40009;
    }else if ([name1 isEqualToString:@"对象/组件"]){
        button.tag = 40010;
    }else if ([name1 isEqualToString:@"组件"]){
        button.tag = 40011;
    }else if ([name1 isEqualToString:@"连续边"]){
        button.tag = 40012;
    }else if ([name1 isEqualToString:@"最短边路径工具"]){
        button.tag = 40013;
    }else if ([name1 isEqualToString:@"转化当前选择"]){
        button.tag = 40014;
    }else if ([name1 isEqualToString:@"使用约束..."]){
        button.tag = 40015;
    }else if ([name1 isEqualToString:@"组件"]){
        button.tag = 40016;
    }else if ([name1 isEqualToString:@"所有CV"]){
        button.tag = 40017;
    }else if ([name1 isEqualToString:@"第一个CV"]){
        button.tag = 40018;
    }else if ([name1 isEqualToString:@"最后一个CV"]){
        button.tag = 40019;
    }else if ([name1 isEqualToString:@"簇曲线"]){
        button.tag = 40020;
    }else if ([name1 isEqualToString:@"组件"]){
        button.tag = 40021;
    }else if ([name1 isEqualToString:@"CV选择边界"]){
        button.tag = 40022;
    }else if ([name1 isEqualToString:@"曲面边界"]){
        button.tag = 40023;
    }else if ([name1 isEqualToString:@"变换工具"]){
        button.tag = 50001;
    }else if ([name1 isEqualToString:@"重置变换"]){
        button.tag = 50002;
    }else if ([name1 isEqualToString:@"冻结变换"]){
        button.tag = 50003;
    }else if ([name1 isEqualToString:@"匹配变换"]){
        button.tag = 50004;
    }else if ([name1 isEqualToString:@"居中枢轴"]){
        button.tag = 50005;
    }else if ([name1 isEqualToString:@"烘焙枢轴"]){
        button.tag = 50006;
    }else if ([name1 isEqualToString:@"捕捉对齐对象"]){
        button.tag = 50007;
    }else if ([name1 isEqualToString:@"对齐工具"]){
        button.tag = 50008;
    }else if ([name1 isEqualToString:@"捕捉到一起工具"]){
        button.tag = 50009;
    }else if ([name1 isEqualToString:@"节点求值"]){
        button.tag = 50010;
    }else if ([name1 isEqualToString:@"添加层次名称前缀..."]){
        button.tag = 50011;
    }else if ([name1 isEqualToString:@"搜索和替换名称..."]){
        button.tag = 50012;
    }else if ([name1 isEqualToString:@"添加属性..."]){
        button.tag = 50013;
    }else if ([name1 isEqualToString:@"编辑属性..."]){
        button.tag = 50014;
    }else if ([name1 isEqualToString:@"删除属性..."]){
        button.tag = 50015;
    }else if ([name1 isEqualToString:@"激活"]){
        button.tag = 50016;
    }else if ([name1 isEqualToString:@"替换对象"]){
        button.tag = 50017;
    }else if ([name1 isEqualToString:@"转化"]){
        button.tag = 50018;
    }else if ([name1 isEqualToString:@"绘制脚本工具"]){
        button.tag = 50019;
    }else if ([name1 isEqualToString:@"绘制属性工具"]){
        button.tag = 50020;
    }else if ([name1 isEqualToString:@"资源"]){
        button.tag = 50021;
    }else if ([name1 isEqualToString:@"栅格"]){
        button.tag = 60001;
    }else if ([name1 isEqualToString:@"题头显示"]){
        button.tag = 60002;
    }else if ([name1 isEqualToString:@"隐藏"]){
        button.tag = 60003;
    }else if ([name1 isEqualToString:@"显示"]){
        button.tag = 60004;
    }else if ([name1 isEqualToString:@"切换显示/隐藏"]){
        button.tag = 60005;
    }else if ([name1 isEqualToString:@"根据摄影机可见性"]){
        button.tag = 60006;
    }else if ([name1 isEqualToString:@"线框颜色..."]){
        button.tag = 60007;
    }else if ([name1 isEqualToString:@"对象显示"]){
        button.tag = 60008;
    }else if ([name1 isEqualToString:@"变换显示"]){
        button.tag = 60009;
    }else if ([name1 isEqualToString:@"多边形"]){
        button.tag = 60010;
    }else if ([name1 isEqualToString:@"NURBS"]){
        button.tag = 60011;
    }else if ([name1 isEqualToString:@"动画"]){
        button.tag = 60012;
    }else if ([name1 isEqualToString:@"渲染"]){
        button.tag = 60013;
    }else if ([name1 isEqualToString:@"在所有视图中框显所有内容"]){
        button.tag = 60014;
    }else if ([name1 isEqualToString:@"在所有视图中框显当前选择"]){
        button.tag = 60015;
    }else if ([name1 isEqualToString:@"在所有视图中框显当前选择(包含子对象)"]){
        button.tag = 60016;
    }else if ([name1 isEqualToString:@"布尔"]){
        button.tag = 70001;
    }else if ([name1 isEqualToString:@"结合"]){
        button.tag = 70002;
    }else if ([name1 isEqualToString:@"分离"]){
        button.tag = 70003;
    }else if ([name1 isEqualToString:@"一致"]){
        button.tag = 70004;
    }else if ([name1 isEqualToString:@"填充词"]){
        button.tag = 70005;
    }else if ([name1 isEqualToString:@"减少"]){
        button.tag = 70006;
    }else if ([name1 isEqualToString:@"平滑"]){
        button.tag = 70007;
    }else if ([name1 isEqualToString:@"三角化"]){
        button.tag = 70008;
    }else if ([name1 isEqualToString:@"四边形化"]){
        button.tag = 70009;
    }else if ([name1 isEqualToString:@"镜像"]){
        button.tag = 70010;
    }else if ([name1 isEqualToString:@"剪贴板操作"]){
        button.tag = 70011;
    }else if ([name1 isEqualToString:@"传递属性"]){
        button.tag = 70012;
    }else if ([name1 isEqualToString:@"传递着色集"]){
        button.tag = 70013;
    }else if ([name1 isEqualToString:@"传递顶点顺序"]){
        button.tag = 70014;
    }else if ([name1 isEqualToString:@"清理..."]){
        button.tag = 70015;
    }else if ([name1 isEqualToString:@"平滑代理"]){
        button.tag = 70016;
    }else if ([name1 isEqualToString:@"添加分段"]){
        button.tag = 80001;
    }else if ([name1 isEqualToString:@"倒角"]){
        button.tag = 80002;
    }else if ([name1 isEqualToString:@"桥接"]){
        button.tag = 80003;
    }else if ([name1 isEqualToString:@"收拢"]){
        button.tag = 80004;
    }else if ([name1 isEqualToString:@"连接"]){
        button.tag = 80005;
    }else if ([name1 isEqualToString:@"分离"]){
        button.tag = 80006;
    }else if ([name1 isEqualToString:@"挤出"]){
        button.tag = 80007;
    }else if ([name1 isEqualToString:@"合并"]){
        button.tag = 80008;
    }else if ([name1 isEqualToString:@"合并到中心"]){
        button.tag = 80009;
    }else if ([name1 isEqualToString:@"变换"]){
        button.tag = 80010;
    }else if ([name1 isEqualToString:@"翻转"]){
        button.tag = 80011;
    }else if ([name1 isEqualToString:@"对称"]){
        button.tag = 80012;
    }else if ([name1 isEqualToString:@"平均化顶点"]){
        button.tag = 80013;
    }else if ([name1 isEqualToString:@"切角顶点"]){
        button.tag = 80014;
    }else if ([name1 isEqualToString:@"对顶点重新排序"]){
        button.tag = 80015;
    }else if ([name1 isEqualToString:@"删除边/顶点"]){
        button.tag = 80016;
    }else if ([name1 isEqualToString:@"编辑边流"]){
        button.tag = 80017;
    }else if ([name1 isEqualToString:@"翻转三角形边"]){
        button.tag = 80018;
    }else if ([name1 isEqualToString:@"反向自旋边"]){
        button.tag = 80019;
    }else if ([name1 isEqualToString:@"正向自旋边"]){
        button.tag = 80020;
    }else if ([name1 isEqualToString:@"指定不可见面"]){
        button.tag = 80021;
    }else if ([name1 isEqualToString:@"复制"]){
        button.tag = 80022;
    }else if ([name1 isEqualToString:@"提取"]){
        button.tag = 80023;
    }else if ([name1 isEqualToString:@"刺破"]){
        button.tag = 80024;
    }else if ([name1 isEqualToString:@"楔形"]){
        button.tag = 80025;
    }else if ([name1 isEqualToString:@"在网格上投影曲线"]){
        button.tag = 80026;
    }else if ([name1 isEqualToString:@"使用投影的曲线分割网格"]){
        button.tag = 80027;
    }else if ([name1 isEqualToString:@"隐藏建模工具包"]){
        button.tag = 90001;
    }else if ([name1 isEqualToString:@"附加到多边形"]){
        button.tag = 90002;
    }else if ([name1 isEqualToString:@"连接"]){
        button.tag = 90003;
    }else if ([name1 isEqualToString:@"折痕"]){
        button.tag = 90004;
    }else if ([name1 isEqualToString:@"创建多边形"]){
        button.tag = 90005;
    }else if ([name1 isEqualToString:@"插入循环边"]){
        button.tag = 90006;
    }else if ([name1 isEqualToString:@"生成洞"]){
        button.tag = 90007;
    }else if ([name1 isEqualToString:@"多切割"]){
        button.tag = 90008;
    }else if ([name1 isEqualToString:@"偏移循环边"]){
        button.tag = 90009;
    }else if ([name1 isEqualToString:@"绘制减少权重"]){
        button.tag = 90010;
    }else if ([name1 isEqualToString:@"绘制传递属性"]){
        button.tag = 90011;
    }else if ([name1 isEqualToString:@"四边形绘制"]){
        button.tag = 90012;
    }else if ([name1 isEqualToString:@"雕刻工具"]){
        button.tag = 90013;
    }else if ([name1 isEqualToString:@"滑动边"]){
        button.tag = 90014;
    }else if ([name1 isEqualToString:@"目标焊接"]){
        button.tag = 90015;
    }else if ([name1 isEqualToString:@"平均"]){
        button.tag = 100001;
    }else if ([name1 isEqualToString:@"一致"]){
        button.tag = 100002;
    }else if ([name1 isEqualToString:@"反转"]){
        button.tag = 100003;
    }else if ([name1 isEqualToString:@"设定法线角度..."]){
        button.tag = 100004;
    }else if ([name1 isEqualToString:@"设定为面"]){
        button.tag = 100005;
    }else if ([name1 isEqualToString:@"设定顶点法线"]){
        button.tag = 100006;
    }else if ([name1 isEqualToString:@"硬边化"]){
        button.tag = 100007;
    }else if ([name1 isEqualToString:@"软边化"]){
        button.tag = 100008;
    }else if ([name1 isEqualToString:@"锁定法线"]){
        button.tag = 100009;
    }else if ([name1 isEqualToString:@"解除锁定法线"]){
        button.tag = 100010;
    }else if ([name1 isEqualToString:@"顶点法线编辑工具"]){
        button.tag = 100011;
    }else if ([name1 isEqualToString:@"应用颜色"]){
        button.tag = 100012;
    }else if ([name1 isEqualToString:@"绘制顶点颜色工具"]){
        button.tag = 100013;
    }else if ([name1 isEqualToString:@"创建空集"]){
        button.tag = 100014;
    }else if ([name1 isEqualToString:@"删除当前集"]){
        button.tag = 100015;
    }else if ([name1 isEqualToString:@"重命名当前集..."]){
        button.tag = 100016;
    }else if ([name1 isEqualToString:@"修改当前集"]){
        button.tag = 100017;
    }else if ([name1 isEqualToString:@"为顶点颜色设置关键帧"]){
        button.tag = 100018;
    }else if ([name1 isEqualToString:@"颜色集编辑器"]){
        button.tag = 100019;
    }else if ([name1 isEqualToString:@"预照明(Maya)"]){
        button.tag = 100020;
    }else if ([name1 isEqualToString:@"指定新集"]){
        button.tag = 100021;
    }else if ([name1 isEqualToString:@"指定现有集"]){
        button.tag = 100022;
    }else if ([name1 isEqualToString:@"编辑指定的集"]){
        button.tag = 100023;
    }else if ([name1 isEqualToString:@"切换显示颜色属性"]){
        button.tag = 100024;
    }else if ([name1 isEqualToString:@"对材质通道上色"]){
        button.tag = 100025;
    }else if ([name1 isEqualToString:@"材质混合设置"]){
        button.tag = 100026;
    }else if ([name1 isEqualToString:@"逐实例共享"]){
        button.tag = 100027;
    }else if ([name1 isEqualToString:@"锁定长度"]){
        button.tag = 110001;
    }else if ([name1 isEqualToString:@"解除锁定长度"]){
        button.tag = 110002;
    }else if ([name1 isEqualToString:@"弯曲"]){
        button.tag = 110003;
    }else if ([name1 isEqualToString:@"卷曲"]){
        button.tag = 110004;
    }else if ([name1 isEqualToString:@"缩放曲率"]){
        button.tag = 110005;
    }else if ([name1 isEqualToString:@"平滑"]){
        button.tag = 110006;
    }else if ([name1 isEqualToString:@"拉直"]){
        button.tag = 110007;
    }else if ([name1 isEqualToString:@"复制曲面曲线"]){
        button.tag = 110008;
    }else if ([name1 isEqualToString:@"对齐"]){
        button.tag = 110009;
    }else if ([name1 isEqualToString:@"添加点工具"]){
        button.tag = 110010;
    }else if ([name1 isEqualToString:@"附加"]){
        button.tag = 110011;
    }else if ([name1 isEqualToString:@"分离"]){
        button.tag = 110012;
    }else if ([name1 isEqualToString:@"编辑曲线工具"]){
        button.tag = 110013;
    }else if ([name1 isEqualToString:@"移动接缝"]){
        button.tag = 110014;
    }else if ([name1 isEqualToString:@"开放/闭合"]){
        button.tag = 110015;
    }else if ([name1 isEqualToString:@"圆角"]){
        button.tag = 110016;
    }else if ([name1 isEqualToString:@"切割"]){
        button.tag = 110017;
    }else if ([name1 isEqualToString:@"相交"]){
        button.tag = 110018;
    }else if ([name1 isEqualToString:@"延伸"]){
        button.tag = 110019;
    }else if ([name1 isEqualToString:@"插入结"]){
        button.tag = 110020;
    }else if ([name1 isEqualToString:@"偏移"]){
        button.tag = 110021;
    }else if ([name1 isEqualToString:@"CV硬度"]){
        button.tag = 110022;
    }else if ([name1 isEqualToString:@"拟合B样条线"]){
        button.tag = 110023;
    }else if ([name1 isEqualToString:@"投影切线"]){
        button.tag = 110024;
    }else if ([name1 isEqualToString:@"平滑"]){
        button.tag = 110025;
    }else if ([name1 isEqualToString:@"Bezier曲线"]){
        button.tag = 110026;
    }else if ([name1 isEqualToString:@"重建"]){
        button.tag = 110027;
    }else if ([name1 isEqualToString:@"反转方向"]){
        button.tag = 110028;
    }else if ([name1 isEqualToString:@"放样"]){
        button.tag = 120001;
    }else if ([name1 isEqualToString:@"平面"]){
        button.tag = 120002;
    }else if ([name1 isEqualToString:@"旋转"]){
        button.tag = 120003;
    }else if ([name1 isEqualToString:@"双轨成形"]){
        button.tag = 120004;
    }else if ([name1 isEqualToString:@"挤出"]){
        button.tag = 120005;
    }else if ([name1 isEqualToString:@"边界"]){
        button.tag = 120006;
    }else if ([name1 isEqualToString:@"方形"]){
        button.tag = 120007;
    }else if ([name1 isEqualToString:@"倒角"]){
        button.tag = 120008;
    }else if ([name1 isEqualToString:@"倒角+"]){
        button.tag = 120009;
    }else if ([name1 isEqualToString:@"复制NURBS面片"]){
        button.tag = 120010;
    }else if ([name1 isEqualToString:@"对齐"]){
        button.tag = 120011;
    }else if ([name1 isEqualToString:@"附加"]){
        button.tag = 120012;
    }else if ([name1 isEqualToString:@"附加而不移动"]){
        button.tag = 120013;
    }else if ([name1 isEqualToString:@"分离"]){
        button.tag = 120014;
    }else if ([name1 isEqualToString:@"移动接缝"]){
        button.tag = 120015;
    }else if ([name1 isEqualToString:@"开放/闭合"]){
        button.tag = 120016;
    }else if ([name1 isEqualToString:@"相交"]){
        button.tag = 120017;
    }else if ([name1 isEqualToString:@"在曲面上投影曲线"]){
        button.tag = 120018;
    }else if ([name1 isEqualToString:@"修剪工具"]){
        button.tag = 120019;
    }else if ([name1 isEqualToString:@"取消修剪"]){
        button.tag = 120020;
    }else if ([name1 isEqualToString:@"延伸"]){
        button.tag = 120021;
    }else if ([name1 isEqualToString:@"插入等参线"]){
        button.tag = 120022;
    }else if ([name1 isEqualToString:@"偏移"]){
        button.tag = 120023;
    }else if ([name1 isEqualToString:@"圆化工具"]){
        button.tag = 120024;
    }else if ([name1 isEqualToString:@"缝合"]){
        button.tag = 120025;
    }else if ([name1 isEqualToString:@"曲面圆角"]){
        button.tag = 120026;
    }else if ([name1 isEqualToString:@"雕刻几何体工具"]){
        button.tag = 120027;
    }else if ([name1 isEqualToString:@"曲面编辑"]){
        button.tag = 120028;
    }else if ([name1 isEqualToString:@"布尔"]){
        button.tag = 120029;
    }else if ([name1 isEqualToString:@"重建"]){
        button.tag = 120030;
    }else if ([name1 isEqualToString:@"反转方向"]){
        button.tag = 120031;
    }else if ([name1 isEqualToString:@"混合变形"]){
        button.tag = 130001;
    }else if ([name1 isEqualToString:@"簇"]){
        button.tag = 130002;
    }else if ([name1 isEqualToString:@"曲线扭曲"]){
        button.tag = 130003;
    }else if ([name1 isEqualToString:@"Delta Mush"]){
        button.tag = 130004;
    }else if ([name1 isEqualToString:@"晶格"]){
        button.tag = 130005;
    }else if ([name1 isEqualToString:@"包裹"]){
        button.tag = 130006;
    }else if ([name1 isEqualToString:@"收缩包裹"]){
        button.tag = 130007;
    }else if ([name1 isEqualToString:@"线"]){
        button.tag = 130008;
    }else if ([name1 isEqualToString:@"褶皱"]){
        button.tag = 130009;
    }else if ([name1 isEqualToString:@"姿势空间变形"]){
        button.tag = 130010;
    }else if ([name1 isEqualToString:@"肌肉"]){
        button.tag = 130011;
    }else if ([name1 isEqualToString:@"非线性"]){
        button.tag = 130012;
    }else if ([name1 isEqualToString:@"软修改"]){
        button.tag = 130013;
    }else if ([name1 isEqualToString:@"雕刻"]){
        button.tag = 130014;
    }else if ([name1 isEqualToString:@"纹理"]){
        button.tag = 130015;
    }else if ([name1 isEqualToString:@"抖动"]){
        button.tag = 130016;
    }else if ([name1 isEqualToString:@"曲线上的点"]){
        button.tag = 130017;
    }else if ([name1 isEqualToString:@"混合变形"]){
        button.tag = 130018;
    }else if ([name1 isEqualToString:@"晶格"]){
        button.tag = 130019;
    }else if ([name1 isEqualToString:@"包裹"]){
        button.tag = 130020;
    }else if ([name1 isEqualToString:@"线"]){
        button.tag = 130021;
    }else if ([name1 isEqualToString:@"编辑成员身份工具"]){
        button.tag = 130022;
    }else if ([name1 isEqualToString:@"删减成员身份"]){
        button.tag = 130023;
    }else if ([name1 isEqualToString:@"镜像变形器权重"]){
        button.tag = 130024;
    }else if ([name1 isEqualToString:@"显示中间对象"]){
        button.tag = 130025;
    }else if ([name1 isEqualToString:@"隐藏中间对象"]){
        button.tag = 130026;
    }else if ([name1 isEqualToString:@"混合变形"]){
        button.tag = 130027;
    }else if ([name1 isEqualToString:@"簇"]){
        button.tag = 130028;
    }else if ([name1 isEqualToString:@"Delta Mush"]){
        button.tag = 130029;
    }else if ([name1 isEqualToString:@"收缩包裹"]){
        button.tag = 130030;
    }else if ([name1 isEqualToString:@"线"]){
        button.tag = 130031;
    }else if ([name1 isEqualToString:@"非线性"]){
        button.tag = 130032;
    }else if ([name1 isEqualToString:@"抖动"]){
        button.tag = 130033;
    }else if ([name1 isEqualToString:@"纹理变形器"]){
        button.tag = 130034;
    }else if ([name1 isEqualToString:@"集成员身份"]){
        button.tag = 130035;
    }else if ([name1 isEqualToString:@"导出权重..."]){
        button.tag = 130036;
    }else if ([name1 isEqualToString:@"导入权重..."]){
        button.tag = 130037;
    }else if ([name1 isEqualToString:@"UV编辑器"]){
        button.tag = 140001;
    }else if ([name1 isEqualToString:@"UV集编辑器"]){
        button.tag = 140002;
    }else if ([name1 isEqualToString:@"指定着色器"]){
        button.tag = 140003;
    }else if ([name1 isEqualToString:@"自动"]){
        button.tag = 140004;
    }else if ([name1 isEqualToString:@"最佳平面纹理工具"]){
        button.tag = 140005;
    }else if ([name1 isEqualToString:@"基于摄影机"]){
        button.tag = 140006;
    }else if ([name1 isEqualToString:@"圆柱体"]){
        button.tag = 140007;
    }else if ([name1 isEqualToString:@"平面"]){
        button.tag = 140008;
    }else if ([name1 isEqualToString:@"球形"]){
        button.tag = 140009;
    }else if ([name1 isEqualToString:@"轮廓拉伸"]){
        button.tag = 140010;
    }else if ([name1 isEqualToString:@"对齐"]){
        button.tag = 140011;
    }else if ([name1 isEqualToString:@"翻转"]){
        button.tag = 140012;
    }else if ([name1 isEqualToString:@"栅格"]){
        button.tag = 140013;
    }else if ([name1 isEqualToString:@"排布矩形"]){
        button.tag = 140014;
    }else if ([name1 isEqualToString:@"规格化"]){
        button.tag = 140015;
    }else if ([name1 isEqualToString:@"旋转"]){
        button.tag = 140016;
    }else if ([name1 isEqualToString:@"单元化"]){
        button.tag = 140017;
    }else if ([name1 isEqualToString:@"映射UV边界"]){
        button.tag = 140018;
    }else if ([name1 isEqualToString:@"拉直UV边界"]){
        button.tag = 140019;
    }else if ([name1 isEqualToString:@"优化"]){
        button.tag = 140020;
    }else if ([name1 isEqualToString:@"展开"]){
        button.tag = 140021;
    }else if ([name1 isEqualToString:@"排布矩阵"]){
        button.tag = 140022;
    }else if ([name1 isEqualToString:@"扭曲图像..."]){
        button.tag = 140023;
    }else if ([name1 isEqualToString:@"自动接缝"]){
        button.tag = 140024;
    }else if ([name1 isEqualToString:@"切割UV边"]){
        button.tag = 140025;
    }else if ([name1 isEqualToString:@"删除UV边"]){
        button.tag = 140026;
    }else if ([name1 isEqualToString:@"合并UV边"]){
        button.tag = 140027;
    }else if ([name1 isEqualToString:@"移动并缝合UV边"]){
        button.tag = 140028;
    }else if ([name1 isEqualToString:@"缝合UV边"]){
        button.tag = 140029;
    }else if ([name1 isEqualToString:@"分割UV"]){
        button.tag = 140030;
    }else if ([name1 isEqualToString:@"3DUV抓取工具"]){
        button.tag = 140031;
    }else if ([name1 isEqualToString:@"将UV复制到UV集"]){
        button.tag = 140032;
    }else if ([name1 isEqualToString:@"创建空UV集"]){
        button.tag = 140033;
    }else if ([name1 isEqualToString:@"删除当前UV集"]){
        button.tag = 140034;
    }else if ([name1 isEqualToString:@"重命名当前UV集..."]){
        button.tag = 140035;
    }else if ([name1 isEqualToString:@"设定当前UV集..."]){
        button.tag = 140036;
    }else if ([name1 isEqualToString:@"逐实例共享"]){
        button.tag = 140037;
    }else if ([name1 isEqualToString:@"XGen编辑器"]){
        button.tag = 150001;
    }else if ([name1 isEqualToString:@"XGen库"]){
        button.tag = 150002;
    }else if ([name1 isEqualToString:@"创建描述..."]){
        button.tag = 150003;
    }else if ([name1 isEqualToString:@"导入集合或描述..."]){
        button.tag = 150004;
    }else if ([name1 isEqualToString:@"导出集合或描述..."]){
        button.tag = 150005;
    }else if ([name1 isEqualToString:@"将当前选择项导出为归档..."]){
        button.tag = 150006;
    }else if ([name1 isEqualToString:@"场景批量转化为归档..."]){
        button.tag = 150007;
    }else if ([name1 isEqualToString:@"将XGen基本体转化为多边形..."]){
        button.tag = 150008;
    }else if ([name1 isEqualToString:@"转化为交互式修饰..."]){
        button.tag = 150009;
    }else if ([name1 isEqualToString:@"导入预设..."]){
        button.tag = 150010;
    }else if ([name1 isEqualToString:@"导出为预设..."]){
        button.tag = 150011;
    }else if ([name1 isEqualToString:@"创建交互式修饰样条线"]){
        button.tag = 150012;
    }else if ([name1 isEqualToString:@"交互式修饰编辑器"]){
        button.tag = 150013;
    }else if ([name1 isEqualToString:@"交互式修饰工具"]){
        button.tag = 150014;
    }else if ([name1 isEqualToString:@"缓存"]){
        button.tag = 150015;
    }else if ([name1 isEqualToString:@"显示HUD"]){
        button.tag = 150016;
    }else if ([name1 isEqualToString:@"角色生成器"]){
        button.tag = 150017;
    }else if ([name1 isEqualToString:@"ReCap"]){
        button.tag = 150018;
    }else if ([name1 isEqualToString:@"Paint Effects工具"]){
        button.tag = 150019;
    }else if ([name1 isEqualToString:@"使可绘制"]){
        button.tag = 150020;
    }else if ([name1 isEqualToString:@"获取笔刷..."]){
        button.tag = 150021;
    }else if ([name1 isEqualToString:@"模板笔刷设置..."]){
        button.tag = 150022;
    }else if ([name1 isEqualToString:@"重置模板笔刷"]){
        button.tag = 150023;
    }else if ([name1 isEqualToString:@"翻转管方向"]){
        button.tag = 150024;
    }else if ([name1 isEqualToString:@"使碰撞"]){
        button.tag = 150025;
    }else if ([name1 isEqualToString:@"在可绘制对象上绘制"]){
        button.tag = 150026;
    }else if ([name1 isEqualToString:@"在视图平面上绘制"]){
        button.tag = 150027;
    }else if ([name1 isEqualToString:@"将设置应用于上一笔划"]){
        button.tag = 150028;
    }else if ([name1 isEqualToString:@"从选定笔划获取设置"]){
        button.tag = 150029;
    }else if ([name1 isEqualToString:@"将设置应用于选定笔划"]){
        button.tag = 150030;
    }else if ([name1 isEqualToString:@"共享一个笔刷"]){
        button.tag = 150031;
    }else if ([name1 isEqualToString:@"移除笔刷共享"]){
        button.tag = 150032;
    }else if ([name1 isEqualToString:@"选择包含指定字符的笔刷"]){
        button.tag = 150033;
    }else if ([name1 isEqualToString:@"创建修改器"]){
        button.tag = 150034;
    }else if ([name1 isEqualToString:@"设置修改器填充对象"]){
        button.tag = 150035;
    }else if ([name1 isEqualToString:@"笔刷动画"]){
        button.tag = 150036;
    }else if ([name1 isEqualToString:@"曲线工具"]){
        button.tag = 150037;
    }else if ([name1 isEqualToString:@"自动绘制"]){
        button.tag = 150038;
    }else if ([name1 isEqualToString:@"Paint Effects全局参数"]){
        button.tag = 150039;
    }else if ([name1 isEqualToString:@"网格质量属性"]){
        button.tag = 150040;
    }else if ([name1 isEqualToString:@"预设混合"]){
        button.tag = 150041;
    }else if ([name1 isEqualToString:@"保存笔刷预设..."]){
        button.tag = 150042;
    }else if ([name1 isEqualToString:@"Alembic缓存"]){
        button.tag = 160001;
    }else if ([name1 isEqualToString:@"几何缓存"]){
        button.tag = 160002;
    }else if ([name1 isEqualToString:@"GPU缓存"]){
        button.tag = 160003;
    }else if ([name1 isEqualToString:@"Arnold RenderView"]){
        button.tag = 170001;
    }else if ([name1 isEqualToString:@"StandIn"]){
        button.tag = 170002;
    }else if ([name1 isEqualToString:@"Lights"]){
        button.tag = 170003;
    }else if ([name1 isEqualToString:@"Volume"]){
        button.tag = 170004;
    }else if ([name1 isEqualToString:@"Flush Caches"]){
        button.tag = 170005;
    }else if ([name1 isEqualToString:@"Utilities"]){
        button.tag = 170006;
    }else if ([name1 isEqualToString:@"Help"]){
        button.tag = 170007;
    }else if ([name1 isEqualToString:@"About"]){
        button.tag = 170008;
    }else if ([name1 isEqualToString:@"查找菜单"]){
        button.tag = 180001;
    }else if ([name1 isEqualToString:@"Autodesk Maya帮助"]){
        button.tag = 180002;
    }else if ([name1 isEqualToString:@"新特性"]){
        button.tag = 180003;
    }else if ([name1 isEqualToString:@"1分钟启动影片"]){
        button.tag = 180004;
    }else if ([name1 isEqualToString:@"Maya教学频道"]){
        button.tag = 180005;
    }else if ([name1 isEqualToString:@"教程"]){
        button.tag = 180006;
    }else if ([name1 isEqualToString:@"学习途径"]){
        button.tag = 180007;
    }else if ([name1 isEqualToString:@"Maya脚本参考"]){
        button.tag = 180008;
    }else if ([name1 isEqualToString:@"Maya社区"]){
        button.tag = 180009;
    }else if ([name1 isEqualToString:@"Maya资源和工具"]){
        button.tag = 180010;
    }else if ([name1 isEqualToString:@"Maya服务和支持"]){
        button.tag = 180011;
    }else if ([name1 isEqualToString:@"反馈"]){
        button.tag = 180012;
    }else if ([name1 isEqualToString:@"Creative Market"]){
        button.tag = 180013;
    }else if ([name1 isEqualToString:@"Autodesk Exchange Apps"]){
        button.tag = 180014;
    }else if ([name1 isEqualToString:@"尝试使用其他Autodesk产品"]){
        button.tag = 180015;
    }else if ([name1 isEqualToString:@"关于Maya"]){
        button.tag = 180016;
    }else if ([name1 isEqualToString:@"Maya主页"]){
        button.tag = 180017;
    }

  
    
    
    
    return view;
}
//每一行的点击事件
-(void)createNewAction:(UIButton*)sender{
    UIButton *button = sender;
    if (button.tag == 10001) {
         NSLog(@"1");
    }else if (button.tag == 10002){
         NSLog(@"2");
    }else if(button.tag == 10003){
         NSLog(@"3");
    }else if(button.tag == 10004){
         NSLog(@"4");
    }else if(button.tag == 10005){
         NSLog(@"5");
    }else if(button.tag == 10006){
         NSLog(@"6");
    }else if(button.tag == 10007){
         NSLog(@"7");
    }else if(button.tag == 10008){
         NSLog(@"8");
    }else if(button.tag == 10009){
         NSLog(@"9");
    }else if(button.tag == 10010){
         NSLog(@"10");
    }else if(button.tag == 10011){
         NSLog(@"11");
    }else if(button.tag == 10012){
         NSLog(@"12");
    }else if(button.tag == 10013){
         NSLog(@"13");
    }else if(button.tag == 10014){
         NSLog(@"14");
    }else if(button.tag == 10015){
         NSLog(@"15");
    }else if(button.tag == 10016){
         NSLog(@"16");
    }else if(button.tag == 10017){
         NSLog(@"17");
    }else if(button.tag == 10018){
         NSLog(@"18");
    }else if(button.tag == 10019){
         NSLog(@"19");
    }else if(button.tag == 10020){
         NSLog(@"20");
    }else if(button.tag == 10021){
         NSLog(@"21");
    }else if(button.tag == 10022){
         NSLog(@"22");
    }else if(button.tag == 10023){
         NSLog(@"23");
    }else if(button.tag == 10024){
         NSLog(@"24");
    }else if(button.tag == 10025){
         NSLog(@"25");
    }else if(button.tag == 10026){
         NSLog(@"26");
    }else if(button.tag == 10027){
         NSLog(@"27");
    }else if(button.tag == 10028){
         NSLog(@"28");
    }else if(button.tag == 10029){
         NSLog(@"29");
    }else if(button.tag == 10030){
         NSLog(@"30");
    }else if (button.tag == 20001){
         NSLog(@"201");
    }else if (button.tag == 20002){
        NSLog(@"202");
    }else if (button.tag == 20003){
        NSLog(@"203");
    }else if (button.tag == 20004){
        NSLog(@"204");
    }else if (button.tag == 20005){
        NSLog(@"205");
    }else if (button.tag == 20006){
        NSLog(@"206");
    }else if (button.tag == 20007){
        NSLog(@"207");
    }else if (button.tag == 20008){
        NSLog(@"208");
    }else if (button.tag == 20009){
        NSLog(@"209");
    }else if (button.tag == 20010){
        NSLog(@"210");
    }else if (button.tag == 20011){
        NSLog(@"211");
    }else if (button.tag == 20012){
        NSLog(@"212");
    }else if (button.tag == 20013){
        NSLog(@"213");
    }else if (button.tag == 20014){
        NSLog(@"214");
    }else if (button.tag == 20015){
        NSLog(@"215");
    }else if (button.tag == 20016){
        NSLog(@"216");
    }else if (button.tag == 20017){
        NSLog(@"217");
    }else if (button.tag == 20018){
        NSLog(@"218");
    }else if (button.tag == 20019){
        NSLog(@"219");
    }else if (button.tag == 20020){
        NSLog(@"220");
    }else if (button.tag == 30001){
        NSLog(@"301");
    }else if (button.tag == 30002){
        NSLog(@"302");
    }else if (button.tag == 30003){
        NSLog(@"303");
    }else if (button.tag == 30004){
        NSLog(@"304");
    }else if (button.tag == 30005){
        NSLog(@"305");
    }else if (button.tag == 30006){
        NSLog(@"306");
    }else if (button.tag == 30007){
        NSLog(@"307");
    }else if (button.tag == 30008){
        NSLog(@"308");
    }else if (button.tag == 30009){
        NSLog(@"309");
    }else if (button.tag == 30010){
        NSLog(@"310");
    }else if (button.tag == 30011){
        NSLog(@"311");
    }else if (button.tag == 30012){
        NSLog(@"312");
    }else if (button.tag == 30013){
        NSLog(@"313");
    }else if (button.tag == 30014){
        NSLog(@"314");
    }else if (button.tag == 30015){
        NSLog(@"315");
    }else if (button.tag == 30016){
        NSLog(@"316");
    }else if (button.tag == 30017){
        NSLog(@"317");
    }else if (button.tag == 30018){
        NSLog(@"318");
    }else if (button.tag == 40001){
        NSLog(@"401");
    }else if (button.tag == 40002){
        NSLog(@"402");
    }else if (button.tag == 40003){
        NSLog(@"403");
    }else if (button.tag == 40004){
        NSLog(@"404");
    }else if (button.tag == 40005){
        NSLog(@"405");
    }else if (button.tag == 40006){
        NSLog(@"406");
    }else if (button.tag == 40007){
        NSLog(@"407");
    }else if (button.tag == 40008){
        NSLog(@"408");
    }else if (button.tag == 40009){
        NSLog(@"409");
    }else if (button.tag == 40010){
        NSLog(@"410");
    }else if (button.tag == 40011){
        NSLog(@"411");
    }else if (button.tag == 40012){
        NSLog(@"412");
    }else if (button.tag == 40013){
        NSLog(@"413");
    }else if (button.tag == 40014){
        NSLog(@"414");
    }else if (button.tag == 40015){
        NSLog(@"415");
    }else if (button.tag == 40016){
        NSLog(@"416");
    }else if (button.tag == 40017){
        NSLog(@"417");
    }else if (button.tag == 40018){
        NSLog(@"418");
    }else if (button.tag == 40019){
        NSLog(@"419");
    }else if (button.tag == 40020){
        NSLog(@"420");
    }else if (button.tag == 40021){
        NSLog(@"421");
    }else if (button.tag == 40022){
        NSLog(@"422");
    }else if (button.tag == 40023){
        NSLog(@"423");
    }else if (button.tag == 50001){
        NSLog(@"501");
    }else if (button.tag == 50002){
        NSLog(@"502");
    }else if (button.tag == 50003){
        NSLog(@"503");
    }else if (button.tag == 50004){
        NSLog(@"504");
    }else if (button.tag == 50005){
        NSLog(@"505");
    }else if (button.tag == 50006){
        NSLog(@"506");
    }else if (button.tag == 50007){
        NSLog(@"507");
    }else if (button.tag == 50008){
        NSLog(@"508");
    }else if (button.tag == 50009){
        NSLog(@"509");
    }else if (button.tag == 50010){
        NSLog(@"510");
    }else if (button.tag == 50011){
        NSLog(@"511");
    }else if (button.tag == 50012){
        NSLog(@"512");
    }else if (button.tag == 50013){
        NSLog(@"513");
    }else if (button.tag == 50014){
        NSLog(@"514");
    }else if (button.tag == 50015){
        NSLog(@"515");
    }else if (button.tag == 50016){
        NSLog(@"516");
    }else if (button.tag == 50017){
        NSLog(@"517");
    }else if (button.tag == 50018){
        NSLog(@"518");
    }else if (button.tag == 50019){
        NSLog(@"519");
    }else if (button.tag == 50020){
        NSLog(@"520");
    }else if (button.tag == 50021){
        NSLog(@"521");
    }else if (button.tag == 60001){
        NSLog(@"601");
    }else if (button.tag == 60002){
        NSLog(@"602");
    }else if (button.tag == 60003){
        NSLog(@"603");
    }else if (button.tag == 60004){
        NSLog(@"604");
    }else if (button.tag == 60005){
        NSLog(@"605");
    }else if (button.tag == 60006){
        NSLog(@"606");
    }else if (button.tag == 60007){
        NSLog(@"607");
    }else if (button.tag == 60008){
        NSLog(@"608");
    }else if (button.tag == 60009){
        NSLog(@"609");
    }else if (button.tag == 60010){
        NSLog(@"610");
    }else if (button.tag == 60011){
        NSLog(@"611");
    }else if (button.tag == 60012){
        NSLog(@"612");
    }else if (button.tag == 60013){
        NSLog(@"613");
    }else if (button.tag == 60014){
        NSLog(@"614");
    }else if (button.tag == 60015){
        NSLog(@"615");
    }else if (button.tag == 60016){
        NSLog(@"616");
    }else if (button.tag == 70001){
        NSLog(@"701");
    }else if (button.tag == 70002){
        NSLog(@"702");
    }else if (button.tag == 70003){
        NSLog(@"703");
    }else if (button.tag == 70004){
        NSLog(@"704");
    }else if (button.tag == 70005){
        NSLog(@"705");
    }else if (button.tag == 70006){
        NSLog(@"706");
    }else if (button.tag == 70007){
        NSLog(@"707");
    }else if (button.tag == 70008){
        NSLog(@"708");
    }else if (button.tag == 70009){
        NSLog(@"709");
    }else if (button.tag == 70010){
        NSLog(@"710");
    }else if (button.tag == 70011){
        NSLog(@"711");
    }else if (button.tag == 70012){
        NSLog(@"712");
    }else if (button.tag == 70013){
        NSLog(@"713");
    }else if (button.tag == 70014){
        NSLog(@"714");
    }else if (button.tag == 70015){
        NSLog(@"715");
    }else if (button.tag == 70016){
        NSLog(@"716");
    }else if (button.tag == 80001){
        NSLog(@"801");
    }else if (button.tag == 80002){
        NSLog(@"802");
    }else if (button.tag == 80003){
        NSLog(@"803");
    }else if (button.tag == 80004){
        NSLog(@"804");
    }else if (button.tag == 80005){
        NSLog(@"805");
    }else if (button.tag == 80006){
        NSLog(@"806");
    }else if (button.tag == 80007){
        NSLog(@"807");
    }else if (button.tag == 80008){
        NSLog(@"808");
    }else if (button.tag == 80009){
        NSLog(@"809");
    }else if (button.tag == 80010){
        NSLog(@"810");
    }else if (button.tag == 80011){
        NSLog(@"811");
    }else if (button.tag == 80012){
        NSLog(@"812");
    }else if (button.tag == 80013){
        NSLog(@"813");
    }else if (button.tag == 80014){
        NSLog(@"814");
    }else if (button.tag == 80015){
        NSLog(@"815");
    }else if (button.tag == 80016){
        NSLog(@"816");
    }else if (button.tag == 80017){
        NSLog(@"817");
    }else if (button.tag == 80018){
        NSLog(@"818");
    }else if (button.tag == 80019){
        NSLog(@"819");
    }else if (button.tag == 80020){
        NSLog(@"820");
    }else if (button.tag == 80021){
        NSLog(@"821");
    }else if (button.tag == 80022){
        NSLog(@"822");
    }else if (button.tag == 80023){
        NSLog(@"823");
    }else if (button.tag == 80024){
        NSLog(@"824");
    }else if (button.tag == 80025){
        NSLog(@"825");
    }else if (button.tag == 80026){
        NSLog(@"826");
    }else if (button.tag == 80027){
        NSLog(@"827");
    }else if (button.tag == 90001){
        NSLog(@"901");
    }else if (button.tag == 90002){
        NSLog(@"902");
    }else if (button.tag == 90003){
        NSLog(@"903");
    }else if (button.tag == 90004){
        NSLog(@"904");
    }else if (button.tag == 90005){
        NSLog(@"905");
    }else if (button.tag == 90006){
        NSLog(@"906");
    }else if (button.tag == 90007){
        NSLog(@"907");
    }else if (button.tag == 90008){
        NSLog(@"908");
    }else if (button.tag == 90009){
        NSLog(@"909");
    }else if (button.tag == 90010){
        NSLog(@"910");
    }else if (button.tag == 90011){
        NSLog(@"911");
    }else if (button.tag == 90012){
        NSLog(@"912");
    }else if (button.tag == 90013){
        NSLog(@"913");
    }else if (button.tag == 90014){
        NSLog(@"914");
    }else if (button.tag == 90015){
        NSLog(@"915");
    }else if (button.tag == 100001){
        NSLog(@"1001");
    }else if (button.tag == 100002){
        NSLog(@"1002");
    }else if (button.tag == 100003){
        NSLog(@"1003");
    }else if (button.tag == 100004){
        NSLog(@"1004");
    }else if (button.tag == 100005){
        NSLog(@"1005");
    }else if (button.tag == 100006){
        NSLog(@"1006");
    }else if (button.tag == 100007){
        NSLog(@"1007");
    }else if (button.tag == 100008){
        NSLog(@"1008");
    }else if (button.tag == 100009){
        NSLog(@"1009");
    }else if (button.tag == 100010){
        NSLog(@"1010");
    }else if (button.tag == 100011){
        NSLog(@"1011");
    }else if (button.tag == 100012){
        NSLog(@"1012");
    }else if (button.tag == 100013){
        NSLog(@"1013");
    }else if (button.tag == 100014){
        NSLog(@"1014");
    }else if (button.tag == 100015){
        NSLog(@"1015");
    }else if (button.tag == 100016){
        NSLog(@"1016");
    }else if (button.tag == 100017){
        NSLog(@"1017");
    }else if (button.tag == 100018){
        NSLog(@"1018");
    }else if (button.tag == 100019){
        NSLog(@"1019");
    }else if (button.tag == 100020){
        NSLog(@"1020");
    }else if (button.tag == 100021){
        NSLog(@"1021");
    }else if (button.tag == 100022){
        NSLog(@"1022");
    }else if (button.tag == 100023){
        NSLog(@"1023");
    }else if (button.tag == 100024){
        NSLog(@"1024");
    }else if (button.tag == 100025){
        NSLog(@"1025");
    }else if (button.tag == 100026){
        NSLog(@"1026");
    }else if (button.tag == 100027){
        NSLog(@"1027");
    }else if (button.tag == 110001){
        NSLog(@"1101");
    }else if (button.tag == 110002){
        NSLog(@"1102");
    }else if (button.tag == 110003){
        NSLog(@"1103");
    }else if (button.tag == 110004){
        NSLog(@"1104");
    }else if (button.tag == 110005){
        NSLog(@"1105");
    }else if (button.tag == 110006){
        NSLog(@"1106");
    }else if (button.tag == 110007){
        NSLog(@"1107");
    }else if (button.tag == 110008){
        NSLog(@"1108");
    }else if (button.tag == 110009){
        NSLog(@"1109");
    }else if (button.tag == 110010){
        NSLog(@"1110");
    }else if (button.tag == 110011){
        NSLog(@"1111");
    }else if (button.tag == 110012){
        NSLog(@"1112");
    }else if (button.tag == 110013){
        NSLog(@"1113");
    }else if (button.tag == 110014){
        NSLog(@"1114");
    }else if (button.tag == 110015){
        NSLog(@"1115");
    }else if (button.tag == 110016){
        NSLog(@"1116");
    }else if (button.tag == 110017){
        NSLog(@"1117");
    }else if (button.tag == 110018){
        NSLog(@"1118");
    }else if (button.tag == 110019){
        NSLog(@"1119");
    }else if (button.tag == 110020){
        NSLog(@"1120");
    }else if (button.tag == 110021){
        NSLog(@"1121");
    }else if (button.tag == 110022){
        NSLog(@"1122");
    }else if (button.tag == 110023){
        NSLog(@"1123");
    }else if (button.tag == 110024){
        NSLog(@"1124");
    }else if (button.tag == 110025){
        NSLog(@"1125");
    }else if (button.tag == 110026){
        NSLog(@"1126");
    }else if (button.tag == 110027){
        NSLog(@"1127");
    }else if (button.tag == 110028){
        NSLog(@"1128");
    }else if (button.tag == 120001){
        NSLog(@"1201");
    }else if (button.tag == 120002){
        NSLog(@"1202");
    }else if (button.tag == 120003){
        NSLog(@"1203");
    }else if (button.tag == 120004){
        NSLog(@"1204");
    }else if (button.tag == 120005){
        NSLog(@"1205");
    }else if (button.tag == 120006){
        NSLog(@"1206");
    }else if (button.tag == 120007){
        NSLog(@"1207");
    }else if (button.tag == 120008){
        NSLog(@"1208");
    }else if (button.tag == 120009){
        NSLog(@"1209");
    }else if (button.tag == 120010){
        NSLog(@"1210");
    }else if (button.tag == 120011){
        NSLog(@"1211");
    }else if (button.tag == 120012){
        NSLog(@"1212");
    }else if (button.tag == 120013){
        NSLog(@"1213");
    }else if (button.tag == 120014){
        NSLog(@"1214");
    }else if (button.tag == 120015){
        NSLog(@"1215");
    }else if (button.tag == 120016){
        NSLog(@"1216");
    }else if (button.tag == 120017){
        NSLog(@"1217");
    }else if (button.tag == 120018){
        NSLog(@"1218");
    }else if (button.tag == 120019){
        NSLog(@"1219");
    }else if (button.tag == 120020){
        NSLog(@"1220");
    }else if (button.tag == 120021){
        NSLog(@"1221");
    }else if (button.tag == 120022){
        NSLog(@"1222");
    }else if (button.tag == 120023){
        NSLog(@"1223");
    }else if (button.tag == 120024){
        NSLog(@"1224");
    }else if (button.tag == 120025){
        NSLog(@"1225");
    }else if (button.tag == 120026){
        NSLog(@"1226");
    }else if (button.tag == 120027){
        NSLog(@"1227");
    }else if (button.tag == 120028){
        NSLog(@"1228");
    }else if (button.tag == 120029){
        NSLog(@"1229");
    }else if (button.tag == 120030){
        NSLog(@"1230");
    }else if (button.tag == 120031){
        NSLog(@"1231");
    }else if (button.tag == 130001){
        NSLog(@"1301");
    }else if (button.tag == 130002){
        NSLog(@"1302");
    }else if (button.tag == 130003){
        NSLog(@"1303");
    }else if (button.tag == 130004){
        NSLog(@"1304");
    }else if (button.tag == 130005){
        NSLog(@"1305");
    }else if (button.tag == 130006){
        NSLog(@"1306");
    }else if (button.tag == 130007){
        NSLog(@"1307");
    }else if (button.tag == 130008){
        NSLog(@"1308");
    }else if (button.tag == 130009){
        NSLog(@"1309");
    }else if (button.tag == 130010){
        NSLog(@"1310");
    }else if (button.tag == 130011){
        NSLog(@"1311");
    }else if (button.tag == 130012){
        NSLog(@"1312");
    }else if (button.tag == 130013){
        NSLog(@"1313");
    }else if (button.tag == 130014){
        NSLog(@"1314");
    }else if (button.tag == 130015){
        NSLog(@"1315");
    }else if (button.tag == 130016){
        NSLog(@"1316");
    }else if (button.tag == 130017){
        NSLog(@"1317");
    }else if (button.tag == 130018){
        NSLog(@"1318");
    }else if (button.tag == 130019){
        NSLog(@"1319");
    }else if (button.tag == 130020){
        NSLog(@"1320");
    }else if (button.tag == 130021){
        NSLog(@"1321");
    }else if (button.tag == 130022){
        NSLog(@"1322");
    }else if (button.tag == 130023){
        NSLog(@"1323");
    }else if (button.tag == 130024){
        NSLog(@"1324");
    }else if (button.tag == 130025){
        NSLog(@"1325");
    }else if (button.tag == 130026){
        NSLog(@"1326");
    }else if (button.tag == 130027){
        NSLog(@"1327");
    }else if (button.tag == 130028){
        NSLog(@"1328");
    }else if (button.tag == 130029){
        NSLog(@"1329");
    }else if (button.tag == 130030){
        NSLog(@"1330");
    }else if (button.tag == 130031){
        NSLog(@"1331");
    }else if (button.tag == 130032){
        NSLog(@"1332");
    }else if (button.tag == 130033){
        NSLog(@"1333");
    }else if (button.tag == 130034){
        NSLog(@"1334");
    }else if (button.tag == 130035){
        NSLog(@"1335");
    }else if (button.tag == 130036){
        NSLog(@"1336");
    }else if (button.tag == 130037){
        NSLog(@"1337");
    }else if (button.tag == 140001){
        NSLog(@"1401");
    }else if (button.tag == 140002){
        NSLog(@"1402");
    }else if (button.tag == 140003){
        NSLog(@"1403");
    }else if (button.tag == 140004){
        NSLog(@"1404");
    }else if (button.tag == 140005){
        NSLog(@"1405");
    }else if (button.tag == 140006){
        NSLog(@"1406");
    }else if (button.tag == 140007){
        NSLog(@"1407");
    }else if (button.tag == 140008){
        NSLog(@"1408");
    }else if (button.tag == 140009){
        NSLog(@"1409");
    }else if (button.tag == 140010){
        NSLog(@"1410");
    }else if (button.tag == 140011){
        NSLog(@"1411");
    }else if (button.tag == 140012){
        NSLog(@"1412");
    }else if (button.tag == 140013){
        NSLog(@"1413");
    }else if (button.tag == 140014){
        NSLog(@"1414");
    }else if (button.tag == 140015){
        NSLog(@"1415");
    }else if (button.tag == 140016){
        NSLog(@"1416");
    }else if (button.tag == 140017){
        NSLog(@"1417");
    }else if (button.tag == 140018){
        NSLog(@"1418");
    }else if (button.tag == 140019){
        NSLog(@"1419");
    }else if (button.tag == 140020){
        NSLog(@"1420");
    }else if (button.tag == 140021){
        NSLog(@"1421");
    }else if (button.tag == 140022){
        NSLog(@"1422");
    }else if (button.tag == 140023){
        NSLog(@"1423");
    }else if (button.tag == 140024){
        NSLog(@"1424");
    }else if (button.tag == 140025){
        NSLog(@"1425");
    }else if (button.tag == 140026){
        NSLog(@"1426");
    }else if (button.tag == 140027){
        NSLog(@"1427");
    }else if (button.tag == 140028){
        NSLog(@"1428");
    }else if (button.tag == 140029){
        NSLog(@"1429");
    }else if (button.tag == 140030){
        NSLog(@"1430");
    }else if (button.tag == 140031){
        NSLog(@"1431");
    }else if (button.tag == 140032){
        NSLog(@"1432");
    }else if (button.tag == 140033){
        NSLog(@"1433");
    }else if (button.tag == 140034){
        NSLog(@"1434");
    }else if (button.tag == 140035){
        NSLog(@"1435");
    }else if (button.tag == 140036){
        NSLog(@"1436");
    }else if (button.tag == 140037){
        NSLog(@"1437");
    }else if (button.tag == 150001){
        NSLog(@"1501");
    }else if (button.tag == 150002){
        NSLog(@"1502");
    }else if (button.tag == 150003){
        NSLog(@"1503");
    }else if (button.tag == 150004){
        NSLog(@"1504");
    }else if (button.tag == 150005){
        NSLog(@"1505");
    }else if (button.tag == 150006){
        NSLog(@"1506");
    }else if (button.tag == 150007){
        NSLog(@"1507");
    }else if (button.tag == 150008){
        NSLog(@"1508");
    }else if (button.tag == 150009){
        NSLog(@"1509");
    }else if (button.tag == 150010){
        NSLog(@"1510");
    }else if (button.tag == 150011){
        NSLog(@"1511");
    }else if (button.tag == 150012){
        NSLog(@"1512");
    }else if (button.tag == 150013){
        NSLog(@"1513");
    }else if (button.tag == 150014){
        NSLog(@"1514");
    }else if (button.tag == 150015){
        NSLog(@"1515");
    }else if (button.tag == 150016){
        NSLog(@"1516");
    }else if (button.tag == 150017){
        NSLog(@"1517");
    }else if (button.tag == 150018){
        NSLog(@"1518");
    }else if (button.tag == 150019){
        NSLog(@"1519");
    }else if (button.tag == 150020){
        NSLog(@"1520");
    }else if (button.tag == 150021){
        NSLog(@"1521");
    }else if (button.tag == 150022){
        NSLog(@"1522");
    }else if (button.tag == 150023){
        NSLog(@"1523");
    }else if (button.tag == 150024){
        NSLog(@"1524");
    }else if (button.tag == 150025){
        NSLog(@"1525");
    }else if (button.tag == 150026){
        NSLog(@"1526");
    }else if (button.tag == 150027){
        NSLog(@"1527");
    }else if (button.tag == 150028){
        NSLog(@"1528");
    }else if (button.tag == 150029){
        NSLog(@"1529");
    }else if (button.tag == 150030){
        NSLog(@"1530");
    }else if (button.tag == 150031){
        NSLog(@"1531");
    }else if (button.tag == 150032){
        NSLog(@"1532");
    }else if (button.tag == 150033){
        NSLog(@"1533");
    }else if (button.tag == 150034){
        NSLog(@"1534");
    }else if (button.tag == 150035){
        NSLog(@"1535");
    }else if (button.tag == 150036){
        NSLog(@"1536");
    }else if (button.tag == 150037){
        NSLog(@"1537");
    }else if (button.tag == 150038){
        NSLog(@"1538");
    }else if (button.tag == 150039){
        NSLog(@"1539");
    }else if (button.tag == 150040){
        NSLog(@"1540");
    }else if (button.tag == 150041){
        NSLog(@"1541");
    }else if (button.tag == 150042){
        NSLog(@"1542");
    }else if (button.tag == 160001){
        NSLog(@"1601");
    }else if (button.tag == 160002){
        NSLog(@"1602");
    }else if (button.tag == 160003){
        NSLog(@"1603");
    }else if (button.tag == 170001){
        NSLog(@"1701");
    }else if (button.tag == 170002){
        NSLog(@"1702");
    }else if (button.tag == 170003){
        NSLog(@"1703");
    }else if (button.tag == 170004){
        NSLog(@"1704");
    }else if (button.tag == 170005){
        NSLog(@"1705");
    }else if (button.tag == 170006){
        NSLog(@"1706");
    }else if (button.tag == 170007){
        NSLog(@"1707");
    }else if (button.tag == 170008){
        NSLog(@"1708");
    }else if (button.tag == 180001){
        NSLog(@"1801");
    }else if (button.tag == 180002){
        NSLog(@"1802");
    }else if (button.tag == 180003){
        NSLog(@"1803");
    }else if (button.tag == 180004){
        NSLog(@"1804");
    }else if (button.tag == 180005){
        NSLog(@"1805");
    }else if (button.tag == 180006){
        NSLog(@"1806");
    }else if (button.tag == 180007){
        NSLog(@"1807");
    }else if (button.tag == 180008){
        NSLog(@"1808");
    }else if (button.tag == 180009){
        NSLog(@"1809");
    }else if (button.tag == 180010){
        NSLog(@"1810");
    }else if (button.tag == 180011){
        NSLog(@"1811");
    }else if (button.tag == 180012){
        NSLog(@"1812");
    }else if (button.tag == 180013){
        NSLog(@"1813");
    }else if (button.tag == 180014){
        NSLog(@"1814");
    }else if (button.tag == 180015){
        NSLog(@"1815");
    }else if (button.tag == 180016){
        NSLog(@"1816");
    }else if (button.tag == 180017){
        NSLog(@"1817");
    }

}
//创建快捷键和文字
-(UILabel*)createLableShortC:(CGRect)frame withName:(NSString*)name{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = name;
    label.textColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1];
    label.font = [UIFont systemFontOfSize:12];
    return label;
}
//创建方框
-(UIButton*)createButtonFangK:(CGRect)frame{
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    [button setImage:[UIImage imageNamed:@"框"] forState:UIControlStateNormal];
    return button;

}
//创建三角
-(UIButton*)createButtonSanJ:(CGRect)frame{
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    [button setImage:[UIImage imageNamed:@"三角"] forState:UIControlStateNormal];
    return button;

}
//创建横线加名称
-(UIView*)createImageView2:(CGRect)frame withName:(NSString*)name{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 55, 20)];
    label.text = name;
    label.textColor = [UIColor colorWithRed:0.643 green:0.643 blue:0.643 alpha:1];
    label.font = [UIFont systemFontOfSize:10];
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    
    UIImageView *imageView = [self createImageView:CGRectMake(50, 9, view.frame.size.width - 55, 1)];
    [view addSubview:imageView];
    return view;

}
//创建横线
-(UIImageView*)createImageView:(CGRect)frame{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:@"线111.png"];
    return imageView;
}
//单元格前的标志
-(void)createImageViewButton:(UIView*)subView withFrame:(CGRect)frame withName:(NSString*)name{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:name];
    [subView addSubview:imageView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
