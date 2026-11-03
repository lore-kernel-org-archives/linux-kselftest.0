Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717159;
	b=q19Z3jTgBRA9GEi9juKSxnC6fDd1Ki/fKbibgmHohVwY4pExCpYcv02qhxs5Lf+jl7Cm
	 mbbgqiHO5JySLL+fqftJWwVGSsw365UUog/HnTwXBsVlwyykmji3ZsadyyURI/KmjQm2U
	 F+qKixpO/k3aoiAPeym3kXZEfTnCBoLpOg5y4lVOOUAI6IT46C/iVwaFr+Q9NWi6yzc3B
	 7tjUhv6tVDE4Hts4zwqi629y2J0IeW/YvO/fnlE+OhB4caZSM9JhJmdg36e5KYOofkZeN
	 TP9yn6o3ilHqRVXv46uCWNsQgT7GS4tTyXSo8JHOip3801qZ7oBfS9Djrk4ZEARKCDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717159;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=TWkxYsyQ175zAT7PvX0d/6/Q2MTcK82yiJRpTdRcvCQ=;
	b=yuMjpII9f2wRuVQQ7WjugNodxoBLPpHjyos2fRyZ0OU3oLErdBLeiLc6gAYl+fm1raeJ
	 Le+hM0kI3gJH3ZGRuHcNt4t/vxdex0WnOixxUVEs+Y0ZeCDHRcFqsPhmQGnbf7PYATt5I
	 fxHS+9WTKjK7CpeX48jNx4kNz4Pk4KA6rk2rpxqlrGCAQND/kS5Y9XmwBocZRNvLmtWDB
	 FL6CIh3l6jzg2co8VDm9XhG4usXxbR9ikI7ZFQdMosYmLVtb0tP9gQc4Ys7AlFCcNvao+
	 Za+XNev4G/Sg4UfisFU5o4WKXJhZaqfUiyv8iv0CL+GD770L68ZB2p3JTBr92owZuuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB34606A324;
	Tue,  3 Nov 2026 14:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB34606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 8A2D3200B11; Tue,  3 Nov 2026 22:45:49 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id A9BB0200B03;
	Tue,  3 Nov 2026 22:45:44 +0800 (AWST)
Message-ID: <35284b5b-bf0c-4585-ad3e-a76bae4be7df@davidgow.net>
Date: Tue, 3 Nov 2026 22:45:41 +0800
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
To: nico.antinori.7@gmail.com, Alice Ryhl <aliceryhl@google.com>,
 Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>,
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
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks very much, Nicolás.

I've had a closer look at the new version of this, and have a few 
comments. Ultimately, I think a mix of this version and the original RFC 
is probably best, and in particular, using a panic_handler instead of 
modifying kunit_try_catch, and removing the special-case assert!() 
handling would be ideal.

Le 30/10/2026 à 00:59, Nicolás Antinori via B4 Relay a écrit :
> This patch series intends to implement two features for KUnit tests
> written in Rust. The work is based on a TODO comment made in the
> `bitmap.rs` module [1].
> 
> Changelog:
> 
> v2:
> - Added more tests in `rust/kernel/kunit.rs` testing Sashiko findings
>    and changes.
> - Solved Sashiko: "[Low] kunit: spurious "try faulted" error logs for
>    successful #[should_panic] tests": Solved by adding
>    `rust_should_panic` in `kunit_try_catch` C struct to check if the test
>    is expected to panic and act accordingly. Dismissed what I first talked
>    about in [3].

I think if we only handle Rust panics, this should go away, right?

> - Solved Sashiko: "[Medium] kunit: assert! macro in #[should_panic]
>    tests causes unexpected failure": Solved by making `kunit_assert`
>    macro aware if the test should panic and act accordingly. Dismissed what
>    I first talked about in [3]
> - Solved Sashiko: "[Low] kunit: missing diagnostic log for
>    #[should_panic] tests that fail to panic": Added an error message when
>    a test that was expected to panic do not
> - Solved Sashiko: "[Low] kunit: dead_code error for test wrappers with
>    inactive cfg": Solved by moving the #[cfg(..)] attributes on top of
>    the wrapper functions
> - Dismissed Sashiko: "[Medium] rust: bitmap: memory leak in
>    owned_bitmap_out_of_bounds() test panic": Not sure if can be done
>    anything. If I am not mistaken this is the same issue as stated here [4].

Yes, the issue in [4] (that tests exiting early is unsafe) is known and 
kind-of unfixable. It does mean that we'd want to avoid deliberately 
panic-ing if we at all can.

It's possible to avoid resource leaks by using the KUnit resource / 
defer functionality, but that's not readily exposed in Rust at the 
moment (and it's likely to be highly non-idiomatic).

> 
> Sashiko report links: https://sashiko.dev/#/patchset/20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com?part=1
> 
> v1:
> - Removed 'stringification' of test names (to avoid clash of names for
>    different configurations now a number is appended).
> - Added bool `rust_should_panic` attribute to `kunit_attributes` C
>    struct

I like this, but if we're calling it 'rust_should_panic', it should only 
affect Rust panics.

> - Removed #[panic_handler] in Rust side, checking for aborts in the C
>    side (`kunit_run_case_catch_errors` function). This allow to catch
>    panics triggered, for example in a Rust function that called a panicking
>    C function.

Ultimately, I think that we probably want to restrict #[should_panic] to 
Rust panics at this stage, so using #[panic_handler] would work best.

This greatly simplifies the implementation, and makes it much more targeted.

If we do really want to support panics from C, then I think we want to 
build this on top of the warning suppression feature[1], and expose it 
from C as well as Rust. It only traps WARN(), rather than BUG(), though.

> - Now the tests that have an inactive #[cfg(..)] do not appear un the
>    KUnit execution summary as ignored, they just do not run.
> Link to v1: https://lore.kernel.org/all/20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com/
> 
> - RFC patch: https://lore.kernel.org/rust-for-linux/cover.1789500084.git.nico.antinori.7@gmail.com/
> 
> 1. Supporting `#[should_panic]` [2]:
> 
> KUnit tests in Rust follow the user-space syntax, but at the moment
> `#[should_panic]` is not supported. The first patch of this series adds
> support for the attribute (only in its basic form, `#[should_panic =
> "message"]` is not supported yet).
> 
> The way it is supported is by adding a new boolean property called
> `rust_should_panic` to `kunit_attributes` struct in kunit/test.h and in
> `kunit_attributes` in kunit/try-catch.h and check for the
> `try_catch->try_result` code and the named flag to detect if there was a
> panic in `kunit_try_catch_run` function.

I think rust_should_panic as an attribute is good, but it should just be 
checked from a panic_handler. If it supports more than just rust panics, 
it probably shouldn't be called *rust_*should_panic (and again, should 
probably be based on the warning suppression instead).


> 2. Allow same test name with different #[cfg(...)]:
> 
> When testing `#[should_panic]` in `bitmap.rs` (check the last patch of
> the series) I found that the test that was supposed to panic had the
> same name as another one, but they were run on different configurations.
> This caused the following compilation error:
> 
> ERROR:root:error[E0428]: the name `kunit_rust_wrapper_owned_bitmap_out_of_bounds` is defined multiple times
>     --> ../rust/kernel/bitmap.rs:503:1
>      |
> 503 | #[macros::kunit_tests(rust_kernel_bitmap)]
>      | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `kunit_rust_wrapper_owned_bitmap_out_of_bounds` redefined here
>      |
>      = note: `kunit_rust_wrapper_owned_bitmap_out_of_bounds` must be defined only once in the value namespace of this module
>      = note: this error originates in the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
> 
> Now, only the tests with an active `#[cfg(...)]` will be executed by the
> runner. Tests with an inactive `#[cfg(...)]` will not appear in the
> report since they are not added to the TEST_CASES array.

This is great, thanks!

> 
> [1] https://github.com/Rust-for-Linux/linux/blob/fd73f4a6659897191fa0d40695fe370925dd3780/rust/kernel/bitmap.rs#L592-L600
> [2] https://doc.rust-lang.org/rust-by-example/testing/unit_testing.html#testing-panics
> [3] https://lore.kernel.org/all/DM41PHVITKOG.3I6P2X8048BEP@gmail.com/
> [4] https://github.com/Rust-for-Linux/linux/blob/fd73f4a6659897191fa0d40695fe370925dd3780/rust/kernel/kunit.rs#L129-L136
> 
> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> ---

Cheers,
-- David

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=85347718ab0dd7ede9c3e1dcff2d604c7073df05
