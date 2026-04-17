Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD96374E60;
	Fri, 17 Apr 2026 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776416548; cv=none; b=dBQznBCcL1I+ZYV1AbjRhWNblClHxLDonzHKRGXGk5YY/o06+BTmxltfYUFHPU4sSfIO167wotIq0Jcvhz4KB4QyQnqa9CFJjFmauXiT1Yl8PULUaAZde4QsIYxcjpTTzB8pTVZNe2hm+JY0qd+c5qvI38JAiIeqKAGIHvgOrlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776416548; c=relaxed/simple;
	bh=FGi5XB1sh7bSU/oLua66mQ5Kek498bqkQiAvdQmOkSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PhNAagxLt5zDiE+/azbWVd+4Jo2bGPdKvCX/HMb2ZPBuXBv/BKbmWzZGx21R0uhtSvSLC5Z/NkIfl9Ek/awuhwmmt2AsWf2Fd23wEw2ga40D16bdbUAQgjAoiwRsa8Z4D10P2J2uqUznLFSnDcRUPUouaNumhc+F2ldROqyhktg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=AAE52J45; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=hRA4TmFG; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="AAE52J45";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="hRA4TmFG"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1776416544;
	bh=FGi5XB1sh7bSU/oLua66mQ5Kek498bqkQiAvdQmOkSg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=AAE52J45KXOaRFJ5DM9lk8SYja/Ac+DPFXC9Bw5M7VeMjLwQWyycI8jrQl77+rx/O
	 G+mGnckqr+YBgZBNPEwaEj6QG+ehT+8UiEAOuEwPm7cmeln2OYSgS+n3ps7v/mXASM
	 JkUpSLBEnSO+pNfzI4A3lpfy64iBJRz6RRYwpOOWUTJQSLcHSvlxTrWwqLYUBjyrdH
	 OqGIJnP2waIfqsNY6GlyvhiPLQHk30mSJ1BM9G+m7YsEmg+g4TPkGQ1hwcLRi16EO1
	 Y+TTU7RuHceOBiWn/Z82T8rTeWAY7c63avfOqMzGC48saUnqGF3VAv6P9eR4WpN19V
	 svKKXuU2HJ0fpmlZMTcc9K1r913X6SssDYaLarDzSiXvmH9AOm2SOVTKkk8zBeMOiH
	 xD5N0A7YgjVLigbVXCTmZ1omVTSU9BGqq1wTVeV0jnqn08HtNTXKrhDQJvwBG1OyiH
	 Y7IKfSi+voxkMZqSMyqd1a9+kgDRg7M1HV3Cm2MIf0GBl00/fSFDrxBTOUzuB2Z8ri
	 AA2FLKpQ4++UxeySAPaKZuZDm51t00UODwkT0H+iDdsg0ihIRXfq8axppWwEDLuQlR
	 flVPUkTU62Bf6PTqOQzvQopkfnDO0us9CT7Mz3LdVui+5sqOqXweUdM6Xd2F7QycxN
	 QFv11Q95Rxd2ZofpMF6ySWP8=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id E74E71E6965; Fri, 17 Apr 2026 17:02:24 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1776416438;
	bh=FGi5XB1sh7bSU/oLua66mQ5Kek498bqkQiAvdQmOkSg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=hRA4TmFGew8mUCEoyCIQfA2251va42seR9BqInYOxwZk4NGGd+lOsshZYddTccByJ
	 adFbXYSOCkvP4FYE3GqAIPEhNxQyPt7QmMCCUsVMh7kf6YdbSbHOmJLAlx3rslTlIh
	 gy3GJq92dhnFOOrHfIwC2E9sL8+In94+JAeNT/ZQh+/SLIXBJ4w5m6nyRcdWC9vCGW
	 dCetxv4rhhPlhN3bShAiFIs3BUeq5EgmRruOUd/9hXb5GRNsFkYyCviQIK4upbdNfb
	 RMDly7KTOQR4QOv9GWNbc/P3pBuQN5pwwzf3Hdf/bX5u58iHOlahrVg2HnEzO3iLqO
	 DrQ2SEhFrx4p9N9F6WTNQFF+WHbLr8eketQbM8TWXBDEsEGEDW2bLBpuhclRTME6tJ
	 6J+iN5gEg/zNEIC2sVnflmXsEFBnheFLJrVchNoH6oAE8KmcshRkD/2x8m3F4MKVI/
	 m3kGDm/vyHYkDR15l33/yOChbETikrUuBuEHb5inu/r0zJNCBXdqCiT6tYU57A1ofu
	 EJskVJ8X2QWipY7fWWSAFVVlZzlLYGEVHJxfgItghqKADryvRKN0MwjYkZ1zHVJb1s
	 CNC2uDfHt/TdjG945/jmBf/9caHQiJTCy1wKfRa5ZGE22JSiTtQAwtzShsaxp/q/xF
	 oBBKb7iZ21kkUfgm4GzS3uPQ=
Received: from [IPV6:2001:8003:8810:ea00:ed87:ca88:5326:e11d] (unknown [IPv6:2001:8003:8810:ea00:ed87:ca88:5326:e11d])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 5BF0C1E6959;
	Fri, 17 Apr 2026 17:00:38 +0800 (AWST)
Message-ID: <de9a6a2f-b9dd-4c24-bb1c-6c6eab588633@davidgow.net>
Date: Fri, 17 Apr 2026 17:00:36 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust: testing: add Kconfig for KUnit test
To: Yury Norov <ynorov@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, Burak Emir <bqe@google.com>,
 Yury Norov <yury.norov@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>,
 Kees Cook <kees@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Thomas Gleixner <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, Christian Brauner
 <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tamir Duberstein <tamird@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
References: <20260417031531.315281-1-ynorov@nvidia.com>
 <20260417031531.315281-3-ynorov@nvidia.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20260417031531.315281-3-ynorov@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 17/04/2026 à 11:15 AM, Yury Norov a écrit :
> There are 6 individual Rust KUnit tests. All the tests are compiled
> unconditionally now, which adds ~200 kB to the kernel image for me
> on x86_64. As Rust matures, this bloating will inevitably grow.
> 
> Add Kconfig.test which includes a RUST_KUNIT_TESTS menu, and all
> individual tests under it.

I think this makes a lot of sense for tests within the kernel crate (and 
any other 'system' crates). Individual drivers probably should still 
keep their Kconfig options under the corresponding subsystem.

> 
> As usual, new tests are all enabled if KUNIT_ALL_TESTS=y.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
> This doesn't create a new entry in MAINTAINERS for the Kconfig.test,
> so the new file just follows the implicit rule for the rust/ directory.
> Please let me know if the explicit entry is needed.
> 

I think it's fine to leave this as implicitly part of rust/, personally.

Still, this looks good.

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   init/Kconfig                         |  2 +
>   rust/kernel/Kconfig.test             | 76 ++++++++++++++++++++++++++++
>   rust/kernel/alloc/allocator.rs       |  1 +
>   rust/kernel/alloc/kvec.rs            |  1 +
>   rust/kernel/bitmap.rs                |  1 +
>   rust/kernel/kunit.rs                 |  1 +
>   rust/kernel/str.rs                   |  1 +
>   rust/kernel/sync/atomic/predefine.rs |  1 +
>   8 files changed, 84 insertions(+)
>   create mode 100644 rust/kernel/Kconfig.test
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 43875ef36752..4af544514e6c 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2208,6 +2208,8 @@ config RUST
>   
>   	  If unsure, say N.
>   
> +source "rust/kernel/Kconfig.test"
> +
>   config RUSTC_VERSION_TEXT
>   	string
>   	depends on RUST
> diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
> new file mode 100644
> index 000000000000..a05243696a01
> --- /dev/null
> +++ b/rust/kernel/Kconfig.test
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menuconfig RUST_KUNIT_TESTS
> +	bool "Rust KUnit tests"
> +	depends on KUNIT && RUST
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This menu collects all options for Rust Kunit tests.
> +	  See Documentation/rust/testing.rst for how to protect
> +	  unit tests with these options.
> +
> +	  Say Y here to enable Rust KUnit tests.
> +
> +	  If unsure, say N.
> +
> +if RUST_KUNIT_TESTS
> +config RUST_ALLOCATOR_KUNIT_TEST
> +	bool "KUnit tests for Rust allocator API" if !KUNIT_ALL_TESTS
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables KUnit tests for the Rust allocator API.
> +	  These are only for development and testing, not for regular
> +	  kernel use cases.
> +
> +	  If unsure, say N.
> +
> +config RUST_KVEC_KUNIT_TEST
> +	bool "KUnit tests for Rust KVEC API" if !KUNIT_ALL_TESTS
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables KUnit tests for the Rust KVEC API.
> +	  These are only for development and testing, not for
> +	  regular kernel use cases.
> +
> +	  If unsure, say N.
> +
> +config RUST_BITMAP_KUNIT_TEST
> +	bool "KUnit tests for Rust bitmap API" if !KUNIT_ALL_TESTS
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables KUnit tests for the Rust bitmap API.
> +	  These are only for development and testing, not for regular
> +	  kernel use cases.
> +
> +	  If unsure, say N.
> +
> +config RUST_KUNIT_SELFTEST
> +	bool "KUnit selftests for Rust" if !KUNIT_ALL_TESTS
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables KUnit selftests. These are only
> +	  for development and testing, not for regular kernel
> +	  use cases.
> +
> +	  If unsure, say N.
> +
> +config RUST_STR_KUNIT_TEST
> +	bool "KUnit tests for Rust strings APIs" if !KUNIT_ALL_TESTS
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables KUnit tests for the Rust strings API.
> +	  These are only for development and testing, not for regular
> +	  kernel use cases.
> +
> +	  If unsure, say N.
> +
> +config RUST_ATOMICS_KUNIT_TEST
> +	bool "KUnit tests for Rust atomics APIs" if !KUNIT_ALL_TESTS
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables KUnit tests for the Rust atomics API.
> +	  These are only for development and testing, not for regular
> +	  kernel use cases.
> +
> +	  If unsure, say N.
> +
> +endif
> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
> index 63bfb91b3671..0d3434bca867 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -251,6 +251,7 @@ unsafe fn realloc(
>       }
>   }
>   
> +#[cfg(CONFIG_RUST_ALLOCATOR_KUNIT_TEST)]
>   #[macros::kunit_tests(rust_allocator)]
>   mod tests {
>       use super::*;
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ac8d6f763ae8..563c760c8105 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -1351,6 +1351,7 @@ fn drop(&mut self) {
>       }
>   }
>   
> +#[cfg(CONFIG_RUST_KVEC_KUNIT_TEST)]
>   #[macros::kunit_tests(rust_kvec)]
>   mod tests {
>       use super::*;
> diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> index 894043c9e460..b27e0ec80d64 100644
> --- a/rust/kernel/bitmap.rs
> +++ b/rust/kernel/bitmap.rs
> @@ -499,6 +499,7 @@ pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
>       }
>   }
>   
> +#[cfg(CONFIG_RUST_BITMAP_KUNIT_TEST)]
>   #[macros::kunit_tests(rust_kernel_bitmap)]
>   mod tests {
>       use super::*;
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index a1edf7491579..cdee5f27bd7f 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -329,6 +329,7 @@ pub fn in_kunit_test() -> bool {
>       !unsafe { bindings::kunit_get_current_test() }.is_null()
>   }
>   
> +#[cfg(CONFIG_RUST_KUNIT_SELFTEST)]
>   #[kunit_tests(rust_kernel_kunit)]
>   mod tests {
>       use super::*;
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 8311d91549e1..a435674f05ea 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -415,6 +415,7 @@ macro_rules! c_str {
>       }};
>   }
>   
> +#[cfg(CONFIG_RUST_STR_KUNIT_TEST)]
>   #[kunit_tests(rust_kernel_str)]
>   mod tests {
>       use super::*;
> diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
> index 84fcd7cfcb73..7468153429e1 100644
> --- a/rust/kernel/sync/atomic/predefine.rs
> +++ b/rust/kernel/sync/atomic/predefine.rs
> @@ -154,6 +154,7 @@ fn rhs_into_delta(rhs: usize) -> isize_atomic_repr {
>       }
>   }
>   
> +#[cfg(CONFIG_RUST_ATOMICS_KUNIT_TEST)]
>   #[macros::kunit_tests(rust_atomics)]
>   mod tests {
>       use super::super::*;

