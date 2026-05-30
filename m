Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ABD2147E5
	for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 05:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780120045; cv=none; b=cNznwWh8NUxTgc9TpRqkT+mv4vDq9EOjnZHJOaiU06CAwZ9IO+fOzBNRHyt1ZtG2IK2INP2uTBGzGvr3ae81EweV9Ul+roz5LJrYSakM6bx1Mm6SQonoUHN4qkkNjWkFmvNDLo0pQcIDRw7nxrtoam12kgRGzBSF3hgQZwtH2pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780120045; c=relaxed/simple;
	bh=4W6pi0H0XGL58M1UnbvLBnfLmvwSN1wkNTpeWl6Izzw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Rozcz/aXVIxRR5CiCKlbuIIiCjCWO/GMytaIbPFovlR5hkwPos15tqmo1swOlzHDo77OumWiFLD+FIHI2MpDGM3UuYhQ0zCOj5BPvL7UN2sxyT+bK8nQ933SVDp1R6MLKJ1/rpvu7MEp0D+UoyS4gm0dJQB3ZLLUHB3r8GRkB/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pGFqWxhS; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pGFqWxhS"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c8292e18166so7300149a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 22:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780120043; x=1780724843; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G7SuyQuXm/OwXcdCUAlyJmv3ANC4umVpiNZZpGiham4=;
        b=pGFqWxhSZqbNFk3NWVwYZST6Otq8K4SbMlj96JdMFeZ9unjSa2Ro5s6lC8TmaRgqjH
         nxwAubaU86DZUWiUbhUTEOZewZEDpjkEA38mVyVhKcRCBvpH4q04/Lf8XvctdRp+xjc8
         Biy3wGV8xnnLaD+2PgrqCYTIFXCSg8+q2DYAevSSGsTFCsnu/R2y7XbkXGF8pPFZga+I
         voGN3nTxXUZsSCmHGaFxDe7aap368SdjgHewrSzfP9hvjaOPPHZvdRx487VmWcw8dSg7
         J15zzKmroB6i7cGkmKhNBwDhtmvLB0nWNtTiIHD+R0toZO5MTn9KJUqHrnEfOj2VHX7p
         9aPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780120043; x=1780724843;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G7SuyQuXm/OwXcdCUAlyJmv3ANC4umVpiNZZpGiham4=;
        b=sXSBcJAXdp6W2vPC4fsMW1nzAkNbRiytMCz1oIntc4WngsOXkgDbm1/HtcCGSubPoP
         oFETucqDm1C1Akzg5RTaAjRhNiVE78iyTAnzYHCsXr03kQ3k+HycAuPwOh/8a11XlIXZ
         Qw2xDeKBK4epPHCRIS5yybmof6HiA7h6W5vUpRclVKvMVKgeN4Lp4ErvfDHFlM1/reja
         1V5XTSi1IC9flOxaHoaXtgP7LpcJIxy4tj+ZyKpFmyJ0KXQ9pj6aBgEQEaT+YH8WJxGd
         JbnEiZW7sPBc0OxqzAKDVeWGDsR5YGjlWU5qLXm+POMG3sEEu/pBq+V3ADNyPnBGY7nh
         zPDA==
X-Forwarded-Encrypted: i=1; AFNElJ9tA7Gbiu8EBocIcKVD/4LMsnNMC4L1zY0BicIaBWkTKitMsn25VXDambNT+jLEe05dJNeYkq8yzdpt65Wm1Yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbBzhTA/Y0UZjqPgsEwuk4t3REKM0P8YrzaW44mVWt9HOtbpcN
	CmubRvKZ0XGL66MTNJtCP+HicTgyxg5LJn8WQdJ13l2nWXv3xpEmOq98/BkBegq1I+3QzvBJk2z
	HCQ6DUA==
X-Received: from pfaj17.prod.google.com ([2002:aa7:9291:0:b0:837:e90f:8cd9])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:189:b0:39b:89e0:2e37
 with SMTP id adf61e73a8af0-3b427c23375mr2538080637.14.1780120043330; Fri, 29
 May 2026 22:47:23 -0700 (PDT)
Date: Sat, 30 May 2026 05:47:20 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260530054722.271157-1-kuniyu@google.com>
Subject: [PATCH kselftest] selftests: harness: Add __maybe_unused to _##fixture_name##_##test_name##_object.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

tools/testing/selftests/net/Makefile adds -Wall to CFLAGS.

With clang supporting -Wunused-but-set-global, building kselftest
gets too noisy:

  bind_timewait.c:76:1: warning: variable '_bind_timewait_1_object' set but not used [-Wunused-but-set-global]
     76 | TEST_F(bind_timewait, 1)
        | ^
  ../kselftest_harness.h:398:2: note: expanded from macro 'TEST_F'
    398 |         __TEST_F_IMPL(fixture_name, test_name, -1, TEST_TIMEOUT_DEFAULT)
        |         ^
  ../kselftest_harness.h:470:33: note: expanded from macro '__TEST_F_IMPL'
    470 |         static struct __test_metadata *_##fixture_name##_##test_name##_object; \
        |                                        ^
  <scratch space>:155:1: note: expanded from here
    155 | _bind_timewait_1_object
        | ^

The global variable _##fixture_name##_##test_name##_object is not
used if a test does not use XFAIL_ADD().

Let's add __maybe_unused to it.

Link: https://github.com/llvm/llvm-project/commit/3e011457055bd3868bd05cf80bc1a4482777809b
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 tools/testing/selftests/kselftest_harness.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index cfdce9cd252e..a2e104f7fb52 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -467,7 +467,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 				!__atomic_test_and_set(_metadata->no_teardown, __ATOMIC_RELAXED)) \
 			fixture_name##_teardown(_metadata, self, variant); \
 	} \
-	static struct __test_metadata *_##fixture_name##_##test_name##_object; \
+	static struct __test_metadata *_##fixture_name##_##test_name##_object __maybe_unused; \
 	static void __attribute__((constructor(KSELFTEST_PRIO_TEST))) \
 			_register_##fixture_name##_##test_name(void) \
 	{ \
-- 
2.54.0.823.g6e5bcc1fc9-goog

