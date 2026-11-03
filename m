Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718357;
	b=KggTDTIHQtyXOOd6Zvdhx4SspXsosbdTDu2zOhGXcam8VGLtZgDaLAzpPSpE3tX5bfSa
	 E3kNrlQb2dLG/5p6XBv6fDhnJEJ+yQlUQ/L++aRa3c1mME08Ydn6qqMAQZRoMXct5oDnH
	 H/nU4cBET+u40uARgys+pP3FjBEaQAuF+40ubnKOdS+36lGA7s12/XMHlEfeSH0zkmZxi
	 OpJG58G7YG9ZIipciq3tDCIHLA5RyMjuIQrDsKnStZVHJ9mbJfIl5no2TPIlvwnzZ7tTp
	 c1Wz/t8lzuU65xhCRNCWc6l3LOrCBTkRnsriwRLYwfp1GPWwSuKarr10Hkygy/b+QAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718357;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=C9mGMY/NcmGa/5ufEWTJ1c6Uow/xSKfjaWA14ecFym4=;
	b=ZasqFIFzGtYkMwTWfr9mNJUbxpZ+QscTIodP69S8zfvjDqlemowZZyShMurtWaD986RS
	 nXp2avVVrqMz9gvcQCMOsCJnHX7A5IjbSnwTsb/Q9yq32AMzmc78AZyIOInxO91pMQeT5
	 bwAKvneJbOMpED7tEM5oEkMccGSnLYX49/0SKnvoIiVQOAWCDSvkNEz6EvfbZ2dVLIrZC
	 yCsEIVkNWORy2g2RILMZZMA/CdqMBEuonTbHfpknw7RLM8cbvslU0dt4HByLsKEWM1fvj
	 CpajVHiPD0oAa4eQemXo8K26RoW9EVgNjdrlDK/RSWc630s8JZ/GJSzCGYjBzfV6N2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DA8606EEB9;
	Tue,  3 Nov 2026 15:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44DA8606EEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 4918A200B16; Tue,  3 Nov 2026 23:05:49 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 7FBCC200AF7;
	Tue,  3 Nov 2026 23:05:45 +0800 (AWST)
Message-ID: <afdefb9a-7f59-4f37-9c6f-682ea411bde8@davidgow.net>
Date: Tue, 3 Nov 2026 23:05:43 +0800
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
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>,
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
 <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
 <CANiq72n3YfMpWndR06B0s1Mj_PjAR8MJ+0nP4XXPkaFh3zX7pA@mail.gmail.com>
 <DML0UIHJNE2R.3JDG4HTEN6U0S@gmail.com>
 <CANiq72nVDshaUDKzLKsa-4kB13XvrB1-f-WaVkBecf-B45m=ag@mail.gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <CANiq72nVDshaUDKzLKsa-4kB13XvrB1-f-WaVkBecf-B45m=ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/11/2026 à 05:25, Miguel Ojeda a écrit :
> On Mon, Nov 2, 2026 at 9:53 PM Nicolás Antinori
> <nico.antinori.7@gmail.com> wrote:
>>
>> I first thought of disabling `#[should_panic]` tests by directly
>> checking the conditions in the macro code. I ended up creating a new
>> config because I thought it would be cleaner codewise, if a new
>> constraint arises in the future, we just have to add it to the
>> `depends on` clause instead of modifying the macro code.
> 
> It depends on what we want: if it is meant to be configurable, then it
> should be a visible Kconfig symbol; if not, then it should remain an
> implementation detail (which could perhaps be a non-visible Kconfig
> symbol).
> 

The reason KUNIT_FAULT_TEST was user-configurable is that some test 
harnesses / CI systems would automatically mark a test failed if they 
saw a panic/WARN stacktrace in the kernel output.

>> Yes! they are pretty similar, for `KUNIT_FAULT_TEST`:
> 
> Yeah, in that case, I think a new visible Kconfig symbol may be
> justifiable -- please see below.
> 
>> The only one that is different in `RUST_KUNIT_TESTS` is:
>>
>> #[test]
>> #[should_panic]
>> fn rust_test_assert_false_success_with_should_panic() {
>>      assert!(false)
>> }
> 
> I guess it is reasonable to expect this test to pass, since `assert!`
> doesn't return and actually panics in normal Rust.
> 
> Having said that, I would expect our `should_panic` tests to be
> generally about non-`assert*!` panics.
> 

Yeah, I really don't like the way this effectively reverses what 
assert!() does. I'm sort-of okay with it in indirectly-called code (I 
want to check that this function panics if I pass an invalid input, and 
don't care whether it calls assert!() or panic!()), but it's really 
confusing from within the test function.

Plus there's a whole bunch of special-cased code to make kunit_assert!() 
behave this way in this patch, and if we could get rid of that, the 
whole thing would be much cleaner.

(Of course, that introduces an inconsistency depending on where the 
assert!() is, which isn't particularly nice, though I'd be prepared to 
tolerate it to make everything else behave as expected.)

>> On top of the reasons I gave above, I tried to follow the same as
>> `CONFIG_RUST_BUG_KUNIT_TEST` or `CONFIG_KUNIT_FAULT_TEST` are doing, but
>> in this case in particular, the config is not for enabling a test suite
>> but for enabling a feature that can affect multiple suites (in this
>> patch series the ones behind `CONFIG_RUST_KUNIT_TESTS` and
>> `CONFIG_RUST_BITMAP_KUNIT_TESTS`).
> 
> Yeah, it is a "mode" -- that is why originally I thought we would try
> to just do the right thing automatically, i.e. enable them when
> possible, but then when I saw the description of
> `CONFIG_KUNIT_FAULT_TEST`:
> 
>      Enables fault handling tests for the KUnit framework. These tests may
>      trigger a kernel BUG(), and the associated stack trace, even when they
>      pass. If this conflicts with your test infrastrcture (or is confusing
>      or annoying), they can be disabled by setting this to N.
> 
> and I thought it may be fair to have the Kconfig symbol, i.e. it could
> also be annoying to see the traces or similar, and thus it may be that
> someone needs to disable this.
> 
> Having said that, if nobody has asked, we could keep it simple for now
> as well -- that may be fine too.
> 
> David: what do you think? Is it something that was discussed back then
> for that one in C?
I've always thought of CONFIG_KUNIT_FAULT_TEST as being a more general 
switch for tests which can cause faults, but the name and description to 
imply it's more of a switch for just those tests. I'm happy to keep 
CONFIG_KUNIT_FAULT_TEST as the generic implementation here, but if we 
really want another one, they both probably should chain off a single 
CONFIG_HAVE_KUNIT_FAULT_HANDLER or similar.

That being said, I'd prefer we go back to the panic_handler 
implementation for should_panic, as I think we're asking for trouble 
with Rust tests which deliberately panic in C code. Ideally, Rust tests 
will only trigger Rust panics deliberately. The panic_handler-based 
imeplementation works fine on UML.


Cheers,
-- David
