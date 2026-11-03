Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793723573;
	b=0uKpV4NzPg5ync7awcUjweJisOzoV7Xkz6I785hXybU6UnIR84CZ9Sgfhz2ZIudRYOIs
	 bhRMG/dMUX2UAc+Rh6QORdt8WogLyUpxabfcGbZvIk4ZEIumqOpIg5Tp5Ickg0nC+Uj/Y
	 lYdm/Dd/5Vew9kuwyAASHovyMhAz6jYDkFpnzU2H3rAdCqRw1NUxf0wg8K+mCcI0vPoaC
	 a/2Z8vwkk6OayvopFnZR3thn34lXTHyUgxsB5isOByGILeCCZIEuaZ+s+Ri1YFnmDWVip
	 Cin6LJJzCaRmmiXXaAA4pNsXSyqt95KX14WExgVgg/s/Y+WyrkQdhyGiIXswzJT1Txg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oMXVh8m9JA3+VOPHTMjFKEf5mQ5MCDe9p1cShRw1s5g=;
	b=5eoErU7LcP1Q8iWFdFMd1gK1IAFkhqTcXk6ImOiAV+h5OirTHQcyl80CMZjJ37sBDsan
	 PFL9ZcZwyLL+f0KCkT9TL0YxpjaHiPxc+dL1lKEpGXTD2FzjztlJjtqIvMDWeqVGVyhEC
	 OIM02Ekdb8aVb/j+PfsZey7PEUGs3/nGIPOegnnO1A9G9jiIrUBAz+Trw8bVkSNyIASN0
	 yPvwfcEMOlnvWyH/RivpgZO4w85S2iD7gqe7V2043406FhhsoIqgRacqt17I1AH2Dnxwm
	 cPZtT56Xe1HfspFF3JY0dTpV0OuQhYtzGcubrR44g5iFDJRhqmQYOK4LQwhc0aOkGoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3FJQM3C;
	arc=fail smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A47606A32C
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 16:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A47606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3FJQM3C
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35159e0092aso471949eec.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 08:32:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793723572; cv=none;
        d=google.com; s=arc-20260327;
        b=d9KdbO+/lsxQOzgbItsH3a22SQ08geEGYO5pI8txPa4V/hc+mweMzesS83r2yv2iXl
         BtNOsEo+4Srwk7BHMSir0W1FXIL59BrS9BtjEi97FFaH3q8zKcRlK8hIhnuC08eDUqS+
         jpQxZ4xprethMHPniG9yZHiBpW1D3daulhtwzV9Rn954b55+07RZU+PJSTLDOVRWhCoh
         lMW5lhxtM8k63F91Z5MIoLaXPZZQGWYPGU46IGVC3ycXAPkj/PdZUWop3EfaZV1wtoya
         f+m+i406UllSZ4FaQbgAFZHcxwB9nN0fdeLv1Ol94QNcW7l4UbnYlmHqDc05w9/LPfmG
         KzAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oMXVh8m9JA3+VOPHTMjFKEf5mQ5MCDe9p1cShRw1s5g=;
        fh=FdCMwcU10xMsIdBn62v6lMtRkWR40ytY084BG/AJe1I=;
        b=YtnzRRUUe6oxpxccR72JR/rfxuGnXCSJ6peZmAS296g5dt9oz9NV3p8ebcF97tIY7z
         c9joxG1zColQYnWdGslwQFbU8b0SQHlfjy9CjO2veBhB0I97WXYT2XJQaIgWYuuiDID8
         7Rswlm6y2Q4uI01s6WP/7R0+xofr6FuiQzekpYzAwgN4DA7WLPYirBFg3BCTuQj5NeP2
         OeeGQwL3jtygNL8VuyUGcHbfaXntaoy9/oo8ZLxOnyAU2zJ+U4YkPKze/aOWBU+QrfMU
         aZ6w+ROkD23Sh8S/qrhIRglPah5kaUNIgAWNoT87KPU0cPG5+D/dIQdrtuhSyJtHYVXJ
         h/9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793723572; x=1794328372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oMXVh8m9JA3+VOPHTMjFKEf5mQ5MCDe9p1cShRw1s5g=;
        b=q3FJQM3CxAp6nXOI7CrIcPwt0ftF1W1wq2B+rAtXOlUHVSX/WwEvf2/4lc2ZHoSmKz
         lnYXZtTv2P2QyyDtQUEgOUQoJkvotlVEjNzE09zJVAbHxhi6XXgNHQ1cEKP0stCoHCYC
         ++eJ1PHCvPzL/r+hM8dBmy9CYmZ2Wv/P3ojk3TN4ga5dbA5TjgOC7rKO9DwwO8uEYUQ/
         i9VXMSRdf8VlHX862nFR4uFY5XCI98B7n7+DXFoZG6ZpUw7R4kSQjt6E6yliUWxYFdEV
         YIVP2G/KStUn6XIkORPoM+IFZM7A/2gtwvghB8fP9b86UPdgBA2WIpPnjTqvvxiZ2fm7
         J0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723572; x=1794328372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMXVh8m9JA3+VOPHTMjFKEf5mQ5MCDe9p1cShRw1s5g=;
        b=2UMHZ5XzLzUkOd2+tKU7F2X4e0l4KOkFZNF1SNEjR0EGdwE74uq8sVDH77ww6Cfhds
         oLtBBYwQSaOeKpOAEsAAkgHzmmRAG6tN4fheE3VK4dsjXJ0Zk4gFVn3vARV+EiGDQRIn
         e+90cLlNEUUO72l6sHnDDNPohcMNDNZfCoaoY734WjRVjisr5YIyEH8EVAhqlJNYBy6T
         uw0eMcJoTbf5YJ0e8Uifr7WsTiM7PJK8/b7r2qGsA7Lfua5C3oQ5ygaC4LwK9rxYSabg
         HX1FLTzj15xQcIvdzUIXJV7ukBgeSvcO8eQaAqTuxLYth1GGg7avs7ud2fetD3BZx4Hw
         gaNg==
X-Forwarded-Encrypted: i=1; AKwUvBzECYTZIdDc/ugLz1q+qmMUm3ahcLq/3KOumRjynZV863ApQQ8vdT1frNZpp5brp/MjkOBCPmGQNTKpy9VDSrQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2okDoiLU2SbwK74yxBEn5VtdRK+Maztk/nX+d4A3oXRN6HU9E
	dE0Isoz3iAQLG5Ri1K56EFzGbf4nmmEirSrKZqTpHpV1TRIsy6DyI3eUOy0Bf0ru0nvttZfJ68F
	E/f+oSWVzQPcB24IJsEp0sQeMgu0i87c=
X-Gm-Gg: AYBFou31HgcwahErJs6ZT5hfNDjyicKZEbMp/E64WXJAZtdmgiy3QNaqXRUwzuQ4abk
	Z0m14TPcukaiJfmBu99jygJArxm/caFSio0ESsZ/hjW3P/P3fRRIQbXf5ox8/LpUYnlwjU+jDVI
	q754g/JddoqCtjnU2iVhxbqUmm8EILPP16KOcKpc17xsbvzz6KZYihszha0AESOXMIIujNEWPPy
	fRbWrXxsq+OPGX9eQXoZGujA7kf9uP742i8BqA1d6G80FBrWTvKwB4SNBy8u1mvfT2MrD4yj8Zy
	i6P3NyWLnKX7oxhANeeYosKDFgFFdqsovhP0Uknyq5N0oEK1S7uP2pncHyJ+wSPm8WBnXogYZvp
	MSACjE0X9TW5AHs/86/JMwhEFFPEm1ZjzVniMaZHvj5CRatDsf7ANJ5LVuQXRtCZ3uAR2tRQiqS
	wVVqxV05M9kG2m/VHQjUh0EgdDQxoD5CknLiLcvcO5Zw4QuYdYjO4tXE+/o1N8J1b1e1kLGN+bK
	qE6t3s3LkV4jwOaISKJ8du+yAnG7NlKRzwC
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a4235ceddmr27747765eec.2.1793723572486; Tue, 03 Nov 2026
 08:32:52 -0800 (PST)
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
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com> <6d7a63ae-f08f-4973-b2d5-27be454380ef@davidgow.net>
In-Reply-To: <6d7a63ae-f08f-4973-b2d5-27be454380ef@davidgow.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 17:32:38 +0100
X-Gm-Features: AclHuK90AIFn4pqC962aeL0MAPJKIlqb3W_SNsS254mHQiyiX6txvzvtQ8rl_to
Message-ID: <CANiq72mf6Hx1YZDKv0GKwEd2gDfQtUkuA4RGhgUEfOCpR0ixDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
To: David Gow <david@davidgow.net>
Cc: nico.antinori.7@gmail.com, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 3:46=E2=80=AFPM David Gow <david@davidgow.net> wrote=
:
>
> I'd rather this not pass, personally. I think that an assert!() within a
> test should work normally (i.e., it's possible to assert that the test
> state is normal, and a failing assert will fail the test).
>
> I could be talked out of this if it's really unpleasantly different from
> non-kernel Rust, but in that case I think we'd want to make sure that
> kunit_assert!() within a test behaves like a normal assert even in a
> should_panic test.

Yeah, it all boils down to what we mean by `assert!()`.

When I implemented it back then, I intended to allow people to write
the normal asserts they would write (which could help in case we were
to e.g. import code from elsewhere, like a vendored library), as if
would have "Rust-panicked", but not "kernel-panicked".

Viewed in that light, `BUG()` would not necessarily need to make
`should_panic` succeed or not [*], but an `assert!(false)` would need
to make the test succeed. And then we could have a
`should_kernel_panic` and maybe expose a public `kunit_assert!` etc.
to distinguish them and so on.

Having said that, I am not sure how many tests would actually rely on
such differences... I think the core requirement is that, as you say,
we are able to test for Rust panics in functions we call within the
test (and ideally also other Rust panics within the test body too,
when viewed in the light above). But if something simplifies
implementation significantly, then we can consider other things.

[*] I asked an LLM to test what happens in userspace Rust when one
aborts/traps/etc., and it differs in stable between a normal test and
a doctest (with the default `panic=3Dunwind`): essentially, the former
dies, the latter succeeds -- it doesn't seem to be well-defined yet.
There is an issue for the doctest side of it:

  https://github.com/rust-lang/rust/issues/143009

and there is a bunch of discussion on the different linked PRs.

Cheers,
Miguel
