Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794069400;
	b=LVMkvFu7wJwWUGfTR1irnxLVBk4/tSwEpYhQH9pV+T6vz1tdi0TOnky03qvE2g8cPUp8
	 BIntVNlOQCeHd5z9wAuhDcWvHgRrtfChyu1CHL65RKAC0i3XqYNkHu1Hezhzs6/J/uQoq
	 V0/uKCy7LnvodWXRMMoLeH+Q8S3hfX1grgRg/sfFoA6OyGQiUkRy8px0kYeoUEkoRhHOw
	 DmZhfD2/o2L52k2Qh14+vQSG0afQ4IQ6ulVsFAkRtMxW5hRUDlccEriDvJASr6hnLYq1n
	 HwTAcvWE6ufKjV0dA5PFD5BN1h5ee0rVXzc5TnEFlexfUyCVVgCYymArjhDjiQ1BMJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069400;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OY93VwbfzjBg0BXxTjqx+bommJCWEgMu4VHNBvyfHIg=;
	b=iWsEa8f/BrYBPo9KWnAq9acIFwl5v+wkEtK95Du0JcuL9a+AgoEX37t9IID/hQSmaOpG
	 LSmqKiRXaNhoOXQMvuPAIFXPapKlr+mh99DAHf9fHA8WhY7ivgi5Hiqg3qmekTZkwx9T+
	 jVddTG9HC/R0iTOdjd9U5CkyemYBR+95JX74l6jNW0JVRoE5C2+PDpH6XpbWP1K5WUQJo
	 0cDuCqxq6GROxox7Sn9AypmRL0CXQCDS173PL8FLjnBUQfp9utkfUuY7zwkT9JlXFw7fv
	 3cA3OYtmbOEGzMpTSgW2F+nZSscYLfnId87XwrlA9BPvsXfjSkGMNBj3ylIaP9s9mUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z9ADBUtX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E260606A32D;
	Sat,  7 Nov 2026 16:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z9ADBUtX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794069399;
	b=WdmlKnzb3BWi4DnC+z46E2mVs9iUJ1WK/QsNSh6kr+tiAkqFXM6OwvlLQKq+PEcPHG4Q
	 USzyhpYB4ewtwamB83DRn3uT4zak5u79Ym4LgGzRiIfKsb0ERHmQHmeITyUp7mKaZNDX9
	 rlKWtkkuUU5mTW0bxYcpU57NVCrO1r+tpfuu+szWC9at52kaJTAtbvGrtMZKwgpDY+rTc
	 hzICCybiXN7QFGstfup/2e/+juh0S9JIHSiKWef9SXclzxFmUO94H35QpjSZaRiQJsaJ1
	 rcvVrYHl7v0jBunSXw/Rmk/zcVFQ2SW6Cgq1C9dkZdQQ0qraFZ4FU/6aG2U/oOuKWGQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069399;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OY93VwbfzjBg0BXxTjqx+bommJCWEgMu4VHNBvyfHIg=;
	b=cGZ8cwBIvhNc0dN5K6Fh8K9w+rbaVkhnSBQ0bYJNT1dkVm1yvfUdh4aj+2/lBcIcQm4T
	 tvalXDz/ZdJUSKTIP8Vs+W3vkWsN71Dwlu7jjQ93S/Rl+C3fy6fWGncrxXF0lksTN8ED8
	 LJPIuWzGapAeqIq475eXepA2VbMpDsB3Jz4ThexXkron9jUXrLgqYnc+ILpVu5Q4yTun2
	 5da4fFrNIeyHJ1PPrZ7k8CzumGnay571oLBymXucbGXYvew/oSXZrs2OM1O01SyfCJZZI
	 pSnkkA9hFX1/aIGauQP2f3dcDD+RHAiTQhwBUhC7i+xejwf3eL7UTxQjsEoD4SVjMSw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BCFFD1F008A2;
	Sat,  7 Nov 2026 16:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794069399;
	bh=OY93VwbfzjBg0BXxTjqx+bommJCWEgMu4VHNBvyfHIg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Z9ADBUtXmDSKikuov8I44jgdSrgaKtu8oKsHJel97Zuh4mxGOzXQqk/Hj1TKwdVi3
	 MzyMbZ3XB3LagK/QJ0Jrjj6Tk+MAPvt5zTcbrPY6LUd4npbzmbVZsWr/+QfIQYAzX7
	 TXaPEb2BAnMCWXNFrriBgGz761E+f5yt5zBR20E1aOwG+u9ZCu9RzqzoHune838FuL
	 7KtQnjQpt5Jktfco5h8lBgEMjyTZId3VbJ0PJSlEhI4Eunn7U0Nkjp5t6RW4zurz2g
	 PjH1OHnyPvZt8D83Oi+eSYVYSia16iFOOXEA+5WhnvMu6rvjdj8WL5xJDBbIdatJsz
	 6IZdTvB8UDArw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1800547C6F;
	Sat,  7 Nov 2026 16:36:38 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Date: Sat, 07 Nov 2026 17:36:24 +0100
Subject: [PATCH v2] rust: doctest: fix line numbers after crate-level
 attributes
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
Message-Id: <20261107-rust-doctest-line-fix-v2-1-a66528f0a7c3@younes.io>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBCFr2Jm7Zi2hIquvIdhAWWQMaY1nUIkh
 Ltb8ACuXr6X97OAUGQSuB4WiDSxcPAZzPEAbmj8g5C7zGCUsVqZM8ZREnbBJcr6Yk/Y8wddq3p
 rC2suPUHuviNle9+91z+WsX2SS9vYlhhYUojzfjzpLffvY9KoUTld6Kpsyqq1tzmMnuTEAep1X
 b+sd//FzAAAAA==
X-Change-ID: 20261027-rust-doctest-line-fix-cb0f663629fe
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Younes Akhouayri <git@younes.io>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794069397; l=4560;
 i=git@younes.io; s=20261027; h=from:subject:message-id;
 bh=yODJlg7TFm3NgQtApP8hmB9DSotdMjoacbgECuGShSc=;
 b=GimVZfWmQy4O6IvvPp1BMLOsh1yM/b+aIA2FtrbbAIuG9go4rlPd59FrXAspFvU34qwCphMrj
 UA9Jr3BPOz6CrGcURhEnX7EGZNZVaUbc7MDm0l/uNojhOSX39dS2X7W
X-Developer-Key: i=git@younes.io; a=ed25519;
 pk=TavwxGPDBjl4XGNQyFLKEW7PKSY4qOWusc7yf6hjV0c=
X-Endpoint-Received: by B4 Relay for git@younes.io/20261027 with
 auth_id=1332
X-Original-From: Younes Akhouayri <git@younes.io>
Reply-To: git@younes.io
Content-Transfer-Encoding: 7bit

From: Younes Akhouayri <git@younes.io>

When a doctest starts with a crate-level attribute such as
`#![expect(...)]`, KUnit reports failures one line too early, and
`line!()` returns a line number that is one too low.

This happens because `rustdoc` moves those attribute lines out of the
test body and puts them above the `main` function it generates. The
generator works out where the body starts by counting the lines above
`main`, but it does not know that some of those lines were moved there
from the body. So every line after a moved attribute is mapped one line
too early (or more, if there are several such attributes).

For example, adding `assert_eq!(36, 0);` as line 36 of
`rust/kernel/init.rs` (inside the doctest that starts with
`# #![expect(clippy::undocumented_unsafe_blocks)]`) gives:

    # rust_doctest_kernel_init_rs_2: ASSERTION FAILED at rust/kernel/init.rs:35

Twelve in-tree doctests start like this, e.g. in `bits.rs`, `devres.rs`,
`init.rs` and `std_vendor.rs`.

Fix it by counting the attribute lines that `rustdoc` moved (every
`#![...]` line above `main`, except the `#![allow(unused)]` that
`rustdoc` adds itself) and taking them into account when computing
where the body starts.

`rustdoc` always starts its output with that `#![allow(unused)]`, so
check for it before relying on the layout. If a future `rustdoc` (or a
crate-level `#![doc(test(attr(...)))]`) changes it, print a warning once
and keep the previous behaviour rather than failing the build: the tests
still run, only the reported line numbers would be off.

Only single-line attributes are handled, which covers every doctest in
the tree today.

With this change, the example above reports `rust/kernel/init.rs:36`,
and doctests without such attributes keep reporting the same lines as
before.

Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
Signed-off-by: Younes Akhouayri <git@younes.io>
---
Changes in v2:
- Check that the generated test starts with `#![allow(unused)]` before
  subtracting the moved lines; otherwise warn once and keep the old
  behaviour, instead of clamping with `saturating_sub` (Miguel).
- Note in the comment and commit message that only single-line
  attributes are handled.
- Link to v1: https://patch.msgid.link/20261027-rust-doctest-line-fix-v1-1-0c13185a58b6@younes.io
---
 scripts/rustdoc_test_gen.rs | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index 754c5aafcce4..01128d8c62f9 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -127,6 +127,7 @@ fn main() {
 
     let mut tests = String::new();
     let mut body = String::new();
+    let mut warned = false;
     let mut last_file = String::new();
     let mut number = 0;
     let mut valid_paths: Vec<PathBuf> = Vec::new();
@@ -168,6 +169,33 @@ fn main() {
             .count()
             + 1;
 
+        // `rustdoc` moves the crate-level attributes (`#![...]`) of the test out of its body and
+        // places them before `main`, after its own `#![allow(unused)]`. Subtract the moved lines,
+        // since the rest of the body is shifted by that amount with respect to the original source.
+        //
+        // Only single-line attributes are handled. If `rustdoc` stops starting its output with
+        // `#![allow(unused)]`, this computation needs to be revisited, so warn (once) rather than
+        // silently reporting wrong line numbers, but keep going since the tests themselves still
+        // work.
+        let hoisted_lines = if body.starts_with("#![allow(unused)]\n") {
+            body.lines()
+                .take(body_offset - 1)
+                .filter(|line| line.starts_with("#!["))
+                .count()
+                - 1
+        } else {
+            if !warned {
+                eprintln!(
+                    "warning: `{name}` does not start with `#![allow(unused)]`: line numbers \
+                    reported by doctests may be wrong, please update \
+                    `scripts/rustdoc_test_gen.rs`."
+                );
+                warned = true;
+            }
+            0
+        };
+        let body_offset = body_offset - hoisted_lines;
+
         use std::fmt::Write;
         write!(
             tests,

---
base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
change-id: 20261027-rust-doctest-line-fix-cb0f663629fe

Best regards,
--  
Younes Akhouayri <git@younes.io>


