Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719E62C21C5
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 05:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786511350; cv=none; b=ds+8pQ4zMQtRJo/0JmOwWRaYvagtR3Xz9+niNiPtTyJ4i/JFn7eZhO6RTb3A5gRf2GEROeis4Mz0MQg29I44und0EJLmFfCTT4tQe9iJLyOr4bLXGtcggwEiwwYqGY7vqEzCsY4egyt84HzKSFqCLVJODa1BVea2dnGFNK0Ci8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786511350; c=relaxed/simple;
	bh=ERFY17OOjn5RAUCsxCqjNeavnir1zuhFOsZr5beHxeY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Gsvk69fFWMGrcopAX7k4BsVWGDFupnMFamLBZyhvRSFj5dlrT8iE+J8Toh3pV4gyj37U43xZpLSoostd3capNEWkNe2N404sfAGqzuxs1pi0nA5g1ymxAUCFdu1oaZ+GnocDFTF+gsp5/HFGueFLXc1M3RPM5D3aitPeP9oznek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nJEVmDrt; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nJEVmDrt"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so13671635ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 22:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786511348; x=1787116148; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Thn+HKkCXc42d+b79Pai7lKi10VN8wTMXKW37O027s0=;
        b=nJEVmDrtzx7SrENupoiPqGsuMYJH5ulS0iOUEy1YrE/BS1jGiTu/aZg9t15vy46Mr9
         FbmPc95m9IebdNZFdOAAhVjZl1aEtA01ZvQUibDe+2lh3c6AteKX5wg+KH0qyk6IXbxm
         SsnKlEiAWVeBa4D0k9epUeg7NgeDYl2B28DroexFxie8RetTmcz3rkzN4jR6o2pVlgW3
         9cPq9laj25W1z6f6uFZDLrQ/YRzC/MkUfJkpr90sZFRFEZZnn+wuY5YkHSHFnLq+oxSo
         57xVSYVycWskWFI2r1lrZZuMW7VQBV5C+DzkICV/KR8tUbtQnQiDP72W6Dxd6LuOXQHY
         8nEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786511348; x=1787116148;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Thn+HKkCXc42d+b79Pai7lKi10VN8wTMXKW37O027s0=;
        b=fpuC65l73EL3VaR6l8EkUI7ZV0TFd7pTEYtKrEcM8ROxBOV5iyxnZKZoJTUoK/XzF9
         p7ZG1+G3lkGcQ8p959sth6rSz165v6hFpWcYkyzaG3QQ0woCufJRJ80IUUrdj3OwewUh
         sb2uzMPcyrV/nqZm3osoexF01n6ObU6Mq1r2J4B1zV7ohZbjHHlMq9D8Lgqry9/XkrWO
         yPnYAa5bEsYEGFFX/F/VP8Ti0392CElaSWzF56GjnofJIAHSNggmydtH4RQYOFQRQnRG
         zUG/raiaLVoRbrmz2RqYE+RurMvk3pzm4npwsCgTJvX6sRkQc7fJkpRlbW8FjQHcRORq
         a8QA==
X-Forwarded-Encrypted: i=1; AHgh+RpIpKfaOOnSnVIVGa2AaXSEKUQm/N8D6PbDmhg0uPrssejBWdvMm6Vrj6MSQXYSr3mjowiepT50oUIFtWoFgHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+NXlrGIstzeK0lrn6qsxKy1zuRARvgtfkJrwnHlt0I/YmwpG
	pbTbdiyqf4grxprKwYwJ0fv6QT/ryoJsqyHScpCxIrdXDC4zzbVHXCTn+Cs6VwfKXlShA3CFL2D
	+QKkhpaCT+g==
X-Received: from pjgg14.prod.google.com ([2002:a17:90b:57ce:b0:380:f969:825e])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ecb:b0:36a:5d1f:7b6
 with SMTP id 98e67ed59e1d1-39301252d62mr2984597a91.2.1786511347564; Tue, 11
 Aug 2026 22:09:07 -0700 (PDT)
Date: Wed, 12 Aug 2026 05:07:55 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260812050848.848882-1-wfelipe@google.com>
Subject: [PATCH v3] selftests/cgroup: test_zswap: skip test_no_kmem_bypass if
 debugfs is unavailable
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, SJ Park <sj@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, "=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"

test_no_kmem_bypass() needs to read
/sys/kernel/debug/zswap/stored_pages via get_zswap_stored_pages() to
verify that compressed pages are charged to the memcg.

When running in an environment where debugfs is not mounted or
CONFIG_DEBUG_FS is disabled, get_zswap_stored_pages() fails, causing the
loop to terminate early and report a false negative (KSFT_FAIL).

Selftests should not fail if debugfs is unavailable, and it should print
a message when it is skipped.

While I'm here, also add a warning message if the test is being skipped
due to totalram size and make the check for totalram more readable.

Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
Acked-by: Yosry Ahmed <yosry@kernel.org>
Acked-by: Nhat Pham <nphamcs@gmail.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
v2 -> v3:
  - Update debugfs print message to be more clear (Andrew Morton).
v1 -> v2:
  - Check for debugfs availability using access("/sys/kernel/debug/zswap/stored_pages", R_OK)
    instead of calling get_zswap_stored_pages() (Yosry Ahmed).
  - Update debugfs print message to exactly match gup_test.c (Anshuman Khandual).
  - Add GB(x) macro to cgroup_util.h (Yosry Ahmed). Cast to unsigned long long
    to prevent 32-bit truncation without altering existing MB(x) signedness.
  - Update RAM check to GB(4) to match comments and format totalram output
    with 1 decimal place (%.1fGB) (Yosry Ahmed).
  - Fix commit message typo (Yosry Ahmed).
  - Moved stored_pages back inside the for loop.

v1: https://lore.kernel.org/all/20260801041255.752039-1-wfelipe@google.com/
v2: https://lore.kernel.org/all/20260811051434.3805648-1-wfelipe@google.com/

 .../selftests/cgroup/lib/include/cgroup_util.h      |  1 +
 tools/testing/selftests/cgroup/test_zswap.c         | 13 +++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
index febc1723d0903..c0f07226b222f 100644
--- a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
+++ b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
@@ -7,6 +7,7 @@
 #endif

 #define MB(x) (x << 20)
+#define GB(x) ((unsigned long long)(x) << 30)

 #define USEC_PER_SEC	1000000L
 #define NSEC_PER_SEC	1000000000L
diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 49b36ee791606..f7b4c4370db63 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -20,6 +20,7 @@ static int page_size;

 #define PATH_ZSWAP "/sys/module/zswap"
 #define PATH_ZSWAP_ENABLED "/sys/module/zswap/parameters/enabled"
+#define PATH_ZSWAP_STORED_PAGES "/sys/kernel/debug/zswap/stored_pages"

 static int read_int(const char *path, size_t *value)
 {
@@ -55,7 +56,7 @@ static int read_min_free_kb(size_t *value)

 static int get_zswap_stored_pages(size_t *value)
 {
-	return read_int("/sys/kernel/debug/zswap/stored_pages", value);
+	return read_int(PATH_ZSWAP_STORED_PAGES, value);
 }

 static long get_cg_wb_count(const char *cg)
@@ -570,8 +571,16 @@ static int test_no_kmem_bypass(const char *root)
 	/* Read sys info and compute test values accordingly */
 	if (sysinfo(&sys_info) != 0)
 		return KSFT_FAIL;
-	if (sys_info.totalram > 5000000000)
+	if (sys_info.totalram > GB(4)) {
+		ksft_print_msg(
+			"requires less than 4GB total ram, sys_info.totalram: %.1fGB\n",
+			(double)sys_info.totalram / GB(1));
 		return KSFT_SKIP;
+	}
+	if (access(PATH_ZSWAP_STORED_PAGES, R_OK)) {
+		ksft_print_msg("debugfs not mounted at /sys/kernel/debug\n");
+		return KSFT_SKIP;
+	}
 	values = mmap(0, sizeof(struct no_kmem_bypass_child_args), PROT_READ |
 			PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
 	if (values == MAP_FAILED)
--
2.55.0.679.g6767b8d81c-goog
