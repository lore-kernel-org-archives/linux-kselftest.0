Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793652797;
	b=Yq3HoHBmGVmrOy+ADjemWyu/aRHd2dZ3OnRl+nR+KxzKqUTsAqsaQkWFDuOGJeh6ks2z
	 F64cLnjPsi7oaDIReMN0yOlp1MAaAoV7JY0h5mbHUKdUqREdrs83ggfDCH/Topfxz61P7
	 tlIx2ZMkrXm1JabOTOi7/Mdik16lYM/wCR61zxbIL4Z4ZDVSXtb1bHgsehYl7OZCViAe7
	 jeS0cOjgJhFC+SKC41WEbLoUgy2WrBmFsyVhwwJ45gN7NuT2qd3TlZbMjI2znvVZiYYaz
	 +IbBPJWSfMBIT32sxNtDnbRRdv82MVzodHmwYVTzpOcYWkqzzXXimvo1oTwB4B6y0rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=e2uq0IAsarHDTLXqFZ/CFLC17YQu7mmJAfgLDCf/Xbw=;
	b=CI7Z3eqY7UsMmtOub1TMh+TOmwM+Xx3TCKVRWT/0Pc89fAfMa44dKVRh1iwaTWpqd76y
	 AGjBtwR4V+Zud7HS2hNwqc0oss5kE/iBHA4aIgKQAUyeiMk0rXMNZGmZj4ftuTOE6/MAv
	 /L52h7Cgegi1U5hokEl/RymmxNLli+1MQL7E6u1sJ94enIABEeUUH6Vp9wF0KLCNJ5C8T
	 nwmG4eroOZqCXHA7M4XgPe/67OG2COGCNsV6xpOicGVoOloHLr0KU6zCbgMj4AWsNmMI3
	 JQxbYA6Dvi8N4n+wj7hmXFpXyexpi46rc4tLkebZHTBknAoiD6radIainI2N1cec0SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qy4/nMyO";
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2D7606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 20:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qy4/nMyO
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eac01ff101so1271782e0c.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 12:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793652796; x=1794257596; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e2uq0IAsarHDTLXqFZ/CFLC17YQu7mmJAfgLDCf/Xbw=;
        b=qy4/nMyOD2tvlZ+lCMFZXzwX1bR7Z92mNyX9ed8vsHjy7D8YOFf4wJCD3irRABXwuv
         tRnRQ3a07FzomD3HdEtcyU9aC01aB3cnxpkSjm5itPFUZkohG6yNZnbuaiU/rJpHVsMH
         m2t0ECWmneskImGe5GHRozAhoak3QNDdWYS7K/0BH7eYUz4VPR6UEAoO8o2zPh30ifYY
         O3TPOYxgDVLaHuCN1vNAVUUFoLoi7/h+/28kcDEzunmUFPeTaQQkx4nx7Jk+zhfor3Ql
         EnO+FXOs+ry3iOjWASHJ0AssEdooqmV81e5NQPjjQ5WLjSZ7mnqlG90WrETa5W7j05BE
         86/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652796; x=1794257596;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2uq0IAsarHDTLXqFZ/CFLC17YQu7mmJAfgLDCf/Xbw=;
        b=EndGWlOTo19PiboMlGYnjre555CR3wkMCadWsAl+toK+mrYrKSs9k51sgE9pYCAwyE
         3cKVfcLyNWEry1+iQaGpU52v3/VA8a9iVkwvmzWkQl2bljA2mie+BHwIFS3IS5UOgk+0
         IxnkkyEJY+i9Qjw7sznyt+ywAWZ2l4aWmagOvN0y0tN9gEdXF/94SYEDBVaAmjPl6xaD
         HtE9K8PHnHgu9qC4s1VU/vAuAZaKhe++4zyKjI/OpbqBLKs1H6XTCEGQNk8H7jy9K9lP
         xN/37bi5uDzHPFT0QMeCK7Ru8uKeLUPdAfWcojt7UnOtIucSjPZIFV82mba/4eh8ksWH
         csDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuLm8hXYMT28ZtpH7k4aMFgxpFexioxWENLwZk5alcmnDXz/9RXKtYlZRuWCRcqkgGOPhm8w604sXuPdocH4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xY+RiNZWBrCytDG1lc4iBFFvPVq/JWKaJCN1kFq01l1gjRICM
	6PXAGTTSwwJOFzcskKtoihLcVHUkBBBlbIRdgfugqIt4Ay95QL8WY2k=
X-Gm-Gg: AYBFou2XqYTI4gv1/EsBiYXBUXn9T1caxAk9o2goq3tuUbqCV9wBswXnu1fZRQ7kKm0
	gg0eRDT8tQA1Hd1Zy//Tq++dt8dEJacEifhHiwbkpROcb1t8pRd37ZPBojC9mB4EwiU6ZmVmQhV
	vAh5kA1kUSNdx89OcxlnGm5I1xnV40LT8fd4HaSpod9rOTPzyklr1QTjvGEH/cLgbNW6pX3zYkh
	4BWTbjv6Vq+Q75b5SEniFa+OXHRC5fo2JrxHw5EP+3td9yySmzHwNGuKMOzEigZfKSSGA+EYwZg
	YMy/kmWAm1UsfRz4J3UXWU6doAerK6MlL7daBbwsNzqiMxQd9txKdbOBhYxEFUr2G3ldcXoRhRH
	aS8CmGSJ5bG3bm1np7M4/k2P9DRXsEyLNLM0JYqFmuPaJPl+vilFGPe91AD2wE4SKp5hgO8fxX4
	BHshs1oL+F1eldk2ds1PZ/mxN+hsR+OFc7bRIsvB/jY3qRTNhfMefQvCIIiKXqIPexD5da3OLrY
	j10rI8DScgyc6eRSaOZt0ptfGvlI8MPckiemGrTPuz1FNRYlTAeeickIRROnicjiQggtZcRW5bL
	OTLkAE8OOjzsnphsD8tnsvwSYogW9zkMaKggXafSAtR9x0/qioPxy3TjS22fKUOZuQ==
X-Received: by 2002:a05:6122:d2a:b0:5ea:d14a:ef8f with SMTP id 71dfb90a1353d-5ec6870c5d1mr4724163e0c.4.1793652795618;
        Mon, 02 Nov 2026 12:53:15 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69caeccdsm10740493e0c.16.2026.11.02.12.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 12:53:15 -0800 (PST)
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
Date: Mon, 02 Nov 2026 17:53:05 -0300
Message-Id: <DML0UIHJNE2R.3JDG4HTEN6U0S@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Benno Lossin" <lossin@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Gow" <david@davidgow.net>, "Gary Guo" <gary@garyguo.net>, "Miguel
 Ojeda" <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Burak Emir" <burak.emir@gmail.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com>
 <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
 <CANiq72n3YfMpWndR06B0s1Mj_PjAR8MJ+0nP4XXPkaFh3zX7pA@mail.gmail.com>
In-Reply-To: <CANiq72n3YfMpWndR06B0s1Mj_PjAR8MJ+0nP4XXPkaFh3zX7pA@mail.gmail.com>

On Mon Nov 2, 2026 at 12:51 PM -03, Miguel Ojeda wrote:
> On Mon, Nov 2, 2026 at 3:58=E2=80=AFPM Nicol=C3=A1s Antinori
> <nico.antinori.7@gmail.com> wrote:
>>
>> To solve this I created a new config "RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE"
>> that depends on !UML && !PANIC_ON_OOPS && BUG. If the test is annotated
>> with `#[should_panic]` and CONFIG_RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE=3Dn,
>> the test won't run and won't show up in the summary.
>
> I was wondering if we needed the flexibility, i.e. if we could just
> simply disable them when the conditions are not satisfied, but I guess
> given `CONFIG_KUNIT_FAULT_TEST`'s existing description, it may make
> sense to have a new Kconfig symbol=20

I first thought of disabling `#[should_panic]` tests by directly
checking the conditions in the macro code. I ended up creating a new
config because I thought it would be cleaner codewise, if a new
constraint arises in the future, we just have to add it to the=20
`depends on` clause instead of modifying the macro code.

> -- do the ones added here look
> similar in the kernel log to those fault ones?

Yes! they are pretty similar, for `KUNIT_FAULT_TEST`:

KTAP version 1
1..1
    KTAP version 1
    # Subtest: kunit_fault
    # module: kunit_test
    1..1
BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 0 P4D 0
Oops: Oops: 0002 [#1] SMP NOPTI
CPU: 0 UID: 0 PID: 30 Comm: kunit_try_catch Tainted: G                 N   =
7.3.0-18137-ga2943ba718b4-dirty #357 PREEMPT(lazy)
Tainted: [N]=3DTEST
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 11/11/2019

... <Registers and stack trace> ...

note: kunit_try_catch[30] exited with irqs disabled
    # kunit_test_fault_null_dereference: try faulted: last line seen lib/ku=
nit/kunit-test.c:100
    ok 1 kunit_test_fault_null_dereference
ok 1 kunit_fault

For `RUST_KUNIT_TESTS` (left only one that panics to shrink the log, but
they are all pretty much the same):

KTAP version 1
1..1
    KTAP version 1
    # Subtest: rust_kernel_kunit
    # speed: normal
    1..1
rust_kernel: panicked at ../rust/kernel/kunit.rs:399:9:
This test should panic and pass
------------[ cut here ]------------
kernel BUG at rust/helpers/bug.c:7!
Oops: invalid opcode: 0000 [#1] SMP NOPTI
CPU: 0 UID: 0 PID: 29 Comm: kunit_try_catch Tainted: G                 N   =
7.3.0-18137-ga2943ba718b4-dirty #357 PREEMPT(lazy)
Tainted: [N]=3DTEST
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 11/11/2019

... <Registers and stack trace> ...

    # rust_test_kunit_panic_in_kunit_test.speed: normal
    ok 1 rust_test_kunit_panic_in_kunit_test
ok 1 rust_kernel_kunit

The only one that is different in `RUST_KUNIT_TESTS` is:

#[test]
#[should_panic]
fn rust_test_assert_false_success_with_should_panic() {
    assert!(false)
}

That logs:

KTAP version 1
1..1
    KTAP version 1
    # Subtest: rust_kernel_kunit
    # speed: normal
    1..1
    # rust_test_assert_false_success_with_should_panic.speed: normal
    ok 1 rust_test_assert_false_success_with_should_panic
ok 1 rust_kernel_kunit

Because a BUG() is never called, the failed assertion is catched in the
`kunit_assert!` macro and, if the test should panic, the KUnit thread is
aborted without throwing a failed asssertion.

>
> (And I was wondering because, in general, adding Kconfig symbols has a
> price: users may get confused etc.).

On top of the reasons I gave above, I tried to follow the same as
`CONFIG_RUST_BUG_KUNIT_TEST` or `CONFIG_KUNIT_FAULT_TEST` are doing, but
in this case in particular, the config is not for enabling a test suite
but for enabling a feature that can affect multiple suites (in this
patch series the ones behind `CONFIG_RUST_KUNIT_TESTS` and
`CONFIG_RUST_BITMAP_KUNIT_TESTS`).

If this is prone to causing confusion, I think I am going to check the
contraints direclty in the code.=20

Thank you for the feedback!

>
> Cheers,
> Miguel

