Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3815E27E056
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775466204; cv=pass; b=pTil/4LpGIrLkOk7DizwPsTVqp1+9A46JdmNot/9ljVeZ909EAqjtwbGddweRAcT8+XdqinvWudaFp3M49YZF1oCMfdINhccfjj4/AC3nekSUfRdQcyGJnWgHTe8dF41nOO7LmWe22eEuAXUyVoidAK13KKpbQbjgoaqld0VAok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775466204; c=relaxed/simple;
	bh=R2dHTJQnBLz14FBWbb+c8la9tQYirU1vpp38y1sgoA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HnsYx/Sg9ttGwZac/BE/pVpXIXoe6gtlBEisgTBmx2cQErbuYPB1RXcBC9QH8titVp+K2Sw2wtXddrTncubCF2VlyoV0tvuMFdxCTLhsKZ+GgTySAMHd1aB8R97KwMnYQpGJcRt2dt2+2Vhjc3oY2ERV8lLebvalw00HFyxSF5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIATw31B; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIATw31B"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c7e5f38a69so203264eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 02:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775466202; cv=none;
        d=google.com; s=arc-20240605;
        b=WSDP05OtkWD970w4zk7laxj1lWCUMhoh25btLuwEICBBA9b+Q7FJazmVF+YGOKkhSc
         2kgv5eRFCYmwGKGMNZVmieZf8ZPMDGNOhKqWp8fiVAFAeujRaNQWawyNdMMBEbVnq72s
         bXGPC1iKwkYQlnOGj6XFZ5HiOWsoMJXVYjd1rdnoqGrivXbfS6b7ZjzK9ja0M3CJln5u
         TEu20+J06QcuK34Xj1/h48OnFS0k1IfP6+51cu1kajAyu4NPJ8tK69sSxpJJoaPqhrbH
         iazjWVyanRA71IFw7+qF5pt+sU17/BQ2u0SK8MZDsvpMMg9ZW0bMPJeVANBjxUKdsuiO
         1QKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        fh=WZxkmwDOmocVg3LWnYa9AVa1OvtjdNBe3KaSPXyCuY4=;
        b=hEGNpahlw86WblHJGgBnELGlgpt2cX6xe72hB48qC2Y5XJBVmrhe7sHXUYB5cnIJGF
         IU8u6bLbWjZeucWOJR9W7OHdG4mATCH2lMcgtHaEnEG/6slEpFrT87/+7YHqvyi89T8g
         FIH41Jvr9VnX2UsXEiLaWjwY6nbPZ90XJmeqib3f5Na6ZwtCUi+NY4qFHPZaYegD/zss
         RD5F7RO2kOTQy3rJaEY2tA4llVnFMV5IhpvHQMvcqIPWgBhbVBgPO8RZPzxjf5wx9buY
         U9CSCdw8YfpjX5FwUx5RVjeZH0d87x1CEtjmt3wAEMEawt1Yh3mPqBNaKM62IkgRgDMy
         vrvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775466202; x=1776071002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        b=PIATw31Bk+3hkggZjJ21LYlWRCEdonuXrhStaxjfpeEy+RZoMphpX1G6fDXJDfirK0
         Lcix84JqgjmxFvtJfqRfPYEpHGb1ZhF83nIFw3O8IG8D1d9G4/P2un8SlPIrkQlKDQvS
         kAjTgHjN9voZ48IaKsTLutwUAdxm01rYT/4srX8EaIwQURRnjXuJteiO0uary5DO+b1y
         eIHYD5+mctWtaH77V7OyvOW7r4QVs3CY/XzcE6cCxPuvfHIp2DtxiKgzIF0EMRv1ON+k
         6WsWVXYwGXy8FB5vlCj+jWDIFXrgcqNUpc1z7vi6MIUB1fjeeM+HBhDZVaiEGtXGmhmh
         Zktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466202; x=1776071002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        b=ULl3GhVWcZkE9rWub6aOWo0D9Hc7DxyogNcGq3JFXd6SF/G93PC7ZFjHcG+kr1sjaT
         TEBh0wsbICtoGMy37vbjHJg1M8ij7CTZTFoK6KyFgRSHUDiw+JS8lHVUXcYytxWpI3Gl
         isRXpjkTp04LglSkF85FeSJl8Pno0r+I2oe5taNsq9Af7inAcjxsY67eNdIE4YhniUnK
         +XqwNIWRGrAMnPN4u66xaFHFO78wGkYVT8I0k0v6mwKUVDpqyI0toSbdx2tpMGy5s63/
         OvceyBsMakztF8AGKOZAfI2GBtIcKO3anRROxBpjQsk4O55PB4b6+G/xBLWpFbq+NKIT
         R2GA==
X-Forwarded-Encrypted: i=1; AJvYcCXHIv+BYYehGFhcXxw/V6wAAvkFCHMOFOWQWaDYF+jpH7b8dWNwN9i2XbwHuuQYs7CsdDpb4mR7bH2+tMLWp8U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk5xyyY9xV07MaD5afCE5Q5bi5z20w2qPHcGbklwbb80p8wzO1
	AjUKjWykUQvnxgfJ2CaEY3iT92vbmZHyBFYbMHtlF7wJJyml3e0y6da9nGgCOp75Lpr7nVB7lOC
	yGSlI9MPhl5vtYsNVfIwetQkopwSUfvo=
X-Gm-Gg: AeBDies8zpe7QCa9H5LFkOdKc1tkM3pMOnZ1zhLxoFjCaw2NAe1VqY+5dPIL5uG7oua
	6tAMuGtrxQR98dq2RJHJ8X+/k1hZZZflrxj1Vj+vEtylgEtJrl/rj7em80A/aPk+zWmOWvbI37W
	2KjpkKZ2X/0cEIYDpleS3C/KpIiIRzkGbXOBIn9R6y3xEZ2Jge3ycOPvgtMSw3Ai4MRSKfDtjCV
	+xcY7iiWIu0Bpa9clnd2dO8PGtAo+MTeWfFwpgbLzVAtAYOGPlLWPskMK2O/vW8TgzUVnQ9eRVz
	hI1QlJLhisgosZGLawmmzKqKRx3SYxZ8ekUh4izoW7nCgZ0Tt1UIybxiqNsonQEgcDjFwnxa9fz
	mmjjmv7JIfpDbx25BleNFTBo=
X-Received: by 2002:a05:7300:2315:b0:2c4:76a3:bdfc with SMTP id
 5a478bee46e88-2cbf6897126mr2280931eec.0.1775466202269; Mon, 06 Apr 2026
 02:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 11:03:08 +0200
X-Gm-Features: AQROBzDwpcCEtASRfptsJ0WJ2jdyaJlOCl6SPsL-e-w0TnWmNnUbHOjTvtft1Wo
Message-ID: <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 1:53=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
>
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).
>
> Debian Trixie was released with `bindgen` 0.71.1, which it also still
> uses to this day [4].
>
> Debian Trixie's release happened on 2025-08-09 [5], which means that a
> fair amount of time has passed since its release for kernel developers
> to upgrade.
>
> Thus bump the minimum to the new versions, i.e.
>
>   - Rust: 1.78.0 -> 1.85.0
>   - bindgen: 0.65.1 -> 0.71.1
>
> There are a few main parts to the series, in this order:
>
>   - A few cleanups that can be performed before the bumps.
>   - The Rust bump (and its cleanups).
>   - The `bindgen` bump (and its cleanups).
>   - Documentation updates.
>   - The `cfi_encoding` patch, added here, which needs the bump.
>   - The per-version flags support and a Clippy cleanup on top.
>
> Link: https://lwn.net/Articles/1050174/ [1]
> Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.h=
tml#desktops-and-well-known-packages [2]
> Link: https://packages.debian.org/trixie/rustc [3]
> Link: https://packages.debian.org/trixie/bindgen [4]
> Link: https://www.debian.org/releases/trixie/ [5]

Applied series to `rust-next` -- thanks everyone!

Let's see if we find any issue in -next.

(If someone wants to give tags today, then I am happy to pick them up)

Cheers,
Miguel
