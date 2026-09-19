Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF6225B0BE;
	Sat, 19 Sep 2026 00:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777522; cv=none; b=TeoClQbmOw9EL7SeM/v2TL05GYuN1EyX1g7Qk41ryz0zE0k7d1ImnCC7+PTgmKgmz7smrKwzL8AUE/CYykLlT39/hb2i3cNC1Q2gD4L3o3BGV4fipH6VgY00YSikKQdLFkDwEneWrQiALaHBNZoJ4lhHPHuYyIXGkse1f3vCr64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777522; c=relaxed/simple;
	bh=bFbAdD5WwJ7BRCb9eIeM5k8fGbdRcmIshjpH6mjf5U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPIWUnxR9Mddk6LeOG4vvy1gP1UIONWO5xn3Dgg2ABsFBgTStwuA6LGRIWRmA5rseRzAjJ5HSMG/jaNVXGFt2IxqLucyOz2JS73tZCl7iWt+F4Fx5kukIEJb8w7+TeaGVglRPLXykBeZeQfrZHr3NJ192pm2NKktoq+eXznXSyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=YyYYiDI3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OG3pXCew; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="YyYYiDI3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OG3pXCew"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id B0774EC020B;
	Fri, 18 Sep 2026 20:25:17 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 18 Sep 2026 20:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777517; x=
	1789863917; bh=OrQSW9PySTD5pqcXZKw4HeeHztfLYLHLZ88GO+dc7EA=; b=Y
	yYYiDI3Q5HTbw/tbAfd8rDW/2Kzi8T4+aoFUJbTMd88hjoSGBOKD7sbiEyvJ8Jpb
	m/l8Ly2mhl2+c/lhnEkzKc5QOBwKryezfTZfZBPbGcLQbDqGWu6naXJ+9ao/PsD7
	8Joaxcb4r1SMQxlxpsD9vo3EzRcWKOV+VJKav7kAcwG/OnpKLF0yFf3FSsqcsNLo
	It5ppUBxc6Xbyt1ZZCw1OpQjsyoeQYC/fTWNzJ9yjTTRmxPLgbJnWRmK+phXu+8j
	wrFTa4rULui9mCUr6pXIFi/UDEhXQL66+8IIEiz3PRbUEXhbyBSedz89j3MreGdq
	fz6MNO+yZuiUHRWJ+u/MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777517; x=1789863917; bh=O
	rQSW9PySTD5pqcXZKw4HeeHztfLYLHLZ88GO+dc7EA=; b=OG3pXCewdhljr8JHr
	YlH6l8CooCxcfLobrHKScUPuGADBAA718f+YWA56zlFjCNaw/IcUL5wrAqHDXwu0
	ABGXQlqANJGVE9Cvoak5T4ABiD+Xqymx/Vv5tN5PSNbUlDRf8r4v5J91mrtI1JLt
	KbZbOFMiC29sxwWuylGJ8y7rVKcjSmLb5pIYJx8fW0zcSACEQm64bCwuWR0tHhmQ
	qKAfgQS/3UULY/yDbwp62jIEA4zJs3oaCwewsSK4EpKFAQ5TKHraHeGU8yUoBuaM
	gM6Y65XkbjxQYpMnLO2R/kgy2DegAja/mP1tkNGaPmYBWbQhUJRZe59X/LEDKmyc
	0FidQ==
X-ME-Sender: <xms:bdatalhvenWA70PwFZvHMU1RAqFBldRm68eHr0OlLQcEw38iHVTwoQ>
    <xme:bdataiYRj2SG8NxJkYMugMlsmq3g6V5N2h_aruXSymhNnoRS3RfBzxOWQk6_fPFFP
    zKClXB5kos-kt35i5zWrNJQDQm6x0n5snI0AulSfjrgbgJLysEKtg>
X-ME-Received: <xmr:bdatanTJHkjJmj79Vj84lX8xzzu4iUkrmSCsYfZrP7_9wrOmxQe0iN8KvdI>
X-ME-Proxy-Cause: dmFkZTEzseHgHAxanvosBbYuJPOsY+n0X5UbYs0PPazNY//kQZ3NkUWvwvZaeFG4K6MaM1
    51QpOH4aelOmHBptEhruNIkMmEsuOQeZbGrvL7mQj2kdmmCNYrJ7V/Gxu8ar4BzJpo5rV7
    vKP2ia7U0+Vm59vAPsz2JcwivFHP+0OmSoqV+JfA3yKlcOkTPrhdGkX4AgOHLm4XJUt5mM
    HeqMESXl6ibr/xrgjBd4IZM9oAbU6DWk9Q3+fqdUek4rHv8tNSmXbmq+2iLXuPMZjgN42W
    gGRNasGU39A5UL6wnmEy31YC46agADHTZYQX6KPmc3+B0CXfmIhRtSns1d+buSvmpYlDYa
    Ea8F6iMJgeQKGBr6iJ6jS5t/l5kFUJnfWycrqY24cckliWVai2FLR26JRYV4iw4sX32X2i
    EfEzbad5eybuXifwnMO7/nyVEQbt6L9OQsQxevONb3UmKp3N0K6snWnX7lTO2MJ66Mbb0b
    slMcJIV8yM6ej+537hiz0S4+IctIiyGVy6byPF1QrbNmJisJ2MPp6v9lpvP0vwF3Q7FXRI
    Z2sJIQMS6uXkTcnCkwcV8MQ0b3yHsVQ9xH51hEsMbxMwVPHHjfkyMMnQxNsc8pzBomEkfY
    5HGoXJzje8BjlIPd8fmeLOd/xchC2spbg+r8krgCEAGrEh22jNHSVdd32VTg
X-ME-Proxy: <xmx:bdataiEwaJ47wcwh-YVjQIIohd0eGIO2393yP8NSoMEp6bmdi-_aEw>
    <xmx:bdatak2N11NAf8qa1VgNyPIm8u1l83pwwH5ZkWYpPqas9TapygJSLQ>
    <xmx:bdatagu3xaiW43j9LgjsqpWOehBdpx48jJypEvW_ILpyvkh9dbWsAg>
    <xmx:bdatarl7uGrtTS6lWpBNlssEjZvl_5WX35ZTXKMCex3NeD39og3gtA>
    <xmx:bdatatLf-mGqw6-soCAKOMm-FKpomYwM1onQoUXWOXRc0GIHQolGeA90>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:25:17 -0400 (EDT)
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
Subject: [PATCH v6 10/19] selftests/mm: add khugepaged completion barrier helper
Date: Sat, 19 Sep 2026 01:24:40 +0100
Message-ID: <20260919002451.496763-11-kirill@shutemov.name>
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
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/lib/mm/hugepage_settings.c | 60 +++++++++++++++++++++++++++-----
 tools/lib/mm/hugepage_settings.h |  2 ++
 2 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/tools/lib/mm/hugepage_settings.c b/tools/lib/mm/hugepage_settings.c
index 656442c8d395..77918677a9cd 100644
--- a/tools/lib/mm/hugepage_settings.c
+++ b/tools/lib/mm/hugepage_settings.c
@@ -217,6 +217,13 @@ void thp_read_settings(struct thp_settings *settings)
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
@@ -232,15 +239,15 @@ void thp_write_settings(struct thp_settings *settings)
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
 
 	if (dev_queue_read_ahead_path[0]) {
 		int ret = write_num(dev_queue_read_ahead_path,
@@ -271,6 +278,41 @@ void thp_write_settings(struct thp_settings *settings)
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
diff --git a/tools/lib/mm/hugepage_settings.h b/tools/lib/mm/hugepage_settings.h
index 94d9fc747f49..8f4581099b7a 100644
--- a/tools/lib/mm/hugepage_settings.h
+++ b/tools/lib/mm/hugepage_settings.h
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

