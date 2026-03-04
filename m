Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9DE2D5432;
	Wed,  4 Mar 2026 00:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772583589; cv=none; b=FNHDKp2rXOjsnP1SZ/DfbAMoS/T1dIQTEmwmXQDLtsBtQUMrlq5zV0X+jBFi/E3A60AmCktVwiWSKf/jYkj9jdDMOsr2T9w+8dStW8bIJ7c5QgYbFYztGfRM3YwcxnZvWBG0woxpJjSyfrFAf5l5RSdQtijcDNKbBN5GT0f4mSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772583589; c=relaxed/simple;
	bh=hob9aQh1XMZbD81FnL37lk3bJVYoO2scSdD/zGwwnxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KaYhLwxlKQh0twN5mkMARxMV/yuXxmDPVQ943RuHhVX9Cq5W8T8HkPN8fBwouSkgoxN0hYAdPASc2mY0HfBiEZEhf1kfOdEr0ZCGfPRGx4qeM7ThX72rMi8o+z9oXH8yNsX2ljop4o1RQv/xCVEqxGT0aH+jlJjV/W3/dVEQB7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hx/embtA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hx/embtA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772583588; x=1804119588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hob9aQh1XMZbD81FnL37lk3bJVYoO2scSdD/zGwwnxc=;
  b=hx/embtAI/Ei9DJqhwkyd0ypPHgzSOmXN1lNmEbGZlH4Gt3lka5AmVmy
   w683xrhb9QzudWxg5oTGEeFn4i5FftWVDS7nBwFWt6cdK0lVKiNvjD7H4
   YNwsIKyqZmaUeq9YIcai2zjcfatH3KzOUBmRHflcg7JBYYJ6oAF5y2Rdv
   lO8B7/rA6qOhj2tImC/lHT90eMoZ+hYYYfff7YTBrhGIsiFm+QgZGFCiC
   vvkMVz8o9QP9vlR6QM+RbV42iLIy6yU1OgP3oOXzFYEyLCELk4jVLg3EX
   DAgdeCVyYmrjAJkQyhgi6rziffD+vI4IiSr978HZ0P0DsPMnrMhFE3DSj
   w==;
X-CSE-ConnectionGUID: TEhxIc5LQTGIbdKyA1wVKQ==
X-CSE-MsgGUID: 7SlqCGKATnaHk1LwQRCN4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73545015"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73545015"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 16:19:45 -0800
X-CSE-ConnectionGUID: xLWE3AC0R3OMo5k4VtH4xg==
X-CSE-MsgGUID: /I4i6ZWiR+6zovVL2mJlNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="218120391"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 16:19:45 -0800
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
	reinette.chatre@intel.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v2 3/9] selftests/resctrl: Prepare for parsing multiple events per iMC
Date: Tue,  3 Mar 2026 16:19:32 -0800
Message-ID: <14c1a6e0dfc6a287851de00becc41d67983a4c9a.1772582958.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1772582958.git.reinette.chatre@intel.com>
References: <cover.1772582958.git.reinette.chatre@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The events needed to read memory bandwidth are discovered by iterating
over every memory controller (iMC) within /sys/bus/event_source/devices.
Each iMC's PMU is assumed to have one event to measure read memory
bandwidth that is represented by the sysfs cas_count_read file. The event's
configuration is read from "cas_count_read" and stored as an element of
imc_counters_config[] by read_from_imc_dir() that receives the
index of the array where to store the configuration as argument.

It is possible that an iMC's PMU may have more than one event that should
be used to measure memory bandwidth.

Change semantics to not provide the index of the array to
read_from_imc_dir() but instead a pointer to the index. This enables
read_from_imc_dir() to store configurations for more than one event by
incrementing the index to imc_counters_config[] itself.

Ensure that the same type is consistently used for the index as it is
passed around during counter configuration.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: Zide Chen <zide.chen@intel.com>
---
Changes since v1:
- Add Zide Chen's RB tag.
---
 tools/testing/selftests/resctrl/resctrl_val.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 2cc22f61a1f8..25c8101631e0 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -73,7 +73,7 @@ static void read_mem_bw_ioctl_perf_event_ioc_disable(int i)
  * @cas_count_cfg:	Config
  * @count:		iMC number
  */
-static void get_read_event_and_umask(char *cas_count_cfg, int count)
+static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
 {
 	char *token[MAX_TOKENS];
 	int i = 0;
@@ -110,7 +110,7 @@ static int open_perf_read_event(int i, int cpu_no)
 }
 
 /* Get type and config of an iMC counter's read event. */
-static int read_from_imc_dir(char *imc_dir, int count)
+static int read_from_imc_dir(char *imc_dir, unsigned int *count)
 {
 	char cas_count_cfg[1024], imc_counter_cfg[1024], imc_counter_type[1024];
 	FILE *fp;
@@ -123,7 +123,7 @@ static int read_from_imc_dir(char *imc_dir, int count)
 
 		return -1;
 	}
-	if (fscanf(fp, "%u", &imc_counters_config[count].type) <= 0) {
+	if (fscanf(fp, "%u", &imc_counters_config[*count].type) <= 0) {
 		ksft_perror("Could not get iMC type");
 		fclose(fp);
 
@@ -147,7 +147,8 @@ static int read_from_imc_dir(char *imc_dir, int count)
 	}
 	fclose(fp);
 
-	get_read_event_and_umask(cas_count_cfg, count);
+	get_read_event_and_umask(cas_count_cfg, *count);
+	*count += 1;
 
 	return 0;
 }
@@ -196,13 +197,12 @@ static int num_of_imcs(void)
 			if (temp[0] >= '0' && temp[0] <= '9') {
 				sprintf(imc_dir, "%s/%s/", DYN_PMU_PATH,
 					ep->d_name);
-				ret = read_from_imc_dir(imc_dir, count);
+				ret = read_from_imc_dir(imc_dir, &count);
 				if (ret) {
 					closedir(dp);
 
 					return ret;
 				}
-				count++;
 			}
 		}
 		closedir(dp);
-- 
2.50.1

