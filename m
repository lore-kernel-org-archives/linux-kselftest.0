Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826536;
	b=ZP6eUO/SXf88NPJTDNkM/kl3I8BKAy315xavfyjkrJJghkgGaRkr9BXKNVL443Ni/LEP
	 9FDoaRFpzATeGdCDJLzBBXh6p7NBXFkLjDtZv9RrtASgqXEi3tiY7aIilrlwi+Tzd/Dm7
	 /GtU5lNDeQa84sr2UX6tL6AlX36yF/KPkm2qz3VOX6u3bAE0uq7YkYDENQyq7WtcTWleA
	 WcBjn4OW+7aNMlruG5oAJh1mpFkp4arUqp4CHY8GcadNYWBwdoZ9Y4tL1Hzxeb8AMu7S9
	 yrkQv9KssruVT+3aNY1Q+r6NnM4LuhInZI9h0OjrYVUVa+fSNO+mhmpDqetiMBfmbnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=4OSWRtRd+V91Vqwy50g3O6DPEqRmvPxAQw2Z2wGJO2E=;
	b=PxhlsYc3qbDOZFHzLfH//lVxXWPXDn11X4ooSy3R1eiiVce8RishS7jDD1acmyzuFSEO
	 vKpwDaNPHziAsyBUsCfjIWd8Dfv74cb0NFrq5XaQxTOq4DUnNT1WG4RlhkbOt4Tw/NLn7
	 +XmJS06Zqwi+oN6elgAMwAPZAiKtpD7BtiEW7Rg59D/JvH7sDNoAX+DG+5YqxcMzqJPX8
	 vZ1zL7Qrdvfu9DwUErpYKR+7dYl18l5TyKZQPCiZHBEuzplxv69YGb+jDLtyyigXwzpMq
	 7l0/2peWDeSBblmjrqb4CuV7NXZTAyPQGBZtt8L12utCrz8aMk/t3FooONvaz8PsGgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRxGPTfT;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BC4607C094
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18BC4607C094
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRxGPTfT
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so9734255e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826534; x=1794431334; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4OSWRtRd+V91Vqwy50g3O6DPEqRmvPxAQw2Z2wGJO2E=;
        b=gRxGPTfTWalo994sN1tcM8Gk6GH7B3u/3u+F1Kga5xftUlTlJ+u+1yOwZSLEM7R7aJ
         FROykiffhUmwAaJBOn0r3S4I4IVM6erRuf77jUBCj/eO3FvlzgriebXvlaf/6V2eH3Mo
         fsMxDzITqnq6BNLn+6zyyLxMSXv7hPNPgabFJN6NqxKx1PMIqDF5W7vE0IYAhha9OD9C
         RwADQixSQl4Dp1d85S/d/e7/WsvZ4wtQS09FmQnCTMi3VFAuLTPeKr8rK/93/TJ5UHSy
         SiwtgOkxGsRhFm9044+37iy+D+5GlNp64v4HTtASP34RoGpoImJsKaN9+aBo3owFhhJY
         Gf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826534; x=1794431334;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4OSWRtRd+V91Vqwy50g3O6DPEqRmvPxAQw2Z2wGJO2E=;
        b=zjI5vBnbO2mCOVuOGHI/ERLPe0SyafArfCYe8X8D5YqKlWGyHcQtW3EUrfbg6G8CcC
         W7/UEXKXDD/dHT75SYHcgWhpjBov6bYeIqrb4M+YD11jcd5o5mbqPtMEikLPjkPXiKhz
         O5DEnm/qjUYEwg2c15GOb6E4eF4DpWEYIJVYDYOsLjn4+P0bKRSOUWUuBuCkEy7yRSVj
         +ljqAfRc0fB0lD9rUFuWG7fCXherGaz1UA1vrbtcnjzemh64/gLABsoXlSO6V92PB5Dn
         bevA1zgxEiHAYqzHgYbReeBRyKqueSOiTM2w7r5dgR8QaTXieICAQBI+/wRaxaVS3il6
         N8Zg==
X-Forwarded-Encrypted: i=1; AKwUvBz71GmvM6FMozp79RinMW++frnGBb+M0kPW/oT2ChvF2uwdkBXlSlFyRmv5VxCegHXdQz+Krz3MT1BdrVOX+H4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w4LajlTEh8KIpgQUFmmsQUGjUpvC2nJMT67s0xMEmkPwy5Doa
	tOqcbQs7luR9BFIVhv1W45CG4CeNhxyrRL+oZJow+Cxs4olBMmLoefWH
X-Gm-Gg: AYBFou0WpQqjcnQQ8rrPX+V0Fam+TThP5VTPjzd6zjisbePNHkDOF6Lya6yl+6lth8T
	50+9AhrHO4yyxk/7HSeFxTX4b+7WCnsM9Ldf3zkQ3/gKE8+PNJR1+PwLObQWuLVnjO8vRAWizTy
	zcDSIws0aSA6A8eEFCJROtWpEMPJrbT+7XaVmgxmzO3hcpwUIGXYLb7ePp73MAGsPlJcUH4soun
	LIWwlBHTXR8guXodxBaES0KFoXVdccln7ZOs65yiSEPg89Sg9XlTs2KMNdJA9tFsv32xgMzzm+6
	Jlw1iB+R8pGRDzLegolEc/owIsjwOFV1y7hxFIr7enDy4EZ3t2hVQ7T1iRuTVjApcRwrAXuZWsz
	cp7SvkFSpnEYrwHWB5XTtnNGWTATDoHRFt2dTRdtSk0Ei1mY5ksNi/b5fyYMZKdlApk5XE7hxSW
	IH91wGlpcOQ/4cq1GSPrQrNOrtfP+rrh8xAh/j6sj2eG/oDu35SqpZEfkYD/b5kBulJjZWLAaGr
	xOfwwr/A8ITsA8kGZT4GsYtFZabwZ33sC6yH7u83yaCf5eJkZkY3UP4053VOZbzacdE58i1aYLs
	TL4uT7slVVRf90isuFDi8b+Gnl2P/PWRNODmjVy3Be5AD7+hUZ6XXg==
X-Received: by 2002:a05:600c:8b04:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4ac17a3683bmr391930765e9.18.1793826533442;
        Wed, 04 Nov 2026 13:08:53 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844c8sm6227254f8f.26.2026.11.04.13.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:08:53 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Subject: [PATCH v2 00/27] landlock: Selftest fixes and cleanups
Date: Wed, 04 Nov 2026 22:08:46 +0100
Message-Id: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6tmRaGlBX3sOwKHUKVaGmU4mGc
 HdbXLh2+fLnvz8LIwwOiR2LhQWcHTk/JZC7gplBTz1yd0nMJMhaCFCc8G4jUiQe0GoTfeCqUaJ
 DUBKVZan4SIl7bdJz+2V6dlc0MZvyhQ1+5HEIqH9ygL1QsgZVVgcBDZe8n7w2twoATv2o3b00f
 sztwVGafW8/zyKv/GVo13X9ACDHseb4AAAA
X-Change-ID: 20261104-selftests-refactor-4741be042e4f
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

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

–Günther

---
Changes in v2:
- Rebased onto master (v7.4-rc1-132-g05441d697f7f).
- Dropped the "Assisted-by: LLM" trailers (not required any more).
- Applied the same ASSERT/EXPECT rules to the test code that was added
  in the meantime (cap_test.c and ns_test.c, plus new checks in
  base_test.c and trace_test.c):
  - "Assert tracefs_extract_field() results that are used": also the
    new handled_permissions check in trace.create_ruleset.
  - "Assert audit initialization in fixture setups": also the
    cap_audit, ns_audit and ns_proc_open fixtures.
  - "Assert audit_count_records() before using its result": also in
    cap_test.c and ns_test.c.
  - "Use ASSERT for syscall failures before errno checks": also in
    cap_test.c and ns_test.c.
  - "Use EXPECT for checks that later steps do not need": also the
    errno and WEXITSTATUS() checks in cap_test.c and ns_test.c, and the
    errno check in base_test.c's ruleset_with_unknown_permission.
- Dropped the note about depending on Wang Yan's snprintf() fix, which
  has landed as commit 8e4c736cffdd ("selftests/landlock: Fix snprintf
  truncation checks in test files").
- Link to v1: https://patch.msgid.link/20261008142604.39107-2-gnoack3000@gmail.com

To: Mickaël Salaün <mic@digikod.net>
To: Günther Noack <gnoack@google.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Günther Noack (27):
      selftests/landlock: Propagate grandchild failures in unix_scoping
      selftests/landlock: Propagate EXPECT failures from forked children
      selftests/landlock: Check the thread result in audit.thread
      selftests/landlock: Zero-initialize the buffer in inconsistent_attr
      selftests/landlock: Fix the openat() success check in fs_bench
      selftests/landlock: Fix the reported clock tick rate in fs_bench
      selftests/landlock: Fix the ruleset_fd check in empty_or_same_ruleset
      selftests/landlock: Handle a missing control message in recv_fd()
      selftests/landlock: Assert tracefs_extract_field() results that are used
      selftests/landlock: Assert audit initialization in fixture setups
      selftests/landlock: Assert helper results that are used afterwards
      selftests/landlock: Assert audit_count_records() before using its result
      selftests/landlock: Fix memory leak in audit_init_filter_exe()
      selftests/landlock: Make audit_message large enough for any exe filter
      selftests/landlock: Close leaked file descriptors
      selftests/landlock: Check errno for combined VERSION and ERRATA flags
      selftests/landlock: Fix SIGURG handler setup in scoped_signal_test
      selftests/landlock: Fix regex_escape() error handling in matches_log_fs_extra()
      selftests/landlock: Fix off-by-one in regex_escape()
      selftests/landlock: Fix the snprintf() error check in matches_log_fs_extra()
      selftests/landlock: Use _exit() in the named_pipe_ioctl child
      selftests/landlock: Fix messages and comments in helper programs
      selftests/landlock: Fix stale comments in common.h and audit.h
      selftests/landlock: Use ASSERT for syscall failures before errno checks
      selftests/landlock: Assert WIFEXITED() before checking the exit status
      selftests/landlock: Use EXPECT for closing FDs and stopping threads
      selftests/landlock: Use EXPECT for checks that later steps do not need

 tools/testing/selftests/landlock/audit.h           |   20 +-
 tools/testing/selftests/landlock/audit_test.c      |   56 +-
 tools/testing/selftests/landlock/base_test.c       |  192 +--
 tools/testing/selftests/landlock/cap_test.c        |   70 +-
 tools/testing/selftests/landlock/common.h          |   32 +-
 tools/testing/selftests/landlock/fs_bench.c        |    5 +-
 tools/testing/selftests/landlock/fs_test.c         | 1300 ++++++++++----------
 tools/testing/selftests/landlock/net_test.c        |   64 +-
 tools/testing/selftests/landlock/ns_test.c         |  124 +-
 tools/testing/selftests/landlock/ptrace_test.c     |   44 +-
 .../selftests/landlock/sandbox-and-launch.c        |    6 +-
 .../selftests/landlock/scoped_abstract_unix_test.c |   45 +-
 .../selftests/landlock/scoped_signal_test.c        |   23 +-
 tools/testing/selftests/landlock/scoped_test.c     |    2 +-
 tools/testing/selftests/landlock/trace_fs_test.c   |    8 +-
 tools/testing/selftests/landlock/trace_test.c      |   28 +-
 tools/testing/selftests/landlock/tsync_test.c      |   22 +-
 .../testing/selftests/landlock/wait-pipe-sandbox.c |   16 +-
 tools/testing/selftests/landlock/wait-pipe.c       |    2 +-
 19 files changed, 1051 insertions(+), 1008 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261104-selftests-refactor-4741be042e4f

Best regards,
--  
Günther Noack <gnoack3000@gmail.com>

