Received: from mta0.migadu.com (out-68.mta0.migadu.com [91.218.175.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038274E80DC
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789403; cv=none; b=f0nnadBI7VxnlGeq93AOblmGh+Qjc7u/8mISMMh0j+xNlxEQzQjj4catN2ARDp5kKOgpmtO9u94yGm43NTwWst+qer+i2dsrVrw5O9EtfhpDRW1rnovlDxudUMf8jVAO2RAxHflCZKHGxIs+xZMa6DWW7YsABkIiqpNfZGKBKa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789403; c=relaxed/simple;
	bh=ku9/UBu99vSafYGo9adeFr1f9lBsBT9crq+anMw3VDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S3oTCIdVDt5DPjj/yF+3c3VCDZx7BQVpako0drMMviOsUFIj5cyEs3aSX8pDP+khEz00RRcz7WCuFK1iwQlaDM9d7LJqQ9R+ti4HVzegMLR0xs53gV7RxCKiIP9ninZKy2KTKvQquT1e6Jz9DSZpBOvdaXeS8weEPObkN38MPIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=coNMpP0i; arc=none smtp.client-ip=91.218.175.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="coNMpP0i"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ku9/UBu99vSafYGo9adeFr1f9lBsBT9crq+anMw3VDM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788789395; v=1; x=1789394195;
 b=coNMpP0iL2skrqQ1eElLFpIaIfj4nan1asy2MqeBQqjHyQntRGLGREgjuUcP2kwsYpwmlfYP
 FR2gBqzzSkfhYiwMzXojMGBm1VK1QCFvvzrRqVru3QzS0Twcr3aPTMR1xAtwPuq8RyOdJCeC78z
 0XLv58ituWXzHhwBDMlcj9lo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 66dd265d53de2e57;
	Mon, 07 Sep 2026 13:56:35 +0000
X-Mizu-Trace-ID: 66dd265d53de2e57
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] selftests/mm: fix size truncation in pagemap_ioctl test
Date: Mon,  7 Sep 2026 21:56:13 +0800
Message-ID: <20260907135613.68692-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

On arm64 with 64K base pages, the huge page size is 512 MiB, and
hpage_unit_tests() builds a 5 GiB range (10 * 512 MiB) for its tests.  This
exceeds the range of the int size parameters of gethugepage(),
wp_addr_range() and pagemap_ioctl().  The implicit truncation to 1 GiB
makes gethugepage() allocate a too small buffer, while the callers keep
operating on the original 5 GiB range, resulting in spurious failures or
SIGSEGV.

Change those size parameters to size_t.

Fixes: 46fd75d4a3c9 ("selftests: mm: add pagemap ioctl tests")
Assisted-by: GLM-5.3 OpenCode
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 tools/testing/selftests/mm/pagemap_ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
index eadc7159ca5b..48cbea3a33c9 100644
--- a/tools/testing/selftests/mm/pagemap_ioctl.c
+++ b/tools/testing/selftests/mm/pagemap_ioctl.c
@@ -44,7 +44,7 @@ const char *progname;
 
 #define LEN(region)	((region.end - region.start)/page_size)
 
-static long pagemap_ioctl(void *start, int len, void *vec, int vec_len, int flag,
+static long pagemap_ioctl(void *start, size_t len, void *vec, int vec_len, int flag,
 			  int max_pages, long required_mask, long anyof_mask, long excluded_mask,
 			  long return_mask)
 {
@@ -152,7 +152,7 @@ int wp_free(void *addr, long size)
 	return 0;
 }
 
-int wp_addr_range(void *addr, int size)
+int wp_addr_range(void *addr, size_t size)
 {
 	if (pagemap_ioctl(addr, size, NULL, 0,
 			  PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC,
@@ -787,7 +787,7 @@ int base_tests(char *prefix, char *mem, unsigned long long mem_size, int skip)
 	return 0;
 }
 
-void *gethugepage(int map_size)
+void *gethugepage(size_t map_size)
 {
 	int ret;
 	char *map;
-- 
2.53.0

