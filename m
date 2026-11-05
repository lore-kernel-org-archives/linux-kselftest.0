Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871388;
	b=UrTDJMB8LGsPXnXb6E0JenuPbHH4/IJSSV7vvXXrdHxaYo2Z35BgowUGCh7l0q0+K8DY
	 AcC+N3HSsc99qJ/kowBUQJG7UfSXsYgFJ5qkefF62I8PahsAK/xEp+ETi56jEpK1yLQsB
	 45LFQT0biEA1kA1g4KhOF5qegVIgriDctxr2FrzL/qLTW7SQNiM756KK9L61Ya7ORcqvi
	 3UYKtNMfWnDQCTSOOLsZe07FbJlDjYqjMAb0bWH6uwBdfzuCE8ZZoWkoqB2pR5BhfsLNU
	 mK3A2M9wjGrvfR9dCGifGxA5eDNhGmNTwFNYbbtKmza14fi21y6tvpF5nIbGl/FEb5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4KJTaDWQfowBpNKiHyeX0a8ZzSqnSx/3I5gx7OWVH6c=;
	b=RF43A1Cs7C0RiNxOWMAjxF27+LTiU8749uLzfJ3DeeL4IoMdyL6osojtWe7Vb9m7XpKN
	 goQu0bOcZPzoagTtsTeoMnuMTrWzs0AejPvfBqJ5slczU9I/mMiluA8vhi+LLBTm55vfw
	 nPeknM5w9z+s8eZTocAs0u3mjRIAGygmKrhZ3cEii1vn927ms5B/f1SL7wQ/7LroY3cBe
	 /s5viIyZsrQaqocOGDc8mc6i0zkvJvtzJfuzykd7DJx2Z+fBQq/PVVbyv3ldvQTyMGktD
	 mx8SlgHQfohQJ/oxm8fEEALQU8FQreamj7n7C1dQZxb5ArIA8FPeI7NWPq1hb9gD1EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LmVv2yz/";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DAC606A329
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64DAC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LmVv2yz/
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1931ff67a29so455850c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 01:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871387; x=1794476187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KJTaDWQfowBpNKiHyeX0a8ZzSqnSx/3I5gx7OWVH6c=;
        b=LmVv2yz/U/iitjqnf0ntZaDdx06FFYpU8E1jMWKq10rTidJKkCLK6H7bE4C/XedCrq
         mRULmcrGzO01O1k5eFACyPIXa6VLNeCpdSVE95gJ03MrnhC41SiD+AIK2CUUmYNOSGFI
         K4aSlS8kMkhPd1ISnkWAsh645+jowTpn6xOmDWagAeCfdVswZkvzhbsfrPDAaGnNj2ue
         7qxTXvFfcvZe9BZS7L/6Erk9nnWgFa2l71JbKKVTsK/b7OU/75n76zTMklm752TWzsic
         J39gBMxk0qRIuRKd96qTvuWwpd4DEKqt4MOOD3EVmAQPs/fQRdtgJp3fbIr6T4gHpiui
         B4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871387; x=1794476187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KJTaDWQfowBpNKiHyeX0a8ZzSqnSx/3I5gx7OWVH6c=;
        b=B8h5WCmVfq5j4Pzv9frIPG7tAnW4ii+o6P5eTqmD6BliaKfpm2+WDVO2KOINaO5WrM
         eIOZc04H9WR7VvODiKpytuEOf0hn2dVFgAVpearoz3JirrTEl6xr0BXvgqtwViSohmKG
         S7Jn8H6LIzBCeUFSuhSgg9E+RIm6OvgHml16apZj13DQgVHzT5FNdCntTb2u3fj/t2QL
         udI4HWazWPugQDROZY5Vor/GwE8LfNt1AZkgoohpUQyH5MiIl26DxVzPlvOB7xw+sha+
         dV2yxA1Qjc/vqrrWkYdmxjAlKRd0x6Uo9pP1nIW7FETzZsFGkeIeXWUebwOxp0JeDBRl
         mMsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCFxjRxqcZWODQeLYsQ56Q4P4cIpCdZFXnnd+KjXR5h0En7zrcF8KmlPMUNvJ2gSCKCOiDyqr45NVIlQzjKRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m1X+jCh7F5xjOrsfvZIM4iOQUqjJU3nXGQ3fvqtofzXuWIr+G
	RiHFWKa9x93T1cllS7b+v/QPoBu3tAAyfBQrPsmRVki6oXT0uHkPrmY+
X-Gm-Gg: AYBFou2TwQW0Z3YzyW6rTqzZ3rO88iErX3xlYes5C+MSnqcjU0YAf2wI2vTxMfat86p
	nC/w6T0+pgt/DJCmbsf8XilEJcQJbowWlJpigCb8v3tW9QDksb6ZzIEbjom+uIsigrwRl1ZJIdq
	g4HfFlIGBXibM4YKmmpvIrdbjhwbGD5OaSgwSqFaz1B0+NYDIkcVQP+23DwxLJ9XTocdcDjcBR6
	dugUX4xZwaF32flcAV4k95TYJnkDFdc2kXJoSA2XIcOWN1Q1bdrs6TWhU82rTfyF9Vjj137h9zb
	UYszk6H4vEE0BHPvoalvOrcGJc7b3SdP4Mqd0e04VM5Iy97qss966UkdSBfiR2HGdtYfHObzG8P
	Wm6c/4JrfafJ4g3Icgf/v1so/9dPnfkiystcH9Xr40+U1pebGa4Kk50xeOgbmbQizMOpZp6g3h4
	YrY06W+COfoCQSKsrN8J2ItboRXdgFvjYAltPIkVyXwLwjVtFXosmg/fclPTXoAdDmDrzo0JnGF
	SWuAkaW760a2iz+obDJStGi6ckInJxBAjedcrjh2JuIroyoh4CWAP8sH21J7WYRbj1vjt6KUkzu
	/GGUd8E84QfxhURLs8ukiVjW
X-Received: by 2002:a05:7301:160d:b0:36d:dd5a:4528 with SMTP id 5a478bee46e88-36ddd5a4f34mr3326051eec.7.1793871386171;
        Thu, 05 Nov 2026 01:36:26 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm17363207eec.16.2026.11.05.01.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:36:25 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 05 Nov 2026 04:36:14 -0500
Subject: [PATCH v2 1/2] mm/ksm: align smart scan skips with the scan number
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
Message-Id: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-1-8a9780b6844e@gmail.com>
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
another 64 full scans shows this, on two boots per kernel:

                                before            after
  pairs merged (of 420)         329 / 317         420 / 420
  64M of unique pages skipped   89.0% / 89.1%     87.5% / 87.5%
  ksmd CPU time per scan        6.25 / 6.25 ms    6.88 / 7.03 ms

Pick the skipped scans by the global scan number instead, with periods
of 2, 4 and 8 scans. The periods being powers of two, every old page is
looked at on each scan that is a multiple of 8, whatever its age, so any
two pages meet at least every eighth scan. The longest period goes from
nine scans to eight, which costs 10-12% more ksmd time on memory that
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

