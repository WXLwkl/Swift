//
//  NextViewController.m
//  DaoJS
//
//  Created by yinjia on 16/2/2.
//  Copyright © 2016年 xinln. All rights reserved.
//

#import "NextViewController.h"

#ifdef DEBUG
#define NSLog(fmt,...) NSLog((@"%s[Line %d]" fmt),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__);
#else
#define NSLog(fmt,...) nil
#endif
@interface NextViewController ()
{
     UIButton *btn;
    
     UILabel *_label;

}
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //手机序列号
//    NSString* identifierNumber = [[UIDevice currentDevice] uniqueIdentifier];
    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    NSLog(@"手机序列号: %@",identifierForVendor);
    
    //手机别名： 用户定义的名称
    NSString* userPhoneName = [[UIDevice currentDevice] name];
    NSLog(@"手机别名: %@", userPhoneName);
    //设备名称
    NSString* deviceName = [[UIDevice currentDevice] systemName];
    NSLog(@"设备名称: %@",deviceName );
    //手机系统版本
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    NSLog(@"手机系统版本: %@", phoneVersion);
    //手机型号
    NSString* phoneModel = [[UIDevice currentDevice] model];
    NSLog(@"手机型号: %@",phoneModel );
    //地方型号  （国际化区域名称）
    NSString* localPhoneModel = [[UIDevice currentDevice] localizedModel];
    NSLog(@"国际化区域名称: %@",localPhoneModel );
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // 当前应用名称
    NSString *appCurName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    NSLog(@"当前应用名称：%@",appCurName);
    // 当前应用软件版本  比如：1.0.1
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"当前应用软件版本:%@",appCurVersion);
    // 当前应用版本号码   int类型
    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];
    NSLog(@"当前应用版本号码：%@",appCurVersionNum);
    
    
    btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 64, 200, 40)];
    [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    btn.layer.borderWidth = 2;
    btn.layer.cornerRadius = 4.5;
    btn.layer.masksToBounds = YES;
    btn.layer.borderColor = [UIColor blueColor].CGColor;
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 200, 50)];
    
    _label.text = @"剩余时间";
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
}

-(void)timerFireMethod:(NSTimer *)timer
{

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDate *now = [NSDate date];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags1 =  NSCalendarUnitYear| NSCalendarUnitMonth| NSCalendarUnitDay| NSCalendarUnitHour| NSCalendarUnitMinute| NSCalendarUnitSecond;
    
    
    comps = [calendar components:unitFlags1 fromDate:now];
    
    NSInteger currentYear = [comps year];
    NSInteger currentMonth = [comps month];
    NSInteger currentDay = [comps day];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *endTime = [[NSDateComponents alloc] init];//初始化目标时间
    
    [endTime setYear:currentYear];
    [endTime setMonth:currentMonth];
    [endTime setDay:currentDay];
    [endTime setHour:17];
    [endTime setMinute:30];
    [endTime setSecond:0];
    
    NSDate *fireDate = [cal dateFromComponents:endTime]; //目标时间
    
    NSDate *today = [NSDate date];//当前时间
    
    unsigned int unitFlags =  NSCalendarUnitYear| NSCalendarUnitMonth| NSCalendarUnitDay| NSCalendarUnitHour| NSCalendarUnitMinute| NSCalendarUnitSecond;
    
    NSDateComponents *d = [cal components:unitFlags fromDate:today toDate:fireDate options:0];
    _label.text = [NSString stringWithFormat:@"%zi天%zi时%zi分%zi秒",[d day],[d hour],[d minute],[d second]];
    
    if ([d day] <= 0 && [d hour] <= 0 && [d minute] <=0 && [d second] <= 0) {
        
        [timer invalidate];
        _label.text = @"今天的倒计时已失效！";
    }
    
    
    
    
    
    
    
    
    
    /*
    
    //NSCalendar日历
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *endTime = [[NSDateComponents alloc] init];//初始化目标时间
    [endTime setYear:2016];
    [endTime setMonth:2];
    [endTime setDay:3];
    [endTime setHour:17]; //+12小时
    [endTime setMinute:10];
    [endTime setSecond:0];
    
    NSDate *fireDate = [cal dateFromComponents:endTime]; //目标时间
    
    NSDate *today = [NSDate date];//当前时间
    
    unsigned int unitFlags =  NSCalendarUnitYear| NSCalendarUnitMonth| NSCalendarUnitDay| NSCalendarUnitHour| NSCalendarUnitMinute| NSCalendarUnitSecond;
    
    NSDateComponents *d = [cal components:unitFlags fromDate:today toDate:fireDate options:0];
    _label.text = [NSString stringWithFormat:@"%zi天%zi时%zi分%zi秒",[d day],[d hour],[d minute],[d second]];
 
    if ([d day] <= 0 && [d hour] <= 0 && [d minute] <=0 && [d second] <= 0) {
        
        [timer invalidate];
    }
    
     */
    
    /*
    
    BOOL timeStart = YES;
    
    NSCalendar *cal = [NSCalendar currentCalendar];//定义一个NSCalendar对象
    NSDateComponents *endTime = [[NSDateComponents alloc] init];    //初始化目标时间...
    NSDate *today = [NSDate date];    //得到当前时间
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *toDate = [NSDate dateWithTimeInterval:60 sinceDate:today];
    NSString *dateString = [dateFormatter stringFromDate:toDate];
    
    NSLog(@"%@",dateString);
//    NSString *overdate = [dateFormatter stringFromDate:dateString];
    //    NSLog(@"overdate=%@",overdate);
    static int year;
    static int month;
    static int day;
    static int hour;
    static int minute;
    static int second;
    if(timeStart) {//从NSDate中取出年月日，时分秒，但是只能取一次
        year = [[dateString substringWithRange:NSMakeRange(0, 4)] intValue];
        month = [[dateString substringWithRange:NSMakeRange(5, 2)] intValue];
        day = [[dateString substringWithRange:NSMakeRange(8, 2)] intValue];
        hour = [[dateString substringWithRange:NSMakeRange(11, 2)] intValue];
        minute = [[dateString substringWithRange:NSMakeRange(14, 2)] intValue];
        second = [[dateString substringWithRange:NSMakeRange(17, 2)] intValue];
        timeStart= NO;
    }
    
    [endTime setYear:year];
    [endTime setMonth:month];
    [endTime setDay:day];
    [endTime setHour:hour];
    [endTime setMinute:minute];
    [endTime setSecond:second];
    NSDate *overTime = [cal dateFromComponents:endTime]; //把目标时间装载入date
    //用来得到具体的时差，是为了统一成北京时间
    unsigned int unitFlags =  NSCalendarUnitYear| NSCalendarUnitMonth| NSCalendarUnitDay| NSCalendarUnitHour| NSCalendarUnitMinute| NSCalendarUnitSecond;
    NSDateComponents *d = [cal components:unitFlags fromDate:today toDate:overTime options:0];
    NSString *t = [NSString stringWithFormat:@"%ld", (long)[d day]];
    NSString *h = [NSString stringWithFormat:@"%ld", (long)[d hour]];
    NSString *fen = [NSString stringWithFormat:@"%ld", (long)[d minute]];
    
    
    if([d minute] < 10) {
        fen = [NSString stringWithFormat:@"0%ld",(long)[d minute]];
    }
    NSString *miao = [NSString stringWithFormat:@"%ld", (long)[d second]];
    if([d second] < 10) {
        miao = [NSString stringWithFormat:@"0%ld",(long)[d second]];
    }
    //    NSLog(@"===%@天 %@:%@:%@",t,h,fen,miao);
    [_label setText:[NSString stringWithFormat:@"%@天 %@:%@:%@",t,h,fen,miao]];
   
    if([d second] > 0) {
        //计时尚未结束，do_something
//                [_label setText:[NSString stringWithFormat:@"%@:%@:%@",d,fen,miao]];
    } else if([d second] == 0) {
        //计时结束 do_something
        
    } else{
        //计时器失效
        [timer invalidate];
    }
     */
     
}
//GCD倒计时
-(void)btnClick
{
    NSLog(@"==btn==");
   
    __block int timeout = 20;//倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0  );
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);//每秒执行
    dispatch_source_set_event_handler(timer, ^{
        if (timeout <= 0) {//倒计时结束，关闭
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [btn setTitle:@"发送验证码" forState:UIControlStateNormal];
                btn.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 60;
//            NSString *strTime = [NSString stringWithFormat:@"%.2d",seconds];
            NSLog(@"---%.2d",seconds);
            dispatch_async(dispatch_get_main_queue(), ^{
                [btn setTitle:[NSString stringWithFormat:@"%.2d秒后重新发送",seconds] forState:UIControlStateNormal];
                btn.userInteractionEnabled = NO;

            });
            timeout--;
        }
    });
    dispatch_resume(timer);
    
    
    
    
    
    
    
    
    
    /*
    btn.userInteractionEnabled = NO;
    
    if (a <= 0) {
        
//        [btn setTitle:@"发送验证码" forState:UIControlStateNormal];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(jishi) userInfo:nil repeats:YES];
        a = 20;
    }
    else
    {
       
        [btn setTitle:[NSString stringWithFormat:@"%d",a] forState:UIControlStateNormal];
        
    }
     */
    
}
- (void)viewWillDisappear:(BOOL)animated {
    
}
//-(void)jishi
//{
//    a--;
//    [btn setTitle:[NSString stringWithFormat:@"%d",a] forState:UIControlStateNormal];
//    if (a <=0) {
//        [_timer invalidate];
//        [btn setTitle:@"发送验证码" forState:UIControlStateNormal];
//        btn.userInteractionEnabled = YES;
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
