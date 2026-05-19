Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87332E06ED
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209277; cv=pass; b=ZNEf6vvNPFdK2fws1smld1BJYsnJ6SXt57yz9g6S6jgd90Y1yrKP0iJnXoFZrKz8a+64htaLucjVUGW3hqJCKTuRrftQvjUiqkMqmA9Ibm2uLwD8w4D4A1pg0D5KZp47IJDtY1jpCJiJq8rXTRdKkWTfHSLeCIWQa6Z2MAdfKtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209277; c=relaxed/simple;
	bh=ViKPE/zs4gsJozSFsoDM9rzZ64VredtJAzBJtyzJDD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJyiLPC7xbGlC40k4ca29zz3awDSYyq4dK8XgzHKtI0zNOCfqWePmHWVRHZ6/wZbfMPbhFNHpkzFiZYArORMmZl/uaY0BNjyKso3q8yr1btyTbE7xYJyPFzqJOz2zvWkwH4GdOLjFqztvijoxxgjITH13dYFLU1daGZYqpJEMtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qCDj36xB; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qCDj36xB"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c8d0945b3so96c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 09:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779209275; cv=none;
        d=google.com; s=arc-20240605;
        b=eCtplWyaYZq/12QYZm/H3Q8d3VxzqUScCLpfsiOZGIskZnHTehLHD1Ub4xDuEW6O6D
         dHV3TxQ7XwIXst3yzrzAWApwYwhBbAZ6r724W2ttdaZDf8X3uSCovGwXZ+eIRgAm2ukD
         cA+vM/jdWMrbhXxAcZWJvRU4T8V3jw5eDQIfG+50YVkHDswCAyri+vV5Dw7h/S6NqKGP
         rRzr0TMyzedRLeSi7q8mFyCCPSYZSBuNkALOozuSU1dAq/xYy+jLboB+Z8vfEVU8ufUK
         93P98r2KjPNeQZlJe6PJw5AE69TdS/FPWhuRF1XMXl5JmHcL+/qEfIU/XjH2zIpk6xN5
         apoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ViKPE/zs4gsJozSFsoDM9rzZ64VredtJAzBJtyzJDD8=;
        fh=kSJkzol242Y7YwMfQyahX5pRr1XYxiMYiVWvtxtmc/U=;
        b=UODquW1X2hAEDAGIuFejkeR334CCnFo2vV28Hlx494kPB+iU3LegRspbSZMi0TgwWn
         lJh/nVLytiZ2BxTb+7kPK873cd+dHM9zFCL3Uq+UONR8IEN0fNghXjJj6uiQBn1AZKoV
         +VnORXOfZfdyBHrcF6xi0GUp9Bkz7ReTn4wBKoPSMMiT2TMWtLMOJ3hkdEDGCot8EdTC
         yOBMg1D2RJPAyygOY/fZlFTQPW0SdxyCnAvCMqWii4GfavhC0YmekLZVtZXe6BNnycKF
         KQF0W3JP1DOO6Li4TseWl2JIYsy8e4VU66rEYAj1K5cLxvVTu5haHra3iwbKE3vbjW/V
         bUCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779209275; x=1779814075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViKPE/zs4gsJozSFsoDM9rzZ64VredtJAzBJtyzJDD8=;
        b=qCDj36xB+gWsx5I++4gl23aTy/IsknfkUlDdViRQo5wucJqQ8XdghhD+kLpe7INyJX
         D5hDNw4zhXmqyvnDQ+SLTsfjy3d+aAzPtHK4Hf/yZvzw4vcTdOfCgbx45BElKmR12hfX
         pu5c2HaqaT73C2IpAxqMFMcZNTBN0dPwrTcBUBQ9H3m6bZt6mx/YJhlrLDFNw5Cvbfji
         jvAUMXhEKAap1D9lrGHZsUO74k7gq02nBUlPXXnPBlgSayaJKDgXw3EWOzWfApAElNs6
         BfzZRPCYgAd0MgV4u2ao7+QnmxOz2O+5xUIt6DXaGaTbjbG45iFgS0OcpDl/H5i84vQ9
         f0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779209275; x=1779814075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ViKPE/zs4gsJozSFsoDM9rzZ64VredtJAzBJtyzJDD8=;
        b=EbxhmzvqZ0qkoNBKQev3AtLw5Cl8LQJUikRVXqbraOxarDpe22fNwMCgp/PrhJxJXI
         CuwZPKHVaclByF6xPg7SvHQIDhOJg9IWFBa+g6ypUBfJ3hAXfKEXmOjRtg2Go0JkhggE
         rlOazFRB+OtA4RK0wFh8OFv+0omw44QgCSTxTTV8b+8m6vRrO8YXve2IrW7QAtLvwTtz
         RDR3JT4XLVYv06RpgPbTo1y7YHXEyUHIF8ZYFb6VcQjRu+lAb/BcSpWMRYfCwmpiF9II
         U9amOC6OPHb9AAky2d0HGrvocGSqhQ1n8TG6wsHIcJ9+/9gw3rTqE995PbiO59TRkT+y
         FLdg==
X-Forwarded-Encrypted: i=1; AFNElJ+u+feDxOHGRIOg9QphrWT7a+86IcbIdpWTwrQLKqDOpTs8mrcqQu5y5EPBhOBOqX8VZlG3rsEWeH4dOGAm3YI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1lUxzDWJMsccjTMedXcaa+HmcM9NhLNegovCgslf3Kfqz6nrv
	ybTldVOj2SiUZD6m9xjaqQnf9YAJUsazJu4JKlBvGbOvUbfsV9iwsQRqVLWRYW5DGnberN70wqM
	c0zfbPIUUubqVpvIznrd6J0kDkXZiLLNwOOoERpv9
X-Gm-Gg: Acq92OHnS8AJsV8B2bz/vXyHgFcEX8ZA3RcR0THvhh78zXkDDPCo474USzNHRGfwykt
	8pNuuzZRhQwtyCK8YsqNvI9HfePGMOjTF8Eu8Yhtn8R0Sr5aOIw8QRcCydfkPV06x9uKsXQIQ8J
	sJ04rHYXcHciF0tj06BHcH8UAtZJUssSrslaqTOCzOwZFZj02pUFJcBJH7LU+YBjFslU1X3iKdM
	szvuXzqc4r3zQwVeW0nDFTJowhud1maf+G2wpfUl7g4Zq5sUkBEjmf1QW7yvwwNFIlHriFCAG4k
	xLD2IWMSCuYLI7flmBE6GqRKHwKm/yr4wNyHU3dhED2Uw7Jx
X-Received: by 2002:a05:7022:41a3:b0:12c:2ed4:6314 with SMTP id
 a92af1059eb24-13557dcef85mr326451c88.1.1779209273823; Tue, 19 May 2026
 09:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <F78521DA-08DC-424E-BBE1-231BC900CEE0@gmail.com>
In-Reply-To: <F78521DA-08DC-424E-BBE1-231BC900CEE0@gmail.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 19 May 2026 18:47:15 +0200
X-Gm-Features: AVHnY4LvG4Du5d39_T67NOwKnozMptM-y7xFRUTkKn7VXkYMQfWRo6DTkXiA7Lg
Message-ID: <CAG48ez0KsuR5z4RDgxWPUoS8e_MJzF74RgFDJayohG48A_N0PQ@mail.gmail.com>
Subject: Re: [RFC] TID v2.0: kernel module for cache-line zeroization against
 Flush+Reload (CLFLUSHOPT + LFENCE + REP STOSQ)
To: Ahmed Hassan <ahmaaaaadbntaaaaa@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kernel-hardening@lists.openwall.com, 
	linux-crypto@vger.kernel.org, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 11:47=E2=80=AFPM Ahmed Hassan
<ahmaaaaadbntaaaaa@gmail.com> wrote:
>
> Hi kernel developers,
>
> I am sharing TID (The Instant Destroyer) v2.0, a Linux kernel module
> written in C that addresses a specific gap in existing security
> libraries: none of them (libsodium, OpenSSL, glibc memzero_explicit)
> flush CPU cache lines after memory zeroization.
>
>
> =3D=3D Problem =3D=3D
>
> Standard zeroization functions (explicit_bzero, sodium_memzero,
> OPENSSL_cleanse) prevent the compiler from eliding the wipe, but do
> not evict CPU cache lines (L1/L2/L3). This leaves residual key
> material measurable via Flush+Reload (Yarom & Falkner, 2014) after
> data use ends.

The thing you're talking about isn't really related to the
Flush+Reload side channel attack, right? You're just talking about
flushing cache lines.

In what threat model would this be an issue? Normally, the goal of
memory zeroing is to ensure that sensitive data is wiped before an
attacker has a chance to physically pull out the RAM from a machine
and plug it into another device that can reveal RAM contents, or
before an attacker gains physical control of a locked device and can
connect malicious peripherals to it, or such.

So for this to be an actual security problem, the device would have to
keep running in a sufficiently high power state that data caches are
not discarded, and at the same time not perform enough memory accesses
to cause this memory to be discarded...

Assuming that this is an actual problem, why are you using a kernel
module for this? At least on x86, CLFLUSH is unprivileged, so crypto
libraries should be able to just use that directly. (There is the
caveat of what happens when the kernel migrates pages or kills a
process, but that's a larger problem.)
