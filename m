Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DEC175A93
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 02:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772418275; cv=pass; b=bYUJXeGqCbBrnl4fAy2lhJKg4F3JHpsDFWmHEN0xt4RkOlaRfKQZZqIlxWoIqeXwuHcAftyQVp177m0i0z1l73ZU9F0f2nDs1MhETaTVOCrmAtk6U7imWE579DzTMuFMd0CbYmdEv4PZwTglJD9A2wTHb6GOck/fHO9YaOF5Q6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772418275; c=relaxed/simple;
	bh=ls8YzzMu1lHwNDYBzxCJe6T3xmrSKYajel3OZEGjWFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCYR1KXTs24MR4MdJ3+Yse6q0WNXCMEv2qiDQlsNjXr8JEKo6wcQqCVG3iFqz147pwiTMK+1nqrO+zT+L3Vo/WqRIMLpuT90nYRHwHGSr/l0FOM9gWIY3wKcRp/YszYaKBu4IYb4422/4aGgL4JFnsH0lQ1ilD2riN+xc9mOfgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jy2CUt85; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jy2CUt85"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79885f4a900so17345387b3.2
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Mar 2026 18:24:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772418273; cv=none;
        d=google.com; s=arc-20240605;
        b=IDMJ0/5BnKCWV/b2M2DMGf34yt3YzoAi/vhKHZ04j4SdAA6UonYVJnxzb7Zc3uYil1
         AL88pO3tVT6Go0vBRgvmCcnDgyzADlD27uZs+6WyGfc/AfJd8+bm8ZoD3SC6MybO7bZL
         hkt+YFNJWfdjRVmvHBLLlE8Ujh02LOV5t82vZBXSzYLkmz3r5i5mWjv6EEvaVQ/Memr8
         yNBw05pu15EOrHlh00ZsJRT2QRICXgdMF03lVAVsbvR0jZRmNhLqes0zfoHxBjlE3VlE
         /SSZwAbM6DgPXpoECkyKbt/ge74P+wTWgRGAmO5xoV73ViJ1FQcxwQpITn7zzHoeUD0+
         z/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8/vdi2EDA5fJbaHQWlNFjBt8eNCftyyrrEKFU+E/z7M=;
        fh=L9nNcU0iRfuafpDeKl2IqecpLhpgfZqdwE/EXSmCQWA=;
        b=HPl4itpKeBI4vLgpT+GZn0lYG8Q8dgxaDLHdokrGCIqSWasXAVwgl5MNt/EyHbZYzC
         +o3BPFTdd0ownNGn8sY5r/L5kgKsGXk9TYMdgUzTHRVk3W3gBgZyWUnnhU0elO891/6S
         cl0TjslPI+Avk1DcEfBoQ3rky5Y58MEJFBDR1rB9a51c/1vsmCAc15d1ylRUU7+1/u2c
         8ZquYgfmXbVQb3yHL0r2G1kuAitAoIuJzFU45x4zKJ/KPeyLxGWEXsx8mrnoeLng6D6a
         Sm20XUQb0sPUm8qYIeKNUF/0gsBVB8W1m6fYi+oNloUuREAf0GvP8rp0EBYnQrv/zFvo
         8mrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772418273; x=1773023073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/vdi2EDA5fJbaHQWlNFjBt8eNCftyyrrEKFU+E/z7M=;
        b=jy2CUt85GwGiwXSP+xbbU9XwZ7lgfKJg684N+ahaVS6pOZsNF0zQhZARbwUaDNELY3
         b4wGjwBqjBtsFMzKjOGTIWt4EFJtAW2ROUypAma2Ox+yJ/ZCFzJsg7cUrx18FLYDGPPW
         Mx6I9N/pD6XzMDk/9MuccpXutQTP1StlKwos54lJfQ8eVV36agEQbdRKDrzMPacljASf
         IASTXMSh62IvpnOBRwr4X/kga89Bvtg5oT4UBRU2AlLKutTbbmXlF7Y8RTcOEYW/ptGF
         dadhfbs2F36qkpKZwaZ7Y8eRL2KgsrGPe8t7DQIcKI1ZIK5Y8SwIY87cNm+VpdxrCFmM
         Gq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772418273; x=1773023073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8/vdi2EDA5fJbaHQWlNFjBt8eNCftyyrrEKFU+E/z7M=;
        b=TJ/ngq0xpXCZh/2Ck84jq63QK9Ll2UdMHt+fxMf73sCqJYUm0j0MqwLcQ0GHydjw/J
         rfmA8Fsj1H+LVb3jQe1k4Hgp4IQ3F4SU9WL/pXk2dq6/hVup0UCHDDg1UzYvLoks+1E4
         xIRnNODDemF44SdF0k1H/uUxPs7O6r/Ce0oTvAlz8OS4MpVkucF6si4yjpm6KXpkVeKU
         /WDUXwSTzYy1hG3GFhVy1vTEycLqS6br1CuOH6msFPDHe358pa5F2evzJnsfuimqrvO4
         ekIc3GzAphy3zcNMHBKp8Ll960tXBH5MVutWx4yj7aBs3kuqE0dVkJtXGMXnhGVw/sv3
         KCow==
X-Forwarded-Encrypted: i=1; AJvYcCWBJF27+uDQEUXgI/EcjBUQ4EFQHFiUeFhZVppm03K+bSWMfjU7yk0JKkSk6hOaxANWbeyLRRMj8cqIXhHAJPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFPkZu752OGoL7YI7zxZuL+aZabJ32xc6ossDVnwfP2r/UNAGk
	WXLvlPwLtfz5b9I2BEdps2A3Gi281jvehzsZsTCEFQ8Vs5XFxG6AE5J99ZWuzBimcrLp6Tu8f2z
	jkMTayKygjPBCO4aav/0OaxQc236Kph4=
X-Gm-Gg: ATEYQzwFSFWTz1ydrbyjyK64FGNIjW3l3Zs6nTdK3kZIQV99dIVah4B/b+EkUgztasH
	oxLDh6Ct8Odf0on31hY4eIuvYLODIjAtM3J0Y8pawjXlfIwxU0sB6BJKulZJSOUsfzq4LrpAwxL
	BNsksvSG6cPZ26wqPgA+m57dGlYBJ4+zYvRGwzsaZGSUvbdYY24H5i8rcFWltcwRFpBtD4hj7Q4
	WTYRr0ECc3KjETmkroTuL+MRreP7y1USR0q5fjY8oSaszGGgDKaejbiB4EsGg7WfsW8tJkxXwt7
	GTIzlVwn
X-Received: by 2002:a05:690c:305:b0:796:6784:82cb with SMTP id
 00721157ae682-798854480a1mr104027267b3.2.1772418272925; Sun, 01 Mar 2026
 18:24:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227164037.84110-1-sun.jian.kdev@gmail.com>
 <20260227164037.84110-3-sun.jian.kdev@gmail.com> <DGRPNT4T4EJP.1USTJ2K0RETA3@etsalapatis.com>
In-Reply-To: <DGRPNT4T4EJP.1USTJ2K0RETA3@etsalapatis.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Mon, 2 Mar 2026 10:24:21 +0800
X-Gm-Features: AaiRm50bWAoScEl0963OCyaEyX-J4DWdqalf5QfF57SFt0awxx-tVDZNfgpAyFw
Message-ID: <CABFUUZGOxqO1ev=e8EdtsZxB=rnjHGgu=YoHXG-nq0XvoqX6mA@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests/bpf: bpf_cookie: make perf_event subtest
 trigger reliably
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 3:59=E2=80=AFAM Emil Tsalapatis <emil@etsalapatis.co=
m> wrote:
>
> On Fri Feb 27, 2026 at 11:40 AM EST, Sun Jian wrote:
> > The perf_event subtest relies on SW_CPU_CLOCK sampling to trigger the B=
PF
> > Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
>
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
>
> Nit below, but change makes sense.
>
Hi Emil,
Thanks a lot for the review and the Reviewed-by!
> > ---
> > -static void burn_cpu(void)
> > +static void burn_cpu(long loops)
> >  {
> > -     volatile int j =3D 0;
> > +     long j =3D 0;
>
> Nit: AFAICT most of these changes are unnecessary, you could just bump
> the cycle count to 100M and add the barrier. Moving everything to longs
> and factoring out the loop count is unnecessary.
>
Good point about keeping the diff small. In v2 I dropped the volatile
and added a barrier().

v2: https://lore.kernel.org/lkml/20260228074555.122950-3-sun.jian.kdev@gmai=
l.com/

I kept the loop-count parameter mainly to keep the "long burn to
trigger perf_event"
intent explicit at the call site, and to avoid  hard-coding a large
constant in the helper
if it gets reused later.

Thanks again,
Sun Jian
