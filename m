Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A2A4D8CE
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 03:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771470962; cv=pass; b=pXh84f0JIsuycLA+uyyPQSIsD9ekXQsi9iQTRQjvKCJVJc8mfCIewFi7QwC+grqtP9tVC3ZzDbhkeh29ED+PHdC4fGElMUyrGc0UfOnsRHfG6UdkGqLQQ3SAzBt0Qyt7gIoXRLA4hNrvc4Sde0rrmxS6EVdpsuC1safV8DUA22o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771470962; c=relaxed/simple;
	bh=jlCbJqBO571MidmO2wSH6N7GAv5ijJbh91S/So6TFw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jo3DBTiytQnNDVnjzi4nQb7oQX0HN6ALq9zxW8defk89fzPdCA747h8KwBMTsRMtq9OPKQkNy0Sl88qMvikyau0+Q4HrDRpL00nmEYI5PnPwePwhql47hzOSJpkfGXAPHsJKwO820Iq6Fk2h1huhHgiG7kUrrOJt8/3TzPuWmMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bb/rtfZC; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bb/rtfZC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-480706554beso5294975e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 19:16:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771470959; cv=none;
        d=google.com; s=arc-20240605;
        b=NKgZnk8feU3w/lywBU/dX40D0jDYUSdiTM5H7t/GpNPOZawUp3AAaS3Orz8GAnRLe3
         ieIYe9hLQVofGNyGlteiwJPPmoot9pW65oYmxJA7HMXyrU2O9hOyzqibtoQYfvmum4lu
         +GQQNMeHVUeu8MOu7ED7E34si09KKF4ax1GkX/UahJJxfZf6i52MYfwtFMlgsgdVSXc6
         I/aN1BlqN4OlrvK5jy7W6AOzrD82lp/OugLcAMhvc2tUewW6Arjb/D23Vlipo9mDrJMm
         5YSOMikNWpE4Dta/GJ2SrMvTqFHCpoFOtaaT/h3hM1jXXJk3vI1JSdUKNZK+0UohfGcL
         OVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UntGXKcFzGwNAgtGSqTbh0eSHenwKqwxhDYlBtgE9dA=;
        fh=w7sw1ea2NAJ7Gsys3EJMJMuJP4GOy8S50e3XGR/2Z4Q=;
        b=ZdmPu1nhd6TwBNKZXFylcC/0DEMzajqswsPZBQPo0TWYw5CZX9zf3cuoMeht3ii88I
         6hNZfKwKFavx9EDUoSUhwXPFqjxx6QSZeSUOfgda42gTfJ7Cdo+fiqM6Q9/YeACDyBbG
         iRqmdy9Y1MlncD6nIBg06b4g+mOfS/YKK1nj9GsuFOcfLrBXk4nhrI0WjE7E8GYK13TX
         GLWurZsREpDdgtcuXQg/kzgK7vFjHwnzmpifd4Uieg5213lE2CD4h+Y0doUFK1Ka2cYf
         bDRquCINyhP3df3e26NJ2rQJ4Ieqv6/CYFawQaFmM9EPniWiwXKa+3hsfMc2M2bMsWil
         7z3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771470959; x=1772075759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UntGXKcFzGwNAgtGSqTbh0eSHenwKqwxhDYlBtgE9dA=;
        b=Bb/rtfZCvz/6suRKPp+0hjs+hwtLbbE/o1EpgtBudtTz6GCGGi16OgBvWS6KkATYrV
         MkZO1djTqEXV5d7Yo6vQ0eiq3scuU9Lrec8S2zVR2HCa1oOYgRkrPgGn4KF2hqt6MGxd
         sabOxazVj77+QbD9rfvbdvqJAGrSmPd7jelPRxDV+UhXg3sK9CBOBUGwJ+I5Zwb4JEI4
         qzk6xdGHKZe6CHy6gsaGvAImPJRpwLlGKpluB2NAk/KedajfKW8wrZumzRZS4lb7quKx
         lZX94Gkmuds28U4ejBkRWP2PnxMiyqyEZF+lwOI6neiFY30DJGz46F3PnJG5p1uzVTjX
         3UMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771470959; x=1772075759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UntGXKcFzGwNAgtGSqTbh0eSHenwKqwxhDYlBtgE9dA=;
        b=eAVD1rJcxmwOLxU692eL477dT/ocBIqC/HIpCB7mDwZ5HbWIkPYr0zUFUF3mDel97k
         m9NxIT8+AqIXJyIkyP7j9Juu8WLooMOMhrt6Jd/rGPT4fnZfZ8LCyAPgD9+AbtjOXRnI
         9G4y+sRKZ/j/ZKhguouljxfHhJ4L/cIPaIcEYLLj2OqzcfIrH29O5q3LucBkBs6ZOdyv
         DVowIbwowYNY+E29OYJQ8vFh5Huqva8Yxp7meILx+NHdNmsQbWu8XZSKou9qIiuAGVLW
         LPywTKzd52He7CAUPCDjZsUCMsYMi7J9cV7liu3dSoXgIQlbM0kjYwRrB6tbwLTkpeoM
         QoRA==
X-Forwarded-Encrypted: i=1; AJvYcCXa5TIqoBImmKW44WxdjTqkA2PJ+t/hZgjjKEoimOtTFHM2JpPsLvQX3oTe2slLNiFmmUEDC/tfYnmEbvDj5X0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/DuU7VweBSfyZc2VlN0h3pra/2lG3pKdpO2y5KJBrMFcPQaEy
	vFVvyhTybmsBf8RZPZVcLVisGJY87EXvl4jMqnNapikaBYzV/Xe22wGVqiPQdAE4dao7XE0Mjxa
	dcXO0365Pae66r/bntTKAe0vRnqY3a/c=
X-Gm-Gg: AZuq6aI5wkVItYjyJcRjnIC7EHeSvFhxfT2IP0l8/vFiuG+YX5C7lmt7zZJwN3g7Sy7
	71o/CAXhh3S9wP5g7/bjYZllATvGP44t5SwPwDG6Q1j12Q9czkiSri+2GHEOqxHw2QgWgUrZdak
	s4r60gv9NH6TGnZo/TD4CNPy6ZIxvebGfRm/YpqOVp4HAb8957BXnNZwAlnMqHeyxGphR4xYnKZ
	ACH9uaZ2TtIJi3qvs0lHIDbwKDzn40g64wbJhY6EME+dV3zGsxOzrndTkmbaEX9Denjo+DoOUYv
	c5jLFtDhEl1Xdu9/ceTzUfdw/8+xMg79vgbSo2iGpb6h7ErmaRHOuvLm5o0O1SvsC1OGu7PAq4/
	2YDbRIs3LauOG4cIgeHnYBHHh8Q==
X-Received: by 2002:a5d:5d85:0:b0:430:ff0c:35f9 with SMTP id
 ffacd0b85a97d-4379dba3125mr31163255f8f.48.1771470958805; Wed, 18 Feb 2026
 19:15:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bb4bf5fe648ac71c969c6228ac6e72ea85cbc64b.camel@gmail.com> <20260218104328.14341-1-slava.imameev@crowdstrike.com>
In-Reply-To: <20260218104328.14341-1-slava.imameev@crowdstrike.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 18 Feb 2026 19:15:47 -0800
X-Gm-Features: AaiRm53gWOBDMduyfV7JO2kUd65n6UPNFg_pAv-3-BgblkJrkKoD_kavOi4g3jk
Message-ID: <CAADnVQ+xwC+J1hZcHPEUjBoKcUKmnucG4AFQ-kkDmqx+C-GcoA@mail.gmail.com>
Subject: Re: Re: [PATCH bpf-next v2 0/2] bpf: Add multi-level pointer parameter
To: Slava Imameev <slava.imameev@crowdstrike.com>
Cc: Eduard <eddyz87@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Hao Luo <haoluo@google.com>, Simon Horman <horms@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Jiri Olsa <jolsa@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	DL Linux Open Source Team <linux-open-source@crowdstrike.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Network Development <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 2:44=E2=80=AFAM Slava Imameev
<slava.imameev@crowdstrike.com> wrote:
>
>
> - This programs cannot be compiled as bpf_core_cast cannot cast to a
> multi-level pointer:
>
> SEC("lsm/sb_eat_lsm_opts")
> int BPF_PROG(sb_eat_lsm_opts_1,char *options, void **mnt_opts)
> {
>     void** ppt =3D bpf_core_cast(mnt_opts, void*);
>     bpf_printk("%p\t", *ppt);
>     return 0;
> }

Looks like there is a bug in llvm, since it crashes on the above.
But the following works:

void** ppt =3D bpf_rdonly_cast(mnt_opts, 0);
bpf_printk("%lx\t", *ppt);

Plus Eduard's diff:
-       if (is_void_or_int_ptr(btf, t))
+       if (is_void_or_int_ptr(btf, t) || !btf_type_is_struct_ptr(btf, t))


> - There is a workaround, which requires introducing a wrapper for
> a pointer or typedef:
>
> struct pvoid {
>     void* v;
> };

llvm should have handled it without the workaround. It's a bug
that should be fixed.

> I think there are no technical restrictions for treating single
> level pointers as PTR_TO_MEM.

I think it will be a missed opportunity and a potential foot gun.

We didn't support access to 'char *' initially.
Later relaxed it to mean that it's a valid pointer to a single byte,
but since the code is generic it also became the case
that 'char *' is allowed in kfunc and the verifier checks
that one valid byte is there.
That was a bad footgun, since we saw several cases of broken
kfunc implementations that assume that 'char *' means a string.

There are only two lsm hooks that pass 'struct foo **'.
If we make it ptr_to_mem of 8 bytes we lose the ability to do
something smarter in the future.
I think we better add support to annotate such '**' as an actual
array with given size and track types completely, so
'struct foo * var[N]' will become array_to_ptr_to_btf_id.
That's probably more work that you signed up to do,
so I suggest treating 'void **' as a scalar as Eduard suggested.
This particular sb_eat_lsm_opts() hook
doesn't have a useful type behind it anyway.
I'm less certain about 'char **'. If we make it scalar too
it will be harder to make it a pointer to nul terminated string later.

So I would do 'void **' -> scalar for now only.
