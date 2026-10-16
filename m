Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4AB4D9F82
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 14:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161323; cv=none; b=IB2kyM2f0PWM+xwe21T9V3B4ZSB02/H0WL+lzg6PUcu5QOiiyeESCGRsF6Up+msmZqJK/nyyNdpu7FqcjcyYAF/XdQVt5QwiB8PYmcXtlIGsnTBYXDpmT6iBm20nEL/nKWAUxPMY7/8ILeIz7FRNdaHFG7jKu6BmkSwnTfTIG8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161323; c=relaxed/simple;
	bh=jfH/5nDXFBBYY1yRei31P++B9MGbaA0B0jygAz20OZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GvM3h/4JpvOYPtW8LAN0cwkUrP9/y5N0OEGQEj7yQnBf62mY5R8MdG36dtp5ESCLJyTv/kdBn7VQKHVDAS7uo9MoX5P5D4fHjLUWsw1zg4haSvOOjVrUsqeoCkrKj6sNfQb0tst8xTNfpAKbeeJudvdagp1W1i0Bn3iNRB7WSvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9r5OmDl; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9r5OmDl"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35c76e9614aso4997859eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792161322; x=1792766122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6Q8gG4c/qnKlMaH5pfvOOdUUEduyYXPZR3420tP37o=;
        b=K9r5OmDlKe8FvjPj6F4S67o9Uq41Z+LSiq7ddqIAkUbR9LRiN1QRgHWKsChvAHM2yZ
         6w35N8J6zFmnZ91HxFhK9RNNhTA/hsK4U4vZCknNP7vCQNg1DEtGyinTuc7u6rrCB6yv
         YzWqrDy3UO0SzvA7sy2HDvAtG4c9xHDOeHBQOzG2qpyfaZU8boAUpAc7NwUGf/BS727U
         KwlPUxuBntNtDMA9UfnyT91YO7du9IxNOqLtQiu+qk8YJBYzr0z27OW44QvGjTT+vQpX
         U/3YVU33iUYs8qmHw4vlvC5KkCdQHRAFOjNFn9cz7ymfdBiLYbH9r/AzgvpbuFMpGYzh
         /8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161322; x=1792766122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G6Q8gG4c/qnKlMaH5pfvOOdUUEduyYXPZR3420tP37o=;
        b=um5KbiFRKg9wW1wxTZEbtiHJB9xThSm7v8xA3stRt1pZyNjHhUmyhGfz3dVTGjV7bQ
         PBn00ke3CnMJrCbi/bI/1yyH6ayqu7HnGeviOJJfm07wrxgNsxYGYMESZS0V7hHthWBd
         bhddrIYwYcvU83pQmhsV0ok0nWe/YbrAbbOkHmVC4MrxXPyVidysiHJPA178qNy+TIyS
         KnC/KlwggqysRw4IZoua7UyInCxcjVCrDL+UxqKoJqpREf5vlOgwFHEcc8XtjRUfXYer
         e5l38/NqGAZAYKkjMiZAkojNsdyDqmst6ZGurb7REl1RLmA+weq8JMhoU7nJ/ftcCCPi
         WnHQ==
X-Forwarded-Encrypted: i=1; AKwUvByHNPwvjqgjR+aAbceysVrWC2bkaCWtTbRxXC2rbrIS1J/Ck360LLzEUZDIVZdwBTD3kjlOuNM3LlDB4vJjrvI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4RIUDaelENzOkz7vgxRDXdaKM6aPecnEnQraih5g24e0tXW8G
	GAb/c9USa+0JAUlMMTqDkFObOuAoyJqi14yUWtVop/3us49yapVQE5VH
X-Gm-Gg: AYBFou2KFmW2bxnO+dx4wK2xtUmQIJFBXPYWubzxss+54IV7RCNgOWhZPsAXwfKQJbm
	swgNImcXEnEwGvF1tMoFSO92Vu8rL1HW5VQF/xwN8/ki7ACI+rrlUWjzF2hAygji1x8lKZHLHD0
	UevGTrh+VruFhop076DTTcpccvwWnZxNGF2vcvcTD2d/Msg4b6FeMH8K7FsQvwmUsEc3uTXX8Qa
	4QhPDrSE7CigGe4SBxNY+TKN2tYY+eSM3lsAgAWNykGlwEwhmJu4D/HVYY2nXZ8IrZL/ULGDdrB
	9u6KvzAbx84Awe7kbSLxaPhK1yqO8YfWkKNmSHnJlmtcQfHi59n1UvyQJyZCkobisL094Q5zMQ/
	6R7q3qljxNcXvhUhsmHMfDNX982yzeQVWCySagDhYq+kFyrN7wV05cBWZNMDXiIoXWKSwY125oR
	TMS5U73D27zYdldUJvh/lbjUZYqkRcj7liyeorrQ4NOs4IhQzHt8c21uuSJX/4ZllORQ==
X-Received: by 2002:a05:7301:da84:b0:35d:3370:d8e7 with SMTP id 5a478bee46e88-3619ed12158mr57587eec.2.1792161318630;
        Fri, 16 Oct 2026 07:35:18 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm7611812eec.23.2026.10.16.07.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:35:18 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 16 Oct 2026 22:34:57 +0800
Subject: [PATCH 2/2] selftests/mm: cover merging KSM pages aged by smart
 scan
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-bug-mm-ksm-smart-scan-align-skips-v1-2-2f91d76416be@gmail.com>
References: <20261016-bug-mm-ksm-smart-scan-align-skips-v1-0-2f91d76416be@gmail.com>
In-Reply-To: <20261016-bug-mm-ksm-smart-scan-align-skips-v1-0-2f91d76416be@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

ksm_functional_tests checks merging and unmerging with ksmd's default
settings, but nothing there exercises smart scan, which skips pages KSM
has failed to merge for a while.

Smart scan used to time those skips per page, so two identical pages
that became mergeable some scans apart could end up never being looked
at in the same scan, and were never merged. "mm/ksm: align smart scan
skips with the scan number" fixed that.

Add a case that lets sixteen unique pages age for a dozen scans, then
makes a duplicate of each mergeable one scan apart, and expects every
pair to be merged 32 scans later:

  kernel               failures
  before the fix       20/20
  with the fix          0/20

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/ksm_functional_tests.c | 108 +++++++++++++++++++++-
 1 file changed, 107 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 31c06c72203fd..71d9b3cbdb8c1 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -695,6 +695,111 @@ static void test_fork_ksm_merging_page_count(void)
 	munmap(map, size);
 }
 
+static int ksm_wait_full_scans(long nr)
+{
+	long start, cur;
+
+	start = ksm_get_full_scans();
+	if (start < 0)
+		return start;
+	do {
+		cur = ksm_get_full_scans();
+		if (cur < 0)
+			return cur;
+	} while (cur < start + nr);
+
+	return 0;
+}
+
+static void test_merge_aged_pairs(void)
+{
+	const unsigned int pairs = 16;
+	const unsigned long size = 2 * pairs * pagesize;
+	char *map, old_smart_scan = '1';
+	int smart_scan_fd;
+	unsigned int i;
+
+	ksft_print_msg("[RUN] %s\n", __func__);
+
+	smart_scan_fd = open("/sys/kernel/mm/ksm/smart_scan", O_RDWR);
+	if (smart_scan_fd < 0) {
+		ksft_test_result_skip("smart_scan not supported\n");
+		return;
+	}
+	if (pread(smart_scan_fd, &old_smart_scan, 1, 0) != 1 ||
+	    pwrite(smart_scan_fd, "1", 1, 0) != 1) {
+		ksft_test_result_fail("Enabling smart_scan failed\n");
+		goto close_fd;
+	}
+
+	if (ksm_stop() < 0) {
+		ksft_test_result_fail("Disabling (unmerging) KSM failed\n");
+		goto restore;
+	}
+
+	map = mmap(NULL, size, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANON, -1, 0);
+	if (map == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto restore;
+	}
+	if (madvise(map, size, MADV_NOHUGEPAGE) && errno != EINVAL) {
+		ksft_test_result_fail("MADV_NOHUGEPAGE failed\n");
+		goto unmap;
+	}
+
+	/*
+	 * Page i of the first half and page i of the second half form a
+	 * pair with content no other page shares.
+	 */
+	for (i = 0; i < pairs; i++) {
+		memset(map + i * pagesize, i + 1, pagesize);
+		memset(map + (pairs + i) * pagesize, i + 1, pagesize);
+	}
+
+	/* Let the first page of each pair age without a duplicate. */
+	if (madvise(map, size / 2, MADV_MERGEABLE)) {
+		ksft_test_result_fail("MADV_MERGEABLE failed\n");
+		goto unmap;
+	}
+	if (ksm_start() < 0 || ksm_wait_full_scans(12) < 0) {
+		ksft_test_result_fail("Running KSM failed\n");
+		goto unmap;
+	}
+
+	/*
+	 * Make the duplicates mergeable one scan apart so that each pair
+	 * starts out with a different distance in scans.
+	 */
+	for (i = 0; i < pairs; i++) {
+		if (madvise(map + (pairs + i) * pagesize, pagesize,
+			    MADV_MERGEABLE)) {
+			ksft_test_result_fail("MADV_MERGEABLE failed\n");
+			goto unmap;
+		}
+		if (ksm_wait_full_scans(1) < 0) {
+			ksft_test_result_fail("Running KSM failed\n");
+			goto unmap;
+		}
+	}
+
+	if (ksm_wait_full_scans(32) < 0) {
+		ksft_test_result_fail("Running KSM failed\n");
+		goto unmap;
+	}
+
+	ksft_test_result(ksm_get_self_merging_pages() == 2 * pairs,
+			 "Pages aged by smart scan got merged\n");
+unmap:
+	ksm_stop();
+	munmap(map, size);
+restore:
+	if (pwrite(smart_scan_fd, &old_smart_scan, 1, 0) != 1)
+		ksft_print_msg("Restoring smart_scan failed\n");
+close_fd:
+	close(smart_scan_fd);
+}
+
 static void init_global_file_handles(void)
 {
 	mem_fd = open("/proc/self/mem", O_RDWR);
@@ -720,7 +825,7 @@ static void init_global_file_handles(void)
 
 int main(int argc, char **argv)
 {
-	unsigned int tests = 9;
+	unsigned int tests = 10;
 	int err;
 
 	if (argc > 1 && !strcmp(argv[1], FORK_EXEC_CHILD_PRG_NAME)) {
@@ -753,6 +858,7 @@ int main(int argc, char **argv)
 	test_prctl_fork_exec();
 	test_prctl_unmerge();
 	test_fork_ksm_merging_page_count();
+	test_merge_aged_pairs();
 
 	err = ksft_get_fail_cnt();
 	if (err)

-- 
2.43.0

