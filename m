Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4915F3BB9ED;
	Thu, 28 May 2026 11:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779966242; cv=none; b=LxyMHMvZsz/iJV54ikKhDBpe8pvMRVnl+i6vQPtY71+rp0185n1UAZOckTMofpT8PkMX2hwZmvnpQLZuA+QCOCrR3zoKInk9ubDUi6mYHG9SJu8dTa/Y1pVV/s9rFwABh4aODTtQqIZLmUX/guYdCLWiCIoALfGAZaseRZGBZYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779966242; c=relaxed/simple;
	bh=XEd+mIs6P7zsr3LRZAvzIpOMgrrMJl+KUKc4LAa2M4k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RyUDgIO4x863b/Dt21RFKZ+ssTWhuh29Sb7UAOvJADyZRQixj7HaXbquSZh3KuWrv48flcV+Si4SnFCb8pPyGsrF60dfGgVI+4fsuheHgUclSChsgUzv4Ef/GEBTkRiXE9hCeZOwInAwXhu/MmDWWOq9CHPWB/qjk1t4jGeT+HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmPyyUrd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmPyyUrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779966241; x=1811502241;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=XEd+mIs6P7zsr3LRZAvzIpOMgrrMJl+KUKc4LAa2M4k=;
  b=cmPyyUrdkzp1sX/ZOOxsTbwJXgkmylEzHlN0tOuOweJ5RVkhbP2S0LO3
   1HT9JDUc/MXmF7A3+sfLBh0rtnBW3/fIpfXqKt4rVQt/nygnBfodceq8I
   89fDgXqmadI/jMmfFpwkAV6JGHtPZpp/cvrFv2KUD/r5sMjNisvP2wLh5
   GAH36CyclYG0MIjfyQhpXL3M00uptMEOADaD/sLVBx4ukG/DQnmrd3eKN
   y5BdyT2vX7H4gI6A7JZaBkS9xX5KZZX9kM8gN6lhHdotniolNr2NOutrx
   s9VC0lSYeZ0lagU1OZ9+fWeEE/1bFpT3u4LFc/NNqTY3FwvvZSoxlP9d0
   g==;
X-CSE-ConnectionGUID: +b6swtnyQLiq5jnv/jqP/Q==
X-CSE-MsgGUID: 4m205e1HQtqr/Ze4UuxcTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80797629"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80797629"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 04:04:01 -0700
X-CSE-ConnectionGUID: cYLUjfPdQn2TMrpRDRqEKw==
X-CSE-MsgGUID: xvjD5WfoTPyy2m6aveigwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="266422488"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 04:03:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 28 May 2026 14:03:52 +0300 (EEST)
To: Richard Cheng <icheng@nvidia.com>
cc: tony.luck@intel.com, Reinette Chatre <reinette.chatre@intel.com>, 
    shuah@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, 
    babu.moger@amd.com, LKML <linux-kernel@vger.kernel.org>, 
    linux-kselftest@vger.kernel.org, fenghuay@nvidia.com, newtonl@nvidia.com, 
    kristinc@nvidia.com, kaihengf@nvidia.com, kobak@nvidia.com, 
    Chen Yu <yu.c.chen@intel.com>
Subject: Re: [PATCH v2 1/3] selftests/resctrl: Skip L3_CAT when no exclusive
 cache portion exists
In-Reply-To: <20260528102956.33121-2-icheng@nvidia.com>
Message-ID: <caa75960-6f21-3ae8-cb29-d5b08d89e74b@linux.intel.com>
References: <20260528102956.33121-1-icheng@nvidia.com> <20260528102956.33121-2-icheng@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1812115944-1779966190=:1291"
Content-ID: <d45ad899-8c11-0156-b95a-b6287bf11046@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1812115944-1779966190=:1291
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <1ae6f6a7-6fde-f3b2-12db-fb808ae9475e@linux.intel.com>

On Thu, 28 May 2026, Richard Cheng wrote:

> L3_CAT measures cache isolation, which requires at least one cache bit
> that is not shared with non-CPU agents, i.e. cbm_mask & ~shareable_bits
> must be non-zero. On MPAM, shareable_bits =3D=3D cbm_mask is a legitimate
> state, so there are situations in which no bit can be reported as
> exclusive.
>=20
> Previously get_mask_no_shareable() was invoked inside cat_run_test()
> and silently returned -1, which surfaced as a test failure on arm64
> MPAM systems.
>=20
> Implement cat_feature_check() to perform the same check at feature-check
> time. It prints a diagnostic and returns false so the test case is
> skipped instead of failing.
>=20
> Tested-by: Chen Yu <yu.c.chen@intel.com>
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
>  tools/testing/selftests/resctrl/cat_test.c | 23 +++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/s=
elftests/resctrl/cat_test.c
> index f00b622c1460..dc414e55ae94 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -378,11 +378,32 @@ static bool noncont_cat_feature_check(const struct =
resctrl_test *test)
>  =09return resource_info_file_exists(test->resource, "sparse_masks");
>  }
> =20
> +static bool cat_feature_check(const struct resctrl_test *test)
> +{
> +=09unsigned long mask;
> +
> +=09if (!test_resource_feature_check(test))
> +=09=09return false;
> +
> +=09/*
> +=09 * The CAT isolation measurement needs a cache portion that no
> +=09 * other agent shares. On MPAM the kernel may legitimately report
> +=09 * all bits as shareable; skip the test if that is the case.
> +=09 */
> +=09if (get_mask_no_shareable(test->resource, &mask)) {
> +=09=09ksft_print_msg("All %s bits are shareable; cannot measure CAT isol=
ation\n",
> +=09=09=09       test->resource);
> +=09=09return false;
> +=09}
> +
> +=09return true;
> +}
> +
>  struct resctrl_test l3_cat_test =3D {
>  =09.name =3D "L3_CAT",
>  =09.group =3D "CAT",
>  =09.resource =3D "L3",
> -=09.feature_check =3D test_resource_feature_check,
> +=09.feature_check =3D cat_feature_check,
>  =09.run_test =3D cat_run_test,
>  =09.cleanup =3D cat_test_cleanup,
>  };
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

Nit, the patch numbering and the numbering used in the coverletter did not=
=20
match.

--=20
 i.
--8323328-1812115944-1779966190=:1291--
