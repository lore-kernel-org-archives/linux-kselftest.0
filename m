Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A241F31355C
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 18:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769626174; cv=pass; b=uhpmk1GqeWrPcunQLnGJH0zlSmK8wfFs6MgpZHa6VG97w41NaqZRJtXXZ0q+M8h33EXBFcpm7uCVdxvt2eDJv2ipKu0NMDNIhjCb1GSB7sTFPqSPzb3Ko3+TaS0R/DRI/1eDWD3wWeNnhlMb4eq090XcbHC/r8X88mFLbKGVlLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769626174; c=relaxed/simple;
	bh=jjV5Od43uItyRHpvZGzXOvduel10uHKTWqh7dEC2oIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7b6GrpoOTB1FNVN3yP1lbOOAQ16OBiigjVWuv1zNDtqlCsRYEJoO2rtSECIxNf9z4KfoVNmDwHpMpHDK3BuU9iMXe5fU6QyqzG8F8YhqgUNci272ZuHh9FUsYIGfWAWn0410IXxQyiMw/c6bbHorsBtlzFtB/+KS9R1qK+Gg/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVNj3YeA; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVNj3YeA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-481188b7760so90045e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 10:49:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769626171; cv=none;
        d=google.com; s=arc-20240605;
        b=SB04zUhJoNuW58sqr2DzVqjJKhoi0lhhLARqzZjU3ZpKGWHTlbw6OoafbXDoYMbyKy
         UgviCXHErqJjpzwQ0inJPFUM0RztDGAH69plk+GXFiMNRWR7c0n/UjMeWM+eTLZOb94p
         2qBe3VFLMr4RN6tPcG9uolc7wgx2ls/gsZdYWwOTJEj44Rl+tlVlP3xmJk2BPsOfOtWP
         Kqn7w4HCTEKB4T9Ba7vLQTyLnOT8ReEn6t/1pxMjExiEsOESgXF8gEl5wrmXZ+c6jbti
         TSnAdAxuQqLKxzq4EecpYjJ1JPOPQ98EkWTh1FSsfX+gJz/69oM5hqESZlCJ2zao33ph
         vycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qGOxMm1K5WN+JT4uUn9nzJwvV/NU3i9BH4DGHjnCuXY=;
        fh=8i+XzDDIRj9MT80c+8KxQTV7gYliLQrNGvjKidBogBM=;
        b=AmfZ5p4l7df4jKsDbS/y1LFkfNVkKk+YopeKeeqwnZmkRpghtwU3v/YOlEFxBjur6T
         e+HamVsLabJza01CQxOACLHcsCryA9ysyny0PV+CR3p6hVhEgQsO0AkJK6Vl0Zbhw1pk
         uCmC4a8GeO0wpYWx9PQmJvPBkoHbMlS9515W2oJOJ/mPG0RayJStQcUcCH+RK/3nVsfb
         0QdZ9q2HlBAEFjjRCBlOl2cbFxBcf8zEuV0Ysia2cueI9vf6CFcnHmjbK1v52H2ABf1m
         02HnHbDc7Hc78s+cvS18c8A9kSXveFtiWKQDkx+g30hQT6kGphH1vjSqJ+ogdo3nXW8b
         NgYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769626171; x=1770230971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGOxMm1K5WN+JT4uUn9nzJwvV/NU3i9BH4DGHjnCuXY=;
        b=nVNj3YeAP5cQf8s0J9mauGHzaGgztasziWZGIui/GAkpD7f2xBWfEyF6K0/i6tUe+m
         cqt9OlAQXhWmlaL2swKiI/4mVFtOKoGXbY39NLS3qUBFBqoP87kXvh1DraTSbw5cgyKi
         wiN2Vpmx3CvcC98ogwiTCFihJxl9+Pn0vXWAxQNq6HlhpL1KJ9l2dkiFyBEEroVNlD+G
         yZR9i/56Bu0tFskBO3O22upn3/vky5spNRiAia+pi31HjyBg20mzoCzCQwBTVqByfupN
         9GdR1+WsdqIsT634iRSYghrIpKBd0z1DDgjq2R6jR3pZ4kObBnx7STokE12gnZiN2xN9
         1/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769626171; x=1770230971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGOxMm1K5WN+JT4uUn9nzJwvV/NU3i9BH4DGHjnCuXY=;
        b=a4oXBrGRL43W6l9suujPa/GK15O28lGl4XvVxeI6G0TElDuW3oacNE2EQt9TXILFNT
         O0G1Ar4hclZmESPHKSpU8zzF7KTUeF1ty4k5RLwYIc8jWwRcOo4casqW3GbYhzlTSvdY
         to2Gmz7qSft/Uf/niUtTVmfVO3cmgu1HFSg/97FpWjGunC4GoaMHktwbvAuP96uL0IVb
         S2SS8Ha6hro6IpL5zK5XWm5TDzb1A3ivpsVytCgr4JZ/iQLxsHQnJja/jXvRtsM4Ummk
         aQBxQcQdlVnKyu7rKVECqBJLPlnCjUIj4GQWaL82d6xwXZLO8J/GDQTY5qzBXkJJPnQt
         djTA==
X-Forwarded-Encrypted: i=1; AJvYcCWsIKpUVRFoynRh39Mt6/iilJtolMuXNfbljjKHBBCDfYkOBtCUFzUG2+9bvhlI4BKQ2M3KxZnYKuZoesjG6QM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+k5XRyLo4hyNhTtMJNQHOMwa/GobuAs5QD6IEFIESOhp9M/Ix
	NGEUO1+Pca21plHpyAaZzY6hKuEgJZvQlQSDLofxfPbibSyLX+0Dlh6k8BZpXDesI4rhNMJc7jq
	vdIlwbi9F2+Q+8FGYi4UyCT0DELz+B0o=
X-Gm-Gg: AZuq6aJjPwFvVk4vxhkUq4jucR8cDiwFcKO3uDlbMsk+0ZUKbETku3r48EVoK4mU1fl
	TsSaMcD7Nf49P3duLQZ4x+oNVSrCx9sf0Ogg7YAzamHhtQD70bw5bLxYIj3pui5e8q8hv+SnA1v
	YoDPK1OwkRmt4Aazw3I/JRa/EHo4sc1BXazmmi1ekKCD9B0f8wKi5U8a5Olvy2uxLkmPFgQEfL+
	munSya0kgaSNOGXkW6ScdHgeVhiRPirwrRfP0slP5Jw8mRDYtPXdnj7CnNl298UygMuQOn+TLD+
	+Ik2rfuVaQX3aUTNOCCr8ztihZP1Gwy8gJ25b2GrPMdsObm8f7TaRuy6gWXCFynkhv+jpSsPvKn
	dMwCeo3/7bu6jhg==
X-Received: by 2002:a05:600c:4f82:b0:480:4d39:84b3 with SMTP id
 5b1f17b1804b1-48069bfabe7mr87977985e9.6.1769626170838; Wed, 28 Jan 2026
 10:49:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128150112.8873-2-leon.hwang@linux.dev> <e64c4137e7f262e6fdab272e8ee44c8a129a36eb6d0186914375d6ba20d88474@mail.kernel.org>
 <65231eeb-1f00-4af2-9234-a290ea3f6585@meta.com> <a10afa70-29b7-48ab-b241-8b0f602abe2f@linux.dev>
In-Reply-To: <a10afa70-29b7-48ab-b241-8b0f602abe2f@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 28 Jan 2026 10:49:19 -0800
X-Gm-Features: AZwV_Qikusk2Q6YhJBvTgmuieIgLLJz7FiVhBc9lpkAd7bZar_-wkLjd4ZlAf6c
Message-ID: <CAADnVQJV=e2VgQzkpsUQwexhaVZMs7uXHCe1Fa6VwbVNUMPghA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/3] bpf: Add bpf_arch_supports_fsession()
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Chris Mason <clm@meta.com>, bot+bpf-ci@kernel.org, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Menglong Dong <menglong8.dong@gmail.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com, 
	Martin KaFai Lau <martin.lau@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 9:34=E2=80=AFAM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> On 1/28/26 7:35 AM, Chris Mason wrote:
> >
> >
> > On 1/28/26 10:26 AM, bot+bpf-ci@kernel.org wrote:
> >>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.=
c
> >>> index 5a075e06cf..070ba80e39 100644
> >>> --- a/arch/x86/net/bpf_jit_comp.c
> >>> +++ b/arch/x86/net/bpf_jit_comp.c
> >>> @@ -4112,3 +4112,8 @@ bool bpf_jit_supports_timed_may_goto(void)
> >>>  {
> >>>     return true;
> >>>  }
> >>> +
> >>> +bool bpf_jit_supports_fsession(void)
> >>        ^^^^^^^^^^^^^^^^^^^^^^^^^^
> >> This is the actual function name in the code.
> >
> > Ihor, I think the script parsing review-inline.txt chopped off the
> > part of the review where AI was complaining about the commit message?
>
> This is the email body pre-processing in KPD, yes.
>
> At some point we decided to remove the commit message before sending
> an email, but now that AI reviews the messages too, I think we should
> just send the generated review-inline.txt as is.
>
> Alexei, wdyt?

I think KPD is only supposed to trim the header until 'diff ..' line.
In this case there is no 'diff', so I'm not sure why it trimmed so much.

commit sha...
Author: ...

are useless in email reply, so we should still trim them.
