Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317964;
	b=nLwcGd2A46bfByy/vhLmH8B8UcdTSC1udI5CUhbm0V7kzBhQHePn1jQA08nR0IWi0GT/
	 tOx02ajyHSm4fTLPBQJTACVZAhTHcLvvCoeQkL/fdHvUAjiiNFmWckcKjuOhHSC5kfvUk
	 92g0WyuShcFfFBfh64JqwT3NzE78m5xhKlE7ypuPFT8iEnK/xJgyUuF6LWKKr/kHk7321
	 8YzymXEwVK8Fg1qelzRFi2DIJVI4SCuGedWgQZR+WlmUmy5I+fdAq8YAcRkFQ4umpZZ3E
	 acqj2BN2NyilB7dPO4gfmEq0h14BSAAiVm2S4kiGXytIaorhSyJImTR8SrGTJ473YkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=wrYdLEXUQczC45027W7j/17QxqnElVdgY/9dzZeBiks=;
	b=nIFDVdu7AMnnsSsbrJAyUApAoZR52brd3CUI+ky2x8MaN8OKowPHuZhILnYdMFsgAjYg
	 mqYcnXU5qHGSnR6i0v+Rz+YaCkm9BMnuad6cXiAv7IUrISV6zhMqBN66GarQvYYduZM1Z
	 DEOzah7jzDDWj0fyzIwFYh3ZbJr6Pmu2HMWTbIMpQadNUGbn2etMPq5/MAG35qWdNo3Xe
	 wpurkebIyoyVS5sAPPFDkJOLHOw4bFUQQOi/qZswKH+ew6Sk/7lxLOyzR2wzVcP9ieUMv
	 t4FfvG3o21OruDLzs4kRED+7UzcB7StVcii1WnIOi058UNJXGon8HJWmQg+TI3nQ4og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Jbfz6kh/";
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA198606A330
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 13:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA198606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jbfz6kh/
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67990a45e02so1957927d50.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 05:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794317963; x=1794922763; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wrYdLEXUQczC45027W7j/17QxqnElVdgY/9dzZeBiks=;
        b=Jbfz6kh/HpDc+iYvSMq+UD27VNHlFLPHcbic2zVDi+JV7ZfeXFUIEbMhdvsJYMtQD7
         6tDwNbi5/fxQaTlyxIlz+BsqrNDOaoUW8Nim91YHiIh3tvKr8//JolyFGlzJ5cZHy5ld
         KSfLQBQTPTmMVV5tCIi0vOS7Eg6cYK23ihpvtZmD36PM0vNB/h9Z4ZZFgL88WS97gMfy
         8PWPw+IdllFB+D8w1sPQwGBaDYNLUH9EGuw8NN+zAG+wV6bxulLNs1+EZdEGhahjW1BT
         v3p3HAQ9/xSKxm4FgZTtEUkXmfArxUyS7hUpAEy0HomOQ1Fw37vo8H6R/+ziuteR1QkA
         wbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317963; x=1794922763;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wrYdLEXUQczC45027W7j/17QxqnElVdgY/9dzZeBiks=;
        b=qxE6vce6127j4jx6M4fL9JrsCE43LQvJENOmDg4oq0tV/LZV+DseTdzHNH3IC1jvWK
         4hcEP1zAXhDKEDdCkY0t+kzLtHHgRdyidJLx/a3sRIQV/JDBzT7Aa0kcJLcZLRyKZwRC
         iqIE3LEPxPmeAuJ+IuqNQgpIbW1T2PmHpExBpH9cuZE/GWm5qDqOv174mjwT9PFujVqB
         HIVqIvg3nHK850GaBYEeEWJn+Trs+eSp10IArOgY54Gz7YjvYGf/hpGHGm36UhQ2eLnE
         omBsTzYSM/td8bcIDJIcWoki0jQsSx3PNR8WH045JKfeUAGB/yB5u8CNYmB+C/P3SQio
         NGAg==
X-Forwarded-Encrypted: i=1; AL+hErFe4hK0Ji/KHpxBrYhPhF00ivL1/sP/+ZQgazZOCMZ1eDlWtolRnUTsJx8rNMwxYznxbZxIUC6tVcJBrVtO0As=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qvo6PHpI6E54pN1FiZ7RvOQmsVMMgpyAU0LWKui4HSL7V5BVD
	wafdW83ZHp4xn64ulBnClavIs3JfvLf0ik6eSWfNHy7Dz23w5UccdN0=
X-Gm-Gg: AYBFou0qC8yBarWzffD37ltTJ1B/z6KZauchdJPXAsgt4y4n14wBeEy44qVsUaOQffd
	EImhs5s/eI+JVZgcOxFyqDxC2bou7ZReDiBrQOIwYikh1aV7ezJG7l7/cgPDisRVnir4hquJXfr
	lzi7fonc3eXCEYc6Ct5IGpAuaZt4SiBb1JVYccUeCgv58e5mrFzRw3ztHzjxiD5IE580lwQWiHG
	qBU5xZT1dfUbBrfMD90EhOgkDQXACI+YeKHB+/xId9s1VetxuGtlIwUAVeHz9tvC4PkUy92SGAr
	wrHprCtRuHkh5Z2oqb/KObi3PlelaHOrdCfSMpVRS5vUWmUgaTac4vSo+fYCsl6xjO2bfxuu5uC
	b7tl7yKecrMuqxY4KVaq5vh2A9e429ToRPatbW7s7S3gHJqAflHjMdBxFKMzkb4PME8OgXFTE7o
	qMJXw7pCyJKhB6r3PgaiFPZNsBi1CzUKgLGQkr9xozILzifXuHde/WmhFv6toY9c5BfyRLv6D2x
	COi4pHwLubbEt6VID718paDjK5WfiXgZknuFJZBzBBP+J881vIESVMUf+5Zk0bKqBmWKEBKjHFU
	q7Gyww1h2ypxVO/WL4D/If9GRX3E5acRbyGB6NV2duztvg/+zpi8VTSxrNPrbUz+
X-Received: by 2002:a05:690e:4810:b0:67b:f249:5820 with SMTP id 956f58d0204a3-67c5676f8d1mr1411133d50.41.1794317962789;
        Tue, 10 Nov 2026 05:39:22 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3934643aasm18888917b3.43.2026.11.10.05.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:39:21 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 10:39:14 -0300
Message-Id: <DMRKMOLNNODA.3M7QNVIBGVI5R@gmail.com>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "David Gow" <david@davidgow.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Benno Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Burak Emir" <burak.emir@gmail.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com>
 <6d7a63ae-f08f-4973-b2d5-27be454380ef@davidgow.net>
 <DMMMDQO787UH.353XT44UDG8YS@gmail.com>
 <e7301e33-4813-4382-84e6-5c82a70b1ad7@davidgow.net>
In-Reply-To: <e7301e33-4813-4382-84e6-5c82a70b1ad7@davidgow.net>

On Fri Nov 6, 2026 at 2:31 AM -03, David Gow wrote:
> Le 05/11/2026 =C3=A0 1:58 AM, Nicol=C3=A1s Antinori a =C3=A9crit=C2=A0:
>> On Tue Nov 3, 2026 at 11:46 AM -03, David Gow wrote:
>> No problem at all!=20
>>=20
>> I'll be sending the v3 with the panic handler then. I decided go this
>> way because I thought it would be useful to catch C panics, but those
>> would be rather rare cases.
>>=20
>> The only thing I am not yet sure regarding the panic handler
>> implementation is how to read the `rust_should_panic` attribute from
>> `kunit_case` struct. If I am not mistaken, there's no way to retrieve
>> the test case linked to the running KUnit test from Rust. Would it be ok
>> to add a public `kunit_get_current_test_case()`? I am not sure if that
>> struct is meant to be used outside the runner.
>
> Yeah, this is a pain. In theory, struct kunit_case / struct kunit_suite
> are internal to the executor, but we end up having to pass them around a
> lot, and a way of getting the current test's attributes is, at a
> minimum, something we should support.
>
> I'd rather not expose the struct kunit_case to test authors (though
> exposing it to the Rust macros is fine by me: they're sufficiently
> KUnit-internal that it's fine). The ultimate best 'public' API would
> probably be to have a bunch of 'kunit_get_attribute_value()' style
> things, but that's definitely a more involved thing.
>
> How about we compromise on a way to get the attributres for the current
> test. The simplest implementation for that is probably just including a
> pointer to struct kunit_attributes in struct kunit.
>
> (Though the better long-term solution would be to pass a struct
> kunit_case pointer in struct kunit, and generally rework things to not
> pass struct kunit_case/kunit_suite around as regularly. There are a lot
> of gotcha's there, though, so it's not worth holding this up on that.)

I'll add a kunit_attributes pointer to kunit then! I can rework this
later to add the public kunit_get_attributre_value functions.

>>>>   #[macro_export]
>>>>   macro_rules! kunit_assert {
>>>> -    ($name:literal, $condition:expr $(,)?) =3D> {
>>>> +    ($name:literal, $test_should_panic:expr, $condition:expr $(,)?) =
=3D> {
>>>>           'out: {
>>>>               // Do nothing if the condition is `true`.
>>>>               if $condition {
>>>> @@ -93,6 +93,14 @@ macro_rules! kunit_assert {
>>>>                   ));
>>>>                   break 'out;
>>>>               }
>>>> +            // If condition fails but the test should panic, then we =
just abort.
>>>> +            else if $test_should_panic {
>>>> +                // SAFETY: FFI call. The `kunit_test` pointer is vali=
d because we got it from
>>>> +                // `kunit_get_current_test()` and it was not null.
>>>> +                unsafe {
>>>> +                    $crate::bindings::__kunit_abort(kunit_test);
>>>> +                }
>>>> +            }
>>>
>>> I'd rather us keep asserts working as normal: a failed KUnit assertion=
=20
>>> shouldn't be considered a panic. If normal Rust assertions (particularl=
y=20
>>> those outside the test-specific code) compile down to a panic, though,=
=20
>>> that's okay.
>>=20
>> I'll revert this. I made the change because in user space those tests
>> pass [1] [*].
>
> Having thought about this a bit more, I think there's a compromise:
> could we make the override of assert!() and assert_eq!() only appear on
> non-should_panic tests. In that case, the assert!() and assert_eq!()
> will behave the same as userspace tests (indeed, they'll use the same
> code), and we won't need a complicated implementation. And later if we
> want the (IMO, more logical) KUnit-style assertions which aren't
> negated, we could suggest people use kernel::kunit_assert!() directly
> (or with a small wrapper), so it's obvious the behaviour is different
> from upstream assert!().
>
> Thoughts?

I think it is a good solution! Making explicit that there is a different
behavior using a different kind of assert, will make the tests easier to
understand (since we are mimicking the userspace API, a Rust dev will
expect a #[should_panic] test to pass if a common assert! fails).

I'll be sending a v3 this week!

Regards,
Nicol=C3=A1s=20
