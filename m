Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815103;
	b=aV4DWL+Vo/EaGWRomATDSgoQLlqU1bG47zybPoXuUeDyeT0E+5zZVYsiPKfzdTWXf6Ps
	 YKhBitc//q2EbFcgkryKMm97SdtoP/7P13p8LfhzU1FblxzOuGiLOq+yTw8dLe/2Z0Qrl
	 BvktYPvN2JPx7UcBkAq10XVg3hRGlYj5pTZdmqOz/9BJD4uZ3XpGNpus5zOmdan6vHzau
	 3jdtBV+5riIZ1HJIBNd1tJt9vAkv397nmCQRBlqXtu2gm/vY4r+TsT+hjgtuwLgeoZU35
	 4rUQnBMTjj0F05BuAj1SdeNud+EmkE2dmKtchdN43HKWdMRaX7x9Bu2WiWsrUGRt1Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=7MTwvegNcrWNlqIzsX8vDMeEMAODD2BGpm3hKSu2Oyk=;
	b=WD3QjWbrEqzC01qA9x5qBw6LSs3hvxe4hAgaOBmJNZNSCaE+Np/Res6qViS39B4Jq5eY
	 Zp3OEa7iN4H0WzJgca33neWaxRRmysZVetwEDZnKHw36HjNOECx0RGMgU9KgzMQvL48aI
	 krVxLFipfqm7CJRJMlj6HpEZC65nJmNQ5omAPJy6Dq8SsQkC9LRPdm60vA/PIBwUPiN98
	 2IuAF+zHiuKsCY7v7ZtAVx1K6/nklC8fnMfSc0eC2ZIWFZm+mguHuCS8Pmuons6XPczF2
	 athSrKDiv9HB9pRHsekIKKkmSGGDhiopHoLTDpI5EzcvbxBKZKvxuyRevld3UwtpLYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eIOnuKLD;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AFB606A337
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 17:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06AFB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eIOnuKLD
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1931ff67a29so799090c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 09:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793815102; x=1794419902; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7MTwvegNcrWNlqIzsX8vDMeEMAODD2BGpm3hKSu2Oyk=;
        b=eIOnuKLDvj0RPAFrN4u31VRalOFZCPBygVwdjiDS0iBogU/TDKQW5JxxQ052g8ctZQ
         94zn34cEHDFCA9IZZpxyta9wzsziXcYFwM9Ol1ss5RZaIvqBAOKTFSfHcpQXZemvgId8
         8haP2CC9r2/Ij+oIJ8TUkYOFkAyV1QwN6mXzdcoDF4Rm2ENloQ1A/HlKBLp/B/xlWR4Q
         bGG1rysMniaw28VItrrKw9SNmmHINI2K/7NyrjhuPfhmCKl0LcssmWavB5QBqycOT8BP
         cHzS1Whedy1lz4cE5XpdIWFgqZsKhGpvG9Jw/9jKHVtBuiazIKDNNb6Dx4SJcgzC0+mO
         a5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815102; x=1794419902;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MTwvegNcrWNlqIzsX8vDMeEMAODD2BGpm3hKSu2Oyk=;
        b=Hoz35W/MMn9/cn8qeTlxtJB3k9u4u/0nRFOIJDnFMhJevJFcETQfYVn74WmHhsNKYY
         ikdNL7dcKsbNzpURseqIiRuNC2fpuSCEYmaJMyUUE9f2YkCOWaVOn3lp7HK/Hq3fvk25
         W3O2VSPdkacO5RlXKLF/tvHDOyikgN/U3xA42iMqAKm+sKZ+mU3YcCmy9M6mBRlW1xs3
         2DEXm8DoVvBQlUW28XAFP4hwqegcvNeaxr4lvHgZ6XVnFlNiMqF3wnBy3x3U5ttiXjyt
         17x+w/IyHViUW3bQahRRJTlr5N9CrXKHY2s3by4YtGZ3huwSxKu3zATd/pct1StbQwz/
         HSzA==
X-Forwarded-Encrypted: i=1; AKwUvBwBy02CL76umAss75xvYxc2QHdz/a8IYMSRZbEkdWC7xea7UwPqfOXwEc/NlhO2c+jygwf1jju1mOcbo+eEkRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S4ApZaC3HIFEXFeqhsT8L+lDVJ/TBGVqlsZnDjhmg2gCy4jst
	Bza8rsq7OvGjBYjSiUZS0sDk5ngpeEU1eLiZnP97+1bfEnr9xlfi2/Xywhde
X-Gm-Gg: AYBFou1xeQltX3IY3GEuasjhukcervkg5QLFCLaI2QZatFhRuu/dhRczXULPUtT+7hq
	UPL7KYuiLbnpv817D8lAX754vjeI8Msl4WSv0Odha0P/xP6+9bk+zjeq6G1/CjvTsBuepWDrZ1n
	HPXikcJdbgmST9yWphL5nekH1h7919IktAj9RAe5bYfEXJ4Q02XIeA44VBmxernHMEIX852AiLv
	lpreZBjZeKt2jiyFJ60biQqA1a7Jl0SuVIH1v2TpzcQZDu157tWJwKjNryMT3+EiesndKqUqhcH
	3XGkrmnria3R+2b57rutnUwAM94VeOms8LW/lDnaGWZ+I30QiP7b9iKh16JwhoLw300qYaA/jSw
	KHp2kZ6qr5j/T0r7R4NAp7iU/eGpuBSXssSPv1FBROXj0/BvhkmmRRElbZzhcQ8zMw+jvCjUZeZ
	ezwqqzuZyLUH2fSScPP17rCD3JyrmIAshUYTWtrIyN9cXZBQtpl1f7kEf5MTBXyRERxPrH3DaJ0
	d9cheXziciLy217Okp1lVP0PUeHmE0JiS+Q1XQSFcGwPTTu2UwMbj1uKMGThjJqVerHC6+efhuN
	3rKXfs+1dO2iKQ+PJVp1L5ENiRomaQSofbP6VU6gqerSE40c01PbrbYSxPJOEvAH
X-Received: by 2002:a05:701b:4589:b0:190:f24b:9491 with SMTP id a92af1059eb24-1ac59fbfa7cmr24234218c88.12.1793815102044;
        Wed, 04 Nov 2026 09:58:22 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c69c3fsm8874668c88.20.2026.11.04.09.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 09:58:21 -0800 (PST)
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
Date: Wed, 04 Nov 2026 14:58:15 -0300
Message-Id: <DMMMDQO787UH.353XT44UDG8YS@gmail.com>
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
In-Reply-To: <6d7a63ae-f08f-4973-b2d5-27be454380ef@davidgow.net>

On Tue Nov 3, 2026 at 11:46 AM -03, David Gow wrote:
> Le 30/10/2026 =C3=A0 00:59, Nicol=C3=A1s Antinori via B4 Relay a =C3=A9cr=
it=C2=A0:
>> From: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>>=20
>> KUnit tests in Rust are written using user-space like syntax. This patch
>> adds support for the `#[should_panic]` attribute, enabling the user to
>> test conditions that are expected to cause a panic and report the test
>> as successful.
>>=20
>> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>> ---
>
> Thanks very much.
>
> I'm afraid I'd rather go back to the RFC's design of only triggering on=
=20
> Rust panic!(), rather than on failures in C. It's a much simpler=20
> implementation, and makes more sense for a rust-specific #[should_panic]=
=20
> to me.

No problem at all!=20

I'll be sending the v3 with the panic handler then. I decided go this
way because I thought it would be useful to catch C panics, but those
would be rather rare cases.

The only thing I am not yet sure regarding the panic handler
implementation is how to read the `rust_should_panic` attribute from
`kunit_case` struct. If I am not mistaken, there's no way to retrieve
the test case linked to the running KUnit test from Rust. Would it be ok
to add a public `kunit_get_current_test_case()`? I am not sure if that
struct is meant to be used outside the runner.

> Secondly, I'm not convinced we want to alter the behaviour of=20
> assertions. At least KUNIT_ASSERT_* should still be useful in a test=20
> ensuring that the state of the system being tested makes sense before a=
=20
> deliberate panic!(), and arbitrarily reversing the meaning of assert!()=
=20
> feels confusing to me.

I am going to rollback this change.=20

The thing I think is worth keeping is declaring the redefinition of
`assert!` and `assert_eq!` inside the function's body because depending
on the order of the code, an `assert!` in a non `#[test]` function
inside the test module can get replaced by a `kunit_assert!` (this was
something caught by Sashiko in the v2 review).

> That being said, I understand if we want assert!() from _outside_ the=20
> test (i.e., an assert!() in the code being tested, not the test itself)=
=20
> to be considered a panic!().

IIRC the panic_handler version did this.

>> +		} else {
>> +			if (test->last_seen.file)
>> +				kunit_err(test, "try faulted: last line seen %s:%d\n",
>> +					  test->last_seen.file, test->last_seen.line);
>> +			else
>> +				kunit_err(test, "try faulted\n");
>> +		}
>>   	} else if (exit_code =3D=3D -ETIMEDOUT)
>>   		kunit_err(test, "try timed out\n");
>>   	else if (exit_code)
>> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
>> index 25ff272d29b2b3f192a3968481c1d5417df4335b..5e688b743ee2152867e2f99c=
7f18b86e1b7fbe3d 100644
>> --- a/rust/kernel/kunit.rs
>> +++ b/rust/kernel/kunit.rs
>> @@ -58,7 +58,7 @@ pub fn info(args: fmt::Arguments<'_>) {
>>   #[doc(hidden)]
>>   #[macro_export]
>>   macro_rules! kunit_assert {
>> -    ($name:literal, $condition:expr $(,)?) =3D> {
>> +    ($name:literal, $test_should_panic:expr, $condition:expr $(,)?) =3D=
> {
>>           'out: {
>>               // Do nothing if the condition is `true`.
>>               if $condition {
>> @@ -93,6 +93,14 @@ macro_rules! kunit_assert {
>>                   ));
>>                   break 'out;
>>               }
>> +            // If condition fails but the test should panic, then we ju=
st abort.
>> +            else if $test_should_panic {
>> +                // SAFETY: FFI call. The `kunit_test` pointer is valid =
because we got it from
>> +                // `kunit_get_current_test()` and it was not null.
>> +                unsafe {
>> +                    $crate::bindings::__kunit_abort(kunit_test);
>> +                }
>> +            }
>
> I'd rather us keep asserts working as normal: a failed KUnit assertion=20
> shouldn't be considered a panic. If normal Rust assertions (particularly=
=20
> those outside the test-specific code) compile down to a panic, though,=20
> that's okay.

I'll revert this. I made the change because in user space those tests
pass [1] [*].

>> +    }
>> +
>> +    #[test]
>> +    #[should_panic]
>> +    fn rust_test_assert_false_success_with_should_panic() {
>> +        assert!(false)
>
> I'd rather this not pass, personally. I think that an assert!() within a=
=20
> test should work normally (i.e., it's possible to assert that the test=20
> state is normal, and a failing assert will fail the test).

Same comment as [*].

Thank you very very much for the detailed review in the series and the
insights!=20

Also, thank you Miguel for joining the discussion!

Best regards,
Nicol=C3=A1s=20

[1] https://play.rust-lang.org/?version=3Dstable&mode=3Ddebug&edition=3D202=
4&gist=3D2b4b29a266271497ea9932068ecdb8ff
