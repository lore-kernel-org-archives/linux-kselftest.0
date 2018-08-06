From: gor@linux.ibm.com (Vasily Gorbik)
Date: Mon, 6 Aug 2018 13:47:00 +0200
Subject: [PATCH 0/1] rseq/selftests: add __rseq_abi misalignment check
Message-ID:
 <cover.thread-5c3a1c.your-ad-here.call-01533555685-ext-8699@work.hours>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180806114700.scCNcZrQi9XxMNjkfyFmaJxKJp0-H8_DlNHiTJB9E5I@z>

While implementing rseq selftest for s390 a glibc problem with tls
variables alignment has been discovered. It turned out to be a general
problem affecting several architectures. The bug opened for this problem:

https://sourceware.org/bugzilla/show_bug.cgi?id=23403

There is no fix yet. On s390 __rseq_abi ends up aligned to 0x10 instead
of 0x20 which makes rseq selftest fail every time.

The change proposed adds __rseq_abi misalignment check, produces user
friendly message and skips the test.

Vasily Gorbik (1):
  rseq/selftests: add __rseq_abi misalignment check

 tools/testing/selftests/rseq/rseq.c           | 19 +++++++++++++++++++
 .../testing/selftests/rseq/run_param_test.sh  |  4 ++--
 2 files changed, 21 insertions(+), 2 deletions(-)

-- 
2.18.0.13.gd42ae10

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
