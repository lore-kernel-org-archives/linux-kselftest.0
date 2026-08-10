Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D037043B481
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 21:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786397918; cv=none; b=BXdpNX3+nzVNpipsQqdTsVMebzoxbEOlr3Bn1TzH9tCsUOn3fwpMTV20eNWstHwpU0eykc2i/xwjFP8YI9z5XFxl8aLgv33ZHqURT155fd3NrPBqQQoQxtrhO5wYtiVjJZpmPPgB9rBMCm2d6c0+rPLvgada2uYZ97Ly0EYpehI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786397918; c=relaxed/simple;
	bh=SzV3R0Wcwyh2FU/lVOgTg5DG+vDRhxhYWHjHJ6y5zQc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZkROxAQybEPZWzjXcSj76HZTorrDSm25uHlFOg5MxVlWtWN41mwkPFSgDmN6NySCK3mMYxH046cuyW3iXjq5AoR/yc+kw7nNByKjYrPB3mjq1maq4v5DJEYqc2NRhiGnWB4p+IIoq6LBAy4ncjz35NAwrC0HbCnP3gR8eQX31JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/F0ayQo; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/F0ayQo"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-382ef647e20so2508672a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 14:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786397916; x=1787002716; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SzV3R0Wcwyh2FU/lVOgTg5DG+vDRhxhYWHjHJ6y5zQc=;
        b=V/F0ayQoYUmPpwXSIG0/f8/seNpdyccp8EUezNQY2l/PxepvqjI2F/XpRnT7VIJkwh
         WOO3puGTQwg2a8FWoDYJ/s/aJqzd5gs0v8XQ9LBJEAWjhHDvmp2skg00bPnVr+1q7ubm
         Ku74ZJ7iWwzM+qaFut4UGev7dv5gRVO9KxBgjPRY4wyDwbiFQBPjBMWXfCoFdnJ6dco6
         On587JOWAcG68u92ItLMA6Ped91ojnDI/5duT3KZ2+WYhpgWDaIb7RhL6sy4BoaBUVOH
         Eac7x1aw+h6HtujUsWx1i/tsSGtF6mP3uutVKtEr0Ks1/k4IMi9gHdENoP8MKgr3UWC9
         VykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786397916; x=1787002716;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzV3R0Wcwyh2FU/lVOgTg5DG+vDRhxhYWHjHJ6y5zQc=;
        b=WtuUt2QcCJhrlggFmHMRxpNn0nSYndtHZP5XFRLwYHSU1eM+2aqdbUJGLkjHeiEzlR
         g1LRfkApc0u7gv49llDhHOzHb3vMDHORuaoq0p5D1F/65+I0tfL4Uyj7ywNqKjMcsChr
         pYHRRd8wcI8QgGU5m7UsWszAkFGcHt1L3jbsPBtuU3ZhTMrNM/SBywlYUcVEOVDQz1kL
         OG+BoosBje/rQj6QjT1Z21wbtebkL7JYRbwoFjf74VGD7oj+h0QkJIATi1FMoTK4gGJi
         6GzWD7c1we/U/81CgVHK9b887o/8jV9ScV4ZGzt7skTgMROqO1R05PoGBFwx2oKY1xln
         bgdA==
X-Forwarded-Encrypted: i=1; AHgh+RorvkAoO8I3Mtx45qEc8S/7OmYnzEMGEbfnw5rWb03eUHVmyXag91K2RhfvqlKuHL5jozWtDwceNZ2c43h5hCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2KOdpFda3G50xFmZby1qXSMzv3SIIIUi05MyJlKQr+aX903uC
	PBloCdDzjC09elHuvbQU2mJT0wFU6e5ZrjfJyrPR5XkjMjlooI4Yzrcp
X-Gm-Gg: AR+sD11BPPlPtWSRJ7pg4SJMtGkg3ydRoO9hC05MCa8jxs1CNC0mDIIpT7SdZAif43y
	P9FEFsGtCpbV8ahRgvifvBG5Aa290yRu7V0nl6epUFdQC4SzBMbgQ4YZEyhcezMp9glW4U8zODx
	4cGP0GrJhWDxCgjg915G5yHI1kBpaqH8IaDGldheQPn6QduCw5xsCgK6nBLSL7hxdW4P+ruua7M
	CVW/Q1rA+20Op0yDc+chxdVJzjJSytUIEEnRHVpFWddfsI9MP7Shel0MN4Ic0s5KRU2SxR4J7j6
	qLpB+Fgq957d3aexSdi94DdNrV6SQnxHTelH0z6Xhkxz+X64ec0D89Kyttn9yQPvw+0rdcL9lD/
	DxKqqC1voPvQDE2nOzznGPnvtEOw3wVYdZoSkoyNFN0QQ4bXjbAc3+YQ7IIKU01FrYAv+aziJrz
	vNdl7aN/RqkrqnqWVB3bH5EVZwrdRkIc0QJFDEMlGF9I7M38Yzv9CAGMmleHEI1j8mALc8l5i0q
	/6kLwz94nhkaI/Lrg==
X-Received: by 2002:a17:90b:4c8d:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-392cc9f4517mr4072782a91.10.1786397916001;
        Mon, 10 Aug 2026 14:38:36 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm997472a91.17.2026.08.10.14.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:38:35 -0700 (PDT)
Message-ID: <fe4f216b5712bdd3212e049098d574314ff02e27.camel@gmail.com>
Subject: Re: [PATCH bpf-next v11 02/10] bpf: Factor out check_map_mem_read
 helper in verifier
From: Eduard Zingerman <eddyz87@gmail.com>
To: Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song	 <yonghong.song@linux.dev>, Jiri
 Olsa <jolsa@kernel.org>, John Fastabend	 <john.fastabend@gmail.com>,
 Quentin Monnet <qmo@kernel.org>, Shuah Khan	 <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, 	linux-kselftest@vger.kernel.org,
 kernel-patches-bot@fb.com
Date: Mon, 10 Aug 2026 14:38:31 -0700
In-Reply-To: <20260806163125.11172-3-leon.hwang@linux.dev>
References: <20260806163125.11172-1-leon.hwang@linux.dev>
	 <20260806163125.11172-3-leon.hwang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-07 at 00:31 +0800, Leon Hwang wrote:
> In the next commit, percpu_array map will add map_direct_value_addr
> support.
>=20
> IOW, it will add a map_type check in the iff condition of the
> bpf_map_direct_read() code block, which will reduce the code block
> readability.
>=20
> Hence, factor out check_map_mem_read helper to improve the readability,
> and the maintainability for the percpu_array map case.
>=20
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

...
