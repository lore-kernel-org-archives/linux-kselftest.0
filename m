Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793172657;
	b=nXSyCO5xKgurQu93ehEdmW6S72BM0tFfqdJw9d4UUKXSmx9TNN+LiSw13eAPcEM0ZbGR
	 NmkX75RvB2JRlqZRtrfGLiXL1hlG1IiUR7OD+aezcM7VC5SCkIuSoMLVKLGoXiDZ/zX59
	 tqb0wvSa3ZQp088L7gR2ZBIWmzdElp1mIGZTsvW/B2HCMxQPnVbmH76GUxbIXZ5VjUWaB
	 MrN9Me9InvXp3t9pb+KR6FJm2FCIiaRjtSQDqxMO46ABAevnyXc6Yv8kBnxDzA478xgag
	 4n/4kfVAQ85p2Y9l++Bb9XnfPJytiWkR77gzh6rRzYmUm57Zvp5y1s7PRI92Oaae29A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4gvBxf1fqNFjM1GSlcwJUneHyiK6lU7SdqO+7rEXKHc=;
	b=C4dH3ozNDBYNV6e3EK2iWoQHEiCiDf9Eve6o295Pof306wJqKp3bC+xe6n8pJdQIJqvB
	 Xw5cDRXgYPLTmY59OmFoXUiOckPYc+X5NDXL+NRc6CystRAJHogcWgeESaDeNWiC06Xq3
	 DPdBll0qXWJ+LsJ0BV3vQc30o9NCOfmxzd1TkkjJTFg5pww0FfuLxkSHgGVpImhec3czd
	 AoOADjX80m4m3eVxab4qnFq8FYBNeAQnJu8CQQvMfXweh7W/T2sAoI7FLCZGthq71kJlM
	 O04AryQNFxjfEfMKFqaCCkJkaqSAF62S1YlEZG6GRp+xuyI8K43SM1mP2sSlmFoHfjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJneuDjS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28EA60A2612
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 07:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B28EA60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJneuDjS
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a1865cfdcso70558eec.2
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 00:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793172656; cv=none;
        d=google.com; s=arc-20260327;
        b=f3XD+NVPMuoBZaqsAerhtFRq1tQhSivhCv9LBt5IWNwxEsvx6AnUkEOR3pfJ46HhxK
         AqtaCkXId+t3gV54wcp3japdLGAU51A8StVixvQfDHpAuhIrq0La1mwnnGDywZpTAgAD
         vLfjns5ZPcH1ogv+R/9l1213PEFbWUnWKrI5FdXWC+DwtMzfDtODos5r9IMCOEe5b0Xz
         NowfFAn4le7KD/m7wP2eDOq14KXjpqeAbF5jFhIfB1g+dSkOVp+m19lt/9VroNGaG7wy
         A7m5/rOmnNKkKLOzpgC/Ed614pHBTKmd3YNtXqwSeEDIko7bu8Mm0Tbfl1tIWih3C1t+
         +NZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4gvBxf1fqNFjM1GSlcwJUneHyiK6lU7SdqO+7rEXKHc=;
        fh=a2PmI6/T3hkIocbHSNw3eTMImryLLy9FFCKzI4r2ENY=;
        b=RtfKOGOE1BeRJm+9IY64aK9v20+B8I6DLVTIKo8VTf1gFu+zUCZ7ISxcMzxD8TNToP
         muW+wX9UXUj19TNfeCMgI/QjnCbGQ/PnHf/cpVHPURsmfq4mAPYEWXosdLgcjmOvUoEt
         LnWgouRqtQW//je8h4tJ+JZtQozzmlsbfie/ti5QefCOWyfn7m+EF6+hLbzijEdN34jw
         ciDnESedWhXqnawg3Oxv6hVFGhNWOCp7kUmJpXyQjwWFJiGu544x6bVJ7fixQSKuU+Rk
         9pMq85OigBDtd3D99Bej+0eFAEljJn4lgd7XAPZkUtK6q6PFwda5Lh404/aEU8yRrHyn
         /geA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793172656; x=1793777456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4gvBxf1fqNFjM1GSlcwJUneHyiK6lU7SdqO+7rEXKHc=;
        b=bJneuDjSTeRtWYs9gLUzq94HuHAoFwhslEwQvNPXvw2Kkf8nTMJss5fQjjqL7AIBYP
         +OLGCb5rb4t0f94npzyFIsA8YRFRRJS3NojxyKYSJTYGqAzzTiwFflm66sPuzX630Esq
         U3/+A+SZl/zdO6wdtAg06Qbmn6YgjeW2B6plLyI6ziP7QOs+2JwIjoD1srOxCaS71ena
         TKSUL9xnCv0poX1LRcRkjNt+bemTiXtpAY0bB9PdvqM4zrtzXJpw/6xakmmH+zxEYgF2
         WcH453cXL0XYU6lfAeJTOF3hdMG5zjiZiLe9LTDgWXEcq5DT8WaKE6FbUYWhu1/eoXtr
         FKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172656; x=1793777456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4gvBxf1fqNFjM1GSlcwJUneHyiK6lU7SdqO+7rEXKHc=;
        b=bCo3UA7nXKpIGwmqmNdOSoNaitxyq+vuf5Njqgfx1FPHoxxdqtxtqG1NbaXve9FqTg
         mnzZMClM2wCiauwhTGtqdikI8nD7enYdL8FOXUOy+DlLhMsn/PoRTXN8hL1ZccIZFs8J
         kjhuoYDR0P8JpuQl8O7t7KcaWYNHQnnywUh+ks24D3k8B2g1eWR2w9u9OeOjYhpzQPb2
         KU6Dp6/VWMbVWtVi5x0FMi2HMemrCsuf0fgKEhA9twGmSMfOfzb5lFUiInjjIvQgZuqz
         uC/yIOFZr3//RGVM/rUo2Df+7olceItsO4mm1bMfmcPph1kfkxEogpJU6vrDOViY4urI
         dYMA==
X-Forwarded-Encrypted: i=1; AKwUvBzONpMPSWvotmpOj8iHsC6Vdi/V9TWlcvWpH8/RinaS9WL+WgZHevYuVX9FkIlOpEUNFuamIqmVZUgNom1hJ48=@vger.kernel.org
X-Gm-Message-State: AFq9FYL60P+hK4cbo11P77dxmUPPPZ4qSN+q5E5GQXjF7/wEnAKWURZH
	zIF/iSgGK/OY2Mq+HO8tUaz5c1Vjh1peZ2zlQBxIk//HhlLtmaKKoxDPpUQryBp4wV0H9y+jdOh
	zmL7dlur9QEIUD9lfcKLSs90GQ0tH2PU=
X-Gm-Gg: AYBFou27VrYXUGGbxBmNRQ8c/PCxCWTU7WT30HLFULxC8XMoTiAeJ9b2/7CDpQdtA13
	32PnouHs2ZEO2JADDxCsV9O8CdJe8Ak4nevJAeptY4VSuiZ2YRQdKFwqCCqMp+UdcbV67MoPepc
	SaQazF0cYpCW5O2VFYjfHeco6nx38oLcCl8DqLonuqdsdY3OMtX2dgm/ymafwJbP+F3bb6mfZzt
	SiBvKFW9cvPS5v9BFxEltMdzJAUQJ6HXGBFXRRP9XfVzn7dhbD5VYTqZAlcA4vODlt/M8Ci81MI
	cubQu1c4njia/SPYTe34QiaBPMVi59bLf2Xu+jTmHetTVGp42eMMDyaJ2OoEs9Z+8ikiBnZBwLo
	4gNDnppbU/XolW6vdj9ni6Qk/AaQ8i8QzT7s7+/aP1fOSNRtBQ87iapKM5jn56JxM4Q/qtpXcWu
	p4BL5W/xE8i/rCLGfZKxMxGpKn6u6B7JSTkHqT0AB/Etz3VGZt8VRQgklZeeCDDgs5Y+DbtwLIu
	nXr+nqO/58YiEacXJ7XAffaZOPyjhVpOelh
X-Received: by 2002:a05:7300:f484:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-36a1fca875dmr3770812eec.0.1793172655949; Wed, 28 Oct 2026
 00:30:55 -0700 (PDT)
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
In-Reply-To: <20261027-rust-doctest-line-fix-v1-1-0c13185a58b6@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Oct 2026 08:30:43 +0100
X-Gm-Features: AclHuK_uiWS-PXbCJG5cbGuuSSYIZS7YP8Echn-C46nxtbCkTjeTMaSgo2vlD0w
Message-ID: <CANiq72ntn6ThPz9Q6+BxU6w-x2jUQ50xpiy1_gCRi6o0peHi8w@mail.gmail.com>
Subject: Re: [PATCH] rust: doctest: fix line numbers after crate-level attributes
To: git@younes.io
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

On Tue, Oct 27, 2026 at 7:32=E2=80=AFAM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> Twelve in-tree doctests start like this, e.g. in `bits.rs`, `devres.rs`,
> `init.rs` and `std_vendor.rs`.

This looks OK, and I think it fixes all the cases we have currently,
but it doesn't cover every case one may write (like a multi-line
attribute), i.e. I was wondering whether the complexity of this is
worth it or not (especially if later on we try to support every case).
But it may be that never happens, or happens way less often than even
this case that we may not even care.

By the way, why `saturating_sub` in particular? I guess because of
underflow, but can that happen? And if it can (perhaps in a future
compiler version), wouldn't we want to notice?

Thanks!

Cheers,
Miguel
