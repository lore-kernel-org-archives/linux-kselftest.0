Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CDA2D3A7C
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 03:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782705126; cv=none; b=b3zZJneCbn5nxTbYxVfxH0/uejN3tj1rohnfF2z8jxFvmsMklk1AHoA5WcLQterON4TnVIGzwDaPMl3aK00XxTBxPydjetjoMzGbSuD/GIJObhQ2ZpVvy1jfnI3mP9ZK7wEc6iLoIv2TDo69G1EjyfVZvcEhCg0He9RQ86IowLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782705126; c=relaxed/simple;
	bh=7xgu4A20PivwFilI54b95ebc9EqN69/TkGemPxwiejQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SFUcti1kv91xJuOs8ne2ANtnXcQEmq3Msy/7aG7SE4od39evhisZ+TSJIZY2iQMln5CfVBc+Oma8+uIyypBPJM+jF5RnNB5/KS2FmRbaRsjIrVYS36o1zI0T7TP2OlOKBRzuZHNASRsWcYnIDFdtyMg4ygMC96hQtjdpFCNPiQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe; spf=pass smtp.mailfrom=nikableh.moe; dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b=HtarRKH6; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=ZArmANdn; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b="HtarRKH6";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="ZArmANdn"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=HtarRKH6v2fcy693NbAeAZvkgh3dvTeCW1cFtSs5GvFM5Cw88dpa0wvRdKIU0jy/GBrl9ITlFJU4EWT2SvUPSrM8Y0+XC/lWU0EhV0Vq6ByWpozjmpJqYjwVkbsnNy6GpTx994AxwhU8jKnOCGhvPJTLKeE5xs6VGPur9gfmCZENcnNUdaetScEmNrMBajXLXqjpkXcH+wUtQL5zJMPIunsce+mywtjERhy1oYrxk8h+yJO1JX8x0y0+UnNX31CZG52TslI8/6pUvIkEZXJQM6QfzJ37szM61jX43hWQJkFyaiRcRODs9iP33TMJjg1f4qTBWajOWytVPdPczqmxtQ==; s=purelymail2; d=nikableh.moe; v=1; bh=7xgu4A20PivwFilI54b95ebc9EqN69/TkGemPxwiejQ=; h=Received:From:Date:Subject:To;
DKIM-Signature: a=rsa-sha256; b=ZArmANdnH/UwW/JJI1CBRkK/1kptuQ2NH1ArvEF/3BOft5T5eRgrV/tYSngD6J78+SwMfOP0zBiwc4LiLrSQ0tNeTwMcNEXz+YKkJmSusJUSUUmg5QnxE83L5Lizqzbx+vWL3R27wdy9JiJgk8mewgsUH/gamsu4KnxkdGJSbCOTPD9+qnmTbuEYqcz2Hn2NMK0XUnHcmvO0tkvB9p18Uzqbls05QqVvuBDm1YS35FOEQxdVox3fITZ0btiVoq+mogJSlnvUJUOYlYjqK6zv6nn+YXD9SDet8CGB6Wp2F8FJAkNXUuO9reTnridrZTE29FRrliMw0aVLyMejavDDNQ==; s=purelymail2; d=purelymail.com; v=1; bh=7xgu4A20PivwFilI54b95ebc9EqN69/TkGemPxwiejQ=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 209604:18551:null:purelymail
X-Pm-Original-To: linux-kselftest@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1530718721;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 29 Jun 2026 03:51:39 +0000 (UTC)
From: Nika Krasnova <nika@nikableh.moe>
Date: Mon, 29 Jun 2026 05:51:06 +0200
Subject: [PATCH 1/2] rust: kernel: add cfg_select! backport for
 config-based selection
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-backport-cfg_select-v1-1-388d5d31d9d4@nikableh.moe>
References: <20260629-backport-cfg_select-v1-0-388d5d31d9d4@nikableh.moe>
In-Reply-To: <20260629-backport-cfg_select-v1-0-388d5d31d9d4@nikableh.moe>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Yury Norov <yury.norov@gmail.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kselftest@vger.kernel.org, Nika Krasnova <nika@nikableh.moe>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11980; i=nika@nikableh.moe;
 h=from:subject:message-id; bh=7xgu4A20PivwFilI54b95ebc9EqN69/TkGemPxwiejQ=;
 b=owJ4nJvAy8zAJTZhNXuihihnHuNptSSGLMfXh9SLH6xK3flhbswUD40/K02Mt9w7xynf+WlKY
 0HCt7TbQa4dpSwMYlwMsmKKLGVpWiGVbd8v+Zguz4eZw8oEMoSBi1MAJjLzNyND5yUB5s3vjny/
 a9z//Eu+oLvdjXxbAaEv5mfC7a8meMbKMjIc3vDOSDtMhodp2s69/E5G3JXTpOVPffK3KGYri45
 uYeYHAO7rQsA=
X-Developer-Key: i=nika@nikableh.moe; a=openpgp;
 fpr=D6F05A682D63EA3D6C771A8F4448A49D9CF79732

Conditional compilation in the kernel's Rust code is currently expressed
with paired #[cfg(CONFIG_FOO)] / #[cfg(not(CONFIG_FOO))] attributes,
which is verbose and easy to get out of sync when selecting between two
or more implementations of an item.

The standard library gained core::cfg_select! for exactly this (stable
since Rust 1.95.0): a single macro that emits the first arm whose cfg
predicate holds. The kernel's minimum supported Rust version is 1.85.0,
so that macro is not yet available. Add a macro_rules! backport under
the same name and arm syntax so call sites can be written today and
migrate to the standard library macro unchanged once the minimum version
reaches 1.95.0.

The upstream macro is a compiler built-in, which lets it be used in
expression position with a single pair of braces and accept bare
"PREDICATE => EXPR," arms. A macro_rules! macro cannot place #[cfg] on a
bare expression without the unstable stmt_expr_attributes feature, so
this backport requires brace-delimited arms and an extra pair of braces
in expression position (cfg_select! {{ ... }}). Item and statement
position are syntactically identical to core::cfg_select!, which covers
the common case of selecting an item based on a CONFIG_* symbol.

Link: https://github.com/Rust-for-Linux/linux/issues/1183
Assisted-by: Claude:claude-opus-4-8
Suggested-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Nika Krasnova <nika@nikableh.moe>
---
 rust/kernel/cfg.rs     | 297 +++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 rust/kernel/prelude.rs |   1 +
 3 files changed, 299 insertions(+)

diff --git a/rust/kernel/cfg.rs b/rust/kernel/cfg.rs
new file mode 100644
index 000000000000..20463701482e
--- /dev/null
+++ b/rust/kernel/cfg.rs
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Compile-time configuration selection.
+//!
+//! This module provides [`cfg_select!`](macro@crate::cfg_select), a backport of the
+//! standard library's [`core::cfg_select`] macro (stable since Rust 1.95.0). It selects
+//! between several blocks of code based on `cfg` predicates, which is most useful for
+//! choosing an implementation depending on a kernel configuration option, i.e. a `CONFIG_*`
+//! symbol.
+//!
+//! Once the kernel's minimum supported Rust version reaches 1.95.0, this module should be
+//! deleted and `cfg_select!` taken from the prelude / [`core`] instead. In item and statement
+//! position the syntax is identical, so those uses migrate unchanged; see
+//! [`cfg_select!`](macro@crate::cfg_select) for the (small) differences that apply in expression
+//! position.
+//!
+//! [`core::cfg_select`]: https://doc.rust-lang.org/core/macro.cfg_select.html
+
+#[doc(inline)]
+pub use crate::cfg_select;
+
+/// Selects code at compile time based on `cfg` predicates.
+///
+/// This is a backport of the standard library's [`core::cfg_select`] macro (stable since Rust
+/// 1.95.0). Each arm has the form `PREDICATE => { CODE }`, where `PREDICATE` is any [`cfg`]
+/// predicate (for example a `CONFIG_*` symbol). The arms are evaluated top to bottom and the `CODE`
+/// of the first arm whose predicate holds is emitted; all other arms are discarded. An optional
+/// final `_ => { CODE }` arm is used as a fallback when no predicate matches.
+///
+/// # Differences from `core::cfg_select`
+///
+/// The standard library macro is a compiler built-in and can therefore be used in expression
+/// position with a single pair of braces. This backport is a `macro_rules!` macro, so two
+/// restrictions apply:
+///
+/// - Arms must be brace-delimited (`PREDICATE => { ... }`); the bare `PREDICATE => EXPR,` form
+///   accepted by [`core::cfg_select`] is not supported (a `macro_rules!` macro cannot place
+///   `#[cfg]` on a bare expression without the unstable [`stmt_expr_attributes`] feature).
+/// - In expression position the whole invocation must be wrapped in an extra pair of braces, i.e.
+///   `cfg_select! {{ ... }}`.
+///
+/// In item and statement position the syntax is identical to [`core::cfg_select`], so those uses
+/// will migrate unchanged once the minimum Rust version reaches 1.95.0.
+///
+/// # Examples
+///
+/// Item position -- select an implementation based on a `CONFIG` option:
+///
+/// ```
+/// use kernel::cfg_select;
+///
+/// cfg_select! {
+///     CONFIG_64BIT => {
+///         fn ptr_bytes() -> usize { 8 }
+///     }
+///     _ => {
+///         fn ptr_bytes() -> usize { 4 }
+///     }
+/// }
+/// # assert!(ptr_bytes() == 8 || ptr_bytes() == 4);
+/// ```
+///
+/// Expression position (note the extra braces):
+///
+/// ```
+/// use kernel::cfg_select;
+///
+/// let bits = cfg_select! {{
+///     CONFIG_64BIT => { 64 }
+///     _            => { 32 }
+/// }};
+/// # assert!(bits == 64 || bits == 32);
+/// ```
+///
+/// [`core::cfg_select`]: https://doc.rust-lang.org/core/macro.cfg_select.html
+/// [`cfg`]: https://doc.rust-lang.org/reference/conditional-compilation.html
+/// [`stmt_expr_attributes`]: https://doc.rust-lang.org/beta/unstable-book/language-features/stmt-expr-attributes.html
+#[macro_export]
+#[doc(hidden)]
+macro_rules! cfg_select {
+    ({ $($tt:tt)* }) => {{
+        $crate::cfg_select! { $($tt)* }
+    }};
+    (_ => { $($output:tt)* }) => {
+        $($output)*
+    };
+    (
+        $cfg:meta => $output:tt
+        $($( $rest:tt )+)?
+    ) => {
+        #[cfg($cfg)]
+        $crate::cfg_select! { _ => $output }
+        $(
+            #[cfg(not($cfg))]
+            $crate::cfg_select! { $($rest)+ }
+        )?
+    };
+}
+
+#[macros::kunit_tests(rust_kernel_cfg)]
+mod tests {
+    use super::*;
+
+    #[test]
+    fn expr_true_arm_selected() {
+        // Expression position (double braces): the first arm is true, so its value wins.
+        let v = cfg_select! {{
+            all() => { 64 }
+            _ => { 32 }
+        }};
+        assert_eq!(v, 64);
+    }
+
+    #[test]
+    fn expr_fallback_when_false() {
+        // The only predicate is false, so the `_` fallback value is selected.
+        let v = cfg_select! {{
+            any() => { 64 }
+            _ => { 32 }
+        }};
+        assert_eq!(v, 32);
+    }
+
+    #[test]
+    fn expr_first_match_wins() {
+        // Two true arms: the first one wins, the second one is discarded (top-to-bottom, first
+        // match).
+        let v = cfg_select! {{
+            all() => { 1 }
+            all() => { 2 }
+            _ => { 3 }
+        }};
+        assert_eq!(v, 1);
+    }
+
+    #[test]
+    fn expr_fallthrough_false_to_true() {
+        // The false first arm is skipped and selection falls through to the later true arm, not to
+        // the `_` fallback.
+        let v = cfg_select! {{
+            any() => { 1 }
+            all() => { 2 }
+            _ => { 3 }
+        }};
+        assert_eq!(v, 2);
+    }
+
+    #[test]
+    fn expr_no_fallback_true_arm() {
+        // No `_` arm: the chain may terminate on a true arm and still emit it.
+        let v = cfg_select! {{
+            any() => { 1 }
+            all() => { 2 }
+        }};
+        assert_eq!(v, 2);
+    }
+
+    #[test]
+    fn expr_not_predicate() {
+        // `not()` in both polarities: `not(all())` is false (skipped), `not(any())` is true
+        // (selected).
+        let v = cfg_select! {{
+            not(all()) => { 1 }
+            not(any()) => { 2 }
+            _ => { 3 }
+        }};
+        assert_eq!(v, 2);
+    }
+
+    #[test]
+    fn expr_all_predicate() {
+        // `all(a, b)`: one false operand makes it false (skipped); all true makes it true
+        // (selected).
+        let v = cfg_select! {{
+            all(all(), any()) => { 1 }
+            all(all(), all()) => { 2 }
+            _ => { 3 }
+        }};
+        assert_eq!(v, 2);
+    }
+
+    #[test]
+    fn expr_any_predicate() {
+        // `any(a, b)`: all-false operands make it false (skipped); one true operand makes it true
+        // (selected).
+        let v = cfg_select! {{
+            any(any(), any()) => { 1 }
+            any(any(), all()) => { 2 }
+            _ => { 3 }
+        }};
+        assert_eq!(v, 2);
+    }
+
+    #[test]
+    fn expr_nested_select() {
+        // A `cfg_select!` nested inside an output block: the outer picks its true arm, the inner
+        // falls back (`any()` is false) to 2.
+        let v = cfg_select! {{
+            all() => {
+                cfg_select! {{
+                    any() => { 1 }
+                    _ => { 2 }
+                }}
+            }
+            _ => { 3 }
+        }};
+        assert_eq!(v, 2);
+    }
+
+    #[test]
+    fn item_true_arm_wins_over_fallback() {
+        // Item position: the true arm's `fn` is emitted, the `_` fallback stripped.
+        cfg_select! {
+            all() => {
+                fn pick() -> u32 {
+                    1
+                }
+            }
+            _ => {
+                fn pick() -> u32 {
+                    2
+                }
+            }
+        }
+        assert_eq!(pick(), 1);
+    }
+
+    #[test]
+    fn item_fallback_when_false() {
+        // Item position: the only predicate is false, so the `_` fallback supplies the item.
+        cfg_select! {
+            any() => {
+                fn pick() -> u32 {
+                    1
+                }
+            }
+            _ => {
+                fn pick() -> u32 {
+                    2
+                }
+            }
+        }
+        assert_eq!(pick(), 2);
+    }
+
+    #[test]
+    fn item_no_fallback_all_false_emits_nothing() {
+        // No `_` fallback and the sole predicate is false: the invocation must expand to nothing.
+        // If the false arm were wrongly emitted, the duplicate definition would fail to compile.
+        // Compiling at all shows the arm was dropped, and the assert confirms the surviving `pick`
+        // is this outer one.
+        fn pick() -> u32 {
+            5
+        }
+        cfg_select! {
+            any() => {
+                fn pick() -> u32 {
+                    1
+                }
+            }
+        }
+        assert_eq!(pick(), 5);
+    }
+
+    #[test]
+    fn stmt_true_arm_selected() {
+        // Statement position: the `v = 10` assignment is a `#[cfg(all())]`-gated statement, proving
+        // the true arm's statements run. `let v;` defers initialization so the single surviving
+        // assignment leaves no dead store.
+        let v;
+        cfg_select! {
+            all() => {
+                v = 10;
+            }
+            _ => {
+                v = 20;
+            }
+        }
+        assert_eq!(v, 10);
+    }
+
+    #[test]
+    fn stmt_fallback_when_false() {
+        // Statement position with the predicate false: the `_` fallback statement is the one
+        // emitted.
+        let v;
+        cfg_select! {
+            any() => {
+                v = 1;
+            }
+            _ => {
+                v = 2;
+            }
+        }
+        assert_eq!(v, 2);
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9512af7156df..cdcbb34047c0 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -51,6 +51,7 @@
 pub mod block;
 pub mod bug;
 pub mod build_assert;
+pub mod cfg;
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index ca396f1f78a6..c7d5439da28e 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -91,6 +91,7 @@
         const_assert,
         static_assert, //
     },
+    cfg_select,
     current,
     dev_alert,
     dev_crit,

-- 
2.54.0

