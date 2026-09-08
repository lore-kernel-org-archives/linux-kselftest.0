Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833E95452A6;
	Tue,  8 Sep 2026 12:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871895; cv=none; b=pn9Zi0wmADKLQfbA/a7jeA7YFmpo4hAK3mE7WjQztPN5qC5OMvbxpray6O0CUAq1dUGZE8XIuenqRHNw2d/vWdOR5H5Rv0fDEnIm+sAwLV9cPMWQmfLfINk78BSxlcXJKIeifbFkykoBiTdpune1dlAp5xdK6mu/iLvjknuNoP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871895; c=relaxed/simple;
	bh=2wIb6zhUy+ISZXbffGgnknvcHNkYiwUI1qYhQa6r6o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFefON/jNMptRFPtmXt1xNRO9M1GsGSg9nNsROFxxOA5kjz96xAxKj82v/jojXDdcyCXFsDls8OQrPymFZ61i5ppQpkqtU0y3n9uNOhg9PbSJldmo4tQ8PseeBdIhXtEk0UIUHeaq9WyFrYwlwk0gt9RuMFdu02/0cL8tsyKl48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=eZo36fAT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mv/UO6PX; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="eZo36fAT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mv/UO6PX"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5A28B140002E;
	Tue,  8 Sep 2026 08:51:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 08 Sep 2026 08:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788871891; x=
	1788958291; bh=uYuChwOH6ew6d87IvPSmlwr+N0kwHvlcJjHBLazstgw=; b=e
	Zo36fATQgMn+zXwD3MbBP1FAmS8Ii19fPt+CdoEDx9fGfbyDlzsW8xkHXBL2pWja
	68dk+MRyYrA3NCUBfTD0ztRNTZwGSzx00Yaeim4OnsISi9zeWH2Uy9wimaf18e+w
	CHvQ6joD3fQdanXvzhIWFEqaqe4pJBGWTWBzoj4gsxM2Hx/yGYs64zuLLVvwfipu
	5xWdUETW0vx/LVPQTAZAGXzYFIeVoILAd7imxlLxKQikX0MfAGoNPg1e0HoUgOrl
	KJ6OYVlEwMFbRo6EluUKiRE9j2WiglfhYZVscAAilEVClLWEHVXm0571h8WSZP/0
	XFNlnH42jpBqJi88l5aww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788871891; x=1788958291; bh=u
	YuChwOH6ew6d87IvPSmlwr+N0kwHvlcJjHBLazstgw=; b=mv/UO6PX2y+6qNmXD
	/AW0LSdylC/oVJ+vFki+CiLYzGrLsDQmJdx1XC+gRlxdw6rFqqWgkPnQmp3FPhSK
	iI7pGiidSr0l/OhvNHQNj8Crb9F4pl2vcrTDO/FYhWFNGYID22NGFM9vWEcDA96x
	XzR/9eUtJIFc16jo+AzaIa69j++iLC6dIn2zV00G0/aNO3HrFs5DTfRVmUBqtSck
	JPjOIccGogtub/GIrFYoV2i2x0L2V9qjk3FjhD623y5nmR04b/uMyDbxIQK0s4Ae
	0EB88O6wrEyY28Xs7OSI/u0ysgiR/YSwKrceXcZ0TR+2G3lAraw3oxT4lnlt4eqU
	Rlzvg==
X-ME-Sender: <xms:0wSgao7zr8fDtXeKtBXKPWUIgAH8ujoQRUeH8rABgy-U1HHRCVVWdw>
    <xme:0wSgaryfaPClYWh71dDK3q8quTICqrA_xvyc7B79bahM1E6TM7Vf0m61lIuM-8VKT
    iTQHSsyBgtbBbtfFwaEDVkcBous-ANDZxuN_EFyiDcI-14_OAI-2RoFqw>
X-ME-Received: <xmr:0wSgaskcvZaXqNAxizlQbN7b-frVT_CyWIvVGhZYh2M3YAMytaDmJsI1yqA>
X-ME-Proxy-Cause: dmFkZTFCT83ts3xpHDuUgDdlzQtELcoAknrXBpsFepmdcEBLccwduWOOVyAuau0VlYvm49
    objBvbnGefvuHsKXiB+MOl7qErn3M4/Q7Z72R+asBFni+WG6jRYqPjjJBv1F7ovmfnEZp3
    uEJcbLADGcdxsWcYxdWct2wwV9KQaoOTpGWM7Il7/oKOILrVOp7MvqHbWAXdA0mgRBniUZ
    2M+Su4Zoe9zFbzekNirjNltohahTSfzaLbYZTkGXD/hRQ+ajqkABo2HdEn2GJrc7g0w4Iu
    PhTUexE0AKZ4j2dsA7W9i19VnbZvZZgTTujH64lpg2nDW6KlKK63jDlRsrLETwVfJ8WCN3
    +MwnMNKlyxvUtzgJResqXczwCWadQ6jU1lt/NFr9LVMmwtO45z/bD0abIHltz9TYHjDzgp
    tzxRu8BIqOseqELdQvOAghT7ZVTUm4SX7v8ugAsJzlfzsAmlWYj3VORfDIneiliZf4Xhrs
    wFxQll2g0zT3uTAkt/VKUh2MJyM5D4ukmzTG4TMsHHvIb67YJoPZ7lmgfPJM8sluNJHuOU
    rMTtUPcsKYnfwKtGXzsruC6CBCw0USjBUoVKq25IVR1cg7mzZxzMpgaxd5AXj27ReknwOf
    ja+O1ZIt+CCcU3z435RDhuMPTZsAv17wWQDc59fDOMrMjT36MyNzf7P5jumQ
X-ME-Proxy: <xmx:0wSgatVAfzf7Xya4hPdsViiqohKnjJwxDZ_iXBlAqfbSYD3Fw4xICQ>
    <xmx:0wSgavNX2bP1tnjnVhf0aLwAdSYqzRwslWjgp7JJbLKqpbRCBtT41A>
    <xmx:0wSgaoFuhEo0xOIz0R-LERukmamye_iEwPdmLw6_Lvm47uH2W4gsFg>
    <xmx:0wSgao1KjiqcdRWVIQ8xXa7QHwC6_HUr5KYK2bd43lNjNSzabkdCng>
    <xmx:0wSgak2faSwsp15-LNdSdYVEgLmQs1C4qRuM7GJMNe-IZ71cwzWLkneJ>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 08:51:30 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	rppt@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	usama.anjum@arm.com,
	usama.arif@linux.dev,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ziy@nvidia.com,
	baohua@kernel.org,
	dev.jain@arm.com,
	hughd@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	mhocko@suse.com,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	agordeev@linux.ibm.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	kernel-team@meta.com,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH v5 10/19] selftests/mm: add khugepaged completion barrier helper
Date: Tue,  8 Sep 2026 13:50:56 +0100
Message-ID: <20260908125105.1510704-11-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908125105.1510704-1-kirill@shutemov.name>
References: <20260908125105.1510704-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

A khugepaged test has to tell "not collapsed" from "not scanned yet", and
nothing in the selftests can.  wait_for_scan() in khugepaged.c comes
closest: it polls full_scans until the counter has advanced by two, since
the pass in progress may already have passed the test's mm.  But it only
returns in time if scan_sleep_millisecs happens to be short, and it is
private to that one test.

Add khugepaged_full_pass() to hugepage_settings, built on the same
advance-by-two wait but driven through sysfs: a store to
scan_sleep_millisecs wakes the daemon, so the barrier completes whatever
the scan cadence.  A store made while the daemon is scanning rather than
sleeping is lost, so the helper keeps storing until the pass lands.

One wake completes one pass only if pages_to_scan covers every mm on the
list, so callers need it large.

Settings pushes must not start passes of their own.  A store to either
sleep knob wakes the daemon, so thp_write_settings() now writes a
khugepaged knob only when its value changes.

Assisted-by: LLM
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 .../testing/selftests/mm/hugepage_settings.c  | 60 ++++++++++++++++---
 .../testing/selftests/mm/hugepage_settings.h  |  2 +
 2 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
index d7917dce3aba..ca73f9ac8e9b 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -183,6 +183,13 @@ void thp_read_settings(struct thp_settings *settings)
 	}
 }
 
+/* A store to either sleep knob wakes khugepaged, so write only on change */
+static void thp_update_num(const char *name, unsigned long num)
+{
+	if (thp_read_num(name) != num)
+		thp_write_num(name, num);
+}
+
 void thp_write_settings(struct thp_settings *settings)
 {
 	struct khugepaged_settings *khugepaged = &settings->khugepaged;
@@ -198,15 +205,15 @@ void thp_write_settings(struct thp_settings *settings)
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
@@ -230,6 +237,41 @@ void thp_write_settings(struct thp_settings *settings)
 	}
 }
 
+/*
+ * Wait for a full khugepaged scan pass that started after this call: the
+ * pass in progress may already have passed this mm, so full_scans has to
+ * advance twice.
+ *
+ * A store to scan_sleep_millisecs wakes the daemon, but one made while it
+ * is scanning rather than sleeping is lost, so keep storing until the pass
+ * lands.
+ *
+ * One wake is one pass only if pages_to_scan covers every mm on the list.
+ */
+bool khugepaged_full_pass(unsigned int timeout_s)
+{
+	unsigned long deadline_ms = timeout_s * 1000UL;
+	unsigned long elapsed_ms = 0, poll_ms = 10;
+	unsigned long sleep_ms;
+	int pass;
+
+	sleep_ms = thp_read_num("khugepaged/scan_sleep_millisecs");
+	for (pass = 0; pass < 2; pass++) {
+		unsigned long target =
+			thp_read_num("khugepaged/full_scans") + 1;
+
+		while (thp_read_num("khugepaged/full_scans") < target) {
+			if (elapsed_ms >= deadline_ms)
+				return false;
+			thp_write_num("khugepaged/scan_sleep_millisecs",
+				      sleep_ms);
+			usleep(poll_ms * 1000);
+			elapsed_ms += poll_ms;
+		}
+	}
+	return true;
+}
+
 struct thp_settings *thp_current_settings(void)
 {
 	if (!settings_index) {
diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
index a1d12e2ffd62..2ea169d11796 100644
--- a/tools/testing/selftests/mm/hugepage_settings.h
+++ b/tools/testing/selftests/mm/hugepage_settings.h
@@ -83,6 +83,8 @@ static inline void thp_save_settings(void)
 	hugepage_save_settings(/* thp = */ true, /* hugetlb = */ false);
 }
 
+bool khugepaged_full_pass(unsigned int timeout_s);
+
 void thp_set_read_ahead_path(char *path);
 unsigned long thp_supported_orders(void);
 unsigned long thp_shmem_supported_orders(void);
-- 
2.54.0

