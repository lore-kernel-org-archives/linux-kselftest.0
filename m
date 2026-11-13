Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794594107;
	b=wbO22SKSUT+0ewa+cxovmAID+6eTz50d8rnNcNwk0VWXJ6zRUqlbMhZXNWAuv8yl9PbQ
	 ejjxke3K6kIZEX8RV+L+cvcR3PfVNm+wr4e0Jjet3y5bVmMaQrlyukQ+Dvs+ZcbLjBjI6
	 6hyAX6RHuHP1hqPhg1UBWrPCeFT21z8xGVq2NSA8U7l5Jlbf9FCl+ORFoKKsbyzKhrZVH
	 g9OXu4VrQuvXTtqoYfPyh93+EICTUhnzkaBarhNydx9MqQIXAO4wkEY3O/907bAGFMo1B
	 k4QKbjrbQ1WqNBwAHbudvVEZWOmdw94vN99TLgbVekK84NrvKRv6g7UjpDK+nKkFgJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594107;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=d2QIhbA7QhCivR50zSSAz9H7hucMoaLoaEvtm+6A4aI=;
	b=x5+QExJAQU3D0IXoZR6zWkyN6CRZqy00EvaIz60IcwNPTyR3brwvlP0vhucl3YMGx6Tj
	 YyOsu5uPr/kPRTPPV0LGW4hlQ7kAJCZGPvFlFG3N2DgWmgc+u/ZJizuOCjJc3VlOPvKPu
	 AgD7voFpiW9T06LOolhahHV4K9whvKbit7VJp6J5Gsl6ZtE5ExlWiwJKVoEqj2POQjv1T
	 kBLtee00Uf9Nwq23QTPzg/PATxhrvSiIOmghfMcXQ9xqJTxlktSDju6JZHLfgHDR+pkcJ
	 JShUU6lMdusyYaCcd7bqdZ8GcUSF64Y6kI8YMRrpI2MbsE0XWJxucgTxaECFa+UyT3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fzR4czOo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF6D606A327;
	Fri, 13 Nov 2026 18:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fzR4czOo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794594106;
	b=KEGhjKlsQ2CfgAj0OjJQ9X+VkeTDdk6ia+YLCcM5KnQkXOyP8g8S+ugCh5pzJJ6EwJeG
	 29m0qyM+8Sk65KQqpzg2EEw84QPUJgD2uqSUg5/d8GU7ro9bfriOcOADCLM+bYahpuQ9U
	 di0+HcYt++gm2cFbYKV/cwDJx3xSTJ+MUBPQJG8SlUshob5Vk7oZxWM0vqDDDvTOoUlFS
	 8mxcKPSVh0oNIIut85EwM/kUPAyOYb9elf6CLpsL9q2om8c/sKHdZ5U2BeUgJwjzZGid2
	 JXZVZhaSAD0jG1ftu3zL+b/4Qg+xh1zPvulcfnKjpJ0QVJRvQE32Odbzbfg7STPDQiA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794594106;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=d2QIhbA7QhCivR50zSSAz9H7hucMoaLoaEvtm+6A4aI=;
	b=nXgOiOZ3tj8Gwtq6nyNw/Gsrjl+2INNk+0a7ZPRZZzwosh5LXI2H9P9hTioKGxJZSJ0f
	 7RmdTsnqrq/qIdTsrvnvx9Dl//MX+cCihcViYsg6nxX5vUMO4wgmBqQSlCc+eefX5ktbI
	 8GUg8N8mbdAUnwKOkn1RHWIxtmGkV3B+YcLEMCzoJmz9a/4WkCmsY5Bf7akvb5JdT+z7O
	 u/twq8KYkYkWhiTfzCBgbcMIRqHBI1u2hQSbQRO8lLCmS39ekOEXbi7dZVBniO/iK/D9U
	 wmeBgh60pjHJwgjY9RAnRasneesgaRVhK3lP4+Q/szHvPaLUGN31naqbOp1UL15Ey3Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD9901F000C4;
	Fri, 13 Nov 2026 18:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794594106;
	bh=d2QIhbA7QhCivR50zSSAz9H7hucMoaLoaEvtm+6A4aI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fzR4czOoMqx8nW1sc1kkajONQ082NQs12oasdHxZTM+6+zKdcNvU90hmjNNbIORiM
	 u4za3IEcYR5jSvVGkR1vE7S35hiVZJQkp5EJYnAABgpCbtuxsCY/x6kKTkyYGo41Dz
	 CVDbdu6RWyA4/6mgD4ze+E0itkksURgh+EfDbe2XkTtvTUy5R2G5My0BQnwqEDZZsG
	 Bk+6H6zAScgUK6qn7WW6NLLJvWCrq0mdoNC7AuEZDP/85oCgGILEidRKAuhhbzvOYW
	 xPkqAXc1LHrDgR6OHyztmLGlKZhFfjgYbnvz0zdG/J9HoT5repbtRvBE34y3j5+EyT
	 4m9uyRWcYpRkw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 47AEB49A69;
	Fri, 13 Nov 2026 18:21:45 +0000 (UTC)
From: =?utf-8?q?Nicol=C3=A1s_Antinori_via_B4_Relay?= <devnull+nico.antinori.7.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 15:20:56 -0300
Subject: [PATCH v3 2/3] rust: kunit: allow same test name with different
 #[cfg(...)]
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-rust_kunit_v6_send-v3-2-0d7832c07166@gmail.com>
References: <20261113-rust_kunit_v6_send-v3-0-0d7832c07166@gmail.com>
In-Reply-To: <20261113-rust_kunit_v6_send-v3-0-0d7832c07166@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Gow <david@davidgow.net>, 
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
 Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Yury Norov <yury.norov@gmail.com>, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5166;
 i=nico.antinori.7@gmail.com; h=from:subject:message-id;
 bh=z+rWrk/eWvf2ggetV8Ph1CCp9hKJ1q4AZXFHqAQl1qA=;
 b=owGbwMvMwCV2QdXfwqNJ1YjxtFoSQ9b3ULMZqzPbXy7/lTt3tnu46uQy/9wF2prfa9f84rm6M
 65gxc2tHaUsDGJcDLJiiixzOd9/NrY1ryiX3hQEM4eVCWQIAxenAEyE14rhfyZrdck7va0Ovyy/
 OpVdsOeve3t8wVx7gSKHDK9p5fxm8gz/1GuSrXZHnXp9Y7J6zXHmrrM7XZZeUmnrFi1ft0vx/cM
 v/AA=
X-Developer-Key: i=nico.antinori.7@gmail.com; a=openpgp;
 fpr=9D09EFF3333D3778771BB252D0254F3848822532
X-Endpoint-Received: by B4 Relay for nico.antinori.7@gmail.com/default with
 auth_id=1086
X-Original-From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Reply-To: nico.antinori.7@gmail.com
Content-Transfer-Encoding: 8bit

From: Nicolás Antinori <nico.antinori.7@gmail.com>

Sometimes it is necessary to test the same code paths under different
configurations. The `#[cfg(...)]` macro can be used to check if specific
configurations are enabled and run tests accordingly.

Currently, defining multiple tests with the same name under different
`#[cfg(...)]` attributes results in a compilation error. This patch
removes that restriction, allowing identical test names across different
configurations.

Reviewed-by: David Gow <david@davidgow.net>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/kunit.rs | 22 ++++++++++++++++++++++
 rust/macros/kunit.rs | 36 ++++++++++++++++++++----------------
 2 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index be02b9e4ae70f4913a5074c512d4adf78e34335c..76be6156f452cc174019e6565b54320967521874 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -361,6 +361,28 @@ fn rust_test_kunit_in_kunit_test() {
         assert!(in_kunit_test());
     }
 
+    // Tests with cfg have the same name on purpose because we are implicitly testing that
+    // tests with the same name but different configs do not throw a compilation error
+    #[test]
+    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "y")]
+    fn rust_test_kunit_run_only_active_cfg() {
+        assert!(in_kunit_test());
+    }
+
+    #[test]
+    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "n")]
+    fn rust_test_kunit_run_only_active_cfg() {
+        // This test should never run because of the `cfg`.
+        assert!(false)
+    }
+
+    #[test]
+    #[cfg(CONFIG_RUST_KUNIT_SELFTEST = "INVALID_VALUE")]
+    fn rust_test_kunit_run_only_active_cfg() {
+        // This test should never run because of the `cfg`.
+        assert!(false)
+    }
+
     #[test]
     #[should_panic]
     fn rust_test_kunit_panic_in_kunit_test() {
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index ac7495deab17d6579e3f213b7018516c9ca68425..476315c3f9e1b9d987b4f4121b36745d83ad87bb 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -45,6 +45,8 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
 
     let mut processed_items = Vec::new();
     let mut test_cases = Vec::new();
+    let mut test_cases_cfgs = Vec::new();
+    let mut test_case_number: u32 = 1;
 
     // Generate the test KUnit test suite and a test case for each `#[test]`.
     //
@@ -144,7 +146,7 @@ macro_rules! assert_eq {
         // Add back the test item.
         processed_items.push(Item::Fn(f));
 
-        let kunit_wrapper_fn_name = format_ident!("kunit_rust_wrapper_{test}");
+        let kunit_wrapper_fn_name = format_ident!("kunit_rust_wrapper_{test}_{test_case_number}");
         let test_cstr = LitCStr::new(
             &CString::new(test_str.as_str()).expect("identifier cannot contain NUL"),
             test.span(),
@@ -164,18 +166,12 @@ macro_rules! assert_eq {
             )
         };
         processed_items.push(parse_quote! {
+            // Prepend any `cfg` attributes before the function declaration to activate it only in
+            // cases the configs are on
+            #(#cfg_attrs)*
             unsafe extern "C" fn #kunit_wrapper_fn_name(_test: *mut ::kernel::bindings::kunit) {
-                (*_test).status = ::kernel::bindings::kunit_status_KUNIT_SKIPPED;
-
-
-                // Append any `cfg` attributes the user might have written on their tests so we
-                // don't attempt to call them when they are `cfg`'d out. An extra `use` is used
-                // here to reduce the length of the assert message.
-                #(#cfg_attrs)*
-                {
-                    (*_test).status = ::kernel::bindings::kunit_status_KUNIT_SUCCESS;
-                    #assertion
-                }
+                (*_test).status = ::kernel::bindings::kunit_status_KUNIT_SUCCESS;
+                #assertion
             }
         });
 
@@ -184,15 +180,23 @@ macro_rules! assert_eq {
             case.attr.rust_should_panic = #should_panic;
             case
         }));
+        test_cases_cfgs.push(cfg_attrs);
+        test_case_number += 1;
     }
 
-    let num_tests_plus_1 = test_cases.len() + 1;
+    // This dummy array is used to calculate the exact number of tests cases that are active
+    // depending on their #[cfg(...)] attribute.
+    processed_items.push(parse_quote!(
+        const TEST_CASES_COUNT: &[()] = &[#(#(#test_cases_cfgs)* (),)* ()];
+    ));
+
     processed_items.push(parse_quote! {
-        static mut TEST_CASES: [::kernel::bindings::kunit_case; #num_tests_plus_1] = [
-            #(#test_cases,)*
-            ::pin_init::zeroed(),
+        static mut TEST_CASES: [::kernel::bindings::kunit_case; TEST_CASES_COUNT.len()] = [
+            #(#(#test_cases_cfgs)* { #test_cases },)*
+            ::pin_init::zeroed()
         ];
     });
+
     processed_items.push(parse_quote! {
         ::kernel::kunit_unsafe_test_suite!(#test_suite, TEST_CASES);
     });

-- 
2.47.3


