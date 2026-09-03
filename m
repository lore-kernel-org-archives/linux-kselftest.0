Received: from mta1.migadu.com (out-167.mta1.migadu.com [95.215.58.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7BD4AFE1F
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443608; cv=none; b=A6zsKQ6efgANDbk2B2hWVdA4o+5ON0Ez3TQh7d2lA/WpSEVFVlfgkf+AF+1v0ZxKR7PwiM16FKDFJx8Q2PqXFM9QkRvnb6foPI0uThT7noznFx0Mj7haazzhAiy9fRVGEm7V5HZUZD73vTSM+uB3DaZ3mUxzuWJu3P3/ITKCCYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443608; c=relaxed/simple;
	bh=5COp11tZRoN06Ewjs47lpm9CAHf1L73x0BPSB614Wpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLx1b+aTzaVjy6tDnZhqiZP11tc9P21bzDi/wQm7SDGGOdlIrGUn58Zsc3J3Rh1b2XDcCtDYz5gONQ9557K3DDbPLJA0O9a4GpNUuUnBQKcIp7A/AX6EvQbm3tlLjSxLJAXmyIwurepL4OcfRQI486b0MA8WjEGPM5jxJv0OdNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ProqK7T9; arc=none smtp.client-ip=95.215.58.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ProqK7T9"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5COp11tZRoN06Ewjs47lpm9CAHf1L73x0BPSB614Wpk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788443597; v=1; x=1789048397;
 b=ProqK7T9pFb5BfRGKbjWo7Uw/ZAZVlw15lalAAmqYl8AjK+2OGVSQDJ+Z+Ic8iOwcpXRgjlz
 zwpePtDJOpUD/VdG/4YDjzAs/o46x9gFc0nKYM3zJwUR8y9uaj7ykuH89jhrmISlFxvrta5+4y0
 q8wBvCuU0610lm/0p5pg8ry4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8502ee06491f0eca;
	Thu, 03 Sep 2026 13:53:17 +0000
X-Mizu-Trace-ID: 8502ee06491f0eca
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
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] selftests/mm: remove unreachable returns after ksft exit helpers
Date: Thu,  3 Sep 2026 21:52:51 +0800
Message-ID: <20260903135251.39593-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

The ksft_exit*() helpers such as ksft_exit_fail_msg() are declared
__noreturn, and the ksft_exit() and ksft_finished() macros expand to calls
of them, always terminating the process via exit().  Any return statements
following such calls are unreachable, both at the end of main() and on
error paths of helper functions.

Remove all of them.  No functional change.

Assisted-by: GLM-5.3 OpenCode
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 tools/testing/selftests/mm/folio_split_race_test.c | 2 --
 tools/testing/selftests/mm/mlock-random-test.c     | 1 -
 tools/testing/selftests/mm/pkey_sighandler_tests.c | 1 -
 tools/testing/selftests/mm/split_huge_page_test.c  | 4 ----
 4 files changed, 8 deletions(-)

diff --git a/tools/testing/selftests/mm/folio_split_race_test.c b/tools/testing/selftests/mm/folio_split_race_test.c
index 45b84f7b364e..1960635a953e 100644
--- a/tools/testing/selftests/mm/folio_split_race_test.c
+++ b/tools/testing/selftests/mm/folio_split_race_test.c
@@ -269,6 +269,4 @@ int main(void)
 				      NUM_ITERATIONS);
 
 	ksft_exit(iter == NUM_ITERATIONS);
-
-	return 0;
 }
diff --git a/tools/testing/selftests/mm/mlock-random-test.c b/tools/testing/selftests/mm/mlock-random-test.c
index 16294bc7dae6..58772914fd79 100644
--- a/tools/testing/selftests/mm/mlock-random-test.c
+++ b/tools/testing/selftests/mm/mlock-random-test.c
@@ -71,7 +71,6 @@ int get_proc_locked_vm_size(void)
 
 	fclose(f);
 	ksft_exit_fail_msg("cannot parse VmLck in /proc/self/status: %s\n", strerror(errno));
-	return -1;
 }
 
 /*
diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index 74bf79a5399d..f9c728ba96a5 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -556,5 +556,4 @@ int main(int argc, char *argv[])
 	}
 
 	ksft_finished();
-	return 0;
 }
diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 86a603692826..c01d227d7fd6 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -101,7 +101,6 @@ static bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
 	return (pfn_flags & folio_tail_flags) != folio_tail_flags;
 fail:
 	ksft_exit_fail_msg("Failed to get folio info\n");
-	return false;
 }
 
 static int check_after_split_folio_orders(char *vaddr_start, size_t len,
@@ -548,7 +547,6 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
 err_out_unlink:
 	unlink(testfile);
 	ksft_exit_fail_msg("Failed to create large pagecache folios\n");
-	return -1;
 }
 
 static void split_thp_in_pagecache_to_order_at(size_t fd_size,
@@ -711,6 +709,4 @@ int main(int argc, char **argv)
 	free(expected_orders);
 
 	ksft_finished();
-
-	return 0;
 }
-- 
2.53.0

