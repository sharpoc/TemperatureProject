//
//  LXMacro.h
//  TemperatureProject
//
//  Created by admin on 2020/6/12.
//  Copyright © 2020 admin. All rights reserved.
//

//颜色
#define KSQColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define KSQRandomColor KSQColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//屏幕宽高 (portrait)
#define KScreenWidth  [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
