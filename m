Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD12A3890E3
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469607; cv=none; b=exOUcaFGA96skN8rMhngKd5eKeOIHG3FLJHRX7jfsUg0xixRy91Mzq7xRvgTEEtaoiEKPs4KeC6IYcpUxSncufiid1gGQjnCLS5X2STPuKQWPHId3Q0IlQwPp5YTaznuofc6XL0bbOtc1thpR6GH7agWqOfeirbQgNwEKlTDQLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469607; c=relaxed/simple;
	bh=Myio4zy1rcj3M7L4miPMIF/m5+9bCsWUc2GpKi0dF5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j97YflpmcvPq+d8Xi27PfvwMjIHhMbBl5SCsJGkY4PtpAotRYNdS9niWrkZzzK9eO0PyaomT2R7KT08ORUattBdRlgOmmjjmvYLhCpK2TQA8+WYguWhcLb7NUUdC+r5SpJkh9c38U3ITU8rhbn9DJP0PCpx7uYwcsGpnwCYJsFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTUdxb8X; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTUdxb8X"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso20390685e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469604; x=1792074404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NzueoD+ES6klpAo68ynClo/FIBtsX+vJEmu8cfaDXg0=;
        b=hTUdxb8XYtQ8ZFe9YL6Rr9/zgRIqMpFSeorffvJA+Y4vFa+V2BSCsmLeYAm3w1NVEd
         ZgOGPy2JEGMN2ahJQoAoTwVn3l0MU6lqqmR0V52Attqv2jU2KWVu+0KDIrsZAX9h4CH4
         5ZsEOajfB3sJc2uKrtz/j7v3hMZKF8k+zhVYEz/h0FiQyUw7Ec/YwIzMiYXZHI07jEFz
         2HBLJPvLPO9PLmU0smFOxy6FdPe/iB+VgaGSyF9wKgpzyxoSst1c4XY1RVJSST0NAsYb
         Ib3ZEz83WjLWzcce+9lo1Kdq3Xc7y2xu194IPrczMGl6XNNZcOzc+4TOZe/lyjBOz8UR
         fQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469604; x=1792074404;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NzueoD+ES6klpAo68ynClo/FIBtsX+vJEmu8cfaDXg0=;
        b=pAw/7JOnNnmJW5nyj5lUIP7QSw6ShI7pcqc/rIKwcvQ65ADg70LgvceN0AAIsoGZHJ
         WZ6CaL23ISp8CQxaSkx2CQCTYo9hnfgjdhmJLukVbsR7rBGdgOBY+RoiluUjnnSyc6sc
         bLnj1eB1SsblSxH3yRyyQHlQfPMWgnrimkaUBP6iTxdTP8zLJr5WWreclgdB9HcijQGY
         o+gCHOjjyB0a5902CZafsc0WXWqMryvrQNfydPUejTswILHKf3v/ffGXE/eLRYU12NBO
         Wzh6Ed/71wYsd8+uK+smLdHAKBw/4+Hi2I6ZoiCQuVLnA4rZEn50TYgFp0Y6DFNCtBe4
         9tzA==
X-Forwarded-Encrypted: i=1; AKwUvBwq88z1yyj+ezhhaMnjn2nT6O62CVbjKDOCJJvWpf6FniVkI+ukig8gOY2usw3RZb9DNUwp5zC/p7KeXsNDPWM=@vger.kernel.org
X-Gm-Message-State: AFuF++lxg3aRAez5+MtudJD9f+ENzlvKQdhSuEuADYOgcLocadhWPCgw
	Oas0U3isZSg15WrqR6nB/0SeJEh/Ek+/CZtoVNsyrZdOs+7yFqovWt6M9s28rVGX
X-Gm-Gg: AYBFou1aAavObxwSHs2zZmXSLrArhfepn/EnJBCwl3QZmo0HU5LdL1QAaj8f3Yigi5H
	Jqa8CYBKQTzs+gVpkuSRdKZndaoB2c29+jhEfTFj6X5pGqAq13h4uTvlW6NOSii5aKs3+adE0RV
	6Zq45r0CUJwjze1PdaGPu5pHGmUSHt3zNAQxUhyhTB2pftvDRhjFqRCpljfK4GSXzjc9Ue8f3/A
	cACcdwF6y7DmXjicKZctM4VIiqE0V9nJQ+BhhN17g85IwNh+qDBCyj25BmCUq4Sof+g1t+zsujB
	T/AXXyW0J+XZqRBYvWaDCKWb6Mz/qRjSrUp7GzhgZ+SeJFez8IiAUbmhl6Cn7EfzThLSCZhAEZI
	FUxSPOgJhsTqIiXn3OP36sf+f85m7R+7N/5V+IJwSk9cEzAKQi6PAz9RGfuaa+0hQhRiQ5+SIA6
	6xa4KOGJnQfEi3yRaVQd5V23swYvk2q5QxBkf573AnKtLvfcLI57r5anrR76/CJSNLECAUgqUd4
	Gne8/eaCjpc38mWVAXYY2sv
X-Received: by 2002:a05:600c:818c:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a180419643mr92571675e9.10.1791469603629;
        Thu, 08 Oct 2026 07:26:43 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842ab891sm69494435e9.5.2026.10.08.07.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:26:42 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	linux-security-module@vger.kernel.org
Subject: [PATCH 00/27] landlock: Selftest fixes and cleanups
Date: Thu,  8 Oct 2026 16:25:29 +0200
Message-ID: <20261008142604.39107-2-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A collection of Landlock Selftest fixes
=======================================

This patch set is bundled together to be slightly less spammy,
but the patches are mostly independent.  The commits are ordered
such that the simpler and more orthogonal patches come earlier.

The patch set is LLM-assisted (and that turned out to be very useful
for spotting errors).  Needless to say, I have verified all commits by
hand, and reworked them where necessary.

The last few patches are a bit more cross-cutting and probably more
prone to merge conflicts, as they correct cases where we have been
using EXPECT and ASSERT in the wrong way (details in the commit
messages).  I believe that the rationale for each of these is
reasonable, but I am happy to discuss.

Motivation
==========

LLMs (and humans ;-)) have an unfortunate tendency to pick up and
replicate bad coding style patterns, so I hope that a broader cleanup
of the test style will avoid this spreading further.


When applying this patch set, please base it on a branch that has Wang
Yan's snprintf() patch in it [1], which I also support as a selftest
cleanup.

–Günther

[1] https://lore.kernel.org/all/20260626070016.61049-1-wangyan01@kylinos.cn/

Günther Noack (27):
  selftests/landlock: Propagate grandchild failures in unix_scoping
  selftests/landlock: Propagate EXPECT failures from forked children
  selftests/landlock: Check the thread result in audit.thread
  selftests/landlock: Zero-initialize the buffer in inconsistent_attr
  selftests/landlock: Fix the openat() success check in fs_bench
  selftests/landlock: Fix the reported clock tick rate in fs_bench
  selftests/landlock: Fix the ruleset_fd check in empty_or_same_ruleset
  selftests/landlock: Handle a missing control message in recv_fd()
  selftests/landlock: Assert tracefs_extract_field() results that are
    used
  selftests/landlock: Assert audit initialization in fixture setups
  selftests/landlock: Assert helper results that are used afterwards
  selftests/landlock: Assert audit_count_records() before using its
    result
  selftests/landlock: Fix memory leak in audit_init_filter_exe()
  selftests/landlock: Make audit_message large enough for any exe filter
  selftests/landlock: Close leaked file descriptors
  selftests/landlock: Check errno for combined VERSION and ERRATA flags
  selftests/landlock: Fix SIGURG handler setup in scoped_signal_test
  selftests/landlock: Fix regex_escape() error handling in
    matches_log_fs_extra()
  selftests/landlock: Fix off-by-one in regex_escape()
  selftests/landlock: Fix the snprintf() error check in
    matches_log_fs_extra()
  selftests/landlock: Use _exit() in the named_pipe_ioctl child
  selftests/landlock: Fix messages and comments in helper programs
  selftests/landlock: Fix stale comments in common.h and audit.h
  selftests/landlock: Use ASSERT for syscall failures before errno
    checks
  selftests/landlock: Assert WIFEXITED() before checking the exit status
  selftests/landlock: Use EXPECT for closing FDs and stopping threads
  selftests/landlock: Use EXPECT for checks that later steps do not need

 tools/testing/selftests/landlock/audit.h      |   20 +-
 tools/testing/selftests/landlock/audit_test.c |   56 +-
 tools/testing/selftests/landlock/base_test.c  |  190 +--
 tools/testing/selftests/landlock/common.h     |   32 +-
 tools/testing/selftests/landlock/fs_bench.c   |    5 +-
 tools/testing/selftests/landlock/fs_test.c    | 1300 +++++++++--------
 tools/testing/selftests/landlock/net_test.c   |   64 +-
 .../testing/selftests/landlock/ptrace_test.c  |   44 +-
 .../selftests/landlock/sandbox-and-launch.c   |    6 +-
 .../landlock/scoped_abstract_unix_test.c      |   45 +-
 .../selftests/landlock/scoped_signal_test.c   |   23 +-
 .../testing/selftests/landlock/scoped_test.c  |    2 +-
 .../selftests/landlock/trace_fs_test.c        |    8 +-
 tools/testing/selftests/landlock/trace_test.c |   26 +-
 tools/testing/selftests/landlock/tsync_test.c |   22 +-
 .../selftests/landlock/wait-pipe-sandbox.c    |   16 +-
 tools/testing/selftests/landlock/wait-pipe.c  |    2 +-
 17 files changed, 952 insertions(+), 909 deletions(-)

-- 
2.56.0

