Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7A327280A;
	Sat, 19 Sep 2026 00:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777536; cv=none; b=b20CkehBM7c1YQzOZGmCvLVt85Flq8DoecxlRE2f9VEPH2yd0SgJ91c9tYtin4hAXEm5/G/pELX7lGgBO/5gouTrx3Sw0HpAKG6pvs04q4ZAElEmOo51ieKvKaNnchQe4lzwOt4kYXxfWgY1ItEbfW7h0xpp1APRXEZLC7BpVtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777536; c=relaxed/simple;
	bh=6h3AsLvNob4o9n5kE4I7Sb+wFTfjJdGPoFllWv+34jY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jkx8wOqzI9OvXBdp7ZoNg5RSuKX3JQ1u+Xl3B9piIx0CSPJPJnRy11ksXTjGV8JeNDBl4ARRQVNfw9/Bdj2hzvjKtE3LaAqeL8SVz0Q1RYHPKmgTpvqJZcmt6azbhFrSZIzuMbBK33PHnnv3GxZ2UL/Yc/gmEdKc/Z07skUTeKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=mbqnUeIX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GZ3A7Gqb; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="mbqnUeIX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GZ3A7Gqb"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1747E1400165;
	Fri, 18 Sep 2026 20:25:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 18 Sep 2026 20:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777530; x=
	1789863930; bh=ufxG1px/IbSsOIWc/2sGIs7BPQfcDu7SsQiuBytVLoo=; b=m
	bqnUeIX3B+AS2eiWoVa88fUnn1LmIaxXhlQMnXqoP7zRENalwX7ApfFe+6KCSZ5K
	GS0UR7yuS6MDttmCNOz6WkjRFtPvJi0ozkDDuTsN+5BmXCPZM99HnQ/v4UKHPWED
	hOCYx0TwXKuiQC691tdb/Q5I4PuhH9h+MViSLui0CrX4kPJEoIWTfLRByDZp6rJo
	Lh+eMcF6aeuiiN00EXRgFPIBCC9A+WpGgafpORXeqCseDWJgay65LpBB0i/KKXfG
	2S41/zSoplg3wUEzzwXhBbuexYs8nTvcCOr1llleWTAUVh7FNCKrBW5P3fvgt/wD
	aaXfLRc/4sXXzunQ1nHaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777530; x=1789863930; bh=u
	fxG1px/IbSsOIWc/2sGIs7BPQfcDu7SsQiuBytVLoo=; b=GZ3A7GqbeiaN39XlB
	vs6pqwn818UhRER3mMC14qSWEjU8A3yrgTrDDJ8EwdgikDzKkuZ0rLaJ0FAEa3Yf
	h/LFQmmTn0hrkxa4RH6DsCVTp81f40VfGLdxjG4+QvScsqwinRmEWWDodCcIjuk+
	4mvWfXB3YGna9dofBydJFNeM2JHrlSRS0OUEG3Bd10tM3dJeFDPql3hXBGn051vZ
	pW2dkpZHaDhG23vrx9wxwr372mBedSNVz8RqkUkL2RO2XaPkeaCNMprHs1Ypbi2o
	+SfIhuill2aSeqwtt+Vd5GrZSLDesAnFCfLoQzta+7ZG+U8iSmEbdbdDMnrCVjts
	/BUlw==
X-ME-Sender: <xms:edataibEh1Jf4dQkaeQHURpRLgWo3Y6UJ5i5s1vvFlsQ9bWTeqQoRA>
    <xme:edatatxAVU9M77EHYmAv2cbOIOfAJ2LHSgg_aXYFj3upGh34tQTG_WYsWCLUbO9f6
    nBv6ltCnF9Yvt-szdzdQGqmTa9DNrdrb4V3q5WfRaYF_K17Hk_cJEs>
X-ME-Received: <xmr:edatavKdJh0Dgicrs43mLhv1N3uexpO1FbYf_X0sZ9_Ac8POPwuvhytqoAE>
X-ME-Proxy-Cause: dmFkZTFyC+XeKYnZ766rqTYe4SsoatN0doBd7ADemiperjFlmE10ggdkgYpZeWmNOU4aBc
    lm02WEvCO2QGG+A0SGXMzCjVWjDSVCQ5WJ/xmSMbLZJLqVjt5aEnrGd0hUbHPJ/ejcqjFa
    xrmYY/YNxh9EpvRrTjNMqslNp6oZ1XKAjj0b9YUD/U+Umt4HJhNRFStrIx7jR3Gf+CAD8k
    /TwEvtSve0+WgA7utVqBt9LeXDUSIUkf7dn/1M9JWIyORT8Kp2cNKrwYutOzK/Z35sBm5S
    qWNICJAq9yYROUOkEgx1cQSYtjkPP2DMZwKGXS3JxTiE+xMdBmJUepOSBHs3/DvnVTIMWh
    knMy8hezREC8xLos5iJLzU0pvnkntBZ1CmYDMNQQB5vgpf+cSpSatuEUu4n2Rwovhj5ZWB
    rLqO0pR+NBc0xV58OOlGf5KrKV7WHNRBL2k+FMBT2XI5CGpJj29oXJx4Rb24l7tXwjUitM
    vQotH3iBuCJWkcXckW67rCOx96tauCl+BdOq2Uk+5zHD2wmmkU6wRDA8KcTfBinaysDgOe
    LKYnL/uVTuCsp483J25Ot5qaClGU/e13U9aMtEEXj772wDku9anRx/ugiwvgz9jEJ069lm
    +ijZefoHgqcpFVB9VAzHcC7pTVrIlRe9y3Tlb+IFijqwXSm0SFPbcrI4tghQ
X-ME-Proxy: <xmx:edatasfdzoMAVJ4YAeuNhv_xo2H47GGCcezJGwmf0Ji6-k1CREO8Wg>
    <xmx:edatavugmkmf9Y4ekqD7-aasCk79AYBF22s9vqJLuaUY8cqqO7tOaA>
    <xmx:edataiFs65guH17NUHQQeuQiAY6UFdyUNSP6BN_gfJThERJIQ1zsow>
    <xmx:edatahdawI8guVi1vGuX9RyuS-HdEeFgAm3GYaQslLVkU8AKQDgi3g>
    <xmx:etatassrALye0VUpJe38xLVRn_eHgj_GHpE93grE49flqr6aMjuk2-6S>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:25:29 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	Usama Arif <usama.arif@linux.dev>,
	"Nico Pache (Red Hat)" <nico.pache@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	kernel-team@meta.com
Subject: [PATCH v6 17/19] selftests/mm: race the collapse of windows with holes
Date: Sat, 19 Sep 2026 01:24:47 +0100
Message-ID: <20260919002451.496763-18-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919002451.496763-1-kirill@shutemov.name>
References: <20260919002451.496763-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The harness pins max_ptes_none to 0, so khugepaged only collapses a window
once every PTE in it is present.  A window with holes takes a different
route, and never gets raced.  A hole is zero-filled in the new folio
rather than copied.  Which slots count as holes keeps moving under the
racing MADV_DONTNEED, right up to the moment the PMD is detached.

Run both ends of the occupancy scale for every driver mode, one after the
other.  mTHP collapse supports only those two, 0 and HPAGE_PMD_NR - 1, and
coerces anything between them to 0.  Each result says which end it ran:

  ok 1 stepped/strict: 5s, 231 steps, no corruption
  ok 2 stepped/holes: 5s, 194 steps, no corruption

Assisted-by: LLM
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged_race.c | 32 ++++++++++++--------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index 66c9e2c10f66..6575045c0482 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -236,6 +236,8 @@ int main(int argc, char **argv)
 	const int nr_threads = ARRAY_SIZE(thread_names);
 	pthread_t threads[ARRAY_SIZE(thread_names)];
 	static const char * const all_modes[] = { "stepped", "free", "madvise" };
+	static const bool occupancies[] = { false, true };	/* strict, holes */
+	const int nr_occupancies = ARRAY_SIZE(occupancies);
 	const char *one_mode[1];
 	const char * const *modes = all_modes;
 	int nr_modes = ARRAY_SIZE(all_modes);
@@ -303,7 +305,7 @@ int main(int argc, char **argv)
 		 -1, 0) != (void *)mremap_scratch)
 		ksft_exit_fail_perror("mmap() mremap scratch");
 
-	ksft_set_plan(nr_modes);
+	ksft_set_plan(nr_modes * nr_occupancies);
 
 	thp_save_settings();
 	thp_read_settings(&settings);
@@ -311,8 +313,9 @@ int main(int argc, char **argv)
 	/* Base of the settings stack; the bottom entry is never popped */
 	thp_push_settings(&settings);
 
-	for (int m = 0; m < nr_modes; m++) {
-		const char *mode = modes[m];
+	for (int run = 0; run < nr_modes * nr_occupancies; run++) {
+		const char *mode = modes[run / nr_occupancies];
+		bool holes = occupancies[run % nr_occupancies];
 
 		thp_read_settings(&settings);
 		settings.thp_enabled = THP_MADVISE;
@@ -322,12 +325,14 @@ int main(int argc, char **argv)
 		settings.khugepaged.scan_sleep_millisecs =
 			strcmp(mode, "free") ? 1000 : 0;
 		settings.khugepaged.alloc_sleep_millisecs = 10;
+
 		/*
-		 * mTHP collapse honours only 0 or HPAGE_PMD_NR - 1 here, and 0
-		 * keeps a step from being spent on PMD allocations that racing
-		 * MADV_DONTNEED will not let succeed.
+		 * mTHP collapse honours only 0 or HPAGE_PMD_NR - 1 here.  The two
+		 * ends race different paths: a strict window has every PTE
+		 * present, a hole-heavy one is mostly zero-filled.
 		 */
-		settings.khugepaged.max_ptes_none = 0;
+		settings.khugepaged.max_ptes_none = holes ?
+			(hpage_pmd_size / page_size) - 1 : 0;
 		/* One wake, one pass: the playground plus the forked children's copies */
 		settings.khugepaged.pages_to_scan =
 			nr_areas * (hpage_pmd_size / page_size) * 8;
@@ -393,8 +398,9 @@ int main(int argc, char **argv)
 			check_page(i);
 
 		ksft_test_result(!corrupted,
-				 "%s: %ds, %d steps, no corruption\n",
-				 mode, duration_s, steps);
+				 "%s/%s: %ds, %d steps, no corruption\n",
+				 mode, holes ? "holes" : "strict",
+				 duration_s, steps);
 
 		/* The next mode maps the same fixed address with its own settings */
 		munmap(region, nr_areas * hpage_pmd_size);
@@ -404,9 +410,11 @@ int main(int argc, char **argv)
 
 		if (corrupted) {
 			/* Memory is suspect; the rest would prove nothing */
-			while (++m < nr_modes)
-				ksft_test_result_skip("%s: skipped after corruption\n",
-						      modes[m]);
+			while (++run < nr_modes * nr_occupancies)
+				ksft_test_result_skip("%s/%s: skipped after corruption\n",
+						      modes[run / nr_occupancies],
+						      occupancies[run % nr_occupancies] ?
+						      "holes" : "strict");
 			break;
 		}
 	}
-- 
2.54.0

