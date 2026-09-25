Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A57367B9B
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 04:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790310563; cv=none; b=io7KgM0JcWHmfmnpUJvxT8NaZb/PvijrNI88smrbIR1DkacJPxe8Ix0c8tWEKFQCLjW+jnc/U3z1TfKtyd8ZYrywPZ32ubQWf2Pv6mJuQnDPmnA7vp0/UMn7JgvZ5b/MMuGTqQ/c+OtXANmcrOnFKRxRC+qsXzbf//ICt19xR/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790310563; c=relaxed/simple;
	bh=+ShsSBBguCalQ+r4sdLogwoiUCqrnqvc0M8suyuVZP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A03DMOw+lkAMUtcpOiMUWzwAVF77IIdJDZBGUOiXKyQ7mXrWiLF9tGRLoAzvKiiK2+YnrJh1M3RWMj73Sx8dKvTrUpJo8jV61IEnsRL21I7didAU6DF1GU2hECe4mXj0m+KSlY/puMJGh/Puh7cMNur/Ouk9pAj/IX4ObQkIeV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ku+cXvxE; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ku+cXvxE"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2df8de41d6eso2307895ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 21:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790310561; x=1790915361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LU0Go2cyRn/9B1ML6xI9lk2v8ECZiOmXK9suX3taLfI=;
        b=ku+cXvxEMRvksm8Mnig0zfnAlxvXjpoxExoYEegVUIrpE41SJP3BXCtYo2X0GOsfZU
         PjBZ1aVPE/mipo0q4v1FUAifZ/mrIigdr4SiV//jSoTL8wvRUDC0wg9n73mffryFuFCh
         u0EEspRRNd9R3yZLxWzfOIi5bNKUCLV+f9S/NeTM9FGJDn64ybYCHC58xnnuLkIrT2k/
         Qrv6MxUc+myiokIg1je172JgZjPdYV2uqxvwoB6BCToiZASyg9oNLPhGvsESv7wnc7Kc
         7++WfQltrBp6VF+iyAkaJ0o5y4FfZCJdiUzHYq5ExMDf02B8ouc1wbsVSJ2F/re87tE1
         X75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790310561; x=1790915361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LU0Go2cyRn/9B1ML6xI9lk2v8ECZiOmXK9suX3taLfI=;
        b=EudthG2ErI40Xv3ZKgp/BmfOGaHh2/W9e59AzDV5tCW1+Z86cEl/XYNU+VOHbYlEOy
         YXKZ167fGQ6DsX9scYCdPv875jlsMVnMhf4HfgfahRaMmRBtyFjtHogHOtYIDgW5g81J
         O0H6/29F6wC7AyygMevd9k2luJNvXH+kQph5oD2CfeDkZIT7lcECr8a/sT+9Z6BdT9DO
         HdqcOM/7yL92W5yfbnyF8hqeRFBFLYAaGeR7doWpPsDur5tcTG+TJhEygZ3Gpez6AZGD
         epX+hH9PQozYFs5W+aeIWnmWQknT4G6V6S0HuCMv8s0Q0eALu+uer2o+scm7X9Kp4geS
         3Fcw==
X-Forwarded-Encrypted: i=1; AKwUvBxgvFaF3ayFqjfHde62LqCXvMEQwmIfkZh5l5/12y3j4jZDwMt7gSW/eM2GkqsTPirusVgJ/vfLtnwXogmgeOU=@vger.kernel.org
X-Gm-Message-State: AFuF++mIJRInswbdlCKToH9WVjhCIId4fy9dOQPASzDaBWPYRb6fFyRr
	9PO3GQv13HuJQL4YW6lwCemVGbxf7pFHdBBoFa7yhCit7NIJAtVWfz8=
X-Gm-Gg: AYBFou3gL95Cy4XWWuQRYsuMNSIkFM8oMiqzT9Gfq85Kl3+9DXe1jNheQe9u8TxzOWo
	CmMTI+1CIsh8w51haeD4rq7cjeKH0kOPekXO4Y34gmVxfQo9iJaU5Ae8H32FzYqWIuw68SZpdfz
	OtD2jmwdDfrTe6YxjiZyRyYa0X2C5TV/IV2fzLC5dixbNsObMObAVMmv1iuN8YgvB6LIoCx0KCr
	oSTxYOAnSKidkIff8kgLFt0fDu9SALRMQJJW0J41/eRD5xGvRDTOn7BJNa6WRef20tETa+CiuXX
	G9VGcMbBMsjLDSwH9kZW+7jtCUKeVPikzj3xTYliN+ssOQ9JgAdpL79JRZqbeZOuty9Wyv8r1nO
	ykWHClRtl/igUB3bbVkKV9E5mw4FXldF5L7OkFpxI5uzggXb7kqvKgpTJ0VaiAQVMhGTptkw5t0
	vDHEvhwTimDHQ1dQKWE8nJT5qES63npURYsqFZAEfPHxxXSrqGoBZwzqpLTLUEbqGd9toFaCytG
	h8Js3lh+ncf5A+GVo3OEp5J
X-Received: by 2002:a17:902:d484:b0:2dd:c100:b2d0 with SMTP id d9443c01a7336-2df7dd77d96mr38107475ad.59.1790310560808;
        Thu, 24 Sep 2026 21:29:20 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9525cd53sm2499125ad.38.2026.09.24.21.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:29:20 -0700 (PDT)
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
	kirill@shutemov.name,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v2 2/2] selftests/mm: add a test for UFFDIO_MOVE of a write-protected swap entry
Date: Fri, 25 Sep 2026 13:29:07 +0900
Message-ID: <20260925042907.2330519-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925042907.2330519-1-donggeunyoo.kernel@gmail.com>
References: <20260925042907.2330519-1-donggeunyoo.kernel@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 61 ++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index ef9b3956bdcfd..ae8b718f0a278 100644
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

