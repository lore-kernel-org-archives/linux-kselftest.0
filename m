Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871391;
	b=NkF/9owUm4CGmd5xFlNvAR0l0UTYobdvU1u22nkYxz+Th8YzAC6+pZc7Dve11avrl9J3
	 AbFPMbZQB14sxhS+wrsNKHw71JgR5qEbXJtiPxjwAo90drNvYb889SB0PKSIaDWOW0pFT
	 10SOkaeNkRerSUMdo4KByEhds4l+DiXOt7coOq2vBf21rSB/MhwONY+9URUWyecKAeppO
	 UcxTgMexrWQox23PsK8qTC505O7qH62+7BORd+4O/gQnVOlRESTHZ3lmN2jtE1gt3fx1R
	 eAvB+QRhJAW3k9+hP26NrcIEMzITuOQT2Nt0y3aLOlp2GdQ6idTpK/rH1zKZe6/GhUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=t7tMtv9nbHUIAtxv3eTEVgmJcIdaFB9h8nrHOfA0Uqg=;
	b=4RtO+R+3XKABrJ+4mIpoGFCUaKkVWuuzkOEXoM+xbJrJDQ4cFew0bxCl5E1ZJm96GROH
	 o3sROsJq6AkfE9nvsNYZSTz5WlgvMHmutaYgrt0+3T8uc2OG7KMzKdIAIqmRjqILI8NaH
	 /HkMj43XpKYg0dO4RLY6dFyls3pXmNlRdU2Ml63VjjuMbinYU9kKEFaaQBtDzehlHsG0m
	 dAaHFC5HSmVP9ZZNUHo6O/opunOmGLMpC+TO680gtwqjKd5+k8ZS5KCB4pzJ1aNpmEMlK
	 fixjcSKzAv5ssaQB3gn49igzBMOoqoP2IpB5BoScnYJAavz0YAKLGiK1G/CK8H9KZOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Nv/Hec1t";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9973606A32F
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 09:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9973606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nv/Hec1t
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-353804b591eso3192824eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 01:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871390; x=1794476190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7tMtv9nbHUIAtxv3eTEVgmJcIdaFB9h8nrHOfA0Uqg=;
        b=Nv/Hec1tBbrs+gQGPwId1zOfhmpR73x9S1gapAOwp3H4td0/knMPSD1yx/Hbo9+n2Q
         R44ItVEPb0CCQO75+YzxIKTAoBMsSQQmDtlcqHYxgnOitP+Z0yu35jUFfYG99E8mJfaI
         w5FVh7e7tyILA4pu+Pve5OIWV+X7iV/mznao+HwyQN0m+VsmtmL4phU9Es82zLm2vcyT
         0s302RvFPaa79xOpW5+KyhCSmBPmZffS9sSdGknkA5hO4X18o5yuaLmQPEXvbadO75Pl
         chD+vfDJjLRHopkfxCYP3wcVuW2IWEwJMB+YJGEWt+CDYtzlvl36qqh5KWqk+hGULFHH
         1TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871390; x=1794476190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7tMtv9nbHUIAtxv3eTEVgmJcIdaFB9h8nrHOfA0Uqg=;
        b=p0sDqjNgsuAdYSMN6Yf5e4sAXLoR5n65+UTudvtvLPrctDuHoCB/sNU3l6PIOU0dTW
         HUGsQJWngPU1hd59tziBylBT/Ir7P8RTkffmIbpN2JMIkwPqwBOQ+MjhNRVoeU528zK/
         dItZ7CvSB5XfwxKhdhTP9WRvuPzqv4Lk5jAg4a/dgDUYz5p/TdjWUrC0Fxd/tAllhLeN
         NeLnz55a6Hv4yNYulC20GjQQDSx8qwWscfCO/eg9CwsY/7Z7dNSKdtDR20XmG11P8zTs
         rpxezxHR2vLIFQNnO3x0wz6N91SZUrxbkwCk+4pBjVDdroTCs70NwZflSUlFaeMgrgol
         PO8A==
X-Forwarded-Encrypted: i=1; AKwUvBx7zCUNhFuurrIY0F7z430/NADqaqqAt3pKnCCe0repTIN3X7G3UAdaqAHy/Rap+frIt0+N8JgYIzVsEm3Trjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v1IgMK3EjwgLrr6uk5jISKvH6NekZ2yVQcp4JdUtGPTbh8Bm9
	fsC4/VLM2a9TT8SpJkASTwGYpNfWwZsnEopK3H7NBXOgPKmXOVCmz8eo
X-Gm-Gg: AYBFou0r8PkU2isvLL/3cwzY+NgkozGSBkR1KEW1gBOE9wujimwvsx+yzmfhMUYl/HN
	/C/lDlqfq2fpodSVEaigmZrgpwnrDzF6ZgokRYSLABJtZHh0RyDxiWvmaOm1QcBNqH8TXRbiIuF
	HTJ32cneJVGOL8WBM/jZW/KQ4WSs8vgGPbsYRgyngjz1K3VZu8bYfwzd45b0jD45obXtKTUnsuX
	/NV1XCVHtK6mTIwUDUuyc30S/uf3hqYSBnux/fZgpFQNgrtGNWr1g0C/HZhbrHC8Lg8Wlm4uiED
	whgvDckJH3OcNTRsafuRtmEFN8h2c90UUDR9uUptmTtrbRmskAVpBhSdTp+hbTM1ogD0ArLJXpe
	zg64tpaLRBtVKWCofTNED5xysnzbvnBG6VRKTs0IaqR/AxutcPUNMzRmt8TEX6yLdKbUIdoCIKv
	Ch80hBr0qLCPJnNsEQZZCpUK9gwUSjVW6QSrqGCHLB7Y6bbxTJ6pcwPdEYqJ41pmhvcqzoDdfbk
	pzaC1hl/cadRh5UDKaRNqXfE2hjiIzjul9awTWIvPO88YYbCS3pNbUlsZcBBCS7db15PyRaI0Ug
	hOFv8sxnlghevw3otIfotzhg
X-Received: by 2002:a05:693c:8817:10b0:36a:1788:3d1c with SMTP id 5a478bee46e88-36a423fd04dmr28133229eec.34.1793871389924;
        Thu, 05 Nov 2026 01:36:29 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm17363207eec.16.2026.11.05.01.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:36:29 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 05 Nov 2026 04:36:15 -0500
Subject: [PATCH v2 2/2] selftests/mm: cover merging KSM pages aged by smart
 scan
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-2-8a9780b6844e@gmail.com>
References: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com>
In-Reply-To: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com>
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

  kernel               failures, two boots
  before the fix       20/20, 20/20
  with the fix          0/20,  0/20

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

