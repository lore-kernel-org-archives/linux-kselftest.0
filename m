Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9383B37E5F7
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 20:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787085860; cv=pass; b=kCt3Uxls24x8UTQuUb2t5Ih+LBmAR96EghGxpFMGuTvvyLN0PUOl5TsHTEbV0HvV37QyVKPm8P9Xyqk/mKY3loLerim0wLUAPWNmSSS/wKVe6hAG5uWT/ILDrWmMJ+eTY/yW4ObJRuIpCSTKTtwJ2B0C4T+rQEIfCiiIK9X0+Ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787085860; c=relaxed/simple;
	bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUBjLgMpf2qL6JKSIWFz5xqmAPhdvRlszCOYkvPCgJ7TpVDaDIgS7anEHC2A+AQskdHDZiLksZX35RGy1LRXbIqBemXo60PNRtRI6wy0It7qNr+ciI3cuNPhkrddwFGNErt7SupPXg+rKyqiIZYDjcW5ljPH6H8pmupL2aQx5mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiSnCx9i; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiSnCx9i"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cad68425a7so395845ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 13:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787085858; cv=none;
        d=google.com; s=arc-20260327;
        b=aVxndSUbf9MTXDe5rvSAF4nc8Gep8Ikt8wv/sIEtv2siZp1OBCrayaP7MC6LkncpDW
         tv1GJ5ZwmxZnzKuSvRhpaPTbB+gVPyf+jhif795l137oUwzTS0m3d8FLI4djfVMy7qd5
         VRPs4IWwVpI3yiUSEovYxi/bXHh71u4sJB8zI7hyJzIlSWAR3FPRNwtAgachiND37eUh
         Z/GRa8zcbBlOvNVwlnlNAH84LQW0uBB2UBSezB8KkbNQxIygvM0exzK0ad4V9NXik8Fi
         2p+0pnY31qItHZSsp/UUPzksqUFrMLqQyQk0qCOo10UHK+EZfffvD8I6mlbM3a3BD7OL
         mofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
        fh=M965vXUaqJ8JsscKsDG8kG7+gK3EK2SOtKWExnFDOpo=;
        b=FT/3E6752MaENCHo/mbg0xaH4XjkgczeO9xiJK/hmFYbWg8bnMqLw/R4sBV8yX77FF
         Zm2YH71Zgy57T24UwByC8dOZotzpWr+VX0dOhVSa0e/n62MCn2YpWDmyzr5joQTGK8zT
         eGPuXdHN17KJJmQC9a/u+uyy4kt4vdoCydlRq5KpDYRWd5RHrceCV7YzR0QoBwFGzXgV
         L8bfSz3lzgghb1wIwHjfuvV9roTaawZ6Tc69giBmoNJI00sDwunE6ap4U7vlNdS+VSjx
         5ICy+WZjTj+aNUbJw1As8r0MRcT+cTkbUaslDJL9em7UOQo/DlAHAoIg0WBz0C3ccps7
         Nwww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787085858; x=1787690658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
        b=TiSnCx9iAH+ZfAHEl3wMOsgjNgiGLv1iHt7TQM2L69mMIqOJS2RhYu9LXHIs+mf7fJ
         FCpjnNfhq7bb0X4M9cdmKTgUw0dRbG9uZ4j7mQO2H6FPmLBbnkLLhS+fftmOOyVqJBmH
         BQVs7ZWxSVENeLBdZJbYC7K8x+8AAdBoAM44HPFi8TkLwLzXgYwi5ZZoOmj/ZoxiYL3x
         Os7tGScy0cgJ5T2UCI5lANJDUlGoLFlQC1/HfL8DgqD47vzmN+UrOxE5y7ZewRhPAIVP
         shq7ljEda7DVejFUMZ/0h9BFxBWNpPGVI2HrkCK0z8G2ANUGgL0jv5XjYmvY7rY44Tlq
         gW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787085858; x=1787690658;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
        b=hCn3KMGOtiX1V9hRSq3Ti2boS0M39ibwLSFfvPidQcSE05IloO8UV0kR2pJaJNLkwf
         Ye8Y1IzucBMKIha2ClmNExDGnpnNr2zJGIOlumfCXkAUEyFoDNFexXgpHgtCWrbiyAVy
         a5qIHZ7f/AV2PzYZE8Wn4q5a+YUOG7K6w0gu/pf/CtMg1CAXpFL8wjEDp1BoqHd6D4/b
         aXPvWEDM393PCUPFaf5xGzZ37d+awmgzVz+n4zpsGj1c6XVaUbOOYLXfMHXRBDJq6MnY
         wHhfrBdWI2DZ4YZ8dFwL9m18k7I1RxA8Q63tp/YmmrbCvUDP2xv+Qu8kJbjvQML4W9ab
         pHmg==
X-Forwarded-Encrypted: i=1; AHgh+RoSbnqY5+NWtyouJsu14FP63KZ0mq4yPZXWhq/JEAd8ERnkYjf5EWZa9DyyKk9neMcogEzlAjNdyaXtN7MFaBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyltL5rhajwnJbBo9U96R2UrMab5aH+GxFeFH0yDlnqIRU+QcO8
	4/+IRALeJJugZurOHPLcoVprQyLueHR+Snk+SE85IUXeN4jStRY4tVuYN2o4ZmkBQXKle2cFgHC
	Ad/fPEEDvodXW7Dlk0BGZFirTgiWCe7I=
X-Gm-Gg: AR+sD12sWfCjbQw0mH/AJdHygGfBPZfpzGDC94gwbDFq7QrcTeQ9H/tm5qqSvw1yulE
	FDu0jvqRF3uN54/uOwpbRx5qfTgCyOOU3UE+X6lPk9Df9xH9Pcc8WnO/EHN65Qqb5268h9LT3rQ
	BSPsTa4aD1AutamA7g6dTMGKi1G+pI7Ea+IT78r060ODKznRADZLJ+oaz+BLlrtzd6rZ6QcNaAO
	rxgvr1NQIt2gKgFFJkM3B9ACsNJEyJ15RIHvUlDUD9BLu3DbrXg3OAtdAYv1B0lRFrCHQYKhZvJ
	4peN8Ii7QwhH7gBnh03q65DZRJOjH3FtUPjPkgTljeusJ5miZaehIdMlYH5bUtsN0VL7Mk1EoTY
	stCozByWkkhKVhiZYaThdPUwjmfYmdVDz/rMqxZonkQDjevIOmz/Cl9kF3LIa8agQJAyD0zmATI
	PgefGPPls=
X-Received: by 2002:a17:902:f64c:b0:2c4:397:dd7a with SMTP id
 d9443c01a7336-2d5f6c048bamr4365605ad.4.1787085857837; Tue, 18 Aug 2026
 13:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818152324.587932-1-ynorov@nvidia.com>
In-Reply-To: <20260818152324.587932-1-ynorov@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Aug 2026 22:44:05 +0200
X-Gm-Features: AcwNN1XULaAA1GXIK7uBimPVbF7p5caYY_9Jijf1I6x_dsAVvxaRtE4L1JXqhyk
Message-ID: <CANiq72m2M5Csh_9qQYa8MRmJZtciU3d4S3ht5FG-K+YwR4iAwQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kunit: enforce test configurability
To: Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, Gary Guo <gary@garyguo.net>, 
	John Hubbard <jhubbard@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 5:23=E2=80=AFPM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> Make every Rust KUnit test suite require the Kconfig option that controls
> it, and let the `kunit_tests` macro apply the corresponding `#[cfg]`
> attribute.

If we are sure we always want at least one `cfg` guarding them, then
yeah, this makes sense (we could ask to write the `cfg` bit inside,
for "greppability", and for clarity / less ambiguity later on).

David: are there cases on KUnit where you would recommend/prefer
something different?

For instance, I could imagine a Rust `mod` for testing purposes
already gated by a `cfg` that is meant to contain many tests, and then
different suites inside that for control (possibly with extra `cfg`s,
but maybe none too for some).

Cheers,
Miguel
