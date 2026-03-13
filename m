Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B26375F8A;
	Fri, 13 Mar 2026 20:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773433981; cv=none; b=J1GDZ6WT8Uwxm1FZllN776gkBCsiPJ413FT32X9Z+N0bZrGKicqScal0A8n+Hp+KDsTAToRoIOfyoJ08y4d+hI79BcA7hmme1m07nGduP12V5u8+aQaTwIfI7bSVxwF0fAKpYBoFeeKVq2GPMVLyM776R4LbNLlBOQlM9FV7LKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773433981; c=relaxed/simple;
	bh=JpJBirW5YRJ9O7ntARHf6YHyVtuL0CccCFlmEXFnSns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YZamDOKV6pv6xbfHkYSbE4YOtIwNjrFCeh1+anO8kK2I5dgthCYxyd3qT0gpyXvZ/sxSCVs3jZOh25lRZyoGtVSnoJURDmrBE6cvJHGC0cIsV3gasIqM660AkKkLyJAbp4re2ELZzGRLkdHEDimRP6Jv4EzihULYdLn3SutWNjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTgCVmxO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTgCVmxO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773433979; x=1804969979;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JpJBirW5YRJ9O7ntARHf6YHyVtuL0CccCFlmEXFnSns=;
  b=NTgCVmxOJfYtgvswVrm9SebkXHxd1g6V0sRjVzp99FqvpBPwUQL3qv9d
   NzbKOSLd9Kz27RsK/qHD6OGx5w99FVJun0gVGI7mCznNntmdV/sDkz9i1
   DqaAq+hoE3L3KkUXicGT2OEhsQ3Tu1zM/o81wrK1v6hMzX6ySlznDfP+z
   0fIQhmNWodqqXPWtoy3sQB5JzukUW3OdgdzGYUaCOCcz3bU7+W9pHuuyv
   XDK0fYB0ZPPqgvOyZAQ1vxLUPw9ltAewk+7wXmxv1qCN7vnM3i/LNd8en
   IYkMbDzsCjCr6ViV5GgG/AAymd3pYPX2YOzXuPxqmip6Lr/ouSWC98aAP
   A==;
X-CSE-ConnectionGUID: vVBmsq71TiuLwkkmY8IKjw==
X-CSE-MsgGUID: zOe7n9g5Sh+grAzl6L5Hjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74519277"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74519277"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 13:32:54 -0700
X-CSE-ConnectionGUID: rUmXAkv5RlKT/zx1kXQa4g==
X-CSE-MsgGUID: LX0odvwPQGC5dVkkesjiYw==
X-ExtLoop1: 1
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 13:32:53 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: shuah@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	tony.luck@intel.com,
	babu.moger@amd.com,
	ilpo.jarvinen@linux.intel.com
Cc: fenghuay@nvidia.com,
	peternewman@google.com,
	zide.chen@intel.com,
	dapeng1.mi@linux.intel.com,
	ben.horgan@arm.com,
	yu.c.chen@intel.com,
	jason.zeng@intel.com,
	reinette.chatre@intel.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v3 05/10] selftests/resctrl: Support multiple events associated with iMC
Date: Fri, 13 Mar 2026 13:32:32 -0700
Message-ID: <f580adeab0d8369392f9cc1421aa0806a4f32e07.1773432891.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1773432891.git.reinette.chatre@intel.com>
References: <cover.1773432891.git.reinette.chatre@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The resctrl selftests discover needed parameters to perf_event_open() via
sysfs. The PMU associated with every memory controller (iMC) is discovered
via the /sys/bus/event_source/devices/uncore_imc_N/type file while
the read memory bandwidth event type and umask is discovered via
/sys/bus/event_source/devices/uncore_imc_N/events/cas_count_read.

Newer systems may have multiple events that expose read memory bandwidth.
Running a recent kernel that includes
commit 6a8a48644c4b ("perf/x86/intel/uncore: Add per-scheduler IMC CAS count events")
on these systems expose the multiple events. For example,
 /sys/bus/event_source/devices/uncore_imc_N/events/cas_count_read_sch0
 /sys/bus/event_source/devices/uncore_imc_N/events/cas_count_read_sch1

Support parsing of iMC PMU properties when the PMU may have multiple events
to measure read memory bandwidth. The PMU only needs to be discovered once.
Split the parsing of event details from actual PMU discovery in order to
loop over all events associated with the PMU. Match all events with the
cas_count_read prefix instead of requiring there to be one file with that
name.

Make the parsing code more robust. With strings passed around to create
needed paths, use snprintf() instead of sprintf() to ensure there is
always enough space to create the path while using the standard PATH_MAX
for path lengths. Ensure there is enough room in imc_counters_config[]
before attempting to add an entry.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Tested-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Zide Chen <zide.chen@intel.com>
---
Changes since v1:
- Add Zide Chen's RB tag.

Changes since v2:
- Update changelog to note merged perf change that supports this change.
- Use PATH_MAX instead of magic number for path lengths. (Ilpo)
- Rename "org_count" -> "orig_count". (Ilpo)
- Rework flow surrounding fscanf() used in both parse_imc_read_bw_events()
  and read_from_imc_dir(). (Ilpo)
- Handle error first to reduce indentation. (Ilpo)
- Add Chen Yu's tag.
---
 tools/testing/selftests/resctrl/resctrl_val.c | 118 ++++++++++++++----
 1 file changed, 93 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 6d766347e3fc..f20d2194c35f 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -11,10 +11,10 @@
 #include "resctrl.h"
 
 #define UNCORE_IMC		"uncore_imc"
-#define READ_FILE_NAME		"events/cas_count_read"
+#define READ_FILE_NAME		"cas_count_read"
 #define DYN_PMU_PATH		"/sys/bus/event_source/devices"
 #define SCALE			0.00006103515625
-#define MAX_IMCS		20
+#define MAX_IMCS		40
 #define MAX_TOKENS		5
 
 #define CON_MBM_LOCAL_BYTES_PATH		\
@@ -109,46 +109,114 @@ static int open_perf_read_event(int i, int cpu_no)
 	return 0;
 }
 
-/* Get type and config of an iMC counter's read event. */
-static int read_from_imc_dir(char *imc_dir, unsigned int *count)
+static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
+				    unsigned int *count)
 {
-	char cas_count_cfg[1024], imc_counter_cfg[1024], imc_counter_type[1024];
+	char imc_events_dir[PATH_MAX], imc_counter_cfg[PATH_MAX];
+	unsigned int orig_count = *count;
+	char cas_count_cfg[1024];
+	struct dirent *ep;
+	int path_len;
+	int ret = -1;
+	int num_cfg;
 	FILE *fp;
+	DIR *dp;
 
-	/* Get type of iMC counter */
-	sprintf(imc_counter_type, "%s%s", imc_dir, "type");
-	fp = fopen(imc_counter_type, "r");
-	if (!fp) {
-		ksft_perror("Failed to open iMC counter type file");
+	path_len = snprintf(imc_events_dir, sizeof(imc_events_dir), "%sevents",
+			    imc_dir);
+	if (path_len >= sizeof(imc_events_dir)) {
+		ksft_print_msg("Unable to create path to %sevents\n", imc_dir);
+		return -1;
+	}
 
+	dp = opendir(imc_events_dir);
+	if (!dp) {
+		ksft_perror("Unable to open PMU events directory");
 		return -1;
 	}
-	if (fscanf(fp, "%u", &imc_counters_config[*count].type) <= 0) {
-		ksft_perror("Could not get iMC type");
+
+	while ((ep = readdir(dp))) {
+		/*
+		 * Parse all event files with READ_FILE_NAME prefix that
+		 * contain the event number and umask. Skip files containing
+		 * "." that contain unused properties of event.
+		 */
+		if (!strstr(ep->d_name, READ_FILE_NAME) ||
+		    strchr(ep->d_name, '.'))
+			continue;
+
+		path_len = snprintf(imc_counter_cfg, sizeof(imc_counter_cfg),
+				    "%s/%s", imc_events_dir, ep->d_name);
+		if (path_len >= sizeof(imc_counter_cfg)) {
+			ksft_print_msg("Unable to create path to %s/%s\n",
+				       imc_events_dir, ep->d_name);
+			goto out_close;
+		}
+		fp = fopen(imc_counter_cfg, "r");
+		if (!fp) {
+			ksft_perror("Failed to open iMC config file");
+			goto out_close;
+		}
+		num_cfg = fscanf(fp, "%1023s", cas_count_cfg);
 		fclose(fp);
+		if (num_cfg <= 0) {
+			ksft_perror("Could not get iMC cas count read");
+			goto out_close;
+		}
+		if (*count >= MAX_IMCS) {
+			ksft_print_msg("Maximum iMC count exceeded\n");
+			goto out_close;
+		}
 
-		return -1;
+		imc_counters_config[*count].type = type;
+		get_read_event_and_umask(cas_count_cfg, *count);
+		/* Do not fail after incrementing *count. */
+		*count += 1;
 	}
-	fclose(fp);
+	if (*count == orig_count) {
+		ksft_print_msg("Unable to find events in %s\n", imc_events_dir);
+		goto out_close;
+	}
+	ret = 0;
+out_close:
+	closedir(dp);
+	return ret;
+}
 
-	/* Get read config */
-	sprintf(imc_counter_cfg, "%s%s", imc_dir, READ_FILE_NAME);
-	fp = fopen(imc_counter_cfg, "r");
-	if (!fp) {
-		ksft_perror("Failed to open iMC config file");
+/* Get type and config of an iMC counter's read event. */
+static int read_from_imc_dir(char *imc_dir, unsigned int *count)
+{
+	char imc_counter_type[PATH_MAX];
+	unsigned int type;
+	int path_len;
+	FILE *fp;
+	int ret;
 
+	/* Get type of iMC counter */
+	path_len = snprintf(imc_counter_type, sizeof(imc_counter_type),
+			    "%s%s", imc_dir, "type");
+	if (path_len >= sizeof(imc_counter_type)) {
+		ksft_print_msg("Unable to create path to %s%s\n",
+			       imc_dir, "type");
 		return -1;
 	}
-	if (fscanf(fp, "%1023s", cas_count_cfg) <= 0) {
-		ksft_perror("Could not get iMC cas count read");
-		fclose(fp);
+	fp = fopen(imc_counter_type, "r");
+	if (!fp) {
+		ksft_perror("Failed to open iMC counter type file");
 
 		return -1;
 	}
+	ret = fscanf(fp, "%u", &type);
 	fclose(fp);
-
-	get_read_event_and_umask(cas_count_cfg, *count);
-	*count += 1;
+	if (ret <= 0) {
+		ksft_perror("Could not get iMC type");
+		return -1;
+	}
+	ret = parse_imc_read_bw_events(imc_dir, type, count);
+	if (ret) {
+		ksft_print_msg("Unable to parse bandwidth event and umask\n");
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.50.1

