Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567FA389451;
	Fri, 23 Jan 2026 04:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.61.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769142987; cv=none; b=MhA8jYCPTLLxED4/mxxUUKp6et4eg4elDVRM8YX5t3WDQqxtQURtEPl3UA583PV28TffEeO7frgImp5p7yXVGvgonmwyRS+vNlLyykf0d/UGEUTy22T4a28wG0bbHF1xP6Ww/zO3/tGKwdqZHzsSN1/L+6o8xi7pSHiUQk52XJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769142987; c=relaxed/simple;
	bh=FwqtJH3O7glTJxFVBCwFNvRnU+Vt8HLfDNj4oBrDJwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=av40mMaFxd6uAupcrFuMl7TLecT8MMAG80zA0G0dllkEKXAyt1Y0rQ4xwgC60JwtylhKXH6m1xCU68KNofFZsqvQ466b3OhHG95JsRFoVPEfsOzkrMG+nNWSkNPN6xlcq1wQ8G9CL8uywoBpzDw7ZEaLKIbLpGiWNmbqCrk0Is8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=n1pexdng; arc=none smtp.client-ip=139.138.61.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="n1pexdng"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769142982; x=1800678982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FwqtJH3O7glTJxFVBCwFNvRnU+Vt8HLfDNj4oBrDJwQ=;
  b=n1pexdngPbCUGPQnNtHrFV4qojmD119iUa67+hud0cgsJTGQ8pCl8h7C
   QI8PFd6nMISHCv1ftx4qnkUJlCqdllKy/hjAV43JrkWUwof9wQXDJPjJ/
   LKWzLfXAwYQaat0bFrta91azy3F2LQx2C6yEIiy8RdJgEExcL4MW0oH3Z
   hJOIoP7N6OyjlXyuw4CgK54uFwcw7O9HBYY6giNE627hiyHDXDVnNfRWN
   Yiea7UFJrAyiMcD+BYmDmcDZJCP2J61f+LSXp3e9Hiia9NIFBAinwLB2Z
   Coo6weP4c/WVaI9E3zmW60vjfmQav5VFcQcDkXC9g9iCjmYquzyeqDtaL
   g==;
X-CSE-ConnectionGUID: EEna0CipSv+agJYWWSEKbQ==
X-CSE-MsgGUID: VVIahQ/LRQWwYYIo8+8tUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="214737178"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="214737178"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:35:07 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 8A7E5406ED8;
	Fri, 23 Jan 2026 04:35:09 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 3B752100596A;
	Fri, 23 Jan 2026 04:35:09 +0000 (UTC)
Received: from sm-arm-grace06.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B34BA1001528;
	Fri, 23 Jan 2026 04:35:04 +0000 (UTC)
From: Shaopeng Tan <tan.shaopeng@fujitsu.com>
To: fenghuay@nvidia.com,
	reinette.chatre@intel.com,
	ben.horgan@arm.com,
	james.morse@arm.com,
	shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tan.shaopeng@fujitsu.com
Subject: [RFC PATCH 1/5] kselftests/resctrl: Detect the ARM architecture
Date: Fri, 23 Jan 2026 13:40:27 +0900
Message-ID: <20260123044034.141247-2-tan.shaopeng@fujitsu.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The resctrl test is not enabled for MPAM (ARM Memory System Resource
Partitioning and Monitoring)
Add processing to detect the ARM architecture.

Signed-off-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
---
 tools/testing/selftests/resctrl/resctrl.h       | 1 +
 tools/testing/selftests/resctrl/resctrl_tests.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 3c51bdac2dfa..492d2a1c4033 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -38,6 +38,7 @@
  */
 #define ARCH_INTEL     1
 #define ARCH_AMD       2
+#define ARCH_ARM       3
 
 #define END_OF_TESTS	1
 
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index 5154ffd821c4..662968d38eca 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -8,6 +8,7 @@
  *    Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
  *    Fenghua Yu <fenghua.yu@intel.com>
  */
+#include <sys/utsname.h>
 #include "resctrl.h"
 
 /* Volatile memory sink to prevent compiler optimizations */
@@ -26,6 +27,7 @@ static struct resctrl_test *resctrl_tests[] = {
 static int detect_vendor(void)
 {
 	FILE *inf = fopen("/proc/cpuinfo", "r");
+	struct utsname system_info;
 	int vendor_id = 0;
 	char *s = NULL;
 	char *res;
@@ -42,6 +44,11 @@ static int detect_vendor(void)
 		vendor_id = ARCH_INTEL;
 	else if (s && !strcmp(s, ": AuthenticAMD\n"))
 		vendor_id = ARCH_AMD;
+	else {
+		uname(&system_info);
+		if (strstr(system_info.machine, "aarch64") != NULL)
+			vendor_id = ARCH_ARM;
+	}
 
 	fclose(inf);
 	free(res);
-- 
2.47.3

