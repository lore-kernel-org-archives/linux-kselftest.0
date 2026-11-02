Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793654739;
	b=DhfAt+OWxMDL08KYO7jSSptUEL1Nhd9I5bZyYXVODIeSUPs3Si97gEaH+fQsUJCrc5wE
	 Fjkb3gs84BTSxdM+D3ZbRoA4eguNCF+VW7SOAYgwzmLEW6atwE34QDLMGJQ8RwukgQbfS
	 6TbZNGnmYftn28KG1c3yps4WfZEQELs++pzPzafOraCddmuPSTP518lG5VHdJNWj0hV54
	 2sl4LFa83YEEGp2ge84st3z9ziaz6UUh9q+o6dC0TV0xabR9FVPRbkFUM7G03fANL7P0C
	 Ulce//Z2uSOtuDU/uwvQuV8PMOuwToyVWFuJn3I69mGCzQgx+LInllDXRYqURtS7Gdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G8mPrYpeVU+WShay0F9jEDsk5WNbHfAAQrL3XTdtRds=;
	b=ugi4cElR6c7ZkyJK2mtXFxDfjMis0U4Zt/4i1pmXG/QqJUvs/pqQNbBVPlFlXTfH7hfL
	 rMcRW682AIwIrYDbVT4433nh1Sy8wNeu+rRQdKmAIDHuVdad6f6NWWefSSa8yKbDmilJX
	 UmP9O9aAlprF1Zgqo12Ee9H0YOvkzcdFHG3Ema3efzFCUgT5N83/CRiVKQtQJ40B84vVU
	 fK8/1JOKgQdK8hSj1w8QZ2zMZAekWw/15+aj3kTg1LSqJFOrukcjALK0XTjl1FZgdd/2s
	 ulAK0PlhvSRWtJRkX5e5pEE1pEy6p9A63Cf8zDmojfqPIRtMfrbokT5VDeNc6Y7IzFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrKjcsxe;
	arc=fail smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EE2606A332
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 21:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3EE2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrKjcsxe
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369fc2e984fso349271eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 13:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793654738; cv=none;
        d=google.com; s=arc-20260327;
        b=TreUT1Avk6m49GbwXbLXCzDw82Pi98MfjiuHd+VRbz98zAvpMsjvwv6dmJMbBG1+l6
         o+bxKHoWZjG1z3mvJz6+8rcBcc21TiyzIkFcQ8QIvobSiKGVARzPz0s7Vg7ePJN5iyLB
         x30CtUYxZ1t/fgSQMYoHv2QDz23WWuoOpadKFxmxmjTWyGeLW6lAijlfIF4ZH4D6io/x
         DbuA0+Ro3P0jsJUPFkwEObeCTbLppJlhOJ8a+KoARU/B2zTM1XJVien11OHTG11dPp2C
         7w8OnV/P+a+U7q9GUkG3GFNUCwoQCIE+joqZ9L+cLbMN9gIoHB2ORT7utdVCRCPFgSMA
         pMdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G8mPrYpeVU+WShay0F9jEDsk5WNbHfAAQrL3XTdtRds=;
        fh=S1R3kp32/4Jhwo1/dS9GOIZCUE30WTrenHRA0l5aKHc=;
        b=qAaCLs7wl3+f8+Snj3MTkui+hOSx11SEl6C+jtMtBxVlKWm9kPpiVJLFzxPnC9gFvQ
         9V+kEPgDa9eHmCxumGIt5ygxM1AerYfpNGtNoz+TyjVrz+2FxfdXS7QZBB6dUP+PON+B
         81cZmlhU42f8jz9pWHwP5YjMGX5G2TNw0/feLlRF3ypB3Ug7oinjCqk0eifFkoY7Li3w
         F5xYu+7PUKJEhJCHCYkl4rBoa2IaMIARlSINTdkCSSKcnCatA/Na4ksRw9EVpgVxxRoE
         dhfxrSxn9wHGzQE8WDfS3rRDFV933LwdAtVkttXQGM3OeQUqQBtnqw+uVSlxmdtud1KB
         AeCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793654738; x=1794259538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G8mPrYpeVU+WShay0F9jEDsk5WNbHfAAQrL3XTdtRds=;
        b=hrKjcsxemS+R7t6+BuGkaaNRQAWd9Vbo6AUynjlhrP7M0Q59P6cuafnV6pNnxgFAGb
         KB02FBvER+TpA8PD8mjUF7eeoDxUswaCTWa9ij8bXEB72p4RWBNgNvg6rg3zhZy0Vx5Y
         NJDCYA7/soH/rr4G/01TLLkAsxX1ukCI6ZePr0Jo1wNBXWCMKfGOVsOhBqZ9pChaqF37
         wlRVwFP6+PsZH4brKF+ul9RXA6rThMgXO2L1LsfmaJhTEql47gogIQnZid1JQ847hSLu
         4aSmGkmYWJfGzY/3w5xVZQxROOLTYJqrO2uX5eAafjMB5Vs+olIHC52xToxgmuC8fWRc
         YqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654738; x=1794259538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8mPrYpeVU+WShay0F9jEDsk5WNbHfAAQrL3XTdtRds=;
        b=y3desatkTpt0ucF1t3MIhcLI1ZNU58jY3tJyyZP30SVNPg/py7imLHDJMnL5d7uxlL
         8yqpbz1FBBCtXYxnoMEzE23Gm5WzaRvzZ95tTzU07j8uXmmeHxJ//xYQ57tm9VzSBeWZ
         +5qEz3pRxiygHvgJQ46F2vUUVwx+Zan1tGWaDL/QUiFSCG8pMRyGj6AtIJjtJHRMG2pT
         3ukOyI6rZA4YQOtRkY/aeIxVz3Zx+pxtz+g+CbAjlxvKfO4cx6vnClxjIKiBwzu38Rr1
         BuTqGWiClrToeK9aU+QnJ0G7zbuaRZIaHQQ3YxLXSVlBD3RW1knjDWWh8+1QMDg9uTR9
         7dRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzVv8jXgEaEtv67d16r78ZHW81GgbAtf/0z+zsizG3Gn30KX1NgBbGJj/YyRwDiW94j+f6cuS9FP4z0Z8YCMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8HtKp1rlc7iZGDCpU7FTw3P5+ofoR4vaq/os+BRxV31mU28IE
	PKnzS1shNOcKLrA0IGcxfdUZAmgHEPbG6Kv4jXaDOcUzdtpBUvrG/iKdG+931ep1QFWlcewbeI+
	G4OCXR1Ce8cYfdHrlr1gXGKhBds01jMs=
X-Gm-Gg: AYBFou0dFSsX7bi690x+i98gHpelzfkxs6Gh0SFUVj5OVaqJc2c6YndW/n4QfFypMCx
	9ZNH2LLR5oIbvo7DEuwSbqDJ+/WkszAwCF+yWKNo11siaAL3ndodslHhKqQRvf21BrGXZ8oLcBo
	kU7+aNn4Nr7mPelClQt4xr5fR1a97K2A8f+XUzTgUov7Yoht3eLankOz9QsrZVk9jiATMXu920W
	RPnVk1c9Z9eMOBcMCPhONJOR70VH0bf7fzDJXPn30Ax1/5bRke22eOzs6+pchYQOlyg+ThHjDXt
	nE40eoe7ptuyltGeRbdKALBZYOqtXEfGikXDHXSUEghPh3OC8ruMgtg8R+h5eyfvoqqoyLQjTCG
	XSwvct26xFN70aaYiLZzYfnh8H0b7xJDKQHq0mY2BvlRYzIUJu4tgtNek3VbIKEIm5/GE5dIae7
	hQ/BXzvV40BfhEjb5XwQNZ2XakHjF7iSkImgK3/2Y6AB1l4gUcn1buoCK5EbeU17YHOSkitHPuC
	wMtNBP+b3+kg3kq+XeZ9IkRKZkS/jLId1Jp
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a4235ceddmr22873570eec.2.1793654738038; Mon, 02 Nov 2026
 13:25:38 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com> <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
 <CANiq72n3YfMpWndR06B0s1Mj_PjAR8MJ+0nP4XXPkaFh3zX7pA@mail.gmail.com> <DML0UIHJNE2R.3JDG4HTEN6U0S@gmail.com>
In-Reply-To: <DML0UIHJNE2R.3JDG4HTEN6U0S@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Nov 2026 22:25:25 +0100
X-Gm-Features: AclHuK9dhZ8ASIbeBndwVm6xD67vsmWuidG-t9qUn_gDwZivwLzke0us5vCUJEk
Message-ID: <CANiq72nVDshaUDKzLKsa-4kB13XvrB1-f-WaVkBecf-B45m=ag@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, 
	David Gow <david@davidgow.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 9:53=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> I first thought of disabling `#[should_panic]` tests by directly
> checking the conditions in the macro code. I ended up creating a new
> config because I thought it would be cleaner codewise, if a new
> constraint arises in the future, we just have to add it to the
> `depends on` clause instead of modifying the macro code.

It depends on what we want: if it is meant to be configurable, then it
should be a visible Kconfig symbol; if not, then it should remain an
implementation detail (which could perhaps be a non-visible Kconfig
symbol).

> Yes! they are pretty similar, for `KUNIT_FAULT_TEST`:

Yeah, in that case, I think a new visible Kconfig symbol may be
justifiable -- please see below.

> The only one that is different in `RUST_KUNIT_TESTS` is:
>
> #[test]
> #[should_panic]
> fn rust_test_assert_false_success_with_should_panic() {
>     assert!(false)
> }

I guess it is reasonable to expect this test to pass, since `assert!`
doesn't return and actually panics in normal Rust.

Having said that, I would expect our `should_panic` tests to be
generally about non-`assert*!` panics.

> On top of the reasons I gave above, I tried to follow the same as
> `CONFIG_RUST_BUG_KUNIT_TEST` or `CONFIG_KUNIT_FAULT_TEST` are doing, but
> in this case in particular, the config is not for enabling a test suite
> but for enabling a feature that can affect multiple suites (in this
> patch series the ones behind `CONFIG_RUST_KUNIT_TESTS` and
> `CONFIG_RUST_BITMAP_KUNIT_TESTS`).

Yeah, it is a "mode" -- that is why originally I thought we would try
to just do the right thing automatically, i.e. enable them when
possible, but then when I saw the description of
`CONFIG_KUNIT_FAULT_TEST`:

    Enables fault handling tests for the KUnit framework. These tests may
    trigger a kernel BUG(), and the associated stack trace, even when they
    pass. If this conflicts with your test infrastrcture (or is confusing
    or annoying), they can be disabled by setting this to N.

and I thought it may be fair to have the Kconfig symbol, i.e. it could
also be annoying to see the traces or similar, and thus it may be that
someone needs to disable this.

Having said that, if nobody has asked, we could keep it simple for now
as well -- that may be fine too.

David: what do you think? Is it something that was discussed back then
for that one in C?

Cheers,
Miguel
