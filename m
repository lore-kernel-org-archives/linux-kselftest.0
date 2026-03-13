Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A164637418E;
	Fri, 13 Mar 2026 20:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773433980; cv=none; b=kOP/WFwfPzuuh1ImjG/fQ2negBF0/0PXJ7pA6FnF4UWzXTovwsB3KA0lkjA4sDWCLzMrHPF1AZNcTqWuxWzF4L5//WC3yiNKda9mJ8eOP+sDXL09DIq/y6xnK+VigTfmQxjlqhDTHyy06KOK2EUtdK/d3synvGSxQ7wWoVTHH6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773433980; c=relaxed/simple;
	bh=5Qmoh1Ru8vMO1Nfg8X9L40uIhnik+WL6a07fapKwUMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aD6J4aNrrzi8k5v83iI8IEMWa/f1U9Fhiw3yNm7wVM0pCA9i0b3+HhvaSKoCKKMse/Vybs++mvx8xA0IN2OYAEYTPyljuoGO9617w3D69/KszNdcbgB2bReoJBUW+Yk8X1rA0gd/QNaTpYu94jtLuF6zFcflWWP1FFzxU6D1JRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=flIieYJt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flIieYJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773433976; x=1804969976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5Qmoh1Ru8vMO1Nfg8X9L40uIhnik+WL6a07fapKwUMA=;
  b=flIieYJtHIto4bTRU7X7Q0qwAG9/N6DBnYRa37hBfF7BNjpNdCHzhM5+
   2Pa+4iwx1X+fPTTBJsE2Vu//iuvthv6eXIHJ0b/XjxtyAEsNDzf0BuHsY
   zShPu2+jKWxX97XkNto/ZiC4UFkr4WOQrUGS1Ilw9LHWXO4BrJRiyhvP9
   ZTJwZITjWaKWWMDeOcwmuZw9tg4GWPpcbnwVtvqq2lAA+NoToWZ/nKzeS
   DwP7/rIfGXlERWWwqsp15TadXAh9AHPT86zKPuFqD07bJsbfNfueqFV/R
   U+opb+TkmpqOV2j9DJy/QU5L6gXOxbhcgU38TURtg4CR3hZ5SsfDqL6Rf
   Q==;
X-CSE-ConnectionGUID: 5+pVJRIzSVeLI/TzpXOn5Q==
X-CSE-MsgGUID: 2DDa6RptTBqP0aetje88Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74519261"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74519261"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 13:32:52 -0700
X-CSE-ConnectionGUID: iCw53FMmSSu4kTdbYbFHLw==
X-CSE-MsgGUID: q0fTUhVzQx+h2gaOhI5r4w==
X-ExtLoop1: 1
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 13:32:52 -0700
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
Subject: [PATCH v3 03/10] selftests/resctrl: Do not store iMC counter value in counter config structure
Date: Fri, 13 Mar 2026 13:32:30 -0700
Message-ID: <740f2fe57503ea8baf8e4b5bcdf5680e90f76c3a.1773432891.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1773432891.git.reinette.chatre@intel.com>
References: <cover.1773432891.git.reinette.chatre@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MBM and MBA tests compare MBM memory bandwidth measurements against
the memory bandwidth event values obtained from each memory controller's
PMU. The memory bandwidth event settings are discovered from the memory
controller details found in /sys/bus/event_source/devices/uncore_imc_N and
stored in struct imc_counter_config.

In addition to event settings struct imc_counter_config contains
imc_counter_config::return_value in which the associated event value is
stored on every read.

The event value is consumed and immediately recorded at regular intervals.
The stored value is never consumed afterwards, making its storage as part
of event configuration unnecessary.

Remove the return_value member from struct imc_counter_config. Instead
just use a more aptly named "measurement" local variable for use during
event reading.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Tested-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v2:
- Rename "return_value" -> "measurement". (Ilpo)
- Add Ilpo's Rb tag.
- Add Chen Yu's tag.
---
 tools/testing/selftests/resctrl/resctrl_val.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index a5a8badb83d4..71d6f88cc1f7 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -32,7 +32,6 @@ struct imc_counter_config {
 	__u64 event;
 	__u64 umask;
 	struct perf_event_attr pe;
-	struct membw_read_format return_value;
 	int fd;
 };
 
@@ -312,23 +311,23 @@ static int get_read_mem_bw_imc(float *bw_imc)
 	 * Take overflow into consideration before calculating total bandwidth.
 	 */
 	for (imc = 0; imc < imcs; imc++) {
+		struct membw_read_format measurement;
 		struct imc_counter_config *r =
 			&imc_counters_config[imc];
 
-		if (read(r->fd, &r->return_value,
-			 sizeof(struct membw_read_format)) == -1) {
+		if (read(r->fd, &measurement, sizeof(measurement)) == -1) {
 			ksft_perror("Couldn't get read bandwidth through iMC");
 			return -1;
 		}
 
-		__u64 r_time_enabled = r->return_value.time_enabled;
-		__u64 r_time_running = r->return_value.time_running;
+		__u64 r_time_enabled = measurement.time_enabled;
+		__u64 r_time_running = measurement.time_running;
 
 		if (r_time_enabled != r_time_running)
 			of_mul_read = (float)r_time_enabled /
 					(float)r_time_running;
 
-		reads += r->return_value.value * of_mul_read * SCALE;
+		reads += measurement.value * of_mul_read * SCALE;
 	}
 
 	*bw_imc = reads;
-- 
2.50.1

