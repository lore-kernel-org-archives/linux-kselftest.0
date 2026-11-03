Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718024;
	b=TMU+bec5OXOwpE5sU63j06J5Csqt/YcDdp2KdUOwQhxIxoVubeP2Cei/WFf/1mVX5vGP
	 phCEnB6QkKuLpUo9snjZSaGNZ1ShTv9lDFJFRTFOeGHsRnboFWAFPNr/wf6XYFCfWB/v5
	 8yxX+BjRBWh1E+CnB5A2yeymkwLxDftmyOr89iTgkEtQcPg8VPUjK1sR637R+3fAojdfb
	 YGnHXoH1c1kR76D3fPvrxRH4+QYNDrigjK4Qo0EM9QInRIbF3Ap0otnLojg0AfyfzndJX
	 i0QJU4wOQy3iP0NRFf4L1vLtJ9jHIj9dQvDm1cEPoxP9jioB5RUPGtLI4oyckCx0iuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718024;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=QcAVH8lFkr8EETGF4YBY+A/GKEosys1SspPs9MQfQrw=;
	b=YB0rFRqyPuClxiEaCbGqP+EKT5yY0SgrTywqFeOw8naIbniMGCvBvIe8pFQ8GOG6aa/o
	 vQaW9gZO9Ckc3MGFp0rbb/KGu+3ayZx0JtxUC6WgM2ButQaCw/PA5R7ihOkpmC9Dh9oPy
	 brsRCYy7Sxnu0OtA0TnSrQBuF2f1ZIbns5gaPhVRrvkrKNbPX298VwXC9EvPOQ5Ca+njG
	 7uM/K7g/zz0T/s+1u28YuxyRe9isLcnr3ob9JUn388HbYV/A8jjuEvmVzGabrhqJhHVu2
	 jJPU3G28ia/HZFS5Zphchr1m+IVsnbJcxPyCp6fvzdXWnjk97esbr1qnjn79b46Qvfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754BD606D2EA;
	Tue,  3 Nov 2026 15:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754BD606D2EA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 9CD21200B14; Tue,  3 Nov 2026 23:00:20 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 6E864200AFB;
	Tue,  3 Nov 2026 23:00:17 +0800 (AWST)
Message-ID: <a60d2cf6-e44f-4fb4-be03-bb21e6d1ac85@davidgow.net>
Date: Tue, 3 Nov 2026 23:00:15 +0800
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
 <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 02/11/2026 à 22:58, Nicolás Antinori a écrit :
> On Thu Oct 29, 2026 at 1:59 PM -03, Nicolás Antinori via B4 Relay wrote:
>> From: Nicolás Antinori <nico.antinori.7@gmail.com>
>>
>> KUnit tests in Rust are written using user-space like syntax. This patch
>> adds support for the `#[should_panic]` attribute, enabling the user to
>> test conditions that are expected to cause a panic and report the test
>> as successful.
>>
>> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> 
> Hello, Sashiko found two issues [1] with this patch:
> 
>> [Severity: High]
>> Will these new selftests crash the kernel or hang when
>> CONFIG_RUST_KUNIT_SELFTEST is enabled under CONFIG_UML=y,
>> CONFIG_PANIC_ON_OOPS=y, or CONFIG_BUG=n?
> 
> This is true, I tested this with:
> 
> ./tools/testing/kunit/kunit.py run \
> 	--make_options LLVM=1 \
> 	--kconfig_add CONFIG_RUST=y \
> 	--kconfig_add CONFIG_RUST_KUNIT_TESTS=y \
> 	--kconfig_add CONFIG_KUNIT=y \
> 	--kconfig_add CONFIG_UML=y \
> 	--arch=um rust_kernel_kunit
> 
> ./tools/testing/kunit/kunit.py run \
> 	--make_options LLVM=1 \
> 	--kconfig_add CONFIG_RUST=y \
> 	--kconfig_add CONFIG_RUST_KUNIT_TESTS=y \
> 	--kconfig_add CONFIG_KUNIT=y \
> 	--kconfig_add CONFIG_PANIC_ON_OOPS=y \
> 	--arch=x86_64 rust_kernel_kunit
> 
> And some other configs using the configs causing problems.
> 
> To solve this I created a new config "RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE"
> that depends on !UML && !PANIC_ON_OOPS && BUG. If the test is annotated
> with `#[should_panic]` and CONFIG_RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE=n,
> the test won't run and won't show up in the summary.
> 

This is failing on UML for me, too. I'd rather have an implementation 
which worked on UML (such as a panic_handler), rather than trying to 
intercept BUG().

If you do want to add a new config option, I'd probably call it 
something like HAVE_KUNIT_RUST_SHOULD_PANIC, and set it in the 
architecture configs, but piggy-backing on the existing 
CONFIG_KUNIT_FAULT_TEST is probably best. And if we do want to support 
non-Rust panics, then this probably shouldn't be a rust-specific option.

The RFC's panic_handler-based implementation worked fine for me on UML, 
so I'd stick with that.

And, of course, UML isn't the only architecture that can't handle faults 
(though it might be the only one Rust supports at the moment). e.g., 
SPARC also would fail here.

>> [Severity: Medium]
>> Does defining macro_rules! assert and macro_rules! assert_eq at module scope
>> in kunit_tests() leak the preceding test's #should_panic value into helper
>> functions or impl blocks defined later in the module?
> 
> This is also true, the solution was redefining the `assert!` and
> `assert_eq!` macros inside the function's body (as Sashiko suggested).
> 
> I'll wait a bit in case there are any feedback on the current series and
> send a v3 with these changes.
> 

As mentioned, I'm not a big fan of including should_panic in the 
assert!() macros, so if we can just do away with that, this should no 
longer be a problem.

> Best Regards,
> Nicolás
> 
> [1] https://sashiko.dev/#/patchset/20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com?part=1


Cheers,
-- David
