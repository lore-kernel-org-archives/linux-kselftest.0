Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAB21EA65
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 19:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760069; cv=pass; b=XrSWwPxtGfqvS0KDRAukICKhHC45YtDVw9axyxaGCWbykaIe7xAZq/r8A1O0p2Uxlr4Acn4lmwidmpEyxKXepWHdBYWOQD8sJN1cD+Tz9JiwcHDqj3at+VHgCNTmQ/aJjU/utajqzTDjwvH5NSij4+FfW8mAsRSH9/taSnu48hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760069; c=relaxed/simple;
	bh=Vn0pg41Ip/7hPwtecElePnY3XYE30363BA8w/pBNKkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lD2W+wfl+iNDCRSPuuDNbaDkD8TcbrOsocW7NQaxqY+QGucCy+TblpNX3YJ/7W+z4IQtEDuk7cX9wcK//er8itov9jVQbzadz0stHg/XsaHR+UjngHB1byCkWHLGQzjFPrW+xD/Smodkj7u0kNuEy/7vupWXT9G/S8z93VsGiCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9TRSBHP; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9TRSBHP"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30c7ec13248so210988eec.3
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 12:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782760067; cv=none;
        d=google.com; s=arc-20260327;
        b=gB7cPyxNrRuIlSK6JeCM9goEclAhiQIW57C5JQKZNjoGZn4WqcKqc6qkbzmuqIr/D7
         cRtJHs8b2qQ8GD1IP7Rtn6KUbMBiS/IHsENB4h3MGSI7EMxZ5snd8m88zA+0aNrDPu8L
         FNPuqPsqak9Sab8J0hjawNrJze1QycFlZzPIG/5BRjrpaYJj+lOntB0gijUCVx7MmT4Y
         GzmH1Y6uodl8x9ZP1xymO6y2SKX1eHacQt+UaffOFBWaaf3X2RyI+YFmZ8aPMfQfgPZR
         DOwA0OZA7Fq895Uh8VCmmM4Itb8nyAFcRM82zSjV5SqpRCKSLHnI/3hyBmI/A/orJYPS
         DKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tHSIGtbVhVftBU1P0PUwzTUvU0nuyEEXJ1gCHih1CyQ=;
        fh=HdtAiQU61XpjN8YN9IFJ67NYXSDeh7cHa9P6qegb7nI=;
        b=hOxX7/0UwgTjjQF0TAWXPfaTCZoKQ8legn7QFhmMgefitJEowo/OFTUS75OGecfIrt
         k5LwLsjxMBi8rjYf+wbAV5W+qOG+B430jE3S/bStwYGVDZVzK/UHJAUk0S2iwOmLBAoU
         axfbxUJPvNjuKiPeXMf76tDt1+Pdn9NfwcNcESWewyGBr01UK/t2zHTD4rZh+ZjOO4sW
         mlymM4c/HHMBZV+7TX+zxsEhBCBfbFzLbd8VYB4gR0WkZy15wrnz6lney4kA6LmmKTQQ
         SKjYJ7hlqW8m6S9QDBD1sNRx+lmD994oWKLGa4TzZGMIOysUmHpxZBr5omWGagCDMjcl
         JQsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782760067; x=1783364867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHSIGtbVhVftBU1P0PUwzTUvU0nuyEEXJ1gCHih1CyQ=;
        b=B9TRSBHPHGR9PcIrZjNwibDjUzyLRNUDSPsEYhj2MJI+0OU1+8pEKFgMb7P2vtskEa
         2xErZHlRo0vYNEZrMdsUN0iJJwv14zcbxMVYaWM2609W/SUW16wnuIJVs/1YYif0EMto
         ByyQhYj5WzvHNHRpBmNvAXjK7HwK5TvEO7cr5s7VNGK/zlJAvhoVcrX8O0eGM8+ZRR+o
         o++x6590HjS3WSfXUnSlCzTBcE/sRrwRhIywGCn2QJe0kCj5oFsMOFvSZrxckpncuI+v
         9tmFamA6n1kWvmWhrnMIMz/LuCMsMhREmXv4zNp3zX9qB6TJO9arrZCWTdpFhYIsa+gp
         jMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760067; x=1783364867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHSIGtbVhVftBU1P0PUwzTUvU0nuyEEXJ1gCHih1CyQ=;
        b=Pmam7UFfAoIShCrIPmtI/1nO+PteNCICQOy/tgjQ+5E4SYgilpup7pk1hzHly1RsJL
         O4CYsICCllg4xV43JIIbz1hEwfQx9ciZASfLAybNpAYTecUvNXkF4kbCrR1Jxtx0OF/f
         oHK5lMOmNUd/H768YKR+20C+M2X85lSeBFRMDRxN1z7C9N36Ol0fEZuqYIla5Hl5ZcvW
         vubzfk7bvF8V4Kfq12sJAUwrWVaAeRDsvWGsSbHIkHvseYAiUDo/FImKjGQ3MSoWoucl
         6iqa5f/38IUNrgiQKz/ywrr1SPoLXDO4WwFKySdpCh3OY3tuMPjLe1NTE9+29AeYkV9c
         OxjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/GRVVr2GWt7R6Q+Ckazd60Ri/POuzRWapN1JH7anBiYt55kt4ww/5J2OxLBkLqq51bDedtOf5qnYw4SxrnsI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz51ojOkQ9mXMefdAaoYkEXs8dS6uqGvUKew1K/kig5yJflcFv
	Am/sE2QXNeURYeEh7eiQnwhAo2tqdu3qFxbLLU8BdclexRNy7QncfastQU9EDGmhr8bBvuz0bHE
	bPjVfE31CQvNFJNFw/M2CMirvVqEZ3OE=
X-Gm-Gg: AfdE7cmUVYQ9/MB5sdqBl/jaPD6SlUqPnvlfhApe3iMP918ws58oDfvO3BuqSvhwd1G
	s4TU+PvkxV6KvIRzQ6nkr5OdyDcBwWLxAJw3YA8sMQnO/7pWyMwpBfkc1fab6NGyC3a+qpbuZeK
	Dxz4yx5I28mcmgPNeJ8hXjLuzJsEAzqFRh6kR1BSF2shVVwiCLyEfmedcV5qH+7fddvT9bVoqSp
	Rv7NxhSIdo1x2ULr4G9dUdVbDlS0xq0r/em4uX9AvyNlJCzwyJLKEfNGFCLfkloswnur/SWqTB0
	wMGFxmU9Kn1SGJEJHpeePxOu6TxLd3/WW5tdPp1XjXKv098De/mZJhvfc+WnEkfiv5AueROTgD7
	IPtBltlPuyeOBRupnIgjL7jk=
X-Received: by 2002:a05:7300:fd11:b0:304:f860:3ae3 with SMTP id
 5a478bee46e88-30ee11982a3mr233258eec.1.1782760067448; Mon, 29 Jun 2026
 12:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-backport-cfg_select-v1-0-388d5d31d9d4@nikableh.moe>
 <CANiq72kG8k3mk+Xjr6q7aKg212QUNtZk5w4rxV=UGR5UXKE_ng@mail.gmail.com> <0eb77f4b7199e9af01d61e0c1ac03c99@purelymail.com>
In-Reply-To: <0eb77f4b7199e9af01d61e0c1ac03c99@purelymail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jun 2026 21:07:34 +0200
X-Gm-Features: AVVi8CdkymgZKdU1srNb6pWvis0Oy0nhiasvmXiP9Euz5OiXsHZXZZwi28ERi7w
Message-ID: <CANiq72nVwM_OF4yz1rB4Q-atDgZ9Oywbuhu830jfQe7npt0FeQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kernel: add cfg_select! and use it for
 config-based selection
To: Nika Krasnova <nika@nikableh.moe>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Yury Norov <yury.norov@gmail.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 5:34=E2=80=AFPM Nika Krasnova <nika@nikableh.moe> w=
rote:
>
>   - 1.94.1: core::cfg_select present behind #![feature(cfg_select)], with
>     the final builtin behavior (single-brace expression position works).

The tracking issue says the latest change was in Rust 1.91.0. Did it
not work there? Were there changes after that?

> Does that work for you, or would you rather take the gate and drop
> expression-operand support?

Hmm... The end goal would to use `core::cfg_select`, so in general it
is a good idea to use the "real one" as soon as possible. In addition,
we can always wait for any case that doesn't work in the fallback (as
long as the behavior is the same for the cases that do work).

Therefore, we could limit ourselves to what would work today with the
fallback. If I understand you correctly, you are saying that even with
the conversion here, we wouldn't even need the expression case, no?

What is annoying about that is that there is definitely a risk of
someone using one of the cases that don't work on the fallback but
never actually testing on the minimum version -- even if we don't have
those today, someone may add it. And while it is "just" a compile
error that we would likely catch early in linux-next (like similar
things we need to handle), it is still painful.

So, yeah, I appreciate the advantage of having just a single compile
path, and if we can make it so that people cannot fall into cases that
would require extra cleanups/migration later on when we move to
`core`'s (even if `core` supports those), then that should be good,
i.e. if we want to go with this one in all versions, then we should
make sure we only allow that subset that cleanly maps to the future.

Now, to be honest, the easiest is to just wait a year and then start
using `core`'s directly... i.e. it is not like we are in a rush to
start using it anyway...

Cheers,
Miguel
