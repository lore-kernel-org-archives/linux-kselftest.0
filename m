Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC25E1E4BE;
	Wed, 25 Mar 2026 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446876; cv=none; b=B6VGL1yUf6rQJDmgUzIzJTsgpiK1jIbBfpheiz3qCwHEIaH0bKNavKMFP41IHNrKaEaelqgSXMN7FkxUK12EbejnNZy4n2+OiUGw06JEJWkczXSBbgo3ZZP9NuC1drbMdDDlyPD0tZsggWIR2QSo0q8aLSczY5cqUnaVAx33dF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446876; c=relaxed/simple;
	bh=wgp0SjYoRR44B2tHWnnq/VcMYS5qes3027AaqSIve4Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PaMnMy/Lnzhym2IBatOEMdkBUl3dK0f+OJIx8GjD1XNO/0+/sWoJb9mO1kuIKJjoV1Ijo/0FlnxbuMgw5uE2JPDMR2xli7awntR12F4pUCyjdu63xCsQs2fevq55gcsuw0e+F3IM3W4MVWeexNg81MZid9k+m5ArsWOmIP6zmk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqUlb6jT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqUlb6jT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774446875; x=1805982875;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wgp0SjYoRR44B2tHWnnq/VcMYS5qes3027AaqSIve4Y=;
  b=dqUlb6jTlGei5BEggV+1d+1wCRt/85jfHyrhKShXsASSsdIsAY0Tt9Rr
   7sa2OA3Ri78a7Y2OzRPDb+185SYi63ycNU2Zjz6G4HUNsM9Z1fcIlYE1L
   fMFo+N4mBW4igyhpj+u4eE3NFt498Sbxe9a69MRTPY5ax5VjHKppDzbfF
   3lUjPDmnlz774jvu8ggOi+EsJulkDjQJfHbgOBo5sksAe9aJIhUZGkOHJ
   6VEr9LBJnB5yqEoF9KoNiF8H05ayYHp0uDHlTcFYzzmk9iC3JIUTpxHEV
   pb6a2kI78QDmgdgcO4ERKhQRLa3uQvmkp6dZJrYmMzTtH86Yc+s/Jsm+P
   Q==;
X-CSE-ConnectionGUID: Hg05hpT7RSu9qhyP7tHv7g==
X-CSE-MsgGUID: nvyLhTkiSCW8g8wAZ9rYfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79340692"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79340692"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:54:35 -0700
X-CSE-ConnectionGUID: 3+Jqs4KqQ+2s0BgiwHYSSg==
X-CSE-MsgGUID: Bo/QVUjZTUS6sA5ueMepMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="223758603"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:54:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Mar 2026 15:54:27 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Shuah Khan <shuah@kernel.org>, 
    Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 6/7] platform/x86/amd/pmf: Introduce AMD PMF testing
 tool for driver metrics and features
In-Reply-To: <20260301131124.1370565-7-Shyam-sundar.S-k@amd.com>
Message-ID: <91a389ee-2020-373a-20fa-9183d70f8684@linux.intel.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com> <20260301131124.1370565-7-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+ Selftest people.

On Sun, 1 Mar 2026, Shyam Sundar S K wrote:

> This tool leverages amd-pmf ioctls exposed via the util layer, allowing
> validation of its newly integrated util layer and /dev/amdpmf_interface.
> It includes a user-space test application, test_pmf, designed to interact
> with the PMF driver and retrieve relevant metrics for the testing and
> analysis.
> 
> It provides definitions for test metrics, feature IDs, and device states,
> and includes tests for various AMD PMF metrics such as power source, skin
> temperature, battery state, and custom BIOS inputs/outputs. It also
> enables the testing of PMF metrics data and feature support reporting.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  tools/testing/selftests/Makefile              |   1 +
>  .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
>  .../drivers/platform/x86/amd/pmf/test_pmf.c   | 243 ++++++++++++++++++
>  3 files changed, 252 insertions(+)
>  create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
>  create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c

Please Cc also selftest people in the next version submission! Maube you 
should also check why your patch sending process did not capture those 
receipient for you.

To me it looks this "tool" doesn't really perform a selftest the way I've 
understood "selftests" work. That is, it doesn't have notion of Pass/Fail 
at all AFAICT. I'm not sure if there are other selftests like this but 
hopefully the selftest people know.

> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 450f13ba4cca..d850fb09eeb9 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -26,6 +26,7 @@ TARGETS += drivers/net/netconsole
>  TARGETS += drivers/net/team
>  TARGETS += drivers/net/virtio_net
>  TARGETS += drivers/platform/x86/intel/ifs
> +TARGETS += drivers/platform/x86/amd/pmf
>  TARGETS += dt
>  TARGETS += efivarfs
>  TARGETS += exec
> diff --git a/tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile b/tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
> new file mode 100644
> index 000000000000..876424941e83
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +CFLAGS += $(KHDR_INCLUDES)
> +
> +TEST_GEN_PROGS := test_pmf
> +
> +top_srcdir ?=../../../../..
> +
> +include ../../../../../lib.mk
> diff --git a/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c b/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
> new file mode 100644
> index 000000000000..a040ef01ba90
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
> @@ -0,0 +1,243 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD Platform Management Framework Test Tool
> + *
> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *	    Sanket Goswami <Sanket.Goswami@amd.com>
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <inttypes.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <unistd.h>
> +#include <linux/amd-pmf.h>
> +
> +#include "../../../../../kselftest.h"
> +
> +#define DEVICE_NODE		"/dev/amdpmf_interface"
> +
> +static int pmf_open_device(void)
> +{
> +	int fd;
> +
> +	fd = open(DEVICE_NODE, O_RDONLY);
> +	if (fd < 0)
> +		fprintf(stderr, "opening PMF Device Node failed: %s\n", strerror(errno));
> +
> +	return fd;
> +}
> +
> +/* Helper to run IOCTL_PMF_POPULATE_DATA for one control code and return 0 on success. */

Reflow this comment to 80 chars.

> +static int pmf_get_fd(int fd, enum pmf_ioctl_id code, struct amd_pmf_ioctl_info *out)
> +{
> +	struct amd_pmf_ioctl_info info = {0};

= {}; should be enough to initialize to default values.

> +	int ret;
> +
> +	if (!out)
> +		return -EINVAL;
> +
> +	info.control_code = code;
> +
> +	ret = ioctl(fd, IOCTL_PMF_POPULATE_DATA, &info);
> +	if (ret < 0)
> +		return ret;
> +
> +	*out = info;
> +	return 0;
> +}
> +
> +static int pmf_get_data(enum pmf_ioctl_id code, struct amd_pmf_ioctl_info *out)
> +{
> +	int fd, ret;
> +
> +	fd = pmf_open_device();
> +	if (fd < 0)
> +		return fd;
> +
> +	ret = pmf_get_fd(fd, code, out);
> +
> +	close(fd);
> +	return ret;
> +}
> +
> +static int pmf_get_feature_status(unsigned int code)
> +{
> +	struct amd_pmf_ioctl_info info = {0};
> +	int ret;
> +
> +	ret = pmf_get_data(code, &info);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (code) {
> +	case IOCTL_FEATURE_AUTO_MODE:
> +		printf("Auto Mode: %-24s\n", info.feature_supported ? "Yes" : "No");
> +		break;
> +	case IOCTL_FEATURE_STATIC_POWER_SLIDER:
> +		printf("Static Power Slider: %-24s\n", info.feature_supported ? "Yes" : "No");
> +		break;
> +	case IOCTL_FEATURE_POLICY_BUILDER:
> +		printf("Policy Builder: %s\n", info.feature_supported ? "Yes" : "No");
> +		break;
> +	case IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC:
> +		printf("Dynamic Power Slider AC: %s\n", info.feature_supported ? "Yes" : "No");
> +		break;
> +	case IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC:
> +		printf("Dynamic Power Slider DC: %s\n", info.feature_supported ? "Yes" : "No");
> +		break;
> +	default:
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pmf_get_device_state(unsigned int code)
> +{
> +	struct amd_pmf_ioctl_info info = {0};
> +	int ret;
> +
> +	ret = pmf_get_data(code, &info);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (code) {
> +	case IOCTL_PLATFORM_TYPE:
> +		printf("Platform Type: %s\n", platform_type_as_str(info.val));
> +		break;
> +	case IOCTL_LAPTOP_PLACEMENT:
> +		printf("Laptop placement: %s\n", laptop_placement_as_str(info.val));
> +		break;
> +	case IOCTL_LID_STATE:
> +		printf("Lid State: %s\n", info.val ? "Close" : "Open");
> +		break;
> +	case IOCTL_USER_PRESENCE:
> +		printf("User Presence: %s\n", info.val ? "Present" : "Away");
> +		break;
> +	default:
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pmf_get_custom_bios_input(unsigned int code)
> +{
> +	struct amd_pmf_ioctl_info info = {0};
> +	int idx, ret;
> +
> +	ret = pmf_get_data(code, &info);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (code) {
> +	case IOCTL_BIOS_INPUT_1 ... IOCTL_BIOS_INPUT_10:
> +		idx = amd_pmf_get_bios_idx(code);
> +		printf("Custom BIOS input%u: %lu\n", idx + 1, (int64_t)info.val);

%lu is for printing unsigned long, not int64_t.

> +		break;
> +	default:
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pmf_get_bios_output(unsigned int code)
> +{
> +	struct amd_pmf_ioctl_info info = {0};
> +	int idx, ret;
> +
> +	ret = pmf_get_data(code, &info);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (code) {
> +	case IOCTL_BIOS_OUTPUT_1 ... IOCTL_BIOS_OUTPUT_10:
> +		idx = amd_pmf_get_bios_idx(code);
> +		printf("BIOS output%u: %lu\n", idx + 1, (int64_t)info.val);
> +		break;
> +	default:
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pmf_get_misc_info(unsigned int code)
> +{
> +	struct amd_pmf_ioctl_info info = {0};
> +	int ret;
> +
> +	ret = pmf_get_data(code, &info);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (code) {
> +	case IOCTL_POWER_SLIDER_POSITION:
> +		printf("Slider Position: %s\n", ta_slider_as_str(info.val));
> +		break;
> +	case IOCTL_SKIN_TEMP:
> +		printf("Skin Temperature: %lu\n", (int64_t)info.val);
> +		break;
> +	case IOCTL_GFX_WORKLOAD:
> +		printf("GFX Busy: %lu\n", (int64_t)info.val);
> +		break;
> +	case IOCTL_AMBIENT_LIGHT:
> +		printf("Ambient Light: %ld\n", (int64_t)info.val);
> +		break;
> +	case IOCTL_AVG_C0_RES:
> +		printf("Avg C0 Residency: %lu\n", (int64_t)info.val);
> +		break;
> +	case IOCTL_MAX_C0_RES:
> +		printf("Max C0 Residency: %lu\n", (int64_t)info.val);
> +		break;
> +	case IOCTL_SOCKET_POWER:
> +		printf("Socket Power: %lu\n", (int64_t)info.val);

Please think the printf formatting strings and types through.

> +		break;
> +	default:
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +int main(void)
> +{
> +	unsigned int idx;
> +
> +	printf("Feature Name          Supported\n");
> +	printf("---------------------------------\n");
> +	for (idx = IOCTL_FEATURE_AUTO_MODE; idx <= IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC; idx++)
> +		pmf_get_feature_status(idx);
> +
> +	printf("\nDevice State\n---------------\n");
> +	for (idx = IOCTL_PLATFORM_TYPE; idx <= IOCTL_USER_PRESENCE; idx++)
> +		pmf_get_device_state(idx);
> +
> +	printf("\nCustom BIOS Inputs\n-------------------\n");
> +	for (idx = IOCTL_BIOS_INPUT_1; idx <= IOCTL_BIOS_INPUT_10; idx++)
> +		pmf_get_custom_bios_input(idx);
> +
> +	printf("\nBIOS Outputs\n--------------\n");
> +	for (idx = IOCTL_BIOS_OUTPUT_1; idx <= IOCTL_BIOS_OUTPUT_10; idx++)
> +		pmf_get_bios_output(idx);
> +
> +	printf("\nMisc\n------\n");
> +	pmf_get_misc_info(IOCTL_SKIN_TEMP);
> +	pmf_get_misc_info(IOCTL_GFX_WORKLOAD);
> +	pmf_get_misc_info(IOCTL_AMBIENT_LIGHT);
> +	pmf_get_misc_info(IOCTL_AVG_C0_RES);
> +	pmf_get_misc_info(IOCTL_MAX_C0_RES);
> +	pmf_get_misc_info(IOCTL_SOCKET_POWER);
> +	pmf_get_misc_info(IOCTL_POWER_SLIDER_POSITION);
> +
> +	return 0;
> +}
> 

-- 
 i.

