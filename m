Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.247
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296744;
	b=bGNQjLyKXytuTRHkKcSab3GrpSHdIRVVl/Oqenv2f7R9Kpeb30VSZj2hknyVFMgpyTUw
	 nzd8LhTVzfkg+35jT7xdk61+sMOd6yT/UKREdbR1mYNZTYmRBGLVL9VSjCz5eFCBj89gX
	 M56BabjmVcPlIQNRV+jcxbgcYxXzQrEUyTGQEBGEPC6gghyln6yGxQbpIxX5boH7gI3RP
	 KYXiLlhaWB+ir95FzgXQ0DIEtcMkV3ZWkEJyY49kzp+Gwa4GfE6CF9k+z4bZrSVWZKbm1
	 NsCTpWR7fgV6N4t3Rmi0eEMgJ+4D123/xIYuiH4BR6v7s2bdUEIHmqf/7LpuOp9Z9Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296744;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J/UcQFN1fT4xKZkZ8LLvoG6TGQaSTpYGVdEtojnOZAc=;
	b=MUpi/ALa+oRZEbVHK2XdpYlbpYyGNEdgYB8ntD3/GVmGidOOExVVDHtwz2EHJcx9LhFw
	 g79RiQDd1btv9vsWvxEl/3Ff72asXKnRV1EYWZC3mrm207WODKszRdnDdDSaDViSJ5M7j
	 HoiYr34VxMJYb6paAZGtqNFtc24SzVYhr0M9X3mCy5huYtvlw6fwcG1qCyn2wiAo1mlf7
	 cg1O1FMmtwj42WOkfyW/Ysvdhh68ATbiBXh2Dpv+F47zek/CR8No9AxtDasiXNxfEq0Sp
	 pywd9j1VltpApL1TqW9tEpzQIbXHE6913MEfVUvw5G4Smf4GI0jX0DlJonZP0ds1wkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GAy5a7qK;
	arc=none smtp.remote-ip=91.218.175.247
Received: from mta0.migadu.com (out-247.mta0.migadu.com [91.218.175.247])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D61606A563
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 07:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43D61606A563
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GAy5a7qK
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ltueAResg7nQ5h4N2uZJoyGUbiD7RPPYBW6X+pD3324=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794296741; v=1; x=1794901541;
 b=GAy5a7qKvleTUREEX6ZUm5/iDILIXyxaRQOv8eyIZHgLlJKMuwKVMvJLcqPPfIwD+MhrQ9KF
 z5MoT+ktScRjN3A+SXMLnjaoqESkiS2Nk5m3hjylH3BvltZ7ym0HmHEAKfsFVcm1ehlu0ZK2Jet
 hY/5BiDkbiqDK7/4DQAlTELw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id a3f2b9640a841c13;
	Tue, 10 Nov 2026 07:45:28 +0000
X-Mizu-Trace-ID: a3f2b9640a841c13
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: xu.xin@linux.dev
Cc: akpm@linux-foundation.org,
	chengming.zhou@linux.dev,
	corbet@lwn.net,
	david@kernel.org,
	link@vivo.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	odys.yuan@gmail.com,
	rppt@kernel.org,
	surenb@google.com,
	tujinjiang@huawei.com,
	vbabka@kernel.org,
	xiao.wang@vivo.com
Subject: [PATCH 3/4] selftests/ksm: consolidate ksm_stat readers into ksm_get_self_stat()
Date: Tue, 10 Nov 2026 15:44:50 +0800
Message-Id: <20261110074451.220524-3-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110074451.220524-1-xu.xin@linux.dev>
References: <20261110074312.219847-1-xu.xin@linux.dev>
 <20261110074451.220524-1-xu.xin@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ksm_get_self_zero_pages() and ksm_get_self_merging_pages() both read
/proc/self/ksm_stat and differ only in the key they look up. Replace
them with a single ksm_get_self_stat(key) helper in vm_util.c, which
reads one value from /proc/self/ksm_stat by key name and accepts only
the keys used by the tests.

This is a pure refactor with no functional change; it prepares for a
new test that also needs to read ksm_rmap_items from /proc/self/ksm_stat.

No functional change intended.

Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
---
 .../selftests/mm/ksm_functional_tests.c       | 18 ++++-----
 tools/testing/selftests/mm/vm_util.c          | 40 ++++++-------------
 tools/testing/selftests/mm/vm_util.h          |  3 +-
 3 files changed, 22 insertions(+), 39 deletions(-)

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 135191f99962..2ffb97ae3120 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -85,7 +85,7 @@ static char *__mmap_and_merge_range(char val, unsigned long size, int prot,
 		return err_map;
 	}
 
-	if (ksm_get_self_merging_pages() > 0) {
+	if (ksm_get_self_stat("ksm_merging_pages") > 0) {
 		ksft_print_msg("Still pages merged\n");
 		return err_map;
 	}
@@ -144,7 +144,7 @@ static char *__mmap_and_merge_range(char val, unsigned long size, int prot,
 	 * Check if anything was merged at all. Ignore the zero page that is
 	 * accounted differently (depending on kernel support).
 	 */
-	if (val && !ksm_get_self_merging_pages()) {
+	if (val && !ksm_get_self_stat("ksm_merging_pages")) {
 		ksft_print_msg("No pages got merged\n");
 		goto unmap;
 	}
@@ -204,7 +204,7 @@ static void test_unmerge_zero_pages(void)
 
 	ksft_print_msg("[RUN] %s\n", __func__);
 
-	if (ksm_get_self_zero_pages() < 0) {
+	if (ksm_get_self_stat("ksm_zero_pages") < 0) {
 		ksft_test_result_skip("accessing \"/proc/self/ksm_stat\" failed\n");
 		return;
 	}
@@ -221,7 +221,7 @@ static void test_unmerge_zero_pages(void)
 
 	/* Check if ksm_zero_pages is updated correctly after KSM merging */
 	pages_expected = size / pagesize;
-	if (pages_expected != ksm_get_self_zero_pages()) {
+	if (pages_expected != ksm_get_self_stat("ksm_zero_pages")) {
 		ksft_test_result_fail("'ksm_zero_pages' updated after merging\n");
 		goto unmap;
 	}
@@ -234,7 +234,7 @@ static void test_unmerge_zero_pages(void)
 
 	/* Check if ksm_zero_pages is updated correctly after unmerging */
 	pages_expected /= 2;
-	if (pages_expected != ksm_get_self_zero_pages()) {
+	if (pages_expected != ksm_get_self_stat("ksm_zero_pages")) {
 		ksft_test_result_fail("'ksm_zero_pages' updated after unmerging\n");
 		goto unmap;
 	}
@@ -244,7 +244,7 @@ static void test_unmerge_zero_pages(void)
 		*((unsigned int *)&map[offs]) = offs;
 
 	/* Now we should have no zeropages remaining. */
-	if (ksm_get_self_zero_pages()) {
+	if (ksm_get_self_stat("ksm_zero_pages")) {
 		ksft_test_result_fail("'ksm_zero_pages' updated after write fault\n");
 		goto unmap;
 	}
@@ -671,7 +671,7 @@ static void test_fork_ksm_merging_page_count(void)
 	child_pid = fork();
 	if (!child_pid) {
 		init_global_file_handles();
-		exit(ksm_get_self_merging_pages());
+		exit(ksm_get_self_stat("ksm_merging_pages"));
 	} else if (child_pid < 0) {
 		ksft_test_result_fail("fork() failed\n");
 		goto unmap;
@@ -771,7 +771,7 @@ static void test_merge_aged_pairs(void)
 		goto unmap;
 	}
 
-	ksft_test_result(ksm_get_self_merging_pages() == 2 * pairs,
+	ksft_test_result(ksm_get_self_stat("ksm_merging_pages") == 2 * pairs,
 			 "Pages aged by smart scan got merged\n");
 unmap:
 	ksm_stop();
@@ -793,7 +793,7 @@ static void init_global_file_handles(void)
 	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
 	if (pagemap_fd < 0)
 		ksft_exit_skip("open(\"/proc/self/pagemap\") failed\n");
-	if (ksm_get_self_merging_pages() < 0)
+	if (ksm_get_self_stat("ksm_merging_pages") < 0)
 		ksft_exit_skip("accessing \"/proc/self/ksm_merging_pages\") failed\n");
 
 	pages_to_scan_fd = open("/sys/kernel/mm/ksm/pages_to_scan", O_RDWR);
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index f26f9e4bfdbe..8f1ee1f81e36 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -904,14 +904,20 @@ bool detect_huge_zeropage(void)
 	return enabled;
 }
 
-long ksm_get_self_zero_pages(void)
+long ksm_get_self_stat(const char *key)
 {
 	int proc_self_ksm_stat_fd;
 	char buf[200];
-	char *substr_ksm_zero;
+	char *substr;
 	size_t value_pos;
 	ssize_t read_size;
 
+	/* Only the keys actually used by the tests are accepted. */
+	if (strcmp(key, "ksm_rmap_items") &&
+	    strcmp(key, "ksm_zero_pages") &&
+	    strcmp(key, "ksm_merging_pages"))
+		return -EINVAL;
+
 	proc_self_ksm_stat_fd = open("/proc/self/ksm_stat", O_RDONLY);
 	if (proc_self_ksm_stat_fd < 0)
 		return -errno;
@@ -925,34 +931,12 @@ long ksm_get_self_zero_pages(void)
 
 	buf[read_size] = 0;
 
-	substr_ksm_zero = strstr(buf, "ksm_zero_pages");
-	if (!substr_ksm_zero)
+	substr = strstr(buf, key);
+	if (!substr)
 		return 0;
 
-	value_pos = strcspn(substr_ksm_zero, "0123456789");
-	return strtol(substr_ksm_zero + value_pos, NULL, 10);
-}
-
-long ksm_get_self_merging_pages(void)
-{
-	int proc_self_ksm_merging_pages_fd;
-	char buf[10];
-	ssize_t ret;
-
-	proc_self_ksm_merging_pages_fd = open("/proc/self/ksm_merging_pages",
-						O_RDONLY);
-	if (proc_self_ksm_merging_pages_fd < 0)
-		return -errno;
-
-	ret = pread(proc_self_ksm_merging_pages_fd, buf, sizeof(buf) - 1, 0);
-	close(proc_self_ksm_merging_pages_fd);
-	if (ret < 0)
-		return -errno;
-	if (!ret)
-		return -EIO;
-	buf[ret] = 0;
-
-	return strtol(buf, NULL, 10);
+	value_pos = strcspn(substr, "0123456789");
+	return strtol(substr + value_pos, NULL, 10);
 }
 
 long ksm_get_full_scans(void)
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index ab1325dc6580..2b25a9eab30c 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -159,8 +159,7 @@ static inline int sz2ord(size_t size, size_t pagesize)
 void *sys_mremap(void *old_address, unsigned long old_size,
 		 unsigned long new_size, int flags, void *new_address);
 
-long ksm_get_self_zero_pages(void);
-long ksm_get_self_merging_pages(void);
+long ksm_get_self_stat(const char *key);
 long ksm_get_full_scans(void);
 int ksm_wait_full_scans(long nr);
 int ksm_get_smart_scan(void);
-- 
2.34.1

