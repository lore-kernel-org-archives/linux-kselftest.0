Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEA43BF671;
	Thu, 26 Mar 2026 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520463; cv=none; b=hvnBNQn2no9lrfB7/qLUNUovpTVA9WXHgvnGWYSngHVIWT+fe0xqDiHwwGm3wjpLuqrvQe22vjJ1a0fDsYM4AUbnblKvIOt0pAYxbb7Z1WM9K4WZeW3+nYbvzcOdAGij27blGNiwQEMcLI8Xt/vHTC+5A5qGpMgEvAIhPi82/4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520463; c=relaxed/simple;
	bh=RjamRZd/q9opG2qLoc577i+2q/yxqt1koyhEBj3msQ4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Plg1KjbGxxKOnrlL4UZwjZmh7tWVNaAIQktIMt3ha1FZHx3XAIShBDEP5trWOxLpUorXnkbQabHqKt9GFt+fnayl95iCa6znI4z7uITasfXkAdsexdPP2/V9Kj6CgeTt/z2cBpKWYrE/9BOmJZ2gHhpd/uqJ2CkcB1TyyYrRs5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZzD+mKm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZzD+mKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774520462; x=1806056462;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RjamRZd/q9opG2qLoc577i+2q/yxqt1koyhEBj3msQ4=;
  b=IZzD+mKmoQQ47/YiW3fxaidv4Dcu+aKreA/InOjF7tpxQEd3l/5u9QV1
   F5IhLvgG6+0ZmTeJBX2NjM4QFbGMjlfHJb2jdbYCmTTpjDNQHZ0hlJBxo
   oTq/SE9rFcCyZCe0hSJF5WA14xyEHkoRvww9a76qS0V+Bx5WZJP/jfoNr
   ZHdDumVznrj/ZE29bBUBTrlkEZ7m9lPqeZgc0zE4QONKfql3rkVPVzCBR
   80IwEW1EPZcD9jYWDH1FZjHO+E4wPVHcm4Y13NGNaha4OLkW+xatLv51t
   P1+BPn9xpztGOT14TbeTk22pAz/8qBYmBikt3PDNI3shutA1/wwJH87pe
   w==;
X-CSE-ConnectionGUID: +PTrmy1XQaaAJeZhwHzw6A==
X-CSE-MsgGUID: nAWtrMafR8KBuIqU3fk8+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="87049182"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="87049182"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:21:01 -0700
X-CSE-ConnectionGUID: 2ST4+ewVTBCubsRDXiczBw==
X-CSE-MsgGUID: 4KmM6MJHQCKCiNeX7KCZyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="220115947"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.32])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:20:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Mar 2026 12:20:53 +0200 (EET)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Shuah Khan <shuah@kernel.org>, 
    Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 6/7] platform/x86/amd/pmf: Introduce AMD PMF testing
 tool for driver metrics and features
In-Reply-To: <b750f712-7504-4862-b099-aca70550f10c@amd.com>
Message-ID: <069b8a6b-f166-5d5a-8882-b33c9d2f4e8c@linux.intel.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com> <20260301131124.1370565-7-Shyam-sundar.S-k@amd.com> <91a389ee-2020-373a-20fa-9183d70f8684@linux.intel.com> <b750f712-7504-4862-b099-aca70550f10c@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2024945772-1774520453=:986"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2024945772-1774520453=:986
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 25 Mar 2026, Mario Limonciello wrote:
> On 3/25/26 08:54, Ilpo J=C3=A4rvinen wrote:
> > + Selftest people.
> >=20
> > On Sun, 1 Mar 2026, Shyam Sundar S K wrote:
> >=20
> > > This tool leverages amd-pmf ioctls exposed via the util layer, allowi=
ng
> > > validation of its newly integrated util layer and /dev/amdpmf_interfa=
ce.
> > > It includes a user-space test application, test_pmf, designed to inte=
ract
> > > with the PMF driver and retrieve relevant metrics for the testing and
> > > analysis.
> > >=20
> > > It provides definitions for test metrics, feature IDs, and device sta=
tes,
> > > and includes tests for various AMD PMF metrics such as power source, =
skin
> > > temperature, battery state, and custom BIOS inputs/outputs. It also
> > > enables the testing of PMF metrics data and feature support reporting=
=2E
> > >=20
> > > Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> > > Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> > > Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > > ---
> > >   tools/testing/selftests/Makefile              |   1 +
> > >   .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
> > >   .../drivers/platform/x86/amd/pmf/test_pmf.c   | 243 +++++++++++++++=
+++
> > >   3 files changed, 252 insertions(+)
> > >   create mode 100644
> > > tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
> > >   create mode 100644
> > > tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
> >=20
> > Please Cc also selftest people in the next version submission! Maube yo=
u
> > should also check why your patch sending process did not capture those
> > receipient for you.
> >=20
> > To me it looks this "tool" doesn't really perform a selftest the way I'=
ve
> > understood "selftests" work. That is, it doesn't have notion of Pass/Fa=
il
> > at all AFAICT. I'm not sure if there are other selftests like this but
> > hopefully the selftest people know.
>=20
> For a similar "tool" I have it outside of selftests:
>=20
> linux/tools/crypto/ccp
>=20
> Ilpo,
>=20
> Maybe we want a directory structure like this?
>=20
> tools/platform/x86/amd

At least to me it looks better than placing a non-selftest tool under=20
selftests/.

--=20
 i.

> > > diff --git a/tools/testing/selftests/Makefile
> > > b/tools/testing/selftests/Makefile
> > > index 450f13ba4cca..d850fb09eeb9 100644
> > > --- a/tools/testing/selftests/Makefile
> > > +++ b/tools/testing/selftests/Makefile
> > > @@ -26,6 +26,7 @@ TARGETS +=3D drivers/net/netconsole
> > >   TARGETS +=3D drivers/net/team
> > >   TARGETS +=3D drivers/net/virtio_net
> > >   TARGETS +=3D drivers/platform/x86/intel/ifs
> > > +TARGETS +=3D drivers/platform/x86/amd/pmf
> > >   TARGETS +=3D dt
> > >   TARGETS +=3D efivarfs
> > >   TARGETS +=3D exec
> > > diff --git a/tools/testing/selftests/drivers/platform/x86/amd/pmf/Mak=
efile
> > > b/tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
> > > new file mode 100644
> > > index 000000000000..876424941e83
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
> > > @@ -0,0 +1,8 @@
> > > +# SPDX-License-Identifier: GPL-2.0-or-later
> > > +CFLAGS +=3D $(KHDR_INCLUDES)
> > > +
> > > +TEST_GEN_PROGS :=3D test_pmf
> > > +
> > > +top_srcdir ?=3D../../../../..
> > > +
> > > +include ../../../../../lib.mk
> > > diff --git
> > > a/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
> > > b/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
> > > new file mode 100644
> > > index 000000000000..a040ef01ba90
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
> > > @@ -0,0 +1,243 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * AMD Platform Management Framework Test Tool
> > > + *
> > > + * Copyright (c) 2026, Advanced Micro Devices, Inc.
> > > + * All Rights Reserved.
> > > + *
> > > + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > > + *=09    Sanket Goswami <Sanket.Goswami@amd.com>
> > > + */
> > > +
> > > +#include <errno.h>
> > > +#include <fcntl.h>
> > > +#include <inttypes.h>
> > > +#include <stdbool.h>
> > > +#include <stdint.h>
> > > +#include <stdio.h>
> > > +#include <string.h>
> > > +#include <sys/ioctl.h>
> > > +#include <unistd.h>
> > > +#include <linux/amd-pmf.h>
> > > +
> > > +#include "../../../../../kselftest.h"
> > > +
> > > +#define DEVICE_NODE=09=09"/dev/amdpmf_interface"
> > > +
> > > +static int pmf_open_device(void)
> > > +{
> > > +=09int fd;
> > > +
> > > +=09fd =3D open(DEVICE_NODE, O_RDONLY);
> > > +=09if (fd < 0)
> > > +=09=09fprintf(stderr, "opening PMF Device Node failed: %s\n",
> > > strerror(errno));
> > > +
> > > +=09return fd;
> > > +}
> > > +
> > > +/* Helper to run IOCTL_PMF_POPULATE_DATA for one control code and re=
turn
> > > 0 on success. */
> >=20
> > Reflow this comment to 80 chars.
> >=20
> > > +static int pmf_get_fd(int fd, enum pmf_ioctl_id code, struct
> > > amd_pmf_ioctl_info *out)
> > > +{
> > > +=09struct amd_pmf_ioctl_info info =3D {0};
> >=20
> > =3D {}; should be enough to initialize to default values.
> >=20
> > > +=09int ret;
> > > +
> > > +=09if (!out)
> > > +=09=09return -EINVAL;
> > > +
> > > +=09info.control_code =3D code;
> > > +
> > > +=09ret =3D ioctl(fd, IOCTL_PMF_POPULATE_DATA, &info);
> > > +=09if (ret < 0)
> > > +=09=09return ret;
> > > +
> > > +=09*out =3D info;
> > > +=09return 0;
> > > +}
> > > +
> > > +static int pmf_get_data(enum pmf_ioctl_id code, struct amd_pmf_ioctl=
_info
> > > *out)
> > > +{
> > > +=09int fd, ret;
> > > +
> > > +=09fd =3D pmf_open_device();
> > > +=09if (fd < 0)
> > > +=09=09return fd;
> > > +
> > > +=09ret =3D pmf_get_fd(fd, code, out);
> > > +
> > > +=09close(fd);
> > > +=09return ret;
> > > +}
> > > +
> > > +static int pmf_get_feature_status(unsigned int code)
> > > +{
> > > +=09struct amd_pmf_ioctl_info info =3D {0};
> > > +=09int ret;
> > > +
> > > +=09ret =3D pmf_get_data(code, &info);
> > > +=09if (ret < 0)
> > > +=09=09return ret;
> > > +
> > > +=09switch (code) {
> > > +=09case IOCTL_FEATURE_AUTO_MODE:
> > > +=09=09printf("Auto Mode: %-24s\n", info.feature_supported ? "Yes" :
> > > "No");
> > > +=09=09break;
> > > +=09case IOCTL_FEATURE_STATIC_POWER_SLIDER:
> > > +=09=09printf("Static Power Slider: %-24s\n", info.feature_supported
> > > ? "Yes" : "No");
> > > +=09=09break;
> > > +=09case IOCTL_FEATURE_POLICY_BUILDER:
> > > +=09=09printf("Policy Builder: %s\n", info.feature_supported ? "Yes"
> > > : "No");
> > > +=09=09break;
> > > +=09case IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC:
> > > +=09=09printf("Dynamic Power Slider AC: %s\n", info.feature_supported
> > > ? "Yes" : "No");
> > > +=09=09break;
> > > +=09case IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC:
> > > +=09=09printf("Dynamic Power Slider DC: %s\n", info.feature_supported
> > > ? "Yes" : "No");
> > > +=09=09break;
> > > +=09default:
> > > +=09=09return -1;
> > > +=09}
> > > +
> > > +=09return 0;
> > > +}
> > > +
> > > +static int pmf_get_device_state(unsigned int code)
> > > +{
> > > +=09struct amd_pmf_ioctl_info info =3D {0};
> > > +=09int ret;
> > > +
> > > +=09ret =3D pmf_get_data(code, &info);
> > > +=09if (ret < 0)
> > > +=09=09return ret;
> > > +
> > > +=09switch (code) {
> > > +=09case IOCTL_PLATFORM_TYPE:
> > > +=09=09printf("Platform Type: %s\n", platform_type_as_str(info.val));
> > > +=09=09break;
> > > +=09case IOCTL_LAPTOP_PLACEMENT:
> > > +=09=09printf("Laptop placement: %s\n",
> > > laptop_placement_as_str(info.val));
> > > +=09=09break;
> > > +=09case IOCTL_LID_STATE:
> > > +=09=09printf("Lid State: %s\n", info.val ? "Close" : "Open");
> > > +=09=09break;
> > > +=09case IOCTL_USER_PRESENCE:
> > > +=09=09printf("User Presence: %s\n", info.val ? "Present" : "Away");
> > > +=09=09break;
> > > +=09default:
> > > +=09=09return -1;
> > > +=09}
> > > +
> > > +=09return 0;
> > > +}
> > > +
> > > +static int pmf_get_custom_bios_input(unsigned int code)
> > > +{
> > > +=09struct amd_pmf_ioctl_info info =3D {0};
> > > +=09int idx, ret;
> > > +
> > > +=09ret =3D pmf_get_data(code, &info);
> > > +=09if (ret < 0)
> > > +=09=09return ret;
> > > +
> > > +=09switch (code) {
> > > +=09case IOCTL_BIOS_INPUT_1 ... IOCTL_BIOS_INPUT_10:
> > > +=09=09idx =3D amd_pmf_get_bios_idx(code);
> > > +=09=09printf("Custom BIOS input%u: %lu\n", idx + 1,
> > > (int64_t)info.val);
> >=20
> > %lu is for printing unsigned long, not int64_t.
> >=20
> > > +=09=09break;
> > > +=09default:
> > > +=09=09return -1;
> > > +=09}
> > > +
> > > +=09return 0;
> > > +}
> > > +
> > > +static int pmf_get_bios_output(unsigned int code)
> > > +{
> > > +=09struct amd_pmf_ioctl_info info =3D {0};
> > > +=09int idx, ret;
> > > +
> > > +=09ret =3D pmf_get_data(code, &info);
> > > +=09if (ret < 0)
> > > +=09=09return ret;
> > > +
> > > +=09switch (code) {
> > > +=09case IOCTL_BIOS_OUTPUT_1 ... IOCTL_BIOS_OUTPUT_10:
> > > +=09=09idx =3D amd_pmf_get_bios_idx(code);
> > > +=09=09printf("BIOS output%u: %lu\n", idx + 1, (int64_t)info.val);
> > > +=09=09break;
> > > +=09default:
> > > +=09=09return -1;
> > > +=09}
> > > +
> > > +=09return 0;
> > > +}
> > > +
> > > +static int pmf_get_misc_info(unsigned int code)
> > > +{
> > > +=09struct amd_pmf_ioctl_info info =3D {0};
> > > +=09int ret;
> > > +
> > > +=09ret =3D pmf_get_data(code, &info);
> > > +=09if (ret < 0)
> > > +=09=09return ret;
> > > +
> > > +=09switch (code) {
> > > +=09case IOCTL_POWER_SLIDER_POSITION:
> > > +=09=09printf("Slider Position: %s\n", ta_slider_as_str(info.val));
> > > +=09=09break;
> > > +=09case IOCTL_SKIN_TEMP:
> > > +=09=09printf("Skin Temperature: %lu\n", (int64_t)info.val);
> > > +=09=09break;
> > > +=09case IOCTL_GFX_WORKLOAD:
> > > +=09=09printf("GFX Busy: %lu\n", (int64_t)info.val);
> > > +=09=09break;
> > > +=09case IOCTL_AMBIENT_LIGHT:
> > > +=09=09printf("Ambient Light: %ld\n", (int64_t)info.val);
> > > +=09=09break;
> > > +=09case IOCTL_AVG_C0_RES:
> > > +=09=09printf("Avg C0 Residency: %lu\n", (int64_t)info.val);
> > > +=09=09break;
> > > +=09case IOCTL_MAX_C0_RES:
> > > +=09=09printf("Max C0 Residency: %lu\n", (int64_t)info.val);
> > > +=09=09break;
> > > +=09case IOCTL_SOCKET_POWER:
> > > +=09=09printf("Socket Power: %lu\n", (int64_t)info.val);
> >=20
> > Please think the printf formatting strings and types through.
> >=20
> > > +=09=09break;
> > > +=09default:
> > > +=09=09return -1;
> > > +=09}
> > > +
> > > +=09return 0;
> > > +}
> > > +
> > > +int main(void)
> > > +{
> > > +=09unsigned int idx;
> > > +
> > > +=09printf("Feature Name          Supported\n");
> > > +=09printf("---------------------------------\n");
> > > +=09for (idx =3D IOCTL_FEATURE_AUTO_MODE; idx <=3D
> > > IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC; idx++)
> > > +=09=09pmf_get_feature_status(idx);
> > > +
> > > +=09printf("\nDevice State\n---------------\n");
> > > +=09for (idx =3D IOCTL_PLATFORM_TYPE; idx <=3D IOCTL_USER_PRESENCE; i=
dx++)
> > > +=09=09pmf_get_device_state(idx);
> > > +
> > > +=09printf("\nCustom BIOS Inputs\n-------------------\n");
> > > +=09for (idx =3D IOCTL_BIOS_INPUT_1; idx <=3D IOCTL_BIOS_INPUT_10; id=
x++)
> > > +=09=09pmf_get_custom_bios_input(idx);
> > > +
> > > +=09printf("\nBIOS Outputs\n--------------\n");
> > > +=09for (idx =3D IOCTL_BIOS_OUTPUT_1; idx <=3D IOCTL_BIOS_OUTPUT_10; =
idx++)
> > > +=09=09pmf_get_bios_output(idx);
> > > +
> > > +=09printf("\nMisc\n------\n");
> > > +=09pmf_get_misc_info(IOCTL_SKIN_TEMP);
> > > +=09pmf_get_misc_info(IOCTL_GFX_WORKLOAD);
> > > +=09pmf_get_misc_info(IOCTL_AMBIENT_LIGHT);
> > > +=09pmf_get_misc_info(IOCTL_AVG_C0_RES);
> > > +=09pmf_get_misc_info(IOCTL_MAX_C0_RES);
> > > +=09pmf_get_misc_info(IOCTL_SOCKET_POWER);
> > > +=09pmf_get_misc_info(IOCTL_POWER_SLIDER_POSITION);
> > > +
> > > +=09return 0;
> > > +}
> > >=20
> >=20
>=20
--8323328-2024945772-1774520453=:986--
