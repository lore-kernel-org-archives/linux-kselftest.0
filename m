Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF505616C7
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 16:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996168; cv=pass; b=hO8PPKyuNI0aCqpGEp9VT3H2I7UHp7ywc3+42+lnFD0FctbAJuiFRmjbgSSgBge4zUGOA3iWiKGDueUTeXKhkE6OGqNQHPtMc3tT374zPNLbysLjm0uBRg1JqcEl5UKBrf/Yz9mEbmDTuCwjjQFXsrxHt18wBiRm97TbS/Mgyt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996168; c=relaxed/simple;
	bh=rKi6pIGi82k0LBkwFIDIO88q817cjLLfthYLujR5pLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PkRpoG+HGeEo6+ILqxB+VX2AnKhiD3z0g9NU+wse2H1bT3w+RSStaiFIhGKbRyal6E7pUrSPsKy6sqLZCEwzCSbJDEqMKmQTRpTGnmYTOvG4HE3acBHpsPUolxkdWOGLC2/l550Vc4iyetH3OpexhYOluYtf2a2pTXVKnIyEYW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dmMXDdVY; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dmMXDdVY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16c399641so42776195e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 09:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996164; cv=none;
        d=google.com; s=arc-20260327;
        b=p+QLbuCWvse9sEcGw99cVfgYwNgwSw2VWDepYo+U0UKDCwfmoOEXamMuN2hp92aJFW
         AGjO8fzP6XPDu7V5srvGPPXpbHBZpgLioYt1gtnFAQWFfWNxZ27kOtwLye+0UbSgZ5Hk
         /Pb4ULNwehOLs4/RcTnP+u9l2znzBCpgaD3MT5Fc/l4Eiuf86IZ/G/KJwS5BlZMgj3bY
         QY9Wj0VBasoQPqXiAuBTAtjfFBTclzr4WQnhyMIGSdhyyL4l309s+P4lzc9pbuMdnuVl
         x0PTuHcU31W1/qMgJDrcIbFx9WZ9n4XF5HPw+J0tKwASM1/a6RuxAShXVR7Lmj8ff8jA
         N3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v6p8wLsPj+VDCmBDPQwmg7rxehQ7WvfbYU3RH6s6NRw=;
        fh=kdTKltXfx6BJ6xed6JKePSgC/dx/l3L9d1wUm3EDn9w=;
        b=ZwZlIK2owJFqg9TOHEOWCexDci5Np9+JgaMVvUbVaCJKg/4sLC5vCMdoCjRovHylLQ
         MZLgDbL0pCd9AUi3k388QHPYM3LeO3fkN1YVxTnC1kOEZZvY7QACS3n78OxRETNCXxp8
         QGsgrJHfCifavruNB9uHz511LkVIQnxbc6h/nTa3uP7RwuDJze3lajHq/HGUj3xSNx2A
         7IfPXCmGkvZCDPvbsQiZ3MiXKKdc+WwXw02K6cx364WZ8gbBtoo3r35bdanwbMkpyHlK
         sAmPTvfsNEy/4MhCtQRLurfyfOPgM1Dedzn3oR2twG7QUd9BePCnQd8Edy0UIJHrSsom
         5QuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791996164; x=1792600964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v6p8wLsPj+VDCmBDPQwmg7rxehQ7WvfbYU3RH6s6NRw=;
        b=dmMXDdVY2jP8tZe8P6v2xi1BqZ7oM4Vo7UkR8hG4mqvAflhEuaDxi+XkmtwORVdvYW
         OkgvFV2QG33DnbHTumfqp9KW5Au7JA1YUs14FFNHPsENlSkYS7nNKkoCqIFBy5qjvs1B
         VzupZizSCTCJQRGfF0PN/AUSeYHz4G88ft8oteMcO0RuWvjov8Q7aQH13zYeDcgVfVqP
         gUQOas2wd7Hl4VVLMTXcEquTt9M0tv+1egjiIQIu7Sm7RnANC6Lz1ef2NqaCc876uVee
         JFxKeopjHhpEbAX5WLkLXnlZTPodWcNdZeTGZ2o1fiXNfTh0WCEIEHSOlPCjfzxYsZuL
         oKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996164; x=1792600964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6p8wLsPj+VDCmBDPQwmg7rxehQ7WvfbYU3RH6s6NRw=;
        b=uXGqhSzOtbyobZqe+AagZ9roqKE25vxbW+UDyieF2LkvYtphJljI0EUDe/2Hs1wCft
         /PNv34XAhcgFqkzC2HRdDHq1K9Zxhxf4ycvzPpnQmC/kVjzQcG8ANSU6MqLVEZ89zuf4
         56/K+JGid+4Biel6EdqbILISqoeFQJ3Uu2G57fcwDVprutsFRg8MiTgz84JG/9PRrPaC
         KeqJgiwXN5wMrqANXeUOjIbX5PlXPEvLsw31LWlgpQuBb6ieymeJXH67s45khEo3FN3B
         a9CcQBB8E+rMdBZF6EKEBjMwMzgqLu7G2xvn3EJ8eNbhNaj3NV/8hqa5FikkftqsQxFc
         nYLQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5LIIA79slHtfZqDP/CvG4ok4BB9Wk/TQklf3VJt7gOxFN1dozAZguz6jknSYFbsgxLIyrf1lkHT9/oeZtcDc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmwrS3KmDpsstwxzOqfTlXC8PV44LmPKB9oqo5GYzU5A8jvLfB
	T2+wkzwraH8TOQFo+Z8N/oFHXXLlDgWSl5gYR7phem3sUIzn6u5/3CMLzXtyk89ecuiih69Revv
	LsQMsP0weHL47lfjtMZUs2b237REC+N48i96fHl6Q
X-Gm-Gg: AYBFou0EZ6QSB4HEF1E0sumWlWEbfI2TkYaIoqnKLj7V8oxqMiASiPiSSJBc+hOlggV
	C5Vqho3vsC7VJkR7A421lzCgwcaoDWKzJPdmdnbCT5hg0IErD6c31Iby1/h7zsIbXwcJ6mmVGhW
	TcL19cfIWTf7+zSm8RS8VwzfHShn+tlMLwJQHMoNhPI0m1Di3sM6n0K/LIYigdd//sTb8tzs+I/
	kOJEczqC1rULS6RrHkIGfPoZ4N1KTwKONEdmdM+2CkDaPVw1tUMHMU+t0yCU+Ou1lUSkDsKTdSu
	MYboerQ4YydEcDqfd5QCO2LNml+vr+IQ/ztM3+VKNhjfh+KyYm8ElF90TYvRLE5ftzLk8ilM+xB
	RMa/TI10o+f79NGWiVifM383HlNDBuTOVZmLr9fnNZctlOprxtmOYX604VdulGJhFUskjCZXTBa
	cMdDcf5XP9EvYlM//7VwStVyFn6qHKbrwG0ce18UHzlzbaD4vNMS4r
X-Received: by 2002:a05:600c:4e89:b0:4a1:96cd:2f64 with SMTP id
 5b1f17b1804b1-4a196cd312cmr283584205e9.1.1791996163311; Wed, 14 Oct 2026
 09:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
 <CAKwvOdmQkYy3xqTsumSxLdHpaXnt1Hb9g++DVmAYcx=cvjFBeg@mail.gmail.com> <38d31a6b-b3d0-4b15-9b24-62d2bd6f9040@sirena.org.uk>
In-Reply-To: <38d31a6b-b3d0-4b15-9b24-62d2bd6f9040@sirena.org.uk>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 14 Oct 2026 09:42:30 -0700
X-Gm-Features: AclHuK9Ord4aUgNPJNBcBx9FYXt-xGJSQPIiEoaEK27XDm7YBaJzhLkX1ABzBeU
Message-ID: <CAKwvOdnoZfE3bqNnRBTR4G805V4-iooe9YwS8ZO0ka2h9bgDQg@mail.gmail.com>
Subject: Re: [PATCH] selftests: kselftest_deps.sh: Support LLVM
To: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Guillaume Tucker <guillaume.tucker@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Oct 13, 2026 at 02:07:28PM -0700, Nick Desaulniers wrote:
> > On Tue, Oct 13, 2026 at 12:40=E2=80=AFPM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > +       clang_target[riscv]=3Driscv64-linux-gnu
> > > +       clang_target[s390]=3Ds390x-linux-gnu
> > > +       clang_target[x86]=3Dx86_64-linux-gnu
>
> > ^ should this be either i386-linux-gnu or i686-linux-gnu, or does
> > `-m32` get set somewhere?
>
> Hrm, that'll just be a cut'n'paste from lib.mk which does not so far as

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/too=
ls/testing/selftests/lib.mk

> I can see set -m32 - it sets i386-linux-gnu for _i386.  Does that need a
> fix too, or am I missing something with how it works?

Ah, no looking at
commit 624c60f326c6 ("selftests: fix LLVM build for i386 and x86_64")

it looks like selftests have i386, x86, and x86_64 where x86 is x86_64
IIUC.  I see you also have a distinct i386 target.  My bad.

Acked-by: Nick Desaulniers <ndesaulniers@google.com>
--=20
Thanks,
~Nick Desaulniers
