Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6650228D8DB;
	Mon,  9 Mar 2026 17:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075728; cv=none; b=gL8RwU/nHpVzB0yBLg5QawQgMa0u+8JXh2E+OmjoOZ6HdE6mjnITEnlTFzi35vaZacaJ6Ong4eDZQng5Dz9ohIsCttnx40X57iJVnQbkVcXpSJVWSE38ux47488DMJ7HYBOLdk2Zfj5cqP3N8By04CwAQ8jIyeo/aqtyJf8j+kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075728; c=relaxed/simple;
	bh=3uq35Ktmul8lpGjhELuw35FYfyLMGaLFJUwwLb4+sqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rfSbpcz6zizqBxXTArxazYCOo7/VWGU//D6FbJi5GOFRsXKiubQib97L4GIAzDzx4rMzgVsbwulqYbtY0ozOSPR0TIw0sZV2AyrZ+Qejy/5lmjsMQbuvui9CMKDzj+u8IHucT8214nYD6DOanzeRL16Wggi5mLgfcbViQ8YGajU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vGQaIc0l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vGQaIc0l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31E7C4CEF7;
	Mon,  9 Mar 2026 17:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773075728;
	bh=3uq35Ktmul8lpGjhELuw35FYfyLMGaLFJUwwLb4+sqk=;
	h=From:Date:Subject:To:Cc:From;
	b=vGQaIc0lzv94/DjCNdOx3HxYGXxjHc6qx9q1d91GLq5/o3T03wVt2wH+pdUTpPYv7
	 rb90DuZ1Aydd0zJPwPbsMTU/wrE/Mx4wn5rnPUe1ALUpeairiFaK9G22SYA65+LH1V
	 16AH+15ktsUg5Y/rb7noPGX+CyHqOP0Dgkg0RMP3wiNCoOcyBHoO0uctz44N7nWcxw
	 /1Whozd6GsDVxtLBsA09v0f0twG//xThJw4k0Aqqk4U1BwG0K+2y29DtUp6G19IZgE
	 3jh1YW42LdYFJlKCH0KwiKiYmwv+CCtrs5pFnbpV2XSwVT6kZgZgOfOOwUOITcQt5A
	 RNT3eotrqExaQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 09 Mar 2026 13:01:57 -0400
Subject: [PATCH v2] rust: update `kernel::c_str!` documentation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-cstr-rename-macro-v2-1-25f7de75944e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7Zi2kCa48h6GRSkDVKUlUyQaw
 t1tce/yJe+/v0EkdhThUmzAtLrogk+gTgXY0fiB0HWJQQmlRSkU2rgwMnkzEU7GckBdKSFb0rb
 WNaTdzNS799G8NT+Or/ZOdsmhbIwuLoE/x+kqs/evv0qUaJSue6o6W/bi+iD29DwHHqDZ9/0Ln
 xlhYsUAAAA=
X-Change-ID: 20260302-cstr-rename-macro-64201be6c969
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Breno Leitao <leitao@debian.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2588; i=tamird@kernel.org;
 h=from:subject:message-id; bh=3uq35Ktmul8lpGjhELuw35FYfyLMGaLFJUwwLb4+sqk=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJnr/rJ/Tal7XLv2ZHIAx++NsRPfc24IZ3B7lGztnlRuV
 JeY+jS6o5SFQYyLQVZMkSVR9NDe9NTbe2Qz3x2HmcPKBDKEgYtTACZy7SHDbzbpKayz/LZbF89M
 uRfLbJy/0uS7XH6N89s/e72TpsRPF2T4Z52eW/VSNnZ59JYzP7q/aPr6rd424aVut/WP3ad8c4O
 OsQEA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Now that all literals are C-Strings, update the documentation to explain
that use of this macro should be limited to non-literal strings.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
This patch completes the work of replacing our custom `CStr` with
upstream's.
---
Changes in v2:
- Drop rename, keep only documentation update. (Gary Guo)
- Add example of misuse to documentation. (Gary Guo)
- Link to v1: https://patch.msgid.link/20260302-cstr-rename-macro-v1-1-a269fe4dc3f0@kernel.org
---
 rust/kernel/str.rs | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index fa87779d2253..6dae82e7d875 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -376,19 +376,32 @@ fn as_ref(&self) -> &BStr {
     }
 }
 
-/// Creates a new [`CStr`] from a string literal.
+/// Creates a new [`CStr`] at compile time.
 ///
-/// The string literal should not contain any `NUL` bytes.
+/// Rust supports C string literals since Rust 1.77, and they should be used instead of this macro
+/// where possible. This macro exists to allow static *non-literal* C strings to be created at
+/// compile time. This is most often used in other macros.
+///
+/// # Panics
+///
+/// This macro panics if the operand contains an interior `NUL` byte.
 ///
 /// # Examples
 ///
 /// ```
 /// # use kernel::c_str;
 /// # use kernel::str::CStr;
-/// const MY_CSTR: &CStr = c_str!("My awesome CStr!");
+/// // This is allowed, but `c"literal"` should be preferred for literals.
+/// const BAD: &CStr = c_str!("literal");
+///
+/// // `c_str!` is still needed for static non-literal C strings.
+/// const GOOD: &CStr = c_str!(concat!(file!(), ":", line!(), ": My CStr!"));
 /// ```
 #[macro_export]
 macro_rules! c_str {
+    // NB: we could write `($str:lit) => compile_error!("use a C string literal instead");` here but
+    // that would trigger when the literal is at the top of several macro expansions. That would be
+    // too limiting to macro authors.
     ($str:expr) => {{
         const S: &str = concat!($str, "\0");
         const C: &$crate::str::CStr = match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260302-cstr-rename-macro-64201be6c969

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

