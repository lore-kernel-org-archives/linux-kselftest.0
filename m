Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F0B2D0614;
	Sat,  4 Apr 2026 01:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775267808; cv=none; b=joqf3wWaojBWaOdPzeyrFQAZ4aBjkn5+/U6ySg50dZiOiE3qIKwccv0tiC+oIw94wt1oAJPar/Xp8s4UU2qYmPxA/f3+moiPo9qDh1ZMGohLCwzG5gL2XH1G9Z81K59F+vGZyc3crcdRA5oi2MB8cPrFY8iKRZZZ1F2YBrUk+d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775267808; c=relaxed/simple;
	bh=+e0ebtv/vNWs+rImF+Hmwl1LRUjj2AOg7Qf985TDIxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ax6WC1l1TGCJlFgP2+kkrXjhpzlh8K5c5Abub2y3vKYCquFpx8yD0uaA56b8CR8Bl+0TbuTZJRao+30PSBp4YJeFw7qdGHLy+4kp3Q6nmsM99Es2RWnhNao9pO+rR3u5YlLDyp2JcJYE16Jn2aktVwXzmdGzcL+OWl2/r4uuK9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULhIqFK4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULhIqFK4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775267807; x=1806803807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+e0ebtv/vNWs+rImF+Hmwl1LRUjj2AOg7Qf985TDIxU=;
  b=ULhIqFK4vzlUEZvocD8FkeG4dBtk4kSxvfCRYjylHTARuno9Nhs6iih3
   GWrpYmziXmBPbA+SsrQHHFNDKlzjyQbpfQHYydo6SMIvPonGBqAxrzg7w
   BXJBWFN0L1RWAcoA8oZxSZQrhFyyXGceksL03jS+8kjuiwUQvlAG7Cgpx
   hwzZwtdT8mlwHryEHy/VcrXEqXLtxqRmPa7wtkDYyovr6HBsaEcpw8zjo
   tLjTLFo7d7JXuqF5wGM5/OcP+idJMFBX136M8K8QZUhSkZtpa6EpPbWbf
   OsxBm2meATI8ly/ewYvxNedLx+GHZ6nLx1Wj6scCisPXNNBipZYyKKSRv
   g==;
X-CSE-ConnectionGUID: gMAvRPV9Q2yuJlc3CBEZsw==
X-CSE-MsgGUID: E4NvYcaBQ/KklA/zF11anQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="76343394"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="76343394"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 18:56:44 -0700
X-CSE-ConnectionGUID: RxtRqjTBTvqX6MIq5nwRZA==
X-CSE-MsgGUID: 5cUT8QuFRCare4ykTHjyDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="224121538"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 18:56:17 -0700
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
Subject: [PATCH v4 04/10] selftests/resctrl: Prepare for parsing multiple events per iMC
Date: Fri,  3 Apr 2026 18:56:03 -0700
Message-ID: <549e026d20af0381349e645c912e6470fce8bd7e.1775266384.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1775266384.git.reinette.chatre@intel.com>
References: <cover.1775266384.git.reinette.chatre@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Tested-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Zide Chen <zide.chen@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v1:
- Add Zide Chen's RB tag.

Changes since v2:
- Add Chen Yu's tag.

Changes since v3:
- Add Ilpo's RB tag.
---
 tools/testing/selftests/resctrl/resctrl_val.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 71d6f88cc1f7..6d766347e3fc 100644
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

