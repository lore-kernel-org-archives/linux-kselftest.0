Received: from mta1.migadu.com (out-38.mta1.migadu.com [95.215.58.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F002F5A0E
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787510617; cv=none; b=L63iTLt4kpJVTNbuUO1nIZMbeJIkMz9YeBzBXUYPtu229TTzyxqgHlULJGSADC4JRYzuACImPxcMKGQwL3CT4WcRs4l4jDvjoi0nuEsq6JWawk1bCL5TiJPZO0f1brD7nvNxe/gFR1GWEIOBzmAJLfbAw7RcISEdbpcCapQ3Yiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787510617; c=relaxed/simple;
	bh=2cRtSobj9DpAWdrabwHpR7MWbs04ul1EeZDL8CjWVAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pcrOyjZRB8PG9x6XUntPlyQZgNzRF18xsIXyN3elRqgq0PePIuuRdXUP/zZDGtbYt9PNFgRNGmEJJbuWKa/UqZ66mh5pm9T+DKqWjvE5lnwV03bDXkuPc5CIDrFOuYSjQ2vxO/HqIo7uNEysz0e4AppDOCBYJodCgklnCUiKccQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wbV7435I; arc=none smtp.client-ip=95.215.58.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wbV7435I"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2cRtSobj9DpAWdrabwHpR7MWbs04ul1EeZDL8CjWVAM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787510612; v=1; x=1788115412;
 b=wbV7435IA+1QO165eqrBuWJyCQsbAXXoibrGKfIsjwKTp8wjZvPLQH/TAQWusc0Y2LcTqNGS
 F78ImbGUmv+LkvaZlAr15d5v2jTKw4jHPsEma9oKvmqbtOrKr8Wkci0empEkYzibJZtDDomsR/P
 q4Wk7Tu9oyYLbUWGdeCXwkJ0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from localhost.localdomain (218.247.43.97)
	by smtp.migadu.com with ESMTPS id 040bf0f4d0e4635f;
	Sun, 23 Aug 2026 18:43:31 +0000
X-Mizu-Trace-ID: 040bf0f4d0e4635f
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	xu.xin16@zte.com.cn,
	chengming.zhou@linux.dev,
	shr@devkernel.io,
	ljs@kernel.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] selftests/mm: disable smart scan for ksm_tests
Date: Mon, 24 Aug 2026 02:43:14 +0800
Message-ID: <20260823184314.45044-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

The "KSM NUMA merging" test allocates two identical pages on two NUMA nodes
and verifies KSM will merge these two pages after 2 scans (see
ksm_merge_pages()). But when smart scan is enabled, pages that have
previously not been de-duplicated may get skipped for some scans. Verifying
KSM behavior after only 2 scans may not be enough.

 $ ./ksm_tests -N -d
 TAP version 13
 1..1
 pages_shared      : 0
 pages_sharing     : 0
 max_page_sharing  : 256
 full_scans        : 211
 pages_unshared    : 1
 pages_volatile    : 2
 stable_node_chains: 0
 stable_node_dups  : 0
 general_profit    : -128
 ksm_rmap_items 2
 ksm_zero_pages 0
 ksm_merging_pages 0
 ksm_process_profit -128
 ksm_merge_any: no
 ksm_mergeable: yes
 not ok 1 KSM NUMA merging
 # Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0

This specific test fails because KSM started scanning the second page
whilst the first page had already been scanned for 16 times
(ksm_rmap_item::age of page 0 is 16 greater than page 1). It's not
difficult to infer that should_skip_rmap_item() cannot be false at the same
time for these two pages - they cannot be merged even after 211 full scans.

Given the current implementation of smart scan, it may not be appropriate
to enable it for selftests. Let's disable it for now.

Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 tools/testing/selftests/mm/ksm_tests.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/mm/ksm_tests.c b/tools/testing/selftests/mm/ksm_tests.c
index 5fd7792a0d47..e72681090ff9 100644
--- a/tools/testing/selftests/mm/ksm_tests.c
+++ b/tools/testing/selftests/mm/ksm_tests.c
@@ -33,6 +33,7 @@ struct ksm_sysfs {
 	unsigned long pages_to_scan;
 	unsigned long run;
 	unsigned long sleep_millisecs;
+	unsigned long smart_scan;
 	unsigned long stable_node_chains_prune_millisecs;
 	unsigned long use_zero_pages;
 };
@@ -293,6 +294,7 @@ static int ksm_save_def(struct ksm_sysfs *ksm_sysfs)
 	    ksm_read_sysfs(KSM_FP("sleep_millisecs"), &ksm_sysfs->sleep_millisecs) ||
 	    ksm_read_sysfs(KSM_FP("pages_to_scan"), &ksm_sysfs->pages_to_scan) ||
 	    ksm_read_sysfs(KSM_FP("run"), &ksm_sysfs->run) ||
+	    ksm_read_sysfs(KSM_FP("smart_scan"), &ksm_sysfs->smart_scan) ||
 	    ksm_read_sysfs(KSM_FP("stable_node_chains_prune_millisecs"),
 			   &ksm_sysfs->stable_node_chains_prune_millisecs) ||
 	    ksm_read_sysfs(KSM_FP("use_zero_pages"), &ksm_sysfs->use_zero_pages))
@@ -309,6 +311,7 @@ static int ksm_restore(struct ksm_sysfs *ksm_sysfs)
 	    ksm_write_sysfs(KSM_FP("pages_to_scan"), ksm_sysfs->pages_to_scan) ||
 	    ksm_write_sysfs(KSM_FP("run"), ksm_sysfs->run) ||
 	    ksm_write_sysfs(KSM_FP("sleep_millisecs"), ksm_sysfs->sleep_millisecs) ||
+	    ksm_write_sysfs(KSM_FP("smart_scan"), ksm_sysfs->smart_scan) ||
 	    ksm_write_sysfs(KSM_FP("stable_node_chains_prune_millisecs"),
 			    ksm_sysfs->stable_node_chains_prune_millisecs) ||
 	    ksm_write_sysfs(KSM_FP("use_zero_pages"), ksm_sysfs->use_zero_pages))
@@ -846,6 +849,7 @@ int main(int argc, char *argv[])
 
 	if (ksm_write_sysfs(KSM_FP("run"), 2) ||
 	    ksm_write_sysfs(KSM_FP("sleep_millisecs"), 0) ||
+	    ksm_write_sysfs(KSM_FP("smart_scan"), 0) ||
 	    (numa_available() ? 0 :
 		ksm_write_sysfs(KSM_FP("merge_across_nodes"), 1)) ||
 	    ksm_write_sysfs(KSM_FP("pages_to_scan"), page_count))
-- 
2.53.0

