Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794709737;
	b=JYgyJtWo4iPQtUDTnMq4JGO+2XfCf5EKWu5+bdimXVCD/lq63xpstE1tyNdEPhp1LdOU
	 12C7Y5VQFTyLMyisUpMZzSu0RB52H0hN3Xbod3nFHGch5LaHRzbc5aj4OURJ3mQ9J7/EF
	 ejgzeCIPJQBW3q5bybzSORN3CxI+X7EJ93qD6OKuNMA9iyiJeIMDj4v0I0uGdFepu+iiN
	 OGHQ5zLVeZWVzPu+5emCmG/S3midEUoHyB4rTvRIVxbBfD40WpQ27UUsO0d529iC355ch
	 elw9nzbcnWoxf09swmkccEd0t31F67+Ii8++XvuZI4qu7zS2mo0q9yuMCtSIYja3H5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G0R1NDMcyta6okyUda1y3v58EnPaSSc7GPjs8feVmgU=;
	b=W4+bt6czHn4MExTi6dj8sTGLqvcMQ4fRFw5D5AJNhBBCqy9h/uH64D28uo1hJq1MSUbZ
	 K9nuqtXAdGbU7mBIU3AFSiyzX27tpey6TJPiFUH3LN6LvjoFjVw+D6zTlUet9kTjrdMb/
	 JQ4WayJuMKA468HfclzuUNs92Wnf/X6mlvQ7z2u0eBHPqyigcK+0PnCtGtpn7QyZ1NhIf
	 a0WpFkpM1BvaCTHuy68Y1eVespQYbtUqDgP/CqAsDToq39hsKODphRZY+W98Y34i3eBNi
	 M16VNzIkkGYeZAmN8xtUsdZJZUAVW1N9rNf6x4ORJIVAfwEAK6efohnOp+ee47Plo8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nbfneGYr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2140B606A329
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 02:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2140B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nbfneGYr
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4adaa0f72abso3490480fac.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 18:28:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794709736; cv=none;
        d=google.com; s=arc-20260327;
        b=ondt65WQJdNwEgqvnvrP3EE7sanyWAk3uYuMpU9zQ5jcmU1oE2derR+uqv6neI4hJV
         cXJz5VvelPdOeCwIiaKVDfgDcGlsqVlY2ChzreWExkMNbxOND+eMRHVB5cA5iMN09Ca9
         Yb1wCKWjctx4kp0QZ4PZZfXvA49OIVgOUdcHPStoOYz1F+7unrOqt79WbQtJ8Xrie5ql
         S87Ff/1oWrNBfbzaxajxx6QmLNSYUYufyauMIiXV7TyxkZKJENHxJiH2uBZg6qW+mac+
         9hHxDf9kxMfAtqoY087o47WnIfz0ENx6qSV4Z4cojS85tW/CdCrjBqywtb/UaDsTABXq
         /irw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G0R1NDMcyta6okyUda1y3v58EnPaSSc7GPjs8feVmgU=;
        fh=y8audzr99AlngnRaWqD9td7+tdkF/d80Hk9b9UsQVE0=;
        b=FmnTTQPvgajmdTGeygp8ROqpvOyUFtjaRNaOhksXLgsmxBpYditeu2R4pgnZaFmUIu
         nN62Lbe9MZkD86RqaK79shSe9vSDroNQGD7vfVVBoY11e2VSU3V43zr6A/YtUZ6Wpfi8
         +Ju7q8CoZa9QGoiWRXkxIdqkd8N3Dh13qyInivKIlB5N5fB7hwxLPZ3RbzhA43wjE/95
         tYjznXG4Bb+wHf64pz1JDhSlmDrHu1W7z4f9Hdy8NaSgle+Cvna16k2mY4DOkbboW2on
         vLQgICSIGf9mSK3fyCmL5FvwPaIIuvfdgpzqvaajOAEbHHyyFkBOKU9oNb68Z/vKqHPg
         k7tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794709736; x=1795314536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G0R1NDMcyta6okyUda1y3v58EnPaSSc7GPjs8feVmgU=;
        b=nbfneGYreYpMfUAFkHDdlSMQmERdv23sSDuuWJ0gzACuRP9FFyRT1YhoCeaRNHI/jL
         GsNPvJ1lCij/s0E8/JKYBXgeOm98BmOsIqtmYEEd9Q11go5twbrwrZfHYhwsxndejGwb
         coGSqvOT/VjRhCiU0gDbZO9XzTM9tsW8vq8oPHjV11xIHreG57Y+9SAlELikVNansz7w
         DBfUMM01rxIJZvCOdRfWEtFTZUWi91j+FXUH6H2pFwKEpwV1o5EMLC3tREoEQjcKt6Rx
         rQ043/klYKCRt+u1wmVY8lr65wlrxV5NKQbmiv5au+/hyPqPvinslNUx6gAjn09+GaSY
         CHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709736; x=1795314536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0R1NDMcyta6okyUda1y3v58EnPaSSc7GPjs8feVmgU=;
        b=wCu/lv6ep+OwWudTOUCgTkZYbQxC73ImwBKTb93w1Fw7nKTVcivl0/NJhrREeZhTDC
         89M8XyMN6IMP0mkGz98ucgdB2sdopU5Ryj8jv73BgOjiG7LxbGNEDC2mBH+6HL+PErUK
         hD+n21QHNbFBJXbI0SHAQtHas8wsp/IkBv6PET7W1VpyCV3rY7vfdLmx9bR5BDlNpI2c
         wmfD1FDDbQWKaz+nfnnl/Q/6nYIN+LJ7QqS1M+UY3GjRfJQMdlMKiKOgDysMY/bgnY7N
         oXp/LGoaagHItnt4hGhck2ThpjNJVXH7VRXC45ERn6HfS4J8O8K5sfw1NGodOvv2B1aB
         IABg==
X-Forwarded-Encrypted: i=1; AL+hErHfc9pE/Smrm4RfYCsQP2jELD138zhyTLzrSsfYY2iVXKSyY5b/N35raLSH3PxKrNfHyp+Reyp/oFZG4PlOR+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rfoU4YBam+rZjAfBKOCWO5oi9Fal/0owXHUxrPE0j7UDnA6+5
	8Whfr0Q5fa8Y0hzzZZJLx4Rp87cNUJJ/rP0/n1WeTpgdWnFUyYWpixOgf2NcKtP1XOpmiklVUpL
	GcTvW0XFfiKcsGUFf5/ldAWoJ9QGsTuE=
X-Gm-Gg: AYBFou3fgR6JHvvKgWtMRJuQPQc33JaeqeW9WOgEr8VbpDl/rM7S3mj9SfaCiU5Pm7r
	w+pUCdDNbGAhqwgNTUgMtIZMB7DLh4NONWs53PB1suKaVTie78+dwly55nAZerb1kCZGSUgQOt8
	U+ANNbAlTEc83w51rWeIcBOD8j8xuzgQBtK9tFqkhhUXqUzCuvXyrMj29wRK3rrMIYSNO8uEoKy
	y5mPMcMEtN3/386yNzNWLED6nctU4dmQGCjWkgMiaiwof/4JuYTfzUrF375t/7SLfQdhxGo0Zj7
	jX+g0ljh+OQ6Y0xpT7nUkneID1QqlRuq06lIaFuI6QcgV8XQwUklPJ6+ddy+vJOFV5vCGxeuVnD
	M4mwd0kvjcYccU+XRf9KGIEwsT+UOWkd0jGFoGqDaXPxogQfUAE+z4D/IiohXkBB9lxdwUAickD
	8o9Ar8ylg+qGD9k+IXszuoJc5QN8ujBXBFOSg6muHboLiNVk1UM972tCc41A==
X-Received: by 2002:a05:6820:8105:b0:6dc:7513:c06d with SMTP id
 006d021491bc7-7197cf12f05mr6314842eaf.50.1794709735598; Sat, 14 Nov 2026
 18:28:55 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611112257529855AMDZLzg8ZmFDQ3fBstbi@zte.com.cn>
 <20261111225759742pwhACD8p_0GdXSYIk_Ob6@zte.com.cn> <avkT5yu3hJgi-YWb@fedora-laptop>
In-Reply-To: <avkT5yu3hJgi-YWb@fedora-laptop>
From: Ming Lei <tom.leiming@gmail.com>
Date: Sat, 14 Nov 2026 20:28:43 -0600
X-Gm-Features: AclHuK_Ifc5tkbepMLK0d8ZgWsUZJ0Zl-dFfIWODo7gKqOHzWbB2LamABucX8Fs
Message-ID: <CACVXFVN0Kw+jvDuZJB-XaAN3hNDd3WFvLZULJcpKrpz3qiehXw@mail.gmail.com>
Subject: Re: [PATCH 2/4] selftests: ublk: propagate stress worker failures
To: shao.mingyin@zte.com.cn
Cc: shuah@kernel.org, linux-block@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 8:07=E2=80=AFPM Ming Lei <tom.leiming@gmail.com> wr=
ote:
>
> On Wed, Nov 11, 2026 at 10:57:59PM +0800, shao.mingyin@zte.com.cn wrote:
> > From: Shao Mingyin <shao.mingyin@zte.com.cn>
> >
> > The stress tests update ERR_CODE in background subshells and use a bare
> > wait in the parent. A worker can therefore fail while the parent still
> > prints PASS and exits successfully. Calling _show_result() from a worke=
r
> > also removes backing files shared with other workers.
> >
> > Generalize the recovery PID collector and use it to wait for every stre=
ss
> > worker in the parent. Return errors from the worker helpers, leave resu=
lt
> > reporting and cleanup to the parent, and reset the PID array after each
> > batch. Keep failures ahead of skips when collecting worker exit statuse=
s.
> >
> > Fixes: bb2cabf23568 ("selftests: ublk: run stress tests in parallel")
> > Reported-by: Ming Lei <tom.leiming@gmail.com>
> > Link: https://lore.kernel.org/all/avJ0Vn9G7XhZv-XL@fedora-laptop/
> > Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> > ---
>
> Reviewed-by: Ming Lei <ming.lei@redhat.com>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming Lei
