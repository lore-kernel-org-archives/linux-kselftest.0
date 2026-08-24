Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531A4374A0A
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575024; cv=none; b=doh9v2vhwkd+lvOV6fMJs8UpaJuvxXN+OwhZS+nFmT0lR3LHqWG0ubzI1FtHxQombubocAi/pyqGqaxMP6ZwaZRxIvlX3ZZUMOtvEDOK+YvhjRQga4ltHBmqfzfhpePAmesKgqc5cnZ7yKMWwKRmSvXskTvO3iWGi/Ykltbqc3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575024; c=relaxed/simple;
	bh=vMMjMInCck9yF8tkMjBlrSp6ScF2a084G6L/dqZn6ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kI+/TEReFdu1DJyuFfuNuiJ76hAbbzU1Hua4uniGA9xNRaP/zRLjHoeogkCxg6zqSU6DSMEQ5gFHk+2r1ZwfNNJNcYh8q+/QHgZtvRuClE16TtkTG6QIua/2sNZFA9uiZaUo96KZXG3Qtknb7mbSrQXMDvhCjsogZqOhw/KpxpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=arczoRj/; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="arczoRj/"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a378f90555so5426592a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 05:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787575020; x=1788179820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=86o2mla0Wt4YoV7NQUB6bfRSm8bpfsWlSQQ8/iZvyTQ=;
        b=arczoRj/jMWSEsCGnxDc8QgLgbHeY49YBrwFMJjF//o9YhC9w6uwlsNHXTo+oprOSx
         TuAVykOdEMNqTbKOFXt0lNVkPMQZ8cKj9++jUN0FRUzbbyh8OPzqvaZ1azFKg6eCxi3x
         r6i3nrGkrO5R3F2h31uS8i3Nw/WhoyXIsrck5ejsfng/uH4rOqDXtc6hohOEVtMsHrfn
         H/BIk/gn+alS+Yn/L+LA4igVEkNBtFwvCni/bQiQBEe7NJcPn7ws3I74k2sRVLcxCxXE
         QxeTx2RbH5V0n8vRo6jjldYRoyz1oqcR4iRXdQD0swOinXot8cqAUZlJRtAcnX2JL8jF
         r2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575020; x=1788179820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86o2mla0Wt4YoV7NQUB6bfRSm8bpfsWlSQQ8/iZvyTQ=;
        b=I0BXtXuxc9ML97vP0n+YhFt7r7V3nTOqvLAbUMi+zHUix8jvSV4u1d181jCw+Emww4
         yMVU9gbdosD5GpWrR/ZDIpny241F17a+jHchDdl/xIHuZQAB+oSfqh9rAlRhcuOOI35C
         4f+5HJatZ3pGU8tP7gfybDCZVL9TKHr7qtMli9l4rNPTwmVDdxuocmfw96f5NVRIuhwE
         IHUOvcGeglrlEMn6dsfnyBzc2Txa65g8cClcJJkw+jeQoptLsCmJkwNzYzlMrg5N/GjR
         5CTST4e/h7LfLrd9E4dxHiNYChXNUcnD5Phpp1KJmUyfVCEcS3WkitrfoiDnCJxLfZs2
         wsOg==
X-Forwarded-Encrypted: i=1; AHgh+Rpz4ONQ+kMX+lcquSg/tS185kOADPfq/xSf5tP6G1dVSAGoZ5S8yMYB6Xca7UeOVoH31HTq5uXt/5xu/jLzBZA=@vger.kernel.org
X-Gm-Message-State: AFuF++mEQrKwkvfIIvOTuO8AJpbjtuw5z2Cf70o+MHX2B2thgt6LDArw
	OKeSv+Jg31pDqLYOlw3jr5ZqPL0uSQRTvcHHcDAJLLg45ITZns0aSje5LFG0dr2hluBav4LII80
	7d8LDDu8=
X-Gm-Gg: AR+sD13TikS28QdtkbypVWkzRYADOn5i5MRnrH/L+XzVNJXnWmIFpDDSh1oBbeAS0to
	aDcuX1Fj62NsxO0nHaptk0tcM4bGIMedm/DqZIsN8Or1cEf4J9+SfwzVDzoLqZYZLZCWlDF5j2U
	14fBQobjkMt4T8pNtSW/EYdupnnPis89/iyZJ+mW1Xf1E/WD+M1DLh7FGbcnLipoYtIRoNi7EDM
	+S/8shluMoC5QmSnDQnC/GMUNCE4ETSItM9ceIbNSIxJEUWgBOz46t72fwHV0C0nzgiFfJFWXNp
	ZIcsVwJf6+36IcFXlbFZ8Ju8EY4riOhlb2OdgapNyx0dsVfyHov8bNdCPWflsqt2k/JEqyKdXDm
	qA7qtSAG3FbzDaKTjvUV6G0j7c5W1Lspkwss4cn0Jpmlk+B/+PRbMqLdLezuR30llETCP9ztBUM
	hgJyvJvVbyF5eJUKwCNVCa8XJZIjdCOZq+CPfpCh+rboB1fR+HOCo8CQD+Lsu+Zi0=
X-Received: by 2002:a05:6402:52d5:b0:6a0:a644:355e with SMTP id 4fb4d7f45d1cf-6a42f1848fdmr30356559a12.2.1787575020160;
        Mon, 24 Aug 2026 05:37:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5ba19e053sm2079673a12.12.2026.08.24.05.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:36:59 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:36:57 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Wilson Felipe Pereira <wfelipe@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] selftests/cgroup: test_zswap: wait for cgroup to
 unpopulate in test_zswap_writeback
Message-ID: <aow4qP5gj9CfiOr5@localhost.localdomain>
References: <20260824033533.2147900-1-wfelipe@google.com>
 <20260824033533.2147900-2-wfelipe@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lsaln24baban35xn"
Content-Disposition: inline
In-Reply-To: <20260824033533.2147900-2-wfelipe@google.com>


--lsaln24baban35xn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] selftests/cgroup: test_zswap: wait for cgroup to
 unpopulate in test_zswap_writeback
MIME-Version: 1.0

On Mon, Aug 24, 2026 at 03:33:57AM +0000, Wilson Felipe Pereira <wfelipe@go=
ogle.com> wrote:
> When running test_zswap on a single-core VM (-smp 1) with 4GB of RAM,
> test_zswap_writeback intermittently fails on the initial run after boot.
>=20
> In test_zswap_writeback(), after waitpid() reaps the child process created
> by test_zswap_writeback_one(), writing "+memory" to cgroup.subtree_control
> can fail with -EBUSY. Under cgroup v2, enabling domain subtree controllers
> is forbidden while any tasks remain in cgroup.procs.
>=20
> When a child process exits, exit_notify() wakes the parent process,
> allowing waitpid() to return immediately. However, the cgroup populated
> task count (nr_populated_csets) is only decremented when the exiting
> task is switched away via finish_task_switch() -> cgroup_task_dead(). On
> single-core systems, the parent runs before the dead child has been
> switched out, causing "+memory" to fail with -EBUSY if written immediately
> after waitpid() returns.
>=20
> Fix this by waiting for cgroup.events to report "populated 0\n" via
> cg_read_strcmp_wait() before enabling subtree control.
>=20
> Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
> ---
>  tools/testing/selftests/cgroup/test_zswap.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--lsaln24baban35xn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaow65hsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Ai0QAD9GkXMc6bI0AhzKJwbSaqE
aI4XwcIv1S0SkdLiNbkxuPMA/3XaRn1ZHXQ5i2Jrq1+ppT0VNUvfWl9IlFN0Wc/x
KzEA
=DvGz
-----END PGP SIGNATURE-----

--lsaln24baban35xn--
