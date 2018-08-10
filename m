From: anders.roxell at linaro.org (Anders Roxell)
Date: Fri, 10 Aug 2018 10:50:26 +0200
Subject: kselftest-merge misses config's to merge
Message-ID: <CADYN=9KTA0LeczLnY8kxyrCtm2umPX0ODsmVEhBbBTY4MfUP0A@mail.gmail.com>

Hi,

I have a question about the config files in tools/testing/selftests/ .
The kselftest-merge target in the root Makefile assumes that the
config files are placed in
tools/testing/selftests/*/config and selftests/android/ion/config and
selftests/net/forwarding/config doesn't follow that. So either we move
those files up a level or do something like below in the top Makefile.

diff --git a/Makefile b/Makefile
index c88d56de7fda..06aeeca16917 100644
--- a/Makefile
+++ b/Makefile
@@ -1188,12 +1188,13 @@ PHONY += kselftest-clean
 kselftest-clean:
  $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests clean

+KSFT_CONFIGS=$(shell find $(srctree)/tools/testing/selftests/ -type f
-name config)
 PHONY += kselftest-merge
 kselftest-merge:
  $(if $(wildcard $(objtree)/.config),, $(error No .config exists,
config your kernel first!))
  $(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
  -m $(objtree)/.config \
- $(srctree)/tools/testing/selftests/*/config
+ $(KSFT_CONFIGS)
  +$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig

 # ---------------------------------------------------------------------------


or do you have another way to solve this?

Cheers,
Anders
