Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE6C2D2487
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 05:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786425289; cv=none; b=O8cMLowMMw/rcfifj/NNcWIG99XFWIJVwyT4PEHZQBnetIxEwB46/OFwqq39chVDRsmSs6smPADESiArg1PCUTqfbu/pZDt6QFDOPOh+wnsASie1WeMn/49FOOK3hrsbDDDJI7/PtB/dqGBw7mbJMud76dliYJpV609B+BgSDAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786425289; c=relaxed/simple;
	bh=9NMcPby5e6rXk1vRCnt7LBo3EfvPl9vQf/owvWFarXw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gbW475wSF3fudYJijMDQvOvSVmxGLg37retKD7u4UrxjDhtmYk/gwDfB9xEYmyoHp6Wb+pkVTgO+nEcIvDOHFCNyF0Ql+aOumAH2pScZRFTImtyM0r1Ck2cQfLLsQoSjQSgyptOsWATxwUmr6Q/YE6L+Q+uNFF+i2yhudDWdP7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gpwzW/XU; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gpwzW/XU"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a3514f912so654978b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 22:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786425287; x=1787030087; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKQ5y3/WZDtJVgzNVhjxBkStuBbcXc8sEx+vbwtqdLY=;
        b=gpwzW/XU0PX30wh+Qmef9nQy38BoecMwmBw8gqlxKPHK55xOVX3yjeDLUHtvuDCMZA
         g6/3WWUlQo6EXf6v/zNCG8bsGvrsJMl1ukGjKF0XxA1kEBJv7MtGRUrN4pFUYKnGsfWf
         oLQCRbVpf2LzW3sBO/qLOSDaMo4Ma9Xub7xs1c7nybjGwDViZQYQlKTTHjj9s8WiYQed
         jow32whBWNJe8PGxczBcOEEm6oy4JqYspbr2//mC4200CeFrijyopRu1LD4qKbskTBqE
         sT6ixEopv5gnCH8mUFbGUhLz8HJnecC+bzBsbRZLlMDJNfUVi829XJ9u/6GWJ/ZZ/pzm
         Y3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786425287; x=1787030087;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKQ5y3/WZDtJVgzNVhjxBkStuBbcXc8sEx+vbwtqdLY=;
        b=NCzh87JVrzOzkVhaeoccr1HbIgvwECAqF8+8BLzeUbFdh5jLev4fiTtX0WG1aMiPh4
         L0Vw6HWiBvxSAw9NlKJFLrS5oV/z4izyDWdKAbQq4cFIPWZpT90gE70tPE++3CUy1RLY
         1k86wPmEoRmL8dqmbB7azmtkGOtEJ5uiFBU7tXdviqzkqhaTifmqD025vAHCM/kcQpL/
         +Xf/aClvpK0iQhhLEyhIqHoUu1ZAq9ME2PFUUMCPHnVFJ8TYQtf+UAiasxmlZalNdaxo
         fhuiH/Uj6Fy+UJyaI+fvQ2ImBy14fo+k1XdUDE5QiYcoUwKCMG42cD4HYzFBb8S4Hkeg
         ousg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9gKeKM2Yt2+3HSG31jIgYQYZ4U56xJuL/HXHz+2MTx2hu9IAabdOpe+9aRpeA+Z0RHQHpg5QcU+0P3MBwLB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSza56b2QwJ9zZu+aG2p36cAtLZjXTpfawH1SKkmz8bw3dXSOJ
	HcGdKZBxeIHcNEJiDfag50DzGh7SeSkao7q3/CBhrKGlH3WEFfLzPPwoLZlHuq1kjlbRf83xsat
	gtjnURp1DcA==
X-Received: from pgjf16.prod.google.com ([2002:a63:dc50:0:b0:cbb:9724:677e])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4396:b0:845:c7f1:29fa
 with SMTP id d2e1a72fcca58-84fa8925a45mr581713b3a.30.1786425287210; Mon, 10
 Aug 2026 22:14:47 -0700 (PDT)
Date: Tue, 11 Aug 2026 05:14:11 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260811051434.3805648-1-wfelipe@google.com>
Subject: [PATCH v2] selftests/cgroup: test_zswap: skip test_no_kmem_bypass if
 debugfs is unavailable
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Tejun Heo <tj@kernel.org>, "=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"

test_no_kmem_bypass() needs to read
/sys/kernel/debug/zswap/stored_pages via get_zswap_stored_pages() to
verify that compressed pages are charged to the memcg.

When running in an environment where debugfs is not mounted or
CONFIG_DEBUG_FS is disabled, get_zswap_stored_pages() fails, causing the
loop to terminate early and report a false negative (KSFT_FAIL).

Selftests should not fail if debugfs is unavailable, and it should print
a message when it is skipped.

While I'm here, also add a warning message if the test is being skipped
due to totalram size and make the check for totalram more readable.

Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
---
v1 -> v2:
  - Check for debugfs availability using access("/sys/kernel/debug/zswap/stored_pages", R_OK)
    instead of calling get_zswap_stored_pages() (Yosry Ahmed).
  - Update debugfs print message to exactly match gup_test.c (Anshuman Khandual).
  - Add GB(x) macro to cgroup_util.h (Yosry Ahmed). Cast to unsigned long long
    to prevent 32-bit truncation without altering existing MB(x) signedness.
  - Update RAM check to GB(4) to match comments and format totalram output
    with 1 decimal place (%.1fGB) (Yosry Ahmed).
  - Fix commit message typo (Yosry Ahmed).
  - Moved stored_pages back inside the for loop.

v1: https://lore.kernel.org/all/20260801041255.752039-1-wfelipe@google.com/

 .../selftests/cgroup/lib/include/cgroup_util.h      |  1 +
 tools/testing/selftests/cgroup/test_zswap.c         | 13 +++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
index febc1723d0903..c0f07226b222f 100644
--- a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
+++ b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
@@ -7,6 +7,7 @@
 #endif

 #define MB(x) (x << 20)
+#define GB(x) ((unsigned long long)(x) << 30)

 #define USEC_PER_SEC	1000000L
 #define NSEC_PER_SEC	1000000000L
diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 49b36ee791606..a836337440040 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -20,6 +20,7 @@ static int page_size;

 #define PATH_ZSWAP "/sys/module/zswap"
 #define PATH_ZSWAP_ENABLED "/sys/module/zswap/parameters/enabled"
+#define PATH_ZSWAP_STORED_PAGES "/sys/kernel/debug/zswap/stored_pages"

 static int read_int(const char *path, size_t *value)
 {
@@ -55,7 +56,7 @@ static int read_min_free_kb(size_t *value)

 static int get_zswap_stored_pages(size_t *value)
 {
-	return read_int("/sys/kernel/debug/zswap/stored_pages", value);
+	return read_int(PATH_ZSWAP_STORED_PAGES, value);
 }

 static long get_cg_wb_count(const char *cg)
@@ -570,8 +571,16 @@ static int test_no_kmem_bypass(const char *root)
 	/* Read sys info and compute test values accordingly */
 	if (sysinfo(&sys_info) != 0)
 		return KSFT_FAIL;
-	if (sys_info.totalram > 5000000000)
+	if (sys_info.totalram > GB(4)) {
+		ksft_print_msg(
+			"requires less than 4GB total ram, sys_info.totalram: %.1fGB\n",
+			(double)sys_info.totalram / GB(1));
 		return KSFT_SKIP;
+	}
+	if (access(PATH_ZSWAP_STORED_PAGES, R_OK)) {
+		ksft_print_msg("mount debugfs at /sys/kernel/debug\n");
+		return KSFT_SKIP;
+	}
 	values = mmap(0, sizeof(struct no_kmem_bypass_child_args), PROT_READ |
 			PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
 	if (values == MAP_FAILED)
--
2.55.0.679.g6767b8d81c-goog
