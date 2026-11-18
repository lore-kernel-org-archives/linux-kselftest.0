Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794961580;
	b=QydAADTQFEWgFm3TTJbHLIY9IGAuhO2Lm3hFLBn5FK2aqkYMsvV19XMeLabu9THy8kMp
	 0oneJGszYTY/Tw1eHkwpc03Vfw57HXcvWNbRhJMsmVEEocqQXFvSvtqjuZtkJTlFnJrmL
	 A37Jwk4u8/BHgTkSTF1jia9U2Ke1lcW1kXl0duWLUpOKE8UvlesCeei5vrGrMEKiFnZ8s
	 P+Hw1MFt2fDBOrREYWXPI4/jeb6bg/RzOdcbqFMpU7XB8cCd4m0vZwN91Xfzvxtv806w/
	 lnDcR3gG/ijKYwb2MJ/NvkNGtIp/3SuF0FCTB9xyWa47T+9VqQQX+uY25OEULdmygRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961580;
	h=Received:DKIM-Signature:Received:From:Date:Subject:To:Cc:Message-Id:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yjJk9mmqwIA6tlXuJLnvT93Ny9bjpeUE9ULmreaqulk=;
	b=tEJ3nAB1GBRfpNtFoy33lOgXtV8lxJrihZg9c21MojiUFnSh/YeN0DySD1/rflxMpyR6
	 RZ8qoALEGT+sHbTcDu7tVJ3P4bRpXxYl+CjrktqTJaJDMgl77NPHHIu5+VzdIl31mpSXr
	 trmcHvA3E8zPgfjSPlOjLCsyl6PUiw1t/cT3abtbi19sLgm/rhCJZTBrER4RSYJWAQixX
	 u/Kd7SLsB23umQvtTORKNALtCBMm4WKlEnK94E9Z2+V6iOLoF8TiJ6ct/hDBZc7TwJA2l
	 qtbfqDCh0t+HoNbDSkNyxtB30TEyk74H5xeKYhe/8gROgEdTOsKMldxmCa5qRBk00fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="crO6+6N/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BA4606A880;
	Wed, 18 Nov 2026 00:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crO6+6N/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794961579;
	b=SG5yjTW8JJBD+z/aMo3GsQ6eF2ElHJD/2vHeqKYC2ggLfDMSugIBgQLKEuXlcqdZTZ5B
	 OZFqptT+THZ7WZSBJzEL+fAW13jY9Gk3ri2SWNDAF+l6uqvdTVYAiRtBddiNa44RKVT+p
	 SQ972A0mUiLflpoH3RW3vFom8Y3EAJC96MQyi2LJcYLwAOLf11YlXwEzplH1eoskGo1Tv
	 14QT2pIaJ+FlJ8rxTrcY8mdan6wufMNIwDNjbP4XJiHTHGyi/oQOJIzPu6938OvaURoMw
	 95O4ugNiJEVsvAF3kGH9+h1YGaRZshPFHb0m7pZkubIa6p65MZGtCWfhufgR/gejZxA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794961579;
	h=DKIM-Signature:Received:From:Date:Subject:To:Cc:Message-Id:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yjJk9mmqwIA6tlXuJLnvT93Ny9bjpeUE9ULmreaqulk=;
	b=on8+ly/Vrc7oYMStH4CTe83GCuxHTaDHAynSjWpwC6NB9daUfkWmH3a7+8qqaUx1keHX
	 aPZ1JpOsen/DdSSiT6N9jaGUsAJEFgst+s0auQxupMMcpZOdUfU9nVSpKXM80kuioZBNj
	 6HfI+aw5fvmKu45ti/oBZGtPomukJeqW8r3pRITFvdViK9O/mCKnj0VZlIHNRYL7eNpo5
	 0UFxB8dXT1LtdjqQKAAXrRvcedwzAwE/MOsodXxTC2ol1IKfGrWyFY5fXu+/ZRk742sTQ
	 JraY4VHNePx/kpNogKtq/Jo/YaNAd770OP+tEf9bng+R+v8adT8Jfc95TgdIzsArsCA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64D471F000C6;
	Wed, 18 Nov 2026 00:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794961579;
	bh=yjJk9mmqwIA6tlXuJLnvT93Ny9bjpeUE9ULmreaqulk=;
	h=From:Date:Subject:To:Cc:In-Reply-To:References:Reply-To;
	b=crO6+6N/H8rwSzpIG9s9eCFt/+LVoxEnf6cIAeM9eCr2fpAIXv6qA2P+siYTABMs1
	 ERCmnzsEJZV3kcvtMO1RuVC3LG0r2o80z4PjXLs7VVtZfd949IVOW+E6Ci3kC/CMXT
	 nulMA7JxafqVwLHsypuLw0c7PHBnPVJtF+NebE8zf8N9NZVg7Nf7QRdHSRZKu9NfOW
	 2F90DgEgHCT1WBO82BX20503AXdUWgjAt8o9PBfjh6mIPJpUYrPQ4++P1bovAXlfFg
	 S/Fq4jwKPaHcXXbSPHkBPsvooeY/fx3hFAKOJezsdOfvcMh8NRG0eqN3m27tqGaNL4
	 LX9TPxZhqK5yg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E69424AB7A;
	Wed, 18 Nov 2026 00:26:17 +0000 (UTC)
From: Matthew Salsamendi via B4 Relay <devnull+matthewsalsamendi.gmail.com@kernel.org>
Date: Tue, 17 Nov 2026 16:26:17 -0800
Subject: [PATCH v2 2/2] selftests/mm: cover PAGEMAP_SCAN refill and HugeTLB
 retry
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Chris Down <chris@chrisdown.name>, Vlastimil Babka <vbabka@kernel.org>, 
 Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, matthewsalsamendi@gmail.com, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-kselftest@vger.kernel.org
Message-Id: <20261118-pagemap-walk-end-v2-2-94cd92d838b3@gmail.com>
In-Reply-To: <20261118-pagemap-walk-end-v2-0-94cd92d838b3@gmail.com>
References: <20261118-pagemap-walk-end-v2-0-94cd92d838b3@gmail.com>
X-Mailer: b4 0.16.0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794961577; l=4010;
 i=matthewsalsamendi@gmail.com; s=b4-kernel-20261117;
 h=from:subject:message-id;
 bh=NjI4ckbRiDH/qj/osMQWWUKd8BFP8IcXjX/T5XOwGbg=;
 b=mrjF2WrjZGFgovurzwg8O491bymKSYiw6D8PuPvt46rgg2nazqv8TPr8dKIckqMsNpfgMOKTh
 YEQcy8h++zCCbqFtnK/w6RdNSXJy1wNYLOihLNAAODzz4YDmq/jUmr2
X-Developer-Key: i=matthewsalsamendi@gmail.com; a=ed25519;
 pk=K4Lg4pTU46IL2CPz2Nb/u30nsnWJ38MlR2/Co4n0tto=
X-Endpoint-Received: by B4 Relay for
 matthewsalsamendi@gmail.com/b4-kernel-20261117 with auth_id=1555
X-Original-From: Matthew Salsamendi <matthewsalsamendi@gmail.com>
Reply-To: matthewsalsamendi@gmail.com
Content-Transfer-Encoding: 7bit

From: Matthew Salsamendi <matthewsalsamendi@gmail.com>

Check that scanning 513 disjoint dirty pages returns every range and
sets walk_end to the end of the scan. For a written HugeTLB page, limit
the scan to one base page, then retry from walk_end and check that the
whole page is returned and write-protected.

Codex assisted with the selftests, validation and this message.

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Matthew Salsamendi <matthewsalsamendi@gmail.com>
---
 tools/testing/selftests/mm/pagemap_ioctl.c | 61 +++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
index 03898b4f6cda..02062b178aa5 100644
--- a/tools/testing/selftests/mm/pagemap_ioctl.c
+++ b/tools/testing/selftests/mm/pagemap_ioctl.c
@@ -682,6 +682,62 @@ static int sanity_tests_sd(void)
 	return 0;
 }
 
+static void test_walk_end_after_refill(void)
+{
+	/* One more range than the internal buffer holds on x86-64. */
+	struct page_region vec[513];
+	size_t len = 2 * ARRAY_SIZE(vec) * page_size;
+	long ret, walk_end;
+	char *mem;
+	bool ok;
+	size_t i;
+
+	mem = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (mem == MAP_FAILED)
+		ksft_exit_fail_msg("mmap: %s\n", strerror(errno));
+	if (madvise(mem, len, MADV_NOHUGEPAGE) && errno != EINVAL)
+		ksft_exit_fail_msg("MADV_NOHUGEPAGE: %s\n", strerror(errno));
+
+	wp_init(mem, len);
+	for (i = 0; i < ARRAY_SIZE(vec); i++)
+		mem[2 * i * page_size] = 1;
+
+	ret = pagemap_ioc(mem, len, vec, ARRAY_SIZE(vec), 0, 0,
+			  PAGE_IS_WRITTEN, 0, 0, PAGE_IS_WRITTEN, &walk_end);
+	ok = ret == ARRAY_SIZE(vec) && walk_end == (long)(mem + len);
+	for (i = 0; ok && i < ARRAY_SIZE(vec); i++) {
+		uintptr_t addr = (uintptr_t)(mem + 2 * i * page_size);
+
+		ok = vec[i].start == addr && vec[i].end == addr + page_size;
+	}
+	ksft_test_result(ok, "PAGEMAP_SCAN walk_end after buffer refill\n");
+
+	wp_free(mem, len);
+	munmap(mem, len);
+}
+
+static void test_hugetlb_walk_end(char *mem, size_t len)
+{
+	const int flags = PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC;
+	struct page_region range;
+	long ret, walk_end;
+	bool ok;
+
+	mem[0] = 1;
+	ret = pagemap_ioc(mem, len, &range, 1, flags, 1, PAGE_IS_WRITTEN,
+			  0, 0, PAGE_IS_WRITTEN, &walk_end);
+	ok = ret == 0 && walk_end == (long)mem &&
+	     !(pagemap_get_entry(pagemap_fd, mem) & PM_UFFD_WP);
+	if (ok) {
+		ret = pagemap_ioc((void *)walk_end, len, &range, 1, flags, len / page_size,
+				  PAGE_IS_WRITTEN, 0, 0, PAGE_IS_WRITTEN, &walk_end);
+		ok = ret == 1 && walk_end == (long)(mem + len) &&
+		     range.start == (uintptr_t)mem && range.end == (uintptr_t)(mem + len) &&
+		     (pagemap_get_entry(pagemap_fd, mem) & PM_UFFD_WP);
+	}
+	ksft_test_result(ok, "PAGEMAP_SCAN HugeTLB write-protect retry\n");
+}
+
 static int base_tests(char *prefix, char *mem, size_t mem_size, int skip)
 {
 	size_t vec_size;
@@ -1661,7 +1717,7 @@ int main(int __attribute__((unused)) argc, char *argv[])
 	if (!hugetlb_setup_default(4))
 		ksft_print_msg("HugeTLB test will be skipped\n");
 
-	ksft_set_plan(119);
+	ksft_set_plan(121);
 
 	pagemap_fd = open(PAGEMAP, O_RDONLY);
 	if (pagemap_fd < 0)
@@ -1669,6 +1725,7 @@ int main(int __attribute__((unused)) argc, char *argv[])
 
 	/* 1. Sanity testing */
 	sanity_tests_sd();
+	test_walk_end_after_refill();
 
 	/* 2. Normal page testing */
 	mem_size = 10 * page_size;
@@ -1730,10 +1787,12 @@ int main(int __attribute__((unused)) argc, char *argv[])
 		wp_addr_range(mem, mem_size);
 
 		base_tests("Hugetlb mem testing:", mem, mem_size, 0);
+		test_hugetlb_walk_end(mem, mem_size);
 
 		wp_free(mem, mem_size);
 	} else {
 		base_tests("Hugetlb mem testing:", NULL, 0, 1);
+		ksft_test_result_skip("PAGEMAP_SCAN HugeTLB write-protect retry: no huge page\n");
 	}
 
 	/* 7. File Hugetlb testing */


