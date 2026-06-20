Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80A131813A;
	Sat, 20 Jun 2026 11:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781953678; cv=none; b=YR6lre1U5MaOSkPpy3sXPPa7bLqThsi50Ki6DDwDnNFTC6g6LXr+fku/98hx/JwSbtJ/IUsli1WIuXIVHHrLCjFifTu0/jDixXCO6cBApBpFLyIqRQO7Dy6NHbUpbrn9jI4sgfcPAN5/vZtTtgMoBEdKur0SMk7FGSwr3grgBII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781953678; c=relaxed/simple;
	bh=kmpMg28vbbAQW9GLCFo5jh+z11w+o0UqDvAktk5a9Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDJ++qVrj1dtNpa/TKf3806kkdJ2BOe/1s+VHmq3r0k0k3a6TOcfbtZsqq8Mf7c2UQsD1VqYrU/N1UPE66t1OnOBrMBGOy/RAZMhEU53d5ZGDgoZbPc6RF70LGp8jHYWD3BYqBXTVouMoPpHH7Uf6npDM2RsU/5IfGKlMmecPQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 121811EA341; Sat, 20 Jun 2026 19:07:55 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8810:ea00::9c4] (unknown [IPv6:2001:8003:8810:ea00::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 616161EA331;
	Sat, 20 Jun 2026 19:07:52 +0800 (AWST)
Message-ID: <e30d16ec-f5a3-4cd8-9b25-96e0dfa8b9d2@davidgow.net>
Date: Sat, 20 Jun 2026 19:07:50 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] rust: doctest: generate Rust kunit test suites
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
 <20260616-kunit-v1-3-b191604a8d6b@garyguo.net>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260616-kunit-v1-3-b191604a8d6b@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 16/06/2026 à 11:24 PM, Gary Guo a écrit :
> For doctest, instead of generating C FFI functions, generate a Rust test
> suite with `#[kunit_tests]` and `#[test]` attributes. This makes the C glue
> no longer needed.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---

Thanks very much for this. It's been on the to-do list for a while, and
it's definitely much nicer than generating lots of C code.

Reviewed-by: David Gow <david@davidgow.net>

My feeling is that this series should go via the rust-for-linux tree,
rather than the KUnit tree, as there's lots of poking around in common
rust files, and no change to the KUnit C code. But if you'd rather it go
in via kselftest/kunit, that's possible too.

Cheers,
-- David

>  rust/Makefile               |  4 +--
>  scripts/rustdoc_test_gen.rs | 69 ++++++---------------------------------------
>  2 files changed, 10 insertions(+), 63 deletions(-)
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index a870d1616c71..8c95dd4f6aee 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -36,10 +36,8 @@ obj-$(CONFIG_RUST) += exports.o
>  always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib libsyn.rlib
>  
>  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
> -always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
>  
>  obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
> -obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
>  
>  always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/generated_arch_static_branch_asm.rs
>  ifndef CONFIG_UML
> @@ -387,7 +385,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
>  		$< $(rustdoc_test_kernel_quiet); \
>  	$(objtree)/scripts/rustdoc_test_gen
>  
> -%/doctests_kernel_generated.rs %/doctests_kernel_generated_kunit.c: \
> +%/doctests_kernel_generated.rs: \
>      $(src)/kernel/lib.rs $(obj)/kernel.o \
>      $(objtree)/scripts/rustdoc_test_builder \
>      $(objtree)/scripts/rustdoc_test_gen FORCE
> diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
> index acc4debe8592..601f7a5b3672 100644
> --- a/scripts/rustdoc_test_gen.rs
> +++ b/scripts/rustdoc_test_gen.rs
> @@ -118,9 +118,7 @@ fn main() {
>      // Sort paths.
>      paths.sort();
>  
> -    let mut rust_tests = String::new();
> -    let mut c_test_declarations = String::new();
> -    let mut c_test_cases = String::new();
> +    let mut tests = String::new();
>      let mut body = String::new();
>      let mut last_file = String::new();
>      let mut number = 0;
> @@ -165,10 +163,10 @@ fn main() {
>  
>          use std::fmt::Write;
>          write!(
> -            rust_tests,
> +            tests,
>              r#"/// Generated `{name}` KUnit test case from a Rust documentation test.
> -#[no_mangle]
> -pub extern "C" fn {kunit_name}(__kunit_test: *mut ::kernel::bindings::kunit) {{
> +#[test]
> +fn {kunit_name}() {{
>      // Overrides the usual [`file!`] macro with one that expands to the real path.
>      #[allow(unused)]
>      macro_rules! file {{
> @@ -183,26 +181,6 @@ macro_rules! line {{
>          () => {{ const {{ ::core::line!() - __DOCTEST_ANCHOR + {line} }} }}
>      }}
>  
> -    /// Overrides the usual [`assert!`] macro with one that calls KUnit instead.
> -    #[allow(unused)]
> -    macro_rules! assert {{
> -        ($cond:expr $(,)?) => {{{{
> -            ::kernel::kunit_assert!(
> -                "{kunit_name}", $cond
> -            );
> -        }}}}
> -    }}
> -
> -    /// Overrides the usual [`assert_eq!`] macro with one that calls KUnit instead.
> -    #[allow(unused)]
> -    macro_rules! assert_eq {{
> -        ($left:expr, $right:expr $(,)?) => {{{{
> -            ::kernel::kunit_assert_eq!(
> -                "{kunit_name}", $left, $right
> -            );
> -        }}}}
> -    }}
> -
>      // Many tests need the prelude, so provide it by default.
>      #[allow(unused)]
>      use ::kernel::prelude::*;
> @@ -231,14 +209,9 @@ macro_rules! assert_eq {{
>  "#
>          )
>          .unwrap();
> -
> -        write!(c_test_declarations, "void {kunit_name}(struct kunit *);\n").unwrap();
> -        write!(c_test_cases, "    KUNIT_CASE({kunit_name}),\n").unwrap();
>      }
>  
> -    let rust_tests = rust_tests.trim();
> -    let c_test_declarations = c_test_declarations.trim();
> -    let c_test_cases = c_test_cases.trim();
> +    let tests = tests.trim();
>  
>      write!(
>          BufWriter::new(File::create("rust/doctests_kernel_generated.rs").unwrap()),
> @@ -246,34 +219,10 @@ macro_rules! assert_eq {{
>  
>  const __LOG_PREFIX: &[u8] = b"rust_doctests_kernel\0";
>  
> -{rust_tests}
> -"#
> -    )
> -    .unwrap();
> -
> -    write!(
> -        BufWriter::new(File::create("rust/doctests_kernel_generated_kunit.c").unwrap()),
> -        r#"/*
> - * `kernel` crate documentation tests.
> - */
> -
> -#include <kunit/test.h>
> -
> -{c_test_declarations}
> -
> -static struct kunit_case test_cases[] = {{
> -    {c_test_cases}
> -    {{ }}
> -}};
> -
> -static struct kunit_suite test_suite = {{
> -    .name = "rust_doctests_kernel",
> -    .test_cases = test_cases,
> -}};
> -
> -kunit_test_suite(test_suite);
> -
> -MODULE_LICENSE("GPL");
> +#[kernel::macros::kunit_tests(rust_doctests_kernel)]
> +mod tests {{
> +{tests}
> +}}
>  "#
>      )
>      .unwrap();
> 

