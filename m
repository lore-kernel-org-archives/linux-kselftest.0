Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DDD2D73A1;
	Thu, 24 Sep 2026 00:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790211081; cv=none; b=EM6jTgLohstBqh1Nrl3gpMnlxZWLnx1McxXsDfD43xKSJvhzj/mIuSRBfRRFX9gsCyNMrGuhMJ/kTW7CBgBY0sRytPWYMj+ZoVRZ3h5fnzSomw3kqIjfiHBPXtr86lIUYLf2W4vO+lXNeIQzDSO58jGw2YIirGkj4OQWL4ZWTHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790211081; c=relaxed/simple;
	bh=/azrSupv5XjVi35+gJau9kjb5Wup6px2ofG49fE7uVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQLU4329vg490Ok8HlbYjqziw8JlKt3x6P7KyTNzi/JUBZngY+JOKP8uCUbVzmrujuzCkX3Q7QKxRi/GhkuHbvGi8L1ldFa8BeKKORyCLj4G6NPiAZw1OELKKrdRCaKudokmhExU3joRwr1OCznbhkLnjvcIAIHHy9q1CYZDSJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnHfZW+K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnHfZW+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB0A1F00893;
	Thu, 24 Sep 2026 00:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790211080;
	bh=QMGhoK1Ey5kUBOODA0xeI7bswOPYkQnFaq58AZfxBUo=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=KnHfZW+Kx3FwrThLm2GnPNkUtbn4dgFiFILNvvpyEkaxUKAbF19CgtBBPRs63i/dg
	 hs9OsAQxcOS2uY/R7ee86hfffAn7LULaTVsZYZJnGYwdU7O0AT2phywVzT9NcvHE+4
	 8u2nmUGFm6jYiqRYctWy4Pf/OnYmyBfGzZT1QgHMkRCdtKpUsWeQxWgMichSAN8LD+
	 D9gExWZGrA+8+GazRo2HeyeGV3bmjCjuk8rK2YHAYVcd5wut20DEeUAxPcPee+5ZD0
	 W1kmKaRYxwtmOiJzc//jnsnzVF/3n76euijn9nMAbxXOsRcMtmUE4gHi6jUebSsaQC
	 GqOMbY4MayLNg==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>
Cc: linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] rust: doctest: trim function name for reproducbility
Date: Thu, 24 Sep 2026 01:50:51 +0100
Message-ID: <20260924005052.2805129-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
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
 scripts/rustdoc_test_builder.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/rustdoc_test_builder.rs b/scripts/rustdoc_test_builder.rs
index df864437cef7..561f912c2000 100644
--- a/scripts/rustdoc_test_builder.rs
+++ b/scripts/rustdoc_test_builder.rs
@@ -72,6 +72,11 @@ fn main() {
     // Figure out a smaller test name based on the generated function name.
     let name = rustdoc_function_name.split_once("_rust_kernel_").unwrap().1;
 
+    // The rustdoc function name can include the absolute path when building with `O=` which is
+    // undesireable and create overlong symbol names. Remap it to use relative path.
+    let trimmed_function_name = format!("_doctest_main_rust_kernel_{name}");
+    let body = body.replace(&rustdoc_function_name, &trimmed_function_name);
+
     let path = format!("rust/test/doctests/kernel/{name}");
 
     std::fs::write(path, body.as_bytes()).unwrap();

base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.54.0

