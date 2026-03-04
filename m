Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C8F2D248D
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 02:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772591691; cv=pass; b=iadDx/qa2Sy8ZB+0xdn2PjMfjuOebhSli8ak+GuGzVa3zk3APOyqn9Q7vBudYwL1xEmbRkcwarfpYMN1rVFBg2DfYTPcWRabROeqAbJnOGEKRh0h4H7OZCtTNPnAyirQSEnBweXWrjWI86pMb6fq5Usv+17XUJTillt5l5gp5Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772591691; c=relaxed/simple;
	bh=2XMl2CMJB5mdDn8gFRtihyqGf2DVsjqEtSyf6fRD1HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrZ4ZFvY8ci3rhIL7bu8WFCvxYn5LqjL2va5rpPB0WRe0wBR0ueOK05tgnVVchq9AoTOM6G19lVZ5Rm+/1hIspmpPh5+HrQfijtqQ4L7JaYBudxBnpALMcZ7eSCSM2mFoHYEL8Y7s9wtYNW9XchppLjDHAmG5CYlKe61c5Q3e8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyYrgDTa; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyYrgDTa"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2be22d699c9so91268eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 18:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772591690; cv=none;
        d=google.com; s=arc-20240605;
        b=AjfZ+nwlqE2TYMPlGB7PrE69f7bwot2rFkVim4PG8L7gWdlnqUqtkpoykd1Jhdh+o4
         FUhdFjnjF39k0aX6hQ6hIv+JzxfK2WYycdKOwtpFgncnbkgQBh1/Sou0bJRGPay0h0/D
         hunPh1Id/GalpGvoOxDAA/XsBwgHP9d6/Pv+Keq4QAIEAOdteq37Y4a33rwnvFvK88kE
         Aku89aglhtdisxuIHJzxndbK6Dsn8QYvFDyCktMi5hpPqfGSb5xkEqBrIwwrvv7cSpen
         ThPwYlWlSLTqAoXpDw/8/N6EfU3U5PxN4mA/qYVY52tjK2MD7vbZG4qhdnLL43eCk81D
         s6xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JkX2+jmYSnw4PjcXqCvYgS+1FwE6mJFHLzb0KkOcleo=;
        fh=lVDqeHqLF/29VslaYsKxaXVTxfVEJqyPRGR82xusvME=;
        b=CF2YfG97hLhhZyzx1iKGvQ0tZA7PgPmd0U+h0y564vLIuM9N94+vvKy4MAMtrR15uJ
         AvkIaPHU06Mx3pio9YTgRm/Bj4Ue6Ur344flPoTgtVNoA3Y6jjHJOVfgFrZ3JtWLsc8H
         /dB17t0SIOFS1PYGYxzTtCQaqLirQojwWQ6eyqVcaTOrNZoijxQpmrh0TgJdMHgv9CZ9
         ljSj8nxGmu7+o97hx+DcRRJS8S7XeDXb+ZXZZG0jseB9MSeDt3kFhAAfmGfQuNvHePZi
         MFduqPX0tnBCGPm3E9gY1QVKaHMiW8ANoTy5P/fS1oWMbO72/jhu5AvG5PhXjyHlksdF
         kJsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772591690; x=1773196490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkX2+jmYSnw4PjcXqCvYgS+1FwE6mJFHLzb0KkOcleo=;
        b=KyYrgDTaxrrTcH3bP2eNmVNzTYRKS1CXGHj/FyPYvDexJG/SCM+l26/6Yb4mmMGMhB
         pgBqkV3+ham8gIHmd6HFjA8zpbZzPNiLLY+x07OLuTMKFhVrM9/nLFOh6ECVH1D/RRTk
         qx+2BeTtyLocbj3eZBMkoiaruZz0eCIzGECOfZwx1jerqrjiOsauVWAY6LFpWiquQYsH
         zZCzixF9inaE6ZZWSznr7P1AV/QqoeGLAy16KK76CqlYKG10CFiXG1pa33CE6uqVrYd+
         3NXcLkDB2BclMLJSpe7qNxfX4PERHCa4iHyfH5bDEp+Mijkch+lma7s3VjtKDemlH07p
         PTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772591690; x=1773196490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JkX2+jmYSnw4PjcXqCvYgS+1FwE6mJFHLzb0KkOcleo=;
        b=gwn1KFJSvu8HoECR+tNwQsUzzzNBu78jlR/P1O0cHG5IGQ+BhAsAq4H+FV04uyxTT/
         wdGpDY+fkxxz42sn9C7KghXC4Bu5SJZfQFlUCn6tkKY3thb+0Oytcng1mhR3dhDpMLQT
         f/aaNdXZVNzbIxg9k9sr46gymdycexmE4m/gys6S2vpWWad5HAt5C6dsKe6xuzHQAT2P
         FCTURdQvYxBxKhlYECax3YYyQGsWAtAN2mITQMCFm3wOGrXjEu7xhu9zmAyQu5r9T0r2
         weJrTUeieTwPDOkqM7lKAWApgPvyUuAV7Yf4MY5niRVjYq2PcEZlNiF0I8MSnvShJni6
         b2fQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1gd8hXxYC/wXnbX1NvOWVsPGuP3ugdxxJ4uTjd7JwrmOKH5BK84preLFLGuojwJzZSvwHehe38bchI0Rcia4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh7l4mg/OZz/5xf0QgFo0jxpma++MnWJD5quJJKKWmTjyK7vG9
	1+RdYadOMuuq+j7wMuLdlj3EPbTx5fBShLExBKwTIagArS9XgWr+zdnYCek/k1UO60+EAL9FT/a
	hEOBHMDVZpzXXg/A3XgpTVsLLHqo6a4A=
X-Gm-Gg: ATEYQzxKKvqp+L0SwcCWg6u7GwaG3UL+rmxAiaWJmJxTlos6AWEAXd0OWooC0frtlVm
	Ha72Ok+v777/Ws7/zs5jfPZq8EJLshvjFwy4t+mc7SMMP1ygcbafcNUILGt/WC5l1qigTLgcyr0
	MhUgr1Zkw0H7uXe70KaYVm2cNdmGnPd5Ve1iqGTmhexoQq6IhJz5I0lnChmpMG7iaAtE3L45obT
	0eBDTk3319wBsjpbOphV5P4XboaPaZLKO2s59/n/jInBVKVy1HZJiJFrNuTuUcYM7IO+wie58Ce
	AZglbIxm2jA7ucUfkSbdXSOIkRGVEL80XIiHfDBpp016srUV+YcYmUsRNCjl0qO0oDV0g94O+yV
	tyv8O0/zwqV8ozdtxiic1mrCY
X-Received: by 2002:a05:7300:ec08:b0:2be:681:91b2 with SMTP id
 5a478bee46e88-2be31224556mr94371eec.6.1772591689749; Tue, 03 Mar 2026
 18:34:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
In-Reply-To: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Mar 2026 03:34:36 +0100
X-Gm-Features: AaiRm53AK__LxyEQZWlm_NkgVJ-LEO_6aeM5Yb2_RK6_R0B-Cz9fKt-Sydu0gx0
Message-ID: <CANiq72kROq3B=EPfihKM=bvtyqYrbDV-mkFgROdPNjbC6zaBpQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 11:38=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> If `CONFIG_PRINTK` is not set, then the following warnings are issued
> during build:
>
>   warning: unused variable: `args`
>     --> ../rust/kernel/kunit.rs:16:12
>     |
>   16 | pub fn err(args: fmt::Arguments<'_>) {
>     |            ^^^^ help: if this is intentional, prefix it with an und=
erscore: `_args`
>     |
>     =3D note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on =
by default
>
>   warning: unused variable: `args`
>     --> ../rust/kernel/kunit.rs:32:13
>     |
>   32 | pub fn info(args: fmt::Arguments<'_>) {
>     |             ^^^^ help: if this is intentional, prefix it with an un=
derscore: `_args`
>
> Fix this by adding a no-op assignment using `args` when `CONFIG_PRINTK`
> is not set.
>
> Fixes: a66d733da801 ("rust: support running Rust documentation tests as K=
Unit ones")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-fixes` -- thanks everyone!

Also Cc: stable@vger.kernel.org

Cheers,
Miguel
