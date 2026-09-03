Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DAC50EBE6
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 20:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467867; cv=none; b=iioR/LbHZSee35mJaccNYpZc0n5HYfI/cdkQbBWXOPKhwdOe3tnDk21VQrs+LkBfBdPWo1sJM2MauTB4wX1FbxDktcdwTZHAnY1jL1fNiN+z6awbcfArWSG2AP9zE5v5YPhYkd1YZzRqTQnr4gvDvQW26DjceVVh5YrNGXRYmIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467867; c=relaxed/simple;
	bh=eQHeON0BpQBd/tO8wP0/baPlZbNUwkPl8Dihm2uv+Ak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GBRS2ywuwXHinOrA6UXbQGN2L4Xx0ts5frCqiEleoVDSYL+MhPJVCJeSvSNJNDPnmQFqTTOiOqRThGTHqCSQ+Qhg4ZzQ+mKOvaJLv+8AqufqdutOCPt5I808Tgc3MEgsXm6jej8Pmjk2sTuRr6VYvsMYLfC1avoBMHB3we+quoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwEpWRJf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwEpWRJf"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482e2fdf5abso144141f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 13:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467854; x=1789072654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akOv2wAC7HX7aMxE6Q3m1WKBtSvSbn9vu4HmmhmzJNE=;
        b=mwEpWRJfPNFDWPxOlO/VlG+oSUnCC0DJcFaMhm9k7VwmmC4T9CEChBEFNfxl4XsAhn
         SIdLqat59QFWXM2b4BiKBFBLtrYZfUTAfHzk2CbM5cB8wMeqTOefupPU0mmmgWAOQdZB
         GHr6Vi3gQXfltHNFLJuPydI2g/fN6HlvBFljHdU1PB57ow+Za2pRod59QPcJLAvEdiwA
         lDuJS805xmAZgdX2ydvi9QU3pfo1/+OpwOMJBj3XUUQ2ULANALZuCEKJSLv3ixv4o3vZ
         Y7hOvlsFvrzWf1CLBQmA4+Y7j0EJGOYesP7OIYJdWpjF5tpKX3y7QdKpp0C8ERy20GUy
         KvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467854; x=1789072654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akOv2wAC7HX7aMxE6Q3m1WKBtSvSbn9vu4HmmhmzJNE=;
        b=TPJdgO21RVNjQnq/XZXTY0tIZ2jl6cVCaN0/Emjn+gUqiLW+Eu5NxRJx8tCQyNrjvX
         6HyE0lsrtGSSi04kRJLDxfVslQOdDJxYmsQHAExTD0IgvrrE1hyuJhexaRNH2p0O1eSp
         GYMGl0DDSlDMHnPP/20h8gaLPmMBisKGKVWiVEJcQm4kfPJnb/8sRNeQazVLmK61reCr
         I5JXncGJipUMJUAUBvtE31MMXGsyUyE281g5+6SvWADIcvKKi8WLNctlDfi5jKuJSzvl
         9tkUU4ssfKHAQyxcWfC6ArLj0qwl8NVQCPWSXyACguhbaNQgCLh99MyCvdNIGWBNwF14
         eKXg==
X-Forwarded-Encrypted: i=1; AKwUvBzKxgPPxfNVrVXo/Aiy1p6rYwq0rt+MRi2VO7Mp/7Izz6mYL7enuig0ScBXwidsVQjnNq1Pxu5rByNjf3wRqJg=@vger.kernel.org
X-Gm-Message-State: AFuF++lf6JxB59iLaEAddNm52Z27Bl88X2ydVb4JFduvQpVxx9aIJDG1
	/JPx3jM5SRDy1aOezN1UYWo1nMPVS2Ju5CI0r9TpNslvBBY06pTnt9Vk
X-Gm-Gg: AYBFou1vuCf3/vQ4sh/I8u22hYZhDu6gVwmsx/Fw7YyLUFK4BF6x+02Unhh+iGZx/cL
	PIH2T9xB+BDCOcubuXnf6nMdGDF+CFtatkAKMW0zbCu4lO0ILAj31Hn9KEcpBNoOVKneJMsHe58
	7073bYIX/I3jsluf6AbVbsUHIuItOXtsEgDxcW8P+v5iMMD/z+y8jOqkzNFrLU5ppOB8hvsU01r
	ZSJTFaaOb+40B49fn/F8ngPwDmKDYtjGARPgianJtD3OhIg8JOK7aI3tVn/yFUm16Qz94oddreD
	KgglpsTxg3XLSSM3VOoBb9acrPL8qY3ERMnYM8dej91st0vlYk51JJWqh00qWt12BPuLH9fIoTp
	sNVzG9Op8vwz9kg9bGoENpkQQtdQ1dmfeFvs69u7B7QmCXo4Gmg5ZKlF2vpPPkz8QiuSHiEIWeB
	bTHuo91Xdz2lt2OvlYNB9WcGT7eagSh45dEdmVkZuH0oGNY5LkQo/aqi1QH9VJEX99RPCb4YaH9
	rh7kKG1coK+cB6UJgQKnSnTR1JmVo1rXHgNmAS6t9C1aZAKQKqs9epf0FDApluc6vHE71WS+Nnq
	/MkVx6RBELPevTMitJV36rZcBXf6g+I44rfdLS1ePhgdsvbmcp3e6O4k8M2HcQSi+F0PfUSTjJv
	QAaWc
X-Received: by 2002:a05:6000:220a:b0:485:81a8:6f09 with SMTP id ffacd0b85a97d-485870982a4mr3472028f8f.9.1788467854295;
        Thu, 03 Sep 2026 13:37:34 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1005070f8f.8.2026.09.03.13.37.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 13:37:33 -0700 (PDT)
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
Subject: [PATCH v3 4/5] slab: test zero-size allocations in slub_kunit
Date: Thu,  3 Sep 2026 22:37:19 +0200
Message-Id: <20260903203720.63689-5-kmehltretter@gmail.com>
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

Add KUnit coverage for the zero-size allocation contract, including
ZERO_SIZE_PTR alignment and exact ZERO_OR_NULL_PTR() matching.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 lib/tests/slub_kunit.c | 43 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index e3b63f0338d5..923d8646bca1 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -465,6 +465,48 @@ static void test_kmalloc_nolock_and_friends_kprobe(struct kunit *test)
 }
 #endif
 
+static void test_zero_size_alloc(struct kunit *test)
+{
+	unsigned long zsp = (unsigned long)ZERO_SIZE_PTR;
+	void *p, *r;
+
+	KUNIT_EXPECT_EQ(test, zsp % ARCH_KMALLOC_MINALIGN, 0UL);
+
+	p = kmalloc(0, GFP_KERNEL);
+	KUNIT_EXPECT_PTR_EQ(test, p, ZERO_SIZE_PTR);
+	KUNIT_EXPECT_EQ(test, ksize(p), 0);
+	kfree(p);
+
+	KUNIT_EXPECT_PTR_EQ(test, kzalloc(0, GFP_KERNEL), ZERO_SIZE_PTR);
+	KUNIT_EXPECT_PTR_EQ(test, kmalloc_array(0, 8, GFP_KERNEL), ZERO_SIZE_PTR);
+	KUNIT_EXPECT_PTR_EQ(test, kcalloc(4, 0, GFP_KERNEL), ZERO_SIZE_PTR);
+
+	p = kvmalloc(0, GFP_KERNEL);
+	KUNIT_EXPECT_PTR_EQ(test, p, ZERO_SIZE_PTR);
+	kvfree(p);
+
+	p = krealloc(NULL, 0, GFP_KERNEL);
+	KUNIT_EXPECT_PTR_EQ(test, p, ZERO_SIZE_PTR);
+	r = krealloc(p, 64, GFP_KERNEL);
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR(r));
+	p = krealloc(r, 0, GFP_KERNEL);
+	KUNIT_EXPECT_PTR_EQ(test, p, ZERO_SIZE_PTR);
+	kfree(p);
+
+	/* Only NULL and the zero-size sentinel match. */
+	KUNIT_EXPECT_TRUE(test, ZERO_OR_NULL_PTR(NULL));
+	KUNIT_EXPECT_TRUE(test, ZERO_OR_NULL_PTR(ZERO_SIZE_PTR));
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR((void *)1));
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR((void *)(zsp - 1)));
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR((void *)(zsp + 1)));
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR((void *)(zsp * 2)));
+
+	/* freeing the sentinel must stay a no-op */
+	kfree(ZERO_SIZE_PTR);
+	kfree_sensitive(ZERO_SIZE_PTR);
+	kvfree(ZERO_SIZE_PTR);
+}
+
 static int test_init(struct kunit *test)
 {
 	slab_errors = 0;
@@ -489,6 +531,7 @@ static struct kunit_case test_cases[] = {
 	KUNIT_CASE(test_kfree_rcu_wq_destroy),
 	KUNIT_CASE(test_leak_destroy),
 	KUNIT_CASE(test_krealloc_redzone_zeroing),
+	KUNIT_CASE(test_zero_size_alloc),
 #ifdef CONFIG_PERF_EVENTS
 	KUNIT_CASE_SLOW(test_kmalloc_nolock_and_friends_perf),
 #endif
-- 
2.53.0

