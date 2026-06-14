Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B372AD35;
	Sun, 14 Jun 2026 07:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781421192; cv=none; b=hzVGbDWW7H9pNCReKq5vcWEQRWCGC9W8//6nPbnm2DrP4PX46sQ0UZveMG+CVHz1ME7N9CnX9CSdTlOOTo2BGLNZuqeQ/2nWAczOo70NWZ0F0aTR0JPmegN7cHIVDNltMNjKLbnnje48iFvltqusDcxEM+nN+sYfzDMxARTlzcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781421192; c=relaxed/simple;
	bh=QDMLcymWmFNA2LVj2LNc+u/jMVoxGS5wyG5igyEU2js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfwGUIjkP4VVuzLOYqDaT0GT2Ed3akck/GVKdMYvWIHPHPFeOA0+8rgt3b0qXr/HMz+KAvOtRNAlHVEkqUCTKBjUj58qOad3igHfpEz0D2tcNRa0EXTeEOOBu9YsP5Y+HYoDLtIn/+8K9gh8A1wx6KminHnkiThPAyIq7gb58V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id C9EC81E9FA4; Sun, 14 Jun 2026 15:07:31 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8810:ea00::9c4] (unknown [IPv6:2001:8003:8810:ea00::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 5E4391E9F99;
	Sun, 14 Jun 2026 15:07:27 +0800 (AWST)
Message-ID: <5f5c5555-466d-41ac-8187-8b9ddc14965f@davidgow.net>
Date: Sun, 14 Jun 2026 15:07:24 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: doctest: trim function name for reproducbility
To: Gary Guo <gary@garyguo.net>, Brendan Higgins <brendan.higgins@linux.dev>,
 Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Igor Korotin <igor.korotin@linux.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
References: <20260613140431.232471-1-gary@kernel.org>
 <20260613140431.232471-2-gary@kernel.org>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260613140431.232471-2-gary@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 13/06/2026 à 10:04 PM, Gary Guo a écrit :
> From: Gary Guo <gary@garyguo.net>
> 
> Currently rustdoc will generate function names like
> "_doctest_main__home_gary_Projects_linux_rust_kernel_io_rs_824_0" for a
> doctest located at rust/kernel/io.rs:824, when building with separate
> outdir using `O=`. This creates overlong symbol names and is also not
> reproducible.
> 
> Fix it by doing a custom remapping to trim it to something like
> `_doctest_main_rust_kernel_io_rs_824_0`.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---

Hi Gary,

This seems to break older versions of rustc. For example, with
rust 1.93.1, the build now fails with errors like:

ERROR:root:error[E0425]: cannot find function `_doctest_main_rust_kernel_alloc_allocator_rs_176_0` in this scope
  --> rust/doctests_kernel_generated.rs:74:27
   |
74 | } let test_return_value = _doctest_main_rust_kernel_alloc_allocator_rs_176_0(); assert!(test_return_value.is_ok()); }
   |                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in this scope


Am I missing something? I'm using kunit.py to build:
./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_RUST=y rust_doctests_kernel

Seems to be working okay with 1.96, though.

Cheers,
-- David

>  scripts/rustdoc_test_builder.rs | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/rustdoc_test_builder.rs b/scripts/rustdoc_test_builder.rs
> index 2b1f9ba01839..fda7284355f8 100644
> --- a/scripts/rustdoc_test_builder.rs
> +++ b/scripts/rustdoc_test_builder.rs
> @@ -47,11 +47,18 @@ fn main() {
>          })
>          .expect("No test function found in `rustdoc`'s output.");
>  
> +    // Figure out a smaller test name based on the generated function name.
> +    let name = rustdoc_function_name.split_once("_rust_kernel_").unwrap().1;
> +
> +    // The rustdoc function name can include the absolute path when building with `O=` which is
> +    // undesireable and create overlong symbol names. Remap it to relative path.
> +    let trimmed_function_name = format!("_doctest_main_rust_kernel_{name}");
> +
>      // Qualify `Result` to avoid the collision with our own `Result` coming from the prelude.
>      let body = body.replace(
>          &format!("{rustdoc_function_name}() -> Result<(), impl core::fmt::Debug> {{"),
>          &format!(
> -            "{rustdoc_function_name}() -> ::core::result::Result<(), impl ::core::fmt::Debug> {{"
> +            "{trimmed_function_name}() -> ::core::result::Result<(), impl ::core::fmt::Debug> {{"
>          ),
>      );
>  
> @@ -62,12 +69,9 @@ fn main() {
>      // We save the result in a variable so that the failed assertion message looks nicer.
>      let body = body.replace(
>          &format!("}} {rustdoc_function_name}().unwrap() }}"),
> -        &format!("}} let test_return_value = {rustdoc_function_name}(); assert!(test_return_value.is_ok()); }}"),
> +        &format!("}} let test_return_value = {trimmed_function_name}(); assert!(test_return_value.is_ok()); }}"),
>      );
>  
> -    // Figure out a smaller test name based on the generated function name.
> -    let name = rustdoc_function_name.split_once("_rust_kernel_").unwrap().1;
> -
>      let path = format!("rust/test/doctests/kernel/{name}");
>  
>      std::fs::write(path, body.as_bytes()).unwrap();

