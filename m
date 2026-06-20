Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA06D36728C;
	Sat, 20 Jun 2026 11:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781953670; cv=none; b=Q6N3OyAcz6wD7F3KSFJPJ4cSbeddgis1CItIwRhD7/4l6eriVfop17dWsW9mkSZBar15r0iQCluwEIpKFMSPNp1IdlFBHydkHrNhV3eUVzLHCr6VzrElIAI2poFz4y8ZuAC1ahMYk3baYwoCReyReRwslAxNDufyXu+zr3q73eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781953670; c=relaxed/simple;
	bh=a4kiTPVVIRbkBR+5v4hAy2u/lyLrPk2L42VgVwpxVWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BTtxMKbpcdpBJDS0Fa42N6vqbxtbllRjeVRoPL8q4O6z04XCnJo1CEPnknxCMQp/C2hZ93gdjNYLF2oYXImXJlg+IDz5GJkZ04yuMfER/z0aHGqrDQwBXyc34LPWlVHmrD2J9FoSZfVTxEIHdtz2Aakc3tmLLy8D17rr/KxLVv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 9E01C1EA349; Sat, 20 Jun 2026 19:07:40 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8810:ea00::9c4] (unknown [IPv6:2001:8003:8810:ea00::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 14B791EA240;
	Sat, 20 Jun 2026 19:07:35 +0800 (AWST)
Message-ID: <b1ed3259-553d-48e6-ba2a-8ddbd04ea4f0@davidgow.net>
Date: Sat, 20 Jun 2026 19:07:35 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust: kunit: use `line!()` inside `kunit_assert!`
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
 <20260616-kunit-v1-2-b191604a8d6b@garyguo.net>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260616-kunit-v1-2-b191604a8d6b@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 16/06/2026 à 11:24 PM, Gary Guo a écrit :
> The `diff` parameter is needed currently because doctests want to override
> the line number. Simplify it by changing it to use `line!()`. Have doctests
> override `line!()` macro to achieve the current behavior.
> 
> A few current doctests (or their invoked macros) require `line!()` to
> expand to literal; they're updated to use `::core::line!()` instead.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---

Much nicer, thanks!

Reviewed-by: David Gow <david@davidgow.net>

>  rust/kernel/device_id.rs    |  2 +-
>  rust/kernel/kunit.rs        |  8 ++++----
>  rust/kernel/str.rs          |  2 +-
>  rust/macros/kunit.rs        |  4 ++--
>  scripts/rustdoc_test_gen.rs | 16 ++++++++++++----
>  5 files changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> index 8e9721446014..20e2fe137202 100644
> --- a/rust/kernel/device_id.rs
> +++ b/rust/kernel/device_id.rs
> @@ -195,7 +195,7 @@ macro_rules! module_device_table {
>      ($table_type: literal, $module_table_name:ident, $table_name:ident) => {
>          #[rustfmt::skip]
>          #[export_name =
> -            concat!("__mod_device_table__", line!(),
> +            concat!("__mod_device_table__", ::core::line!(),
>                      "__kmod_", module_path!(),
>                      "__", $table_type,
>                      "__", stringify!($table_name))
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index 157fd0634708..58dfec66b4f6 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -58,7 +58,7 @@ pub fn info(args: fmt::Arguments<'_>) {
>  #[doc(hidden)]
>  #[macro_export]
>  macro_rules! kunit_assert {
> -    ($name:literal, $diff:expr, $condition:expr $(,)?) => {
> +    ($name:literal, $condition:expr $(,)?) => {
>          'out: {
>              // Do nothing if the condition is `true`.
>              if $condition {
> @@ -67,7 +67,7 @@ macro_rules! kunit_assert {
>  
>              // Use `file!()` instead of `::core::file!()` here so it can be overridden.
>              static FILE: &'static $crate::str::CStr = $crate::c_str!(file!());
> -            static LINE: i32 = ::core::line!() as i32 - $diff;
> +            static LINE: i32 = line!() as i32;
>              static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
>  
>              // SAFETY: FFI call without safety requirements.
> @@ -165,10 +165,10 @@ unsafe impl Sync for UnaryAssert {}
>  #[doc(hidden)]
>  #[macro_export]
>  macro_rules! kunit_assert_eq {
> -    ($name:literal, $diff:expr, $left:expr, $right:expr $(,)?) => {{
> +    ($name:literal, $left:expr, $right:expr $(,)?) => {{
>          // For the moment, we just forward to the expression assert because, for binary asserts,
>          // KUnit supports only a few types (e.g. integers).
> -        $crate::kunit_assert!($name, $diff, $left == $right);
> +        $crate::kunit_assert!($name, $left == $right);
>      }};
>  }
>  
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index b3caa9a1c898..644b4279a116 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -411,7 +411,7 @@ fn as_ref(&self) -> &BStr {
>  /// const BAD: &CStr = c_str!("literal");
>  ///
>  /// // `c_str!` is still needed for static non-literal C strings.
> -/// const GOOD: &CStr = c_str!(concat!(file!(), ":", line!(), ": My CStr!"));
> +/// const GOOD: &CStr = c_str!(concat!(file!(), ":", ::core::line!(), ": My CStr!"));
>  /// ```
>  #[macro_export]
>  macro_rules! c_str {
> diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
> index 936eff014870..e9152b9d51f9 100644
> --- a/rust/macros/kunit.rs
> +++ b/rust/macros/kunit.rs
> @@ -113,7 +113,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
>              #[allow(unused)]
>              macro_rules! assert {
>                  ($cond:expr $(,)?) => {{
> -                    kernel::kunit_assert!(#test_str, 0, $cond);
> +                    kernel::kunit_assert!(#test_str, $cond);
>                  }}
>              }
>          });
> @@ -121,7 +121,7 @@ macro_rules! assert {
>              #[allow(unused)]
>              macro_rules! assert_eq {
>                  ($left:expr, $right:expr $(,)?) => {{
> -                    kernel::kunit_assert_eq!(#test_str, 0, $left, $right);
> +                    kernel::kunit_assert_eq!(#test_str, $left, $right);
>                  }}
>              }
>          });
> diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
> index 37f4877f52e2..acc4debe8592 100644
> --- a/scripts/rustdoc_test_gen.rs
> +++ b/scripts/rustdoc_test_gen.rs
> @@ -169,18 +169,26 @@ fn main() {
>              r#"/// Generated `{name}` KUnit test case from a Rust documentation test.
>  #[no_mangle]
>  pub extern "C" fn {kunit_name}(__kunit_test: *mut ::kernel::bindings::kunit) {{
> -    /// Overrides the usual [`file!`] macro with one that expands to the real path.
> +    // Overrides the usual [`file!`] macro with one that expands to the real path.
>      #[allow(unused)]
>      macro_rules! file {{
>          () => {{ "{real_path}" }}
>      }}
>  
> +    // Overrides the usual [`line!`] macro with one that expands to the real line number.
> +    #[allow(unused)]
> +    macro_rules! line {{
> +        // NOTE: This does not expand to a literal, but a constant expression.
> +        // Therefore code that depends on `line!()` being overrideable needs special adjustment.
> +        () => {{ const {{ ::core::line!() - __DOCTEST_ANCHOR + {line} }} }}
> +    }}
> +
>      /// Overrides the usual [`assert!`] macro with one that calls KUnit instead.
>      #[allow(unused)]
>      macro_rules! assert {{
>          ($cond:expr $(,)?) => {{{{
>              ::kernel::kunit_assert!(
> -                "{kunit_name}", __DOCTEST_ANCHOR - {line}, $cond
> +                "{kunit_name}", $cond
>              );
>          }}}}
>      }}
> @@ -190,7 +198,7 @@ macro_rules! assert {{
>      macro_rules! assert_eq {{
>          ($left:expr, $right:expr $(,)?) => {{{{
>              ::kernel::kunit_assert_eq!(
> -                "{kunit_name}", __DOCTEST_ANCHOR - {line}, $left, $right
> +                "{kunit_name}", $left, $right
>              );
>          }}}}
>      }}
> @@ -212,7 +220,7 @@ macro_rules! assert_eq {{
>  
>      /// The anchor where the test code body starts.
>      #[allow(unused)]
> -    static __DOCTEST_ANCHOR: i32 = ::core::line!() as i32 + {body_offset} + 2;
> +    static __DOCTEST_ANCHOR: u32 = ::core::line!() + {body_offset} + 2;
>      {{
>          #![allow(unreachable_pub, clippy::disallowed_names)]
>          {body}
> 

