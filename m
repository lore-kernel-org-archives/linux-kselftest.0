Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296753;
	b=XUWQTRP76X4WPGDpaKwAK8DbLcMqPwCC/kDKMPrr7NedfGD7+LgqYkhYlq4Ft8dAhgct
	 8xgDNxszj/mLrXuPsziDzJDZVHuf4ArluneIHJSUPhBhYxi/VexAGbLcyoDHKKoKBAWHj
	 FjMCZMAMFv7gwatPe19YHmmZjQnFDrU86lclBK/lLGLIJkGTf12bZw1TlTnl3AVoKApQR
	 z+L9qsDLcDJeSxW4EC8K1ErP17YXuYpTWjg6uhrm2YJEk0IM76loM/oD/OfYnwpdgOAIF
	 a+3Qeo6z2ctzj4YsYWiS5gyYq+IsO2qB6pnfO6tHieEAbc9ca1LcurbqCh5yDpyE0wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296753;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=97mnfbHxocAhpCaQIusVnq6M8kRtn24K9aSi/cKW7BI=;
	b=DO+Z4iPpkvPc6Zh58S4BTYggsgbAkXBAovy2qqwNA320XELqvwdY7jLl8MWRpIGYiTKg
	 GlqztHn2ZNtTm5MhpfvONX4d57lAh32shl0KITcm4VVqAmNNHeOFEXFouz08tXLolcEra
	 iIFfBBfvtZUO1TvfpcLTMQNobllHhslY1ouoTqpJbtG9gF8TAppaW5+tiQJSFVH64fN9Z
	 uqJtubXPxDmHyBZ/CRd5z43xSfEw/hlel7Gin79bNAtIqZk5pGnw2p57lO5gp7H8QU2y8
	 ZTtdQhDYbuZiFVjfdcj9byaiHd0apMVAejIdnGB3/CMDwBKnCCwkE1QLcCg/VXm4LLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CGkBLCdy;
	arc=none smtp.remote-ip=91.218.175.3
Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA9560A2616
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 07:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA9560A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CGkBLCdy
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1opsdpS+bzNavYjufxeQTvMtfH316Seppf9uslprEeo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794296750; v=1; x=1794901550;
 b=CGkBLCdyeAdmRQaMpYwOsFXQLR9CJ6tNn0SgokvVmqCHlrJNmlAeu0kPYyUKT7nJ2O+nRkEN
 xbm8PFIKoHAso4/v468DBUq8GxVQhz8qFDOOVXo3k9ax9eBrq9KLzP8HiPX/P9BE2cf80gcQ2b2
 3Mye2KctND06Vm86NdcDvAP0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 8b40bb022d5288ba;
	Tue, 10 Nov 2026 07:45:50 +0000
X-Mizu-Trace-ID: 8b40bb022d5288ba
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
Subject: [PATCH 4/4] selftests/ksm: add test for only_merge_zero_pages
Date: Tue, 10 Nov 2026 15:44:51 +0800
Message-Id: <20261110074451.220524-4-xu.xin@linux.dev>
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

Add a functional test that enables use_zero_pages and
only_merge_zero_pages, maps a 2 MiB region with the first half filled
with non-zero data and the second half with zeroes, and verifies that
after KSM scanning reaches steady state:

  - ksm_zero_pages equals the zero half (merged with the kernel zero
    page)
  - ksm_merging_pages is 0 (non-zero pages never reach the stable tree)
  - ksm_rmap_items is 0 (non-zero pages are skipped before rmap_item
    allocation, and the zero pages' rmap_items are freed once a scan
    finds the merged pages are no longer anonymous)

The test skips if the only_merge_zero_pages attribute is absent.

Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
---
 .../selftests/mm/ksm_functional_tests.c       | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 2ffb97ae3120..764ead3425cb 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -257,6 +257,122 @@ static void test_unmerge_zero_pages(void)
 	munmap(map, size);
 }
 
+/*
+ * Enable or disable /sys/kernel/mm/ksm/only_merge_zero_pages. Returns 0 on
+ * success, -errno on failure.
+ */
+static int ksm_set_only_merge_zero_pages(int enable)
+{
+	int fd;
+	ssize_t ret;
+
+	fd = open("/sys/kernel/mm/ksm/only_merge_zero_pages", O_RDWR);
+	if (fd < 0)
+		return -errno;
+
+	ret = write(fd, enable ? "1" : "0", 1);
+	close(fd);
+	return ret == 1 ? 0 : -errno;
+}
+
+static void test_only_merge_zero_pages(void)
+{
+	const unsigned int size = 2 * MiB;
+	const unsigned int half = size / 2;
+	const unsigned int half_pages = half / pagesize;
+	char *map;
+	int i;
+	long zero_pages, merging_pages, rmap_items;
+
+	ksft_print_msg("[RUN] %s\n", __func__);
+
+	if (ksm_use_zero_pages() < 0) {
+		ksft_test_result_skip("write /sys/kernel/mm/ksm/use_zero_pages failed\n");
+		return;
+	}
+	if (ksm_set_only_merge_zero_pages(1) < 0) {
+		ksft_test_result_skip("write /sys/kernel/mm/ksm/only_merge_zero_pages failed\n");
+		return;
+	}
+
+	/* Stabilize accounting by disabling KSM completely. */
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
+
+	/* Don't use THP. Ignore if THP are not around on a kernel. */
+	if (madvise(map, size, MADV_NOHUGEPAGE) && errno != EINVAL) {
+		ksft_test_result_fail("MADV_NOHUGEPAGE failed\n");
+		goto unmap;
+	}
+
+	/*
+	 * Fill the first half with non-zero data (all 0x01) and the second
+	 * half with zeroes. Under only_merge_zero_pages the zero half should
+	 * be merged with the kernel zero page, while the non-zero half must be
+	 * skipped entirely (no rmap_item allocated, no stable-tree insertion).
+	 */
+	memset(map, 0x01, half);
+	memset(map + half, 0x00, half);
+
+	if (madvise(map, size, MADV_MERGEABLE)) {
+		ksft_test_result_fail("MADV_MERGEABLE failed\n");
+		goto unmap;
+	}
+
+	/*
+	 * Run KSM until steady state. Each ksm_start() waits for two full
+	 * scans: the first records the checksums, the second merges the zero
+	 * half with the kernel zero page. The second ksm_start() waits for
+	 * more scans so that the rmap_items of the (now merged, no longer
+	 * anonymous) zero pages are freed and ksm_rmap_items settles at 0.
+	 */
+	for (i = 0; i < 2; i++) {
+		if (ksm_start() < 0) {
+			ksft_test_result_fail("Running KSM failed\n");
+			goto unmap;
+		}
+	}
+
+	/*
+	 * Expected results (steady state):
+	 *  - ksm_zero_pages: the zero half (size/2 pages) is merged with the
+	 *    kernel zero page.
+	 *  - ksm_merging_pages: 0, because the non-zero half is skipped before
+	 *    it can reach the stable tree, and zero pages are accounted in
+	 *    ksm_zero_pages, not ksm_merging_pages.
+	 *  - ksm_rmap_items: 0. The non-zero half is skipped before
+	 *    get_next_rmap_item(), so it never allocates an rmap_item; and the
+	 *    zero half's rmap_items are freed once a scan finds the (now
+	 *    merged) pages are no longer anonymous.
+	 */
+	zero_pages = ksm_get_self_stat("ksm_zero_pages");
+	merging_pages = ksm_get_self_stat("ksm_merging_pages");
+	rmap_items = ksm_get_self_stat("ksm_rmap_items");
+
+	ksft_print_msg("ksm_zero_pages=%ld ksm_merging_pages=%ld ksm_rmap_items=%ld"
+		       " (expected %u/0/0)\n", zero_pages, merging_pages, rmap_items,
+		       half_pages);
+
+	ksft_test_result(zero_pages == half_pages && merging_pages == 0 &&
+			 rmap_items == 0, "only_merge_zero_pages: zero half merged, "
+			 "non-zero half skipped\n");
+
+unmap:
+	ksm_stop();
+	munmap(map, size);
+restore:
+	ksm_set_only_merge_zero_pages(0);
+}
+
 static void test_unmerge_discarded(void)
 {
 	const unsigned int size = 2 * MiB;
@@ -827,6 +943,7 @@ int main(int argc, char **argv)
 
 	test_unmerge();
 	test_unmerge_zero_pages();
+	test_only_merge_zero_pages();
 	test_unmerge_discarded();
 #ifdef __NR_userfaultfd
 	test_unmerge_uffd_wp();
-- 
2.34.1

