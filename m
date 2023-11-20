Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8YPG+vT"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6F12691;
	Mon, 20 Nov 2023 03:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700479045; x=1732015045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=22cBx10DhRppnsCIlGXNuC/WP0NGzPH27j7vhPlKXIE=;
  b=Q8YPG+vT++sd3+/xfjVuBRrUoIJOFlTvmrI2tr8RSKCRuZCYu7o/+kpd
   JJsbNVZYLQ6vXWQF8eq4WDGDY4aXoE0Wb4quG2Lg1czWiRq5/rjFbLTop
   iYsRU4aBe8/Y0sYPebT2+oo8kA2jGkPH04h4H2hm7OCzSKF990g8RPtR1
   m97FBA8MzfTeuvoEmzknyrXeprCpSOT3iQWvL0gd2IvQHfSDmJChpfhhc
   rLDOnW7G7vz+QZq2vEfWsoZopEbLHMcUj70lCjqr3JDHrvZPm1jlQIDe8
   nWo3BeAw6UmLQqO3u9dV3bNtNxrygb+qXXV/Eb/J982vkp5V3E+BUFp55
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="13152215"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="13152215"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 03:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="832238714"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="832238714"
Received: from sc9itsct4906.amr.corp.intel.com (HELO localhost) ([10.249.46.107])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 03:17:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kselftest@vger.kernel.org,
	Reinette Chatre <reinette.chatre@intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	=?UTF-8?q?Maciej=20Wiecz=C3=B3r-Retman?= <maciej.wieczor-retman@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 23/26] selftests/resctrl: Add helper to convert L2/3 to integer
Date: Mon, 20 Nov 2023 13:13:37 +0200
Message-Id: <20231120111340.7805-24-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231120111340.7805-1-ilpo.jarvinen@linux.intel.com>
References: <20231120111340.7805-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"L2"/"L3" conversion to integer is embedded into get_cache_size()
which prevents reuse.

Create a helper for the cache string to integer conversion to make
it reusable.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 tools/testing/selftests/resctrl/resctrlfs.c | 28 +++++++++++++++------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrlfs.c b/tools/testing/selftests/resctrl/resctrlfs.c
index fda5ad812faa..38ca3ae562e9 100644
--- a/tools/testing/selftests/resctrl/resctrlfs.c
+++ b/tools/testing/selftests/resctrl/resctrlfs.c
@@ -94,6 +94,23 @@ int umount_resctrlfs(void)
 	return 0;
 }
 
+/*
+ * get_cache_level - Convert cache level from string to integer
+ * @cache_type:		Cache level as string
+ *
+ * Return: cache level as integer or -1 if @cache_type is invalid.
+ */
+static int get_cache_level(const char *cache_type)
+{
+	if (!strcmp(cache_type, "L3"))
+		return 3;
+	if (!strcmp(cache_type, "L2"))
+		return 2;
+
+	perror("Invalid cache level");
+	return -1;
+}
+
 /*
  * get_resource_id - Get socket number/l3 id for a specified CPU
  * @cpu_no:	CPU number
@@ -144,14 +161,9 @@ int get_cache_size(int cpu_no, const char *cache_type, unsigned long *cache_size
 	int length, i, cache_num;
 	FILE *fp;
 
-	if (!strcmp(cache_type, "L3")) {
-		cache_num = 3;
-	} else if (!strcmp(cache_type, "L2")) {
-		cache_num = 2;
-	} else {
-		perror("Invalid cache level");
-		return -1;
-	}
+	cache_num = get_cache_level(cache_type);
+	if (cache_num < 0)
+		return cache_num;
 
 	sprintf(cache_path, "/sys/bus/cpu/devices/cpu%d/cache/index%d/size",
 		cpu_no, cache_num);
-- 
2.30.2

