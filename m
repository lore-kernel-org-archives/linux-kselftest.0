Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2B23DB336;
	Fri, 26 Jun 2026 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782489194; cv=none; b=GSJqJigZhC7hFrWMEf4tQbUyQFos8lIZgfLr4jzAlY/Ikq2CAIQhpXLG3Q+7/Rjbwm2qbLBG0fQYLHUPzN26KA7YvR1RF15jXI+2Hq9/9zIO30Ib+g7S2Xr7sL+cLwAKc3vkD0E87SiXrbvLoFHDGeXxrncf231N1qq6gS9cXnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782489194; c=relaxed/simple;
	bh=RABulGK6QujdsiKnNR0R9MU/Q6nKP1eKpaRDI432eMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TX1gZxwcA2U+OTe5AXC5bzr7uALVSEHuXUmtN7HLtWYxsMBTmjhI2bz7AZeKcdWkrVY0Fcilam/xyxv69d6qLRmcj6qO+vhZpuqSFuVTU8FpnF806yIddt1Ebvn8N4bUQP8X0YjimYIICaqqfq1I90408OadDn8hDDSCxndF/18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=hyiM+LHB; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="hyiM+LHB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=zIusDT26gcCvFsDSmUxAmn+SlqkdJcI2EiyZ+Whpugo=; b=hyiM+LHBFUMUYXCGxBS4/tGeTW
	SmjfEZZwMF4XgMl/lG1nFBwDDQcH72S1KSfsq6CeIkBbIRKywAkgRICR0KUV2VNAqIEQWCnXlb9QT
	g2mnZryiAxaXyZLVeqe288hZMiuIx0dXcMTdd7ySyeA+wGdbfJanh7kR80MM9pI9RYOF15U0G6i/W
	mNUZ/uiT0GRVqs9goBvTAsruzTdL1ojHX1g3KmaohswZtFBJVfcVRpvp46/vXm6S37W3ApIXenlwl
	dWyyVJev/RmsozpreJGkqGP628ucQ7BAC44qK2B4b+HxM8OOzxGyuk6sXiNhu+sz946lOlHz66Olz
	OXv0ooxg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wd8rc-0044nY-1O;
	Fri, 26 Jun 2026 15:53:08 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 26 Jun 2026 08:52:02 -0700
Subject: [PATCH 1/2] mm/kmemleak: report leaks only after N consecutive
 unreferenced scans
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-kmemleak_twice-v1-1-ab28f7cc0971@debian.org>
References: <20260626-kmemleak_twice-v1-0-ab28f7cc0971@debian.org>
In-Reply-To: <20260626-kmemleak_twice-v1-0-ab28f7cc0971@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322; i=leitao@debian.org;
 h=from:subject:message-id; bh=RABulGK6QujdsiKnNR0R9MU/Q6nKP1eKpaRDI432eMM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqPqBbzzd41h2CCLt6BbQvTMwt6FoFGmHNiVeez
 NsDi2fKn7aJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaj6gWwAKCRA1o5Of/Hh3
 bbF4D/90uC9IdAMFoVI5DfJCXCyn+fLOMAuyBQGgrqUk3UyuAyyuZsASi8fzMAWWwhc9nxQsU7V
 ihSuGZO3TffHYNbbEkDE+KrNkpJiL2wlQAMJCep1ysUd3AsRMvGRQ/JdlNYG7eemOBS/QLYYzF9
 tYrdVJhNaGTR3AwVICkQbsDT8r71lMaj2/Fh0kdrT01LYy4bNrUsb+mc0jh2Zuw78Oz44wrKjik
 jQb3z51gqg/u7etfgs8QorUlG67W7nBFxj9Y6dKkcbjk6gxGFEPenbuY/wuDb4XLjzoocV9yyEF
 eM3jdNbnmU7oqYGi8wSPdKa8/1lwzyYXoXBu8JXXdrOvBJfUxdXDyigZMo6xkFcYhKPN38sdk32
 FODkAAgmJnsn+XtMJBmyDkyu7pvR3BG+v8FvwwdYBSoSMjLR/W4sfpvslYM+BQyqZSVG08yLDPS
 gvmZs//OjsJ1rzj5kQl52x3VNGXP1weK6InkT7bJjc9U+s/pe1tVLlSgfOhzHF4UG7fpoCln5A/
 /kehfywaXpuGFxQ4cpRGoE3q6nThtE5czJ4+or8Rc0VOOwE+5bBIG8C79M1OoVa3NE9MVL7Gs6Y
 mDFUWAahc1mC1BVTzAyyeYb/ou0TX5Q5YtQotz+h5hLJUz1BJiGu6u0tqq7z4SnHtDZ9lJw4o26
 arXSAUp0E5FLvSw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

kmemleak reports an object the first scan it is found unreferenced. Its
mark phase runs without stopping the rest of the kernel and without a
write barrier, so a live object whose only reference is briefly invisible
during a concurrent RCU update -- e.g. a VMA moved between maple tree
nodes, or a page-cache xa_node -- can be seen as unreferenced for that one
scan. Because an object is flagged as reported only once, such a transient
race turns into a permanent false positive.

Track how many consecutive scans each object has been seen unreferenced
and only report it once that reaches min_unref_scans, a new module
parameter. It defaults to 1, leaving the behaviour unchanged; setting it
higher (e.g. 2) still reports a genuine leak, one scan later, while an
object referenced again before the threshold restarts its run and is never
reported.

min_unref_scans can be set at boot with kmemleak.min_unref_scans=<n> or at
run-time via /sys/module/kmemleak/parameters/min_unref_scans.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/dev-tools/kmemleak.rst |  8 ++++++++
 mm/kmemleak.c                        | 14 ++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kmemleak.rst b/Documentation/dev-tools/kmemleak.rst
index 7d784e03f3f9d..a8a83bc69ceb8 100644
--- a/Documentation/dev-tools/kmemleak.rst
+++ b/Documentation/dev-tools/kmemleak.rst
@@ -198,6 +198,14 @@ systems, because of pointers temporarily stored in CPU registers or
 stacks. Kmemleak defines MSECS_MIN_AGE (defaulting to 1000) representing
 the minimum age of an object to be reported as a memory leak.
 
+The ``min_unref_scans`` module parameter (default 1) requires an object to
+be seen unreferenced in that many consecutive scans before it is reported.
+Keeping it at 1 preserves the historical behaviour; higher values filter
+the transient false positives described above, at the cost of delaying
+genuine reports by up to that many scans. It can be set at boot with
+``kmemleak.min_unref_scans=<n>`` or at run-time via
+``/sys/module/kmemleak/parameters/min_unref_scans``.
+
 Limitations and Drawbacks
 -------------------------
 
diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 7c7ba17ce7af0..5b14ccb36f95b 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -151,6 +151,8 @@ struct kmemleak_object {
 	int min_count;
 	/* the total number of pointers found pointing to this object */
 	int count;
+	/* consecutive scans the object has been seen unreferenced */
+	unsigned int unref_scans;
 	/* checksum for detecting modified objects */
 	u32 checksum;
 	depot_stack_handle_t trace_handle;
@@ -232,6 +234,9 @@ static unsigned long max_percpu_addr;
 static struct task_struct *scan_thread;
 /* used to avoid reporting of recently allocated objects */
 static unsigned long jiffies_min_age;
+/* consecutive scans an object must stay unreferenced before reporting */
+static unsigned int min_unref_scans = 1;
+module_param(min_unref_scans, uint, 0644);
 static unsigned long jiffies_last_scan;
 /* delay between automatic memory scannings */
 static unsigned long jiffies_scan_wait;
@@ -687,6 +692,7 @@ static struct kmemleak_object *__alloc_object(gfp_t gfp)
 	atomic_set(&object->use_count, 1);
 	object->excess_ref = 0;
 	object->count = 0;			/* white color initially */
+	object->unref_scans = 0;
 	object->checksum = 0;
 	object->del_state = 0;
 
@@ -1833,6 +1839,9 @@ static void kmemleak_scan(void)
 				__paint_it(object, KMEMLEAK_BLACK);
 		}
 
+		/* referenced last scan: restart the unreferenced run */
+		if (!color_white(object))
+			object->unref_scans = 0;
 		/* reset the reference count (whiten the object) */
 		object->count = 0;
 		if (color_gray(object) && get_object(object))
@@ -1968,8 +1977,9 @@ static void kmemleak_scan(void)
 		raw_spin_lock_irq(&object->lock);
 		trace_handle = 0;
 		dedup_print = false;
-		if (unreferenced_object(object) &&
-		    !(object->flags & OBJECT_REPORTED)) {
+		if (!(object->flags & OBJECT_REPORTED) &&
+		    unreferenced_object(object) &&
+		    ++object->unref_scans >= min_unref_scans) {
 			object->flags |= OBJECT_REPORTED;
 			if (kmemleak_verbose) {
 				trace_handle = object->trace_handle;

-- 
2.53.0-Meta

