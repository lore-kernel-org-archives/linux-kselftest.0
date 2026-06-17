Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FDC3F8715
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699234; cv=none; b=jG5apyVZs/8vuu0jMHRakz+9AbAC9QjY5XxWk4oZUIVxQRLCTjDoLkVJAylg3BUjFKtCkNmprsHa0OYZBhWddQGM/hp3lgtQh1pRtHe4UJFaUMVDySkPSPyjVhPphgBOfDkj5q7vtfSiPKqqZfQ5xQuadrx7KMpjuVgQ84Qvdjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699234; c=relaxed/simple;
	bh=4P57JPApK5Duv4SS9/YWY73JFxrYB4MbrvSBwzJXzxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g33Fxh/gM7/Z+LspQQej6ihHi1Xmy5m8zO2qIaEkngIzgTNb4kpfxx4D0CcgYWD3E76wEYRncmyNWALfARVUpNSAd3sDMroZ6jPoMh27I04XQVcbvItnxnckyMY2xeXnT8jX1wLLvfZ+5KRbgsVJfPNer01OtDwaEadGJ6FioWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TKZTu3iv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TKZTu3iv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4633193af19so176573f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 05:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781699228; x=1782304028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fIkFLHlBYwD2iiV0FJSSocLP/zlZq6rIN3ROwVp13XE=;
        b=TKZTu3ivuCjH0qCjoVkB/l1pXgWZ8BY+PBhzCSRh4hoaHBbwnjTl+vrtleJ4/8oTj8
         Uw2ViuEQTDi0qU5RyGCtlcWVfN0VS6fBQwnj3sUQCMXU2MrTWLlHcgnzSqweGOkz67Uc
         LeoTX82Hwf06xf6O8dt6dQQThaDdBxPlqqcbsmNqlsOJLs3rKyiBN9qVFAsMadtJau1G
         YeOmPpuuWQhczFABUXn00LuDMmyG5OEBfd9D4TIgUrDY5JcggM+7rUcs/CXa3rxt99XH
         /f33pcreFbyXE0ns+018rp86SJQ2qMiGtKhnQSLvFfBZwt5wx8arVi5DbIeAv1qkMNDN
         cMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699228; x=1782304028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIkFLHlBYwD2iiV0FJSSocLP/zlZq6rIN3ROwVp13XE=;
        b=ORRsGqEPMKN2WlHqtBB6jDcZGsh3r8KWSHar+fFnqATylf7HMaAsmZ2n+nJAPF2W46
         rrBW7wha4fIaqRnJGoxXSHUrdzKrYemydguXbs6KofVuZGZrWD3J7bOYff0gCK28dxeY
         Ygpe98bsGj66ZGWnEx40eFPGQVEJYN0rHx05KmfgALH+MdOWtOf+LILbGgDohbocosDI
         S3RFvbHDyB52WIqUH6YymfriyHGOW62rRMIMSDzn0aWjgWjo4roMmyaWa+43kyxtuvzg
         XvwsYZpuXKUxbBgM4kRM0171pTzLueBExlWz1T39W6Jf0c0w4JDeQcc7FmUJnn7xuNUp
         zNEg==
X-Forwarded-Encrypted: i=1; AFNElJ+5LwoGPNyrt8Xfm9tvx1Gv2fLsekRkBhHgbSAvgH11qcr8db/yqL2YUrbNijBauf0dOaRdmtfXzepOvQ8mnDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8s2rLILOUwu0GfRZznfhH0Xb6kziAB/T5Quufxap6yVVG4crV
	2GGory/x+KVSb8+yMLb4AHRngF0INqbI5XJGEJiXf0JR3sykwX3zM1XGyZN8kMiWCgI=
X-Gm-Gg: Acq92OFRwd8geWqT0QLnyheWMDahYPGVFdj5XJ8OJiDlAEUINYfqYJA+KVgkfCT2xm3
	z3txqM6wl8z+dBzn4vxOBSLf7Rl7h0gk484u6iGNLZ8nE6B73xWCq9lGIqntbcAiMRXAQLR4BfO
	Tfe6B4KQlE9vxt4plrXHL46kiBXhDTHxGwKaAAN1kp2Z3vfyZrzpt+p2IHSXL/J7gka8eEGDECD
	ay0OpqUTld2c451jfg+P25w/R2Y7MyERcsbos9zONf95xd8+UgwJ2mij7k/bpxJOaco44GN2quw
	/5Dd+DPCa3yDCF4BPCG+gNhkMghgju9L4BImKyohYSjLRvEvuU8/TBxxzbe7xcM25cqG1eMAS9O
	evhhOKhluafzsflxlI4Kc/qExPa3biOcAL1vJuvx8hpSaMZ009+n533QU3IPffVRMsv3L8TUYL8
	ul+Z8tDxYj6oQYWA/79Q==
X-Received: by 2002:a05:600c:a30c:b0:490:be1e:6ce6 with SMTP id 5b1f17b1804b1-492333aead6mr55511115e9.9.1781699227889;
        Wed, 17 Jun 2026 05:27:07 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a9b45bsm130662975e9.15.2026.06.17.05.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:27:07 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:27:05 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Li Wang <li.wang@linux.dev>
Cc: akpm@linux-foundation.org, tj@kernel.org, longman@redhat.com, 
	roman.gushchin@linux.dev, hannes@cmpxchg.org, yosry@kernel.org, jiayuan.chen@linux.dev, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, shuah@kernel.org, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Hocko <mhocko@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH v7 6/8] selftest/cgroup: fix zswap
 test_no_invasive_cgroup_shrink on large pagesize system
Message-ID: <ajKFzxIlwUd79pJY@localhost.localdomain>
References: <20260424040059.12940-1-li.wang@linux.dev>
 <20260424040059.12940-7-li.wang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="npkgor3mtzc7eyn7"
Content-Disposition: inline
In-Reply-To: <20260424040059.12940-7-li.wang@linux.dev>


--npkgor3mtzc7eyn7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 6/8] selftest/cgroup: fix zswap
 test_no_invasive_cgroup_shrink on large pagesize system
MIME-Version: 1.0

On Fri, Apr 24, 2026 at 12:00:57PM +0800, Li Wang <li.wang@linux.dev> wrote:
> test_no_invasive_cgroup_shrink sets up two cgroups: wb_group, which is
> expected to trigger zswap writeback, and a control group (renamed to
> zw_group),

Aha, it should stand for zswap writeback? Then zwb_group to avoid (my)
confusion with zsw_group :-)

Although the original names were already well descriptive (both groups
are expected to have some zswap).

> which should only have pages sitting in zswap without any
> writeback.
>=20
> There are two problems with the current test:
>=20
> 1) The data patterns are reversed. wb_group uses allocate_bytes(), which
>    writes only a single byte per page =E2=80=94 trivially compressible,
>    especially by zstd =E2=80=94 so compressed pages fit within zswap.max =
and
>    writeback is never triggered. Meanwhile, the control group uses
>    getrandom() to produce hard-to-compress data, but it is the group
>    that does *not* need writeback.
>=20
> 2) The test uses fixed sizes (10K zswap.max, 10MB allocation) that are
>    too small on systems with large PAGE_SIZE (e.g. 64K), failing to
>    build enough memory pressure to trigger writeback reliably.
>=20
> Fix both issues by:
>   - Swapping the data patterns: fill wb_group pages with partially
>     random data (getrandom for page_size/4 bytes) to resist compression
>     and trigger writeback, and fill zw_group pages with simple repeated
>     data to stay compressed in zswap.

I'd have expected that having both equal (i.e. both random to fill up
more easily) is what tests the effect zswap.max upon writeback most
precisely.

>   - Making all size parameters PAGE_SIZE-aware: set allocation size to
>     PAGE_SIZE * 1024, memory.zswap.max to PAGE_SIZE, and memory.max to
>     allocation_size / 2 for both cgroups.

Makes sense.

>   - Allocating memory inline instead of via cg_run() so the pages
>     remain resident throughout the test.

What is the residency good for? (It doesn't matter AFAICS, so the change
seems gratuitous and code diverges from test_zswap_usage().)


--npkgor3mtzc7eyn7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCajKSlRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjrLAD9GBYJlDuakfCppd9zM7AV
pVNB8ypWNBY5Zblvu5XqtjwBAP+ZAbviWaThkRKtDNFKUvOG/ItMxC0RjON1YZma
WNkB
=KrLy
-----END PGP SIGNATURE-----

--npkgor3mtzc7eyn7--
