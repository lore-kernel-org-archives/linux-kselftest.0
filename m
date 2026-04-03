Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8862726E711
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 22:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255633; cv=pass; b=SsAnhh+vtCoLLLAawB2zXIBT2Kw0cP/+yiY7B1xnH5ilgptWHZVDd/1UKvLWqhFH0qrtaI91pjnSDnW6YstAqKwYV+GCrOgWF3tqry2GWuGRySu6tPicJPGDHPaxi97jiUyj2zxfL3utTOlvJYx7gcQI2CWD6ROmZjZNvLpjgq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255633; c=relaxed/simple;
	bh=cS5TMYt6NGRCXh6lDnItZ3RPNIxHU4pQkaBi4/8IShE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQtvJ2w2kQdnKyTceNlXfS+N0qbMOoRz/jfVCupRwDmgc8nnMEbZbI02ALT+81eHYTybB9ByOFTx+5Ed1EjF8Szr7lGoY6wY6fo67mKykCCokEVkMymMqgqpYsAKdTJQaxlnxGdS3cv/lMo/qpo6yorIpwek0rdRDdDDQZW5cAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=V2Qtp6oi; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="V2Qtp6oi"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6618bc129acso3100373a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 15:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775255630; cv=none;
        d=google.com; s=arc-20240605;
        b=IB+qtjOEqQtRnPYnMErXbWWeANm8H0rSyN4+oUHqR7nHSnWWKAy/81HpDHj7ZvOocY
         HK2IJQGAv16Iuzy44sX7gvTYol2qcNtcVHMZRL5eCGFwf9Lar8sVenXWs64ZhDZyGwl8
         jCHEUbdyzNI2XIJb6Nx7tnttjGNGSEsy1KlcJCiL/Qk5uVZLGWqpuhpTDFI+hFlj/Dzy
         nrrZzkfzPOgOTFGZ3UITNcUSujgtMxxB8CRWtpAAsLgcoQyZNjs5FW1CXuVZi1G7mvG3
         3EfO/Dj6uGVz0M2tK3+hUja4aBTuDySfTvFQmXCjQH426qWCWSsUiHGJzvoKLbKGxfcA
         3KAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yzu/7ISN0+xt4wDqduVVLnGl52TlATKkSUYDdczLfIo=;
        fh=dtBsXvoUuwrtT7m9k6iRNt39z8+Hl3CHRITxbDOY6y0=;
        b=iXFMU6XONeH9o2608gN21nzPW6BmUCJzFURMPgJtHlKd6JWoFWyrz7TAvGsb1bvpyM
         AXYwS6pcIDt120bdghRBEt74REs8rLwY5ZlJQsB4SGJ21cXcgDjoxG3sX0Fb6vLi8vXI
         zLEuhs91z8KMckOTs6kPrB8/A7XLo4rofCIBkhAVupsRX2Vuid8AJTopKVzp7IOVQf/C
         x2zDVoYUf853YfRcHH4NDAEntLqJ7+VEmFZMrcOeF51HrkofUn1dY/45KlhFVRjfW2Gy
         rThXt2xKRpn9rw3UK9o7YS2NnSW4jiU8dH7DvtPqJr/9nUOfriigVN367G5eKDNw5tVm
         EqrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1775255630; x=1775860430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzu/7ISN0+xt4wDqduVVLnGl52TlATKkSUYDdczLfIo=;
        b=V2Qtp6oi6YDbGy4nYXYt4IptoSyfEOHYjwoAJ9WxhJR0WgnwFmzuZq4lIEZohQnVgZ
         wPqah/fcbMR6fMN0y0TA0A6BcduUKZ0RusPwCg5bQHN/v+c0DUPy2TeAoj5se19/nK/T
         iDyAMJ0aBmeUB0Dhc8lE5R4Nr/6Kp7hiTfSVKJ0Xy3qRu8/b5aUAHTSLaFWKKb2oQFID
         DXg8q5RHYFyIynsrJbGdsWGdiQsqHYwC3PDoGQjehxMcFlAAvbTl/vip96bDPej4Uo5n
         1XNR90AgIzQAym6iCggVur7zKoQ+v+KIvqBsSdE/pSO2MiDIeIR4iG4cF7avVe+ktFzw
         BE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255630; x=1775860430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yzu/7ISN0+xt4wDqduVVLnGl52TlATKkSUYDdczLfIo=;
        b=dpOB1O51nJHBDdJ6UOmKvIQ2qWdzwZTD237axUCMllIKzSyp4wYioKOssSjHZtdN0p
         nziL65Sg07cVHj2aGg2FTEXa/W0SVuP2md6naJji4Yw+/F7j2aAkDw+XPlopzo4eDODo
         cvdyjRQxG0IXk/N8c+dzJr4b8ZQ1b4ZKKiHLZ97lpftoNOvG8nj5DLvf4BKLDwwYxD9I
         gGePRcbLNPqLvkOauvcF1O21oTD6wlyk6/4L2Jn/k7OUa5/1d17CW8l/e8swB14JlDBd
         mngSuVnAYe+S28YQMX43abS/2tgy7UtXYm/vRweLBrKs8tbWtQgviZkN/eXhAczf2ROe
         YVjw==
X-Forwarded-Encrypted: i=1; AJvYcCX3Z1alolssIylf9g+VI0TTX/Tzp4JaSDzHwuCpcdN43y/y4mRfl1jiamaJ05sCNeaOtSvz4tFn23TO2dD53DQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdxDCelJ7F9cPgtQWhGZb3my+x3o+FuiCebaMBMSKyvZeYvmb8
	bJuPwcOEzKDOOrsD0/4zUzhSVJ2Fn95NjylXUfQZCYXeUCvKtgoT91Hj8BJ8l72CxqO2cB2NtgG
	Og5cdRLK2X32riwU5NVQ8DE06WlRmDNWWcHYlkoe9drJN5OttLu1Ae1Q=
X-Gm-Gg: AeBDietS+w6GfIRse9vNGDh66bZYrs6FxtnaZM0/VxoHA6mMlKhmsWlo3b+I4jZCdrs
	83O2jQa3bv8RtPv3OUtHT3VI3XD0jKT0dl9r8ATXQHmCqgfZ8HgbebrXp2dXZREi38GcYHT623j
	bEa2bS9Jhsq5gLZ+Af/M49nDn0YHk1w6XsLsz1tUFo/R4tQYxdPmDLVCqyU8tl7z/26+1nM6fAk
	kH1hHVmmYhxlotPeRjV1T2E8h+eQ/U+om1sVxVTK5HMg9vQYErstKOXXW+YYHsI8acAm53WcG37
	XtlD8sVwyf2BHy3zVnGwph/pAcT01CnP56W7HA==
X-Received: by 2002:a17:906:6a08:b0:b98:44b3:7e95 with SMTP id
 a640c23a62f3a-b9c67b7fdb7mr227433566b.40.1775255629620; Fri, 03 Apr 2026
 15:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403194014.3704180-1-pratyush@kernel.org> <20260403150801.f42e27896fd2da5db6ca3425@linux-foundation.org>
In-Reply-To: <20260403150801.f42e27896fd2da5db6ca3425@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 3 Apr 2026 18:33:13 -0400
X-Gm-Features: AQROBzCcDPnwZI0D7T5sCVdRGDwIktnyvWZTlqb0GhyONyozrqjrEuFs_Tx-qQ4
Message-ID: <CA+CK2bB4nn87FtaH_1VZjZYKFzWFi9gDtHngKv8bkzCqi6oLyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] selftests/liveupdate: add memfd tests
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 6:08=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Fri,  3 Apr 2026 19:40:06 +0000 Pratyush Yadav <pratyush@kernel.org> w=
rote:
>
> > This series adds some tests for memfd preservation across a live update=
.
> > Currently memfd is only tested indirectly via luo_kexec_simple or
> > luo_multi_session. Add a dedicated test suite for it.
> >
> > Patches 1 and 2 are preparatory, adding base framework and helpers, and
> > the other patches each add a test. Some of the code is taken from the
> > libluo patches [0] I sent a while ago.
>
> Look like a nice series and it comes well-reviewed.  Maybe my "we're
> all full" policy-making should have a selftests escape clause...

LOL. I noticed Sashiko is uncharacteristically lenient toward
selftests; I guess it sees a use for them as well.
>
> I see that the malignant gaze of Sauron's eye fell upon your work:
>         https://sashiko.dev/#/patchset/20260403194014.3704180-1-pratyush@=
kernel.org
