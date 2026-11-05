Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793919412;
	b=M9kIKXpAwajrjgpR4DYRaXoFN2GhrZ6XWLCCnqTpc7r0sRhYXrEhc7AHRK9+rTvA+xKR
	 TavH35VHtl+SxmxgFsm/ww/cPw/TbckqdF3/pNGNhDJNr6eAYAitYWAbJ4MGQL9bxMSmw
	 EFQHk/E7KyLoH2bgWNlouuXDbNXCWOxWzI9yFixRHFExGq8JMY6YbOdvRYveczqIYpkZK
	 KNY/ikg90jF1j688WSu4835zeh2NkqERZtJ0Kodk8JSPlKFWNoTuexSPBghfVz6sfEjdI
	 tX127fQxYvVLLJMdvBlsGND7sI5WZQHj2WjVhoihtVsDJHtOaOshsaKZLLqLZwZ/cAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=beWRPlgAl/peRVZEkF/oGc+heGWLz/peIuKHHlXmZvg=;
	b=wYqNpVkjy7Q0kHq7o0jxo1x/JHLqhmuGFnVNpITjKBS49S13Ca2KLggNZ/4xd+MEzlVm
	 Chm+st8lrqK0sYBeglwqJnXurJNgZ4dJ74Js0Ne6gMXanoWLwKTYmdgbR13SoeylLQi14
	 oXT32swZDSWycwkB7QXLH8kcFH1xHq9uFgTZmXM+mdi/WCsEXrRZ3ATzfUtNcvkZM8IIB
	 gS7aQfDKqu8doUzndCvyCz/9Eo0s8HN4cWM82Nydw3ziaWO3P5AmGV1YYpzw+KPLlLUAn
	 D5KB9NaOeo6A6pN1SeTRG/fEyO6g6g/AuUYIurAsai52QztRtRFxHoFKYX8CEgB/YiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XwnFB3pE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD8B606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 22:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AD8B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XwnFB3pE
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4395d31228so5654966b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 14:56:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793919410; cv=none;
        d=google.com; s=arc-20260327;
        b=DXcazAvI3SutZbR3B/te43gsGztZDDmN3gEpVjlBv4zdTH3kKbFbINQAycaLy4sZQ+
         OJ5Ayyzm46lZCie3kI2gBO/Vrv3emVXKFSgaFwnzmZwIuTy70H35Cni9gFTrUU7/1Z+l
         MPz5GOsBlOIkdgpdm0RHzN1w+D+B38kcFG1bcGTXOF5HPweInLhQFlIg1wIqaYGn+F2q
         UtUVuyzYFl5sBNteo+p+0dI+WQo9X9EKaLokzNq2SCO/3JnwHuTBA/WmXlKCP8KthOtF
         nvcSbDeEi3NmjkQ7XmvwXy7ZLmT4tlMgeW/UgBtOPIdaQPV/wDUEAerr1g7kZZMjG09r
         LnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=beWRPlgAl/peRVZEkF/oGc+heGWLz/peIuKHHlXmZvg=;
        fh=DBj09r7iJZLqfs2f8sS/z7ctzFPzH5ZEt4RkbPEXs1Q=;
        b=XfA7YckYxAqRG629CWVhaF5F5xajMXVcbv7BNq2lgrSTDoF8KKEA3vBEw5buAgX38g
         skTZqutTvWvG8Nvt1GPBkz4i7NZRPIEqIGoLCf8d+NUVpwIm/XlfL9WZc8kvLjz4NHhO
         ZQD6UHcHC8LzbSnD4ckx52sEWla8OnrDCj9Xx5jl3APZBXnBjwxeypRn06d0kKPoXKB4
         oGAfYNwebFj80Y/Q0jJBvWbDQVy344APEmlAj92qHX28YW/79gdo8RSanT0uvgwrlrQN
         +Id4MriyBoF4TcvUtUwlT5XcS+l6HWQeQ/ThDmQn/NaWFq59cRFshTWVxyW71tTH4mjK
         nwSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793919410; x=1794524210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=beWRPlgAl/peRVZEkF/oGc+heGWLz/peIuKHHlXmZvg=;
        b=XwnFB3pETFUMoUj/6KBzwkdVdkbnR/jrtLE29gyRh8FQEeJ3BBs0+EBi40SfVeS6Mr
         0BOcZcKLKfjoeZYIQqbPO5EX9XAqc4M7jznEVvkiRNLn34aP6iSY2gxHWZVswUhOJQlz
         1poM9X8uv0KXQIbJEt5Cwld+Zkm5mcQdxg3w6nyhOobhXtUC4/Sv819zuAqqVpYT3dg0
         CBe8O8GAB3xUDzHoU5YIXE+PoPjSgZZmjmpiU2F9OXCsze29bNMiFh0g28yX55wdVXNO
         jbEXQDpUkT12V9VnskV3kAY6RcxRqq6qCSFFWoERQ9LcHtXbhfcOCOR9tEZOoViKsxkg
         OHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919410; x=1794524210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=beWRPlgAl/peRVZEkF/oGc+heGWLz/peIuKHHlXmZvg=;
        b=DWMu9KlHmgHpb6a9+5bTPBaLrpLQzeZyCc48sjTx6PpRqn5itTbmsIIisOpFxcFII1
         4WRfoUe0jzDDx553cygcFhJXL2FQbVGHUq0GKcisT/sCEbw6Yzzt9Auk58kB1jJVf1c7
         LkW5HELbIaGNoyW7AOPdmW0tR3c23KPPMdUu7X/E9DVYTLcLJOYkmoN1a/IZGZd9O94N
         mZpMwaMRj3FbrRnPiVNIw0A4Q1GWiwJ4jhAHGnJN0HZbV4vYmAEWnIdZZcC20QBgD8Q5
         sVFAg7439oCY+Q2HRLiRq0KUQ/iqVNFAxFAnJaTxFWX+tAipm1YkrqnZHQm8IjDJSwIW
         heyg==
X-Forwarded-Encrypted: i=1; AKwUvBxdkCq8rjS1DI3biATTtG/PkP63pgNsULtkRM8xydtwrup1Vz3QWFrZf2oI6LSRv+N+bQf6w3YK4lXaKdPaK14=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hTVJO0E6a/nNfCgHobo/79estG2OMjps1LPleTazqa9iu2c6Y
	pxOjSAWfb3o/HpVdFByX69B9wHh7HRNqdpkWuaX3/NWbSJw3qWGFQ7b1s7auBWYomduH4XH7/zl
	dzphw0TBJEO4GEiNMSHAl6XfPuwHozSgiY2HYdAGA
X-Gm-Gg: AYBFou2Md7flp0uTlGfwju2Wu4RFisFQjUONzkrtryDxHmnFXAcswOSf8C/fmnLCH8D
	V/Xn190lyG2cUhSmlsThr5mEBBKTKBi7C7cjyhYS81YlysZmxJNHNofKjPHIhlPofhNC2sYwohb
	MJqu28p4V9oNyDa2GesfZeX0zRiFBUpy2L9A49j0mZDWSdInLrL9uXku9k2gC17xaojBoAhsVpq
	H4UbLFsZfTNi9//pITqblUvnQThA+SbP5KH4JlWSvybmHrUDMRC7gKgfwV+wANjbxp2HhPTWJ2k
	7HDT8Q4g44bhYcn3jZGf3+93oHRfpaHHPofrLFgHZqvJ7E1sMmAxDSZkZthNCk/tijd3qw/zhoq
	Zy+AHvEhRPDbVQnOc58VjO7dl8xrDenDP0z+TUw==
X-Received: by 2002:a17:907:9811:b0:c40:36ca:9d1b with SMTP id
 a640c23a62f3a-c4d354fc327mr75827366b.40.1793919410007; Thu, 05 Nov 2026
 14:56:50 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102230445.3993629-1-almasrymina@google.com>
 <20261102230445.3993629-3-almasrymina@google.com> <20261103115926.39e092b8@shazbot.org>
In-Reply-To: <20261103115926.39e092b8@shazbot.org>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Nov 2026 14:56:22 -0800
X-Gm-Features: AclHuK8Ff2i-kZKWxjfqjpz2XvgyET4nKGr7VQwICZxEIxfoafnklYeCqUTiYZA
Message-ID: <CALzav=fXeOTXXhxmQKidmO+vrxZDDeecvg2qrPAs6KEWLWPA_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] vfio: selftests: Add vfio_pci_find_mem_bar() helper
To: Alex Williamson <alex@shazbot.org>
Cc: Mina Almasry <almasrymina@google.com>, Peter Xu <peterx@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Raghavendra Rao Ananta <rananta@google.com>, Vipin Sharma <vipinsh@google.com>, Alex Mastro <amastro@fb.com>, 
	Matt Evans <matt@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:59=E2=80=AFAM Alex Williamson <alex@shazbot.org> =
wrote:
>
> On Mon,  2 Nov 2026 23:04:44 +0000
> Mina Almasry <almasrymina@google.com> wrote:
>
> > Add vfio_pci_find_mem_bar() to libvfio to locate a BAR (or range within
> > a BAR) of at least min_size bytes that behaves like ordinary memory and
> > can be safely read and written without device-specific side effects.
> >
> > Detection is backed by a table of known devices, starting with QEMU's
> > pci-testdev (1b36:0005) BAR 2 when configured with membar=3D<size> and
> > membar-backed=3Don.
>
> Should we test for this?
>
> We could toggle memory decode around writing a short, unique pattern
> with read-back verification.  This might be unnecessary for a physical
> device, but per the definition of this function it should also be
> harmless.  For the pci-testdev, which is our only match in this
> proposal, it validates the BAR is backed by real memory and not handled
> as an unimplemented memory range.
>
> For the use case in patch 3/ it doesn't matter, but for future use
> cases I'd rather see that we generate a skip or failure based on the
> test here rather than debug failures in the test case consumers.

Sounds good to me.
