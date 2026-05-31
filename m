Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B4A33D6D6;
	Sun, 31 May 2026 19:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780254081; cv=none; b=eY8HY5VtJEQUSB24kN5bXGncY06FDUyE9UwwpZLOc72Fan8dOiKem+58uj6P/DfZ1JVyBgQ7AXW3cYmc0bbli9UaoW+SkZeb2HTKRLJCdJEqcjb5O34jSCBQyquf4T4aUEOJFgJywRYL/zjLocIWJ2tlTbCIndv79KOhVLs50J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780254081; c=relaxed/simple;
	bh=o3ZoNy/NDaseUtZjIYsxdpkaOG3BosxaRQgpTiC0Hy8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZsJcOm4NV0OK3wDKUKb0Xlnd0cKcFUKlMnLLwDo9kAoxLG4u8nNY9hJqYPmTF5n3gWFNskTLWT2K7r7a0r0gzH/oboQLkyWls36fYV+TAR86IwnLINOtQVupSCGySaX2I3wgg3WQyCFxyCaCGjw+sXDAM6kEaeqJ+1TcVXMDMaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0F7tEjv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0F7tEjv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780254079; x=1811790079;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=o3ZoNy/NDaseUtZjIYsxdpkaOG3BosxaRQgpTiC0Hy8=;
  b=J0F7tEjvBLb9XDzsyqPLZefU+G2+2olSiWZa7VqsG2N8Yz+d60HG6UoV
   KiPuyVgXuHSc9HiYSldSXWfwUbNWJoVooMj+jejDZPbLCOvhh8q+fEZaI
   ZQvDZCy6y/6dCqWO1TFNEp7fwxF104xd3w9Kd+sm44s+81JS/qVBaU/eA
   0CKF4SF0WTK2JHdvQlqlaDQN1Afe7ACYW4fOTOu13e7yOVW8bgVurFf7d
   saGQGkIuDHOZREpvidmYPGOhRUud24VdBCJSW7Zf0fuhuzn+GJTP1U96t
   Wvhx/UR+HV1pYCYNivDcR5QdPn405BSEqAKKsdl1gtOMQi1hAmmpNW3+T
   A==;
X-CSE-ConnectionGUID: MUSpMVMKRueH0rZLb7hTTg==
X-CSE-MsgGUID: sPC2UyzOQtCPTnjrbaylHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80750285"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="80750285"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:01:19 -0700
X-CSE-ConnectionGUID: Uc72rFg/Tx6DYER9mazpdA==
X-CSE-MsgGUID: TkDiFNbYRQiByHuuveHEjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="239183669"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:01:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sun, 31 May 2026 22:01:12 +0300 (EEST)
To: Richard Cheng <icheng@nvidia.com>
cc: tony.luck@intel.com, Reinette Chatre <reinette.chatre@intel.com>, 
    shuah@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, 
    babu.moger@amd.com, LKML <linux-kernel@vger.kernel.org>, 
    linux-kselftest@vger.kernel.org, yu.c.chen@intel.com, fenghuay@nvidia.com, 
    newtonl@nvidia.com, kristinc@nvidia.com, kaihengf@nvidia.com, 
    kobak@nvidia.com
Subject: Re: [PATCH v3 3/3] selftests/resctrl: Recognise aarch64 as a vendor
 for L3_NONCONT_CAT
In-Reply-To: <20260529022352.8308-4-icheng@nvidia.com>
Message-ID: <204dca67-629e-1ea7-cad3-b63459f6e464@linux.intel.com>
References: <20260529022352.8308-1-icheng@nvidia.com> <20260529022352.8308-4-icheng@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-939844943-1780254072=:1217"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-939844943-1780254072=:1217
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 29 May 2026, Richard Cheng wrote:

> aarch64 has no vendor_id in /proc/cpuinfo, so detect_vendor() returns 0
> and arch_supports_noncont_cat() falls through to "return false".
> L3_NONCONT_CAT therefore spuriously fails on every ARM MPAM platform.
>=20
> Define ARCH_ARM, short-circuit detect_vendor() to it on aarch64, and
> add it to the AMD/Hygon always-supports early-out in
> arch_supports_noncont_cat().
>=20
> aarch64 has many implementers (ARM 0x41, NVIDIA 0x43, etc.), but MPAM
> mandates non-contiguous CPBM uniformly, so per-implementer handling is
> not needed here.
>=20
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
>  tools/testing/selftests/resctrl/cat_test.c    |  9 ++++++--
>  tools/testing/selftests/resctrl/resctrl.h     |  1 +
>  .../testing/selftests/resctrl/resctrl_tests.c | 21 +++++++++++++++++++
>  3 files changed, 29 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/s=
elftests/resctrl/cat_test.c
> index dc414e55ae94..ce66016dbd88 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -292,8 +292,13 @@ static bool arch_supports_noncont_cat(const struct r=
esctrl_test *test)
>  {
>  =09unsigned int vendor_id =3D get_vendor();
> =20
> -=09/* AMD and Hygon always support non-contiguous CBM. */
> -=09if (vendor_id =3D=3D ARCH_AMD || vendor_id =3D=3D ARCH_HYGON)
> +=09/*
> +=09 * AMD and Hygon always support non-contiguous CBM. ARM/MPAM defines
> +=09 * MPAMCFG_CPBM as a bitmap with no contiguity constraint per ARM
> +=09 * DDI 0598.
> +=09 */
> +=09if (vendor_id =3D=3D ARCH_AMD || vendor_id =3D=3D ARCH_HYGON ||
> +=09    vendor_id =3D=3D ARCH_ARM)
>  =09=09return true;
> =20
>  #if defined(__i386__) || defined(__x86_64__) /* arch */
> diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/se=
lftests/resctrl/resctrl.h
> index afe635b6e48d..670e5b128b4d 100644
> --- a/tools/testing/selftests/resctrl/resctrl.h
> +++ b/tools/testing/selftests/resctrl/resctrl.h
> @@ -40,6 +40,7 @@
>  #define ARCH_INTEL=09BIT(0)
>  #define ARCH_AMD=09BIT(1)
>  #define ARCH_HYGON=09BIT(2)
> +#define ARCH_ARM=09BIT(3)
> =20
>  #define END_OF_TESTS=091
> =20
> diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/test=
ing/selftests/resctrl/resctrl_tests.c
> index dbcd5eea9fbc..cfece594a8c6 100644
> --- a/tools/testing/selftests/resctrl/resctrl_tests.c
> +++ b/tools/testing/selftests/resctrl/resctrl_tests.c
> @@ -23,6 +23,15 @@ static struct resctrl_test *resctrl_tests[] =3D {
>  =09&l2_noncont_cat_test,
>  };
> =20
> +static bool detect_aarch64(void)
> +{
> +#if defined(__aarch64__)
> +=09return true;
> +#else
> +=09return false;
> +#endif
> +}
> +
>  static unsigned int detect_vendor(void)
>  {
>  =09static unsigned int vendor_id;
> @@ -34,6 +43,18 @@ static unsigned int detect_vendor(void)
>  =09if (initialized)
>  =09=09return vendor_id;
> =20
> +=09if (detect_aarch64()) {
> +=09=09/*
> +=09=09 * aarch64 has no userspace vendor_id in /proc/cpuinfo.
> +=09=09 * MPAM-capable ARM implementations follow ARM DDI 0598;
> +=09=09 * treat all aarch64 builds as a single vendor for the
> +=09=09 * purposes of resctrl selftests.
> +=09=09 */
> +=09=09vendor_id =3D ARCH_ARM;
> +=09=09initialized =3D true;
> +=09=09return vendor_id;
> +=09}
> +
>  =09inf =3D fopen("/proc/cpuinfo", "r");
>  =09if (!inf) {
>  =09=09vendor_id =3D 0;
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-939844943-1780254072=:1217--
