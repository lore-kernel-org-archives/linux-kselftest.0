Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793629607;
	b=FJA3VGYdB7P3Vc3cLY1xrReJALJhPvPubULh+VgEMNYTzW5s9uKwpF65icQTXupco8IW
	 SeqhJ2rj2gc/mwpLGf+KsBIcfv7Ju3pvVK/vnBaSGdNR3pusWoYF2x0Gxt8NgoeRAZQFq
	 LkYu1d2Q/X2CaHLiTmObdfZj8PHlpDYE8Uf79kACyx9ntyPkU7ZR4NaCqiA4X4XWvYb+V
	 O0QnxJHBUquo1e2gGNxz4IbUUhy5hwpEJLrxBaHi+YNPkzIGW2exTR00b8fKHKtjmBMyH
	 bRpd6OwoXgDXOBBGlAhOkZDRe4fzrbHRMLQHaWjDifyBx68ypY96SJkDtGy5OAMV7GQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=907vDR9YOAsJsqtOg4wwhmn9BwQZ5LLRrPWhrdWp11Q=;
	b=xefaukzFiAf0af5DttDLbow8hGLcpAfS9T1RKFjXwBANPK3142vVg7dWhrcp1zm45+zx
	 x12giZ+809SKdqTaJ8yVPQ28SHQZqUFBNKgD5oOVR/uay9OfzAs3mSoZOw28lAI5FLyKK
	 rTdgSZ61K1oGQH4pUEdb7LBT9Ww8lTfoEir4bXz+Qc2tp94Fb4U+c6HtXwQxgK/8I36IL
	 FTKaY4XUiHrJrceUAZ2imy3IfXDcC/mR1jgjCnNavQXkAONg0voUTM5m5Gsxq1vj0bxDv
	 LqAuQQ0dCN8HcyjtmDyJVwpO1toSYzTSajgqQYNCrXu2N6xm3HzqC+Vl4nERswHe7zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4lf3Q7C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DC2606A324
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 14:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8DC2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4lf3Q7C
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bb786c89c8so337061e87.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 06:26:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793629605; cv=none;
        d=google.com; s=arc-20260327;
        b=Y+fse8LlNVC4i0xxnYIMBvM/P4GjSBV9ekJfOIMMk5kIHCocfZA6hlWSRibd1bHt9/
         l7AFVjSW/6Tdn9S4vgSBmp3ZRk7u1TASvKRRX3tvloIve3sntonrVfHWGqISUhFRwg7B
         ydgFt/dkNZs1/hHxJVqrzCDpnSFqlzjXX/KoTqZNb/HutPm9Jtk8Cn7AxbHOmpTIyZ5J
         cMHTowJhkmfjJn3LUwJjGXs2IO6+TA1FdRKLaV/29vQex/WspqkldWQi/F/TY6D5650c
         flAl0vxllJ5e6UILxhJyo/Hqr/rgyLMiLz6iqTKbEPlC5btcbDszvnXMi5C6NpGgN6Md
         r0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=907vDR9YOAsJsqtOg4wwhmn9BwQZ5LLRrPWhrdWp11Q=;
        fh=pCaSjtV4+goD6FRikbuUwQgad11O/yqk+jdyuUx4UtY=;
        b=aIiqHcPVgAj4iOj/GY24ynwCrLZXldBf6E77LhgCJu4QuBomSivDEbQuVjP1EMY8Vg
         ckcdyR+P8sRKsuqKhlxiN3vVfYq/Divu+isiSHm/GUcdJkOp9gLJaz+36MrCkQBetgPe
         biMwN0EuQQpIir2xXUtLnvsIaNPAkGWR00UpU1E+u4PWq1qbvff/tc+DN3HsmvikbPVb
         1mJ8DVGARour5ETONNGETOjPuvJZ1tY0ZX1UfVnX9FoLst2Lw5EduiJatQ1saDvJSBi3
         sPBPjBOp1RhXdLLeLY0MizpYCSsu48LiotM2vD/0justkVIxoIFkzgeP9H2W1dhoE94y
         ZI4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629605; x=1794234405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=907vDR9YOAsJsqtOg4wwhmn9BwQZ5LLRrPWhrdWp11Q=;
        b=g4lf3Q7C/ECvl0ewWE3h3lYQ8L1Zui7aD54BIDr3V1N3Km5Sr1f/fn854t/MRGZjNN
         sNdMgMCrxMB0zDoeI7bUQuQPvpQd0wbj3RB3BTXjJKa7hhMGfN+WR3OLNZUZImJLGLa+
         zXEsOz2KXsBMVaSrf/+3I5XGZQbaGRbqVxMXTxgxr2irqEkeVO0F+7BOc0obkHOLakHp
         beEiMidfsTQxxwA+hGc0URvyhVngIC1sLwx7Q32KfWvNQ+TnIWF23cgnETDj02w7aoF4
         +KOkgN853eF1nlGnjs5J2yQAN195pT/tZTYytbeSLLp7PZBPKBzVUze+umlqlXRhaALu
         HqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629605; x=1794234405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=907vDR9YOAsJsqtOg4wwhmn9BwQZ5LLRrPWhrdWp11Q=;
        b=jT0O1YrJyLFHMKY3hkx+0DFvPhNW+JPECTAIDfYT1DhKvwTmIHRIQLlg6XjdwduUK+
         uhWf2K4V0u1Q4HeoUs6N6QHTbj6CLuiC7QPeVUbVXFIb1MHPlcSGUj7nuM1j3c+nlL+l
         2mZx5K3UYnSluiHQSpm1kyLwp2rGnDKJpTJYaPSfsW7UVodzmFenkQEKWu9BiBFXTm/t
         GHptNjRMGII+yHWZGofFiC5Hvos6wSmeuLfSY/DsfgBqYQCsu2NeCJAqH4Gh9XF9x0wX
         Wnit7Hj3Nfyyo7gYqi3onUo0319mu4Sk0XIKKIR3KRhvLcIrILaPuASq6KKoLXSZW4Nn
         6Sog==
X-Forwarded-Encrypted: i=1; AKwUvBwCPY5Js4LrD+hn0zusSKc3PUNwVZB0mdF6mS5W42g77pgAJOgZ60sGAC6CuDUvN2zB9fJmdDO4IJFHYar0wnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LFkUvA+4N9RW2LZw3iOtHXswROsOAtLkYb5dtyy11nC7+JPUa
	oqb3yfCXy4URyKNtToS7n7r2g3pYAHaCheT0fQQLMk32RQ39lquO2mqoriRCaorHZhYMs6FDoKt
	3poN2eTPQVVVrCmw2cR/ED5NyKTnQuJI=
X-Gm-Gg: AYBFou3PODHqJksv0bBouSrF1InqYFxFNHyv2ggdK4NnhRb9IhnYnGQYOtU+BdI/apG
	zaDtKCNeMNSH/XIqBWlZKCKZqz7m5Ihg7G6+Tyoz5kq2RraqS//rHxVW/HlXBQD37BvJBR8txDQ
	YZYW45hwwIcT6fBlSygFbTOtCZsxGU5lJb703Fn5wSmGHox8X2CGHTfFraoxEFXM8xbvGlL0331
	Tpy74RtjvqX4Pyafp2L+c5ufxrcokT2w7qmPGOKrQJBEsuJvKzmgv+PDlJY8uaDdrSvzWDnC4JK
	XUa02Cbeekd+ODUulNuXzVbQ2+VeQyyGNfW/HYXngtzqbmurkct6i46sJ31KmZcVq6c5LLC8qXv
	S+LNpk3LZNZEvf+cKczfENLBuuaTbwiXvntX7wx8eyMJVQ+1wCEFTdxD41OPxZGF69Zodi9jq8V
	Wp9IVBaqehpkzxPVINUjIn/KqmYCnhBa09hHPKU3H6E+02sBp/rfajdvaxFOAa0VivZ22e0HNjs
	x1uG5E175rw1FelQPeRSeiU1uZxkOChsWs0
X-Received: by 2002:a05:6512:ac2:b0:5bf:e32c:526 with SMTP id
 2adb3069b0e04-5bfe32c075emr2457375e87.3.1793629604846; Mon, 02 Nov 2026
 06:26:44 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-rust-doctest-line-fix-v1-1-0c13185a58b6@younes.io>
 <CANiq72ntn6ThPz9Q6+BxU6w-x2jUQ50xpiy1_gCRi6o0peHi8w@mail.gmail.com> <kw-1793624159.027890950-307523-1@younes.io>
In-Reply-To: <kw-1793624159.027890950-307523-1@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Nov 2026 15:26:29 +0100
X-Gm-Features: AclHuK_BjZvgCearm3rbmVV9O5UMJr8vcWg-8C7BUiu_MBE5WEN3h5cW65l1BlY
Message-ID: <CANiq72k=Ru3QsiUjrXOtFqVuA-D+w8fJ2fUOTAL2cKFS0EhLDQ@mail.gmail.com>
Subject: Re: [PATCH] rust: doctest: fix line numbers after crate-level attributes
To: Younes <git@younes.io>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:56=E2=80=AFPM Younes <git@younes.io> wrote:
>
> It can only underflow if rustdoc stops emitting its own
> `#![allow(unused)]`, e.g. in a future version. A related case is a
> crate setting `#![doc(test(attr(...)))]`: rustdoc then emits those
> attributes instead, so the `- 1` can silently become wrong and
> doctests without any attributes get shifted. Either way we'd want to
> notice, so in v2 I'll check that the first line is `#![allow(unused)]`
> and panic otherwise, instead of clamping. What do you think?

If what we want is for people to simply notice, then I was thinking of
just `unwrap()`ping like others we have around there.

Having said that, it can be annoying and confusing if someone writes a
doctest and has to figure out what to change in these scripts (scripts
that they may not even know they exist...).

Ideally, I think we would have a "warning" somehow, i.e. something
that doesn't stop people from working but that will get noticed.

Cheers,
Miguel
