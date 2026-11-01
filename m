Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793496489;
	b=NOeP/nNIQ6QA7w8ruwvQLxyMQeaSwcmkXC+FN+XPtrZwj1v22Oj7k/lNWP/ahrDUu9QM
	 tVuy/TcUkXrWBc8lp/irRq8hpr4h7qzPYvUifSzpARIq3cSKV98VOmPddEO1kTJzPDotj
	 3juUGB+/J9pyE+Pt0bn/2Oj3I30wFsPdYVwtC0QhMr9CzyvJu5OPbNXAeqQBV9NWcWFBR
	 UXzLuOo4ek5eO0iACE7p8tF29yn7AacoJ9rCNi6MO1Ot6qYJwabNEHSNIxPU8ISMRR7YH
	 6gtly3ZPmh1yKCscZKILTaaF0fLpl4ii2QDD8SHmigiwWiLrAMVcCQU8sQB68YF8soQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793496489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=7LrPxy9BAKXEpY6N5O++ZaxG2WFSWYtlj7o2XKSx/mA=;
	b=vw/adyYD+mxlZobWv9npZnpn7c8VMfmUBa23A2gcvf3EaysxkCtebLRHgkhr1L3Wyp6Z
	 MY+gEFuUmVEyz4pNUUJdg07RI5M5JwqJ5HAMPc3BNevihBSNJxQ24OoEkGE2OqH4TTHlh
	 e2siTUSy8BKRzHFoRTXROdPdj4mbeTN44mWAu+72IKwjRwm5StwS0sbMiNDfa1O0sD/Ng
	 eG5ZIPW6WX2y95S1ILBZnimwQtBaWDAU7sKs2dmwiupgp4NS8Lk36wRNWjmLf8yNdGdVu
	 YRMbTapFF+qjwnC9TxP4BKUBaFEGGdPNriyIfGbsa69ry+L+k8pb4+8Nwu5oO4u7URg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e7QGLOUt;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EED606A31D
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 01:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3EED606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e7QGLOUt
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9eb579c0eso9785245ad.3
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 18:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793496488; x=1794101288; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LrPxy9BAKXEpY6N5O++ZaxG2WFSWYtlj7o2XKSx/mA=;
        b=e7QGLOUt1jxbs51TNaA0p1UUxmGARGoDenhBRBvjutBP0RHrN3UgwV4ztk4nScfO2I
         CE0Khf/XsabYm+Az0Fh2deLwMw4WrujKvXwboO7GN+8g/mw3DBwk3vAe2ccjnq0v0y8K
         m1GbyoFMkINnRyNsmQx2GyNiWksPqWZd8cZg21VJhUR9Utr5VjzGL0yU4w6zsqwVVekr
         8JaIez//EUyXR/rRBaNHY3y98GohEKGOtA09sJN19Od5PNGhCKHglo8MNnVhwLeIJXHS
         1ll7DAejSrLUJGKn2R8vIExPLwpt9dh6o+h4OeI4WLiPUCWOy2DmJbDq1x39rNKV0usU
         QgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793496488; x=1794101288;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LrPxy9BAKXEpY6N5O++ZaxG2WFSWYtlj7o2XKSx/mA=;
        b=NVfYm2opemvHp2ssFswInEuDN/bCeK37uwYTMF3YzxEw02UU/01WWiGe4M6C4P/kvr
         RDdnLEDIwogbSgLemNZ6vYzWdKpy/VFQzvncUFbC3L+Yuahrkvc9prznzIO1w7CdDxm2
         uO+hKx6mLCfpUucdpFwoJIUlBy8J63Wyl1l2wHNUTyyLPSDhH+P7EaBv/sCsLbCX1lEg
         4MtA8zQUB/bOoFeP+4C6ZAn71C5970X4j7VFn2gtx7/968QSSUps4s4MuQmTdyqu/Nvn
         77zMxb7hnCUptdHuosDadPYLAoaOGxt7q3O1qKsK1i+n0dJjkpUhpLvhkeEyNWovAgRY
         Qc5A==
X-Forwarded-Encrypted: i=1; AKwUvBy0uHBBvdZ+JYDc4C5Ger/NOK+mDOp+HyQ8EIFhnzCMK7CPLZjWdEd/dIZSjPZoV/NN2uvW3SRxuNXSuRXbWuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x7Azr3Mk7fNgmId7nDQsI5y72RxZX568ZCq1yRqfr+ASbIqTI
	TPGECX4VBHVvkK3Uoe9dqYmFWamYCca6LiDSt0I2MrXvNuPMHNyRxWZG
X-Gm-Gg: AYBFou2UKaaiFi6h83XvJ/bnNHO2MKxIcxa5J9zHUmE5wpnVVr4OpiGPC6hYFcmiFNO
	+gm4jlbvbz7JeUvRkE47GgP8RiKtM07bQ3FgA61ky/gUw7aKauELGtZelapNDajgtHhJV6mUSZi
	ekgQl111T7vd9bH6OfVJlb6DEjLNkB0yPx/Ss62O396e/xf7vXh16pw/W36WDf1s/UPL4H10SzA
	J/9j2RDwhZmjm2MZJZJTn/zwXaWvgk6CESc1GWtFZdrAbkfI6YQJNtM82Z++dCGHfX6FTh2nuYI
	13GOfbupklgOVuaNVp75K7jpO1JS5wAPffURBKbTiiNHEaETC0t8MmrAGr+4vZkqTN/A/YUkdLS
	bws+eNegDlBzTRzeZrN3qBAMAEe33aiC5+izPIRlBgXkmHebhA7BDt9VaHTUaEgW9jkSP5bBzsI
	r4jZWf7H0Y3wL6atJC2qBUQX8OAVXbPvJXu3DCrxWYtFnW3cQGfPESq8++RMfAQsKW4Rr7ssdQl
	ZozB7y8ZZtA846hblqljRsqTy+PiQCUnG3+1a5C0A3wEEWsTvfoOHx7gmpWIkHWksy+60XMN2ZO
	HoCiRkg7Lko4r6FLSznin7xickudE9NMONcTz9qHjHOrPAtHuEd5XuBoNiuQCR644mv0gsq+Z8m
	605oeMUTj5DZw+0Fen9rMB0O4Nq0oZSWYjg==
X-Received: by 2002:a17:902:d585:b0:2e8:422e:19c5 with SMTP id d9443c01a7336-2eb3647c0b4mr52613375ad.55.1793496488003;
        Sat, 31 Oct 2026 18:28:08 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39298329sm16832345ad.61.2026.10.31.18.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 18:28:07 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 01:28:06 +0000
Message-Id: <DMJHFZPKETD8.PUM30IJH9D66@gmail.com>
Subject: Re: [PATCH bpf-next 2/3] bpf, sockmap: Restrict iter-context
 sockmap updates to iter/sockmap
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Michal Luczaj" <mhal@rbox.co>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Lorenz Bauer" <lmb@cloudflare.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>, "Jakub
 Sitnicki" <jakub@cloudflare.com>
In-Reply-To: <0bcebb4f-4b36-4f8e-a3cd-1eb0455081a8@rbox.co>
References: <20261016-sockmap-update-limit-iter-v1-0-23fa946db59e@rbox.co> <20261016-sockmap-update-limit-iter-v1-2-23fa946db59e@rbox.co> <DM6O08VBRY20.1PFUYACCZ38JL@gmail.com> <a9ba4549-4bae-4516-85ef-ee38f13551cd@rbox.co> <DM92JCFA4X4U.30MTDH0KCPTJ@gmail.com> <0bcebb4f-4b36-4f8e-a3cd-1eb0455081a8@rbox.co>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Oct 21, 2026 at 04:12 AM Michal Luczaj <mhal@rbox.co> wrote:

sorry for delay.

> But, if I understand correctly, the removal of plain PTR_TO_BTF_ID will
> make pointers like `peer` inaccessible to helpers. And we just accept progs
> have to deal with potentially stale data, e.g. the value of sk_shutdown.

Right. Then the lock can go.

> Ah, sure. So the same bit for unix_reg_info left for later?

Yes. iter/unix cannot update sockmap after this patch.

> I've noticed commit 7cc639dc45c5 ("bpf: Don't take an extension for an
> iterator program") got merged. Should I post v2 with the env->prog->type
> check dropped or you guys don't want to restrict iters anymore?

The former. We still want it.
bpf-next doesn't close during merge window. Only people that
can process patches get busier.
Pls send the PTR_TRUSTED part in v2.

I'd also limit tracing_iter_filter() to iter/tcp and iter/udp.
