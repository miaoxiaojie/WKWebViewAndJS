//
//  ZMMPickView.m
//  WKWebViewAndJS
//
//  Created by miao on 2019/4/22.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMPickView.h"

@interface ZMMPickView()<UIPickerViewDelegate,UIPickerViewDataSource>

//底部半透明的view
@property (strong,nonatomic) UIView *downBackgroundView;
@property (strong,nonatomic) UIPickerView *pickerView;
@property (strong,nonatomic) UIToolbar *toolBar;
@property (copy,nonatomic) ZMMMSelectBankCardBlock selectBlock;
@property (strong,nonatomic) NSArray *bankCards;
@property (copy,nonatomic) NSString *cardName;

@end

@implementation ZMMPickView

-(void)dealloc{
}

- (instancetype)init
{
    self = [super initWithFrame:CGRectZero];
    if (self)
    {
       
        self.frame = CGRectMake(0,[[UIScreen mainScreen] bounds].size.height - 260,[[UIScreen mainScreen] bounds].size.width, 260);
        self.backgroundColor = [UIColor whiteColor];
        self.downBackgroundView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.downBackgroundView.backgroundColor = [UIColor whiteColor];
        self.downBackgroundView.alpha = 0.7;
        
        _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 44)];
        _toolBar.barStyle = UIBarStyleDefault;
        
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        leftItem.width = 6.0;
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        rightItem.width = 6.0;
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissPicker)];
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(submitDate)];
        UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        NSMutableArray *items = [NSMutableArray arrayWithObjects:leftItem,cancelItem, spaceItem, doneItem, rightItem,nil];
        _toolBar.items = items;
        [self addSubview:_toolBar];
        
    }
    return self;
}

-(void)showInView:(UIView *)aView
        bankCards:(NSArray *)cards
{
    if (cards.count == 0) {
        return;
    }
    self.bankCards = cards;
    self.cardName = [cards objectAtIndex:0];
    [aView addSubview:self.downBackgroundView];
    [self.downBackgroundView addSubview:self];
    [self addSubview:self.pickerView];
    [self.pickerView reloadAllComponents];
}

- (void)setSelectBankCardBlock:(ZMMMSelectBankCardBlock)block
{
    self.selectBlock = block;
}

-(void)submitDate
{
    
    if (self.selectBlock) {
        self.selectBlock(self.cardName);
    }
    [self dismissPicker];
}

-(void)dismissPicker
{
    
    [self removeFromSuperview];
    [self.downBackgroundView removeFromSuperview];
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.bankCards objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.cardName = [self.bankCards objectAtIndex:row];
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.bankCards.count;
}

#pragma mark - getter/setter
- (UIPickerView *)pickerView
{
    if (!_pickerView)
    {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44,[[UIScreen mainScreen] bounds].size.width, 216)];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        _pickerView.backgroundColor = [UIColor whiteColor];
        
    }
    return _pickerView;
}



@end
