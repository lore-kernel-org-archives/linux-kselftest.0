Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B320433689B
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 19:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417762; cv=pass; b=bTOuivZA8I1eosGR5/Grryi1d30Qm0oE2adlH+AzT5wWMXpKA9De09JmZBrfQXNvGpwo0CtvY0WMy3mcZOWh8JMcrYF1488SVsiXNqN3HDg3ZxnyKW6CncNBSdbVNu/cXhhkYy4x7wlyMpKJm4UNGWigVY3LKJ/t1AzAuIxf/kU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417762; c=relaxed/simple;
	bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qme9zDZltm6sH4Ane3jCeD7sp/J2+iZUZwL2BOSvG6NMh524ZaXg2gB2H7b4kvOfZK6aRgIHXyjVfDX1TFGIYYcsKyoKDzAhyGrdI1dM+InFXR+l9Qc+GZ90/uuGD5xmhqi66HrPDsNIv0TMmL+yyjXPVqcPz+b1ciJzxsxpPMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkjwnYb5; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkjwnYb5"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2cb19ddda43so250273eec.3
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 12:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417758; cv=none;
        d=google.com; s=arc-20240605;
        b=NId96qoWBM54ZorVJUGUhVO+HLCx1IK7gZ0oVtAP/ECuoHtkF5gTUAzyqYYKH+yb4n
         DQrzgcwtXKMn1eAgo9VYzW0AAlbFeGQwLIcEKHec32AHwcdbQ7dtshirLFH69NdgR5Tw
         SeoO6P9CuRBqmSms4rknvEumyXNof/ZxMaPzgYC1muGDfYpYk8E4+eKleFUXwmIESPEd
         0EEpBFS3RjRUahy/SoJtel885hVzFyrcFKxtK0hUUtc5DehfkX+u9LM+2KbMRjZbb9AN
         wbLLyKCaGoTedk7sW6ESVkshIezXVNJqxJj2WDY25s0u/NJyBDnFAV9H+Hj3pGomVf4D
         SVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        fh=PKzCeNd0rmBA+IpML1SENMGRN5yJ4UOfkPMHSwZLvQ4=;
        b=bgE/Y11vkDiXhuTfgFihSqEcemiCpCsjjZepeqFQkQwlXTTQ3imkOGQxFkrXQGL3aE
         LGcNSY+ftnhswJ3E2NLw3OyhlsuM8965/sEaDjbL9kvXDXE9PAl1EJgUxrn1mvCjPlgz
         P0Wg1LL2V3UX9Qz9vh9Y02HESTwYZFGOp/19AlF5xgTvJVMuP8ZnnNS+jYPwg35atbQU
         tszbV1SVyJQR2rI1Me1QOnWvynS1/b7fVEVGXzInsnWJ1qJaWbhgyCcmX5YfNIRatond
         Y77qdlPoUMzegFdXm6yZ6Z/a4HHCIqOFIUYQ56X8YE1Itdf6TrjoLbCVFZLWrcx26DO/
         LHKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417758; x=1776022558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        b=dkjwnYb5y4irn3yDwTic9/zkksmlrGlrcEaDqFrgrrBW2e5KW968xLIRMImwXpMYQR
         ecd1jPK97TvMf6XLAIWhx//UcshQ+msJ11OhHDADc70LU0IvyPC4EIhswfxfuUEFj7qI
         hWDiTqqbU8wBneTz9NyHY1zo75vOqRbvAE/x7Of1tht2oUpm13uX0Oscy9CumKxtRD/9
         u/o04DvH05qA169PQZzzB8juPZXRVgfukM9JTCUj9f2+wlsXYVP7ceiu/B6ANv6bW1tU
         KzL0BCX4ELXxYzoT7TXNvopypQdjHof5W6W3JgDpUBUqBwpEhhcENd/OGF2CaddI+TWR
         HrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417758; x=1776022558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        b=X72o9P2z6s4vRuWxobMiU25M/BAP6HO8uhRw5QO9iQttxOxMX1bi2NMjNnm7Qv2z1y
         AfjfpHhiwi5WGssRoYR6uoZq7Ezh1Q0zZTCbjC8fmMs4ZQ9kvDnfmqeb+9cDXeZWsw23
         CKKwdXViTuTad6ONjdIhnUsmq49/o4Qrlu2nBvg70KPlgX0hSslXbdY77G8+UhLWT+JF
         LYy/hdmegrbGmJ0HTffkXtK2fU+bMEKRRdkK1r0cD2v3syBR0z9IyAQmzUV0/jVf/BX0
         9+YHs0Cgtll9G7jDNtZMRuo8nDhVKYNAgyu5QTqH1r/U85kF2Pna3DkU9XbZTFNZgJ9Y
         iHBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc4Ahyropzt+kQDpBFC3Vvfs8fZUR7WmEOo/Foqj1UarPcAagSVNT0gxxVyKGdAGtswqsDzbsSsLQ9xRdZ0yQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0bCu/E2Uilh+dHza572kfpIPLoGqFIpqqSQY/ADYuy7OCdS9w
	W6Sas9fB9EqX42saqRtRtmx2sQ/SgTdfoNS/mzDJe8KJfUWsNFcrt3H0hH4JtLb2Kh8TXrNwOhO
	/m0UVUsZ41dCwcP7UN0KjsXNxUYwhRQc=
X-Gm-Gg: AeBDietpy7HmGq3CJC41oNtAe/Dncs61CDe8qE+4viC1lKFw+86puHIN3Kxbix+ZAaV
	t/7iZWExiiAsYAxT+2MDBr6TvCA/R8Gw76Rw8Ox3u9ei8bn9J6X4bA0gCKgaQBzAy9rSrSkyIlf
	Wa2YPvGXUFKTO/ZiGjVCDWQExz+zWIk4kHd3+M0rpOUbVwxUA+FwsXOm53XyJa/F4YdJz84xYeH
	MECh6PshLpDLq99xdYwJ2ce9Kuv2MOn597XZU5vBl+LdgfZuqxpL2ryMnBUPyYX4KcHPSLJ1g35
	6+ryQXcvVGB4ZzlYPeAb4AuNKP137tANMcUgQ/6rrfw741dwyb2LNYyIzbEuaFX/cKqJZuQj6iv
	eeRdKeoxVvmhrj4Tc+MFqMBA=
X-Received: by 2002:a05:7300:dc88:b0:2c6:7f49:a862 with SMTP id
 5a478bee46e88-2cbf9afb2abmr2166610eec.2.1775417758303; Sun, 05 Apr 2026
 12:35:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4>
In-Reply-To: <177508434465.73816.4492182082440539007.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:35:45 +0200
X-Gm-Features: AQROBzAMmQ2fYtLyUeAFSvUDsVE_iEOg6GKNUQ48f6LlPWNoSXcMUKGWx0A_W0I
Message-ID: <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned packages
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> RUST_LIB_SRC is also mentioned in the nix section, do you know if it is
> still needed there?

Yeah, that would be nice to know.

I tried on my own, and it does seem still required (at least with
those packages mentioned in the example). But perhaps a Nix user knows
of a better way to do it, anyway.

So I kept it.

By the way, I think it would be nice to have a "standard",
well-maintained `shell.nix` (or a flake or whatever is best nowadays)
in the kernel tree somewhere, i.e. one that is known to work, that
covers most tooling used in the kernel, etc.

Cheers,
Miguel
