Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62039412C08
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 20:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467870; cv=none; b=Vl9IbusS5ce01LFc8Q8b3M6jwz5aRYxH4OfDH8MnptryRWXgjBe+evnJkf6Zh9yvUjwSJRQAbGTkmfkpUPVpM+o0gnrDWCUEKEBaMBZjHQDOuEaXneggrWHPmQ3++hUYDpaRmQWZvIfA7DkLSCCPatDh2sLrFZJQQ75R1UEMvpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467870; c=relaxed/simple;
	bh=2UBlYQEyGWOQDtIcz85wPWpuQThTw5iKFdTHWIgVFSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cJHkbXX6ZHTbQy+77Uo6k0MB0p1bAIrR6BxMmBOJzBMqnwDE/Bh/Pn20DBufQnYfiBwDmmC38VcV2I9NNHBi6uK2OLl79fZGLdC56ePNloqA86p01K4NiOeTemyjhgnvjU1XD/UzfFagPR+SgIblv65Z53vrA21VTxGVe/cFVH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ph9B1whv; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ph9B1whv"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f96c5b722so231265f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467856; x=1789072656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JG5wHGxobGMru3PHPCCaPFK+av72ZMxaO+XhGsfKu1Y=;
        b=ph9B1whvBT8TvHNzlYj5fngC4KNl8ic5pB7hUhI9EmVFkf8zM46QqzBr1wsR5wdeR1
         QBwF5UzF745ngelPYPWU2BeOpsla2Nqg3DwfRgb/ogYYOkt1hURPCIGii8CnJhXBuWvO
         mu8j6kV+9ewhnLYoGU6aJUdFPUgXaj0faclZ4V935AI6Im23FW9ZfC2XlpPiHsCgTij6
         JT8J47WYqp48mbWkpjZ8HaiyBvNrn/iigFSHtgtto4pOkXG5aJlLFJFm48DOQel5jjK3
         Q10y0aTdoCVdsYkBDsv9n416DMZxFzJbA/267PzAVL/p+WxCHSpqRsbBUnNg6ZXkfBWF
         YXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467856; x=1789072656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JG5wHGxobGMru3PHPCCaPFK+av72ZMxaO+XhGsfKu1Y=;
        b=FTJbDIKNab+j4+58QyRhlYvE3JN/kmQZ9kcaD3iy5Mf7xj96Wco61epW+CDOD77p07
         KqqSNmn9oQ+i7Ef64iLxkrDDBjEIOZwRonX2UGtko3FyXxT8j//Db4Jg+MZrSfLNxSTa
         0teZRKG5X1767DWseMGUsqKUnnDkiDpnjav2ZnvyRsixLF47G+fOEXSwa/dtEhgQcvD1
         fsFWHudYVf3YK/gmLi52OydqIMYwIX/9SIJTETpVZyeKrRxTQN5yOdcX6FvRoOXWsa0Z
         MDUh8XdGREBMn/c3b4+mFkDZqVbIe4Ys/NrjSudc1We8/+MwmcC9uWyfR7UlxUKGpc23
         HsZw==
X-Forwarded-Encrypted: i=1; AKwUvBwcziX/cikq4KWe2qd631ciglG20IJM5GfB908HZuxmfXuMTpyuFykwA1Be/usgcvXtrZN+4nLPctkWMyywwVg=@vger.kernel.org
X-Gm-Message-State: AFuF++mjKsq1Oq2lbaipA5DdWz8pv7A6A5KP+4jBEGLSdt2frY16WUxZ
	5P4VqenXTlFF+LCFJ1vwVNDgQF1ePTS9aG1J9w6yNbyVP4Zu4L1pApx4
X-Gm-Gg: AYBFou3zAbQkgOeb7wL2Ym31ApUe5Gy45kIcI7jZSJQ0Oe+flvqyBjN1r7mbNO4i+SE
	Sh43omoMp9utT4SF6G9FwM9dykgpSBhH+gqNbfjmLw9OUOH80eIQF74qldzqCCwjEiUcxzh1RyJ
	lyUb04vWhbQtCvX5D0lPcIjl+O0vFX30S/syC7Oo6dFyWQYB0Rc4Ji8kNXXKQWCJrUFK10Tv75M
	yriLegC4qWoXv1O0QjXZYHAvUMVrOnEimGs23UCShCoYO7m2iaVNro+F38FAYfPqDIt3H2RazDZ
	/g7rnxafjmOIJgKaX3zqBeTmgFIFl1I/sQnT5EjiUjDbXdXn9KlrgMeYlN/OCP0DjOAPzkwzu+h
	2+45d/LQiXa8nfoZnFM1RCQKlthd6MPr5yCvNIuWJKgl4rHun7NmZUJb0lw34ph/KkqUFCV0Df1
	ceBglXHTwD3lhZFgnqsKt4TkHGa1fPwEe145slTjXtpFs4e6m8yfEVR5O0pK8yzdz7cE1n7KYtS
	40wIxqyYiwQ+l1EJJR9Tbbfgdq2QcuIAQicWmoWu+GHesAIqfVpDaqrwNqrCkuebSzLfMFBZkWK
	7uu8xyqosIgRxjUOB4slDX/zGkKOCIqjOFEqlI1RHT2pfJxtB63zYlU1HpzxnwQc6awsWLqhFYE
	9yme+
X-Received: by 2002:a05:6000:4b0f:b0:484:3647:d977 with SMTP id ffacd0b85a97d-485872df445mr2610818f8f.27.1788467855677;
        Thu, 03 Sep 2026 13:37:35 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1005070f8f.8.2026.09.03.13.37.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 13:37:35 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 5/5] slab: test ERR_PTR handling in kfree and hardened usercopy
Date: Thu,  3 Sep 2026 22:37:20 +0200
Message-Id: <20260903203720.63689-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260903203720.63689-1-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add KUnit coverage that kfree() warns and returns for ERR_PTR values
while remaining silent for NULL and ZERO_SIZE_PTR.

Add an LKDTM test that verifies hardened usercopy rejects an ERR_PTR
before attempting the copy.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/misc/lkdtm/usercopy.c           | 27 +++++++++++++++++++++++++
 lib/tests/slub_kunit.c                  | 18 +++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |  1 +
 3 files changed, 46 insertions(+)

diff --git a/drivers/misc/lkdtm/usercopy.c b/drivers/misc/lkdtm/usercopy.c
index 67db57249a34..10751e48211f 100644
--- a/drivers/misc/lkdtm/usercopy.c
+++ b/drivers/misc/lkdtm/usercopy.c
@@ -4,6 +4,7 @@
  * hardening.
  */
 #include "lkdtm.h"
+#include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/highmem.h>
 #include <linux/vmalloc.h>
@@ -273,6 +274,31 @@ static void do_usercopy_slab_whitelist(bool to_user)
 }
 
 /* Callable tests. */
+static void lkdtm_USERCOPY_ERR_PTR(void)
+{
+	unsigned long user_addr;
+	size_t size = unconst + 1;
+
+	user_addr = vm_mmap(NULL, 0, PAGE_SIZE,
+			    PROT_READ | PROT_WRITE,
+			    MAP_ANONYMOUS | MAP_PRIVATE, 0);
+	if (user_addr >= TASK_SIZE) {
+		pr_warn("Failed to allocate user memory\n");
+		return;
+	}
+
+	pr_info("attempting bad one-byte copy_to_user() from ERR_PTR\n");
+	if (copy_to_user((void __user *)user_addr, ERR_PTR(-EINVAL), size)) {
+		pr_warn("copy_to_user failed, but lacked Oops\n");
+		goto free_user;
+	}
+	pr_err("FAIL: ERR_PTR usercopy not detected!\n");
+	pr_expected_config_param(CONFIG_HARDENED_USERCOPY, "hardened_usercopy");
+
+free_user:
+	vm_munmap(user_addr, PAGE_SIZE);
+}
+
 static void lkdtm_USERCOPY_SLAB_SIZE_TO(void)
 {
 	do_usercopy_slab_size(true);
@@ -439,6 +465,7 @@ void __exit lkdtm_usercopy_exit(void)
 }
 
 static struct crashtype crashtypes[] = {
+	CRASHTYPE(USERCOPY_ERR_PTR),
 	CRASHTYPE(USERCOPY_SLAB_SIZE_TO),
 	CRASHTYPE(USERCOPY_SLAB_SIZE_FROM),
 	CRASHTYPE(USERCOPY_SLAB_WHITELIST_TO),
diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index 923d8646bca1..079563387007 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -507,6 +507,23 @@ static void test_zero_size_alloc(struct kunit *test)
 	kvfree(ZERO_SIZE_PTR);
 }
 
+static void test_kfree_err_ptr(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_BUG))
+		kunit_skip(test, "requires CONFIG_BUG");
+
+	kunit_warning_suppress(test) {
+		kfree(NULL);
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 0);
+
+		kfree(ZERO_SIZE_PTR);
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 0);
+
+		kfree(ERR_PTR(-EINVAL));
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+	}
+}
+
 static int test_init(struct kunit *test)
 {
 	slab_errors = 0;
@@ -532,6 +549,7 @@ static struct kunit_case test_cases[] = {
 	KUNIT_CASE(test_leak_destroy),
 	KUNIT_CASE(test_krealloc_redzone_zeroing),
 	KUNIT_CASE(test_zero_size_alloc),
+	KUNIT_CASE(test_kfree_err_ptr),
 #ifdef CONFIG_PERF_EVENTS
 	KUNIT_CASE_SLOW(test_kmalloc_nolock_and_friends_perf),
 #endif
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index bec57a02913a..d3e38c1c75cd 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -70,6 +70,7 @@ REFCOUNT_DEC_AND_TEST_SATURATED Saturation detected: still saturated
 REFCOUNT_SUB_AND_TEST_SATURATED Saturation detected: still saturated
 #REFCOUNT_TIMING timing only
 #ATOMIC_TIMING timing only
+USERCOPY_ERR_PTR Kernel memory exposure attempt detected from ERR_PTR
 USERCOPY_SLAB_SIZE_TO
 USERCOPY_SLAB_SIZE_FROM
 USERCOPY_SLAB_WHITELIST_TO
-- 
2.53.0

