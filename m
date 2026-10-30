Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793319844;
	b=xxS3HriWhA8dwvtpJ1xuf5P8w2ed42xK78z6nA8LqcM/HALPN2Yv6gXISQMh0vjGNxvs
	 yrAw47Xa88qkcfFjqc6enlWZCNVkTTEM2OhLH1pR6rR1rIsvbtYq/uObbr4BeExSP9fYY
	 +dcAUnZ+Qi/+zQcaeRmWaIUyg4EoDRKbtOLRMFx2o4pKqfu/NtYc+cRW4v2vPDICvQlsQ
	 b5FqDjkAPIQMszC80D3rqMlvvF2nnHJOsRXUboUrfvQtiQ2GNXvXeBWGpwvG8SrlBL1Xg
	 ycY4aSP9ajjUfAWFpSd4QUjRIlMfAMcfXpNl5RiLlx2SYslMjx5bQ5O784erQWl4XRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793319844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
	b=nn/hiKd1M1PfAIlJHrPPThK/wW2fgOFvtlgtqESpo3IOPkQJOwbMIXoylcsVhyh48u74
	 oG3AKXWFunxDKFzsobiD05MANoB/jLhQddjxIKAGqCtzntc3StACjqJbOGKAUtokkW311
	 4G6oeJwdpu+jcHtiRMyKm6Kfu5xwKwZC/YSO2Y5/Lh27NluuV+eTYNyb6jldvJ4Lfnp4v
	 MvxUoV0ExcQ58qz5mnlJOLA26PM1zm9HZ6lYOfIrv5RYtWKnLCu8ymdHoQEExpIpRSzCw
	 px1MsQ5pDqj7GCV09gQ8LfjFq+r/NRwCzs2NFkzc2J06YW7yzDAd5bg/3h1w5m9cRbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LpGlNmog;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C9E606A329
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 00:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56C9E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LpGlNmog
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so188345a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 17:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793319843; cv=none;
        d=google.com; s=arc-20260327;
        b=P0k+6CmBu1ZZuKaaYq4K7Cw2R7d0y6x9u9KnYCRJ9c5Vt0+Exf3yizjLBgkyErIehr
         fAYk5Qb/s3ElPHgRtUIvTSu/fGaH0tKR7zWTu+OfGzx8wUoZrBKgFEgyKDuZuGF+Fofg
         oTlwSB5SYICdoHF0w7+S4St7zziqL3DYABD3XAu/H0vobwaSnH5mq4JNPu0x9mPmsvUZ
         1WdqbMSpQ4ZWpIOv/UAOu+ZMz5YPURs96GoMDuU7xYhOg0uOcQixoisOMbt/qyvsZGD4
         CN1dSiWhhMJ8TesLzlTgzUzMu6Yv43hWpa2mGifnOf1jeHRZzLwhYGXXUptQ+cvVnjdn
         J61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
        fh=eyaXDlroo3UBt0T/ViDtP0p3xrl1Czsn9Rb7NX8pYcg=;
        b=SqLmtKgbTgDi9kPxnRecfQ9Ljay1jbBK90txxQKbHG62pGMkkyI5uAWoGwej5KEmwB
         KKK3v+3JQFzeBBLoHbCP2lfd2Kn/fJuEbsExXW2ZH6gx49SYCSr6YzNllwTRfaQqiCli
         sSRIia7z4plxJ5hhd8SOaOelPnKnRjyGtOwRjj+RI7xniatZTifkkh6ESmjqkHjCbjlV
         eT+Qs7ZXh7lppWD+jCTqDoI8bhCb4yybsAFb/k4z63bdidg8lXsRCyflf6S1f5Hm0u6H
         BTXWUC8OrO2IcXmtPVXCV+AuVs/sJEEzMtTxR1MffhzqOXYyuMab2jOFUSYSJU8rpNXd
         j+Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793319843; x=1793924643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
        b=LpGlNmogTRImOIcoGkVK6kX1FwvGGuvBqIqbOQmm5KJ3xSt2iFKkzmTKCxMImHdVaB
         aDfTjwZqyoMW2Iv2ufgeHFBdYwUo31Cysp7oHlTZ5mddkgutsSip90Yu0xuL4dwsjPlG
         H2d2o1NYWkpAmpZotlXfjCTbgYadKtl2mltD866hVzSHDvqBS7/xSgXNB9gCvo5NaMp6
         UR5LppzANcnsvAThS9ZzZ+t3lqd2cQjUINGMXJlzmHMLf95KKq7TGISjrOlO8RGNlmd6
         PEsSvEAPMgc2Des3Z6s7C7VBy/qcyKQWcN9VLLn5h9MLqOJtFhjlOBczCmc7Ss729Ap1
         cjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793319843; x=1793924643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
        b=YRPZoODGAXfzFqzx8J541p3Ltpr/qBtV5zDfY3hF/xy8Mt5gWtCrqhdISqdsAcNSBw
         6PuLFtk9viraMbdWkXXXLyts/5nbJU7ev/Ay4U517R0IXeAL9jD4p7kZqVBIAMp0czP4
         hG6rRP6R07FETyvAdoPEIhb+IR/6ifnw7gnmWLzSdkhCOlnbxhsoT5lixfs4uh9WoXjh
         UB9Gy6FYYvdJpgDRqGVN4EDDvsB/pZ3ybnVIDjKkidr1hjHWXQR2v9bXYJiFz1rVx8Vw
         t92ySDwNd8z8Mq+CsWvO+mAsFbRxXKr9vDGkZ3usMg9cnns98t8y/s/tqIjsFyS0BfCq
         MtDA==
X-Forwarded-Encrypted: i=1; AKwUvBzh1pvWbisJ6dtygBLztSJ4y/nu7StP+Bhy8INyDxkPvyv16UDhQY7NUKGYGzBpUg/JUr5BSt0qMwjebadEc+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb1R30HRyzp3eV4TjSw/Zx8I1nKHQJA1HkHXGibZ3FpZ2rSs48
	sMTjT/mtJ/xvzJG0P49MIIoOKLZc1mgCUk0R/xpErCVlJbCFL3HuNCbrXhbQS3UiVrsPQcMRicP
	WQ/233qtCet29uQhTP6Z9WSwXJUH0Qp0Y6p/p0T29
X-Gm-Gg: AYBFou3DBvlKO5SOi+ggkExotOw1jddQ79oO8M9N7NlSfXQEw/23WOLs/k/GclWBSbP
	b3od35KEYgGJvEQyMk9Wkw+YvxCt5paIyXHHBsjyJnAtydGE6xzTl/HcUY3sSnEJky1oVBQfGDE
	I3ahgA0QtigPpKNt85tRC3K9wPB2DCK6GaJ6dEJHyFPvpqz5wFp7d4LXMlSL7FegLDL2j6s3GKt
	yqDj1enbasY+lA8Us/8PYdje8ZZYmjDq6U1weQrRMDj3Bd0y6HR+weYn82y0yn2oS98gx2/pZqY
	TlLlkV0MucjS/r2i9lWXiPdGq9sDsbzgzNKOUf5kKlbXeTNu01PB0eS1kElKf5uKu1wP9o3TdKV
	uujgkCl8+KgqMGBJpbuqKZFeSP/HqEz+132eIzWL0KWkEe+kY9DbDoGvimBBOsAb3Lq5sjPEbNj
	RkRpRLiAVLNrtOLzOh
X-Received: by 2002:a17:907:6d20:b0:c46:7643:ae91 with SMTP id
 a640c23a62f3a-c4ca7a08673mr59997166b.8.1793319842360; Thu, 29 Oct 2026
 17:24:02 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <CAEf4Bzb--Jzz696u057G9_CgQN7zf6ksvoL80KJacKO2CorsnQ@mail.gmail.com>
 <CAG2Kctojb7xiOqTmwWqoAKFaNUECjOzXVc_t6KbG13Pqm2dbng@mail.gmail.com>
 <CAEf4Bzbs8F1DPBz=WXVTExrrNjzvaFsi4L+HEj+zbUTpPSTX5g@mail.gmail.com>
 <CAG2KctpSTCyWQHgJ8GyFEhHPdFawUa6zy0g7rkfCcujJRN6f6w@mail.gmail.com> <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
In-Reply-To: <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Oct 2026 17:23:50 -0700
X-Gm-Features: AclHuK_8kDb2R9N0iMUoVO0Y5pzDVtS-1XOT4NszWcH8axoYKkVXrpd6hnWmpKQ
Message-ID: <CAG2KctrkKOTdsjWVRBEHuH45-9xpYsxDTk8PpZ4Gu6Ygq1Azew@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:54=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 3:36=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:

[...]

> > I envision ALL_MATCHES to do some form of lower_bound() +
> > upper_bound() on vmlinux since it's sorted, and then linear scan of
> > all modules. Of course, just one of the two or both aforementioned
> > things depending on the module filter (any, vmlinux, module).
>
> no point in upper_bound() if it's sorted, you just start at
> lower_bound and go linearly from there. I don't think it's realistic
> to assume large number of duplicates, so I wouldn't optize for that,
> one log(N) lower bound + linear scan will be faster in most cases,
> probably

Ack, lower_bound() + linear almost certainly will be faster in practice.

[...]

> > My understanding is that the size is encoded in the ioctl command
> > itself: _IOWR() puts sizeof(struct) into the command number when
> > userspace is compiled, so _IOC_SIZE(cmd) is the struct size of the
> > header the caller was built against.
> >
>
> oh, interesting, I didn't realize we embed struct size into ioctl cmd
> and match it exactly. I see that pm_scan_arg has the same __u64 size
> in the struct approach, I'd stick to that, and when we extend any of
> them we'd need to make sure to either ignore or hard-code the size
> part, hm..

Ack, will include the size in the struct for v3.

[...]
