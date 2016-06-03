//
//  JSCountryIndexViewController.m
//  SailvanElec
//
//  Created by gcb999 on 16/6/2.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSCountryIndexViewController.h"
#import "JSTableViewController.h"
#import "CountryModel.h"
#import "HotCountryCell.h"

#import "CountryCell.h"


@interface JSCountryIndexViewController ()<JSTableViewControllerDelegate,MJNIndexViewDataSource>{
 
 
  
}

@end

@implementation JSCountryIndexViewController




- (void)viewDidLoad {
    [super viewDidLoad];
  
    //列表
    self.ctrl=[[JSTableGroupViewController alloc] initWithState:JSTableViewPullHeader tableViewCellClass:nil delegate:self];
    self.ctrl.view.frame=self.view.bounds;
    [self.view addSubview:self.ctrl.view];
    [self addChildViewController:self.ctrl];
    
    
    
    //第三方索引
    [self firstAttributesForMJNIndexView];
    [self.view addSubview:self.indexView];
    
}


-(void)JSTableViewController:(JSTableViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    [self getData];
}



#pragma mark - 自定义方法
- (void)getData
{
    //读取plist文件
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"address" ofType:@"plist"];
    NSDictionary * dataDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSDictionary * bigDic = dataDic[@"data"];
    NSArray * keyArray = [bigDic allKeys];
    NSMutableArray * dataArray = [NSMutableArray array];
    for (int i = 0; i < keyArray.count; i ++) {
        NSDictionary * dic = bigDic[keyArray[i]];//1:条数据
        CountryModel * model = [[CountryModel alloc]initWithDictionary:dic];
        [dataArray addObject:model];
    }
    
 
    

    //得到索引数组
    NSMutableArray * indexArray = [NSMutableArray array];
    NSArray *arrayPy=[NSArray arrayFor26LetterUpperGroups];
    [indexArray addObject:@"hot"];
    for (int i = 0; i < arrayPy.count; i ++) {
        for (int j = 0; j < dataArray.count; j ++) {
            CountryModel * model = dataArray[j];
            NSString * indexLetter = [model.countryName substringWithRange:NSMakeRange(0, 1)];
            if ([arrayPy[i] isEqualToString:indexLetter]) {
                [indexArray addObject:indexLetter];
                break;
            }
        }
    }
    self.ctrl.sections = indexArray;
    
    //热门国家数据
    NSDictionary * hotDic = dataDic[@"hot"];
    NSArray * hotKeys = [hotDic allKeys];
    NSMutableArray * hotArray = [NSMutableArray array];
    for (int i = 0; i < hotKeys.count; i ++) {
        NSString * str = hotDic[hotKeys[i]];
        [hotArray addObject:str];
    }
 
    
    
    //按字母整理好数
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < self.ctrl.sections.count; i ++) {
        NSMutableArray * groupArray = [NSMutableArray array];
        for (int j = 0; j < dataArray.count; j ++) {
            CountryModel * model = dataArray[j];
            NSString * indexLetter = [model.countryName substringWithRange:NSMakeRange(0, 1)];
            if ([self.ctrl.sections[i] isEqualToString:indexLetter]) {
                [groupArray addObject:model];
            }
        }
        [dic setObject:groupArray forKey:self.ctrl.sections[i]];
    }
  
   [dic setObject:hotArray forKey:@"hot"];
    [self.ctrl.rowsOfSectionDic addEntriesFromDictionary:dic];
    

    
    
    [self firstTableExample];
}

#pragma mark - MJIndexView自定义方法
//创建字母阶梯
- (void)firstAttributesForMJNIndexView
{
    self.indexView.getSelectedItemsAfterPanGestureIsFinished = YES;
    self.indexView.font = [UIFont fontWithName:@"HelveticaNeue" size:13.0];
    self.indexView.selectedItemFont = [UIFont fontWithName:@"HelveticaNeue" size:40.0];
    self.indexView.backgroundColor = [UIColor clearColor];
    self.indexView.curtainColor = nil;
    self.indexView.curtainFade = 0.0;
    self.indexView.curtainStays = NO;
    self.indexView.curtainMoves = YES;
    self.indexView.curtainMargins = NO;
    self.indexView.ergonomicHeight = NO;
    self.indexView.upperMargin = 22.0;
    self.indexView.lowerMargin = 22.0;
    self.indexView.rightMargin = 10.0;
    self.indexView.itemsAligment = NSTextAlignmentCenter;
    self.indexView.maxItemDeflection = 100.0;
    self.indexView.rangeOfDeflection = 5;
    self.indexView.fontColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0];
    self.indexView.selectedItemFontColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    self.indexView.darkening = NO;
    self.indexView.fading = YES;
}
- (void)firstTableExample
{
    [self.ctrl reloadHeader];
    [self.ctrl.tableView reloadSectionIndexTitles];
    [self.indexView refreshIndexItems];
   [self.ctrl.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark MJMIndexForTableView datasource methods
- (NSArray *)sectionIndexTitlesForMJNIndexView:(MJNIndexView *)indexView
{
    return self.ctrl.sections;
}
- (void)sectionForSectionMJNIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
   
    [self.ctrl.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:index] atScrollPosition: UITableViewScrollPositionTop animated:YES];
}
-(NSInteger)JSTableViewController:(JSTableViewController *)JSCtrl numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return 1;
    }
    
    NSArray * array = JSCtrl.rowsOfSectionDic[JSCtrl.sections[section]];
    return array.count;
}

-(UITableViewCell *)JSTableViewController:(JSTableViewController *)JSCtrl cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        
        static NSString * ID = @"hotCountry";
        HotCountryCell * cell = [JSCtrl.tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[HotCountryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.hotArray = JSCtrl.rowsOfSectionDic[@"hot"];
        return cell;
        
    }
    else{
        static NSString * ID = @"hotCountry1";
        id<JSTableViewCellDelegate> cell = [JSCtrl.tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[CountryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        NSString *str= JSCtrl.sections[indexPath.section];
        id content=JSCtrl.rowsOfSectionDic[str][indexPath.row];
        [cell JSTableViewController:JSCtrl sections:JSCtrl.sections rowsOfSections:JSCtrl.rowsOfSectionDic content:content indexPath:indexPath];
        return (UITableViewCell *)cell;
        
    }
    
}


//对section样式和内容修改
-(UIView*)JSTableViewController:(JSTableViewController *)JSCtrl viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, 80)];
        return view;
    }else
    {
        //定义view设置样式，定义view中的title(lable)设置样式
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, 20)];
        view.backgroundColor= [UIColor whiteColor];
        UILabel *lablel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, IPHONScreenWidth - 24, 20)];
        lablel.textColor = RGB(51, 51, 51);
        lablel.font=[UIFont systemFontOfSize:12];
        lablel.backgroundColor = RGB(242, 242, 242);
        lablel.text = [NSString stringWithFormat:@"   %@",self.ctrl.sections[section]];
        [view addSubview:lablel];
        return view;
    }
}


//返回行间距
-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100.0f;
    }else
    {
        return 48.0f;
    }
}

-(CGFloat)JSTableViewController:(JSTableViewController *)JSCtrl heightForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return 0;
    }else{
        return 20.0f;
    }
}

#pragma mark - setter and getter

- (MJNIndexView *)indexView
{
    if (_indexView == nil) {
        _indexView = [[MJNIndexView alloc]initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, IPHONScreenHeight - 200)];
        _indexView.dataSource = self;
    }
    return _indexView;
}



@end
