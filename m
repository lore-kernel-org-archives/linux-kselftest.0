Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793293193;
	b=cxE8dce7FV3Tem6V6SjwdWW7bFR/gjhdM9NOCFcq5lsIvgBb4EYS/ZYl6en4P53BW171
	 72GYq8PuMIaIjU8VP/EY/5PWL/wpIehON0iCA5mM0afsr6T1RjuD1nVnEKoVizZeRvaV9
	 RLtmZOTvvS0WoH/md4EDH5v5JHaQ1JKDr/2B8TkgkVsMx3A0mwN7oknO2qadN1GXzAzYl
	 NvTkNLgH179mPa3QU+sBlWwzvNPLMSQBiSFHZQFbOhSvyYVOeq568QYKaIuoHfhZ7r4v4
	 SpEIlNLFXEMGWm7Pzqbo2Ampmdv1dLq6DT09Yr9YxR2ANKsJ2XLRoWUSQQtjylVL0Gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293193;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dUQ2rWkA23mCd6BSj61o++KCBFyn8O400fA/qDdn6sM=;
	b=GaDlh+VgqRScPSjqbrTmfZX/q7dd0z5atDjC+t1oYW4S4L6C5pOmGBaBaE5DKXZzFkkq
	 zrhj5FjDEUbLaPIm7DAIMlz+HXmUNbC8UsT5Hts25Wtuz4w2/Byr2Bd9F76ZEqfS0e7da
	 0hE/a57WmpkzfMc2rp8CdyxlfJ69eyXUHAumzWiFFESg/r4bOkPsuIGvfn9tnG9yvzQy7
	 AGRBr1pzdtBU2Ic57Dy8MwNc04APgtVzfjjL8jEO/JjRtfQ3Dsu3H+QIP021jbCKOlICd
	 eBiVFrxdEYhpeaTSzL+hNLqUBZpsWxgO7iXV95+2IdBiFmWWSNugyipBi1D1+vW259w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=errjSsOe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFB5606A339;
	Thu, 29 Oct 2026 16:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=errjSsOe
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793293193;
	b=Qqr0uT78ZE1vQw4SJko9Q48M7mHGl45diXYRuq29rpAAHVAsd+PiE7qao4QuduLY/TWx
	 9HcRP7CcipoGrfALpzY4CI1QhzguBAB9XIXK1YZQ32v9rY23KowTYjsunkdwoGziIC6FU
	 KXO3BB6Cs12J3dPxysjiuF8P2CXDBa78y2gLOY7rB8PFEJPiEgxvGS5eZuBUbATJIL8bT
	 lbRkfGybltf+dgcuDhcl9CPb0Mm12aWti7lV7i8rPaDEhrG4Rh7oAZDok+GWRL0h16Pne
	 yXsoA3THeHlVtBDFdP334nhyJMGMaevr+rt2eUelkoFy45syxaCaigOX8p9gLzy5tOw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793293193;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dUQ2rWkA23mCd6BSj61o++KCBFyn8O400fA/qDdn6sM=;
	b=LoCCxuitF3fFEPoXi1eB0FZ/X86YT4XjqEtfxxo8JK8CBAAHtSf8tY6pKLR5G62Y9Vnx
	 b3nlpmR8t+2aeqnJ1O9XJ8HUQYVT2wZ087GJ3thN91uHo7a7FexGvWqUwmPNiszoNJAR9
	 kFRQQ67C3kfLPE7tt+ROavwb4Ba5E3CokZHvJkjMa77RcERhE+3C095din2UjDcaFYDPc
	 1RYG4ZIxRBcEktRb4cFx1/MxnU37V6v7NcRwcIJnlmz9NuUUKHHZeBSntlNKGg5mChrHi
	 qJVAuC1w1fh4HdcDjVCJAln2xdbDi9QGeBwy32Vm34exiuJ/D30cGO8wquvp1X9N6zg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B9CEC1F031E8;
	Thu, 29 Oct 2026 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793293193;
	bh=dUQ2rWkA23mCd6BSj61o++KCBFyn8O400fA/qDdn6sM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=errjSsOej9bgDOfiTpN9IJhiti/LBQQGJraYP/UdMy/jcbMTX/XoZeqYzYziDG9hj
	 yVWtRGN7IxD4LsTmAw24yAHKlUBHIhviHBUXBE1pXu9SGkgHH23pNxsRZuSQSkSREQ
	 Fk5/coKXX1AOs+0DCDlb/qZHf9GvQzv4U9arrvySPyh76SmSZP8oMjh7oALZP5jdNI
	 JdQgji8afEw3toUzBRpN0CLWvT6EqgtwLKVZ+IB5gZnQp0phLPFjTtZ7ch9XtXc9Av
	 C/ahVn4WmF+fBQwYQxFVsGeGGiHkSW49mz3l1zfkgABOHcx8BQn1lMmua+OSXV8tGB
	 VQadsHHcqSmiQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2EEBE4590D;
	Thu, 29 Oct 2026 16:59:51 +0000 (UTC)
From: =?utf-8?q?Nicol=C3=A1s_Antinori_via_B4_Relay?= <devnull+nico.antinori.7.gmail.com@kernel.org>
Date: Thu, 29 Oct 2026 13:59:02 -0300
Subject: [PATCH v2 2/3] rust: kunit: allow same test name with different
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
Message-Id: <20261029-rust_kunit_v6_send-v2-2-5ce551efc48e@gmail.com>
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Gow <david@davidgow.net>, 
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
 Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Yury Norov <yury.norov@gmail.com>, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5079;
 i=nico.antinori.7@gmail.com; h=from:subject:message-id;
 bh=zzc2fwAl7G0oF5NHbgAZSoqWvnfQ18grBJuQDw4KJ6o=;
 b=owGbwMvMwCV2QdXfwqNJ1YjxtFoSQ9bj6pZZTq5XXzhrVeUXqtR/NffM8tku2Mz4dUOp8Jb/r
 P9Y6hd3lLIwiHExyIopsszlfP/Z2Na8olx6UxDMHFYmkCEMXJwCMJEVDQx/uKe9Pn5Czrqk4oRM
 l9CP2ZMDizn4TgRNNBJyd+pNnvZrL8P/2IPR7bZLwtLuzSrsd3rNePBQ5M4J/o8v9lbtKggOZ3/
 JBQA=
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

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/kunit.rs | 22 ++++++++++++++++++++++
 rust/macros/kunit.rs | 36 ++++++++++++++++++++----------------
 2 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 5e688b743ee2152867e2f99c7f18b86e1b7fbe3d..ba3040d302b95af6d6e648a229ac8e9ea2c31a8c 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -367,6 +367,28 @@ fn rust_test_kunit_in_kunit_test() {
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
index 288b53d21c4e7c8d9b5148d50c1a833f73e53015..173792563ca8b42e39ec0a53798f7b3bb75bf9cf 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -45,6 +45,8 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
 
     let mut processed_items = Vec::new();
     let mut test_cases = Vec::new();
+    let mut test_cases_cfgs = Vec::new();
+    let mut test_case_number: u32 = 1;
 
     // Generate the test KUnit test suite and a test case for each `#[test]`.
     //
@@ -134,7 +136,7 @@ macro_rules! assert_eq {
         // Add back the test item.
         processed_items.push(Item::Fn(f));
 
-        let kunit_wrapper_fn_name = format_ident!("kunit_rust_wrapper_{test}");
+        let kunit_wrapper_fn_name = format_ident!("kunit_rust_wrapper_{test}_{test_case_number}");
         let test_cstr = LitCStr::new(
             &CString::new(test_str.as_str()).expect("identifier cannot contain NUL"),
             test.span(),
@@ -154,18 +156,12 @@ macro_rules! assert_eq {
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
 
@@ -174,15 +170,23 @@ macro_rules! assert_eq {
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


