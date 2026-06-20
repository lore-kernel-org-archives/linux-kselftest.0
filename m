Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CD131813A;
	Sat, 20 Jun 2026 11:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781953668; cv=none; b=tfW0GbIicTn/ePDPoJlanfTZb/C4ZBSiDJHgLgi1vJdLux92ygJnUYzmr+7myjABJSUISddU03E0qELFSzuu4Pmw6DG7O50QqQBEslAA+4+Tr5ZMlPZlX69pAb77t4VF3SDpVy24ZK+/40Urihiw6nHr69XgbqIuIV7HzuyL+eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781953668; c=relaxed/simple;
	bh=XN01UbbGA2FdQ/af7XvdvFWe0up1fhvoxgHVmw1i3Sw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6hQrh/3eyRroKTwbMq4A8wovwqEfuhwRrvS8bbshYFHI6QVVCIHDMQw4dqS9yrHZUY/6XxZRdtYfIZInf/xxkpIlTA4KdtuhXqnQUmsAFmypRUJ6+6jgQtSU7ZRla5nzrbPqdDLW5IXo8/Jobxz/Msd6i/k/su1P5FWwLV9D8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 005061EA341; Sat, 20 Jun 2026 19:07:37 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8810:ea00::9c4] (unknown [IPv6:2001:8003:8810:ea00::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id A3F3D1EA331;
	Sat, 20 Jun 2026 19:07:31 +0800 (AWST)
Message-ID: <fa276fee-c173-4595-a5c7-e0342c555990@davidgow.net>
Date: Sat, 20 Jun 2026 19:07:29 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] rust: kunit: use `file!()` inside `kunit_assert!`
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
References: <20260616-kunit-v1-0-b191604a8d6b@garyguo.net>
 <20260616-kunit-v1-1-b191604a8d6b@garyguo.net>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260616-kunit-v1-1-b191604a8d6b@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 16/06/2026 à 11:24 PM, Gary Guo a écrit :
> This parameter is needed currently because doctests want to override the
> file. Simplify it by changing it to use `file!()`. Have doctests override
> `file!()` macro to achieve the current behavior.
> 
> This allows us to remove the `file` helper and associated Kconfig options.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---

Looks good to me.

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>  Documentation/rust/general-information.rst |  4 ++--
>  init/Kconfig                               |  3 ---
>  rust/kernel/kunit.rs                       |  9 +++++----
>  rust/macros/helpers.rs                     | 16 ----------------
>  rust/macros/kunit.rs                       |  5 ++---
>  rust/macros/lib.rs                         |  5 -----
>  scripts/rustdoc_test_gen.rs                | 10 ++++++++--
>  7 files changed, 17 insertions(+), 35 deletions(-)
> 
> diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
> index 09234bed272c..20e3178ebfd4 100644
> --- a/Documentation/rust/general-information.rst
> +++ b/Documentation/rust/general-information.rst
> @@ -157,5 +157,5 @@ numerical comparisons, one may define a new Kconfig symbol:
>  
>  .. code-block:: kconfig
>  
> -	config RUSTC_HAS_SPAN_FILE
> -		def_bool RUSTC_VERSION >= 108800
> +	config RUSTC_HAS_FILE_AS_C_STR
> +		def_bool RUSTC_VERSION >= 109100

Are we using RUSTC_FILE_AS_C_STR for this? I know it's used elsewhere,
and it makes sense to replace RUSTC_HAS_SPAN_FILE with something that's
used _somewhere_, but I do see a hardcoded c_str!(file!()) below. I'm
assuming that RUSTC_FILE_AS_C_STR isn't something useful there.

(This is just out of my own curiosity, rather than an actual suggestion.)

> diff --git a/init/Kconfig b/init/Kconfig
> index 5230d4879b1c..e118fdb9df11 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -178,9 +178,6 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
>  	# https://github.com/llvm/llvm-project/pull/130661
>  	def_bool LD_IS_BFD || LLD_VERSION >= 210000
>  
> -config RUSTC_HAS_SPAN_FILE
> -	def_bool RUSTC_VERSION >= 108800
> -
>  config RUSTC_HAS_UNNECESSARY_TRANSMUTES
>  	def_bool RUSTC_VERSION >= 108800
>  
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index cdee5f27bd7f..157fd0634708 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -58,14 +58,15 @@ pub fn info(args: fmt::Arguments<'_>) {
>  #[doc(hidden)]
>  #[macro_export]
>  macro_rules! kunit_assert {
> -    ($name:literal, $file:literal, $diff:expr, $condition:expr $(,)?) => {
> +    ($name:literal, $diff:expr, $condition:expr $(,)?) => {
>          'out: {
>              // Do nothing if the condition is `true`.
>              if $condition {
>                  break 'out;
>              }
>  
> -            static FILE: &'static $crate::str::CStr = $file;
> +            // Use `file!()` instead of `::core::file!()` here so it can be overridden.
> +            static FILE: &'static $crate::str::CStr = $crate::c_str!(file!());
>              static LINE: i32 = ::core::line!() as i32 - $diff;
>              static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
>  
> @@ -164,10 +165,10 @@ unsafe impl Sync for UnaryAssert {}
>  #[doc(hidden)]
>  #[macro_export]
>  macro_rules! kunit_assert_eq {
> -    ($name:literal, $file:literal, $diff:expr, $left:expr, $right:expr $(,)?) => {{
> +    ($name:literal, $diff:expr, $left:expr, $right:expr $(,)?) => {{
>          // For the moment, we just forward to the expression assert because, for binary asserts,
>          // KUnit supports only a few types (e.g. integers).
> -        $crate::kunit_assert!($name, $file, $diff, $left == $right);
> +        $crate::kunit_assert!($name, $diff, $left == $right);
>      }};
>  }
>  
> diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
> index d18fbf4daa0a..8cc9a20f470e 100644
> --- a/rust/macros/helpers.rs
> +++ b/rust/macros/helpers.rs
> @@ -38,22 +38,6 @@ pub(crate) fn value(&self) -> String {
>      }
>  }
>  
> -pub(crate) fn file() -> String {
> -    #[cfg(not(CONFIG_RUSTC_HAS_SPAN_FILE))]
> -    {
> -        proc_macro::Span::call_site()
> -            .source_file()
> -            .path()
> -            .to_string_lossy()
> -            .into_owned()
> -    }
> -
> -    #[cfg(CONFIG_RUSTC_HAS_SPAN_FILE)]
> -    {
> -        proc_macro::Span::call_site().file()
> -    }
> -}
> -
>  /// Obtain all `#[cfg]` attributes.
>  pub(crate) fn gather_cfg_attrs(attr: &[Attribute]) -> impl Iterator<Item = &Attribute> + '_ {
>      attr.iter().filter(|a| a.path().is_ident("cfg"))
> diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
> index ae20ed6768f1..936eff014870 100644
> --- a/rust/macros/kunit.rs
> +++ b/rust/macros/kunit.rs
> @@ -109,12 +109,11 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
>          // Before the test, override usual `assert!` and `assert_eq!` macros with ones that call
>          // KUnit instead.
>          let test_str = test.to_string();
> -        let path = CString::new(crate::helpers::file()).expect("file path cannot contain NUL");
>          processed_items.push(parse_quote! {
>              #[allow(unused)]
>              macro_rules! assert {
>                  ($cond:expr $(,)?) => {{
> -                    kernel::kunit_assert!(#test_str, #path, 0, $cond);
> +                    kernel::kunit_assert!(#test_str, 0, $cond);
>                  }}
>              }
>          });
> @@ -122,7 +121,7 @@ macro_rules! assert {
>              #[allow(unused)]
>              macro_rules! assert_eq {
>                  ($left:expr, $right:expr $(,)?) => {{
> -                    kernel::kunit_assert_eq!(#test_str, #path, 0, $left, $right);
> +                    kernel::kunit_assert_eq!(#test_str, 0, $left, $right);
>                  }}
>              }
>          });
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index 4a48fabbc268..6b00f9789772 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -8,11 +8,6 @@
>  
>  // Stable since Rust 1.87.0.
>  #![feature(extract_if)]
> -//
> -// Stable since Rust 1.88.0 under a different name, `proc_macro_span_file`,
> -// which was added in Rust 1.88.0. This is why `cfg_attr` is used here, i.e.
> -// to avoid depending on the full `proc_macro_span` on Rust >= 1.88.0.
> -#![cfg_attr(not(CONFIG_RUSTC_HAS_SPAN_FILE), feature(proc_macro_span))]
>  
>  mod concat_idents;
>  mod export;
> diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
> index d61a77219a8c..37f4877f52e2 100644
> --- a/scripts/rustdoc_test_gen.rs
> +++ b/scripts/rustdoc_test_gen.rs
> @@ -169,12 +169,18 @@ fn main() {
>              r#"/// Generated `{name}` KUnit test case from a Rust documentation test.
>  #[no_mangle]
>  pub extern "C" fn {kunit_name}(__kunit_test: *mut ::kernel::bindings::kunit) {{
> +    /// Overrides the usual [`file!`] macro with one that expands to the real path.
> +    #[allow(unused)]
> +    macro_rules! file {{
> +        () => {{ "{real_path}" }}
> +    }}
> +
>      /// Overrides the usual [`assert!`] macro with one that calls KUnit instead.
>      #[allow(unused)]
>      macro_rules! assert {{
>          ($cond:expr $(,)?) => {{{{
>              ::kernel::kunit_assert!(
> -                "{kunit_name}", c"{real_path}", __DOCTEST_ANCHOR - {line}, $cond
> +                "{kunit_name}", __DOCTEST_ANCHOR - {line}, $cond
>              );
>          }}}}
>      }}
> @@ -184,7 +190,7 @@ macro_rules! assert {{
>      macro_rules! assert_eq {{
>          ($left:expr, $right:expr $(,)?) => {{{{
>              ::kernel::kunit_assert_eq!(
> -                "{kunit_name}", c"{real_path}", __DOCTEST_ANCHOR - {line}, $left, $right
> +                "{kunit_name}", __DOCTEST_ANCHOR - {line}, $left, $right
>              );
>          }}}}
>      }}
> 

