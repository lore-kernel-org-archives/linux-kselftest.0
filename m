From: lizhijian@cn.fujitsu.com (Li Zhijian)
Date: Mon,  2 Jul 2018 11:53:51 +0800
Subject: [PATCH 0/3] fix selftests compiling errors and warnings
Message-ID: <1530503634-32241-1-git-send-email-lizhijian@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180702035351.Lgwt0WDJfU6PzUJqEl4QjgiOmKtrRjXnTRR2TI_w8lc@z>


Li Zhijian (3):
  selftests/android: fix compiling error
  selftests/android: initialize heap_type to avoid compiling warning
  selftests/gpio: unset OUTPUT for build tools/gpio

 tools/testing/selftests/android/ion/Makefile        | 5 ++++-
 tools/testing/selftests/android/ion/ionapp_export.c | 7 +++++++
 tools/testing/selftests/gpio/Makefile               | 2 +-
 3 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
