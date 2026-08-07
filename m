Received: from out-171.mta1.migadu.com (mta1.migadu.com [37.59.57.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632F63AF665
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 01:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.59.57.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786066645; cv=none; b=FYkLE6cNRgCVOOixppTb2IJ8OOK4Pk7DhSR1lnNWS7bCcW0Yv6ZJRpmPdbdBo014uDF6jtAjGgW1SpLuE/eMZuoqmc+cDkf6A7jFILRazdzDkUKWlJ9KfNjqvyTyulVsjxZHOhV24Nb3XTi4QmBTwduCpHMgVw1hLae+2MaeO2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786066645; c=relaxed/simple;
	bh=ooKi/5hgAKWIo7eFipGEvX4tcc1JAngsky/PNKzYghM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LNE9RK63v7kI3FgkpzW78IH9S54SS7Gp6yDU9+fxixN1J5u8jK3mGxuMIQRqBxNBF5K0L0T/WbFvjARH3cb2OD2L/N2ptXyt22zikOkEQPfdBQBq2pY2y9WftQ4ElE+1fiTmePP9wBb6nF+WYMic36Skjw2ZozFsaR0CcbSkqRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Sz7f8eXU; arc=none smtp.client-ip=37.59.57.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Sz7f8eXU"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786066630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4oEaOQeIRw0ro9hOsT1xUbGZLJYCOXyozdb8clCAcrk=;
	b=Sz7f8eXU9Wyz+0uMpxq9bTXE7Tr6CvdezAqy8gJc+Rb6zOu+kWZ3n6ZTujRO0BGmv4/ylV
	Zw6fp8ATr8wplCtnzcuwm9dZtOhsU/KEw77xHbBMxCNtY+3F9HJY5rv9VGWHvknJW7ERZe
	E8tkMC94N8uRf7orJ6f6ShtRTGfBKPM=
From: Hongfu Li <hongfu.li@linux.dev>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
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
Subject: [PATCH] selftests/mm: fix read_file() return value check
Date: Fri,  7 Aug 2026 09:35:55 +0800
Message-ID: <20260807013555.36525-1-hongfu.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hongfu Li <lihongfu@kylinos.cn>

read_file() returns 0 on open/read failures and never returns negative
values. Existing < 0 error checks never trigger, so read failures are
silently ignored. Check for zero return to detect read_file() failures.

Also fix misleading error message in get_finfo(). The error string
incorrectly references read_num when reading uevent files.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 tools/testing/selftests/mm/khugepaged.c | 4 ++--
 tools/testing/selftests/mm/vm_util.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 10e8dedcb087..506310d4b4d5 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -138,8 +138,8 @@ static void get_finfo(const char *dir)
 		     major(path_stat.st_dev), minor(path_stat.st_dev))
 	    >= sizeof(path))
 		ksft_exit_fail_msg("%s: Pathname is too long\n", __func__);
-	if (read_file(path, buf, sizeof(buf)) < 0)
-		ksft_exit_fail_perror("read_file(read_num)");
+	if (!read_file(path, buf, sizeof(buf)))
+		ksft_exit_fail_perror("read_file(uevent)");
 	if (strstr(buf, "DEVTYPE=disk")) {
 		/* Found it */
 		if (snprintf(finfo.dev_queue_read_ahead_path,
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index ef1ea11981a7..2697d50d07f4 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -755,7 +755,7 @@ unsigned long read_num(const char *path)
 {
 	char buf[21];
 
-	if (read_file(path, buf, sizeof(buf)) < 0)
+	if (!read_file(path, buf, sizeof(buf)))
 		ksft_exit_fail_perror("read_file()");
 
 	return strtoul(buf, NULL, 10);
-- 
2.54.0

