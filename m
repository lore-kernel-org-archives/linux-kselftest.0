Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD983E5577;
	Tue, 25 Aug 2026 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648347; cv=none; b=UzMJECb/d+VivLAtfxw+faS9Xuzor9OqNFOtC7oOPvIxd8JHIRS9TUbnc87E3B9BF+P0Kn7KDQoy9zb6JCeR3yyjn1hTJmLkALg351KHY0yz0L3C5pf6Z3N3qpz3aKf2kH7M5bTTaLsVmLNp0YjqsYwZVgGUEA5DxKUedSmrk9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648347; c=relaxed/simple;
	bh=ekQ6llSsKW5YmufIU9CduWPGTA4ccClnR6Qhv7DH8vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kgq3Hec8prUutcGTrkvNbW3qyvZqHX9ECQ4W8cYCTl4w6ewPYe9977BNm2wRPckmT/PCGa5GE6ccTXJgQ/QBRSOV35KSBAF6MbD3jQ1qlOGfIQRQ59qtVnvPWfbSAsQylYRK7M3XhehR4EABRZ5vxd5ZQpjij88AWFBKng3dLZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 340a63a8a06311f19a56ed5b684f684d-20260825
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d15b4706-d242-483d-acee-2c5a758a1985,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:35
X-CID-INFO: VERSION:1.3.19,REQID:d15b4706-d242-483d-acee-2c5a758a1985,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:35
X-CID-META: VersionHash:7db8b62,CLOUDID:371e4b14d4f9886783239c063ed44db9,BulkI
	D:260825165900FI2LVGZY,BulkQuantity:0,SF:17|19|38|66|78|81|82|102|127|865|
	898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:n
	il,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 340a63a8a06311f19a56ed5b684f684d-20260825
X-User: husong@kylinos.cn
Received: from ctao-book.. [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 342430873; Tue, 25 Aug 2026 16:58:56 +0800
From: Song Hu <husong@kylinos.cn>
To: akpm@linux-foundation.org,
	usama.anjum@arm.com
Cc: linux-mm@kvack.org,
	shuah@kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	peterx@redhat.com,
	sarthak.sharma@arm.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Song Hu <husong@kylinos.cn>
Subject: [PATCH v4 2/3] selftests/mm: emit TAP header and use TAP skip in mremap_test
Date: Tue, 25 Aug 2026 16:57:55 +0800
Message-ID: <20260825085756.63030-3-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825085756.63030-1-husong@kylinos.cn>
References: <20260825085756.63030-1-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mremap_test calls ksft_set_plan() without ksft_print_header(), and its
get_mmap_min_addr() skip path uses a bare exit(KSFT_SKIP) that prints no
TAP line, so its output is not valid KTAP.  Add the header and switch
the skip to ksft_exit_skip().

Also fix two more KTAP compliance issues spotted in review:

- get_mmap_min_addr() calls strerror(errno) after fclose(), which may
  clobber errno; save errno before fclose() instead.

- Some ksft_*() messages embed "\n\t", so the text after each embedded
  newline is printed without the "# " prefix.  Split those into separate
  messages.

And cache mmap_min_addr in main() before ksft_set_plan(), so that the
skip paths in get_mmap_min_addr() are taken before the plan is set; a
skip after the plan leaves the run with fewer tests than planned.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Song Hu <husong@kylinos.cn>
---
 tools/testing/selftests/mm/mremap_test.c | 43 ++++++++++++++----------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 131d9d6db867..ab5420f2e875 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -111,18 +111,17 @@ static unsigned long long get_mmap_min_addr(void)
 		return addr;
 
 	fp = fopen("/proc/sys/vm/mmap_min_addr", "r");
-	if (fp == NULL) {
-		ksft_print_msg("Failed to open /proc/sys/vm/mmap_min_addr: %s\n",
-			strerror(errno));
-		exit(KSFT_SKIP);
-	}
+	if (!fp)
+		ksft_exit_skip("Failed to open /proc/sys/vm/mmap_min_addr: %s\n",
+			       strerror(errno));
 
 	n_matched = fscanf(fp, "%llu", &addr);
 	if (n_matched != 1) {
-		ksft_print_msg("Failed to read /proc/sys/vm/mmap_min_addr: %s\n",
-			strerror(errno));
+		int err = errno;
+
 		fclose(fp);
-		exit(KSFT_SKIP);
+		ksft_exit_skip("Failed to read /proc/sys/vm/mmap_min_addr: %s\n",
+			       strerror(err));
 	}
 
 	fclose(fp);
@@ -1164,10 +1163,11 @@ static void run_mremap_test_case(struct test test_case, int *failures,
 					    rand_addr);
 
 	if (remap_time < 0) {
-		if (test_case.expect_failure)
-			ksft_test_result_xfail("%s\n\tExpected mremap failure\n",
-					      test_case.name);
-		else {
+		if (test_case.expect_failure) {
+			ksft_print_msg("%s: expected mremap failure\n",
+				       test_case.name);
+			ksft_test_result_xfail("%s\n", test_case.name);
+		} else {
 			ksft_test_result_fail("%s\n", test_case.name);
 			*failures += 1;
 		}
@@ -1177,11 +1177,13 @@ static void run_mremap_test_case(struct test test_case, int *failures,
 		 * was faulted in.
 		 */
 		if (threshold_mb == VALIDATION_NO_THRESHOLD ||
-		    test_case.config.region_size <= threshold_mb * _1MB)
-			ksft_test_result_pass("%s\n\tmremap time: %12lldns\n",
-					      test_case.name, remap_time);
-		else
+		    test_case.config.region_size <= threshold_mb * _1MB) {
+			ksft_print_msg("%s: mremap time: %12lldns\n",
+				       test_case.name, remap_time);
 			ksft_test_result_pass("%s\n", test_case.name);
+		} else {
+			ksft_test_result_pass("%s\n", test_case.name);
+		}
 	}
 }
 
@@ -1250,13 +1252,18 @@ int main(int argc, char **argv)
 	time_t t;
 	FILE *maps_fp;
 
+	ksft_print_header();
+
+	get_mmap_min_addr();
+
 	pattern_seed = (unsigned int) time(&t);
 
 	if (parse_args(argc, argv, &threshold_mb, &pattern_seed) < 0)
 		exit(EXIT_FAILURE);
 
-	ksft_print_msg("Test configs:\n\tthreshold_mb=%u\n\tpattern_seed=%u\n\n",
-		       threshold_mb, pattern_seed);
+	ksft_print_msg("Test configs:\n");
+	ksft_print_msg("threshold_mb=%u\n", threshold_mb);
+	ksft_print_msg("pattern_seed=%u\n", pattern_seed);
 
 	/*
 	 * set preallocated random array according to test configs; see the
-- 
2.43.0

