Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B214E451992;
	Wed, 12 Aug 2026 13:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541015; cv=none; b=ddO2f316ZvohriN2liUskCZdJ3F5WFAhpSeB8KDLhJ2t3BP286ZVBl7Gs9BlI9JOkV7IJzsAN6KZ3Sf/khpZleu9+A4YQumEnR3cwi30q3TVPg5ugHJCI21rrB9E+8VB7mYpDIi8yds41uc/HzIaIstPlh027wDYUHrwh5xZtBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541015; c=relaxed/simple;
	bh=NiZXq6PSkV3W5VwahZWuS9VpZvEGsgLGi73zxA+K2DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=en/kboxS/56oc4dcqunAlAK2gf3S2OAUG7ylXPbFahYMNV7XpxbUtgiK2xg6iR4m9nSGKLGYiAMxoyYMBk08xwJKQg1nQT+0A3SwM1pC+NSI/cNzile+48TAh4FWR7J1HYL9xgz741sb5N3S8QB8rBcg6KSgDVW6HnwRFHAEgh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=d+bIRM8D; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kvo68HBQ; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="d+bIRM8D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kvo68HBQ"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 586F17A00D8;
	Wed, 12 Aug 2026 09:23:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 12 Aug 2026 09:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786541012; x=
	1786627412; bh=vEcbFcHSc0RIpAv6Xeg8b8khiwkn4nugTeMN0M/IuN0=; b=d
	+bIRM8DtQgQ5NhEwnn9zLY5xsSRcpLiMaKCWyYH4Sl09LYB1asLwLL0ed7bTbwfB
	EHXtzvhrVVnLaabR7/z043cxfbXCE+mVZlZktcVCq0kstHW6fCmJqflBE9hzjTI8
	C46BPRFOgu2oSav7g5jJZ8NIhDZFnViC6gK/r5XGl5dDXuMkAKih0eeAtlMFapl5
	2BjErd8yBqKa38WIOIS0rnQZ3abtkxcsAukhYkhktQML+uTMwQpcVNWtIJOqygxz
	VO7eKH3FfqjKbIyBxQcrIeioHfg556xw3XDR7f5SE71+i2L/j4FsvoY94mBAawj6
	iRl+7GZJVEfKMOCsSUzvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786541012; x=1786627412; bh=v
	EcbFcHSc0RIpAv6Xeg8b8khiwkn4nugTeMN0M/IuN0=; b=kvo68HBQXjgCRBQN7
	6heYYkKOcONSCUBx4Ut0vP3ILxs21c5dRodLxl7kck4B02RT98jHxUUdml5AxheJ
	zbWoCX6u0BHb0qeOiphpPDASK3qoIVJ2S5rkALrM2akvRKH4EovQYtN9YERxs1/3
	iCXzFJeB7+oLEeDIgfl8hxm+9kVf6/Rw1XghYE4Tm45HneIsGtZqD5MAgwHKw9Wt
	4bFncveQ27pfCoTx3/43QEC5HZVWQdnvaG1PLbK9TLHB4oqRuz2Ra9fEnF2IL93E
	BcuO6/Ywx4NOFW6CHn0zTa2o1Hy4mvakkygR9nkEF0WyPOg0Ky6/UL7rGMttBE7j
	bN7Iw==
X-ME-Sender: <xms:1HN8av71aGlnR-4k3L145mVFhwav0CHioolNqOeGkRbeSDAwc3cTow>
    <xme:1HN8ao04BQcgBX6q8jpyaLsu_BWUg2BrNeE8VDRISld39960DMXpMwO0ZSvBTyCAO
    Xtv8NTx695c3YVPCzGsJ9ESXkr2OSQzPYbgyKsv5Mtipee5OOngnXkJ>
X-ME-Received: <xmr:1HN8au8BwV6jQEGL0bgghThNvswvHV5bBsoxT26ar8H1hgsAkE_f6Q3G7Dw>
X-ME-Proxy-Cause: dmFkZTGK88F9UMnXZ5YHCfZ+3CEyhDPNn2cwpG7gczg1QtUW3+KH6lRiOTrWgwtmC8SwM8
    lS9N2AAOkbX57R9oIGEGX/Y22a2ZgCAGYteUW+bA41LZ08JSUTSnxLP4aLeGJ+l2igRpiI
    z056Op0LI1NxVlka48nXFKSS8a/uwNZK+39708VFH13YHS1sNHrX5zvuU5299hb11Ao5H/
    zQrZEfdZM4G7c0rNyXZ30syjB6Y8P8LTAhLTAHwdc8i3T8CZWzvPOusg5fBb0jumhRSeE4
    e5clat+a+U2DXBe0wlr1aBcOwBQzkKo/UFV6TzMBSg5j9cF+ay7ufreZHSHrXPVD1XvoqN
    nGajMc9LFlqtqdyNBq16ebJCwpL9n0hNsyrSX0E74XPEhuZsPSQdOcHhjksiUT7jfzCQN5
    iBSxH59wM/CgQqAHSwNJhfxAEsTymBgLjfOffondkWrzKSe/7P1mH45ya+i7fOvTeG2e3e
    fEy3DOAGUCoQH+fXGrmdf9ulLu/vDnqrnyQ5qo2cAEtLiHOdRb7M+36TZHrFYXvfiHPGsS
    k7XZ/bEBQVWi5ABJ/mqzgHtU3UbMZj7i4qYjKCY5tyD55E+dJJMBuh32mh6PN016C75DzM
    RIVwsXzmayy2BQdFdA4CL2hgOMrG2qzf+dNZzV8Y98BEZ36/pwhrKN0i9c1Q
X-ME-Proxy: <xmx:1HN8apudGjw9y5B9yiy7BZ6UexIDIbDjPpdW2GPGYxf92xlLIXzIyw>
    <xmx:1HN8aqqvmgQ4qLZnN9QRxmIC-c_uDHaRSPxXOwlfCd3Ow1EjZx5wlg>
    <xmx:1HN8akGZsEsQ7syxbghqarnLmqnsT3iGepACvf7YE6fo2i5ctKdeGw>
    <xmx:1HN8at7MvtkJZ-wUow3sus-F1CcdDM7HTvWO0dcN9kTDMx0MAF0Ylg>
    <xmx:1HN8ap8UzARxZXCmW6A-9z9oq-Dl15Pc6E8TODhU-XghdYtR8HneKDe8>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 09:23:31 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	nico.pache@linux.dev
Cc: baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	dev.jain@arm.com,
	hughd@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	mhocko@suse.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com,
	usama.anjum@arm.com,
	agordeev@linux.ibm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kas@kernel.org
Subject: [PATCH v3 09/18] selftests/mm: add khugepaged completion barrier helper
Date: Wed, 12 Aug 2026 14:22:55 +0100
Message-ID: <20260812132304.199287-10-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812132304.199287-1-kirill@shutemov.name>
References: <20260812132304.199287-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

Race and functional tests need to drive khugepaged in step: set up a
layout, let one full scan pass over it, check the result.  The khugepaged
selftest already waits for full_scans to advance by two, but only makes
progress if scan_sleep_millisecs happens to be short.

Lift it into khugepaged_full_pass() and drive it through sysfs: any store
to scan_sleep_millisecs wakes the daemon, so the barrier completes
whatever the scan cadence.  It wakes once per missing pass -- over-waking
queues a straggler pass that overlaps what the caller sets up next.  One
wake completes one pass only if the whole mm list fits in a scan batch, so
callers need a large pages_to_scan.

Settings pushes must not start passes either, so thp_write_settings() now
writes a khugepaged knob only when its value changes.  That helper,
thp_update_num(), is exported for tests wanting the same restraint.

Assisted-by: Claude-Code:claude-opus-5
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 .../testing/selftests/mm/hugepage_settings.c  | 72 ++++++++++++++++---
 .../testing/selftests/mm/hugepage_settings.h  |  3 +
 2 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
index d7917dce3aba..8afcdf9793bb 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -183,6 +183,17 @@ void thp_read_settings(struct thp_settings *settings)
 	}
 }
 
+/*
+ * Write only on change: any store to a khugepaged sysfs knob wakes the
+ * daemon, and settings pushes/pops must not start scan passes nobody
+ * asked for -- khugepaged_full_pass() is the only sanctioned wake.
+ */
+void thp_update_num(const char *name, unsigned long num)
+{
+	if (thp_read_num(name) != num)
+		thp_write_num(name, num);
+}
+
 void thp_write_settings(struct thp_settings *settings)
 {
 	struct khugepaged_settings *khugepaged = &settings->khugepaged;
@@ -198,15 +209,15 @@ void thp_write_settings(struct thp_settings *settings)
 			shmem_enabled_strings[settings->shmem_enabled]);
 	thp_write_num("use_zero_page", settings->use_zero_page);
 
-	thp_write_num("khugepaged/defrag", khugepaged->defrag);
-	thp_write_num("khugepaged/alloc_sleep_millisecs",
-			khugepaged->alloc_sleep_millisecs);
-	thp_write_num("khugepaged/scan_sleep_millisecs",
-			khugepaged->scan_sleep_millisecs);
-	thp_write_num("khugepaged/max_ptes_none", khugepaged->max_ptes_none);
-	thp_write_num("khugepaged/max_ptes_swap", khugepaged->max_ptes_swap);
-	thp_write_num("khugepaged/max_ptes_shared", khugepaged->max_ptes_shared);
-	thp_write_num("khugepaged/pages_to_scan", khugepaged->pages_to_scan);
+	thp_update_num("khugepaged/defrag", khugepaged->defrag);
+	thp_update_num("khugepaged/alloc_sleep_millisecs",
+		       khugepaged->alloc_sleep_millisecs);
+	thp_update_num("khugepaged/scan_sleep_millisecs",
+		       khugepaged->scan_sleep_millisecs);
+	thp_update_num("khugepaged/max_ptes_none", khugepaged->max_ptes_none);
+	thp_update_num("khugepaged/max_ptes_swap", khugepaged->max_ptes_swap);
+	thp_update_num("khugepaged/max_ptes_shared", khugepaged->max_ptes_shared);
+	thp_update_num("khugepaged/pages_to_scan", khugepaged->pages_to_scan);
 
 	if (dev_queue_read_ahead_path[0])
 		write_num(dev_queue_read_ahead_path, settings->read_ahead_kb);
@@ -230,6 +241,49 @@ void thp_write_settings(struct thp_settings *settings)
 	}
 }
 
+/*
+ * Completion barrier for khugepaged: wait until a full scan pass that
+ * started after this call has finished. full_scans must advance by two;
+ * a +1 step may complete a pass that examined this mm before the
+ * caller's setup was in place.
+ *
+ * Any store to scan_sleep_millisecs wakes the daemon, so the barrier works
+ * whatever the configured scan cadence -- but a store can be lost.
+ * __sleep_millisecs_store() clears khugepaged_sleep_expire and wakes the
+ * queue; if the daemon is between scans rather than sleeping, it sets
+ * khugepaged_sleep_expire itself on the way into khugepaged_wait_work() and
+ * then sleeps for the full interval, having never seen the store.  So keep
+ * storing until the pass lands; a store while the daemon is awake costs
+ * nothing and does not queue an extra pass.
+ *
+ * One wake completes one full pass only if the whole mm list fits in
+ * one scan batch, so callers must pair this with a large
+ * pages_to_scan.
+ */
+bool khugepaged_full_pass(unsigned int timeout_s)
+{
+	unsigned long deadline_ms = timeout_s * 1000UL;
+	unsigned long sleep_ms =
+		thp_read_num("khugepaged/scan_sleep_millisecs");
+	unsigned long elapsed_ms = 0;
+	int pass;
+
+	for (pass = 0; pass < 2; pass++) {
+		unsigned long target =
+			thp_read_num("khugepaged/full_scans") + 1;
+
+		while (thp_read_num("khugepaged/full_scans") < target) {
+			if (elapsed_ms >= deadline_ms)
+				return false;
+			thp_write_num("khugepaged/scan_sleep_millisecs",
+				      sleep_ms);
+			usleep(10 * 1000);
+			elapsed_ms += 10;
+		}
+	}
+	return true;
+}
+
 struct thp_settings *thp_current_settings(void)
 {
 	if (!settings_index) {
diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
index 726c73c43c05..ba7d38370d43 100644
--- a/tools/testing/selftests/mm/hugepage_settings.h
+++ b/tools/testing/selftests/mm/hugepage_settings.h
@@ -70,6 +70,7 @@ int thp_read_string(const char *name, const char * const strings[]);
 void thp_write_string(const char *name, const char *val);
 unsigned long thp_read_num(const char *name);
 void thp_write_num(const char *name, unsigned long num);
+void thp_update_num(const char *name, unsigned long num);
 
 void thp_write_settings(struct thp_settings *settings);
 void thp_read_settings(struct thp_settings *settings);
@@ -83,6 +84,8 @@ static inline void thp_save_settings(void)
 	hugepage_save_settings(/* thp = */ true, /* hugetlb = */ false);
 }
 
+bool khugepaged_full_pass(unsigned int timeout_s);
+
 void thp_set_read_ahead_path(char *path);
 unsigned long thp_supported_orders(void);
 unsigned long thp_shmem_supported_orders(void);
-- 
2.54.0

