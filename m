Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D7C3E276D
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 20:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782334746; cv=none; b=ndWTEI2ocNoY4ckyGRxH27BLRgzi38oywTJbD8tCkFKt+C98ncpSe5mJaeO5t8C3IAIwoNSmvX26NQMKQA/i3LWIf7APo6maxtAysmj+Jbobp3ayEDaeGh8zivsot72FkW94MECF4k5xINVwiLn+HPXM5q8XSmkq22UpRKiadgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782334746; c=relaxed/simple;
	bh=EBkFIJ93p7H/YLvd1bjDixSjBj1WJcUuUZBZooQYb6I=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=RCdxKRdRtMSfT0OcULwd1MEU8z6LNOWUbmGumpb19PbgxzVY/yScPTAMlLI/TqfIFDSiVk6NWhBgpuiiTotl/lGmEMdm57Te0S88tpE/quIt2erW6lOjACc+5NempJJJB46xs/tO2LseWhiSxgMJiUkXqyBIIxKK4m1kw4E+TN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEu8tmHw; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEu8tmHw"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4472500e25fso745367fac.1
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 13:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782334744; x=1782939544; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBkFIJ93p7H/YLvd1bjDixSjBj1WJcUuUZBZooQYb6I=;
        b=nEu8tmHwx2U1PBAEVk9SSfaKDiWHpWY0GgE6lK42n19VrwT9Yhbx3bqUjkJlvyV6e6
         McKV/XKeL5WVIq5rbaObT75GmdM4C+cuolkcEXQ6+pQJ80+ClZws1fyHkABkBo3Q7koP
         T4SQPvwKcW994KV3TwAQ7YlE+RUvL6z39EHjoA6DAtHh699CI+v6Bh0UhuAaQ4TWmoyi
         A12Fxepo3h5RNXzCp7lkr8rUQ9ydZarT/GpW567cP9s5Gd2awsVxDRpI5OYwzvsFx7nu
         z3eeYl4KzvslZetxr0dhx5ixvHwhXBwLTVz/xANyimNjvKc96mpbS1Mykys45X1RtbG+
         KUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782334744; x=1782939544;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EBkFIJ93p7H/YLvd1bjDixSjBj1WJcUuUZBZooQYb6I=;
        b=anwYk+CGpSZRaDiLUMSrBsUFvZTA7FlrEClY86KByMoJfuisLOKiPW/bLMw9akE78h
         7aY2uDzAUouTNADfDptDfJShE7zGhvOSzHjQOSzHT8BQeoZL3Ri5slTt18/mZ2xOuiMy
         Ka1Hof2eQynwcQi5RC0e3E3v4/SHPlwQuEkMfeRslevxklmWsqtAI/SeHlqdGz6GvCnm
         QRYp9HL6bNk+00CAp/po4zygImWLBOx27tfbUInJjRwt/vI65rud0YUZxpy5o2ZhJ6EV
         qJO1mJhG5TqkIMD0We4m2rLGWKbGL8nRSXgppR8Mi1p4rWe81GpSIyt1tJPZ+DRBuijS
         2Z8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9nYfiJF7AFFVyr2Tiywti4BXy++TDCB4bywkO+mWXMK2wbR5FvCyqXp2SMzeUA+7HWx1NMTxLNRothLcXEc9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7svGi09ZT0T4249mAY7JkQ0Wv8qKHTlIB4SBXifUEsZSZEFq7
	rYG2JXlidJZ9qltnJ2bJNbeWVtGDtPP0dkxQkEiXXKxs4eQSy6kP8mLB
X-Gm-Gg: AfdE7cmRr06xL/4opVPKQjr9kOP8NvhXOm9TKOEvkxIvnqSGTpU2HdrdxlApTU62Xzl
	zNxI6rSwFa0O7CJSchbwoiANJqXM2T1Q3tXG/AVU0751GRN3CO4A4ocDKbWlZ0f9kS71VlcK58W
	EQysBLR+wYP7WGCYWs5RN4QuOzUhy05rSEvDQFHxdGVWwdOa9apzVUvWpJOyYV8S+R4Uq5eoRXi
	8gHdHPYJxX7rf9KsmS5fUP4ULoZyeQOcKcWgYJSxA6m20hM2m3T/L4eUjoWIo/yc4AEH6y+FzI8
	qXeNpPPdI1qgu3wqgsxn8f4npiKM7s1X3GtTskxqpWJepcjs3QvXSptfEAZBSdn9uzZiINQmxYs
	0X1kgUFqXebq9IP+XWWjY4TbUfpKRvzbeymN6MOcdP5MMLY1DzR763UehZi0bEqWdlI06pi8XGH
	tNZppMoXSgUwoFQmOP/J85OFi3oQ1hO1+d2PETKJOFGaapwkKX9MjCg5P3hNoF0poWdWxXV9xUD
	ZwKyQ==
X-Received: by 2002:a05:6870:f28c:b0:447:48b6:83c6 with SMTP id 586e51a60fabf-447dce9c2efmr3673260fac.24.1782334743603;
        Wed, 24 Jun 2026 13:59:03 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:5::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472efb37fesm11646096fac.10.2026.06.24.13.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 13:59:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jun 2026 13:59:02 -0700
Message-Id: <DJHKXOX035PB.5RNR3ZGIELZS@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Sun Jian" <sun.jian.kdev@gmail.com>, <bpf@vger.kernel.org>
Cc: <ast@kernel.org>, <daniel@iogearbox.net>, <john.fastabend@gmail.com>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <shuah@kernel.org>,
 <laoar.shao@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf 1/2] bpf: Preserve link info metadata on ENOSPC
X-Mailer: aerc
References: <20260624111837.889209-1-sun.jian.kdev@gmail.com>
In-Reply-To: <20260624111837.889209-1-sun.jian.kdev@gmail.com>

On Wed Jun 24, 2026 at 4:18 AM PDT, Sun Jian wrote:
> BPF_OBJ_GET_INFO_BY_FD for bpf_link copies struct bpf_link_info back to
> userspace only when ->fill_link_info() succeeds. Some link info providers=
,
> however, can return -ENOSPC after computing valid metadata when a nested
> userspace output buffer is too small.
>
> For example, perf event tracepoint link info can determine the required
> tp_name length before copying the name fails with -ENOSPC. The current
> top-level error handling returns immediately in that case, so userspace
> observes -ENOSPC but loses the metadata needed to retry with a sufficient=
ly
> large buffer.
>
> Allow bpf_link_get_info_by_fd() to copy the top-level bpf_link_info back
> on -ENOSPC, while still returning -ENOSPC to userspace. Also let perf
> event kprobe, uprobe, and tracepoint link info fill their metadata before
> returning -ENOSPC from nested name buffer copying.
>
> Fixes: f2e10bff16a0 ("bpf: Add support for BPF_OBJ_GET_INFO_BY_FD for bpf=
_link")
> Fixes: 1b715e1b0ec5 ("bpf: Support ->fill_link_info for perf_event")
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>

This one is in "wont-fix" category.

Please stop taking AI reports and convert them to pointless patches.
Fix only what humans can hit.

pw-bot: cr
