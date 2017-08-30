LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := fishstix_al

CG_SUBDIRS := .\

# Add more subdirs here, like src/subdir1 src/subdir2

MY_PATH := $(LOCAL_PATH)

LOCAL_PATH := $(abspath $(LOCAL_PATH))

CG_SRCDIR := $(LOCAL_PATH)
LOCAL_CFLAGS :=	-I$(LOCAL_PATH)/include \
				$(foreach D, $(CG_SUBDIRS), -I$(CG_SRCDIR)/$(D)) \
				-I$(LOCAL_PATH)/../fishstix/include \
				-I$(LOCAL_PATH)/../SDL2/include \
				-I$(LOCAL_PATH)/../dosbox-2017 \
				-I$(LOCAL_PATH)/../dosbox-2017/include \
				-I$(LOCAL_PATH)/../dosbox-2017/src \
				-I$(LOCAL_PATH) 
				
				
LOCAL_PATH := $(MY_PATH)

#Change C++ file extension as appropriate
LOCAL_CPP_EXTENSION := .cpp
LOCAL_SRC_FILES := $(foreach F, $(CG_SUBDIRS), $(addprefix $(F)/,$(notdir $(wildcard $(LOCAL_PATH)/$(F)/*.cpp))))

LOCAL_CPPFLAGS := $(LOCAL_CFLAGS)
LOCAL_CXXFLAGS := $(LOCAL_CFLAGS)

include $(BUILD_STATIC_LIBRARY)
