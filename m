Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943103;
	b=nL4TRZ807uc55yBr4FK+ecsh8N6BCS7hJEOS9oNRtXdOp3LPs4pGjAYqztEZXS6EQsj+
	 3T8oETJBHokxACx9e2TdpoyQH4yyDjMnREyxXTCOJ1wWAEQP8gIjMzBptELDaj7oxGApw
	 RMBCRcFTUKYKGpVxr4rBON/gwTzFMvMjHIdGoJ9HsOE9IGCFH57g+5ksd9FRciWL161qW
	 ffmtRJjxwFDehwrqfumc3vBOtI619p2bxRQLR4KqR8Zs9lc/+AGTa8p57KRSWFD/Cy7ya
	 o0kQ+C5s3BdXH+IBnMdw6wivDX/pZlhdpBX3WRpkeSjbbo4EORnWp3KVj26rveWRJ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943103;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=PMkgxEobG3EV5w0QtxVO2/ARBVVzHfZf7E6+9rM2mjY=;
	b=jBs20ZXsz/LtZU0QiKKTOwxonbJSiq448ym+aOF4W4ZtlMIX816KIsFiASL/6VDZaeES
	 GHjiUek4HvLv0q+ryEblLwMmPoW1sD2ZbR/ZCZfXhbkjaDWG6SP/BAYAO3MUv02mhvr1a
	 NH99AbQjMpcKjyH6IgNL/hLUEyDDFX2Xxnh388Yr22TWJqQrTcqA4xj5FttdaxDb53rSS
	 Ezx3FH68Dke+0s/XXVU1+0gXb4fd4DGGKqBEWH8ORYYk8ASRxDNW9ihfNMxvuzfOYLbVP
	 /cB00207wFlG6dCNM6dgKRCnCfkGy+dfhte0UZNByrZnIl3I8Bd6HV5dDTyCWZimjhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78295606A326;
	Fri,  6 Nov 2026 05:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78295606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id D5313200BA4; Fri,  6 Nov 2026 13:31:34 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::9c4] (unknown [IPv6:2001:8003:8802:7000::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 06766200B84;
	Fri,  6 Nov 2026 13:31:31 +0800 (AWST)
Message-ID: <06e83174-8fe3-4cca-a357-3c351d0873a2@davidgow.net>
Date: Fri, 6 Nov 2026 13:31:31 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: nico.antinori.7@gmail.com, Alice Ryhl <aliceryhl@google.com>,
 Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, Alexandre Courbot <acourbot@nvidia.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>,
 Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Yury Norov <yury.norov@gmail.com>, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com>
 <6d7a63ae-f08f-4973-b2d5-27be454380ef@davidgow.net>
 <CANiq72mf6Hx1YZDKv0GKwEd2gDfQtUkuA4RGhgUEfOCpR0ixDw@mail.gmail.com>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <CANiq72mf6Hx1YZDKv0GKwEd2gDfQtUkuA4RGhgUEfOCpR0ixDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 04/11/2026 à 12:32 AM, Miguel Ojeda a écrit :
> On Tue, Nov 3, 2026 at 3:46 PM David Gow <david@davidgow.net> wrote:
>>
>> I'd rather this not pass, personally. I think that an assert!() within a
>> test should work normally (i.e., it's possible to assert that the test
>> state is normal, and a failing assert will fail the test).
>>
>> I could be talked out of this if it's really unpleasantly different from
>> non-kernel Rust, but in that case I think we'd want to make sure that
>> kunit_assert!() within a test behaves like a normal assert even in a
>> should_panic test.
> 
> Yeah, it all boils down to what we mean by `assert!()`.
> 
> When I implemented it back then, I intended to allow people to write
> the normal asserts they would write (which could help in case we were
> to e.g. import code from elsewhere, like a vendored library), as if
> would have "Rust-panicked", but not "kernel-panicked".
> 
> Viewed in that light, `BUG()` would not necessarily need to make
> `should_panic` succeed or not [*], but an `assert!(false)` would need
> to make the test succeed. And then we could have a
> `should_kernel_panic` and maybe expose a public `kunit_assert!` etc.
> to distinguish them and so on.

I'm pretty convinced that #[should_panic] should fail for anything other
than a deliberate panic!() (including panic!() implemented via an
assertion). Another failure (be it BUG(), an invalid memory access,
etc.) feels like a separate thing. The example I'd give is a test which
is deliberately trying to trigger a panic!() or assert!() to verify
that, e.g., an invalid input/state is caught: if the code tried to
handle the invalid state and crashed, that shouldn't be a pass.


For assert!(false), while I personally don't like that this will cause a
test to pass -- it feels confusing to me -- I'm okay with having this
work for compatibility with upstream Rust.

How about:
- If #[should_panic] is set, we don't override assert!()/assert_eq!():
instead of getting compiled down to a KUnit assertion, they use the core
implementation which will panic!() on failure, and get caught by the
panic_handler. This should match upstream Rust behaviour (because it is
upstream Rust behaviour), and avoid having to plumb a bunch of
should_panic things through the C assert macro implementations.
- If a test really wants a KUnit assertion, the option of using
kernel::kunit_assert!() is there, which will behave like the C
assertions: a failed assertion will cause the test to fail. Of course, I
don't think we need to implement this until someone actually needs it.

> Having said that, I am not sure how many tests would actually rely on
> such differences... I think the core requirement is that, as you say,
> we are able to test for Rust panics in functions we call within the
> test (and ideally also other Rust panics within the test body too,
> when viewed in the light above). But if something simplifies
> implementation significantly, then we can consider other things.

Yeah, I'm hesitant to do something which involves either a lot of
plumbing in C, or a significant difference in behaviour between tests
written in C and Rust unless we've got a real use-case here.

Disabling the assert{,_eq}!() overrides for tests with #[should_panic]
seems to be the appropriate compromise to me, though.

> [*] I asked an LLM to test what happens in userspace Rust when one
> aborts/traps/etc., and it differs in stable between a normal test and
> a doctest (with the default `panic=unwind`): essentially, the former
> dies, the latter succeeds -- it doesn't seem to be well-defined yet.
> There is an issue for the doctest side of it:
> 
>   https://github.com/rust-lang/rust/issues/143009
> 
> and there is a bunch of discussion on the different linked PRs.
> 
Thanks,
-- David
