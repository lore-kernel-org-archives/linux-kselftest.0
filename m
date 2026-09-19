Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466372D77F5
	for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 00:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789778809; cv=none; b=McTA2HQVRKzF7yiXG3q1hVxzCeGSovQcnw7JbViOFk45c4+v7nKTtodCo5T6OtnnOI2EfQy5IP2MMH9jXQpla1kxuZSlFXJ95x32VvUY28ElZZF3uB/B/KVg5ApHhRU9Hw4ZZPvJozq2CftiHMDSFJadc/ZiPDcAhugpy/Sf8Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789778809; c=relaxed/simple;
	bh=HeQwU2YYW2ammaacyTh52hjG4IGzTEGbQ0IVGSCt54A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1sWQJ2v/wwwj+fvqSBE1BQ/CxH7hk9wmDr27awfvQGciQnmTLRm6O0U6d7CNtbTcUjHa62InvsWu3iV1M/T+T3kuMuQaoelsxqNr3umT0rn3XP/sDhIuI2l6FeWecVsa6sxbbzC/fVs+vHiDuGx18gysGpy7iS0HOX1shbsBmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSzNLoS2; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSzNLoS2"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba91so965353a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 17:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789778803; x=1790383603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uyjZLL0sA6T5K+I6SLCzFZO+c82gRPna/G98UbpeCXU=;
        b=LSzNLoS2eCNxSfyyJZ56Eq+Zfi/AYKURigBiNiLp+GWv7PFSBkqXWLgi1dNwBgpUQi
         8mRjqef1zXCDmxUnWfY+c45LyFpZU/JmR2TCvQtIhiJSY+0cq9jzmatY/bhKkyvuifL3
         MExSzcvLoPAX1+uWxDtjWvD1SbB4AHEWZcUHAJQK9eM+1R8WYcHLhVbf1Z6LOucZn7LW
         ZU9oR9gqCSYVstCLGyBiom1cGmC4iGdxaN2pyh3G7j2bPfeg3d/oyBOi69TnKJ2UH/QH
         tLheUA7uk/vF4eeJr+JjR88sy5Oessa6jc/IfbSWS1laBb3yK3+HKIfFys44eLD2gDhW
         RvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789778803; x=1790383603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uyjZLL0sA6T5K+I6SLCzFZO+c82gRPna/G98UbpeCXU=;
        b=GxDxQuBW/7wilndGbZeuCdO6WnoXZm8gVzCoeu1lAmKqHTYrasrkf4nDUkv9M2USll
         NNM1WK5KBSR4Gv3wu1CoXZQG9fgPZ22jPR2QyrYgwSY3NTP/U2+aJDfM2svyFChwGsLn
         rKlC2prvY5ZArjF0bzbrHZmd5qX5TH5uhs+tUt2g+hOr4TJJbY7JBYHTs4W6esv/Zl93
         DX/7VHeDDobhPanlyOhAGN75a3qY+gkyvRHp2QPHx+/Rnn5yGMuPayYYWrCHuvMKOibD
         EagLs+fDNoZdis6uOQJLK8NaIQ1kTpc085h7mTzVSjRm9UGhSQXl72fTsPZS5jAAgJU2
         sfhw==
X-Forwarded-Encrypted: i=1; AKwUvBxGXHe2mq+p+AyZ9d7TDo6bX43RhTzrcvANsnpbXm5jBUaT2zkGcezvdbOla+7fsuq3tRcCET2EHJ/XjBpbky8=@vger.kernel.org
X-Gm-Message-State: AFuF++kiSDLP4icjXZJwmlAlsW8XXrzb1N12TpryliZ3tzSR608MYPY4
	NH0Trm78IeVBsH4w7zhZ3pgzH7o8H3yC/bH0zNYG815BTQqXRTQmeac=
X-Gm-Gg: AYBFou0hSdq3QsvF27WGoG2DjI/aguwDIVSAtdYDNxUMDZCtvj+gOw9St0o/Esi0ndU
	t0o8amaZFnW2YxGWhZz9+OryWqpyf37yqOr9wUiLPULSzK4T7l5LiM3aEt6flqcWTL29i8BXVzM
	AGgMRuayl6oiCqDktf1fsjZdVZ6tms/sUDqmy4gWAgFNCqnSbi0XHJRbuh+D0iWftoqJ98tnRar
	fbwI7W96vtDSrxZIbjKyhk6n3WLQhT6Wbv9KKavhyxnp/UYPPhIEluPxVmiLbfWLbshTAO72xR3
	eW4ibRllNtmSic/8g84V2ILfkpU/AmkS9jgU6eR3sQRc9fERbuqsWX0kG828hd27vid3wnzzp9A
	74FDziMLtCHsHb2f2Mh2PHfaqRBZpkGK1CHB4HGY8H9KiOGyJrnj+rEAldPoQrc5wtYkc/wxAny
	PIvPZOHs6vZy9N4Mm0dFufo4yGCFuTYNZE0GM5WRxL+di/VsJzivJSnoS+jClslsaIYbntXFBKi
	x1Gnp2bLWIfRzxncCV/+X9Nw6IVOxvPEzwkQw==
X-Received: by 2002:a17:90b:37cb:b0:39e:6c6a:2090 with SMTP id 98e67ed59e1d1-39e6c6a229fmr1913904a91.49.1789778803484;
        Fri, 18 Sep 2026 17:46:43 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:45e5:9e39:6356:6164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c169dcdsm1927166a91.2.2026.09.18.17.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 17:46:43 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: akpm@linux-foundation.org,
	rppt@kernel.org
Cc: peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v1 2/2] selftests/mm: add a test for UFFDIO_MOVE of a write-protected swap entry
Date: Sat, 19 Sep 2026 09:46:30 +0900
Message-ID: <20260919004630.1159895-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919004630.1159895-1-donggeunyoo.kernel@gmail.com>
References: <20260919004630.1159895-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move a swapped-out page out of a write-protected area into a destination
registered for missing faults only, and read pagemap bit 57 at the
destination.  The destination was never write-protected, so the bit must
be clear.

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 61 ++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index ef9b3956bdcf..ae8b718f0a27 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -2037,6 +2037,59 @@ static void uffd_move_pmd_split_test(uffd_global_test_opts_t *gopts, uffd_test_a
 			      uffd_move_pmd_handle_fault);
 }
 
+/*
+ * Moving a swapped-out page out of a write-protected area must not carry the
+ * uffd-wp bit into a destination that is not write-protect registered: such a
+ * bit is never cleared afterwards, so pagemap keeps reporting the page as
+ * uffd-tracked.
+ *
+ * Needs a swap device; skipped if MADV_PAGEOUT cannot evict the page.
+ */
+static void uffd_move_swap_wp_test(uffd_global_test_opts_t *gopts,
+				   uffd_test_args_t *targs)
+{
+	unsigned long page_size = gopts->page_size;
+	struct uffdio_move move = { };
+	int pagemap_fd, i;
+
+	if (uffd_register(gopts->uffd, gopts->area_src, page_size,
+			  false, true, false))
+		err("register src failure");
+	if (uffd_register(gopts->uffd, gopts->area_dst, page_size,
+			  true, false, false))
+		err("register dst failure");
+
+	wp_range(gopts->uffd, (unsigned long)gopts->area_src, page_size, true);
+
+	pagemap_fd = pagemap_open();
+	for (i = 0; i < 100; i++) {
+		if (madvise(gopts->area_src, page_size, MADV_PAGEOUT))
+			err("MADV_PAGEOUT");
+		if (pagemap_is_swapped(pagemap_fd, gopts->area_src))
+			break;
+		usleep(10000);
+	}
+	if (!pagemap_is_swapped(pagemap_fd, gopts->area_src)) {
+		uffd_test_skip("MADV_PAGEOUT did not swap the page; is swap enabled?");
+		goto out;
+	}
+
+	move.dst = (unsigned long)gopts->area_dst;
+	move.src = (unsigned long)gopts->area_src;
+	move.len = page_size;
+	if (ioctl(gopts->uffd, UFFDIO_MOVE, &move))
+		err("UFFDIO_MOVE");
+
+	if (pagemap_get_entry(pagemap_fd, gopts->area_dst) & PM_UFFD_WP)
+		uffd_test_fail("uffd-wp bit moved into an area that is not write-protected");
+	else
+		uffd_test_pass();
+out:
+	close(pagemap_fd);
+	uffd_unregister(gopts->uffd, gopts->area_src, page_size);
+	uffd_unregister(gopts->uffd, gopts->area_dst, page_size);
+}
+
 static bool
 uffdio_verify_results(const char *name, int ret, int error, long result)
 {
@@ -2359,6 +2412,14 @@ uffd_test_case_t uffd_tests[] = {
 		.uffd_feature_required = UFFD_FEATURE_MOVE,
 		.test_case_ops = &uffd_move_test_pmd_case_ops,
 	},
+	{
+		.name = "move-swap-wp",
+		.uffd_fn = uffd_move_swap_wp_test,
+		.mem_targets = MEM_ANON,
+		.uffd_feature_required = UFFD_FEATURE_MOVE |
+		UFFD_FEATURE_PAGEFAULT_FLAG_WP,
+		.test_case_ops = &uffd_move_test_case_ops,
+	},
 	{
 		.name = "wp-fork",
 		.uffd_fn = uffd_wp_fork_test,
-- 
2.53.0

