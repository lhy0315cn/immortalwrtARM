################################################################
# STA Common Feature Selection
################################################################
#ifdef MT76XX_BT_COEXISTENCE_SUPPORT
HAS_MT76XX_BT_COEXISTENCE_SUPPORT=n
#endif /* MT76XX_BT_COEXISTENCE_SUPPORT */

#ifdef HAS_MT_MAC_BT_COEXISTENCE_SUPPORT
HAS_MT_MAC_BT_COEXISTENCE_SUPPORT=n
#endif /* HAS_MT_MAC_BT_COEXISTENCE_SUPPORT */

#ifdef WOW_SUPPORT
HAS_MT_WOW_SUPPORT=y
HAS_WOW_IFDOWN_SUPPORT=y
#endif

#ifdef WPA_SUPPLICANT_SUPPORT
# Support Wpa_Supplicant
# i.e. wpa_supplicant -Dralink
HAS_WPA_SUPPLICANT=n
#endif /* WPA_SUPPLICANT_SUPPORT */

#ifdef NATIVE_WPA_SUPPLICANT_SUPPORT
# Support Native WpaSupplicant for Network Maganger
# i.e. wpa_supplicant -Dwext
HAS_NATIVE_WPA_SUPPLICANT_SUPPORT=n
#endif /* NATIVE_WPA_SUPPLICANT_SUPPORT */

#ifdef ETH_CONVERT_SUPPORT
# Support for STA Ethernet Converter
HAS_ETH_CONVERT_SUPPORT=n
#endif /* ETH_CONVERT_SUPPORT */

#ifdef DOT11Z_TDLS_SUPPORT
#Support for dot11z TDLS
HAS_DOT11Z_TDLS_SUPPORT=n
#endif /* DOT11Z_TDLS_SUPPORT */

#ifdef WNM_SUPPORT
HAS_WNM_SUPPORT=n
#endif /* WNM_SUPPORT */

#ifdef P2P_SUPPORT
#Support for WiFi-Driect(Peer to Peer)
HAS_P2P_SUPPORT=n
HAS_P2P_ODD_MAC_ADJUST=n
HAS_P2P_SPECIFIC_WIRELESS_EVENT=n
#Support for WiFi Display
HAS_WFD_SUPPORT=n

#Support WIDI feature
#Must enable HAS_WSC at the same time.
#ifdef WIDI_SUPPORT
HAS_WIDI_SUPPORT=n
HAS_INTEL_L2SD_TOGGLE_SCAN_SUPPORT=n
HAS_INTEL_WFD_SUPPORT=n
HAS_WFA_WFD_SUPPORT=n
#endif /* HAS_WIDI_SUPPORT */
#endif /* P2P_SUPPORT */

# Assign specified profile path when insmod
HAS_PROFILE_DYN_SUPPORT=n

#Support ANDROID_SUPPORT (2.X with WEXT-based)
HAS_ANDROID_SUPPORT=n

#HAS_IFUP_IN_PROBE_SUPPORT
HAS_IFUP_IN_PROBE_SUPPORT=n

#Support for USB_SUPPORT_SELECTIVE_SUSPEND
HAS_USB_SUPPORT_SELECTIVE_SUSPEND=n

#Support USB load firmware by multibyte
HAS_USB_FIRMWARE_MULTIBYTE_WRITE=n


################################################################
# STA Customized Feature Selection
################################################################
#ifdef XLINK_SUPPORT
# Support XLINK mode
HAS_XLINK=n
#endif /* XLINK_SUPPORT */


################################################################
# STA Feature Compiler Flag
################################################################
WFLAGS += -DCONFIG_STA_SUPPORT -DSCAN_SUPPORT

#ifdef WSC_INCLUDED
ifeq ($(HAS_WSC),y)
WFLAGS += -DWSC_STA_SUPPORT -DWSC_V2_SUPPORT
ifeq ($(HAS_WSC_LED),y)
WFLAGS += -DWSC_LED_SUPPORT
endif
ifeq ($(HAS_IWSC_SUPPORT),y)
WFLAGS += -DIWSC_SUPPORT
endif
endif
#endif /* WSC_INCLUDED */

#ifdef MT76XX_BT_COEXISTENCE_SUPPORT
ifeq ($(HAS_MT76XX_BT_COEXISTENCE_SUPPORT),y)
WFLAGS += -DMT76XX_BTCOEX_SUPPORT
endif
#endif /* MT76XX_BT_COEXISTENCE_SUPPORT */

#ifdef HAS_MT_MAC_BT_COEXISTENCE_SUPPORT
ifeq ($(HAS_MT_MAC_BT_COEXISTENCE_SUPPORT),y)
WFLAGS += -DMT_MAC_BTCOEX
endif
#endif /* HAS_MT_MAC_BT_COEXISTENCE_SUPPORT */

#ifdef WOW_SUPPORT
ifeq ($(HAS_MT_WOW_SUPPORT),y)
WFLAGS += -DMT_WOW_SUPPORT
ifeq ($(HAS_WOW_IFDOWN_SUPPORT),y)
WFLAGS += -DWOW_IFDOWN_SUPPORT
endif
endif
#endif /* WOW_SUPPORT */

#ifdef WPA_SUPPLICANT_SUPPORT
ifeq ($(HAS_WPA_SUPPLICANT),y)
WFLAGS += -DWPA_SUPPLICANT_SUPPORT
#ifdef NATIVE_WPA_SUPPLICANT_SUPPORT
ifeq ($(HAS_NATIVE_WPA_SUPPLICANT_SUPPORT),y)
WFLAGS += -DNATIVE_WPA_SUPPLICANT_SUPPORT
endif
#endif /* NATIVE_WPA_SUPPLICANT_SUPPORT */
endif
#endif /* WPA_SUPPLICANT_SUPPORT */

#ifdef ETH_CONVERT_SUPPORT
ifeq ($(HAS_ETH_CONVERT_SUPPORT), y)
WFLAGS += -DETH_CONVERT_SUPPORT  -DMAT_SUPPORT
endif
#endif /* ETH_CONVERT_SUPPORT */

#ifdef DOT11Z_TDLS_SUPPORT
ifeq ($(HAS_DOT11Z_TDLS_SUPPORT),y)
WFLAGS += -DDOT11Z_TDLS_SUPPORT -DUAPSD_SUPPORT
endif
#endif /* DOT11Z_TDLS_SUPPORT */

#ifdef WNM_SUPPORT
ifeq ($(HAS_WNM_SUPPORT),y)
WFLAGS += -DCONFIG_DOT11V_WNM
endif
#endif /* WNM_SUPPORT */

#ifdef P2P_SUPPORT
ifeq ($(HAS_P2P_SUPPORT),y)
WFLAGS += -DP2P_SUPPORT -DAPCLI_SUPPORT -DAP_SCAN_SUPPORT -DSCAN_SUPPORT -DP2P_APCLI_SUPPORT -DCONFIG_AP_SUPPORT -DCONFIG_APSTA_MIXED_SUPPORT -DUAPSD_SUPPORT -DMBSS_SUPPORT -DIAPP_SUPPORT -DDOT1X_SUPPORT -DWSC_AP_SUPPORT -DWSC_STA_SUPPORT

ifeq ($(HAS_P2P_ODD_MAC_ADJUST),y)
WFLAGS += -DP2P_ODD_MAC_ADJUST
endif

ifeq ($(HAS_P2P_SPECIFIC_WIRELESS_EVENT),y)
WFLAGS += -DRT_P2P_SPECIFIC_WIRELESS_EVENT
endif

ifeq ($(HAS_WFD_SUPPORT),y)
ifeq ($(HAS_P2P_ODD_MAC_ADJUST),y)
ifeq ($(HAS_P2P_SPECIFIC_WIRELESS_EVENT),y)
WFLAGS += -DWFD_SUPPORT
endif
endif
endif

endif
#endif /* P2P_SUPPORT */

#ifdef WIDI_SUPPORT
ifeq ($(HAS_WIDI_SUPPORT),y)
WFLAGS += -DWIDI_SUPPORT

ifeq ($(HAS_INTEL_L2SD_TOGGLE_SCAN_SUPPORT),y)
WFLAGS += -DINTEL_L2SD_TOGGLE_SCAN_SUPPORT
endif

#ifdef P2P_SUPPORT
ifeq ($(HAS_P2P_SUPPORT),y)
ifeq ($(HAS_INTEL_WFD_SUPPORT),y)
WFLAGS += -DINTEL_WFD_SUPPORT
endif

ifeq ($(HAS_WFA_WFD_SUPPORT),y)
WFLAGS += -DWFA_WFD_SUPPORT
endif
endif
#endif /* P2P_SUPPORT */

endif
#endif /* WIDI_SUPPORT */

ifeq ($(HAS_PROFILE_DYN_SUPPORT),y)
WFLAGS += -DPROFILE_PATH_DYNAMIC
endif

ifeq ($(HAS_ANDROID_SUPPORT),y)
WFLAGS += -DANDROID_SUPPORT
endif

ifeq ($(HAS_IFUP_IN_PROBE_SUPPORT),y)
WFLAGS += -DIFUP_IN_PROBE
endif

ifeq ($(HAS_USB_SUPPORT_SELECTIVE_SUSPEND),y)
WFLAGS += -DUSB_SUPPORT_SELECTIVE_SUSPEND
endif

ifeq ($(HAS_USB_FIRMWARE_MULTIBYTE_WRITE),y)
WFLAGS += -DUSB_FIRMWARE_MULTIBYTE_WRITE -DMULTIWRITE_BYTES=4
endif

#ifdef XLINK_SUPPORT
ifeq ($(HAS_XLINK),y)
WFLAGS += -DXLINK_SUPPORT
endif
#endif /* XLINK_SUPPORT */

#ifdef ADHOC_WPA2PSK_SUPPORT
#WFLAGS += -DADHOC_WPA2PSK_SUPPORT
#endif /* ADHOC_WPA2PSK_SUPPORT */