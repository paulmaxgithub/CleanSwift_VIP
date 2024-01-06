#!/bin/sh

#  ci_pre_xcodebuild.sh
#  IceCreamCreator
#
#  Created by PAULMAX iOS DEV on 06/01/2024.
#  Copyright © 2024 Ray Wenderlich. All rights reserved.

if [[ -n $CI_PULL_REQUEST_NUMBER && $CI_XCODEBUILD_ACTION = 'archive' ]];
then
    echo "Setting IceCreamCreator Beta App Icon"
    APP_ICON_PATH=$CI_PRIMARY_REPOSITORY_PATH/Resources/Assets.xcassets/AppIcon.appiconset
    
    # Remove existing App Icon
    rm -rf $APP_ICON_PATH
    
    # Replace with Fruta Beta App Icon
    mv "$CI_PRIMARY_REPOSITORY_PATH/ci_scripts/AppIcon-Beta.appiconset" $APP_ICON_PATH
fi
