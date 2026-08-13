Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454CD43B484
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615460; cv=pass; b=GRrtpLpOavN+yrfG+KoPReWB6NB+RHOmL8G0reMuhsl0zXwTL4v7aGQvNrz7RsGteQEF2EcJXAm7WUa4xXqR2D+gXydfSwNFos0B7M9+vbxpwcEtmWQXRb/sGxUoFKFCl+s9e2lI3q3FTP/yWfui+jy/b3M/kwjXTozjr0E3vPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615460; c=relaxed/simple;
	bh=izncAFina5udvh82qhiR9A/Ymo2QgJMmGzIkcJM+wME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPt/JDmOpuphN+WdZ5bULvCYWwAgrywjveQ/15n4mqr/efTmS6RoSggsZpOZtDkhxVHjOFYzzWQqx5eJD3hqN8zMW0zPicgqE1L6/l3fR6/vrA1ndW02N6wgw5ama0hzQhP7KLGugne6a7seEikluhcUaYPHjdNhKnW6unPJyPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFHTrXRV; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFHTrXRV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cad68425a7so2751375ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 03:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786615457; cv=none;
        d=google.com; s=arc-20260327;
        b=qDwu+O4sJlhKazw+kChvDshjrrqcKwW1KqUsAw8eLH7XRM0354MkKEfoHBgtoCgBj5
         wuKJoRgsezt06gCQxZMnhk4jQY/DIPAQclpg7XeBDqhqyzUaxgofBsY07uEkp8GlyVr+
         B8oyq7Tm6EaZ2dETAxta28mfuV6w9EXMgD4tMmZbEVdd5z+C6lrEcTXB0lGmxpAY0+B8
         p+XNPJBByhUZG4h+eYS2bmGC/DCvrzIrGChnw8pTy89lA68gzOq6rpgkOma1f9gmzm1h
         jdt2mxAHOuKJ5+CdFqkx+/PkE9G0Fp7pWkRiKsSAH2qq1yrTtltioAPw1sPUG9BHcs5Y
         aQeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tMciaZ/JSlG6Z7DNQJEd4FD/fd9CJYl/s1BR40smNTE=;
        fh=ZLTO+0g/yUdQZg6Zld6T3LQs5Z+4RfeaOGqKkXYwZ+o=;
        b=DJFLyH63t8JgT3p0zpfGkBOH//v7bPkATGnZErgyFkuzvL1bVIoAHHO7vtgxbaooJt
         vN8FPvV0kvlGT0V45CfAaSzHytHygOIRNemM5aCqR8Z7v/LQ+qjMS6gTbzzXYFqLxL7g
         Pm9BLUaTQQmnaPJ8LNzG0byqGynn1aPTy0NjHeKMDZ/W1oi22yaiMVv+aIeRFCymYzV/
         RD1mTw+GwECnMcsEQYThfsqjihW0DQlELj2DqizjMijg1+8cF+x/5hk6MOOldgyj1Cvn
         uwTuEkzvAr2vnwcvHvKvZKlI01I1ZTCvAEmvnNx/ims3uQDu3ZrozTe2L5HVqdnVGbGT
         IDJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786615457; x=1787220257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tMciaZ/JSlG6Z7DNQJEd4FD/fd9CJYl/s1BR40smNTE=;
        b=NFHTrXRVpZQTifaiiAeRhSGvfW/dP05MC4U1EuRQWVJr10hfFTND65+3+8jb93NkKj
         pyVgNvfrsAHjJCQSlBnv74kIuyAGwTSHOr/dBTUV0FlXohKVfuehKEUbu+Xe3QIPOuZT
         xyYOmMs01ckolTS4zDf1GolYHoz54YaFz1+Jivey5iRPUdra7EMw9Z/AYpSZUXI96EKd
         3/FfoMhZEcw+UBCPoCbiwXXB7S4RQ9x13SiLR20aVLYVohDLsUPCpyg8prA+dVsmLDAw
         h9GzD11ijNfTClaEZMVLRNH9dpACZ2webaPItG2U1BR+OiDQwMwbfXeiDxCLD+bWtAte
         hzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786615457; x=1787220257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMciaZ/JSlG6Z7DNQJEd4FD/fd9CJYl/s1BR40smNTE=;
        b=tDmSMxIZL7HBil0mtmD6d92IHkztLNLl8PmQL54uRnKzxadahjtzNBXXz+fVqHYSd6
         h05Yr9tB7n4nnWHbwNDCX3X1hZpAZKa+TCunICTNCB6tJqWtJrn9wG+qeD1YJwEnowJK
         1P8JfZB4Bvj5qSXw/k7Kt59BeVXMe96rclirBVP7G+iI/VF/c8GuXIHyY7OXr/tuoRGe
         q42eAUUkV4T/luN0eQiQxD+MY+GRB0c/GbKs/HsS0VWtKY09+BpkOmLZ582wTTtFVcpU
         365qPlZQPLDRXl2MECltfiHOe+adDDhNw4c2F25BtiwkgDkGThFh0A5p8JXpSg/1ws9W
         G/2w==
X-Forwarded-Encrypted: i=1; AHgh+RrOqLF3sKSlROyqoAf5X9CRtdRJQQIulAUwbTJ/1fVPeeij+e39Zws9EAvTy/lZL60EHULsGm1GZuPybrrLwvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRp91UCiGEWpAPO4mmf2uuoG1zdTj2hWMlBfEo1iaY/ndTq2oq
	UFcSHALm8xMPMBwe3F6bAAk9AsHuYw4opmsp7vj3PECFv06kO+eAW+Cr7WYToFsssPWuDFvQbl9
	DAwGW426P/u5/Az2w7z21lMges+xiJx0=
X-Gm-Gg: AR+sD13n/sEqw9hDNNq/cvCoArWyL6eJHeVz/0CSq9jM7jxGLwaBOxB6Egla0iH7RbF
	errrDQUXKw0NgkQhdfMFOOpdvkf3MzWDYXzUMHL3tFydNHA2GgDbXQq2ROeUIjT3EhUAeXO2vwM
	c8zL8tee8Ac7/8AhBAC4w61lNPWsXzNsU5SPRs+wT6LqLQgl/uoeV7TnnzesAFIrhAnZiYgjyhL
	eF5TNRjaeYnnx9LoaymezIQYfLHzxu4KjCpkEtpnsiyXKsmUqu4q9x3u2GcrV8ayf5rFROxGRsu
	aSD9XinaRX2sMC5zo0455jjVfz60pnk40gqDjyfb4fAPiDMqg/CnVG87JdRQHBxT5ckr35+is9j
	tBRFtD6qVxRr/y0R7gjmTgbxUSmR1JACYlYcZQK5GM93n0lUX5R1ZR1XhyaH8
X-Received: by 2002:a17:903:19e6:b0:2cb:2b50:d9da with SMTP id
 d9443c01a7336-2d389b61bdemr35547795ad.3.1786615457444; Thu, 13 Aug 2026
 03:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com>
 <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org> <DKNDF3WD27GM.5VP6RBRXZBUS@garyguo.net>
 <CANiq72=SP_nT7Z6NSH-GT51-8hJ8qLUa07Cs+SarSFTO9Z7vUw@mail.gmail.com>
In-Reply-To: <CANiq72=SP_nT7Z6NSH-GT51-8hJ8qLUa07Cs+SarSFTO9Z7vUw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 12:04:04 +0200
X-Gm-Features: AUfX_mxe0Lg9da-FioFXEgvJltaWUVJqtXi0b-R5y4sq5pbip1KqobICrYsDddk
Message-ID: <CANiq72=Whd+u0cA88++KyeOQQrsBK+NqK-586jNX7L=_Ocixrw@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>, Alvin Sun <alvin.sun@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 11:32=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Ok, done -- Danilo, I took your diff and converted it into a proper
> commit, please double-check you are OK with the Signed-off-by:
>
>   ec6fcf8a175a ("rust: kernel: add `LocalModule` fallback for
> `#[vtable]` `impl`s")

We also need an `allow(dead_code)` until we actually use it
unconditionally: a2595ed13816 instead.

Cheers,
Miguel
