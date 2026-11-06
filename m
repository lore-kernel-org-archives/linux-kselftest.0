Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943102;
	b=J09+FKBhMV5XENBcphWSaGlcSutIKeOWhwXWittUuC/ZJ1ugZfxzjZiX4qtJR2mQgY8j
	 RxWBJUZ1mXHMgFGjrn4HQHY5aC3m9R+pwsdsH+BVnDu5ZZHNdSBK80EPCi3haNUAZjXsJ
	 GSIQ52CvAgZmAgWo0WXfn8gjjywIaNicWkWx3USyk9lyTfP2BUhn1WQXTntxOJVyIFXXg
	 NMuTrrfz35Se5I+Ypj2zg+W776/6X30S+RIcaK5dl4p5B1wHwK9gdPjR4GVnEs1VjMxIm
	 1zOShdsq9uzbYR0VCIunXfJoHKsU6XWyAU530LJmYY1fMIAVwfMgmwpOJMQLCHwnxMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943102;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=RHCFiECYgAwybZmXSpvhSH8JhRznABzRBb5PpBumb+8=;
	b=l+80XKR7x8pVL/VeR3EEVNgQrjkoBqWX4I5ua2bQkr0TY5dBVVhoQrm6JhUy0yJ07C1Y
	 T87y+GWUu3b6ZUXYX7Ith9rHvchL+jOM0TMRiT6HDhjw+Qtk6LoXkGwCpB7O+e95q2OGt
	 pJuygM2gISSv3Vkah/RsEersz90fIlMdkTG56ySS4LNywdk9nu+3Eq0JbN0uUo3M5BIu5
	 vrIYaKTKuIUyVox7ZWdA+NOVOJuC/dHNmAE1Hf9NtZtg/70Rg+6BDxIvBdOsvgVWD2bZj
	 DuIpmgXgoBfUnqoWVtpdD6+Gys6QSJAmQZjZpOxpb9ueiCHw/KGvs6GWeUJDUEIWGFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C6606A329;
	Fri,  6 Nov 2026 05:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E6C6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 0C171200B9C; Fri,  6 Nov 2026 13:31:33 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::9c4] (unknown [IPv6:2001:8003:8802:7000::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 8EC64200B8B;
	Fri,  6 Nov 2026 13:31:28 +0800 (AWST)
Message-ID: <e7301e33-4813-4382-84e6-5c82a70b1ad7@davidgow.net>
Date: Fri, 6 Nov 2026 13:31:25 +0800
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
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com>
 <6d7a63ae-f08f-4973-b2d5-27be454380ef@davidgow.net>
 <DMMMDQO787UH.353XT44UDG8YS@gmail.com>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <DMMMDQO787UH.353XT44UDG8YS@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 05/11/2026 à 1:58 AM, Nicolás Antinori a écrit :
> On Tue Nov 3, 2026 at 11:46 AM -03, David Gow wrote:
>> Le 30/10/2026 à 00:59, Nicolás Antinori via B4 Relay a écrit :
>>> From: Nicolás Antinori <nico.antinori.7@gmail.com>
>>>
>>> KUnit tests in Rust are written using user-space like syntax. This patch
>>> adds support for the `#[should_panic]` attribute, enabling the user to
>>> test conditions that are expected to cause a panic and report the test
>>> as successful.
>>>
>>> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
>>> ---
>>
>> Thanks very much.
>>
>> I'm afraid I'd rather go back to the RFC's design of only triggering on 
>> Rust panic!(), rather than on failures in C. It's a much simpler 
>> implementation, and makes more sense for a rust-specific #[should_panic] 
>> to me.
> 
> No problem at all! 
> 
> I'll be sending the v3 with the panic handler then. I decided go this
> way because I thought it would be useful to catch C panics, but those
> would be rather rare cases.
> 
> The only thing I am not yet sure regarding the panic handler
> implementation is how to read the `rust_should_panic` attribute from
> `kunit_case` struct. If I am not mistaken, there's no way to retrieve
> the test case linked to the running KUnit test from Rust. Would it be ok
> to add a public `kunit_get_current_test_case()`? I am not sure if that
> struct is meant to be used outside the runner.

Yeah, this is a pain. In theory, struct kunit_case / struct kunit_suite
are internal to the executor, but we end up having to pass them around a
lot, and a way of getting the current test's attributes is, at a
minimum, something we should support.

I'd rather not expose the struct kunit_case to test authors (though
exposing it to the Rust macros is fine by me: they're sufficiently
KUnit-internal that it's fine). The ultimate best 'public' API would
probably be to have a bunch of 'kunit_get_attribute_value()' style
things, but that's definitely a more involved thing.

How about we compromise on a way to get the attributres for the current
test. The simplest implementation for that is probably just including a
pointer to struct kunit_attributes in struct kunit.

(Though the better long-term solution would be to pass a struct
kunit_case pointer in struct kunit, and generally rework things to not
pass struct kunit_case/kunit_suite around as regularly. There are a lot
of gotcha's there, though, so it's not worth holding this up on that.)

>> Secondly, I'm not convinced we want to alter the behaviour of 
>> assertions. At least KUNIT_ASSERT_* should still be useful in a test 
>> ensuring that the state of the system being tested makes sense before a 
>> deliberate panic!(), and arbitrarily reversing the meaning of assert!() 
>> feels confusing to me.
> 
> I am going to rollback this change. 
> 
> The thing I think is worth keeping is declaring the redefinition of
> `assert!` and `assert_eq!` inside the function's body because depending
> on the order of the code, an `assert!` in a non `#[test]` function
> inside the test module can get replaced by a `kunit_assert!` (this was
> something caught by Sashiko in the v2 review).
> 
>> That being said, I understand if we want assert!() from _outside_ the 
>> test (i.e., an assert!() in the code being tested, not the test itself) 
>> to be considered a panic!().
> 
> IIRC the panic_handler version did this.
> 
>>> +		} else {
>>> +			if (test->last_seen.file)
>>> +				kunit_err(test, "try faulted: last line seen %s:%d\n",
>>> +					  test->last_seen.file, test->last_seen.line);
>>> +			else
>>> +				kunit_err(test, "try faulted\n");
>>> +		}
>>>   	} else if (exit_code == -ETIMEDOUT)
>>>   		kunit_err(test, "try timed out\n");
>>>   	else if (exit_code)
>>> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
>>> index 25ff272d29b2b3f192a3968481c1d5417df4335b..5e688b743ee2152867e2f99c7f18b86e1b7fbe3d 100644
>>> --- a/rust/kernel/kunit.rs
>>> +++ b/rust/kernel/kunit.rs
>>> @@ -58,7 +58,7 @@ pub fn info(args: fmt::Arguments<'_>) {
>>>   #[doc(hidden)]
>>>   #[macro_export]
>>>   macro_rules! kunit_assert {
>>> -    ($name:literal, $condition:expr $(,)?) => {
>>> +    ($name:literal, $test_should_panic:expr, $condition:expr $(,)?) => {
>>>           'out: {
>>>               // Do nothing if the condition is `true`.
>>>               if $condition {
>>> @@ -93,6 +93,14 @@ macro_rules! kunit_assert {
>>>                   ));
>>>                   break 'out;
>>>               }
>>> +            // If condition fails but the test should panic, then we just abort.
>>> +            else if $test_should_panic {
>>> +                // SAFETY: FFI call. The `kunit_test` pointer is valid because we got it from
>>> +                // `kunit_get_current_test()` and it was not null.
>>> +                unsafe {
>>> +                    $crate::bindings::__kunit_abort(kunit_test);
>>> +                }
>>> +            }
>>
>> I'd rather us keep asserts working as normal: a failed KUnit assertion 
>> shouldn't be considered a panic. If normal Rust assertions (particularly 
>> those outside the test-specific code) compile down to a panic, though, 
>> that's okay.
> 
> I'll revert this. I made the change because in user space those tests
> pass [1] [*].

Having thought about this a bit more, I think there's a compromise:
could we make the override of assert!() and assert_eq!() only appear on
non-should_panic tests. In that case, the assert!() and assert_eq!()
will behave the same as userspace tests (indeed, they'll use the same
code), and we won't need a complicated implementation. And later if we
want the (IMO, more logical) KUnit-style assertions which aren't
negated, we could suggest people use kernel::kunit_assert!() directly
(or with a small wrapper), so it's obvious the behaviour is different
from upstream assert!().

Thoughts?

> 
>>> +    }
>>> +
>>> +    #[test]
>>> +    #[should_panic]
>>> +    fn rust_test_assert_false_success_with_should_panic() {
>>> +        assert!(false)
>>
>> I'd rather this not pass, personally. I think that an assert!() within a 
>> test should work normally (i.e., it's possible to assert that the test 
>> state is normal, and a failing assert will fail the test).
> 
> Same comment as [*].
> 
> Thank you very very much for the detailed review in the series and the
> insights! 
> 
> Also, thank you Miguel for joining the discussion!
> 
> Best regards,
> Nicolás 
> 
> [1] https://play.rust-lang.org/?version=stable&mode=debug&edition=2024&gist=2b4b29a266271497ea9932068ecdb8ff


Thanks again for the patch!

Cheers,
-- David

