Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2E334D38B;
	Sat, 15 Aug 2026 01:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759169; cv=none; b=ZTEMPxGWAEJ8BSSwuaMdDPInSEsMS31zny6fI6/6JxXh6foxFIqFzFUkQet2RSnIkb9tbJYELjLHXq++sclrmXT68kRto+glB5m/XONfYDpbXll1NyP8LPR/1kmjb7Qz7LYs3nVB/ciIjOU2Z72DGjdaa8QIPZrjrqmi1LXd75c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759169; c=relaxed/simple;
	bh=GAAP1fJySb/pKKMl9ZT51tN8hzshdxLLNhN49eZapkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lRbbNPWeG6XpzNZE725YiY7t6oyk4Z9qMcqMNVy23GkBllVQEIX9advRx9FJHlI2X4BmcFNKcxTP1e827EzfYk3zR/kXqtIRIcPeEY0yud6wiubpZ/tjoEubIPUXAA/OcXcATEXT0h6YEKBByOmLtQGD333aMhXvjxgKl0oH4aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=rU198r7r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I34fodJa; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="rU198r7r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I34fodJa"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 51902140011C;
	Fri, 14 Aug 2026 21:59:26 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 14 Aug 2026 21:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786759166; x=
	1786845566; bh=CZeRnpjSx97tLsIjgu0PpuEyM1aG2ncyWgDrDsC6Hoo=; b=r
	U198r7rP/Vc4FNI1a1rsYY0AuCB2FeQfyW9Ri/4ejuwfJMpi3AYfcdrJB0ZXtqBu
	ZeGi2R+yMTFrrsnIo/co7ZOuqesSYpNeyLVvxg64gFVeItTPa8rKFYs1xe8k2OB+
	HO+OPSHVMnwTl3z/yyk/bT2uc0KfGjI/RB0i4KKrg43yXI8f1Hholgg5kPw8ZhjH
	0cHpcADSCIBupi7ToBr7GBqPA8az13G46PpE6FY0dgjit/5D7tt+OhdroKhxGGrD
	LSKIAa81stZFgFwUGlBskXv5thasHWRnU68Bczjp8ehsE2I6//C5z7LjM8m7402q
	tPAZftuJJuP4hJzB0Uwjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786759166; x=1786845566; bh=C
	ZeRnpjSx97tLsIjgu0PpuEyM1aG2ncyWgDrDsC6Hoo=; b=I34fodJaX6Ch2ggTS
	A+vh4cgl2R5Ef3LjfuLTe/PiY2DiSng9Hz3KZaT7RjpP26/Lf51K3RUo3AChNCVJ
	oUS/U+Us3urjBDykrmAaEAVMlTHd7Tt1N0lVBk8tE/EcQVI3PapHSSq0/QS6BXBP
	vZ8sAzRXefCs3yUvUXQWFLlxrgji7DmsmXEEH8H4LpJ04b5tLOKVYy+gYIBEnhiJ
	dVgNys0iAa1gPVP0cp40n2QxaaAl3rHUWRVjlOAWaURqJnZ60Io4WNd5JTPhgKoM
	llSzhplwvz50PR32F7hBqKMT5InxPRrf25Dutq7vUtsJQ/PnqErUK2o262OxA0ti
	RAijA==
X-ME-Sender: <xms:_sd_aq8ruvr_1ZmPG7PJ7p9vJQztGbIYCtuXocfXolcaih_tqQsVYw>
    <xme:_sd_auoaAtorVqlrsVCkgb974dxYeFOqGMtd4qNV_t7hlEkB7tvV2GCg2p3G2JGNI
    zT_54k_67sMN0-pcOCgKxQVD9txSFiXEU7Sc75p280CZHEb-TmIcok>
X-ME-Received: <xmr:_sd_aojxiLvo_gbJoOL904y38r8J695MvtQzP30o8IBTfncYcY6qF5ESRrE>
X-ME-Proxy-Cause: dmFkZTGF7teVIHNqoa5p2A8iL+trOmU4pExV0BsGEGBxavUqSy3vvyW/t2uVaC82ybAhbC
    FZe2jS418ApiE9B8lCjDVAvs2O/1hVxxIyd2QmVeomYKnxIQlXrdOkpVI2/A6aay1R5wM6
    752pE1oD84VvsYvCM8wHufwfHzQzVg5WF64m0thPV1o6CCL0N8QD0816LOjK9LaF9KdRdp
    ShDgDyNTb/bU59JqJj/g3oSWXYBnQXQHEYh7kafl/PHtgQjoSit3F73LPXI/q1yj04b//y
    CUybFuAxuhlNqjceRELXNaCNxBn+qS4c4JK+cmo8T/HSoyzm/Kml9mcKob58Fnvz9v9Li7
    CoAEwNoLKJKn1qX+J1+9JwWz88Soz0MhWY28+Pguh3s45O9cQLypQR3KYAcDBhW6yE7XiM
    IyLtH1lmqZlpPb/jzlLd6/i0Jk5epL1pZtK304Xa71zdyS0MDI21QIx3u3gG0UcrR26/D9
    SkQYYRyecImQhU4ldepeg+YHoG4G0/PcBdHE016KA0hy6E33QauH0LyoPx9juZnXgLF7/4
    z9Q7Evr1kSl9XtCYmVfPWcO7x6pujAbU8SvmOSfEfvTyj8vgAPZSxLsx3PFEbuY8tiMQhz
    w/GIfiAugxuu4ruNTl34Ng8To0SmNlHuT1ksGvmpb2iecpc9aigE6lCO6c1Q
X-ME-Proxy: <xmx:_sd_asAXi-1vyYPQP11MTeh1J_0dYzaPsnRL6XudAswt_m5_aWyjBA>
    <xmx:_sd_amvvV095Ulqy4sxA4YtAKKGql_gLcYPuqNwL3FbLtf14eGOEkg>
    <xmx:_sd_am4keEkjIhVvTR_6k0nRraY2Z6nY86HFhKnDoiTkZRFrp2FRdA>
    <xmx:_sd_agd9O4KG797k_fbNKObllU87Jl-koN6EchLL8aSJbstYufHAyw>
    <xmx:_sd_avc0El1mTe_s5C3PyethQyJj2NiJxoppBXfMD1Gt1Sl9xzCZrKb5>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 21:59:25 -0400 (EDT)
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
Subject: [PATCH v4 10/19] selftests/mm: add khugepaged completion barrier helper
Date: Sat, 15 Aug 2026 02:58:52 +0100
Message-ID: <20260815015901.1236937-11-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815015901.1236937-1-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
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
to scan_sleep_millisecs wakes the daemon, so the barrier completes whatever
the scan cadence.  A store can be lost when the daemon is between scans, so
it keeps storing until the pass lands; a store to an awake daemon costs
nothing and queues no extra pass.

One wake completes one pass only if the whole mm list fits in a scan batch,
so callers need a large pages_to_scan.

Settings pushes must not start passes either.  A store to either sleep knob
wakes the daemon, so thp_write_settings() now writes a khugepaged knob only
when its value changes.  The other knobs do not wake, but writing them
uniformly costs nothing.  thp_update_num() is exported for tests that want
the same restraint.

Assisted-by: Claude-Code:claude-opus-5
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 .../testing/selftests/mm/hugepage_settings.c  | 74 ++++++++++++++++---
 .../testing/selftests/mm/hugepage_settings.h  |  3 +
 2 files changed, 68 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
index d7917dce3aba..992efee17b71 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -183,6 +183,19 @@ void thp_read_settings(struct thp_settings *settings)
 	}
 }
 
+/*
+ * Write only on change: a store to either sleep knob wakes khugepaged --
+ * __sleep_millisecs_store() clears khugepaged_sleep_expire and wakes the
+ * queue -- and settings pushes/pops must not start scan passes nobody
+ * asked for; khugepaged_full_pass() is the only sanctioned wake.  The
+ * other knobs do not wake, but writing them the same way costs nothing.
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
@@ -198,15 +211,15 @@ void thp_write_settings(struct thp_settings *settings)
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
@@ -230,6 +243,49 @@ void thp_write_settings(struct thp_settings *settings)
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

