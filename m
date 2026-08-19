Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBCF3D6CD5;
	Wed, 19 Aug 2026 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787129876; cv=none; b=EAiJeyHw32bzYBmT6alJ0SU4jnvgTGCAvtKhWvriQVChJjJDjYKZIHg9G33/7bDeNq5BSHuzfcl6WRQBGT9mi566fwlnKJEMu6xETwRm0VkmNxQlSUXlzUnLlLilM94IpuA4VHlkbfMtvlxYxpqwVYIvmrosLdlPFaeAQpD5Em4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787129876; c=relaxed/simple;
	bh=qILuqeYNIM4jRzaSeJvcfnKnYQKN6xJztLYlF5v1UgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUkxHQ9bZkpiCcdeaZpmvt8pseFd+gZ592tx6mAqjW8wfKCJjX4zyDX0pDFsbHAmH0piQTz8MI5nClzkC/oQaClzzzOtv2Vwp1wskL6K5LSrSSY17D2RcSW5oRHoXuQ0FH7EUZ2cgHAH0k0Iyx2EdIPP8mDkbW/Tq/yxSGY10uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 2508D1EA9A8; Wed, 19 Aug 2026 16:57:47 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::9c4] (unknown [IPv6:2001:8003:8802:7000::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 5CB7A1EA99C;
	Wed, 19 Aug 2026 16:57:43 +0800 (AWST)
Message-ID: <3e1be519-32cb-4772-bc15-648f2aa99233@davidgow.net>
Date: Wed, 19 Aug 2026 16:57:41 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: kunit: move test configuration gating into
 macro
To: Yury Norov <ynorov@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev
Cc: Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Yury Norov <yury.norov@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260818152324.587932-1-ynorov@nvidia.com>
 <20260818152324.587932-3-ynorov@nvidia.com>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260818152324.587932-3-ynorov@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 18/08/2026 à 11:23 PM, Yury Norov a écrit :
> KUnit test modules currently need a separate cfg attribute in addition to
> the kunit_tests attribute. This makes every test suite repeat the same
> two-attribute pattern.
> 
> Declaring a KUnit test without a preceding `#[cfg]` attribute is also
> possible, causing it to be built whenever KUnit and its containing code are
> enabled.
> 
> Require the controlling Kconfig symbol as the second kunit_tests argument
> and have the macro emit the cfg attribute itself. Update all existing users
> to the new form.
> 
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---

Thanks.

I agree that every test needs to be behind a Kconfig option, though I'm
not totally convinced that this is the optimal solution, particularly
for a problem which should only affect test builds.

Personally, I lean towards keeping the #[cfg()] attribute separate here,
for mostly minor stylistic reasons. In particular, in C we already have
a number of existing tests where multiple suites share a Kconfig symbol.
While there's no reason we couldn't just pass the same symbol to several
different kunit_suite() attributes, it would be nicer to group them all
behind a single #[cfg()] where that makes sense (or even, going forward,
to support having them live in their own separate module/crate).

And personally, I find it a bit clearer: people already understand
#[cfg()], and having #[kunit_suite()] just accept the suite name better
matches suite registration in C.

That being said: I don't think there's anything fundamentally impossible
with implementing something like this (be it now, or later): worst-case
we'd end up with some redundant Kconfig entries and uglier chains of
attributes. So if this continues to be a problem (or enough people think
I'm wrong here), we can always change it later.

If we want to improve on the current situation, though, something like a
checkpatch.pl check or a lint would be a good way of making it less
likely for checks to slip through the cracks. And if we're particularly
worried about test size (or runtime), there are things we could look at
to improve things there. Moving tests to separate modules is probably a
bit harder to do in Rust than in C, but we could possibly have a
separate set of config options for large tests, and better support
filtering slow tests in Rust (which is on my to-do list).

(Finally, there are also a few minor issues with the patch below, which
would need to be fixed if there's a v2.)

Cheers,
-- David

>  Documentation/rust/testing.rst                | 11 ++++---
>  .../gpu/nova-core/gsp/cmdq/continuation.rs    |  3 +-
>  rust/kernel/alloc/allocator.rs                |  3 +-
>  rust/kernel/alloc/kvec.rs                     |  3 +-
>  rust/kernel/bitfield.rs                       |  3 +-
>  rust/kernel/bitmap.rs                         |  3 +-
>  rust/kernel/kunit.rs                          |  3 +-
>  rust/kernel/str.rs                            |  3 +-
>  rust/kernel/sync/atomic/predefine.rs          |  3 +-
>  rust/macros/kunit.rs                          | 30 +++++++++++++++++--
>  rust/macros/lib.rs                            |  6 ++--
>  11 files changed, 43 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
> index e3943aceceb9..767b111afd41 100644
> --- a/Documentation/rust/testing.rst
> +++ b/Documentation/rust/testing.rst
> @@ -138,9 +138,10 @@ these are also fairly similar to what you would expect from userspace, and they
>  are also mapped to KUnit.
>  
>  These tests are introduced by the ``kunit_tests`` procedural macro, which takes
> -the name of the test suite as an argument.
> +the name of the test suite and its controlling Kconfig option as arguments. The
> +Kconfig option is required, and the macro uses it to guard the test suite.
>  
> -Each test suite should be guarded by a Kconfig option in
> +Each test suite should have a Kconfig option, typically in
>  ``rust/kernel/Kconfig.test``.
>  
>  For instance, assume we want to test the function ``f`` from the documentation
> @@ -148,8 +149,7 @@ tests section. We could write, in the same file where we have our function:
>  
>  .. code-block:: rust
>  
> -	#[cfg(CONFIG_RUST_MYMOD_KUNIT_TEST)]
> -	#[kunit_tests(rust_kernel_mymod)]
> +	#[kunit_tests(rust_kernel_mymod, CONFIG_RUST_MYMOD_KUNIT_TEST)]
>  	mod tests {
>  	    use super::*;
>  
> @@ -177,8 +177,7 @@ the unit type ``()``) or ``Result`` (i.e. any ``Result<T, E>``). For instance:
>  
>  .. code-block:: rust
>  
> -	#[cfg(CONFIG_RUST_MYMOD_KUNIT_TEST)]
> -	#[kunit_tests(rust_kernel_mymod)]
> +	#[kunit_tests(rust_kernel_mymod, CONFIG_RUST_MYMOD_KUNIT_TEST)]
>  	mod tests {
>  	    use super::*;
>  
> diff --git a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
> index c0aa16c8fbf4..2e4b21f2002f 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
> @@ -167,8 +167,7 @@ fn init_variable_payload(
>      }
>  }
>  
> -#[cfg(CONFIG_NOVA_CORE_KUNIT_TEST)]
> -#[kunit_tests(nova_core_gsp_continuation)]
> +#[kunit_tests(nova_core_gsp_continuation, CONFIG_NOVA_CORE_KUNIT_TEST)]
>  mod tests {
>      use super::*;
>  
> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
> index cd4203f27aed..b2c235801a3f 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -265,8 +265,7 @@ unsafe fn realloc(
>      }
>  }
>  
> -#[cfg(CONFIG_RUST_ALLOCATOR_KUNIT_TEST)]
> -#[macros::kunit_tests(rust_allocator)]
> +#[macros::kunit_tests(rust_allocator, CONFIG_RUST_ALLOCATOR_KUNIT_TEST)]
>  mod tests {
>      use super::*;
>      use core::mem::MaybeUninit;
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index f7af62835aa8..4b77425950d3 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -1508,8 +1508,7 @@ fn drop(&mut self) {
>      }
>  }
>  
> -#[cfg(CONFIG_RUST_KVEC_KUNIT_TEST)]
> -#[macros::kunit_tests(rust_kvec)]
> +#[macros::kunit_tests(rust_kvec, CONFIG_RUST_KVEC_KUNIT_TEST)]
>  mod tests {
>      use super::*;
>      use crate::prelude::*;
> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
> index 35ede53f2b8e..8b329b6e4f8d 100644
> --- a/rust/kernel/bitfield.rs
> +++ b/rust/kernel/bitfield.rs
> @@ -548,8 +548,7 @@ fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
>      };
>  }
>  
> -#[cfg(CONFIG_RUST_BITFIELD_KUNIT_TEST)]
> -#[::kernel::macros::kunit_tests(rust_kernel_bitfield)]
> +#[::kernel::macros::kunit_tests(rust_kernel_bitfield, CONFIG_RUST_BITFIELD_KUNIT_TEST)]
>  mod tests {
>      use core::convert::TryFrom;
>  
> diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> index b27e0ec80d64..c4195e00d895 100644
> --- a/rust/kernel/bitmap.rs
> +++ b/rust/kernel/bitmap.rs
> @@ -499,8 +499,7 @@ pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
>      }
>  }
>  
> -#[cfg(CONFIG_RUST_BITMAP_KUNIT_TEST)]
> -#[macros::kunit_tests(rust_kernel_bitmap)]
> +#[macros::kunit_tests(rust_kernel_bitmap, CONFIG_RUST_BITMAP_KUNIT_TEST)]
>  mod tests {
>      use super::*;
>      use kernel::alloc::flags::GFP_KERNEL;
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index 91eaff8c186a..52f2ccbfba49 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -330,8 +330,7 @@ pub fn in_kunit_test() -> bool {
>      !unsafe { bindings::kunit_get_current_test() }.is_null()
>  }
>  
> -#[cfg(CONFIG_RUST_KUNIT_SELFTEST)]
> -#[kunit_tests(rust_kernel_kunit)]
> +#[kunit_tests(rust_kernel_kunit, CONFIG_RUST_KUNIT_SELFTEST)]
>  mod tests {
>      use super::*;
>  
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index b3caa9a1c898..404418504c13 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -428,8 +428,7 @@ macro_rules! c_str {
>      }};
>  }
>  
> -#[cfg(CONFIG_RUST_STR_KUNIT_TEST)]
> -#[kunit_tests(rust_kernel_str)]
> +#[kunit_tests(rust_kernel_str, CONFIG_RUST_STR_KUNIT_TEST)]
>  mod tests {
>      use super::*;
>  
> diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
> index 3d63f40791fa..e92194b37de8 100644
> --- a/rust/kernel/sync/atomic/predefine.rs
> +++ b/rust/kernel/sync/atomic/predefine.rs
> @@ -152,8 +152,7 @@ fn rhs_into_delta(rhs: usize) -> isize_atomic_repr {
>      }
>  }
>  
> -#[cfg(CONFIG_RUST_ATOMICS_KUNIT_TEST)]
> -#[macros::kunit_tests(rust_atomics)]
> +#[macros::kunit_tests(rust_atomics, CONFIG_RUST_ATOMICS_KUNIT_TEST)]
>  mod tests {
>      use super::super::*;
>  
> diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
> index ae20ed6768f1..7c7ba30f58c0 100644
> --- a/rust/macros/kunit.rs
> +++ b/rust/macros/kunit.rs
> @@ -13,6 +13,10 @@
>      ToTokens, //
>  };
>  use syn::{
> +    parse::{
> +        Parse,
> +        ParseStream, //
> +    },
>      parse_quote,
>      Error,
>      Ident,
> @@ -20,9 +24,28 @@
>      ItemMod,
>      LitCStr,
>      Result, //
> +    Token,
>  };
>  
> -pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<TokenStream> {
> +pub(crate) struct KunitTestArgs {
> +    test_suite: Ident,
> +    config: Ident,

#[cfg()] accepts more than just an Ident here: if we want to explicitly
gate things on either multiple config options, or on config options
being built-in/modules/etc, then we might want to allow something more
complex.

> +}
> +
> +impl Parse for KunitTestArgs {
> +    fn parse(input: ParseStream<'_>) -> Result<Self> {
> +        let test_suite = input.parse()?;
> +        input.parse::<Token![,]>()?;
> +        let config = input.parse()?;
> +
> +        Ok(Self { test_suite, config })
> +    }
> +}
> +
> +pub(crate) fn kunit_tests(
> +    KunitTestArgs { test_suite, config }: KunitTestArgs,
> +    mut module: ItemMod,
> +) -> Result<TokenStream> {
>      if test_suite.to_string().len() > 255 {
>          return Err(Error::new_spanned(
>              test_suite,
> @@ -34,7 +57,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
>      let Some((module_brace, module_items)) = module.content.take() else {
>          Err(Error::new_spanned(
>              module,
> -            "`#[kunit_tests(test_name)]` attribute should only be applied to inline modules",
> +            "`#[kunit_tests(test_name, CONFIG_KUNIT_TEST)]` attribute should only be applied to inline modules",

This is a much uglier message, and CONFIG_KUNIT_TEST is not an ideal
example to have here. Could we just have a placeholder, e.g.
#[kunit_tests(...)].

>          ))?
>      };
>  
> @@ -42,6 +65,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
>      module
>          .attrs
>          .insert(0, parse_quote!(#[cfg(CONFIG_KUNIT="y")]));
> +    module.attrs.insert(0, parse_quote!(#[cfg(#config)]));
>  
>      let mut processed_items = Vec::new();
>      let mut test_cases = Vec::new();
> @@ -51,7 +75,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
>      // The code generated for the following test module:
>      //
>      // ```
> -    // #[kunit_tests(kunit_test_suit_name)]
> +    // #[kunit_tests(kunit_test_suite_name, CONFIG_KUNIT_TEST)]

I really would rather these examples not state CONFIG_KUNIT_TEST here:
it's the config option for tests for KUnit itself, and I'd rather not
imply that people should add their tests to it.
CONFIG_KUNIT_EXAMPLE_TEST would be better.

>      // mod tests {
>      //     #[test]
>      //     fn foo() {
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index 4a48fabbc268..a660296d5dbd 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -464,14 +464,14 @@ pub fn paste(input: TokenStream) -> TokenStream {
>  
>  /// Registers a KUnit test suite and its test cases using a user-space like syntax.
>  ///
> -/// This macro should be used on modules. If `CONFIG_KUNIT` (in `.config`) is `n`, the target module
> -/// is ignored.
> +/// This macro should be used on modules. The second argument is the Kconfig symbol that controls
> +/// the test suite. If it or `CONFIG_KUNIT` (in `.config`) is `n`, the target module is ignored.
>  ///
>  /// # Examples
>  ///
>  /// ```ignore
>  /// # use kernel::prelude::*;
> -/// #[kunit_tests(kunit_test_suit_name)]
> +/// #[kunit_tests(kunit_test_suite_name, CONFIG_KUNIT_TEST)]

As above, let's not use CONFIG_KUNIT_TEST in the documentation here.

>  /// mod tests {
>  ///     #[test]
>  ///     fn foo() {

