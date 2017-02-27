//
//  DeviceTableViewCell.m
//  SampleCoreData
//
//  Created by S@nchit on 2/27/17.
//  Copyright © 2017 S@nchit. All rights reserved.
//

#import "DeviceTableViewCell.h"

@interface DeviceTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *deviceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;

@end

@implementation DeviceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)bindData : (NSString *)deviceName{
    [self.deviceNameLabel setText:deviceName];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
