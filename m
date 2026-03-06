Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA7B33D4EE;
	Fri,  6 Mar 2026 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772790730; cv=none; b=GMY6H70T7BpejVq/hYaQ2iNSh5Fh1Pz/n1w4GjtOeIZnkYlke5O0PymPj/uHhN2fEhsUWxufdVS3fNMNNmB2nxJYquXqKuj8CuKJjUH3J+I/1e3Y6bnxVOpzBEe6VlIpyZTCr8xvh1VpblEENEVgdprcdH0BcYGGQ+jYgufHNfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772790730; c=relaxed/simple;
	bh=3bx1sm9GFnqzoTTvr7laDhaTz0jaRJiSiqqLNl69JaM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hmZJQGSGNxtbRQC2DggomJmKAk+1l4w4chSDEGnnuOTAHk6QXZSrPdOcZLHrISEzRluNtKte4pyqVwgehTEtfPrbe7EV7Y7DHZwmvgec0TxH72z2OkeRpWQgvvf612DT8DXXqYhC+6D+A5nvtetmVnldzhZR9Ib36xTKKPNXl4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nc5F+VPK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nc5F+VPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772790728; x=1804326728;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3bx1sm9GFnqzoTTvr7laDhaTz0jaRJiSiqqLNl69JaM=;
  b=nc5F+VPKKkmJNTS5YSVgrje+9NkzrtYdG0GtsLgDFHx9IXqzwEGEK8Lf
   O8rSmvqQp6eD1aLlL72JDVkSKlOSONxOC3qeWG+fEpFY/Y52mrZ5Ik7m0
   p+ar5uDGdsFfDiLu/xAFFHYoTV3xvCoRfiQWr6ndme1hH28LI2VENBn/h
   ozsuS+KKZjouOpSqzBjmmIm2zrWrnhkQvDBJ2+vlFl1DbT3KGyRDUy8Oe
   bx/djYsyzoIfGiIbIq0aH+VxQPDQ0+GzL8H4X+NlSji1ZkiqD+Wboc8YR
   zCCVTVsh/8GB0t3ZMX9x746d/yedP82J9Ys28SvowAjdbIMUO17pNuMNj
   g==;
X-CSE-ConnectionGUID: S/GV5UdqRvOFCDRWWotavA==
X-CSE-MsgGUID: DOcP3niHQselFOz2/+k9Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73597153"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73597153"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 01:52:08 -0800
X-CSE-ConnectionGUID: uAP4FvHcRvKPXkDG7IPR/A==
X-CSE-MsgGUID: vMYvq5z4QdOcGROs9uXX/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218955907"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.235])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 01:52:03 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 6 Mar 2026 11:51:59 +0200 (EET)
To: Reinette Chatre <reinette.chatre@intel.com>
cc: shuah@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, 
    tony.luck@intel.com, babu.moger@amd.com, fenghuay@nvidia.com, 
    peternewman@google.com, zide.chen@intel.com, dapeng1.mi@linux.intel.com, 
    ben.horgan@arm.com, yu.c.chen@intel.com, linux-kselftest@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, patches@lists.linux.dev
Subject: Re: [PATCH v2 2/9] selftests/resctrl: Do not store iMC counter value
 in counter config structure
In-Reply-To: <aaaeaa9b1dfe0694a1c6659193ab5b736aceb090.1772582958.git.reinette.chatre@intel.com>
Message-ID: <ac42462a-d244-855f-7bf5-dce91d6d730b@linux.intel.com>
References: <cover.1772582958.git.reinette.chatre@intel.com> <aaaeaa9b1dfe0694a1c6659193ab5b736aceb090.1772582958.git.reinette.chatre@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1896381585-1772790719=:1000"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1896381585-1772790719=:1000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 3 Mar 2026, Reinette Chatre wrote:

> The MBM and MBA tests compare MBM memory bandwidth measurements against
> the memory bandwidth event values obtained from each memory controller's
> PMU. The memory bandwidth event settings are discovered from the memory
> controller details found in /sys/bus/event_source/devices/uncore_imc_N an=
d
> stored in struct imc_counter_config.
>=20
> In addition to event settings struct imc_counter_config contains
> imc_counter_config::return_value in which the associated event value is
> stored on every read.
>=20
> The event value is consumed and immediately recorded at regular intervals=
=2E
> The stored value is never consumed afterwards, making its storage as part
> of event configuration unnecessary.
>=20
> Remove the return_value member from struct imc_counter_config. Instead
> just use a local variable for use during event reading.
>=20
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
>  tools/testing/selftests/resctrl/resctrl_val.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testin=
g/selftests/resctrl/resctrl_val.c
> index a5a8badb83d4..2cc22f61a1f8 100644
> --- a/tools/testing/selftests/resctrl/resctrl_val.c
> +++ b/tools/testing/selftests/resctrl/resctrl_val.c
> @@ -32,7 +32,6 @@ struct imc_counter_config {
>  =09__u64 event;
>  =09__u64 umask;
>  =09struct perf_event_attr pe;
> -=09struct membw_read_format return_value;
>  =09int fd;
>  };
> =20
> @@ -312,23 +311,23 @@ static int get_read_mem_bw_imc(float *bw_imc)
>  =09 * Take overflow into consideration before calculating total bandwidt=
h.
>  =09 */
>  =09for (imc =3D 0; imc < imcs; imc++) {
> +=09=09struct membw_read_format return_value;
>  =09=09struct imc_counter_config *r =3D
>  =09=09=09&imc_counters_config[imc];
> =20
> -=09=09if (read(r->fd, &r->return_value,
> -=09=09=09 sizeof(struct membw_read_format)) =3D=3D -1) {
> +=09=09if (read(r->fd, &return_value, sizeof(return_value)) =3D=3D -1) {
>  =09=09=09ksft_perror("Couldn't get read bandwidth through iMC");
>  =09=09=09return -1;
>  =09=09}
> =20
> -=09=09__u64 r_time_enabled =3D r->return_value.time_enabled;
> -=09=09__u64 r_time_running =3D r->return_value.time_running;
> +=09=09__u64 r_time_enabled =3D return_value.time_enabled;
> +=09=09__u64 r_time_running =3D return_value.time_running;
> =20
>  =09=09if (r_time_enabled !=3D r_time_running)
>  =09=09=09of_mul_read =3D (float)r_time_enabled /
>  =09=09=09=09=09(float)r_time_running;
> =20
> -=09=09reads +=3D r->return_value.value * of_mul_read * SCALE;
> +=09=09reads +=3D return_value.value * of_mul_read * SCALE;
>  =09}

This looks mostly okay though here too I don't like the variable name.=20
Something like "measurement" would tell what it is much better than overly=
=20
vague "return_value".

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1896381585-1772790719=:1000--
