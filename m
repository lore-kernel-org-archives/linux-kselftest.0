Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6552730674B
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 07:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284547; cv=none; b=tM2APsuWw6Pz1PDAkYVZ8C6OP9Gl/u1MxVrPA8S6QtlBz7rrj613isbkPsZyKnTjfuaIILRnSo91iT6klaUDGeQ2Corhdvt9kDagdxlDs9zts6x/lpBXdgLzdZ4A+LbsvjPqG84ELzmfOV0ApQgUb/OLmeqntgy5TxCOiFwlnZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284547; c=relaxed/simple;
	bh=zFabr8Fzw4Bl5uw0Qs8RmWGhEjYWS5vtb8gjejcS818=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DaNlpn8Ys93DU40AYC2dSKtyEB8kopFtdeHKpfqEy0P6u47Xa5sqpw/aDomdnzwvABGVEr3X8P91cpnniuj9CyTND8J30UUhlXycsTTpI3W3pF6M4di2aF1ymqWZtKIts836rBZs/3nawtPKUgzHo2W8o8p4q+XfGoC6Y8oFUiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZnNZYxy1; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZnNZYxy1"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c8952346bb9so576786a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 00:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782284545; x=1782889345; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X0xSm0DnCMbD3nKdTY9I70C6lo4EhCK54JQTp8qUETk=;
        b=ZnNZYxy1T2DTSLB4nO+J7wfUy3BQOlQ5qhemPHvDc3iWe1tsEoUu+GAEitbhc3ozaE
         PwnvigxGuxQ74rA0sHz8/C6rQHnEDFSnLvIlzK6lrD10Gw3E3F3n8H8MkWhBYrPiK/W0
         Y6Hxi/IlZbPcNSx90fb2VMDI9wJ72+y6owThJn4y8aQ1jNc+2x6b8x8OLzGVM9604Zd7
         PJEOeLLwWqlftTX8W5uM9XEcxl2C5A9tJAIsfcNuUXuyeMLWdGAc3+Jjjf+GP/7vyn1Q
         o2IQeqarToEulNbVxAUXXtDGPi6km1hdQKoKFUgoGir8RiWuahuGVQWNstE5BUHZJnbj
         MjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284545; x=1782889345;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X0xSm0DnCMbD3nKdTY9I70C6lo4EhCK54JQTp8qUETk=;
        b=QA4IKkoKWTyeSU8MrxHFTazx516j3UKmVjdBv1AE4uHTZkC7+zyy6S1S8xCPobvucm
         2sn6MnaUR7WqIbHDZ1KT+RWiUxZyv5C5mwIKxuCIVHbIH3/4efIFYIOicSwKUoZumePy
         XBBK4DHLGchIHGr4JtJse7jE6uehU58rVosapR3dA7EZ5K5LuaUEWX32kr2bz8QZ4LRa
         b/e7hbmVd8rskcpAWqws0Gvu8xC/Lz49NB3oxYbrNPgYGHl8LqQLxrxBkxHYpX0BkxNk
         LiO8F9LyvlqchAR+GJg/zl2awFXu8+iCkxLNxV9LH8D5BaHIEuHSRI5p02N8/v1pH/wY
         Xt8w==
X-Forwarded-Encrypted: i=1; AHgh+RrzFVVrC6Yp3vulWzjteoxfc2NoIhr0R5Zd/jngwg37p+97nUSnDHdqKTzAuiJD2qOCg7J6XhAEosIpwwemctM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxME7CBbfwFPQOsKESM6eIfo/29PP0WcyCY1VbV9WQxqoCifVGw
	3qFTvBqzwPRo1cQDF9RGf+cA5K8ROSNyBznjP1WJJsayzvrun13fFPCOOXL8VBrFy7g4kH24Nlp
	CHw==
X-Received: from pjyl11.prod.google.com ([2002:a17:90a:ec0b:b0:37c:6982:b9df])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5241:b0:36d:8f51:fe29
 with SMTP id 98e67ed59e1d1-37de4288fd4mr2263478a91.17.1782284545404; Wed, 24
 Jun 2026 00:02:25 -0700 (PDT)
Date: Wed, 24 Jun 2026 07:02:23 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260624070223.1533167-1-wakel@google.com>
Subject: [PATCH] selftests/futex: Dynamically skip unsupported tests
From: Wake Liu <wakel@google.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

Some new futex tests rely on kernel features that may not be supported
on all configurations (e.g., FUTEX2_NUMA or PR_FUTEX_HASH).
Currently, these tests fail with EINVAL when the features are missing.

This patch adds dynamic skip logic to:
1. futex_priv_hash: Skip if PR_FUTEX_HASH returns ENOSYS or EINVAL.
2. futex_numa_mpol: Skip if futex2 or FUTEX2_NUMA returns ENOSYS or EINVAL.

This allows the tests to pass (as SKIPPED) on kernels without support,
while preserving coverage on configurations that do support them.

Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/futex/functional/futex_numa_mpol.c | 2 ++
 tools/testing/selftests/futex/functional/futex_priv_hash.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/futex/functional/futex_numa_mpol.c b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
index 78c0f7a59e17..d215acf88120 100644
--- a/tools/testing/selftests/futex/functional/futex_numa_mpol.c
+++ b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
@@ -103,6 +103,8 @@ static void __test_futex(void *futex_ptr, int err_value, unsigned int futex_flag
 			break;
 		}
 		if (ret < 0) {
+			if (errno == ENOSYS || (errno == EINVAL && (futex_flags & FUTEX2_NUMA)))
+				ksft_exit_skip("futex2 or FUTEX2_NUMA not supported by kernel\n");
 			ksft_exit_fail_msg("Failed futex2_wake(%d, 0x%x): %m\n",
 					   to_wake, futex_flags);
 		}
diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/tools/testing/selftests/futex/functional/futex_priv_hash.c
index e8079d7c65e8..27c3ea5ff3ed 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -145,6 +145,8 @@ TEST(priv_hash)
 	}
 	/* First thread, expect to be 0, not yet initialized */
 	ret = futex_hash_slots_get();
+	if (ret < 0 && errno == EINVAL)
+		ksft_exit_skip("PR_FUTEX_HASH not supported by kernel\n");
 	if (ret != 0)
 		ksft_exit_fail_msg("futex_hash_slots_get() failed: %d, %m\n", ret);
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog

