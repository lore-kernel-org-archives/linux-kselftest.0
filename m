Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE32C332EBC
	for <linux-kselftest@vger.kernel.org>; Sat,  3 Oct 2026 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023451; cv=none; b=NN9gqulDAFBmHXOUWXKvjmk1gEjwk0wywI49cBsuaOrbvnfNZXR1hFtWrfWfFvv7FI0L0hoDMytr5FGinJwc2BEQKlOf2ZHFq46dbfUX7fqE87k44P35QKGZWl+iAMFoHOIB4dXN0MFMDuwC8k0gBIwy+V5z9v3kFQWdE9mkiWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023451; c=relaxed/simple;
	bh=XefGRV1Ivy9Vn3v4XVAWXgp92Aj87qW/BcgvaHZIrAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EiE3Bp5lsAGECvZrpUlCyLOdXDE5j2WGh2ZIAL9g+41QFcnMkMwGG2aGQKvl+3kDQbxAS0AiFM55KqRE/S7o5U4aLDECkEsho1MhwOdrJeFukqXIZW2nuPvaCrnC8u1KHUFh3mpZ65f0JPd1P92eKMgRyZlW6QATBsTVE/vd4a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkEWykT3; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkEWykT3"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso142521a91.1
        for <linux-kselftest@vger.kernel.org>; Sat, 03 Oct 2026 03:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791023443; x=1791628243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrMFpIv7WRJdTe5fhZ+AXxpLaL+kTtS4G30LmhtwQyM=;
        b=lkEWykT3NqfI87OaxFYRE5lmqShmyAXYkju8M95ii/Dq9X6bEuqh8nS1tfRklWbqqh
         +smQxXhxJmp2EMDeDVOXEq0XuuuBX04BgFl35e7fF1E0+n21BrEwyO06XSglnzKHsngd
         DY+YFB96UKsrPXgC1ejOzfTqNATJzWTTcDJQ0kWsOvccMLjAe7L5DQdIixuqu0nS2/+B
         nOK9RNe2BPB8V5MBFGWrLqEFRxiZ3ZGnE4c3NsaA7HAxYUu1xxsTaHitk4usd2/eKkAy
         vFyTCVGGWaexOvq5qdb8+mG4TZLphSIsskyzRRn5p0faBj2CjeQwkXx6Xf1amlwydPHP
         TtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023443; x=1791628243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vrMFpIv7WRJdTe5fhZ+AXxpLaL+kTtS4G30LmhtwQyM=;
        b=FYSgWwhJCpTdPfuSTx7D5/C7pxvhBHzg2OE42IJMqT6EHzUzKJaix396aKAW+WfZZI
         EWWHTR99XIs6tepFID2hUkWcUkD8sGa7OmSJz4s0OwYznU+ASod9BEk9P622HrD+9h7a
         jBV12J0iUPTz5QjOW8OB2TJdPYZvsNrUJmqOP0qhc2bI92N+yPqPAOwNHykn27FSRrfx
         zx5WyRklWBNPCPnYSSFQ05/c4KLMf91t4rhJj9QPBUYjs3N9SBDBnxLmaBA3+bWMFx/M
         bj9ScBDJahJCc1H5OrlQZicMcOCqGmfkkgwh2iL5GvZzgpmzttGnMLDhk5Ck/adwrKCM
         Iv+w==
X-Forwarded-Encrypted: i=1; AKwUvByU0viNy74hoWiybWBB/PlJW2qMnj/aRYa12m1982VbZebRiO8FTYVdHt+MMW2E+64gRsgmFKBTicZHrp9LGDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJm3NJ3NHqT9yFYgYbxDBLgtfWE0BggpEsHwX4YTxRgXeALXPp5
	dZDbPQy5SQP8SbW5cgJj+XPYyXFzY7202opL20+q9bOJFe4IHXbVoZ4=
X-Gm-Gg: AYBFou3cdirdVnLMr1loF6Zbcsk3aYlkuV7nIyfuSCm6x1BXtrq14sPA53K3znaehKg
	6B8e2qM2WYC38GVahIkVZ0VaFPRO7SOmr57P6BHgFvmDPORmC2clozm1c7PKwhNJoROWuSHKBHQ
	7WHe/4VEvT4U0h72fZ6lX94hRgR0CzjCWfGdIbKxVaUmvHlOn8U0YkCf7vnY2KnFblXdj+qRp1T
	YztNoz3VKtFxhNecZfpyL1KXGV19KUm0A3HF5SjD6cQZx34duOik5gKF7Ps6V4FTDYvC7elba3n
	gaw5q7fuBYZEz1erJ2kV06KpjKklOnGAgHSzCJIFpADehVNsGw47JX3CiizUtkEZqpMk3+0TIgP
	JKZy1T6LSjFu1ZU1dkQwZCQuy61pySsGAxYgjEL/h43sBdBJ/1wXgFNIBwpPXV/OI7mMCc6FECj
	HCUgojf9WuHsZak11xtqFkXnta4X8mbxGJooT0Bc1rm1mc+xp0OjDv6mZvnJj8rETZh4b7cJV+E
	oE6zexEmXF+EYrCKKC+tm/r
X-Received: by 2002:a17:90a:ec86:b0:3a0:d75c:239f with SMTP id 98e67ed59e1d1-3a78717d98dmr1420413a91.11.1791023442881;
        Sat, 03 Oct 2026 03:30:42 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm2121961a91.4.2026.10.03.03.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 03:30:42 -0700 (PDT)
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
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v4 2/2] selftests/mm: add tests for UFFDIO_MOVE of a uffd-protected swap entry
Date: Sat,  3 Oct 2026 19:30:30 +0900
Message-ID: <20261003103030.63380-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003103030.63380-1-donggeunyoo.kernel@gmail.com>
References: <20261003103030.63380-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move a swapped-out page out of a write-protected or RWP-protected area into
a destination registered for missing faults only, and read pagemap bit 57
at the destination.  The destination was never protected, so the bit must
be clear.

Assisted-by: LLM
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 84 ++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index ef9b3956bdcfd..97484c82f24e1 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -2037,6 +2037,75 @@ static void uffd_move_pmd_split_test(uffd_global_test_opts_t *gopts, uffd_test_a
 			      uffd_move_pmd_handle_fault);
 }
 
+/*
+ * Moving a swapped-out page out of a write-protected or RWP-protected area
+ * must not carry the uffd bit into a destination registered for missing
+ * faults only: such a bit is never cleared afterwards, so pagemap keeps
+ * reporting the page as uffd-tracked.
+ *
+ * Needs a swap device; skipped if MADV_PAGEOUT cannot evict the page.
+ */
+static void uffd_move_swap_test_common(uffd_global_test_opts_t *gopts,
+				       bool rwp)
+{
+	unsigned long page_size = gopts->page_size;
+	struct uffdio_move move = {
+		.dst = (unsigned long)gopts->area_dst,
+		.src = (unsigned long)gopts->area_src,
+		.len = page_size,
+	};
+	int pagemap_fd = pagemap_open();
+
+	if (rwp) {
+		if (uffd_register_rwp(gopts->uffd, gopts->area_src, page_size))
+			err("register src failure");
+		rwprotect_range(gopts->uffd, (unsigned long)gopts->area_src,
+				page_size, true);
+	} else {
+		if (uffd_register(gopts->uffd, gopts->area_src, page_size,
+				  false, true, false))
+			err("register src failure");
+		wp_range(gopts->uffd, (unsigned long)gopts->area_src,
+			 page_size, true);
+	}
+	if (uffd_register(gopts->uffd, gopts->area_dst, page_size,
+			  true, false, false))
+		err("register dst failure");
+
+	if (madvise(gopts->area_src, page_size, MADV_PAGEOUT))
+		err("MADV_PAGEOUT");
+	if (!pagemap_is_swapped(pagemap_fd, gopts->area_src)) {
+		uffd_test_skip("MADV_PAGEOUT did not swap the page; is swap enabled?");
+		goto out;
+	}
+
+	if (ioctl(gopts->uffd, UFFDIO_MOVE, &move)) {
+		uffd_test_fail("UFFDIO_MOVE failed: %s", strerror(errno));
+		goto out;
+	}
+
+	if (pagemap_get_entry(pagemap_fd, gopts->area_dst) & PM_UFFD_WP)
+		uffd_test_fail("uffd bit moved into an area registered for missing faults only");
+	else
+		uffd_test_pass();
+out:
+	close(pagemap_fd);
+	uffd_unregister(gopts->uffd, gopts->area_src, page_size);
+	uffd_unregister(gopts->uffd, gopts->area_dst, page_size);
+}
+
+static void uffd_move_swap_wp_test(uffd_global_test_opts_t *gopts,
+				   uffd_test_args_t *targs)
+{
+	uffd_move_swap_test_common(gopts, false);
+}
+
+static void uffd_move_swap_rwp_test(uffd_global_test_opts_t *gopts,
+				    uffd_test_args_t *targs)
+{
+	uffd_move_swap_test_common(gopts, true);
+}
+
 static bool
 uffdio_verify_results(const char *name, int ret, int error, long result)
 {
@@ -2359,6 +2428,21 @@ uffd_test_case_t uffd_tests[] = {
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
+	{
+		.name = "move-swap-rwp",
+		.uffd_fn = uffd_move_swap_rwp_test,
+		.mem_targets = MEM_ANON,
+		.uffd_feature_required = UFFD_FEATURE_MOVE | UFFD_FEATURE_RWP,
+		.test_case_ops = &uffd_move_test_case_ops,
+	},
 	{
 		.name = "wp-fork",
 		.uffd_fn = uffd_wp_fork_test,
-- 
2.53.0

