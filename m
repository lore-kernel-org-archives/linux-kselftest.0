Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFBA34D917
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 20:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771618289; cv=pass; b=n01uhp/gwdQQanMTvsasF+bPqMSiRBh1ifOQrD3ptAv7leaMHOclI6/hosSRmtivGsdEcSWSBgXEPAd+WQG+N8Ex7GmaxDTN1FZvUSmfinPsG70W+06If6pVHzaWJR6RT7x7InZYKBC7EkmTMq9BV1j34UZidruKsHjyJ/F15Fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771618289; c=relaxed/simple;
	bh=8JIRve8c15z5WReqA76soUL+Zt57OlSrG42LMMnF8oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vrt6vh+MWzb3D77a7HjsLksotU/1cTQu/UCvIAgfGCaCo1UrlpLpnhOxayECFkDJe30358iiN/Jf1b/BFxpyYADYzN2iZ3tbzXt3Yy8p5aQ5x6FJwdwXCdxxT0Na+M/Pej0HpoO40zVNHwo3Cjag4jzhrkwNLgsqOt5JxzicU+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8mkqqus; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8mkqqus"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8f8d80faebso486394266b.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 12:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771618287; cv=none;
        d=google.com; s=arc-20240605;
        b=A6QsdUOe0nOQ/V9foINMqiD0gtn89h6v7plFLFm7WwqhtSF9rCdhjuIDrMsjnW6RWs
         ppAIkmWyH5Gl4QIMc/V5zgJcX+RHOLb2v9vwIZzSmxai5EZ/dtslGy5GDOHhHM737Li7
         fTLRZXEdKvGTxi8bRaSfnI9PY6r1t/Z00QpX+2gA3szbynEB6tqsGnGzmM+4CiKnGYzJ
         W5dHY0mC5/DYzMjDAFyc7Yg6CJgCPW9xbdvgLHp/R4OyUOebNdd4rwpaHTWTMFiqjXdU
         CdDdzf9G5K8jaK6dAjNyYpZEzNEOarelq6q50heZeeQXIR8k0Ye7qfgEXyVfFIYT+sLp
         qsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8JIRve8c15z5WReqA76soUL+Zt57OlSrG42LMMnF8oo=;
        fh=l59r0nvDsPKzw6wKjTc5S/T9oN5ydphfjLOG2jEFdIs=;
        b=knE3xojcMIT8rgRAizA2xaUKRZmKYnIKBbOu2f9f3o5qE9klruXW9Q3mMhgUtKQLvj
         HHOvVvY/zseiHCutQdN3ycoXnm2XjlearguguzUHNPA0EOJqNE0iVInaIsOQa+lTu9NN
         TA9bAlgvWqXakb7yYSVPXNWfWLqJS5UEdLw/cgtOmANBZa1DekNE3TK1Agjv6CHuSDOz
         +W+wgVzs2mNtlWnOvq9V3s360toIU8J0lOGqhljkhxKGHooYtINtuB6O7Ycf4jHC/wsP
         zvIl1k+T3YI+CESwA90OIEFoUTO8y9uzOCbeM8CY2QKe1fcZzCSWldofn6YqN9Rc2gJp
         ihjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771618287; x=1772223087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JIRve8c15z5WReqA76soUL+Zt57OlSrG42LMMnF8oo=;
        b=f8mkqqusXyvhQHYJaW28XHtVosjcC4aCNi5gxBqXFpMFduCOtx9B4ESK58h4qjyURX
         qbdSwrNMJo1V38YR0AweM7yRTBdzEmfCrRbB6+uJNSAOAYLWRVr0QPhSIfPCYZMZGJD2
         HXOQ47u/T3UIOdn1rCIQ7gP0+OSV/ZwCtJqC0oUxradIsOcPcqFsQZRATEPAbyLstIaf
         0UVCLltkLCpFNLjhei+C/BzUpWD2X9/A0yVzKWHIFS6RPERFDv/ZC7h6+OrSsf006ydK
         Y9liG18m7K0QpNMGP3FJ3+3h+2cSaIToBz78h3p4z6Hp6bqTxisdE1uSEXqS+/TddAEp
         ymyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771618287; x=1772223087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8JIRve8c15z5WReqA76soUL+Zt57OlSrG42LMMnF8oo=;
        b=fAVIGb+JjuGKFu2oaBXklX9biedd/rf3veWwCGMPzcsLB8lkIOyfnlPfNeKqyrrmny
         4jFdIRATfPu6U7ytWwoBSOfpQaztlgNotsOsa0lGoNnlHWNj14Q2lbFExl/YC7xw+l3A
         O7UJyCYRtYKPU5oxI7fUw1t9RlVOWdOO2UxPwl2Cd5KEpMpzIkcZJVfz0MfZvoRv6aNA
         fFmrIe0q6Q37eAKqPOyWlGMBaN1lsJyRVT5Z8spgl8vnHbSnu+XXXT4Lunftqqa8kbL0
         FDxS2i57lpYa60gpiE9cv18+1+q4ZCwKg7HRbPlJy9d3SWFuE3ZRRCRG9W92LcgSbnrJ
         3Dww==
X-Forwarded-Encrypted: i=1; AJvYcCXqgrvkNwdEKzVHd+DXJaR3kQ82qDT9sixQXpDQ0Idlh1AgH80YYtYoFn4bOOpjQ/bbP3uZwL6JvTGPfLwU2Iw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzuG9SY5t23mta8WE/qSVGXS3vAdh+VSQ02lh9wu6u6/hm1Jc9
	Rrr6GOBl9AOTZnNhUOgxS1fNuYvRGnrv4cAsxDE6UeWo63Pdldv7EzpEcPspugqM5hiqKVNJSXb
	CS3mApWxmnPTYjHo1UZdsqAFckxcXmN0=
X-Gm-Gg: AZuq6aKYqJTXxWd2PUhyGzG8ku+oR2bARbW8k2HTfUcQ7cxmEabmHTAcf4bSM2goDPQ
	AY8wiGdXYB6e3inXZL9DGGsKP1ct8CAXPm4UrdBUkX3RTT66Pk0qBFX+jB8r9OFQvO6gXdAB4g1
	xb8zfXoa/cxdClm+OU1iFrjoTQt7OoG/eWc1s4xAm8jjF6e1JMPiZb3RLraHkGp94bumuVrZsvy
	Y84bgmZj+GLeOhhuxzs14goJa8QVw/qIJJWXqHXuSNZAez6OH+VpaAUUYlKe84hEj13abDab/GO
	uPEpcZL/NHz5e3ZgZ5aenHqWXVQKnooBZfvAnZXwiQ==
X-Received: by 2002:a17:907:1b25:b0:b3a:8070:e269 with SMTP id
 a640c23a62f3a-b9081089466mr60024866b.14.1771618286359; Fri, 20 Feb 2026
 12:11:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-3-tjmercier@google.com>
 <aZh-orwoaeAh52Bf@slm.duckdns.org> <CAOQ4uxjgXa1q-8-ajSBwza-Tkv91tFP-_wWzCQPW+PwJMehEWA@mail.gmail.com>
 <aZi6_K-pSRwAe7F5@slm.duckdns.org>
In-Reply-To: <aZi6_K-pSRwAe7F5@slm.duckdns.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Feb 2026 22:11:15 +0200
X-Gm-Features: AaiRm51G-BEIzt0SxbA22TK8LiihbDavtfXN5tpD9EpODADyVmlHbWbL_HHf7gc
Message-ID: <CAOQ4uxjZZSRBwZ2ZL31juAUu0-sAUnPrJWvQuJ2NDaWZMeq0Fg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] kernfs: Send IN_DELETE_SELF and IN_IGNORED
To: Tejun Heo <tj@kernel.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, gregkh@linuxfoundation.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org, jack@suse.cz, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 8:50=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Fri, Feb 20, 2026 at 07:15:56PM +0200, Amir Goldstein wrote:
> ...
> > > Adding a comment with the above content would probably be useful. It =
also
> > > might be worthwhile to note that fanotify recursive monitoring wouldn=
't work
> > > reliably as cgroups can go away while inodes are not attached.
> >
> > Sigh.. it's a shame to grow more weird semantics.
>
> Yeah, I mean, kernfs *is* weird.
>
> > But I take this back to the POV of "remote" vs. "local" vfs notificatio=
ns.
> > the IN_DELETE_SELF events added by this change are actually
> > "local" vfs notifications.
> >
> > If we would want to support monitoring cgroups fs super block
> > for all added/removed cgroups with fanotify, we would be able
> > to implement this as "remote" notifications and in this case, adding
> > explicit fsnotify() calls could make sense.
>
> Yeah, that can be useful. For cgroupfs, there would probably need to be a
> way to scope it so that it can be used on delegation boundaries too (whic=
h
> we can require to coincide with cgroup NS boundaries).

I have no idea what the above means.
I could ask Gemini or you and I prefer the latter ;)
What are delegation boundaries and NFS boundaries in this context?

> Would it be possible to make FAN_MNT_ATTACH work for that?
>

FAN_MNT_ATTACH is an event generated on a mntns object.
If "cgroup NS boundaries" is referring to a mntns object and if
this object is available in the context of cgroup create/destroy
then it should be possible.

But FAN_MNT_ATTACH reports a mountid. Is there a mountid
to report on cgroup create? Probably not?

Thanks,
Amir.
