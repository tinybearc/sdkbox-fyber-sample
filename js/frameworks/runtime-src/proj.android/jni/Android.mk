LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := cocos2djs_shared

LOCAL_MODULE_FILENAME := libcocos2djs

LOCAL_SRC_FILES := ../../Classes/AppDelegate.cpp ../../Classes/ide-support/SimpleConfigParser.cpp ../../Classes/ide-support/RuntimeJsImpl.cpp hellojavascript/main.cpp ../../Classes/PluginFyberJS.cpp ../../Classes/PluginFyberJS.hpp ../../Classes/PluginFyberJSHelper.cpp ../../Classes/PluginFyberJSHelper.h ../../Classes/SDKBoxJSHelper.cpp ../../Classes/SDKBoxJSHelper.h ../../Classes/PluginAdColonyJS.cpp ../../Classes/PluginAdColonyJSHelper.cpp ../../Classes/PluginChartboostJS.cpp ../../Classes/PluginChartboostJS.hpp ../../Classes/PluginChartboostJSHelper.cpp ../../Classes/PluginChartboostJSHelper.h ../../Classes/PluginVungleJS.cpp ../../Classes/PluginVungleJS.hpp ../../Classes/PluginVungleJSHelper.cpp ../../Classes/PluginVungleJSHelper.h

LOCAL_LDLIBS := -landroid -llog
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes
LOCAL_WHOLE_STATIC_LIBRARIES := PluginFyber sdkbox PluginAdColony PluginChartboost PluginVungle


LOCAL_STATIC_LIBRARIES := cocos2d_js_static

include $(BUILD_SHARED_LIBRARY)
$(call import-add-path, $(LOCAL_PATH))


$(call import-module,scripting/js-bindings/proj.android/prebuilt-mk)
$(call import-module, ./sdkbox)
$(call import-module, ./pluginfyber)
$(call import-module, ./pluginadcolony)
$(call import-module, ./pluginchartboost)
$(call import-module, ./pluginvungle)
