From: keescook@chromium.org (Kees Cook)
Date: Wed, 24 Apr 2019 09:37:54 -0700
Subject: [PATCH 0/2] seccomp: Make NEW_LISTENER and TSYNC flags exclusive
Message-ID: <20190424163756.40001-1-keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424163754.DEAgPlZCDcxTpZBTWWJLMQjgYCH8ftp_AkSBjzTnnCs@z>

This is just sending out the tweaked fix from Tycho and the selftest
changes needed to support it. I intend to send this to Linus directly
after it's been in -next for a few days for v5.1 fixes.

Thanks!

-Kees

Kees Cook (1):
  selftests/seccomp: Prepare for exclusive seccomp flags

Tycho Andersen (1):
  seccomp: Make NEW_LISTENER and TSYNC flags exclusive

 kernel/seccomp.c                              | 17 ++++++++--
 tools/testing/selftests/seccomp/seccomp_bpf.c | 34 ++++++++++++++-----
 2 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.17.1
