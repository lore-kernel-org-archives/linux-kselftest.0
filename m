Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2704641D648
	for <linux-kselftest@vger.kernel.org>; Sat,  3 Oct 2026 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791030453; cv=pass; b=ci+b6Djx/Ca6Wo5YX7wtQMmVOiswAKGAEgw8GyYRqCgnrG5bb/rGGvuDZqpYsWqts/R6gEYjKszrAQntmym6uwgn68gNH4UbH8GS5bd4I8QCinfxiZbJXf2o6/o5BGJNfkM/5kspYmF5aHcdASqpWJRC9FaCEMWtLSpCpCIabZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791030453; c=relaxed/simple;
	bh=WRC2ZsAZuRhunv+s3RLF4cY+obMu9wORkIop+4QLO34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Djvdo9rSyo0GoC9DVRIzq3AAenSW5zEyDHUsaNtUIXR/l6cAk9tBQrgozIhnC91k/wL03+dIfMoRIOQs/uGmMmKvpgLnFoJ7benlZqPzwKrk1Nl3RmUiIaIAAOZk+zHg/9t/6+qIUWHOcaaJ3qraDTelAHNAAtHtK+rs54P4JAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjSNRv0y; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjSNRv0y"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3511800bbe7so21419eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 03 Oct 2026 05:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791030451; cv=none;
        d=google.com; s=arc-20260327;
        b=OBqy4k5y80Gz1JdI4AvH7REbisCoAHpi3VeQ4G+OlhOotbOkPgtEgqApOsG9B1MBxK
         SByC367qNsrmHyvUDUaE8TISjQ1xbjcLNW+9YG6V3lRcBJcdADcPCwUNuweUYI2BQVQb
         9UQPei+bChF8J4gd2WIY3laU4k3AuNBgR+DjuY+uNHws20N9jpxjabc3d5HeDXvvt3H6
         LX+qzqOh6Q6NW9ktzAeJ41HN3KjSfx567bNTwNjKq6lRq/NUjWZVQApngoiM/d8+7b8q
         u7eZQ8bsDZBoUujGE9qoYV4gKlGwzFTwv7eHlgb9w8AxmcyTWrVxCEQXmOUP5ONrfhHU
         n7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nciWRX1CeabRFxS/ww+D7OfrWzkB7f8+tgS0WiLuSww=;
        fh=z64vYLqBaLb/FMPgNSzZd50eu97QzWBTetK46MjWzaY=;
        b=lNAjWNN+X9Dn3hU5GS4y1PZO2+2z0cQBlj97P9kyKq+kjLufc5AaMWoTnOSCbwIUWh
         +0yFAJIjlPtwOIGeh5f79b3K2sCMiEog1ntV/168nfE3WKQI+vxqgrZlpZgX5bDU1sUY
         jiM0sAhvTt2lP0IGrf8UctpWQcJAJ/iu32vkL88XOypSxgomTyQGe9StJ+wzFj3QTDQ5
         YPetKxvVx+bphiZZcnOl+PtYecNhBs6DC0Heb6L0AlGSHWgT4xbPnd8BuoheNRwu7nVu
         wA12MkRjLqQor4LAA9SIE1T4aRfq7V4ZIQwbrO/RnWrnITFSsC7QZe+KSL55ngtjn7EY
         5c+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791030451; x=1791635251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nciWRX1CeabRFxS/ww+D7OfrWzkB7f8+tgS0WiLuSww=;
        b=kjSNRv0ybOUgtC77f6aGwITRN702J3l+Hqyl2QHaEz4kol/+imfE1dT0Yc8jftJV1e
         RDwJpue6M/tIRgEJR3eu9jW/jHTRlgwnLXbkkGKRbCjXJJJJ81JWp8uhCJdUxYBWvu7a
         eool3WFVRL8pmu2IbNUS/c2S2PZYyUzx5Z2kfyqr0BAvYN/f/zLhvtbja38+F11Z7mCr
         9aWVbi9Yq0I3lUqf+qG5gKQDqnfc15VEqmj6vvRh2BwB68hcu5xtCYrTUC/20eOQNAjm
         +58wN7o3GTdIXAN63+xW/1Xxz8kiNuGExFhPa1+QNyde5HqSHfdNCIsVpCCn8Fwf4hoo
         p/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791030451; x=1791635251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nciWRX1CeabRFxS/ww+D7OfrWzkB7f8+tgS0WiLuSww=;
        b=CHOuFHUyHIWtJ/UhNfP+D012ZUMa03BHSGg2DiLC8hXZRR4Y8Yswh7ECmmI7ioOYpo
         rs2YWIvlugQAcbi/zD5FhfpliRlNwLZyzievwK7cdJ06zccwyh0LaOqHnXfB9fLJ+wSM
         WdSL4TzPKrl33W2hxxbnv2yBBzct515XUEG6DgLg76lq+q/MYKR5837ZI7Rc/jPjQYCI
         ZLKBD2RnATmzlqXXyx8ciVJ2ML+TN2c02AvyhTc5nHv9sx/nDGTiUZ+NsJUHr9LBunHL
         F3EYeS6loPl4h23CfymIV89oXvx9KvUIMv4BS+nxJ8jxJLopbcLAZwV1ZzOgJ4dCHVsc
         daCw==
X-Forwarded-Encrypted: i=1; AKwUvBwVMXvVDsi3c67XOx3lp0Lv+XYmWbHzGtJUoGhqdHFMX0fpnbf59ixnDf39iLzK7/ugn1V9lv4K4ehb8GVn/+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGP/fN2aAsQRr4yKJJqEGxIv2pdzCPtNCKps1d5Vde+Nukn+Jp
	XPDf0GSy8g/w7Q9GPs1LIA5Sp9DA14toSMtPM41J833WtRn7jmkgXdSh59la0gRtDYMT/xQ0q9K
	/b8459P0A4cTtd2kgGO7ru140pAY9tr8=
X-Gm-Gg: AYBFou1ClWw45RD+fFIbvNt2Ib7nM0sB08FBkRzDDsFm12czZ9y/Cur8enENCP6DF2l
	HJAbr/e+8nOsLkRV+2p+suKIQkVzGbqZOQiu9mtJsZNX5mCoUNWy35OB/DZ2AiZlGwMZxynYTKv
	rFzzX0kfurn39ogZm37T9NJX1nSFXbWlhQbU65B3B0kVp+K3NAJnspnxxQ1QVc/9OQg/ri9Cz29
	r10GsMrGzoBpqAHsXWZLittVqF+C/qcPQ2irHjy5CpQo4k+IRXDhQHUER7sAtnw1fELr+RkKJAL
	z3CKwExs4g2VrcBFTJZrhwwG8LscKqLdz1wOdHJrY4lMb2wYveFk124qbRRyak45A+/Ac+xno/2
	9Glp/jNJLCqhCono/appT9Ic2n3m1lz+PiRUMGQ/rtIqfMRMNCXKm0GjANINYSX7+jN8FJVGxuf
	jOrumbqqSIJ3yKcvlqfNKI2VY9YNjo7bp6wZGdnMZWZDjFkGuFLpI=
X-Received: by 2002:a05:693c:8951:20b0:34c:15b5:b4e7 with SMTP id
 5a478bee46e88-34f1503d60cmr10692389eec.2.1791030451112; Sat, 03 Oct 2026
 05:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-kunit-v2-0-eda3ed6c00c5@garyguo.net>
In-Reply-To: <20260902-kunit-v2-0-eda3ed6c00c5@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 Oct 2026 14:27:17 +0200
X-Gm-Features: AclHuK9DwEiR8riAHJ99e7wWWIvXaYD8TEoP937-DUXdEOHBiBspgOjN68JgAw8
Message-ID: <CANiq72nAhupkFYjRxEvpaDw_CAFZaSSdDCKFjG-3r3PyouEs1Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rust: doctest: unify with other kunit tests
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:00=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> Currently in Rust, kunit tests are handled with `kunit_tests`, while the
> doctests generate a lot `extern "C"` functions and invoke them through a
> generated C wrapper.
>
> This is currently needed because of the special treatment of file name an=
d
> line numbers from doctests. Convert them to override `file!()` and
> `line!()` macro instead, and use them inside `kunit_assert!`.
>
> With this it is possible to just generate `#[kunit_tests]` and `#[test]`
> for doctests.
>
> David mentioned in [1] that this should route via the Rust tree.
>
> Link: https://lore.kernel.org/rust-for-linux/e30d16ec-f5a3-4cd8-9b25-96e0=
dfa8b9d2@davidgow.net/ [1]
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

    [ Removed spurious `///`-to-`//` change and adjusted `line!` to match.
      Added a comment to match `file!`'s. Made `NOTE:` more precise. Reword=
ed
      to say it is only one doctest being updated. - Miguel ]

    [ Removed generated file from `rust/.gitignore` and added it to
      `scripts/remove-stale-files`. - Miguel ]

Cheers,
Miguel
