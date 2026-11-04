Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793754949;
	b=A5K6WyqKnp4cvEFltNzQE7okzclAJWvcu8V2JoXVmpdw/CkbyoL0wnAlzI+BjdsUqfMi
	 p9cgxT591jqzLhXd1spTB+gBPOAkkdAooSoW0aDNOJ/iiDlNzSSePvKGEhwGOv0O6ej8l
	 EFu/G/BiUrQf6kOF1iDcI/sUajX+VYO/kGEctHGGTQ+P/1yKuwlQXv0DdeQ+K64b+7xt3
	 h3cQwAAqkb6AlheYtzFglLZrmnoO3blGX+HCVzWCdTeXIQDYIRDeqtlF/k4dyEp/ERBiq
	 uuBBDwXnBfayeC/aQgZAqym4AsvL3u9ADgReBuEEvNKFHurCJh0xifpYjWZur7jiEbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OHfpgenBkiZZTG6G9AXsdWAKG/dzpqqNAWD+meV026A=;
	b=KxvlMMbwfPlQY6QYvHL8hvMFEShFBMGMBFJXhB1UUPZynSrmXR7ZG/E5tLUDzYAxIPg8
	 QtNJI58oN8fe9rHnLlJNsMnmuJvH5/aTaGpeYo/ROC8CLN6PFoean8QYmzhTYXknPcuJG
	 VexYOdM3W6mAgOV6GuojRj6BpTuf1MxiV32NGITLk3YBQnLzw2Cd+XLF4xuQuQ6ZDhjae
	 DWnrZ9jkQH5WulPgtxAWeGEf+jvo7LZmitxLLMMXC4cfeAgyi2uMaY5t5WMyW7SM7cKKj
	 JCB7ARCn5BtQZD6iz/TNRMX/mak5nJmMG5GYrqh5+tvqli9xHH4XLWdWPnBQcj2ZiXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dM0VcLD5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB404606A31B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 01:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB404606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dM0VcLD5
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533202fe429so130201cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 17:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793754947; cv=none;
        d=google.com; s=arc-20260327;
        b=XQMxDLO9QtFPiCQQWlZvJJKM2P8oy+IfWoGWKjsa01GDqmrr2XgsowvzQcLHq//lmZ
         jEgX+NO+tiJY0DCe1EdyYRpf9R2dfB9dQdwQ1ua0R+H+a3efYrRqen0AmhnzxtMty7Ks
         VqCWNz13VRA46hE8wyUpkhPZd+/HhsaHvQkBVzA2wcK9wCu3l+3PcHIvTTJ9kCmewxoN
         fr217e1JmJLkpQnWBZeBh4G+IRdoax9oOHsSo+/3E8jDChfCV1rx2dzad7hYEC7cLDR1
         nx7VyLGTZAfCKy2RENFQWST0XDQ+IIuozb4Q+78WTYXqi0nW/rLglLzZUL7IVdyvnG71
         Y7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OHfpgenBkiZZTG6G9AXsdWAKG/dzpqqNAWD+meV026A=;
        fh=hhU5SDD6iuE+WbLP8tPVdD2Gbnzs83E+/jNPQjIur4o=;
        b=WbbQ3i82PeJF7iXEMBQIuNQNaLlQp/N6ruTGirMVlVrqq7Xx+NeM2V2iCSnswi13E2
         FO0Jt4y9wWOsxvIWpW41UNA3A3WA+V3x6tX/NmMnVZHYrpyOYG7ZIz6gVEDYAe6M8hRI
         ER0EEgKVLPAzNqye5Muw7ZUwjH5FWOF2ICB9SZvPyocUMj9+fE9l4wV6IlSVjjaFKcLP
         jlXZ3xjUCIjNyJhyA61RkL0uNdohOUgGuofEt47QPOYfNh6pXoVZ8U1p+SGlL+CP8bjm
         Z5SS9iU3tmT8gw9BiS8ikPx6ZCTRMwCjFrW1kw0hZCUomlZN7o339P93WiMBuZmRs/D9
         +0HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793754947; x=1794359747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OHfpgenBkiZZTG6G9AXsdWAKG/dzpqqNAWD+meV026A=;
        b=dM0VcLD5LCF6OrgJqurK2VuKhTi8tFF57uQLRloZ+ioJcnUZ6QVTHxDiGcwTHFeJcI
         7JJ5CG/tUnJ2z1/0wjUsIHQulYOurds6vyUUmbIAcYQTXMlPH2H5LxUy7MpCBhoC0WcG
         JKmsrBO/da+VzK8UUdEaDzlec4c26uUngF6ZrFhC0Z9ESKi6M9XenMLt8Y2eFs5dN+SM
         FZKu9BSsfA5KX6/T6wXLt1G8MC25FhEW/itgB5xrTKxFxBEtFNO3PPx0U0jToavay2J3
         eXitUVQ2uE9EUi97ltRboEKrrqwPbcrglCYzRi736lRpVPwHp2+XAWqjsGW00rfdRFSJ
         Rd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754947; x=1794359747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHfpgenBkiZZTG6G9AXsdWAKG/dzpqqNAWD+meV026A=;
        b=eMskFcn1zp2mhWTQqPKaMt6RYIvDJGBHvxXDJgqpYTIBPiRZ2wgpa1UO/ScEFxVB3r
         LR9dqZ5hGHqoQv4cNkt8Fh4TKgtJszRIPPU0Pe7fvKmzTuaqMw8lEKyDDxmrQPY2pDqO
         bJakR7TBTtcxnJJZ0AXm5DcpONgxm4G8p8OXtDTzN3jh6s1uJH5NdIMJFR4tcvhCP5MY
         yHETvYeyWEMIS6A8Ii+X+R1S6648ldhzZHWQNxOChZ6ivUdGfRkbb8x5K/917+8YjaQ0
         ot4Xd2paexBsb6ay0pkGJwAKOYI7IBX9VkpCf5y+BqP8ARYqDda8RSltWCHTjyHQ1QCu
         HbTQ==
X-Forwarded-Encrypted: i=1; AKwUvByR/wfmLFB5LHrixdj5+CnNzFyTz1tqLLzLwyNmrj7p8pLlQFW54SC0UbwR+5NeWSt9gCkLOurAWp/z00zSsYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V1fxKl3swtJrnSzxclkL1tlIqjWRflDWbQ2gS0/1gcVVrrv2b
	xREkkn2+R4NhwQQHJtt01Tt5eDollP2XI7cEOGL8i0A34XfYt+TdcYZTdye6v68Se5og2+SmUr1
	npr0xAGk6hivcpELYUqyoIt+7iv9Y1t6yTr661SlaP1TPXUSTD3Y2Ihzq
X-Gm-Gg: AYBFou2W8MCg6R53jcjs+bCwCqGre8NXTF9unwWGxZd7NVCHcWq2NOF8J8o1evouati
	W5o3iX2j4PRZp5sZAPQsSeA5dmfx6DNhpxgX1PtPx4o4uhlGsA3++X/MJaA87Lkk+x2Lmu8Wrh4
	iYFvrLyQXAAC+d9hwNGuk07gZVWLm8cWsofIb0jtUWsu3lC6cTJ+cQs5c0xY1X+jOfqsAxAckco
	EovVsnbPRCfogvAjXWyAp7QubeaQ4G31OeisHTqkUU9w3fA12WWVlFrNJJSkicz+dnDTn7Kg5DK
	RHUioPB3OB/nz5g0GYk/TYPn4xxMmqK75sa4VBEYWSm3lcLbY1M7oOVbmQ86MFtzgWHc8S7ajU0
	VPbTvlNjuYqnJPXruPCr9LKPRoCV9diEvoLY=
X-Received: by 2002:a05:622a:250e:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-54b5a3083a5mr1086781cf.0.1793754946755; Tue, 03 Nov 2026
 17:15:46 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103155454.534649-1-sashal@kernel.org> <d3c8baa0-3ed9-4f3c-805d-86c98a6bdfe7@linux.dev>
In-Reply-To: <d3c8baa0-3ed9-4f3c-805d-86c98a6bdfe7@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 3 Nov 2026 17:15:35 -0800
X-Gm-Features: AclHuK9K5AyCjIDUUWGXTgKHl6lHpNmZBhcxz9wcjVeAYMDz_SXNrtQhBbk_zso
Message-ID: <CAJuCfpHZEgGwogySAbUOWxb152sDhMrbRO3gMteCRt0VGLc+aA@mail.gmail.com>
Subject: Re: [PATCH] kselftest: alloc_tag: use the ll64 types on powerpc64
To: Hao Ge <hao.ge@linux.dev>
Cc: Sasha Levin <sashal@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 5:09=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
>
>
> On 2026/11/3 23:54, Sasha Levin wrote:
> > On powerpc64 __u64 is an unsigned long unless __SANE_USERSPACE_TYPES__
> > is defined, so printing and scanning the __u64 fields with %llu warns:
> >
> >   allocinfo_ioctl_test.c:93:73: warning: format '%llu' expects argument=
 of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'lo=
ng unsigned int'} [-Wformat=3D]
> >
> > Define __SANE_USERSPACE_TYPES__, as other selftests do.
> >
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
>
> Acked-by: Hao Ge <hao.ge@linux.dev>

Acked-by: Suren Baghdasaryan <surenb@google.com>

>
> > ---
> > KernelCI's powerpc kselftest builds show this. The define makes the sam=
e
> > change on alpha and mips64 and none on the other architectures; the
> > x86_64 and 32-bit builds don't change.
> >
> >  tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b=
/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > index 74fd64b2370cc..18c761fecfde0 100644
> > --- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > @@ -1,4 +1,5 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> > +#define __SANE_USERSPACE_TYPES__
> >
> >  /* kselftest for allocinfo ioctl
> >   * allocinfo ioctl retrieves allocinfo data through ioctl
