Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2394E175A7D
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 22:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304669; cv=pass; b=k9KCwQdLWDB98szK5N6BkZL9P7hVcY+EntnuVD54nzk4jNUsMUqoF1zYbQbO16rJgd8PBNuA5Ou6iwQsc+wDaTxkZI+fKAbTSw034WaNcoOmcA3ReGK6jyC+1G0ntR2o9xbAMT3seSgFcsvt86sRTc4v1FESWB7Ro4TBjAGSTzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304669; c=relaxed/simple;
	bh=sFT+XzlKpv4SUnajwscPnJF8p5NOz9tEidbYoBHNmNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSgXtvKeVi8FgIiZK0pTgjoPhvb0lo2/W4fxThTCM8LbgsKfXavCUaN3CkFMyNnWX+iBe99COsoOla95zFunjIGIHClsalPjOQbgx4u3mwkTwL0t+kegkjrdid4HW051mbA4YI5wXXKL90ar0bbzsTm8aTvmqGf38To1LfhRyEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b=xH2cGArT; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b="xH2cGArT"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa68e66128so1483883e87.2
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 15:51:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781304666; cv=none;
        d=google.com; s=arc-20240605;
        b=Sxib52BwqUYTUB1kiEMNQBfBd2cUYbyVJjOZD/y2F1inUgQTa5myIl5aBzFOVUFTcn
         jkTta6pQ7GQ/hb+rzNqhRbr64JCdRJfwWIaFI5X/JvpaTEHv7NjWHSUrQ3xoj1CDh3Rk
         nK3IU5mc0xKRGjOubhzeDuVBS8lvJeQV79CTM5b/VXk1ZPZw5InHfR4alnjYioD2sbsk
         6B+zEz4X+vtbM9efWO+jNaNtdPul24ZU3EM9yKGuGF7J7jGk7ScZFwmfG+WyeFU3iIX5
         uuMNoEt/ZAH8CmOdw9GQfRmp2k5MasNknwjgl/3YGJOIyLhq4VBoYtkCqq4DXiX5r0lC
         mBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dujGfjjYzIobRUfmhoS0JnZwiM+XACk6xmwNRmTPVO8=;
        fh=wmdyKsKIfcdKRPcwnLG4NUqXAR7FPr/94Fn/ipSIEwg=;
        b=Q2M7e+1uaEBuTqRO5gWGYVmmqPyxel29360Yl7xjlHW6PHQY/VZ4e36sm+/wdlUJqO
         Df5HP9k7f1ao37d9X7z7LhWpee63MnjdMpd923MdbuQrmTadNPsoZ6348ZLwQgKFUu5x
         G6dA5/kNEJAKFdNS4iCim8g4Tn7YlkDbJgmHXUPXj4WegFOz6CETbo4AWQgABFqKwl+K
         l/BNynT9Qa/Yshv5rU1XsBamhQ7aeMg6oLqmN6XaZ0oZEeB1r1L7QvqAobxSEXZsHJ0v
         zMZEcJAXTPcei+24ADvfq296+M05xI2crBLA4yzYltXuFxjFrZgfbjcAhmvICIUNRhcg
         MGkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1781304666; x=1781909466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dujGfjjYzIobRUfmhoS0JnZwiM+XACk6xmwNRmTPVO8=;
        b=xH2cGArTp80e5H0iFWbigUXMNkbEA6Z+v36xmYhBDkqoyPbxBg0u5HP7aIkE/kKvT6
         rYnLhEW6lR3yFoOU4vw0hkr5WO8xNQtVdhSakYJwX90cpN+n+8zHSVbY5Q37TGSJaK5s
         gAf1qETjqcppz5KkeoZp2mfs21WBbSC0m8RQqoICymMUZAXugn7IOLUqTvaLUH1Ly/fz
         Zw4rZaGCBN5IpwGV3HmQzQ4N/fIu/6ze/ehvbr3AhNUdLKs0v0HtvursTbP2vtD8vYN7
         ABaraYgKUK3CIHNBQ9s64W0nYPfB2tIUYctsl3O2OsaYDluci5XuTvlH7F7aBLbPk9M6
         CEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781304666; x=1781909466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dujGfjjYzIobRUfmhoS0JnZwiM+XACk6xmwNRmTPVO8=;
        b=JVKqo5fX8QMxSxUgKo5IxfTVBg34QZ4tSlwLlp5wcraD01N2DiIpJGzKYVChwRsx/b
         uhY5lscbbAOgFekN+21DiE5XkYzqjtAahqceu/bLLEXGX6Wtg7yU3dEyQbU6Bi4ISvp1
         BsZJEyl4F006dj8ybLBl0B+KbEf+jiAk5qsezUlCHYQuGBgUpykE84UpLaCgHZR3vUG8
         QxUTb1+609M2cS1ZdE2Nkcq/GZr18FRR2pMMIOOVimTlsEXah9FM4DeJQa7XDXGw8b+E
         sDN8qdsNajDvhS2Rj4rl5KNKH7IXSIFFsUnOhhJZySCbw0FAxKeg6beiiMSUKlVRsery
         kpzw==
X-Forwarded-Encrypted: i=1; AFNElJ+72tzmnpqmCl9kpMeeBMCUmshHrwmzGVWEf6suEDfJ5zeOJTo2xswjJB9/K+sMOJPyBiuseMNPLeqofV1WhQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+8q0fERJL8Nmk0a68VA0VgKbdcaohWT/BkxduH8U3RZLVcc/J
	rTLXuNPsSYZ6lHKcGkoGHZvXqfaIXkWPQ2e9ZQG6w1hkfI71S7Rz1q9apwxUMiZ5NFF/VX/jVkC
	a9PCKM3LKGl/IrDjJr4fqZls00WqpYMst1tztCo8j
X-Gm-Gg: Acq92OHjn8CD/jNJFJBSA73Kx91g95be5ksuEwPuisfU3aZOC9K3XFv+PjoM7XpApkK
	skrTKvXWQKseLAHY/JRFADq34v32c/HkvJ6ZWvXhYXYTiHQ35zYaIaW3yaKTptT8FJSxKJwvtrV
	mQV5KKG8UIFWkFJc5f5E2qROHcX9ZrgRFmoVp9nm3i3Czq8X7rKQawZQa4vFyQuq72FNZbEYDmv
	MbQpVzDnCAiqvko8OPPvMDqCY3DSJGZl9ufmdWVDuRUhQ8Ss+K4/UZiFkW6nvBYUs/03QtAMeqi
	tHiE
X-Received: by 2002:a05:6512:8053:b0:5ad:3035:9e5b with SMTP id
 2adb3069b0e04-5ad30dda3c2mr206991e87.52.1781304665912; Fri, 12 Jun 2026
 15:51:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-seccomp-combined-v1-0-304b1cc3ad24@hill-daniel.co.uk>
 <20260526-seccomp-combined-v1-1-304b1cc3ad24@hill-daniel.co.uk>
 <CAAFS_9HpxOgHn+qfzSpLjV4Mj_CURiwxFOaK9GO0DdBg8xgNYw@mail.gmail.com> <CAO1UbGemPgHNj1VYONQGx3HJbMMmORctF=jQbGPGUFQYGch7qw@mail.gmail.com>
In-Reply-To: <CAO1UbGemPgHNj1VYONQGx3HJbMMmORctF=jQbGPGUFQYGch7qw@mail.gmail.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 12 Jun 2026 15:50:54 -0700
X-Gm-Features: AVVi8CeSEtVZONHGCnuCD2xhJbfvrvV9WVJmuJmgnaVxQRCFw5qubUWEiH7MAAg
Message-ID: <CALCETrVSjTk975oejzBMHXZUAqRvVJpWUcHwBHrN8VCGb55HrA@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] seccomp: Allow using `SECCOMP_MODE_STRICT`
 with `SECCOMP_MODE_FILTER`
To: clubby789 <clubby789@gmail.com>
Cc: Will Drewry <wad@chromium.org>, Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 3:37=E2=80=AFPM clubby789 <clubby789@gmail.com> wro=
te:
>
> On Fri, Jun 12, 2026 at 8:25=E2=80=AFPM Will Drewry <wad@chromium.org> wr=
ote:
> >
> > So I have two concerns here --
> >
> > 1. By layering, STRICT becomes subject to FILTER RET behaviors.
> > 2. If we did want to layer them, it would be ideal to separate the 'upg=
rade'
> >     decision from the access checks and make the layering path explicit=
.
> >
> > If you are running a legacy binary that uses STRICT in Docker, then I
> > understand the goal, but there are userspace options.
> >
> > I think it's hard to want to open the door on changing STRICT without
> > a good reason to work through all the implications that come with it:
> > cross-checking every SECCOMP_MODE_FILTER reference, sorting
> > out thread sync interactions, ...
> >
> > That said, this change could be streamlined and look for ways
> > to minimize any potential implications.
> >
> > Am I missing something or overstating it?
> >
> > Thanks!
>
> Thanks for the review - I'm currently working on a new version which
> addresses some of the implementation
> issues. On the semantics side:
> The current version runs strict checks before filters. I think it
> makes more sense to run filters, run strict checks, then return the
> filter result (assuming strict checks were survived)
> Since the strict checks logically work as another filter layer,
> documentation says
> > Synchronization will fail if another thread in the same process is in S=
ECCOMP_MODE_STRICT
> So refusing to sync threads which are using both modes seems the most
> reasonable.


Can we take a moment to contemplate how filters compose?  The current rule =
is:

/*
 * All BPF programs must return a 32-bit value.
 * The bottom 16-bits are for optional return data.
 * The upper 16-bits are ordered from least permissive values to most,
 * as a signed value (so 0x8000000 is negative).
 *
 * The ordering ensures that a min_t() over composed return values always
 * selects the least permissive choice.
 */
#define SECCOMP_RET_KILL_PROCESS 0x80000000U /* kill the process */
#define SECCOMP_RET_KILL_THREAD  0x00000000U /* kill the thread */
#define SECCOMP_RET_KILL         SECCOMP_RET_KILL_THREAD
#define SECCOMP_RET_TRAP         0x00030000U /* disallow and force a SIGSYS=
 */
#define SECCOMP_RET_ERRNO        0x00050000U /* returns an errno */
#define SECCOMP_RET_USER_NOTIF   0x7fc00000U /* notifies userspace */
#define SECCOMP_RET_TRACE        0x7ff00000U /* pass to a tracer or disallo=
w */
#define SECCOMP_RET_LOG          0x7ffc0000U /* allow after logging */
#define SECCOMP_RET_ALLOW        0x7fff0000U /* allow */

This has always bothered me.  In the absence of USER_NOTIF and TRACE,
fine, I guess -- we're choosing the least permissive, and this doesn't
seem too crazy.

But TRACE and USER_NOTIF make this very strange, especially as people
keep wanting, quite reasonably, to make USER_NOTIF fancier.  Shouldn't
the actual behavior be that each filter, starting from the innermost,
gets to reject or transform a system call, and the outer filters
should act on the result *after transformation* of the syscall?

For example, if I run a container and set some syscall foobar() to
SECCOMP_RET_ERROR in the container's policy, and the container them
runs a tool that sets foobar() to TRACE, then I think it would make a
lot more sense for the tracer get notified if the task calls foobar().
Or if the container sets foobar() to USER_NOTIF and tries to emulate
it, then it should emulate (and not get ERRORed because no actual
foobar() syscall has been attempted now that the inner filter was
evaluated) and then run the result of USER_NOTIF emulation (assuming
it tries to do a syscall) through the outer syscall?

And, however, this gets done, presumably STRICT would be a different
variant of KILL_PROCESS that does SIGKILL.

--Andy
