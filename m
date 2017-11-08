From: amit.pundir at linaro.org (Amit Pundir)
Date: Wed,  8 Nov 2017 17:17:38 +0530
Subject: [Linux-kselftest-mirror] [PATCH 0/2] selftests: firmware: skip
	testing unsupported features
Message-ID: <1510141660-31612-1-git-send-email-amit.pundir@linaro.org>

Hi,

At Linaro we run mainline/linux-next selftests on LTS releases and
run into few test failures due to kernel mismatch or missing upstream
functionality in older kernels. Discussed at length here:
https://lkml.org/lkml/2017/6/15/652

This patch series is an attempt to modify selftest firmware test scripts.
The proposed changes skip/ignore testing the upstream functionality
missing in the older kernel releases.

Regards,
Amit Pundir


Amit Pundir (2):
  selftests: firmware: skip unsupported async loading tests
  selftests: firmware: skip unsupported custom firmware fallback tests

 tools/testing/selftests/firmware/fw_fallback.sh   | 38 ++++++++++++++++-------
 tools/testing/selftests/firmware/fw_filesystem.sh | 34 ++++++++++++--------
 2 files changed, 47 insertions(+), 25 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
