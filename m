Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5727A314B84
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 20:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769803940; cv=pass; b=HKCCLAcx14uG1UyAszCvGFIsAGLsHAsQtzbInD+o+MZ6paapfRs8PyGdPgHRILCDg1GXp5WWYGE8FBvGG4gMf4xFLFgVohmngY+MmZ39bVR1QdxTmK/NcH6oTspldXVlIIIIfnS/oESlDrHZUDcX6zYBxLnqzskJVUA1dZREP6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769803940; c=relaxed/simple;
	bh=MhwO1+PHUqHtZ1O7ir9Ivwk5ucIgcQpOyJ87nfqaKYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pzdd5cQRl8m6pALTmBxVP2ZUpXkzGkCMejp+AqLP2K1Qtq28b3Asl9TWCMeqOJyx7TzZyteXhSBOM/6dBNtm7Fa89y2ZIm8wkXn09p/Tp8ao68IcXBXFYbBv0tXUsGPRBgbRDLonnH7e7obzfBZHSEAD43lTNJOqISUNc45BnLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYpnfL9t; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYpnfL9t"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-432d256c2e6so2216379f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 12:12:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769803937; cv=none;
        d=google.com; s=arc-20240605;
        b=LVreoVTFJsjQiF2gs7TOWviwk5aLXf22hH4dr1RQeFeBGLv2CsAIWpbnecXTy1cWBp
         009ABe+OqcPcFCi1d1+flPbdvcZ7+esKS7AmuP/0Uc8HPaenNjZE7V6ltm0kRh72J2Tu
         zneOpp6SU6apL+UVfSw3DD1BKIN2N7wXy97BLpyx8h0v//ENaNw2C7e/fr19T5Jd2pl1
         8Zx18TWXmPkEeGVg8WYqY0jZaaCo9sPyHQYpoy8E/bc7aSrKTNXNKvspOaPp3nuokc7S
         WIAzH4RDd6G8KrprYWyDtt6Bu1bgz1gxyuotSe6OgAcDv2dac9JhJwv2HemgtV/KjyvC
         pBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNkWGolxQDh6EVvN+xcGZ4XW+NwLQCLTlADMIxMO8Wg=;
        fh=lum6lAyT7/XwKm+5+pOUFRcPQXVxf1JdRePlpPllJ7U=;
        b=MVB5OKlP6/w14DdV5Ls1ngG58Gcvo1mOd380C8ai3PT6td3UzsJuZuLSIjsnncykzy
         XRdBusVLu+BLu3wQNs4KFVc0CnxZ2fIuKQiCVw+bH0dKc1f6pV/QiKf3ZWtkb6X76so2
         sv1XmShOTsiT3P29QMnkFOhaNISprjHvtajmGGI5Oc02XvFNoIg9i7i4vNd+YMiOvyjR
         j6R5ZmznEWV72Wz6gn6uq/ELC5wDi372KG2rK6Rn2OsZLPNXlvcBeUqGph+IoJwllHe+
         exc3Oxw1KGHldGioMjUnVzm9Zl6DXxZdjrtUVEJCgoEjVrU3uY02dp2/hXrFb4JauvGV
         WQJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769803937; x=1770408737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNkWGolxQDh6EVvN+xcGZ4XW+NwLQCLTlADMIxMO8Wg=;
        b=fYpnfL9tImfpy5OWEoMynHZ1BP1dc06Vm4Duh++k7cg819JSL/bYy5HbM8XXiVPQ/I
         IDkf04c/paKogoNQzosPLEJapOEg0xDhSKubOlTzmL/8NVd/aHhnIPJ9ErJ22T+BXYnQ
         AM+gSTXhE+ZMeE9rLTnX5hyQf0Cn9xKnYRICIWkD/FPmbj0J2SWdQlNV5q3cWh6h18Iz
         DdQ4kh3XU6aK1Bc0UhGl9Tfqfv65aO0NBSTFWl/s6xqE1e7vJQRPUU50ui0Hq/tSZuWk
         SOblqLNJKNy41NBPMU7IbNQdhtREHrla/fPSvRA4ryJiNxkRB351hUGCCHZdKsqMmuXZ
         s3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769803937; x=1770408737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FNkWGolxQDh6EVvN+xcGZ4XW+NwLQCLTlADMIxMO8Wg=;
        b=jukp15majFeXUhxjh6OZePdC4xtf5ehszxJG9CjrxWXE9g5+/ABOUSldbgY1sen5qa
         N5/D8RxMAo2fb6yl8EVpsIfHDKfzrdkvsd7FcLbT1xL1Q+0VgBEksK0MTaJikqsHgmye
         k5OcH2izpP4iULOX/nqZf/zteYuR3WB2WCQ7cae2hxhH5DJvM2/ujt7l62GcdRJOUE2p
         2bAFeT3iCBpL58xGMgQcKuh5p+26UNYoOsTEtXcAEG9PjMW/Ke7xNcruDErmGt5k3t5B
         iJqUWPzqKLmbyCLNAhJ9sCyF77Jmyr0YKIU3/DvMxuy5h5836rKkasiI4U8EiW+Kib0v
         S0bg==
X-Forwarded-Encrypted: i=1; AJvYcCVxepBga7xXFq4Z/F01VgD6J5IhDEUn02nCiKOLAvh5fMSJwMuINICccuoJMxZeFZezns+dlVsiXf4Dx2xBL80=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQnhkN2MExKq0rumaIMo4fhw/neJeohUo8KBJ+EWAmdEgCfPmt
	rqgz7orDdFh72JSII2wXA5zNMH34NrI5jZREh18jjOx5oDzxDPSgZwOmewAIWDv42teZ71UPxf2
	nbJh4vWRvqmmxyedNCssEck2+rmN/Nnk=
X-Gm-Gg: AZuq6aKCT2/hpfgkdMdJP1kF3KhR4jiOgRU3rOUypbGynRrjyl9Yu0mCQ0AAuJhjGFQ
	mcXvJD+2h7e/9FHtIcV3piYY0sH+Jrfs2ikX0fDKcTOjkPyqs2WOl9tegm/OAUlCyV7IRneMUGc
	CakNFNPYagqsGgSY74YfwKSTTPios/4DQH8b4uhSeRsjdKI00iQPGnb/RzJKcJfO4ZTowxeQzaT
	icM8YDoH2Tq/7B63q/IIu5YdE5rmn0TqDsXCWcPz9wZGzzyh0FHtgmMEm3dNxtWG05fHauZP4L4
	HU56sOPFLs44wUm1kl0YXAewEmunE3txJPPQAxzxBOU3P1esLFH9oA0WfrcWygrVVmEMcG8Bqvk
	xQzbqslMiEbk8Gg==
X-Received: by 2002:a5d:5850:0:b0:435:dbe3:c6b1 with SMTP id
 ffacd0b85a97d-435f3a92b77mr6548800f8f.25.1769803937424; Fri, 30 Jan 2026
 12:12:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128150112.8873-1-leon.hwang@linux.dev> <20260128150112.8873-3-leon.hwang@linux.dev>
In-Reply-To: <20260128150112.8873-3-leon.hwang@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 30 Jan 2026 12:12:05 -0800
X-Gm-Features: AZwV_QjdO1kPJVwhKD_i-fkrT0ene5FMAqGbrhrNJNSUzbF4B1pZUOSE0M6KT9E
Message-ID: <CAADnVQLmPPBazEGn5bvg4MMYbxtj6xZu3zo-V3DoqVYqZWDt3g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/3] bpf, arm64: Add fsession support
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Menglong Dong <menglong8.dong@gmail.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 7:02=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> +       cookie_bargs_off =3D (bargs_off - cookie_off) / 8;
> +       for (i =3D 0; i < fentry->nr_links; i++) {
> +               if (bpf_link_prog_session_cookie(fentry->links[i])) {
> +                       u64 meta =3D func_meta | (cookie_bargs_off << BPF=
_TRAMP_COOKIE_INDEX_SHIFT);
> +
> +                       store_func_meta(ctx, meta, func_meta_off);
> +                       cookie_bargs_off--;
> +               }

I think the name could use an improvement.

> +static inline bool bpf_link_prog_session_cookie(struct bpf_tramp_link *l=
ink)
> +{
> +       return link->link.prog->call_session_cookie;
> +}

reading the first hunk without looking at the body isn't trivial.

How about
bpf_prog_calls_session_cookie() ?
Then it's obvious that return is boolean.

pw-bot: cr
