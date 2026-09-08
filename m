Received: from mta1.migadu.com (out-103.mta1.migadu.com [95.215.58.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866FF2F1FC3
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 13:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875082; cv=none; b=r5WWmoL6xbX8O0HmMOBTuIZnNrl5OZIX+d5a3FmwjcCtOVtkbN2P2bAG1E48lxU5lh7ikX713yeM/Dz16U8JFwUyd92oXznHaNKICFR8EGlBnFmJTR3KWg8l0I68CYITjaI5gQ80Cm2GyakybJTK+/zP8WN0kbMNjGkLT9i1j2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875082; c=relaxed/simple;
	bh=65dsR/AIsa1KwD07S3iIYP5bJ3Epc26abAu9BtMFUS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmMnQw8gvbC9OtmXEdBwr800+1MDHxwmJ5gFE302qNySx5FS4cSwgntJxRlrS2gC5BBLj6ugOrDS68YItNHE3L5i80W5hwYjr0f2nteWH6jkHUvx2cV5kURdSF+0o0xnhSg4bTV53GXUL3k9m3CD+a1v4/b9v2IhY96CmwjoVyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Fad6sxFg; arc=none smtp.client-ip=95.215.58.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Fad6sxFg"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=65dsR/AIsa1KwD07S3iIYP5bJ3Epc26abAu9BtMFUS4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788875055; v=1; x=1789479855;
 b=Fad6sxFgcBzdmpNy3jWqhhFI1K0cG5IVG9G/qh60aeLcUnSIkZ3a3arHJ8sUWD1VeQD1Bu+4
 j6mBw9BkctCkJudw7VzZgEQR8RvhCinzs3ntrpf084Fdc8S+lE0MCabmKv9iVeDGPojdlI/ugRT
 xSz9X6BFTKQVx8oH2WfkiNsI=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ce353f69015ecc17;
	Tue, 08 Sep 2026 13:44:14 +0000
X-Mizu-Trace-ID: ce353f69015ecc17
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
	gourry@gourry.net,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH v2 3/3] selftests/mm: init page sizes early in pagemap_ioctl test
Date: Tue,  8 Sep 2026 21:44:05 +0800
Message-ID: <20260908134405.84448-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908134117.84405-1-zenghui.yu@linux.dev>
References: <20260908134117.84405-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

Initialize page_size and hpage_size before calling init_uffd(),
hugetlb_setup_default(), etc.  That won't fix anything, but it is safer and
saner to get these globals set up before doing other things.

While at it, drop the page_size parameter of transact_test(), which is
actually unnecessary.

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 tools/testing/selftests/mm/pagemap_ioctl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
index 1a87b7483316..d9a4fb782ecf 100644
--- a/tools/testing/selftests/mm/pagemap_ioctl.c
+++ b/tools/testing/selftests/mm/pagemap_ioctl.c
@@ -1489,7 +1489,7 @@ static void *thread_proc(void *mem)
 	return NULL;
 }
 
-static void transact_test(int page_size)
+static void transact_test(void)
 {
 	unsigned int i, count, extra_pages;
 	unsigned int c;
@@ -1653,6 +1653,9 @@ int main(int __attribute__((unused)) argc, char *argv[])
 
 	ksft_print_header();
 
+	page_size = getpagesize();
+	hpage_size = read_pmd_pagesize();
+
 	if (init_uffd())
 		ksft_exit_skip("Failed to initialize userfaultfd\n");
 
@@ -1661,9 +1664,6 @@ int main(int __attribute__((unused)) argc, char *argv[])
 
 	ksft_set_plan(119);
 
-	page_size = getpagesize();
-	hpage_size = read_pmd_pagesize();
-
 	pagemap_fd = open(PAGEMAP, O_RDONLY);
 	if (pagemap_fd < 0)
 		ksft_exit_fail_msg("Failed to open " PAGEMAP "\n");
@@ -1823,7 +1823,7 @@ int main(int __attribute__((unused)) argc, char *argv[])
 	mprotect_tests();
 
 	/* 13. Transact test */
-	transact_test(page_size);
+	transact_test();
 
 	/* 14. Sanity testing */
 	sanity_tests();
-- 
2.53.0

