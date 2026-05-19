Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67007340410
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 21:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779226957; cv=pass; b=Ek4OACMPZicpQotysnzbTzsXRaADvOv7sU/mxbr0YGA4QhqypKQ3nDOqEh5Psx1V3S279ef7gFjocAcQncDy4drR3p6aIGY7lJIpKZP01PjipDgmf0Fj1rr42Ru/zGcrPA+ZDk78RULPptHxWypiNri0DL2XzSLrpoA7zKFiems=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779226957; c=relaxed/simple;
	bh=agpQDPE0e0tDa6PFtfyC+WslCRjLfXBgwgqDsBVIG9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uuFOtf6bFbZ/1BxZpZO3f9PL3IDpUvSM7enV4S5zDfkpakJEIh/pvaGq6YpfjsDfb76TjxO2BhJLOJ0G+lSHJNm/haL5bp3BvC5ouLTkqWZlg3Supeil6ELucgiZhb3dmuQLnCxq7ikorHdQuVXVd39GB7N4foP2H+EaweX/Gy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cBBOp9lP; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cBBOp9lP"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-671588ab0cfso305a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 14:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779226954; cv=none;
        d=google.com; s=arc-20240605;
        b=ZsoSAVEGrXtTLBx2/rmrBZsaKS40sL3XawPU67s2yTxpvtOLenTlCucwElR9FLqTDi
         53CBSXWMR4t4XWJbvtd22tozxQ2JgGcDX52VexYqXaiNj/zLwiXXaLcNSMiH+/c6CsW3
         QkNzKMRwphYsE4YcG1tK0o1DH2V31jQJUl/WS0t4+fJ5yxSmg9UoGJ1ZTiJDvlk1RusC
         PTGLaXIDJPF5D2/e+dvKsx1ouWaZezHXcupmhPQKzRxCb9sh4bkH9PtW+Kg0WkPc5cEp
         MFTJS9CBPLYBHKbl58YEBBBAnrfzZ9PRCdtHLJwDvrCq18lRBm3dWlTBNwqWB6CFBXui
         vFlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=agpQDPE0e0tDa6PFtfyC+WslCRjLfXBgwgqDsBVIG9k=;
        fh=YG3FyOaBazK1f1+WCb4/M7dB6GWgZOi2V582jEeaJW4=;
        b=jjud/T7+nZf2Ee/uGkrpfxnnL11I5JasNMqvpQy8qOUdI4YnkjNZ9fwQpA9hd3RGsP
         kYtE2tlolmczLWT074zpI/hX84J2qfXcW0iC7cwYN7pVmqbzBfhnq85u04SFqV8kDuXq
         5M0hdYJXVFxCPojFo+NgTbhGhy6h3n/TzC/sYu4q/nxJnxHNrLlNvuPMu2eauhu5Evty
         S5K1y5SLM/+cbOjlEJ0MrfuBOuQKjnfKDmg666vsZX8v/FHDXjNvvKs91f63yaVTHHQV
         tNnvDZdOSsY2r6lnLCsTpIhJn6QVaRkKFKM5VIgITOEpI57ULgupa8mmAHrD/oBnfJpG
         7EOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779226954; x=1779831754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agpQDPE0e0tDa6PFtfyC+WslCRjLfXBgwgqDsBVIG9k=;
        b=cBBOp9lPxsBqzp5DiVVxXZDcRjTE3euWHcLy8b7vbCVmNAJKacI97hsJ3Vh0KDFaXt
         NXU/Zw17XqHcSHLDvSXAwaJJyllAMtOnzA54IEMDi5toSkc1FhEXHqZzqiln7NYZ4wvW
         lfDw4ZrKlWmzFMu6D/n8ftMX8TONAUMPAsEN31ppZN2D373vE0vjsNy/4phHOsAWuYNI
         nF/qzfTTzsfvL29YjAa8hB1+SvxRY6O7eKRjW3auOF834Bo2J3b1uCxJC4HpkvPM5oIs
         V7wciD7Ct1uavsVVCtQKUXyo51LalxiQasEvoLneaUrOkZFwJnRtJwnYl4KuZY4B5BFn
         MUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779226954; x=1779831754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agpQDPE0e0tDa6PFtfyC+WslCRjLfXBgwgqDsBVIG9k=;
        b=cNWr0ARhC7zUw1/ixEnn1FCoavU1Y9sorEMjbV9s9kASKdcxgbwhjwvlTHeRGgbrWS
         zS8doUzw2dBB+ruUw6kld8c1FKU881Y5K3UW1PpshwMrBDstqgvgqx+k72Q/YUHS/7zB
         sv8HqQlNYzxsmZ0uv5PVDP0Th2DaqkqOAgOGj/WvbN6YyO8znYEYvNZW9yrUniT95Kev
         jFHfPPs2khxFIgxFaNVe4rR83Le9SaAblCBV3Qulf9mF5WncOOduqTdg4kRLw0yvx/k0
         KOe8Vk8xkKee+kMbJgxURVcsXH1KhfihefaDze2Ycw2Hf0/9y3HophFldU09g+p+a0Xt
         XyCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4gtuIA6JlgALWUbKC/3U/i8m8mXQ12tGCXQTkZbW4S8rocfT4fttPUZ61fBa3sEbnymUSExYL5BOrh2Qegbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoBMHSDx22M/kH/hxMY50P1uviLrDQK+PEl5K36CZQTv+klzwl
	9h1ejY9j7EQB4X7h5/xmvfbtXXhG9cxecqnWdKz/ZKJn/i3k/oJXqkPybENPF0/ihKAAUp8ipTz
	cN0t34KGQjVgzJlvjuZU4UabWsDI46S1ygkjsinQJ
X-Gm-Gg: Acq92OGBxl0OswuFtSglBCd0uJ1QHC/wAroGWFiCD3w/bLFDyAJfmVqsyz0/qii3XY2
	9cRZ0FyCNJ0PHTJRo4ohBhQm+duiyFe6paEcQc458QgUJ+exuCyjw44GMagRnC56jOcCOMmPcN/
	uEMabjITHpH5gwUmONj3GmWVG/uAqZkt6/bw8iHZiGYcAxUtDf6QFtpOnlmMBPJjyxAeA8Q/mMh
	srpRbzfwmFmG4UbZQPeoM56MQAlbFSHxLOcEh8UP64A2JaWj4PHRgOJv0JmU8sWxYTRGu+auQDL
	Dy0roUJaTHYKRvlUJT3zzf8CDPjZtkcKLGsriix6W6dQrOI=
X-Received: by 2002:a05:6402:20c6:20b0:678:a5c3:4d12 with SMTP id
 4fb4d7f45d1cf-684985e277fmr173995a12.3.1779226953632; Tue, 19 May 2026
 14:42:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <F78521DA-08DC-424E-BBE1-231BC900CEE0@gmail.com>
 <CAG48ez0KsuR5z4RDgxWPUoS8e_MJzF74RgFDJayohG48A_N0PQ@mail.gmail.com> <CAAmtCfMHqdWbYh-Hc5sGbOhXSM-aCA9G0-s64G8FTM+rGEV5RA@mail.gmail.com>
In-Reply-To: <CAAmtCfMHqdWbYh-Hc5sGbOhXSM-aCA9G0-s64G8FTM+rGEV5RA@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 19 May 2026 23:41:56 +0200
X-Gm-Features: AVHnY4KelXMX0Ox3UHP6DtmSDnRxPxmxV49wSNMKd-K67wpQhqz9skVmJZNDODo
Message-ID: <CAG48ez3u1OCx+zCWEs-_gowDmQ=KLbXO2xZ83LCZ1o1gxRT3Ww@mail.gmail.com>
Subject: Re: [RFC] TID v2.0: kernel module for cache-line zeroization against
 Flush+Reload (CLFLUSHOPT + LFENCE + REP STOSQ)
To: Ahmad Hasan <ahmaaaaadbntaaaaa@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kernel-hardening@lists.openwall.com, 
	linux-crypto@vger.kernel.org, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 11:31=E2=80=AFPM Ahmad Hasan
<ahmaaaaadbntaaaaa@gmail.com> wrote:
> Thank you for your questions. I'll address each one:
>
> =3D=3D 1. Threat Model =3D=3D
>
> The target scenario is a same-machine attacker
> in multi-tenant/cloud environments where two
> processes share physical L3 cache.
>
> Example: a cryptographic service and a malicious
> process running on the same host. The attacker
> uses Flush+Reload to measure cache access timing
> after every encryption operation =E2=80=94 no physical
> access required.
>
> This is documented with real measurements:
> - Without TID: 78 cycles (Cache HIT =E2=80=94 key pattern visible)
> - With TID v2.0: 286 cycles (Cache MISS =E2=80=94 attack defeated)

So you're assuming that the cryptographic code leaks secrets through a
cache-based side channel? That would be a vulnerability in the crypto
code.

> =3D=3D 2. Why Kernel Module and not userspace? =3D=3D
>
> You are correct that CLFLUSHOPT does not require
> Ring 0. However, userspace execution can be
> interrupted by a Context Switch, which expands
> the timing window from 372ns to 36,640ns =E2=80=94
> making the attack significantly easier.

Why does it matter how many hundreds of nanoseconds it takes to wipe
the data from memory? You can also have a context switch directly
before you enter your cache-wiping syscall, or in the middle of a
crypto operation.

> =3D=3D 3. Why not add this directly to libraries? =3D=3D
>
> No major security library implements CLFLUSHOPT
> after wiping =E2=80=94 not OpenSSL, not libsodium, not
> glibc, not memzero_explicit. This gap has existed
> since Flush+Reload was published in 2014.

I don't think that's a gap, because the standard approach to
mitigating cache-based side channels such as FLUSH+RELOAD is to not
access memory at secret-dependent indices in the first place.
