Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BC137AA8C
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 01:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781574249; cv=pass; b=oUnKwkjK+QQeDalL3V5lfu7/OaOln/oOZ77xyTRuRJuIdLA1XKBk2PPjMQo7/1CiB41UA7HO2tI4sE7chfVjnqBDzjKSbwcOxpMub3AIo+E2hIfzZ9vLBrQPORwbxuGFfuFVl43B0p0AAB7a6VIhLIEspmL4GZUHfuPDepfTw6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781574249; c=relaxed/simple;
	bh=236fBEIJz/KEeeV7woGGo3ZYcOTNrCWyCpSWEhiGQK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dlwu2xWmKckUKCLenBERgo7fcEgemHogO300lM/Fo/6Un90if27i9FMW/Ikto9a7SekOSaa1DVzMkxMMTU9ufKLlZ91zbS+YB4g5mIa3LZW+/ytfEVLD17PJ2asdLXAoNX7Zh/RrFgjJXFWt5tUhiHR9u4uwjHs+G8WBTTxn/Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2o0frn2; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2o0frn2"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7e3b2a435ecso43611587b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 18:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781574247; cv=none;
        d=google.com; s=arc-20240605;
        b=f3XyPw2SyIrdEXCWF78TY+2cP62D0PafjJz7AIEIO7o/ht5xeJOjvyZIblYC/876KF
         G+1QE1bOUpsSnlgyQmB4urLZph748UX0sGJ4oWW9P1ZdZijjV9P3BhBV6Y5brUAnWWxX
         Ov7iZnSBoAfNIBAZLiiTddAsgmJB+TycNgpcuORJdjoZ+dn5fhXgj8drBoFbHZBNRVJA
         fzAd1GxB9FUvAgzIvLJWkWqirdryX4sGMw0EFywsO4UJU4aYGKPcHdQm3o2vEjHk7UG9
         /wxJHv52zIIkvOwp5Fv1vcwxyMksq9ACDqyn1QjyBcPM7eqbTSdyLBeNmbqfZLpOLTqs
         QYpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+oKKpyH4QTZmF9PWO5iAvNe25h+SsPEG6KTMiiFXfCc=;
        fh=QEdcdBoe6ZOJ7KlT8TzECY4on7/0MSSEva7cB9HB5A0=;
        b=Ex1oNzdb/rGW6NCixvSlm+eKrJGq88TGUtFVcZJWnd0hI4jG0OqxLIx2vHSkHt8+Hl
         /EKOWqLowFvs2p2fSpLE/XewiDrHeXflb1ZkJMeMC19if2ElhF2Q0qRsawPrmgRfxo5R
         wcYvxUzlm9Cf0P67mU9aPvu/l6INF/yQDjTy+pVfnsp7vtNZV0jFUFT3jp5/eKTiFSOc
         I4sXyCQNxPlkG7/INVoTZSamXZ4anwQqEyKpjxp2Ze5rGcf+3f7vTvlmYKOZoXt2KacP
         GXnIIdM60c4Sm07tef7UZ5NSf7FkryZqFaJ88yWXb+Ol4WFUKdrmeVHGKQCsT9O9iIax
         hJgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781574247; x=1782179047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oKKpyH4QTZmF9PWO5iAvNe25h+SsPEG6KTMiiFXfCc=;
        b=E2o0frn2KSkwnFR4DV7A6TqMGa/Oei7dB2VJLSbtZxgmj/8asuPSLDfPSjAg7Tgo9s
         ZaL9wyUtGjGBjjNQo7B+ywKOAzZ2qYwDsYuTP4yHYGHB/+FJfE15KvbQb+pkhulZ8lSM
         jcXzc+7loptnXJaYbCw2OIGI4KLG/S+6fswjUIq+0+zXdIP0TUCVAFxP7ioa2w+F5FfR
         26cVzvsrGnC0mbgCQm6ED96BK3uOUoPQ7T26lFDZFmBj1hib2zi3TOoGd+dkIZBV5jqd
         8hgBt7a4jMW53dT4SiudefPd6660+zv4qhyu2aLAWNr2+3kT3nkkUxmhjgdrK72MGyqB
         pKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781574247; x=1782179047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+oKKpyH4QTZmF9PWO5iAvNe25h+SsPEG6KTMiiFXfCc=;
        b=By8vAKFz0hsLS8kw9asGgnvlUCp7rFcZnYq90aPdJDHzltK3ZZhNchx1ePFWfOjnIK
         rrD11Z/NnNkScwcqWTT0Hecfc4bWwoliBdnAoUDWeXFWHHdcaa2oPDC4XlKCfsL58jP4
         SbBpy671tH2f1JqB9cB5hL3DadDh7wdjs9MPYUWT2n6pMGLjhmhGeOQ4UZQVbMze2O0o
         IlwIjpEaFlopD/IfyCdQSRebuV/Wd8D6elpMYo7o54hcEkbnL8hWHBTraKPe2TChSo6o
         WusUhcE1t784rvN5olqzb++Y7pgv6juFdMoujSSiMGGm+QQHkEKLiBKkPXeb/pAdfOac
         5xKw==
X-Forwarded-Encrypted: i=1; AFNElJ9cZFmmuvSxVuMnPJ3vpm9Y9WORWlaPw/zVwPBDjLoHbMOT2HGLIYtX9ICTtXQpLyXgVk8XK3Q5oLq5HH/Yj3w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7YXDacE2Y0E1Ngx/OjyEr/BVpiJ9ZrOZL9Q2ZEseL03tF1JIS
	02X1dgFojXSMlZROld0Tn7B23P6CxilcpoOEX3g2FnnoLgfWJrhcZ/ai91pMBjA2recxD8FEP2v
	S2+TiKgql6jG3j04tl2SFe0pedZxgm8k=
X-Gm-Gg: Acq92OEhHTZzmnvS1UD1uNOgi2/E87YCyx+QxBRq1mYYkkwON7uhqZJfgW9HgV/rpmk
	gYuAmhCUZoi78LA4lujrEBANbNFHGEgmuNLa/vn7cBOV5jJmQwif4hL4jwkreGoOSa3HvSHBqE3
	ycI6o6nrlJro0Q/xqRsOQsgx0C4+R0xtGJ83XRZEdQfki7JcOxporBrlAfDrbrEhWV80vnWGSGI
	xL41G8Fx+vhgZ3AsZc7azVUibFgkmOS9js2G2MRRZXznoMWHsVCP+1iPW0aNcb8mUy1ekKIPZpB
	fC1OKIN2OAQDi/OOJyS+OX7eKsqBoTuWUjq36r9rcztwM5HG1Mr29UeJIz1n3w==
X-Received: by 2002:a05:690c:4902:b0:7a3:7ad3:3e9e with SMTP id
 00721157ae682-7f8c37d34b1mr121804007b3.32.1781574247418; Mon, 15 Jun 2026
 18:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615073856.152479-1-sun.jian.kdev@gmail.com>
 <20260615073856.152479-2-sun.jian.kdev@gmail.com> <ajAAkIv0R3ztfc5g@mail.gmail.com>
In-Reply-To: <ajAAkIv0R3ztfc5g@mail.gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 16 Jun 2026 09:43:57 +0800
X-Gm-Features: AVVi8Cf7im9Wiat3H2R_vuZVWzFKDi57wMkvXVzURWHo32EAr5QTdOPWPc2BPvI
Message-ID: <CABFUUZFKTsaHLSzoMDogSnnzUCikZcb6TzxQ4G640oO4OxmAjA@mail.gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Fix partial copy of non-linear skb test_run output
To: Paul Chaignon <paul.chaignon@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 9:39=E2=80=AFPM Paul Chaignon <paul.chaignon@gmail.=
com> wrote:
>
> On Mon, Jun 15, 2026 at 03:38:55PM +0800, Sun Jian wrote:
> > For non-linear skbs, bpf_test_finish() derives the linear head copy
> > length from copy_size - frag_size. This only matches the skb head lengt=
h
> > when copy_size is the full packet size.
> >
> > When userspace provides a short data_out buffer, copy_size is clamped t=
o
> > that buffer size. If copy_size is smaller than frag_size, the computed
> > length becomes negative and bpf_test_finish() returns -ENOSPC before
> > copying the packet prefix or updating data_size_out.
>
> Thanks for fixing this!
>
> >
> > Compute the linear head length from the skb layout instead, and clamp t=
he
> > head copy length to copy_size. This preserves the expected partial-copy
> > semantics: return -ENOSPC, copy the packet prefix that fits in data_out=
,
> > and report the full packet length through data_size_out.
> >
> > Fixes: 838baa351cee ("bpf: Craft non-linear skbs in BPF_PROG_TEST_RUN")
>
> Wouldn't this bug actually go back to 7855e0db150ad ("bpf: test_run:
> add xdp_shared_info pointer in bpf_test_finish signature") and also
> affect the XDP bpf_prog_test_run_xdp()? If so, could you also add a
> selftest that covers it for XDP?
>
> > Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> > ---
> >  net/bpf/test_run.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
> > index 2bc04feadfab..976e8fa31bc9 100644
> > --- a/net/bpf/test_run.c
> > +++ b/net/bpf/test_run.c
> > @@ -453,19 +453,16 @@ static int bpf_test_finish(const union bpf_attr *=
kattr,
> >       }
> >
> >       if (data_out) {
> > -             int len =3D sinfo ? copy_size - frag_size : copy_size;
> > -
> > -             if (len < 0) {
> > -                     err =3D -ENOSPC;
> > -                     goto out;
> > -             }
> > +             u32 head_len =3D size - frag_size;
> > +             u32 len =3D min(copy_size, head_len);
> >
> >               if (copy_to_user(data_out, data, len))
> >                       goto out;
> >
> >               if (sinfo) {
> > -                     int i, offset =3D len;
> > +                     u32 offset =3D len;
> >                       u32 data_len;
> > +                     int i;
> >
> >                       for (i =3D 0; i < sinfo->nr_frags; i++) {
> >                               skb_frag_t *frag =3D &sinfo->frags[i];
> > --
> > 2.43.0
> >

Hi Paul,

Thanks for taking a look.

Yes, that makes sense. I'll re-check the Fixes tag against
7855e0db150ad and add XDP coverage in v2, since the issue is in the
shared bpf_test_finish() path.

Thanks,
Sun Jian
