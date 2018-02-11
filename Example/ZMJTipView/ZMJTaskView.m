//
//  ZMJTaskView.m
//  ZMJTipView_Example
//
//  Created by Jason on 2018/2/11.
//  Copyright © 2018年 keshiim. All rights reserved.
//

#import "ZMJTaskView.h"
#import "UIView+Frame.h"
@import YYCategories;

#define TaskTitleColor [UIColor whiteColor]//[UIColor colorWithHexString:@"333333"]
#define TimeTitleColor [UIColor whiteColor]//[UIColor colorWithHexString:@"999999"]
#define ValueColor     [UIColor whiteColor]//[UIColor colorWithHexString:@"666666"]
#define LineColor      [UIColor whiteColor]//[UIColor colorWithHexString:@"DBDBDB"]

@interface ZMJTaskView ()
@property (nonatomic, strong) UILabel *taskTitleLabel;
@property (nonatomic, strong) UILabel *startTimeTitleLabel;
@property (nonatomic, strong) UILabel *startTimeLabel;
@property (nonatomic, strong) UILabel *endTimeTitleLabel;
@property (nonatomic, strong) UILabel *endTimeLabel;
@property (nonatomic, strong) UIView  *separatorLine;
@property (nonatomic, strong) UILabel *viewDetailLabel;
@end

@implementation ZMJTaskView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {

    self.taskTitleLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:16.f];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.textColor = TaskTitleColor;
        [self addSubview:label];
        label;
    });
                           
    self.startTimeTitleLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:12.f];
        label.text = @"Start time:";
        label.textColor = TimeTitleColor;
        [self addSubview:label];
        label;
    });
    
    self.startTimeLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:12.f];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.textColor = ValueColor;
        [self addSubview:label];
        label;
    });
    
    self.endTimeTitleLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:12.f];
        label.text = @"End time:";
        label.textColor = TimeTitleColor;
        [self addSubview:label];
        label;
    });
    
    self.endTimeLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:12.f];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.textColor = ValueColor;
        [self addSubview:label];
        label;
    });
    
    self.separatorLine = ({
        UIView *line = [UIView new];
        line.backgroundColor = LineColor;
        [self addSubview:line];
        line;
    });
    
    self.viewDetailLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:14.f];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.text = @"View the detail";
        label.textColor = ValueColor;
        [self addSubview:label];
        label;
    });
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.taskTitleLabel sizeToFit];
    self.taskTitleLabel.x = self.taskTitleLabel.y = 12.f;
    self.taskTitleLabel.maxXByStretch = self.width - 12.f;
    
    [self.startTimeTitleLabel sizeToFit];
    self.startTimeTitleLabel.x = 12.f;
    self.startTimeTitleLabel.y = self.taskTitleLabel.maxY + 6.f;
    
    [self.startTimeLabel sizeToFit];
    self.startTimeLabel.x = self.startTimeTitleLabel.maxX;
    self.startTimeLabel.y = self.startTimeTitleLabel.y;
    self.startTimeLabel.maxXByStretch = self.width - 12.f;
    
    [self.endTimeTitleLabel sizeToFit];
    self.endTimeTitleLabel.x = 12.f;
    self.endTimeTitleLabel.y = self.startTimeLabel.maxY + 2.f;
    
    [self.endTimeLabel sizeToFit];
    self.endTimeLabel.x = self.endTimeTitleLabel.maxX;
    self.endTimeLabel.y = self.endTimeTitleLabel.y;
    self.endTimeLabel.maxXByStretch = self.width - 12.f;
    
    self.separatorLine.x = 0;
    self.separatorLine.y = self.endTimeTitleLabel.maxY + 10.f;
    self.separatorLine.maxXByStretch = self.width;
    self.separatorLine.height = 1 / [UIScreen mainScreen].scale;
    
    [self.viewDetailLabel sizeToFit];
    self.viewDetailLabel.x = 12.f;
    self.viewDetailLabel.y = self.separatorLine.maxY + 10.f;
    self.viewDetailLabel.maxXByStretch = self.width - 12.f;
}

- (CGSize)intrinsicContentSize {
    CGFloat height = 0.f;
    [self layoutIfNeeded];
    height = self.viewDetailLabel.maxY + 12.f;
    return CGSizeMake(self.width, height);
}

// MARK: getter
- (void)setTaskTitle:(NSString *)taskTitle {
    _taskTitle = taskTitle;
    self.taskTitleLabel.text = taskTitle;
}

- (void)setStartTime:(NSString *)startTime {
    _startTime = startTime;
    self.startTimeLabel.text = startTime;
}

- (void)setEndTime:(NSString *)endTime {
    _endTime = endTime;
    self.endTimeLabel.text = endTime;
}
@end
