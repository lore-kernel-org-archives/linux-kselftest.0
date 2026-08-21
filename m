Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A9F3CBE6E;
	Fri, 21 Aug 2026 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301650; cv=none; b=ATmnaLk4kXg1f/MM3fWLJQjxZLUpdagGYKCFq4GiMo45HcUOPvrm2Wgl+gGyNE/kMGZPfHZBe/kv+/PkIoGjT9J34BLdCgErdjM0lVtsLnpAsIhMkKRl+XE235x+AIV5sOmmdQ8+GRNhTC+r896qHXPhGsYsTn/FPrcGACTon/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301650; c=relaxed/simple;
	bh=HpefIG+FT8VpT7Y0l8OJWXKdCqTscdnRID2HClRhKY8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ITrMt0JGbHkHrihJGokMEY+wWErbUiuA/S70zl7vyfIC8Lm7sSaMvMSdrIKhvOWQstjtddHnM+frUWxaYfw4Z+ZM+ZzOd/Zn9cEMNSh0FR5c9CnNwDZ1EReeNf95a9olLyvIulwn4m94jEKDuejebW5VqjcqBG8x7M8H2xmXRnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffvtgKJO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffvtgKJO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1041F000E9;
	Fri, 21 Aug 2026 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787301648;
	bh=QMsvJx/lIrFNR/YC7MmYVGxVjhg4uaQNS0Pwi12yOaw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ffvtgKJOKu5JyhdmjyYzd9c7bxTQCkQinI+ns4DXQBNPqsbzHyPPHEz9kn+qQHWpy
	 JknqHSPbysyTzmOKV1PN/QfIXtFbGI9Soh/F57TXKGQ+gjMh3ooonl7OlVpfUsppyG
	 oSrILc0iUGh6OLDJRB7hBswwQ6hH3ENm8T4kfPWkJMTA2HjbNchxVvoAITWjJbpcUI
	 OnwMoTBQAd3N2+YnPqIPV6b55axMDEDd+czfJ10KkUsflQlVTSYee6bY1C984c5SOP
	 W73U871CMetGb809i1ZYHAQLhIB6JG9UYNEz2OiA54H+0AAnlSx3/mDnihCjxDKBHv
	 4skbGPhLBtkNw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Malte Wechter <maltewechter@gmail.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae Moar
 <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Malte
 Wechter <maltewechter@gmail.com>
Subject: Re: [PATCH 1/2] rust: kunit: add config to fail kunit tests if a
 lockdep warning is triggered
In-Reply-To: <20260818-lockdep-kunit-v1-1-66ceb1a272e3@gmail.com>
References: <20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com>
 <KlwPuDCx8ODGiEj6fihohXeSRr0IugOMF_5AUBua9BBFek-TirtDWkZQwtZaxC3vS6ilOxJ3qW8t0kuY7BS8cA==@protonmail.internalid>
 <20260818-lockdep-kunit-v1-1-66ceb1a272e3@gmail.com>
Date: Fri, 21 Aug 2026 10:40:38 +0200
Message-ID: <878q5z988p.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Malte Wechter" <maltewechter@gmail.com> writes:

> When running KUnit tests and a lockdep warning is triggered, the test is
> still marked as passed based only on if test assertions are true.
> Thus, add a Kconfig option CONFIG_RUST_LOCKDEP_KUNIT_DEBUG_LOCKS. When
> this option selected, if lockdep triggers during a test, fail the test.
>
> Signed-off-by: Malte Wechter <maltewechter@gmail.com>
> ---
>  lib/kunit/Kconfig    | 13 +++++++++++++
>  rust/macros/kunit.rs | 10 ++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
> index 94ff8e4089bfb..30bac00c42ce1 100644
> --- a/lib/kunit/Kconfig
> +++ b/lib/kunit/Kconfig
> @@ -142,4 +142,17 @@ config KUNIT_UML_PCI
>
>  	  If unsure, say N.
>
> +config RUST_LOCKDEP_KUNIT_DEBUG_LOCKS
> +	bool "Enable extra debug_locks assertion in Rust KUnit tests"
> +	depends on RUST
> +	depends on LOCKDEP
> +	default n
> +	help
> +	  Adds an extra assertion to each Rust kunit test case that asserts
> +	  that the debug_locks flag from `lockdep` is unchanged. This is useful
> +	  when writing unit tests that could potentially trigger a lockdep warning,
> +	  this makes it so the KUnit test does not succeed if the test assertions are
> +	  true, but a lockdep warning is triggered.
> +
> +	  If unsure, say N.
>  endif # KUNIT
> diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
> index ae20ed6768f15..d1cd0349f86f0 100644
> --- a/rust/macros/kunit.rs
> +++ b/rust/macros/kunit.rs
> @@ -144,9 +144,19 @@ macro_rules! assert_eq {
>                  // here to reduce the length of the assert message.
>                  #(#cfg_attrs)*
>                  {
> +                    #[cfg(CONFIG_RUST_LOCKDEP_KUNIT_DEBUG_LOCKS)]
> +                    let __debug_locks_snapshot = ::kernel::bindings::debug_locks;

Why the double underscore start?


Best regards,
Andreas Hindborg

