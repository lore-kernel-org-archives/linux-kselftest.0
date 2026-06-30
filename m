Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434CE5B1EB
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 21:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782855234; cv=none; b=jN76gBV3iWN+vtv9GLngBdKlcJgNbwDPydOrhAkkG90ZfLeWgPR/3ErcVZWIMGwRCEDra2L4mAlGh1CVqIqVac76cXDp4tN55iMmNpiPC+yKGqbn1PFADEirlztvYlRd1+XZ108dr3IoGuYmI51dzAV6Z6OH096joDMZkvLs63Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782855234; c=relaxed/simple;
	bh=7P5AGdyX9U2FgOtXbK8aoEINUpNsnYeYDub1cigFpDU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pDHZDsa0QXMUIRAPIxRlDEM4iftsp3cVa7qXOd1ua1bSMYPzPyvxbuZGeVF09Uom1cm/H9qVxGJHihpXr4b9MjmPGiYM5RZSUB4nZ6yi7Pf3vF3hwJgXb0RmdyvTZjMhDgnSepYn60tO1fUgudJeXYyLYIvnWFYwtKozeFM7/lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gtE+6SVw; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gtE+6SVw"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c88da04b71dso2598790a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 14:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782855231; x=1783460031; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z7X3kTpmZ4bguf8y7uJQ1FnujZXkLnCFBhY8iEZTYJQ=;
        b=gtE+6SVwUzeLEpi8b+ZV493kdeKgKE99DnJHqUuKh5Z7KV+jLv8i2mqYOt32pn9cV0
         uCIakkUMf8Y4EBFrEfA4ltbPTxqRH4XRUAjCUQgj8VIt68lxuiL/XNQhjp6cxOSiUMcK
         QCDemXOaxjlcQVcR17oqfXd9y34coCIP2g0ubPR8EeHCmLFAzp62ENMKs3RoXpGjmRjG
         mQ/u8+Mx3wlC5s71z4RduH20Zo4h//HKspymIn0nC1fPB2QZ8Il98QDxOAVL+FrGv2//
         3fcYxD5Vf1ISGwGcoeYlkIMAdv1KVKv9NIjFMnOsK+lI5IUVX1JATkWuTJQr+Ctb7NcY
         lyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782855231; x=1783460031;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7X3kTpmZ4bguf8y7uJQ1FnujZXkLnCFBhY8iEZTYJQ=;
        b=Td8P8DqmumliMjWt6y4zLzj00aYWr7ID6mO4rgEGbqNAPn6xpqX01xMT45tJi23Xcw
         vL15Hd4tv7uv+9L4LHpxoK1yYFOhE863HfSesmjseJRUFtZKLPrK8vRULNO1mLRm+sJ5
         74bpnRov5qavj4OYfcAmyp0MS6vkD7MJJyB1q92WmGmyu2zJ/Hd67Zw6zt4HXYjtl6FZ
         2F+bqMVc7aUSX4JJLnpxa4J7iWTQxrY4wpvdO6jQsiC3RX91zNij7MlnHckLHxAEaZb/
         LmZJztL3+ww6Xt1lJRqZI2a6k1211OL9aHjJelBR8h/cUMLOViwSuX2eeFgtmbxZmVj5
         8Efw==
X-Forwarded-Encrypted: i=1; AFNElJ993Hg+4kylvwHJGeFQ8F+vPr8DJCKPJxqcb+3+mHUlRlkvuETatu29oq7xYevyvjqJ/X2xz5AtaOSDrmbuTfw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8gmp5vYhkFBbS6VvztPqyWWOB7Bb9ghJvRmsI7a1CeHfPqB1l
	Bhxv2qF/QbIAw2njYSql+L0r7bFoXET8PaoHgNhLolSi+4zZCLFeVQjSUqIJ8ZMvyBlRYXQejYm
	LkKzKALRfDq9M1Q==
X-Received: from pgq38.prod.google.com ([2002:a63:1066:0:b0:c86:5f41:8c94])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:62c4:b0:3bf:49c8:f73 with SMTP id adf61e73a8af0-3bfc52b1d7emr4595479637.35.1782855231357;
 Tue, 30 Jun 2026 14:33:51 -0700 (PDT)
Date: Tue, 30 Jun 2026 21:33:41 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260630213341.1664345-1-dmatlack@google.com>
Subject: [PATCH] selftests: harness: Mark test fixture objects __maybe_unused
From: David Matlack <dmatlack@google.com>
To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Alex Williamson <alex@shazbot.org>, Andy Lutomirski <luto@amacapital.net>, 
	Bill Wendling <morbo@google.com>, David Matlack <dmatlack@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Shuah Khan <shuah@kernel.org>, Vipin Sharma <vipinsh@google.com>, 
	Will Drewry <wad@chromium.org>, Aaron Lewis <aaronlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Mark test fixture objects __maybe_unused since they will not be used
when there are fixture variants (the variants will be used instead).

This fixes the VFIO selftest build with clang and -Werror:

vfio_dma_mapping_mmio_test.c:106:1: error: variable '_vfio_dma_mapping_mmio_test_map_full_bar_object' set but not used [-Werror,-Wunused-but-set-global]
  106 | TEST_F(vfio_dma_mapping_mmio_test, map_full_bar)
      | ^
./../kselftest_harness.h:398:2: note: expanded from macro 'TEST_F'
  398 |         __TEST_F_IMPL(fixture_name, test_name, -1, TEST_TIMEOUT_DEFAULT)
      |         ^
./../kselftest_harness.h:470:33: note: expanded from macro '__TEST_F_IMPL'
  470 |         static struct __test_metadata *_##fixture_name##_##test_name##_object; \
      |

Fixes: ff556bd98348 ("vfio: selftests: Add -Wall and -Werror to the Makefile")
Reported-by: Aaron Lewis <aaronlewis@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kselftest_harness.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 261e4df94d9d..29a19bc87084 100644
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

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.55.0.rc0.799.gd6f94ed593-goog

