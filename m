Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070652;
	b=c8hR7umuZpPJ/sOpRsC17J1U2SJSHzs+rrzY7Y1wf1hxJr/+wdlhSFQNrzNMRDUTiXiv
	 XxfdNXKuVQLlqzCnSB5nuBo73Cvk/tN49YlEjnXCSxcbEvXoN1VjGL4joEfl07hN4yTxE
	 GWbxR26DImEx2tqVbuyO1Vy9mCNjJwall97wSMi3Bwn3NwmdSwGsaKTzxW3ShzhIUQ0h6
	 NEcu8MWxUT5zRqlkAAWkiqJkqLL281qekj7JBEL+Ne9IaHYHFRBa25y+Mt5/kWt8Rc6wM
	 myKaNf0MjjJMvxyywcQF2KSjKKQZF9cpdYvbQc9EQY/ZcNwYER97B8l5Vmpu6MB3Mjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SdH1Q08JYIXzl7woAIVqMXKqevpqYl9Em5ExAHktt1c=;
	b=sawnxcsJ8iAGWUmepUfKYvcIvcXlHIUn/TErziOJdE6EBNHziocr5MHoYHWQoyPMpRC5
	 ILXQakSxZjljIdfwdzFUNYPaKIqD4EL9AOhC5vSvp61FS9Bx78OGFbbPiGXpdj+fnuwBV
	 xB6amcD4e7DfTNC8JDIhr2osQHQjiK3e2Ql4ygTIfdpce96amfN69Ks23B/aneqNYwnlm
	 lDFLyUeJbxiH4Gso/+/h5XmgH8NtqxXqTkMVtCZuhkE2P/EE7Dcm1d7h6ynr5NcF7VWOQ
	 9ysVY2Vw1FAmwRojld+dhr9dbcz6YxccHKVWal6w2qBSgtfXFbFoeQlZAKI64ST+Aig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LO/GHqYA";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7543C606D816
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 16:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7543C606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LO/GHqYA
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36ff9c9da34so2217888eec.1
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 08:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070652; x=1794675452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdH1Q08JYIXzl7woAIVqMXKqevpqYl9Em5ExAHktt1c=;
        b=LO/GHqYAqIw4mRvvRBHWuOMVha4/0/Fi7P6E0tJ5PpKEL4XjKr0zuy7j53NqIyGEPn
         GalzqySlwAi6F/U4404oaYZqyAkKYgQC0P2qHO6qkE/LBzrTq0vrGAeZw5sB1MVnNNwa
         3Nf3YiG5ZPqnuv2m0Q1l5s3CRhe5FPex+uq7/qZ63sOy2nRH8WDLHO6Q7SN0OIyyw/7w
         P0XxE2MCJCsjqsAko1DgCDIHhtLALTa3OzGfJQEd5sedu5uhJwhbh1Rb4vt959dCczXO
         YSUQdRal3c/K9lAciPTxWMrXpAZewvNoINV9rPH7bpBnu9eNUeEIDqCLCYAxHTpUmdj6
         tO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070652; x=1794675452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SdH1Q08JYIXzl7woAIVqMXKqevpqYl9Em5ExAHktt1c=;
        b=cJZllClVGfhFDlK6+JEzd59PA/9uJdq8+ASXlb6AMk53OAiM/6L4OBH4Z0+ZImnQAE
         XplZOiEJrBUbf7ENWOhyItAj9pd2P+tVdjm7tliniCKIgEAkxSYxz0oHK02jL880ZzwG
         7vEMHFVNrVruvcFhfZMUt1Z/Vfx7FPwBru7NzC5TCdjbcvRR6p1tZPbtlH3UR+cxzHgR
         16z9pUZU2+H/5WOX+bv1FM2lgHnxacT6lqhycy3n5iUr4INvn6oi4MbAapq1nGZaE/cT
         f/He0DOkCpknshobCOlY6r/6XongnzIObI9hvyBBsYxjEe1m2zC8SioEtI3Ojf8V3oOp
         XxNw==
X-Forwarded-Encrypted: i=1; AKwUvBzNF2E9M+rlyhjWQRCr0ghKcSEJ//lZgGRiRKYmJ3nJ+7DxTwQnJ1VHEqCEv5TeJSJOhL4lAux2XBkBozwY3kU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lvHykYRfQBPdd6fLDCpgjAmmJRxSb20tEwFdi/XA0zUiydAAG
	ag1qFHQSRgb2ArSQ0iEXSzRnRtE5QaSC0c0PFvkZSYZ5N0k+Q5Ak09lN
X-Gm-Gg: AYBFou2roLL6cIoBd86ZnIm7TDhbfH3JhWnCYXrKCFHlyJcONnWhwbpO7L375B0yESJ
	fGXAb6j/odJ0nWhZ7nIM2HaJZM5LS7oFGu42z0/5NC6YRkejysKF5w0Xbzc+m06P1EWXZ6ej29j
	e4WSjhVN8P+3V4FAUIK9dc76occGS1H4EQxKqb7bqEXIKQEFPEbwO5B5+ByiSdBpkCmiEyix1Ph
	rfFYT9vNaZw/E2V+9V/j3ygf/cuKgFrZt/iwIEp1GTYhsFG0+Bb1dX6NUEjzXsPJu2S8dHJciNL
	6voW4MBxF8YwVPxaFVP8x/RXnUVD2290hSCE3YXKzbssUUd3e08C+r8IF5pDsg1TsYOFZmyvHjR
	AmWqRlgPgPlDzL7a0RobFzbrjqBSDMOt+axwU1D7EqqrupllYmLdPWvezKW299qUNQ6+pp9gQW1
	miH4pLLOMPdz47/bQeicm7TKOcWeUdSqZcTrn3aS9XIpQHlAOyPOQvHEh4Y8ghneUpuWlyEgue7
	/hj5SB0yZ0Qs8eY+iV/RJVPDY+wyVwYlWbCla8iSJfndd/USRWoXHG/Bq/c08LFTTe8S49n/0w6
	BygoY9DPe5YrNDvWfS4ziKb4
X-Received: by 2002:a05:7022:3c12:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1b25d3445demr7016509c88.30.1794070651262;
        Sat, 07 Nov 2026 08:57:31 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4b4aa7sm15456126c88.13.2026.11.07.08.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:57:30 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sat, 07 Nov 2026 11:57:03 -0500
Subject: [PATCH v3 4/4] selftests/mm: cover merging KSM pages aged by smart
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
Message-Id: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-4-16d5ce8b5fd6@gmail.com>
References: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
In-Reply-To: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

ksm_functional_tests checks merging and unmerging with ksmd's default
settings, but nothing there exercises smart scan, which skips pages KSM
has failed to merge for a while.

Smart scan used to time those skips per page, so two identical pages
that became mergeable some scans apart could end up never being looked
at in the same scan, and were never merged. "mm/ksm: align smart scan
skips with the scan number" fixed that.

Add ksm_get_smart_scan() and ksm_set_smart_scan() to vm_util, and a
case that enables smart scan, lets sixteen unique pages age for a dozen
scans, then makes a duplicate of each mergeable one scan apart, and
expects every pair to be merged 32 scans later:

  kernel               failures, two boots
  before the fix       20/20, 20/20
  with the fix          0/20,  0/20

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/ksm_functional_tests.c | 89 ++++++++++++++++++++++-
 tools/testing/selftests/mm/vm_util.c              | 32 ++++++++
 tools/testing/selftests/mm/vm_util.h              |  2 +
 3 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 31c06c72203fd..135191f99962d 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -695,6 +695,92 @@ static void test_fork_ksm_merging_page_count(void)
 	munmap(map, size);
 }
 
+static void test_merge_aged_pairs(void)
+{
+	const unsigned int pairs = 16;
+	const unsigned long size = 2 * pairs * pagesize;
+	int old_smart_scan;
+	unsigned int i;
+	char *map;
+
+	ksft_print_msg("[RUN] %s\n", __func__);
+
+	old_smart_scan = ksm_get_smart_scan();
+	if (old_smart_scan < 0) {
+		ksft_test_result_skip("smart_scan not supported\n");
+		return;
+	}
+	if (ksm_set_smart_scan(true) < 0) {
+		ksft_test_result_fail("Enabling smart_scan failed\n");
+		return;
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
+	if (ksm_set_smart_scan(old_smart_scan) < 0)
+		ksft_print_msg("Restoring smart_scan failed\n");
+}
+
 static void init_global_file_handles(void)
 {
 	mem_fd = open("/proc/self/mem", O_RDWR);
@@ -720,7 +806,7 @@ static void init_global_file_handles(void)
 
 int main(int argc, char **argv)
 {
-	unsigned int tests = 9;
+	unsigned int tests = 10;
 	int err;
 
 	if (argc > 1 && !strcmp(argv[1], FORK_EXEC_CHILD_PRG_NAME)) {
@@ -753,6 +839,7 @@ int main(int argc, char **argv)
 	test_prctl_fork_exec();
 	test_prctl_unmerge();
 	test_fork_ksm_merging_page_count();
+	test_merge_aged_pairs();
 
 	err = ksft_get_fail_cnt();
 	if (err)
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 1c2bac54696dd..490e3c7161e8d 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -984,6 +984,38 @@ int ksm_use_zero_pages(void)
 	return ret == 1 ? 0 : -errno;
 }
 
+int ksm_get_smart_scan(void)
+{
+	int smart_scan_fd;
+	char buf;
+	ssize_t ret;
+
+	smart_scan_fd = open("/sys/kernel/mm/ksm/smart_scan", O_RDONLY);
+	if (smart_scan_fd < 0)
+		return -errno;
+
+	ret = pread(smart_scan_fd, &buf, 1, 0);
+	close(smart_scan_fd);
+	if (ret != 1)
+		return -errno;
+
+	return buf == '1';
+}
+
+int ksm_set_smart_scan(bool enable)
+{
+	int smart_scan_fd;
+	ssize_t ret;
+
+	smart_scan_fd = open("/sys/kernel/mm/ksm/smart_scan", O_WRONLY);
+	if (smart_scan_fd < 0)
+		return -errno;
+
+	ret = write(smart_scan_fd, enable ? "1" : "0", 1);
+	close(smart_scan_fd);
+	return ret == 1 ? 0 : -errno;
+}
+
 int ksm_wait_full_scans(long nr)
 {
 	long start_scans, end_scans;
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 7e00030077d2f..ab1325dc65800 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -163,6 +163,8 @@ long ksm_get_self_zero_pages(void);
 long ksm_get_self_merging_pages(void);
 long ksm_get_full_scans(void);
 int ksm_wait_full_scans(long nr);
+int ksm_get_smart_scan(void);
+int ksm_set_smart_scan(bool enable);
 int ksm_use_zero_pages(void);
 int ksm_start(void);
 int ksm_stop(void);

-- 
2.43.0

