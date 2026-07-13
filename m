Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32A53EDE7E;
	Mon, 13 Jul 2026 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943323; cv=none; b=HgwL5vtuqiZKQMJ9RDGYhKrf33183CfOdX62RVPzJ12uUBizG8/oE7Kw7AthPKu+KvuLYpMhphzF17a7HnxCcl0qtlmLrBmiKKWnGgCJbOtSq3JLEEi4M/+yMo6XWe503h+IM1z9hQriFJdwVwLG1lets/FbPAV/fmTl88on+k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943323; c=relaxed/simple;
	bh=MfoHjzWLvzBg0lQMWcDC/wF9znVs8BNW7DCTyn2CF7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TR/6zSbK1355T1HBZ/zW1Dh9dWOWD1QhbHgTTwDS75RUvx49KJvCbKU0GarLLEdue4YL1ue2zrNKIHrLTeokCQN3x74UzWgj+PIuOcC+ViG7/b6IaLPpBg+DzFOIhRPXLQ56wbYUEoerQaBhGJJgxnu7WGwe44KCqrgGJZzGYuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ZoSryOM6; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="ZoSryOM6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=8LzjJcbcBOXrfLADuXXmAbo73ajPyy8OrPW+mEAjdK4=; b=ZoSryOM6Ov3DSqe5rhcu0hpRgy
	9nPDwffqAXSVVcZLie7XqTNa6I08xHjd8ztoSRCJrb5XVCa6NSJD3l0inU9tx5r+TF9ZIC/2d+flT
	tDUgXuwb2hOGsN81/uUdThVyxEa9RQhCGFcCWrrPrw0iXdj9zM377Yp9t2RR+NYdV5IhGo2GYqgh6
	h0bKjCg4FPrhCZ8ps92Yi8JLzIqg/l/v1ww1bKLaf7eETNsYxPVWzFJ+v8DU/XE3ponBxbujUfvgJ
	0jzNJp7sIPRbkvnwvcBUQEpoQ9QN6mdcRqAaVm+wBc9eTS2KtkC5w9c0Qi1yG255Z3FS/KG+g5QJI
	o2qPzl+A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wjF9C-001Tie-0A;
	Mon, 13 Jul 2026 11:48:30 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 13 Jul 2026 04:48:04 -0700
Subject: [PATCH 1/4] mm: kmemleak: confirm suspected leaks with a second
 scan
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-catalin_pto-v1-1-5b93b1131089@debian.org>
References: <20260713-catalin_pto-v1-0-5b93b1131089@debian.org>
In-Reply-To: <20260713-catalin_pto-v1-0-5b93b1131089@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=5439; i=leitao@debian.org;
 h=from:subject:message-id; bh=2Ik36nD5Ymen0igsLFiFN5pbHvbZF0V0k4IOFO34tCM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqVNCDe9n1M9YNOiQ/yUFY2MBL+A8LR6gq6LZuK
 UWDOMGVhmmJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCalTQgwAKCRA1o5Of/Hh3
 bRU8EAChIkFYicCYva6mq7aO2tlOJyY4KTdiQFZL5K3tXxDOFUh9nxGrlQOzkVvtyYfOsPiIrsD
 nfWCwHcQVbyWANPt4qyA0G3rTI+M9f7pfk4Q6PPmgM+gVKTFUNfVyma47kdgItlSycJNfqZLYiI
 Ex5W/qBFwdefN8ey2pxvRc02VreAv4XpDv9T77OqaCC75SzG81fI/qrpMRUcjoAZLZCJZdRb/O1
 vmWed4KgnZMcVKFOkQg8HYCAwxiwB59b110PPiZUFV6V0XIJYrWMeg6aKxm2BHUou7y/fP1E+3j
 L8Q2WPjllunX66rVivlHMCS7gdBlZnpj5JEcUAUN9aNSj8McwdI5cI5vsung2EUM4PomAb2wDnB
 GED78mm8KOr+I6iPAbMA2bXSaEXjjZL2QIDx98zbc2tNOMuKHmv4BmQ3+vJG46dWGhYApAgr/OQ
 ickcPUwvRdGBOMwrvPXi3M/35QeHkVaOl3RzJr0nvda9v9Q7JDiUqLI2gPfiKrawcSIfJi5/fps
 DKia5+UqAAQue+DIcHdFHmFAGlYzvRtXPfdRwc+CI0zG2llHgKUyvyDO4Ew9r2dHVv9Hx5xEuVm
 8bC8c2HmbD1CGMnNV5yOdPwqmtCrTn12E8WG73WdrcnPEObU7xEPknF5YNfviaV2DyvmEtR+YJP
 9XJsusLKdLazP+Q==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

From: Catalin Marinas <catalin.marinas@arm.com>

The kmemleak marking phase is not atomic. While the object graph is
traversed, the kernel can modify pointers, free objects or allocate new
ones. If a reference to an object is moved from one location to another,
kmemleak scanning may miss it. We have explicit annotations like
kmemleak_transient_leak() but identifying and maintaining them is not
trivial.

Given that such transient leaks are short-lived, rather than just
reporting such objects as leaks, do another scan to confirm the
suspected objects. If no new leaks are found during the first scan, skip
the confirmation one.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 mm/kmemleak.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index e96e9efd19b0d..ac77bab580688 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -175,6 +175,8 @@ struct kmemleak_object {
 #define OBJECT_PHYS		(1 << 4)
 /* flag set for per-CPU pointers */
 #define OBJECT_PERCPU		(1 << 5)
+/* flag set on an object left unreferenced by the full scan, pending confirmation */
+#define OBJECT_SUSPECT		(1 << 6)
 
 /* set when __remove_object() called */
 #define DELSTATE_REMOVED	(1 << 0)
@@ -235,6 +237,8 @@ static unsigned long jiffies_min_age;
 static unsigned long jiffies_last_scan;
 /* delay between automatic memory scannings */
 static unsigned long jiffies_scan_wait;
+/* number of objects flagged OBJECT_SUSPECT during the current scan */
+static int nr_suspects;
 /* enables or disables the task stacks scanning */
 static int kmemleak_stack_scan = 1;
 /* protects the memory scanning, parameters and debug/kmemleak file access */
@@ -1440,6 +1444,11 @@ static void update_refs(struct kmemleak_object *object)
 	 */
 	object->count++;
 	if (color_gray(object)) {
+		/* referenced after all, no longer a suspect */
+		if (object->flags & OBJECT_SUSPECT) {
+			object->flags &= ~OBJECT_SUSPECT;
+			nr_suspects--;
+		}
 		/* put_object() called when removing from gray_list */
 		WARN_ON(!get_object(object));
 		list_add_tail(&object->gray_list, &gray_list);
@@ -1844,16 +1853,16 @@ static void dedup_flush(struct xarray *dedup)
  * kernel's standard allocators. This function must be called with the
  * scan_mutex held.
  */
-static void kmemleak_scan(void)
+static int __kmemleak_scan(bool full)
 {
 	struct kmemleak_object *object;
 	struct zone *zone;
 	int __maybe_unused i;
-	struct xarray dedup;
-	int new_leaks = 0;
 	int stop = 0;
 
 	jiffies_last_scan = jiffies;
+	if (full)
+		nr_suspects = 0;
 
 	/* prepare the kmemleak_object's */
 	rcu_read_lock();
@@ -1883,6 +1892,8 @@ static void kmemleak_scan(void)
 
 		/* reset the reference count (whiten the object) */
 		object->count = 0;
+		if (full)
+			object->flags &= ~OBJECT_SUSPECT;
 		if (color_gray(object) && get_object(object))
 			list_add_tail(&object->gray_list, &gray_list);
 
@@ -1950,6 +1961,10 @@ static void kmemleak_scan(void)
 scan_gray:
 	scan_gray_list();
 
+	/* a confirmation scan does not look for modified objects */
+	if (!full)
+		return nr_suspects;
+
 	/*
 	 * Check for new or unreferenced objects modified since the previous
 	 * scan and color them gray until the next scan.
@@ -1972,6 +1987,11 @@ static void kmemleak_scan(void)
 			/* color it gray temporarily */
 			object->count = object->min_count;
 			list_add_tail(&object->gray_list, &gray_list);
+		} else if (unreferenced_object(object) &&
+			   !(object->flags & OBJECT_REPORTED)) {
+			/* flag the objects left unreferenced by this scan */
+			object->flags |= OBJECT_SUSPECT;
+			nr_suspects++;
 		}
 		raw_spin_unlock_irq(&object->lock);
 	}
@@ -1982,12 +2002,42 @@ static void kmemleak_scan(void)
 	 */
 	scan_gray_list();
 
+	return nr_suspects;
+}
+
+/*
+ * Scan the memory and report the unreferenced objects as leaks. Must be
+ * called with the scan_mutex held.
+ */
+static void kmemleak_scan(void)
+{
+	struct kmemleak_object *object;
+	struct xarray dedup;
+	int new_leaks = 0;
+
+	/*
+	 * Full scan. Objects left unreferenced are flagged OBJECT_SUSPECT and
+	 * counted in the return value; nothing to confirm or report otherwise.
+	 */
+	if (!__kmemleak_scan(true))
+		return;
+
 	/*
 	 * If scanning was stopped do not report any new unreferenced objects.
 	 */
 	if (scan_should_stop())
 		return;
 
+	/*
+	 * A live object whose only reference is moved by, for example, a
+	 * concurrent RCU update can be missed for one scan and reported as a
+	 * transient false positive. Scan again and only report the objects
+	 * left unreferenced (still flagged OBJECT_SUSPECT) by both scans.
+	 */
+	__kmemleak_scan(false);
+	if (scan_should_stop())
+		return;
+
 	/*
 	 * Scanning result reporting. When verbose printing is enabled, dedupe
 	 * by stackdepot trace_handle so each unique backtrace is logged once
@@ -2015,6 +2065,7 @@ static void kmemleak_scan(void)
 		trace_handle = 0;
 		dedup_print = false;
 		if (unreferenced_object(object) &&
+		    (object->flags & OBJECT_SUSPECT) &&
 		    !(object->flags & OBJECT_REPORTED)) {
 			object->flags |= OBJECT_REPORTED;
 			if (kmemleak_verbose) {

-- 
2.53.0-Meta

