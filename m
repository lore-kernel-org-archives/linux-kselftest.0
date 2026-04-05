Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A770C382F0E
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 23:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775430955; cv=pass; b=SjQH4NdTFxQ72ENi1a/WK+RoSIjXBOcRkP8Z05RiTByB5CyludGj6pBtWEcZb4umqUlo8MB8/wns1ZzXPGWX1VazbYc1u5cBP4AmfrqVGC1/evnTL07ff8hGT8F1rkTfdRdFdK7NuwA5LKKtd75/mEk+OPs1Z6K9tW0UssZLSMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775430955; c=relaxed/simple;
	bh=DuXfeYCW4QOQ/5cD3aG7nz3kn7r2sbXuLr+omP2BF5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JsNUqP7tGJfkuA//WlRcVJQo3w+1QxEE8fmtQHm0JNOXKwwFZl44rmTQUtc0rM0TFqe8CE4/Ssv5qgNmzULLNumcGNHoPJ4/7Pfm4ToW72c4IT9vp1Y/q/djmy4pVIkBcJssatqJfqVzWfHkWoEvw/sRRrFbO1RIYpj9aRzjxo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgPU9FAH; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgPU9FAH"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bda3b4318dso224428eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 16:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775430953; cv=none;
        d=google.com; s=arc-20240605;
        b=X8YkPm7vXRquSNofkUT43CvQ/vc2SK81gz2magJaFV5IO9M/grmsZUMy1OLoxyYPK4
         cUMYgO/EFZ0TTUIa/TxzJucGiuzBOMBDAkQFPl243w+aNw2m//Ykqquh77XLs/v1fzXq
         r1cH1W1KDAChLysu2e53uHoIQhy9oSVHHUk1Va7bkvSl6EriVCJ8NE2RruaBSqihokEi
         g05oocQRi3cX/8Jub9ryEMDqQTsHT+9nyrX3GSa3X7OCU0hnFz9+P8PCiz4vtCNWBaEi
         0SE5TVGKXzfsPozpZzSe8J9nbsxB9T30iQU5KxPdbKJoXkHSFu8pdkyV7CR31bPgdhyI
         lJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        fh=C12bkGNCC3wzihQqiuZWBSatEbF5nSxGW8D3FIeIH0U=;
        b=EbdP+W7rww7tIrl8mprtsrXlVdVlwYvdl9k4gfjx6GpFZHtrDIGw4GUdydNZ+5u9AH
         KjVpZXRWnmFfnD/DyWnW1/T8wzudWJAvBXvpoikn19NfsEDpkrnBQIbhnH4/M9CZP6K7
         4vuYo1jFYIawPdzb7znW4Xiw0rH2MZ19nNZYe4EBz7ELK7eoxtGLcviIF5ycOtjFm+HA
         BAlbeqlQnQ2853Pc88fg59S/TTWMxxHQ9wW8PqqNOI5YxjIDOf9f5L8mDRyERY+GTBKs
         j02zTIRiOky+9geM9AU7vV2FHxAM7wd9Ntoh6G7fnqG57XPfU9vNanzaJF8sZWhan1jf
         tFAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775430953; x=1776035753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        b=BgPU9FAHd/0DkGlhrPlq+mpFnKR9NanttH63t5+ukkWgo5r8RO95uUTtwGBZKHEQwJ
         mStErKJb4FphO/b2ZSD/0WR/O+KkKxVJfDy3UeE2b1QtAHU8qWLxLd++b2mF7gvkf7Gz
         DWf7Xp/HFWYCIyuoLxxY7GaKfMM+x85lbUvItA2qG2SZXcaBwfimoBTBmCjGa41gMQfv
         9TFfzhiMWnVPAME2Go4HRHwQW+gUMJGk9H5LQGFHtyqTybD8Gss9bCdr7Mvt2zUQ08EA
         tseXLLJRLPrBlYCL0huRsKFFMe8T9ArJ8+fxn9217jpGlIoeoBdUX5p8aq5X8rQuLDfs
         j2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775430953; x=1776035753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        b=ZjWZZ6Sus3KSTlDZRDmQRiupjFCDuI4qHGaInk3IWDyf1kjkMLs8qpN0XTBCXHsGCK
         I+qj5LZSbZUwY5h/imjrgAFXT8J1NnIG3rtRhovI9j7NApqYM5hXHkMB1FDUFnQzE3C2
         t+yVLqhahBOkvfMRJH1oTntw3oz82qHKDT7yGozniXSA8y0/IHoVakWivySGsyI3HJQX
         VisiTH4EpFJ9c3XWCNAbYh7ZTkiJt/tyFxLqQBkfn+TW3XH6+oCZnShwOoCrK6yBtvVW
         KF4z3aWF6pe5FIGVAjvu6DciwH52Aneyt7ZGRm9GNKx4j9vPY0VkLvjS69OJPs2Fd1QO
         ke3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXc4TiahbXlV5V9xxKYCkPjJoYBdpIEqWKL+tdtxPBCR+Fua0N2iD4RMnoMdHxqDV4eKK7MulwnoAjklSqE7mA=@vger.kernel.org
X-Gm-Message-State: AOJu0YypqAir9/o4fDGUgAVQWPp0RuyENbFvAB4P7Wfuc1ojLDyZuOVc
	OcE3qTS5dd8KWcLc9nJ2hWc2Xe/r14NiZA+aQxYw5jFEoZ4DWsGSMWnSvlsmS0j+JYlgjln0yZ5
	/4HQmJegm4lruwLA+dkAovfLc20alWh8=
X-Gm-Gg: AeBDiete4hf5JaTmxegJUuItFtPuoizsBXHezGrLQA28KosKbuKn89l4y6kFI3Jo3++
	sGc3H4qewyXmG3YSwvpwPndiHdzcbfuXT3bx52aKddKHl+0h/ENe7ejN7gUMTptmjIERr91KC8u
	X5oBD2GVnWKJVQAE8o4r4EQcXjZSrHyCiScxd4ellOhEqcbkzF5ZDbyr65xfF/OAnwQMoBArscC
	IvhVmwEOOQ4wI/R4KQ+4E13iwoFl1YRrpM+GerFpgpshSCXW21XKATFiD5l/r7ymhmIdSHPcvCt
	Jxq65caHSWkcfJgRgTmxOFoEnwVfFQMrKDFzTkWVxZD3N626jJhurZSG2ryOgr4vspGIfbIWnZ8
	UOJmM1WnYhfhqhpWyhrRwmu8=
X-Received: by 2002:a05:7300:fb8a:b0:2c7:3a7:c795 with SMTP id
 5a478bee46e88-2cbf669b785mr2053063eec.0.1775430952689; Sun, 05 Apr 2026
 16:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-33-ojeda@kernel.org>
 <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
In-Reply-To: <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 01:15:39 +0200
X-Gm-Features: AQROBzBr0aNQIDV47zgxZ35JmTq7j6zQBNm1bxMAs_nutxdLV5rErBhW_SWV5gw
Message-ID: <CANiq72mTaA2tjhkLKf0-2hrrrt9rxWPgy6SfNSbponbGOegQvA@mail.gmail.com>
Subject: Re: [PATCH 32/33] rust: kbuild: support global per-version flags
To: Gary Guo <gary@garyguo.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 12:28=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I think I would prefer moving these down.
>
> The current approach append the flags to all variables, which will cause =
the
> following equivalence to stop holding after the flag update.
>
> KBUILD_HOSTRUSTFLAGS :=3D $(rust_common_flags) -O -Cstrip=3Ddebuginfo \
>                         -Zallow-features=3D $(HOSTRUSTFLAGS)
>
> (Per version flags doesn't go before -O anymore, it comes after HOSTRUSTF=
LAGS).

[ For context for others, Sashiko reported the same and we also talked
about it in a Rust for Linux call. ]

I have been thinking about this, and about potential other ways to
achieve the same thing. I think the best at the moment is to move just
the `$(HOSTRUSTFLAGS)` below, but not the rest.

The reason is that it is closer to what we do with other user (kernel)
flags (e.g. arch flags come after the general ones). But I am
wondering if we should/could set all the user variables later in the
`Makefile` in general `HOST*FLAGS` later in the `Makefile`.

In fact, there is already a limitation with the host flags: `-Werror`,
i.e. that one gets appended later, and so users cannot override it.

This may be considered a bug, because commit 7ded7d37e5f5
("scripts/Makefile.extrawarn: Respect CONFIG_WERROR / W=3De for
hostprogs") says:

    While it is
    possible to avoid this behavior by passing HOSTCFLAGS=3D-w or
    HOSTCFLAGS=3D-Wno-error, it may not be the most intuitive for regular
    users not intimately familiar with Kbuild.

But passing `HOSTCFLAGS=3D-Wno-error` doesn't work, since it comes
earlier (`-w` does work, but because it turns off everything).

I am also a bit confused with:

    While this means there is a small portion of
    the build that does not have -Werror enabled (namely scripts/kconfig/*
    and scripts/basic/fixdep)

because it gets enabled in the build (I think it is referring to other
targets like the config ones).

Anyway, for now I moved the expansion of `HOSTRUSTFLAGS` in v2. If
Kbuild (Nathan, Nicolas) think it is a good idea to do one of the
bigger changes (e.g. for more `HOST*` flags, appending it even later),
then we can do it afterwards.

Cheers,
Miguel
