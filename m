Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6888130568C;
	Sat, 13 Jun 2026 14:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781359711; cv=none; b=XabS9dtahtf2+S5qcg9tpX6GIswNZxu6SFP4bJRRKBHxmA8J1G+1GTeDUjZNcqRRIVlPM3VAxElkLvV8fpaMPgopcKEkvbo5XO5B3Gb7Tj96kCE4OG1P8eH4HE9FNeTMvPdUWaL0AbOS82vUkEbkntF2I/NQQ4N065bJdRHQyYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781359711; c=relaxed/simple;
	bh=LgzRIGOVsjx6d5Ew2TTqN5V4CQsCP0OEH6n6tMlCiw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CfJ2ySamAc3RmhJyxnopS/ZAb1/IO7zp35ai4ADArZ3GFDRt4g7n7YUO0yMwPCO9uNy5FH1RncGzdRALkYkoORrZqNztihk+dayoP0qGTGSMXOSp0/1Bb7K/BrEw8KygbXR57mTJyGNajH7oAWI18AH5iw+dg8GO6GKSa2wOpiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJ7vObKo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJ7vObKo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1031F000E9;
	Sat, 13 Jun 2026 14:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781359710;
	bh=zYIUiNBSlcn2cx/qq6e7sf5EKknSkC8QfbwqunhP8Ko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=EJ7vObKomIxnglLZn3J5lByaImQbmnkZQX+pZ6TkJGf35M0A5r9SVM1fqNCGymLLv
	 e55ApDmLIeXe6YmNyoZjTT/Y3Z4u6+8m5Lk9SXjRqGtBjOkJe22do5fkx1r3i/yZ+5
	 uQ2GYz5jfh+Y9sTJtU0HXOheuRskAvuqvdhuDrkGlF24AmvOufaIiJt5rPNoez6Kc7
	 rmK23iaOMRsA+XHelLRg1j0q1yslOWURZAajRx4nO07CXLdTyOBUC2fpD7nycpZlYS
	 wtbdeE8IPQ0uFqBQ+B3OFpyHHbjUPviNUMIZbwaS4CWPOV9YhTcadGUdgTMb5Qd+bJ
	 j3J1ewHDtomkg==
From: Gary Guo <gary@kernel.org>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Igor Korotin <igor.korotin@linux.dev>
Cc: rust-for-linux@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rust: doctest: trim function name for reproducbility
Date: Sat, 13 Jun 2026 15:04:30 +0100
Message-ID: <20260613140431.232471-2-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260613140431.232471-1-gary@kernel.org>
References: <20260613140431.232471-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Currently rustdoc will generate function names like
"_doctest_main__home_gary_Projects_linux_rust_kernel_io_rs_824_0" for a
doctest located at rust/kernel/io.rs:824, when building with separate
outdir using `O=`. This creates overlong symbol names and is also not
reproducible.

Fix it by doing a custom remapping to trim it to something like
`_doctest_main_rust_kernel_io_rs_824_0`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 scripts/rustdoc_test_builder.rs | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/rustdoc_test_builder.rs b/scripts/rustdoc_test_builder.rs
index 2b1f9ba01839..fda7284355f8 100644
--- a/scripts/rustdoc_test_builder.rs
+++ b/scripts/rustdoc_test_builder.rs
@@ -47,11 +47,18 @@ fn main() {
         })
         .expect("No test function found in `rustdoc`'s output.");
 
+    // Figure out a smaller test name based on the generated function name.
+    let name = rustdoc_function_name.split_once("_rust_kernel_").unwrap().1;
+
+    // The rustdoc function name can include the absolute path when building with `O=` which is
+    // undesireable and create overlong symbol names. Remap it to relative path.
+    let trimmed_function_name = format!("_doctest_main_rust_kernel_{name}");
+
     // Qualify `Result` to avoid the collision with our own `Result` coming from the prelude.
     let body = body.replace(
         &format!("{rustdoc_function_name}() -> Result<(), impl core::fmt::Debug> {{"),
         &format!(
-            "{rustdoc_function_name}() -> ::core::result::Result<(), impl ::core::fmt::Debug> {{"
+            "{trimmed_function_name}() -> ::core::result::Result<(), impl ::core::fmt::Debug> {{"
         ),
     );
 
@@ -62,12 +69,9 @@ fn main() {
     // We save the result in a variable so that the failed assertion message looks nicer.
     let body = body.replace(
         &format!("}} {rustdoc_function_name}().unwrap() }}"),
-        &format!("}} let test_return_value = {rustdoc_function_name}(); assert!(test_return_value.is_ok()); }}"),
+        &format!("}} let test_return_value = {trimmed_function_name}(); assert!(test_return_value.is_ok()); }}"),
     );
 
-    // Figure out a smaller test name based on the generated function name.
-    let name = rustdoc_function_name.split_once("_rust_kernel_").unwrap().1;
-
     let path = format!("rust/test/doctests/kernel/{name}");
 
     std::fs::write(path, body.as_bytes()).unwrap();
-- 
2.54.0

