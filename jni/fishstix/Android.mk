LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := dosbox

CG_SUBDIRS := .\

MY_PATH := $(LOCAL_PATH)

#LOCAL_PATH := $(abspath $(LOCAL_PATH))

CG_SRCDIR := $(LOCAL_PATH)
LOCAL_CFLAGS :=	-I$(LOCAL_PATH)/include \
				$(foreach D, $(CG_SUBDIRS), -I$(CG_SRCDIR)/$(D)) \
				-I$(LOCAL_PATH)/../SDL2/include \
				-I$(LOCAL_PATH)/../dosbox-2017 \
				-I$(LOCAL_PATH)/../dosbox-2017/include \
				-I$(LOCAL_PATH)/../dosbox-2017/src \
				-I$(LOCAL_PATH) 
				
LOCAL_PATH := $(MY_PATH)

#Change C++ file extension as appropriate
LOCAL_CPP_EXTENSION := .cpp

LOCAL_SRC_FILES := $(foreach F, $(CG_SUBDIRS), $(addprefix $(F)/,$(notdir $(wildcard $(LOCAL_PATH)/$(F)/*.cpp))))
LOCAL_ARM_MODE := arm

LOCAL_CPPFLAGS := $(LOCAL_CFLAGS)
LOCAL_CXXFLAGS := $(LOCAL_CFLAGS) -fexceptions
LOCAL_STATIC_LIBRARIES := fishstix_al dosbox_main
LOCAL_LDLIBS += -llog -ljnigraphics 


include $(BUILD_SHARED_LIBRARY)
