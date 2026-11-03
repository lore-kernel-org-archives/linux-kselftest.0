Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717167;
	b=SaiLjvOc33ABazUANNR59IH06/eK9ZSurfsGO0JYFbW+2BToCYJj5hzdNDGEUa+oEtBQ
	 1GyKjrEh1x0FcqyaXPGR2B3jEQAyakOIkdxbxU70qzqzRrJ/9Av/7xbxmPcXupy7b7WON
	 6CiljGy2XXP5Xi1GXmrB4B7Z4Vn4u4r5vkzmKTNRgBxqiEyu0bCRc2X6M1PJmNYreD0Pf
	 5jbKyxzFWrVD3GZb+LhLC4pWDmZnDHHvhBTgdXmodbDJGIjIuxJmcfqlcYFM5QWb7Y6pH
	 pL1q71XB9B9Fkz4i5ZZrHp1mzwmUuYWx4E9Hjls8XVHlAQOmbPQadv7dAvHrYfCZk9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717167;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=S0GnTxIJHSFthZIIfPgwCpR04/uaEGz0+Ajn9jhxOic=;
	b=gb6zymblwRvxkl5ZDKsTrpKgeIXe5YkLRCYWHSr76SMGSJheBdnKwyOmh7Zi5HkeRmJT
	 wZbIxn84tCOsydENHbIwZMbn14cLcZvK+J5FuCU6+amyUXQJ1rg7HQ9BVpyzc2LZ9Uekh
	 kyO+YT2opKrk3ivLx+EUSl73c3zIpwgcvtCDFBn9WqOoCQSQD98kxppYCtDlGjLgGhJDc
	 izTl4TzPNpsUZhr46a7VaDNvdD8FyR621b+yG+9crGHIV0HvLd1wQufMJO4CzmwCKF46w
	 Wb8trnVbBEgYgS5ZE/UNdjLVAJlyogQ9HieH+5PRGlBThqgypEumhMmsUnYhPxjW7tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C340606D817;
	Tue,  3 Nov 2026 14:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C340606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id B9A38200B11; Tue,  3 Nov 2026 22:46:04 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 5C893200B03;
	Tue,  3 Nov 2026 22:46:02 +0800 (AWST)
Message-ID: <8c1135e9-54a6-4a40-8bec-0d75aaa7f83d@davidgow.net>
Date: Tue, 3 Nov 2026 22:45:59 +0800
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
Subject: Re: [PATCH v2 2/3] rust: kunit: allow same test name with different
 #[cfg(...)]
To: nico.antinori.7@gmail.com, Alice Ryhl <aliceryhl@google.com>,
 Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>,
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
 <20261029-rust_kunit_v6_send-v2-2-5ce551efc48e@gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-2-5ce551efc48e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 30/10/2026 à 00:59, Nicolás Antinori via B4 Relay a écrit :
> From: Nicolás Antinori <nico.antinori.7@gmail.com>
> 
> Sometimes it is necessary to test the same code paths under different
> configurations. The `#[cfg(...)]` macro can be used to check if specific
> configurations are enabled and run tests accordingly.
> 
> Currently, defining multiple tests with the same name under different
> `#[cfg(...)]` attributes results in a compilation error. This patch
> removes that restriction, allowing identical test names across different
> configurations.
> 
> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> ---

Thanks very much.

This is a great improvement over the old implementation, IMO.

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   rust/kernel/kunit.rs | 22 ++++++++++++++++++++++
>   rust/macros/kunit.rs | 36 ++++++++++++++++++++----------------
>   2 files changed, 42 insertions(+), 16 deletions(-)
> 
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index 5e688b743ee2152867e2f99c7f18b86e1b7fbe3d..ba3040d302b95af6d6e648a229ac8e9ea2c31a8c 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -367,6 +367,28 @@ fn rust_test_kunit_in_kunit_test() {
>           assert!(in_kunit_test());
>       }
>   
> +    // Tests with cfg have the same name on purpose because we are implicitly testing that
> +    // tests with the same name but different configs do not throw a compilation error
> +    #[test]
> +    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "y")]
> +    fn rust_test_kunit_run_only_active_cfg() {
> +        assert!(in_kunit_test());
> +    }
> +
> +    #[test]
> +    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "n")]
> +    fn rust_test_kunit_run_only_active_cfg() {
> +        // This test should never run because of the `cfg`.
> +        assert!(false)
> +    }
> +
> +    #[test]
> +    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "INVALID_VALUE")]
> +    fn rust_test_kunit_run_only_active_cfg() {
> +        // This test should never run because of the `cfg`.
> +        assert!(false)
> +    }
> +
>       #[test]
>       #[should_panic]
>       fn rust_test_kunit_panic_in_kunit_test() {
> diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
> index 288b53d21c4e7c8d9b5148d50c1a833f73e53015..173792563ca8b42e39ec0a53798f7b3bb75bf9cf 100644
> --- a/rust/macros/kunit.rs
> +++ b/rust/macros/kunit.rs
> @@ -45,6 +45,8 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
>   
>       let mut processed_items = Vec::new();
>       let mut test_cases = Vec::new();
> +    let mut test_cases_cfgs = Vec::new();
> +    let mut test_case_number: u32 = 1;
>   
>       // Generate the test KUnit test suite and a test case for each `#[test]`.
>       //
> @@ -134,7 +136,7 @@ macro_rules! assert_eq {
>           // Add back the test item.
>           processed_items.push(Item::Fn(f));
>   
> -        let kunit_wrapper_fn_name = format_ident!("kunit_rust_wrapper_{test}");
> +        let kunit_wrapper_fn_name = format_ident!("kunit_rust_wrapper_{test}_{test_case_number}");
>           let test_cstr = LitCStr::new(
>               &CString::new(test_str.as_str()).expect("identifier cannot contain NUL"),
>               test.span(),
> @@ -154,18 +156,12 @@ macro_rules! assert_eq {
>               )
>           };
>           processed_items.push(parse_quote! {
> +            // Prepend any `cfg` attributes before the function declaration to activate it only in
> +            // cases the configs are on
> +            #(#cfg_attrs)*
>               unsafe extern "C" fn #kunit_wrapper_fn_name(_test: *mut ::kernel::bindings::kunit) {
> -                (*_test).status = ::kernel::bindings::kunit_status_KUNIT_SKIPPED;
> -
> -
> -                // Append any `cfg` attributes the user might have written on their tests so we
> -                // don't attempt to call them when they are `cfg`'d out. An extra `use` is used
> -                // here to reduce the length of the assert message.
> -                #(#cfg_attrs)*
> -                {
> -                    (*_test).status = ::kernel::bindings::kunit_status_KUNIT_SUCCESS;
> -                    #assertion
> -                }
> +                (*_test).status = ::kernel::bindings::kunit_status_KUNIT_SUCCESS;
> +                #assertion
>               }
>           });
>   
> @@ -174,15 +170,23 @@ macro_rules! assert_eq {
>               case.attr.rust_should_panic = #should_panic;
>               case
>           }));
> +        test_cases_cfgs.push(cfg_attrs);
> +        test_case_number += 1;
>       }
>   
> -    let num_tests_plus_1 = test_cases.len() + 1;
> +    // This dummy array is used to calculate the exact number of tests cases that are active
> +    // depending on their #[cfg(...)] attribute.
> +    processed_items.push(parse_quote!(
> +        const TEST_CASES_COUNT: &[()] = &[#(#(#test_cases_cfgs)* (),)* ()];
> +    ));
> +
>       processed_items.push(parse_quote! {
> -        static mut TEST_CASES: [::kernel::bindings::kunit_case; #num_tests_plus_1] = [
> -            #(#test_cases,)*
> -            ::pin_init::zeroed(),
> +        static mut TEST_CASES: [::kernel::bindings::kunit_case; TEST_CASES_COUNT.len()] = [
> +            #(#(#test_cases_cfgs)* { #test_cases },)*
> +            ::pin_init::zeroed()
>           ];
>       });
> +
>       processed_items.push(parse_quote! {
>           ::kernel::kunit_unsafe_test_suite!(#test_suite, TEST_CASES);
>       });
> 

