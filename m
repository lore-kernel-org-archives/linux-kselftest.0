Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB9438D3EC
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 21:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781299455; cv=pass; b=pDpBM/gmThR0cVKGHBx8UtGp6itm3u+bXE8A9hcdLRBB8Kfd9CIKomWHT3AzX4Y4YbwVDUP1EkKfxaQQh3goQJ3vVu69tLo9wvGOM4iyTdwAc4exhvfLjX63aAwtjAZxtuUMM+mF/TFcXyNCZXVUWqQJ4oKLkIJVHSKySAFQQkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781299455; c=relaxed/simple;
	bh=cn78rUTPXx1BC6BSDdWKsg1KZF77OTmfapeyMhEBPqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bw6mO6ZtDG8gE1ePu3JdRsCj4MIdfBOBpGwy/ZgoyhOtYv61KsEfzq+gEyTxowUcsB2m7vL7bQfqUtfxdq5xbVTUvULxdF4LgfaZZUfy00J95XY6JtH/EnVFRltzeYiOPNu35EooYklCYFcLfLJa1DuZxHT2fL7DtPSKFQ9sKBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b=z1mvs3UC; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b="z1mvs3UC"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa6c66e6c5so1032056e87.2
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 14:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781299452; cv=none;
        d=google.com; s=arc-20240605;
        b=Uk66z6PnRqjzPC0Qelh3bc2vCD/iruK2cdRFWx3nZg0WBOfrHNgPyFXNnxft2Vn2Ye
         VSQhVmap/epcpv2/UL/dIUF7KtncnJaRN99/aUja9q0qiGlwEjY20DP4sDSihzCix4+P
         UhJnHYg4LGreEGH1Fd9vw/yp0mnLPSgS4pPbKNnmUcuHNJ/0xO1yVA6tw1lnjdqEhyNN
         cf0CxJBE3vYHHxFAqhFWt0HzxK8tmE/TzAH05hAk1PjVdpLeertKP6+WTgYxqVLIuPmO
         GadV+gmjiT702QJzqpOBJEscvQjvpuHgjxxaXMjPxuuV60bDLxBatKsRKZWo2wr6H8Qh
         Q5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RDrvS5c8Xd94AF19HIRED6Jxb04kNSOwRy6kCXlBy+c=;
        fh=Oq0t4RiVHeqpfMfQuhzFySf47FjRBuaQp5wDopSOoyk=;
        b=HLGo7g7UuZK8NEtKv+wIHlv8U7Wi9sFioGQ8+Rd/IrNawj/POGmFjptpj0BuJSm2T5
         M3wzYQ4u10y780y5PUEHvwqNwKWF846ZIu/auRCDPhuJOQcq62JekhhN/OsISdlz36b8
         QypgML9zNTYzBCjGDw5yFh/iK/E8Th61yymGeIUA17eCe98vwTzi2w6QCBadaozCQvgl
         /cVpFWwi1hYB15QfwJ6NRlmgv5301AzCCtbafyqHl1DHJHwFm0SK5yzNpOMndJu4uRVk
         u/flBvIX1QJnH5FVhXisLZ+6utwvaM+04k+kek/9MMYK86Nj7YnzO1micqmMhfJdtpz7
         0uAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1781299452; x=1781904252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDrvS5c8Xd94AF19HIRED6Jxb04kNSOwRy6kCXlBy+c=;
        b=z1mvs3UCVqIHVLExE4e3uSQZh3LfXVYjMqGTkE85Qfwdg+20Dz9SYPDD7cntnpuGrb
         nyzSuAonNINlDvOZPYzQCbNll/Le9QoDjZNdkBRAqYhL+v6e39XnO3OnJamGjvQiR9pP
         XJD7xXCAXz+nxKob7XvurU8gFo8Vj3ag2poffDvMLHDZ83GYfxxtj2arcP2Qh2Bo/0I1
         abvDXxvtsENirdht3qGC6FyvRbGW4jbH0n445VIXthQ8jX7Z8iB0KjEnsQhkCU85Iizi
         7d9lcRUrqyJE8GUMQKFUvE0ZSoKWjpfpv/bH1/AeyYfRTo/C/8KA1ORmwGZ4xBEQp62a
         5iJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781299452; x=1781904252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RDrvS5c8Xd94AF19HIRED6Jxb04kNSOwRy6kCXlBy+c=;
        b=lml0Fqq4+dq4/t1V55a47n5JHrb2dPpP7hXHeJa5PI08T5zhC8OKRyIa7qrrZN1bjz
         lNK+MKrrzno8yYOi+sCytX/mzmaEHh64PzdalC1Ox1zHka/BSPLeecTAdPaAwPlbm07y
         2B8/msFO0NIg0RHD9khHGO5HluPFODynEO8uBRrFSOp7etnHIi/bve9Bc2e4VWBMTiJq
         0w0+Hu1VAnF2mMI3UvLLxkrV0KlBUTnlAcFccy6KzDhR3lDRZQqVXLALXK1TLhUoQBZV
         cjxT4fPAFuRwGe/TRG9gdqBmBe+ukZAdwOLyqhpqq7W/A5mq71Q6+p9VMaLLXO7fQXmf
         qYqQ==
X-Forwarded-Encrypted: i=1; AFNElJ97dvEF7tqummmiwwOKnvLG6xwAx5Ns6qUA3kFGMbQfjvHEYLYKTvNHkRITKCihr6N1f1G2VxJCanMRQ18lLds=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDh5GEh52Y6b4+ymdnI+fTAn5Hy6hSzO1X+55tSbJJHbrMymgJ
	mZY7armrQf314uX7FWWXF0uyXgdfqQKMM4VJoY7MG10gputO1B4alC5v2QisnLPoalL0yNBToPf
	NvbpE5zufXWreT0Bs8OQfalgWxGVIesXzBVEmrdkE
X-Gm-Gg: Acq92OF7xCmQAV2UgV14nAT9vY8hsgR/ZA1a153UWo0/HJdEjnODKL1hWeJtDWtLZaA
	vJe/XhFmD2hEVjrbFBB+AyM+F2EOqjjlTklzNXHQNz5sMoo6zdNPFmBCsskbf7ze10Jzyf0CJc8
	V09MtaD4oxV94Bt7JsBSBJzzoSUV8gBC1u4wejIYk3eBjZzrx8w17N4WGW/c7nTjLn3HPLQSm66
	iYgipU/u77eqaw5ENaYWlwU0iHllnSQ1AjXcLjiHPJ/7nGEOA5ZEs6rzX53m0lxgiaXqf4zSc/G
	bRXD
X-Received: by 2002:ac2:4215:0:b0:5a8:886f:c03d with SMTP id
 2adb3069b0e04-5ad2db2a4a4mr934656e87.19.1781299451886; Fri, 12 Jun 2026
 14:24:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-seccomp-combined-v1-0-304b1cc3ad24@hill-daniel.co.uk>
 <20260526-seccomp-combined-v1-1-304b1cc3ad24@hill-daniel.co.uk> <CAAFS_9HpxOgHn+qfzSpLjV4Mj_CURiwxFOaK9GO0DdBg8xgNYw@mail.gmail.com>
In-Reply-To: <CAAFS_9HpxOgHn+qfzSpLjV4Mj_CURiwxFOaK9GO0DdBg8xgNYw@mail.gmail.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 12 Jun 2026 14:24:00 -0700
X-Gm-Features: AVVi8CfltwWlaIYn2cGClEbbpFjcBiIsNRfdTQO7boUoo7s5oV28C8CqBlmjRYc
Message-ID: <CALCETrUArQBzUS2mAhYxDS-unze_gnQ7efv1qeBke-ux=2KdkQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] seccomp: Allow using `SECCOMP_MODE_STRICT`
 with `SECCOMP_MODE_FILTER`
To: Will Drewry <wad@chromium.org>
Cc: Jamie Hill-Daniel <clubby789@gmail.com>, Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 12:25=E2=80=AFPM Will Drewry <wad@chromium.org> wro=
te:
>
> On Tue, May 26, 2026 at 10:42=E2=80=AFAM Jamie Hill-Daniel <clubby789@gma=
il.com> wrote:
> >
> > It is currently impossible to enable `SECCOMP_MODE_STRICT` if
> > `SECCOMP_MODE_FILTER` is enabled, and vice-versa. This makes using
> > seccomp difficult in environments such as Docker, which installs a
> > seccomp filter by default.
>
> Some quick thoughts on your resend -- the original reasons for
> this approach:
> (a) filter policy !=3D strict policy
> (b) filter can implement strict, if layering is desired
> (c) minimize checks in the syscall entry/return path
>
> I'd expected folks to simply create the ~80 byte strict filter and instal=
l
> it if they needed STRICT policy.

I wonder if It would be reasonable to have the kernel do this on
behalf of the user program that's asking for STRICT.  The
implementation would probably be trivial.

--Andy
