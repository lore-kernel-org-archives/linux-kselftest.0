Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C066D3546E9
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 14:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161316; cv=none; b=NjE+zvgQXaiG3HIu66Gcj5CK2hjzuyXJK3HgkFCbmbpl0x7PPgBbS6DLfvosU0ExP5/5kl7Q3KetQMR4b4T1Hc0enFfFU1e6rCZhVkHbBScb9d3SN4MoZECmW1kP1waMff7BF72JFuKsgmQXVOZ79R/Jxr6o1ZOgWe73WVNMb4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161316; c=relaxed/simple;
	bh=rP+tH+1kFhQF59zEL4/vZWctLbCE+QLVPE1LtyiTpGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xjm4yRof7ScVzFIbgrzFjeT3kppDcCGyzyObz48ZKOyx+JKzldtd8QT4uLr9CO4Dyg04Re9oKmDy/42WCdUX1W7IDwPpca2+B8Kad5HtfdNCA2+GEJ8gKnHS9vC4R2+skHCb1qxYZzqbTW2rgyMnkvN74lruTXfU77FmTF8LMRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCTRVrKg; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCTRVrKg"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-353804b591eso11289903eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 07:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792161314; x=1792766114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45yjWNO0nNHXei6UzhNbwOEuF+X6mrmEeZx1XWQKEss=;
        b=cCTRVrKg8a1trQln+fmC/LIlXBk63UzAWwZ1Ad5sLssTxyTDM0LSzo8RvQNghHstzG
         3B/0X66+HxWiETWA8vj1sik4XwG3BhF/E1hzfQX5TN/KtWOrO8/ZX43C2R2vR/oq18hj
         4yEVHVVs/bHt5lR51i81Cscg4kBSYFzbZZIFZ7L8P1gK20ADDYGxt2YNY4BKme+0w7HO
         EFuQ6wv7O4fSa965lWkdYkvE6rVax8L3As5tIt+6FRdZxIWhM6uq8atYZllq7xOSkY9B
         1jZgXQWYTqjVhBXHCD+Y5ZSQunz/D/aCpgLk4sS5rIP1P2f7G9DlzX4JPI5w6QUHwsQt
         F9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161314; x=1792766114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45yjWNO0nNHXei6UzhNbwOEuF+X6mrmEeZx1XWQKEss=;
        b=1xHIIuAveVr0Bvmuy3hg7ifx7dKz7eG8UKQMf2WOvdslcZj3+xWsEqQUy5VXa+3yvp
         itV+dsC545siGdh+UH5ydsKgQo2uMfm7KF/Ga16foNDpRuDqgxc5qb4XSQtIZmwOE4gQ
         YXcbu0nSpDkJABjCvMwxlmB2C8XyeyO+TEkk8icGxvWUFGrcg/2dzWyRAFzMWjK6CVH0
         Gvcv2MsrClTAPsRNEj9ZooPb8O+cZ59xNLRlXXp4RhEf9oyEl8m2zWfHlt3TQD90MmLA
         4M0aXYU6LHiZnauKSMrvcUvbwRLVNd7oyIgr8Hmp/0i6iGRwDv7EV639Bse4y4H4R/Ly
         vqbA==
X-Forwarded-Encrypted: i=1; AKwUvBwa/gmrAF/K1xhEqe+YN/se9CggnxoO3bNJs567S/mXTcz8LZf9/yWkU9MHzpRHtPMmfcfuNvnQvFl8/3UD6G4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbb+Rf03Dm/llcjZZ5Zd56jyp2t2EitPBdrcHQx4EhkQ4iYZzr
	afCvMns+JZ7kojeASl4a9J95DFnquA2uEmkvF0cZbSKy6aMcRgPcP7zH
X-Gm-Gg: AYBFou3Zq57n05pzvS5IwP0lf51uddvVFmwNG28Ibt97HfjxqygYC87c6+8hU8KGIpo
	/Hm/0VZowVm03krt8/UrkzzchUL7psgBE2cA4ud0nHGPTqjBwPP7ANo80eC8sBKE8Vg1oHi4l18
	8XWGHIHtok4MWwN3/izSgj9q8pQV35K40yXriva64PPU5foSLhOajGyJQYoBlYCo1dd86+d4SyU
	0+XNuoQzZ7KdvqacQy3R7ArAb6Te7x/EKryJ0OvhFPvt3JtjQrVEysh3pW6mzlD+1SBZtmPco5Z
	WR2hiW/fFI1TwT/8XLxqX9x1ak28OGwB2eeLmNrX1y0FzASyhXiegJlpk9LDAb0gxN0DNqZrgUm
	fBNtDQ78D9K4z1zM/N0LA/IaoUNIF1nhtwoAeJwqniEWBnoC3tuEE0Ay8gASo5TVmXZgi3HkK/b
	7CivnKYgVaNy+Ka80TXKqkfhSmXNbZcRSOIw6h3uYt5sO6OOESjjU+pZ0fYPGLyrEZAT7IyiCEX
	TlINTmu7P09GpnKk/BsWQHZpGSXcH31+P4D3OPb97GFL4kzFmY=
X-Received: by 2002:a05:693c:2a13:b0:35c:99e1:c755 with SMTP id 5a478bee46e88-35c99f11cd8mr13996357eec.38.1792161313598;
        Fri, 16 Oct 2026 07:35:13 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm7611812eec.23.2026.10.16.07.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:35:12 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 16 Oct 2026 22:34:56 +0800
Subject: [PATCH 1/2] mm/ksm: align smart scan skips with the scan number
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-bug-mm-ksm-smart-scan-align-skips-v1-1-2f91d76416be@gmail.com>
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

Smart scan skips pages that KSM has failed to de-duplicate for a while.
Once a page is three scans old, its rmap_item counts down its own number
of scans to skip, 1, 2, 4 and then 8 as it ages, so an old page is looked
at every ninth scan.

The unstable tree is rebuilt on every scan, so two identical pages that
are not in the stable tree yet can only be merged in a scan that looks
at both. Each countdown runs from when its own page became mergeable, so
two pages that became mergeable at different times end up on different
phases and, once both are old, may never be looked at in the same scan
again. They then stay unmerged for as long as they live. Making a page
mergeable, waiting for 0 to 20 full scans before doing the same with an
identical page, 20 times for each wait, and checking the pair after
another 64 full scans shows this, and so do intermittent failures of the
ksm_tests "KSM NUMA merging" case:

                                      before     after
  pairs merged                        317/420    420/420
  ksm_tests -N -m 1 failures            3/200      0/200
  64M of unique pages skipped           89.1%      87.5%
  ksmd CPU time per scan              5.9 ms     6.3 ms

Pick the skipped scans by the global scan number instead, with periods
of 2, 4 and 8 scans. The periods being powers of two, every old page is
looked at on each scan that is a multiple of 8, whatever its age, so any
two pages meet at least every eighth scan. The longest period goes from
nine scans to eight, which costs about 7% more ksmd time on memory that
never merges.

Fixes: 5e924ff54d08 ("mm/ksm: add "smart" page scanning mode")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 mm/ksm.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index dbfb8f98b1892..a97d7563c2124 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -196,7 +196,6 @@ struct ksm_stable_node {
  * @head: pointer to stable_node heading this list in the stable tree
  * @hlist: link into hlist of rmap_items hanging off that stable_node
  * @age: number of scan iterations since creation (unstable node)
- * @remaining_skips: how many scans to skip (unstable node)
  * @linear_page_index: the original page's index before merged by KSM (stable node)
  */
 struct ksm_rmap_item {
@@ -213,7 +212,6 @@ struct ksm_rmap_item {
 		struct {
 			unsigned int oldchecksum;
 			rmap_age_t age;
-			rmap_age_t remaining_skips;
 		};			/* when unstable */
 		unsigned long linear_page_index;    /* for reverse mapping, when stable */
 	};
@@ -2446,16 +2444,14 @@ static struct ksm_rmap_item *get_next_rmap_item(struct ksm_mm_slot *mm_slot,
 }
 
 /*
- * Calculate skip age for the ksm page age. The age determines how often
- * de-duplicating has already been tried unsuccessfully. If the age is
- * smaller, the scanning of this page is skipped for less scans.
+ * Calculate how often a page of the given ksm page age is scanned. The age
+ * determines how often de-duplicating has already been tried
+ * unsuccessfully. The older the page, the fewer scans look at it.
  *
  * @age: rmap_item age of page
  */
-static unsigned int skip_age(rmap_age_t age)
+static unsigned int scan_period(rmap_age_t age)
 {
-	if (age <= 3)
-		return 1;
 	if (age <= 5)
 		return 2;
 	if (age <= 8)
@@ -2505,17 +2501,17 @@ static bool should_skip_rmap_item(struct folio *folio,
 		return false;
 
 	/*
-	 * Are we still allowed to skip? If not, then don't skip it
-	 * and determine how much more often we are allowed to skip next.
+	 * The unstable tree is rebuilt on every scan, so two identical pages
+	 * can only be merged if both are looked at in the same scan. Pick the
+	 * scans by the global scan number rather than per page: the periods
+	 * are powers of two, so pages of any age meet on every scan that is a
+	 * multiple of the longest one.
 	 */
-	if (!rmap_item->remaining_skips) {
-		rmap_item->remaining_skips = skip_age(age);
+	if (!(ksm_scan.seqnr & (scan_period(age) - 1)))
 		return false;
-	}
 
 	/* Skip this page */
 	ksm_pages_skipped++;
-	rmap_item->remaining_skips--;
 	remove_rmap_item_from_tree(rmap_item);
 	return true;
 }

-- 
2.43.0

