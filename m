Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7402FFFA5
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 18:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787682785; cv=pass; b=I7P1xBGMs/hnWmGg2osslSbpVV9Gfi9oyAYRRs/GDq8oM3MbDjzcCysE75vU8XeBTg7qMrdERkf3VA46YRQ9viHpDgilU4y9/p8MoHwrD2J+ddC4Fuv1+LF8hvOmokVFZX2N0z4EiAQQ4xRlRtWhZa1khFO1KBv6DtutRv2U67Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787682785; c=relaxed/simple;
	bh=BzvGvYFHF2gDiOAcujcG50Fchm0/e02uzIwUpAozZV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qGR2Vq1JjXohl3ltOYYWokEM3KeRFbdiabceZIPR8Ji9TCfPpXEHMGAs42JKvXL9ZnahGFZVRK5KKTZuoM9GjoPQINdZ46UMVS7268z/XcsLrTJgx1B8CnEFc+wJJOSg12oghMhQkweqdE36+uGd+5ilzTgyD4KepScM0UL/uwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kc0TB1lg; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kc0TB1lg"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84874b52eabso214224b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 11:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787682783; cv=none;
        d=google.com; s=arc-20260327;
        b=lkVYMTaPAJxMTbbQKWBxjP0N0WNx4g4S/fn+HxapjxCcvTEiB8018BnU0LBk+E+NRD
         hyL5EjfkWYS+hFXovD7Ck/GtB03VOyHyQeSXcuqd45SfCVXSRxNARxdHvuhWDxZ/YbSh
         YYp+SENuJg0wnW7wVuDeS37D4fFaXDpEM/mc5gPpyMsHVrBWjDNo6idS3MwSLiskcRfE
         GbVS+g+T48XwMJQLCX8hDnJ06R2nZlnx1tvuFv3l66NVWVdq/xjRjmAA18QdQyVd9ISF
         onY0d5mUODiWvTQfA8KCGx1uWJJZs5fPq0wILjM1pvCwCNdR3aM/PPRHm5UFg2kgFMZy
         +feQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U6X+wOKWsKad1gqxJ1QjKCWBvjKFCEAagO8RCFSuQlU=;
        fh=p1NeWYIeg7x66k27CGbZj7iyuYy47REshMvjDeY1L1M=;
        b=hLqLaj7hj1WIBlF6YjSG9tTrxZGoG48wqtTasUb1BheSCjdtTd3ttn0rEHAW3R1feZ
         Lof1/kyqgCjaY5/IkJ4tP//ZS2hiWFtJI9yBNY/wX/GbtGQjOu6kyO2O+QN2v8oavyXW
         dNplVzfHyWk0dO+2ovk8sIa52wzPBW+EQzhhHphx+jHEdPXYNddnmBpzf28Nus16yOxn
         CwNNyCXzHPEZQNZWg7scZOvMM4QDQ/t3B2icQo/sLMi7Xabz4bTxgfROHt0d6e4inuX+
         N/dkNsUFnInrAwglfI8bXtieEz9p34Jhd4zCJCTB0XMVdt/U9AGnb+1C7DYMe/etYh+F
         HBww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787682783; x=1788287583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U6X+wOKWsKad1gqxJ1QjKCWBvjKFCEAagO8RCFSuQlU=;
        b=kc0TB1lgXGm/w7nH7/VGc2qUokQQYQF2Ao0OwEYdzQtjFIvcx5E2KY2ADJGzkICy3F
         +S9ldk8c4vDaBaZz+I7YbOJ5hlJm9SnT8rjt6Wt2UGiruf1ID03F75gZJo8PbM514Z+g
         GxxRaaYj+jrkP8ftfBSq6Mxo2BayfC5VyWW5mcUrqaKalFmM8t2lz57w/74KFzCtJ43g
         7RIkhiHdlYbjLD1pkCz9MFWwCepcNQUm9uJFZflrNa+tjo+PabNHTi6YEJOt/QX9qIK7
         r/kOC9XmZCK7vmzZgfJU1lCn1lH3i+2EqjHSDdNCMWcujn9UCsXVBN+dWtDka4TMopzm
         T68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787682783; x=1788287583;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6X+wOKWsKad1gqxJ1QjKCWBvjKFCEAagO8RCFSuQlU=;
        b=Wi6k9yZZ4usarQ+OIiBrbsFMsGIFuCKaWUB0XPxxp/YgOfisNHbph6OoABsXuWPjgE
         do48Sqm4weSViqM9pgqPQ+xKC0hqm1EaEZ+uYO46sDxQ1jWB1iwo6ssssyubvMgXsCac
         kTEh673311QiernSfEAQMXOE2B+vRGl1dtg6I/jqZLBMrs8pdf6ebpGdhi03BIXAhlju
         uZoavPHi/GINgOA1LbOmcghWwD+3JVLURF3m2rhT7yqORgLmQuhHEF8RV8Utc68FZN/q
         3lI8ixmnqk2GcCUIm6zpiQ4OLcxSc6/hz/q8mQJiUbtXS+5bwEHjvFuaVQSiJDyTrRtn
         c3zA==
X-Forwarded-Encrypted: i=1; AHgh+RpDH9uQYjESu2ivgq+sqtqKRaPmwXbH8duknxOdADCPtrSoYyVpB92u8jdPe5MHbBns4u/IsQqP6wuG9UWy98k=@vger.kernel.org
X-Gm-Message-State: AFuF++mPPPMYksZhngl2Mec4KPyggkPouLQfLRRktcNYsRxkpQUeylvr
	m0Z7ASfTBYN+xFjcUUfhPtH40GbjRfLJY4gA8WtC4b6TMF8niqr0JP+Kpo2/SkODIpeaQ99V0FV
	lEn9PVljiVsWNTrYo6vAc629EcFJKyG0=
X-Gm-Gg: AR+sD13sUzEjCXbiKVbpA+IMq4m5Ex8MiequX+YL24sPfb1OZeqlCcto4oeOijgICf0
	F+HSUITPIsOz5CrNJf52prvQ2Q6CS+yAMLbaZ4G8aDHjheK4uQLur/ODwZrugDeGySato8zuyMv
	dOfRJ8R9cbkPhUA9vjgxVcRBRrPM3gIAndUCP5PVVs7m/Tc2NRKnPfy3cMT+Nn4yFy0sd1HQE0b
	Hrqz4d8ieI8Xp2XiETSQ7BuNPSKahIcwJtV0ZNT51sppSGUYhY3VbwU+QR3I75xdp8CzCZG2RUz
	mRcteV6u37Lefv1es3pdEvZojYcNVrzNLGnp0goWOSYZCAphpQGhWd3QzvBEMxTLTiNRaWGMQSU
	mocO8vcCsxxIbNDOSopwv0tTGbj820uxHegS5QA1QNQ==
X-Received: by 2002:a05:6a21:9d84:b0:3c3:89ce:b5bc with SMTP id
 adf61e73a8af0-3cf8444739fmr805336637.15.1787682783471; Tue, 25 Aug 2026
 11:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824092847.361683-1-jiayuan.chen@linux.dev>
 <ao2fomkGLiwm032U@krava> <016aecc5-b3dc-4d8d-be1b-67b9b4b0a24e@linux.dev>
In-Reply-To: <016aecc5-b3dc-4d8d-be1b-67b9b4b0a24e@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 25 Aug 2026 11:32:47 -0700
X-Gm-Features: AcwNN1XzrEX31Kq1PCqp0g3FwZ2l4Ra6iyzrVp0JYXpTQimO3bDUGx_bFc5akcM
Message-ID: <CAEf4BzY=MsQ4SwLnhKUUBtH8jnuf1VZWYcfwPe-VAzEnu7Ezdg@mail.gmail.com>
Subject: Re: [PATCH bpf 1/2] libbpf: Fix usdt attach failure when nop10
 crosses page boundary
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Jiri Olsa <olsajiri@gmail.com>, bpf@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Jakub Sitnicki <jakub@cloudflare.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Jiawei Zhao <phoenix500526@163.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 7:29=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
>
> On 8/25/26 9:58 PM, Jiri Olsa wrote:
> > On Mon, Aug 24, 2026 at 05:28:36PM +0800, Jiayuan Chen wrote:
> >> The kernel refuses to attach to a nop10 that crosses a page boundary,
> >> since it can't be atomically rewritten:
> >>
> >>      /* can_optimize(), arch/x86/kernel/uprobes.c */
> >>      /* We can't do cross page atomic writes yet. */
> >>      return PAGE_SIZE - (vaddr & ~PAGE_MASK) >=3D OPT_INSN_SIZE;
> >>
> >> Whether the nop10 crosses a page is purely up to the binary layout, so
> >> this does happen in practice. libbpf doesn't check for it and blindly
> >> shifts the uprobe onto the nop10, and the attach then fails with
> >> -ENOTSUPP. Just keep the uprobe on the preceding 1-byte nop in that
> >> case, it works everywhere as a regular int3 uprobe.
> >>
> >> Fixes: 41a5c7df4466 ("libbpf: Add support to detect nop,nop5 instructi=
ons combo for usdt probe")
> >> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> >> ---
> >>   tools/lib/bpf/usdt.c | 23 +++++++++++++++++++++--
> >>   1 file changed, 21 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/tools/lib/bpf/usdt.c b/tools/lib/bpf/usdt.c
> >> index 2e56e3ab5b6c..c266ac93cbdd 100644
> >> --- a/tools/lib/bpf/usdt.c
> >> +++ b/tools/lib/bpf/usdt.c
> >> @@ -614,11 +614,28 @@ static bool has_nop_combo(int fd, long off)
> >>              return false;
> >>      return memcmp(buf, nop_combo, 11) =3D=3D 0;
> >>   }
> >> +
> >> +/*
> >> + * The kernel refuses to attach to a nop10 that crosses a page bounda=
ry,
> >> + * as it can't be atomically rewritten. Page offset of the probe is t=
he
> >> + * same in the file and in any mapping, so this can be checked static=
ally.
> >> + */
> >> +static bool nop10_within_page(long off)
> >> +{
> >> +    long page_sz =3D getpagesize();
> >> +
> >> +    return off % page_sz + 10 <=3D page_sz;
> > could this be another check in has_nop_combo ? so we do not
> > need to introduce another stub

I'd go a step further and collapse three checks, including
man->has_uprobe_syscall, into a single "can we do uprobe nop
optimization" function?

> >
> > otherwise lgtm, thanks
> >
> > jirka
> >
> Thanks Jirka
>
> Sound reasonable, I will do it.
>
