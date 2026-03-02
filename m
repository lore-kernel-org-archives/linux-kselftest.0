Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0849229BD8C;
	Mon,  2 Mar 2026 17:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772472039; cv=none; b=GQuMYOraJLW2tKUe8TY6sR2jzXTysq/QEeVQl/7zswdttRK5RZEwSVTgXA4Y4IhQxVCKKdZ3uQzfuBdqIRDtglpm3QoyechFa4TxcHk6cd1sB9IaqJ+uYfOO+s7Qu8DckbQImqwhxSZj9IMXdabAFHN+jHE51jS5Dh30D0DjJlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772472039; c=relaxed/simple;
	bh=G0tbNLTu0S+3NlNqEOJKZh3E1i+PNvPaCT+xkj3RuA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ik/iKBdgQayC56G64iPtsqaLh8ZoKWpRzTTQFgIQukVnt5YPbM99Lt2AQlZO31Ad2r8fyq510eaAHBIjvgNdFkQ7VSnrrbm+yY14+3DOu+mCaLHN5GVzGMciSBEZv3CLHjMsJ9YtHGMhypDwsq8R2pdx0wEpqunttUV2FarLwyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4TZfXyi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4TZfXyi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84477C19423;
	Mon,  2 Mar 2026 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772472038;
	bh=G0tbNLTu0S+3NlNqEOJKZh3E1i+PNvPaCT+xkj3RuA4=;
	h=From:Date:Subject:To:Cc:From;
	b=P4TZfXyiPbOZRK39v1oQOIZyHQghPqrj4G84BeHW7Uk181NPqVbeyqDkhmdINCL81
	 qNAQXSTfe/ID4vpXl3jTEKy3rN/ZLpSVjUedezyuB1riG6mtQxqlsGHqDioPMPh74d
	 Yqj2OjRsxKxDkuJqnBhPc7LBZtundWOmDQpyC2oU8jsIadjeAblMH7FAZ8Po9qe3JI
	 eiTMVrwOPiPg5Nu8jZyRH3myP0rL9/Qdgjd1qMNv0i9F+cLZoaG80z1ZLDUS30wDfJ
	 v4LcLiTDo6XpU4REgwHP+HjJ9HcuCz3Efpo9aaWoAniP/BiD3rEuby+kXszwkQMyEt
	 6rR8WIMtcJGYw==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 02 Mar 2026 12:20:35 -0500
Subject: [PATCH] rust: rename `kernel::c_str!` to `str_to_cstr!`
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-cstr-rename-macro-v1-1-a269fe4dc3f0@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCQAxG4auUrA1MpzJQryIupumvRuhUklaE0
 rs76vJbvLeRwxROp2Yjw0td51LRHhqSey43sI7VFENMoQuRxRdjQ8kTeMpiM6djDO2AJH3qqXZ
 Pw1Xfv+f58revwwOyfEe07x/+7+gTdQAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7334; i=tamird@kernel.org;
 h=from:subject:message-id; bh=G0tbNLTu0S+3NlNqEOJKZh3E1i+PNvPaCT+xkj3RuA4=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlLjz0pTNdQj0zSYhfhuf+h1Gxx3t7Z735LXXNaeIl1p
 /iH753JHaUsDGJcDLJiiiyJoof2pqfe3iOb+e44zBxWJpAhDFycAjCRjAaG/5Xx5/ZrBC9Mm/7H
 rPeWnbgvZ/mvs23iXVO2VS6ZpveEo4vhf6qpiEiMqJqMa0mizoKsB7nxc4RLFcqf3XtWHfZv1Wl
 jdgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Now that all literals are C-Strings, rename and update the documentation
of this macro to clarify its intended purpose.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
This patch completes the work of replacing our custom `CStr` with
upstream's.
---
 rust/kernel/bug.rs              |  2 +-
 rust/kernel/configfs.rs         |  2 +-
 rust/kernel/drm/ioctl.rs        |  2 +-
 rust/kernel/kunit.rs            |  3 ++-
 rust/kernel/str.rs              | 19 ++++++++++++++-----
 rust/kernel/sync.rs             |  4 ++--
 rust/kernel/sync/lock/global.rs |  3 ++-
 rust/kernel/workqueue.rs        |  6 +++---
 8 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index ed943960f851..f7cb673b1766 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -80,7 +80,7 @@ macro_rules! warn_flags {
         // with a valid null-terminated string.
         unsafe {
             $crate::bindings::warn_slowpath_fmt(
-                $crate::c_str!(::core::file!()).as_char_ptr(),
+                $crate::str_to_cstr!(::core::file!()).as_char_ptr(),
                 line!() as $crate::ffi::c_int,
                 $flags as $crate::ffi::c_uint,
                 ::core::ptr::null(),
diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 2339c6467325..930f17bb2041 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -1000,7 +1000,7 @@ macro_rules! configfs_attrs {
                         $crate::configfs::Attribute<$attr, $data, $data> =
                             unsafe {
                                 $crate::configfs::Attribute::new(
-                                    $crate::c_str!(::core::stringify!($name)),
+                                    $crate::str_to_cstr!(::core::stringify!($name)),
                                 )
                             };
                 )*
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index cf328101dde4..6a87f489dc88 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -157,7 +157,7 @@ macro_rules! declare_drm_ioctls {
                     },
                     flags: $flags,
                     name: $crate::str::as_char_ptr_in_const_context(
-                        $crate::c_str!(::core::stringify!($cmd)),
+                        $crate::str_to_cstr!(::core::stringify!($cmd)),
                     ),
                 }
             ),*];
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index f93f24a60bdd..5802a3507ecc 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -59,7 +59,8 @@ macro_rules! kunit_assert {
 
             static FILE: &'static $crate::str::CStr = $file;
             static LINE: i32 = ::core::line!() as i32 - $diff;
-            static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
+            static CONDITION: &'static $crate::str::CStr =
+                $crate::str_to_cstr!(stringify!($condition));
 
             // SAFETY: FFI call without safety requirements.
             let kunit_test = unsafe { $crate::bindings::kunit_get_current_test() };
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index fa87779d2253..8bb40de007d4 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -376,19 +376,28 @@ fn as_ref(&self) -> &BStr {
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
-/// # use kernel::c_str;
+/// # use kernel::str_to_cstr;
 /// # use kernel::str::CStr;
-/// const MY_CSTR: &CStr = c_str!("My awesome CStr!");
+/// const MY_CSTR: &CStr = str_to_cstr!(concat!(file!(), ":", line!(), ": My CStr!"));
 /// ```
 #[macro_export]
-macro_rules! c_str {
+macro_rules! str_to_cstr {
+    // NB: we could write `($str:lit) => compile_error!("use a C string literal instead");` here but
+    // that would trigger when the literal is at the top of several macro expansions. That would be
+    // too limiting to macro authors, so we rely on the name as a hint instead.
     ($str:expr) => {{
         const S: &str = concat!($str, "\0");
         const C: &$crate::str::CStr = match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 993dbf2caa0e..ecf02a67ec35 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -154,9 +154,9 @@ macro_rules! static_lock_class {
 #[macro_export]
 macro_rules! optional_name {
     () => {
-        $crate::c_str!(::core::concat!(::core::file!(), ":", ::core::line!()))
+        $crate::str_to_cstr!(::core::concat!(::core::file!(), ":", ::core::line!()))
     };
     ($name:literal) => {
-        $crate::c_str!($name)
+        $crate::str_to_cstr!($name)
     };
 }
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index aecbdc34738f..81f46229be7d 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -272,7 +272,8 @@ macro_rules! global_lock {
         $pub enum $name {}
 
         impl $crate::sync::lock::GlobalLockBackend for $name {
-            const NAME: &'static $crate::str::CStr = $crate::c_str!(::core::stringify!($name));
+            const NAME: &'static $crate::str::CStr =
+                $crate::str_to_cstr!(::core::stringify!($name));
             type Item = $valuety;
             type Backend = $crate::global_lock_inner!(backend $kind);
 
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 706e833e9702..7616d71df68e 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -212,7 +212,7 @@ macro_rules! new_delayed_work {
         $crate::workqueue::DelayedWork::new(
             $crate::optional_name!(),
             $crate::static_lock_class!(),
-            $crate::c_str!(::core::concat!(
+            $crate::str_to_cstr!(::core::concat!(
                 ::core::file!(),
                 ":",
                 ::core::line!(),
@@ -223,9 +223,9 @@ macro_rules! new_delayed_work {
     };
     ($name:literal) => {
         $crate::workqueue::DelayedWork::new(
-            $crate::c_str!($name),
+            $crate::str_to_cstr!($name),
             $crate::static_lock_class!(),
-            $crate::c_str!(::core::concat!($name, "_timer")),
+            $crate::str_to_cstr!(::core::concat!($name, "_timer")),
             $crate::static_lock_class!(),
         )
     };

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260302-cstr-rename-macro-64201be6c969

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

