Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CE9257435
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 00:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784766487; cv=pass; b=ADSg8NPmWMkU515J8kC3PX2DoRIFakjFBnoCYGH864XlwzsS2ITAuY+oQn/k1q6/vc3tK+FaGM/t5uouajy/kg5oqFskWx9BGy+9hoybOgajhcjLhCTAJbBUlzsO5b7Pol+VfL2KE2N1RaGMJr+vs6YhB54Au5d3yOEo79WZLq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784766487; c=relaxed/simple;
	bh=WhgElbkyL+YQ2nUF3nV2RMwVyzKNCc93XobSfP2MaLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVXhXJH9y4sfGUcwVu+Z4VixYFSCCdOQiijiaSlha6JpfCNgidyYk55nkNqCnyVvsNTIG61yMgF7hJN4FcVaGyr3dw/hV3zBU1D1DgENoabHi6gZYz53ObIB5OR/CKaWvREqp6OxxCoDP4e0M8xl6UbMCYdDxRr9XG5LPpYExkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aQi9eNpB; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aQi9eNpB"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6626b5ace23so30267d50.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 17:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784766483; cv=none;
        d=google.com; s=arc-20260327;
        b=VQJcramP1bklMGjV/KmHuSkCk08GOf6v8zydCfda3ilAmFnU1Ax3CGs5iqmw7KSKHh
         ms3dDCgT1gQx7F30RKqf/LNHrhkndB9rzG6wmcJ4Mb5HKhjErIucXqzNwmpjxuH9gHrP
         EMtt1ccgC8/QDK7oDtLzR9gBpEfv4UnvPK2UmDRmzaVcLHk2saAHmrdK/w6+C/O/VJwN
         4duaWzvzmS4U2nVwm50k3bDuYPbauDWAllFaMc96rGweTpiGwEPcK707AwTXvroqUjnz
         zTS61b9RTprTM+RBnAorDBSc88y1OVuZ0zF8ELyFt/G6D/oyEuSU9h9G/dTKObGwuZNO
         Bp3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RsHJOPkB3r57eY7YSYNODJjccFT83NLJtKpeVdIvQDM=;
        fh=qQyzxDfkI/82QF6EKWQpTm2MbxLPnHRHCfyIBsCZnCA=;
        b=KxeNOrMyhjRARdySTZ+Eq3kqqCjvXnm5SeNfg87TK333xLu6NVJfUzXEXn6eXqIw5K
         WG7iiPysIrJm+8RKzh/izu0YZmN2xpTIKfdhx96hbxUdzFKDevNK7of/mQZlc9YZVKmG
         E9KpVWnWh4zWrY7++0QniGUF8f2mTOg+O+TH/8zmaT5VmEfwsfTvO9BVr6kbedlqvuGV
         ydsEFnILsOJEgA5JvT4Dhs9xdSqQ0Gtqa6+glyt7zfjgMc+RzecfQN/rrZ5g/urOW1X+
         wWcuLoU10KL6XZv60u3rS69fCHyvi78RDhRthK+z5RjycXHhcaMhAdbkHG/Sh/ToQFWb
         VP4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784766483; x=1785371283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RsHJOPkB3r57eY7YSYNODJjccFT83NLJtKpeVdIvQDM=;
        b=aQi9eNpBGQV8AAhzfN8i4woXzNPhxVN+ZWnm9yvL6/H7gda88vqO88a3wFCTv8KKtg
         puI0Bun1Voz4JzdRil3TAtNMKs4iGzRsEiljrZuSQ6MaOmjO/RmHJ/LV77iHkYa+htWd
         H+eLkfppgiTayBWeuDP33BIF4KMm2KASKW9U8EvCwrO1MyxRj1Dkr9hF+EEIq830a6sG
         A9ATcyC+P1K8QTcQC194Dau/RK/E1lE2XWwit/sQ/X8eVAHrgiM16LcpBag4jjSIu6Xo
         qUqOD/bTqUdwl7yxgAK/xpLxSR9RSntXF3fBlVrc1KeMG5fzXZ4uhLVMXjpW/i99RUZQ
         1Neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784766483; x=1785371283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsHJOPkB3r57eY7YSYNODJjccFT83NLJtKpeVdIvQDM=;
        b=SOiJQAaP/cHcv+0Xj4GTYL5MZj8xmO12drt+CztfX2vqgsU1oxsjZO1H5tu91h603J
         0xMzPAhb37eHYywfgxRiH028fg2UY0ahDXRghnK7roOUG/ksOkCnM1L6PBQ5zQXE5HAI
         6RXnnfVEnh4M4k41rQcxNCzmSm3L+zbWV/YEuVadmNti7C5q3jgBm2eOv5LA0y89PLH5
         HaZBaC1UgR7AlS/y+kJdO9EmMfLvlFFmpdz5OfAudAdBk5VahEWAye19umrnoH+rtCoE
         Sq2DxcDND7drIj26r99uHDYdPQw23EL0niWLPj7CW+zi5SNPUVMWxhwQ9rH7PVPEFcYz
         zDiw==
X-Forwarded-Encrypted: i=1; AHgh+RqcmgRCisiLZsFqDbKFi0GVf5CrU2wqoBPGsT+zBpWYq0vNsl/Dcoo9479bWvWBgaeKx0gUXkvznrof0Xlujb8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd6D2wjMDpIprHTLB4cj3il/j9ZQoPrkI7Bn0koZVJwyiuB138
	qIr0go1h0SZ6qqYEa65aTEZQAJLkD2zvPtDstBhqnRPaBOB6r9LZ4OutdziuiRzv25dgPOPkNvP
	iFyoROzv3IeHlsX0C3ZoIQwhKgVdpzlPmzRz2z4l9
X-Gm-Gg: AR+sD134p3pIQ9gJPawoKO/nyCyk6Bb0o6ATyISdfMz6xdgrXvyZHRQWWRAJrz8Obyu
	xlhTke+nB02xSgixTZCtcwgo1gqygFgGsUK14wb/3dshpFMq12/mI1/Cjdu2jJdU18m/r0qLjzH
	mm5YvJexccRklrXrGI2p5aGpXNluKX2lSP6qTcKr5/LyialsPqw1Eqo5aHtx1E5t0c//UdNCk2C
	/Xoh4xv6ZfJj117Pw+8BhnBEF8e/Rabeue57p2ooBrQWhvIk4kQYW2df4KkAJ3nvKEq5o7dLgAw
	ZP/2gXuuuT+KcEbM
X-Received: by 2002:a05:690e:346:b0:667:8471:41a2 with SMTP id
 956f58d0204a3-668a616916amr101624d50.25.1784766482781; Wed, 22 Jul 2026
 17:28:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722070801.2057634-1-wakel@google.com> <dca6abef-0f6c-414d-b7b5-02e5b2a355e3@igalia.com>
 <amD1LPWCvNNrYdQs@google.com>
In-Reply-To: <amD1LPWCvNNrYdQs@google.com>
From: Wake Liu <wakel@google.com>
Date: Thu, 23 Jul 2026 08:27:24 +0800
X-Gm-Features: AUfX_mxhm5_uM1lQOjqyc07yNdEsHMJcrmWEX1AmXcW-XvAVjMOakWrPmVbAWrw
Message-ID: <CAOcRiAH=LyJoyoNe-BV8BYUomFs97OFzPkEL2u5G2HZAC3mmsw@mail.gmail.com>
Subject: Re: [PATCH] selftests: futex: Restore support checks for futex2 and priv_hash
To: Carlos Llamas <cmllamas@google.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, tglx@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	peterz@infradead.org, dvhart@infradead.org, dave@stgolabs.net, 
	shuah@kernel.org, mingo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Carlos, Andr=C3=A9,

Ah, sorry about that. I didn't realize that I had already submitted
the exact same patch and that Thomas had already merged/refactored it.
Please ignore my previous email.

Best regards,
Wake

On Thu, Jul 23, 2026 at 12:52=E2=80=AFAM Carlos Llamas <cmllamas@google.com=
> wrote:
>
> On Wed, Jul 22, 2026 at 12:20:37PM -0300, Andr=C3=A9 Almeida wrote:
> > Hi Wake,
> >
> > Em 22/07/2026 04:08, Wake Liu escreveu:
> > > Older kernels may not support FUTEX2 syscalls or PR_FUTEX_HASH.
> > > Removing these checks causes false failures when running the tests on
> > > such kernels. Restore the checks so the tests can be gracefully
> > > skipped when the features are not supported.
> > >
> > > Signed-off-by: Wake Liu <wakel@google.com>
> > > ---
> > >   tools/testing/selftests/futex/functional/futex_numa_mpol.c | 2 ++
> > >   tools/testing/selftests/futex/functional/futex_priv_hash.c | 2 ++
> > >   2 files changed, 4 insertions(+)
> > >
> > > diff --git a/tools/testing/selftests/futex/functional/futex_numa_mpol=
.c b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
> > > index 78c0f7a59e17..d215acf88120 100644
> > > --- a/tools/testing/selftests/futex/functional/futex_numa_mpol.c
> > > +++ b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
> > > @@ -103,6 +103,8 @@ static void __test_futex(void *futex_ptr, int err=
_value, unsigned int futex_flag
> > >                     break;
> > >             }
> > >             if (ret < 0) {
> > > +                   if (errno =3D=3D ENOSYS || (errno =3D=3D EINVAL &=
& (futex_flags & FUTEX2_NUMA)))
> > > +                           ksft_exit_skip("futex2 or FUTEX2_NUMA not=
 supported by kernel\n");
> >
> > Why aren't you using SKIP() instead of ksft_exit_skip() like how you ha=
ve
> > done at
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=
=3Dlocking/futex&id=3D50c121e5a57abe446e46825fb9c69ac419765d5c
>
> It's actually the same patch. See:
> https://lore.kernel.org/all/20260624070223.1533167-1-wakel@google.com/
> Thomas, just refactored it to use the harness API.
>
> I'm not sure why Wake sent the same fix twice but it was likely by
> mistake. That's all, nothing to see here.
>
> --
> Carlos Llamas



--=20
Best Regards,
Wake Liu
