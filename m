Received: from mta0.migadu.com (out-129.mta0.migadu.com [91.218.175.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6B33C0605
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954006; cv=none; b=pxVYO6ltrHIJ9YRlqd8qZCk69IdQgD38tixZnKcFRm3CGlYoyXI8Eg7BYFZvXO9+zK18nOjjA7hGGjZy1BXd4z4iHAobDztwI88I5E44ky4N8NFOY2xQzCItavPCPNsALsXgMp2UzaBFQkbxaWqqTCKV0uT7ZvQjLqhtTY9ul08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954006; c=relaxed/simple;
	bh=5yaGSH3BYPo6k782/jrFz5kavJsoRXjePeFuyIykNaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QZb5qL1xfR0b/JcAjmF6ubmqo4qMpIRZB/387nlWfXHZxak3IFIojxVDdqEhn33+cidZJlOUEG3u00RcrDrTqRaTX0FT1sxx4Ev5MBlmwupLz3YTdLApLCTC/kt1VS/fU64x9NOejFx1HQHsr7tWOY+hmEMmMhbEwVHBDmvBx9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tKs2Kniy; arc=none smtp.client-ip=91.218.175.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tKs2Kniy"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5yaGSH3BYPo6k782/jrFz5kavJsoRXjePeFuyIykNaE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786954002; v=1; x=1787558802;
 b=tKs2Kniy5Su8wJKGwrH9TnFYixvwBWpqXVHcez/E08gqNSfFVTk8YKVUeomaIpOWw63DGffl
 NmExw1nvdBfuLIcrY4zNQ9aWWzu5Vqok6NjqsKvxxpky3f1ODy6HWu7Z6wEp3Q0idI1mDWnD97U
 W/APF4NSRE52gZtf8QisBglI=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from localhost.localdomain (223.70.160.239)
	by smtp.migadu.com with ESMTPS id 551a8aada41dd678;
	Mon, 17 Aug 2026 08:06:32 +0000
X-Migadu-Flow: FLOW_OUT
From: Hongfu Li <hongfu.li@linux.dev>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH] selftests/mm: Drop redundant open() in mprotect_tests()
Date: Mon, 17 Aug 2026 16:06:16 +0800
Message-ID: <20260817080616.52946-1-hongfu.li@linux.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongfu Li <lihongfu@kylinos.cn>

Remove duplicate open() for local pagemap_fd in mprotect_tests() that
shadows the global pagemap_fd already opened in main(). The local fd
is never used in the function.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 tools/testing/selftests/mm/pagemap_ioctl.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
index cfd1987339c1..eadc7159ca5b 100644
--- a/tools/testing/selftests/mm/pagemap_ioctl.c
+++ b/tools/testing/selftests/mm/pagemap_ioctl.c
@@ -1332,12 +1332,6 @@ int mprotect_tests(void)
 	int ret;
 	char *mem, *mem2;
 	struct page_region vec;
-	int pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
-
-	if (pagemap_fd < 0) {
-		fprintf(stderr, "open() failed\n");
-		exit(1);
-	}
 
 	/* 1. Map two pages */
 	mem = mmap(0, 2 * page_size, PROT_READ|PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
-- 
2.54.0

