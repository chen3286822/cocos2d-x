@echo off

set DIR=%~dp0
set APP_ROOT=%DIR%..\
set APP_ANDROID_ROOT=%DIR%
set COCOS2DX_ROOT=%QUICK_COCOS2DX_ROOT%\lib\cocos2d-x
set COCOS2DX_CORE=%COCOS2DX_ROOT%\cocos
set APP_ANDROID_PREBUILD=%QUICK_COCOS2DX_ROOT%\lib\precompiled\android

echo - config:
echo   ANDROID_NDK_ROOT    = %ANDROID_NDK_ROOT%
echo   QUICK_COCOS2DX_ROOT = %QUICK_COCOS2DX_ROOT%
echo   COCOS2DX_ROOT       = %COCOS2DX_ROOT%
echo   APP_ROOT            = %APP_ROOT%
echo   APP_ANDROID_ROOT    = %APP_ANDROID_ROOT%
echo   APP_ANDROID_PREBUILD    = %APP_ANDROID_PREBUILD%

rem if dont use DEBUG, comments out two lines below
set NDK_DEBUG=1
set NDK_BUILD_FLAGS=CPPFLAGS="-DCOCOS2D_DEBUG=1"

echo - cleanup
if exist "%APP_ANDROID_ROOT%bin" rmdir /s /q "%APP_ANDROID_ROOT%bin"
mkdir "%APP_ANDROID_ROOT%bin"
if exist "%APP_ANDROID_ROOT%assets" rmdir /s /q "%APP_ANDROID_ROOT%assets"
mkdir "%APP_ANDROID_ROOT%assets"

echo - copy scripts
mkdir "%APP_ANDROID_ROOT%assets\scripts"
xcopy /s /q "%APP_ROOT%scripts\*.*" "%APP_ANDROID_ROOT%assets\scripts\"
echo - copy resources
mkdir "%APP_ANDROID_ROOT%assets\res"
xcopy /s /q "%APP_ROOT%res\*.*" "%APP_ANDROID_ROOT%assets\res\"

echo Using prebuilt externals
"%ANDROID_NDK_ROOT%\ndk-build" %ANDROID_NDK_BUILD_FLAGS% NDK_DEBUG=%NDK_DEBUG% %NDK_BUILD_FLAGS% -C %APP_ANDROID_ROOT% NDK_MODULE_PATH=%COCOS2DX_ROOT%;%COCOS2DX_ROOT%/external;%COCOS2DX_CORE%