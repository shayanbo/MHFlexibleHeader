# MHFlexibleHeader
Flexible Section Header for Tableview

[![Cocoapods](http://img.shields.io/cocoapods/v/MHFlexibleHeader.svg?style=flat)](http://www.cocoapods.org/?q= mhflexibleheader)
[![Cocoapods](http://img.shields.io/cocoapods/l/MHFlexibleHeader.svg?style=flat)](http://www.cocoapods.org/?q=mhflexibleheader)
[![Cocoapods](http://img.shields.io/cocoapods/p/MHFlexibleHeader.svg?style=flat)](http://www.cocoapods.org/?q= mhflexibleheader)
[![Join the chat at https://gitter.im/MickeyHub/MHFlexibleHeader](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/MickeyHub/MHFlexibleHeader)
[![Contact](https://img.shields.io/badge/contact-Mickey-green.svg)](http://weibo.com/u/2194071594)

A subclass of UITableView to fix header when scroll up and movable header when scroll down

#Screenshot

![MHScrollingHeader](https://github.com/MickeyHub/MHFlexibleHeader/raw/master/screenshot.gif)

#Setup with Cocoapods

```
pod 'MHFlexibleHeader', '~> 0.0.1'
use_frameworks!
```
# Manually from GitHub
1. Download the source files in the [MHFlexibleHeaderTableView subdirectory](MHFlexibleHeaderTableView/FlexibleHeaderTableView).
1. Add the source files to your Xcode project.
1. Import the `MHFlexibleSectionHeaderTableView.h` header.

##Usage

make sure you implement the `flexibleSectionHeaderTableView:tableView configHeader:header forSection:section` to config data to header view

Check out the sample project for more details.

#Author
[MickeyHub](http://weibo.com/u/2194071594)

#MIT License
    The MIT License (MIT)

    Copyright (c) 2015 MickeySha

    Permission is hereby granted, free of charge, to any person obtaining a copy of
    this software and associated documentation files (the "Software"), to deal in
    the Software without restriction, including without limitation the rights to
    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
    the Software, and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

