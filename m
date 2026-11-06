Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943117;
	b=TA25/7NrD+gMcZnWTR+mtdGfdGBbXWXy0ew/phRXif625WSIMDsF35psZuap/W5lEJB5
	 YmT+G7mGoIXRpZgn9NNFBtHwU7Y0ZktRzSiYQ7t5LS4Di/iKZwrCzsS/pvs6QX+FHBMN6
	 iYVG6LUQzm/xLI+rKSK11zlQ/9XM9WdSgA3p6D6y/UjE41n92GwrEOg/EX/SjFpp4fqsT
	 cKxhhiKpPOD4e6OetHKpyr+hVz+wSEtR5VY2hgEX2TyF720mVe1QqMBBvzFAnipDMpiOv
	 o4cirBn8UBALQAVOpVNEBGOGlhz+obnHm2Jg0ufgW3J0aNCobdUbgtcD2rJb3A3bs8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943117;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iFv6UDAE6z1TR7XHXUV1b+ZE3XYtdlg7tecb2VlPlag=;
	b=sIoaJk6Yok5FRkoRzeWswkqERBCk15Bc2j+DFTtGG+aj25nSiuecsbZ9Pj0LCzB8F4Sa
	 CIknz3p1MmBOJPisN+tvxXU/r/R88azt1/YWfkDU3Nk1ccbRdMA+yW7FR8H5EqzwcqLpT
	 Imn0PCV7pdOA6MdlM7/pE7FeiIYYkv6CtQdF1Lp0f+R59h7G/0c1MnAewIri0k/QIZWHg
	 FbGB/onmL1/5LxFeruzuXqcI57tZ0+fnYpMtninR9nY7eR8NpcjJrZ9CnHrF7LDhJ//1z
	 t2JOCVhLgaJAT1PwNn9KZVl1ObZRK60DyA9rBYEvtJOeY7wbtqosCwoQLureeBcnFJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E609B606A326;
	Fri,  6 Nov 2026 05:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E609B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 066AC200B9B; Fri,  6 Nov 2026 13:31:55 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::9c4] (unknown [IPv6:2001:8003:8802:7000::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 5E314200B8A;
	Fri,  6 Nov 2026 13:31:52 +0800 (AWST)
Message-ID: <c5f8bee6-0380-4a61-9c4e-b9a01be84a13@davidgow.net>
Date: Fri, 6 Nov 2026 13:31:49 +0800
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
Subject: Re: [PATCH v2 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>,
 Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Yury Norov <yury.norov@gmail.com>, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <35284b5b-bf0c-4585-ad3e-a76bae4be7df@davidgow.net>
 <DMNBNKKPHI0H.EZQ7YA2CSMEA@gmail.com>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <DMNBNKKPHI0H.EZQ7YA2CSMEA@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 05/11/2026 à 9:46 PM, Nicolás Antinori a écrit :
> On Tue Nov 3, 2026 at 11:45 AM -03, David Gow wrote:
>> Thanks very much, Nicolás.
>>
>> I've had a closer look at the new version of this, and have a few 
>> comments. Ultimately, I think a mix of this version and the original RFC 
>> is probably best, and in particular, using a panic_handler instead of 
>> modifying kunit_try_catch, and removing the special-case assert!() 
>> handling would be ideal.
>>
>> Le 30/10/2026 à 00:59, Nicolás Antinori via B4 Relay a écrit :
>>> This patch series intends to implement two features for KUnit tests
>>> written in Rust. The work is based on a TODO comment made in the
>>> `bitmap.rs` module [1].
>>>
>>> Changelog:
>>>
>>> v2:
>>> - Added more tests in `rust/kernel/kunit.rs` testing Sashiko findings
>>>    and changes.
>>> - Solved Sashiko: "[Low] kunit: spurious "try faulted" error logs for
>>>    successful #[should_panic] tests": Solved by adding
>>>    `rust_should_panic` in `kunit_try_catch` C struct to check if the test
>>>    is expected to panic and act accordingly. Dismissed what I first talked
>>>    about in [3].
>>
>> I think if we only handle Rust panics, this should go away, right?
> 
> Yes, it should. Since we won't `BUG()` anymore in case a test should
> panic, the test thread won't exit with `-EINTR`. Because of this we
> won't need to shield the feature behind a Kconfig symbol either, since
> we won't have error logs in successful tests.
> 
> Here's the raw output from the panic handler version:
> 
> KTAP version 1
> 1..1
>     KTAP version 1
>     # Subtest: rust_kernel_kunit
>     # speed: normal
>     1..1
>     # rust_test_kunit_panic_in_kunit_test.speed: normal
>     ok 1 rust_test_kunit_panic_in_kunit_test
> ok 1 rust_kernel_kunit
> 
> for test:
> 
> #[test]
> #[should_panic]
> fn rust_test_kunit_panic_in_kunit_test() {
>     panic!("This test should panic and pass");
> }
> 

Looks great!

>>> - Now the tests that have an inactive #[cfg(..)] do not appear un the
>>>    KUnit execution summary as ignored, they just do not run.
>>> Link to v1: https://lore.kernel.org/all/20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com/
>>>
>>> - RFC patch: https://lore.kernel.org/rust-for-linux/cover.1789500084.git.nico.antinori.7@gmail.com/
>>>
>>> 1. Supporting `#[should_panic]` [2]:
>>>
>>> KUnit tests in Rust follow the user-space syntax, but at the moment
>>> `#[should_panic]` is not supported. The first patch of this series adds
>>> support for the attribute (only in its basic form, `#[should_panic =
>>> "message"]` is not supported yet).
>>>
>>> The way it is supported is by adding a new boolean property called
>>> `rust_should_panic` to `kunit_attributes` struct in kunit/test.h and in
>>> `kunit_attributes` in kunit/try-catch.h and check for the
>>> `try_catch->try_result` code and the named flag to detect if there was a
>>> panic in `kunit_try_catch_run` function.
>>
>> I think rust_should_panic as an attribute is good, but it should just be 
>> checked from a panic_handler. If it supports more than just rust panics, 
>> it probably shouldn't be called *rust_*should_panic (and again, should 
>> probably be based on the warning suppression instead).
> 
> If we consider failed `assert!` from outside a #[test] function panics,
> then I'll leave it like this, otherwise I am thinking of
> `rust_should_fail`.
I had a closer look at this: the assert!() macro (and equivalents, like
assert_eq!(), etc.) are defined to call panic!():
 https://rust.docs.kernel.org/core/macro.assert.html

So I'd definitely keep the rust_should_panic name. (You could make an
argument for `should_rust_panic` instead, but I don't particularly like it.)

I don't think `rust_should_fail` would be a good name: the whole reason
this affects assertions is that they become panics, and we're
implementating rust's "should_panic", so should keep that nomenclature
so long as we're aiming for compatibility with that.

Cheers,
-- David
