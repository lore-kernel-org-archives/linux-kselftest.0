Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C30F379C2C
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 03:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782705141; cv=none; b=npxWaGqckuUpfwXaCn9JNqMDTyRGXrjxVUPQnOu17bzZlRFDIJ1NGalms4vbabq66srtGmv2KcaLsvbBU7ZHxTslpm6Wuw26cQc9eZ62yv+zGwq5QxJGMsZHigNXvq3WG47dr2UCFCcA8tn9jjV67Xo4ZAa9sYeY5RBGyMVa8TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782705141; c=relaxed/simple;
	bh=rLImL6TcDUIMjJjIGfo3y8BFVCKFL5prgcC+p/ww62A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Myf+L9qc4LbhpIa2OeXre3aJdF0WOlJXntkqGSCozbeS/9olM7cYFFXymH/3Ducj2PuJ+AfP7++UnC/jWufESKBCLmgD4jcUHkdIGY5W7X/cgX5Ur06E89+FUr8WZ+mq/FVqInY08mktySaYX5Pj5dS/g6z0KFT+EAfFV5oxrU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe; spf=pass smtp.mailfrom=nikableh.moe; dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b=FjBWXfhJ; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=e43reqCI; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b="FjBWXfhJ";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="e43reqCI"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=FjBWXfhJ+Io2iILmfeCMA5SRPBtKfWq1tyBttK09Fj0bRe+ZxrTLORrqaacCpFWTwwLvn+z4Snc5H3JfSoPw+mULvxpPOWxsoifUupRNzQ2OtcdfDDccdzMWYngkTMNEiQLrLxvLLLc5h+agADr5bsbxwDKGsWBEM6JIEMpQjyTmPXsylI8pSpoeQSYln1+gCDSCbcI5xwXeKcWgAsHntlxPJFRlRFKHI/6qjK277OZSZ9qrellozpb0YsFam1cQK8vz7zSOlSg65LX/vegoZFoJfMtroSm+jUqgspBhppmYNR1CP4uvBFLZys04Lsl1ah90H0JpTff7WYH5QiSk3Q==; s=purelymail2; d=nikableh.moe; v=1; bh=rLImL6TcDUIMjJjIGfo3y8BFVCKFL5prgcC+p/ww62A=; h=Received:From:Date:Subject:To;
DKIM-Signature: a=rsa-sha256; b=e43reqCIAr6A1C9Bs+1ga1ebp89LFqqWkxHsRFsXnS6Il3Ls3Fce3Tzxrko2MCs0nG1UCWjIOUaSDeiWMDN4I4rwvpgz7wLTeof6IUEl6gdZcYH+pqlXZtPPCsoJ25gjJ5LzAbLLhc95dOVGJOQYm3Z1zWeD5B01d5XVXgpNz73IQV5/3vlrCjsA4dGLcj1AsCt8qZT3h0rpEMNt0E4PGyVRbmx8lfEdw7yzc42drUsrcYy1odnNI00huns9FrVV27hHDbqW2Ij9NLlFobF5VEbdc/MrZDaBEbv0nkp7d38WwhbGTqgvy8zIkgxLCD7+yDjtSz/3wnJICgVBpFDo5g==; s=purelymail2; d=purelymail.com; v=1; bh=rLImL6TcDUIMjJjIGfo3y8BFVCKFL5prgcC+p/ww62A=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 209604:18551:null:purelymail
X-Pm-Original-To: linux-kselftest@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1530718721;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 29 Jun 2026 03:51:44 +0000 (UTC)
From: Nika Krasnova <nika@nikableh.moe>
Date: Mon, 29 Jun 2026 05:51:07 +0200
Subject: [PATCH 2/2] rust: kernel: migrate to cfg_select! for config-based
 selection
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-backport-cfg_select-v1-2-388d5d31d9d4@nikableh.moe>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=34735; i=nika@nikableh.moe;
 h=from:subject:message-id; bh=rLImL6TcDUIMjJjIGfo3y8BFVCKFL5prgcC+p/ww62A=;
 b=owJ4nJvAy8zAJTZhNXuihihnHuNptSSGLMfXhyY8vx7dJCh2ta3B2s/C8mLcA3tlTq2S/v78k
 ++b7c5nHe4oZWEQ42KQFVNkKUvTCqls+37Jx3R5PswcViaQIQxcnAIwkVvsjAyPM8R3nnoTepaX
 V9Ps+bJz+14U79zw4+v0Tb2eexx2fl6dx/DfY/7Ufsfc7NccMQ/aC2NlHPbfmPvq0f+1vtz5fnt
 tb3lyAwC8oklL
X-Developer-Key: i=nika@nikableh.moe; a=openpgp;
 fpr=D6F05A682D63EA3D6C771A8F4448A49D9CF79732

Convert the paired #[cfg(CONFIG_FOO)] / #[cfg(not(CONFIG_FOO))]
selections in the kernel crate to cfg_select!. These sites each choose
one of several mutually-exclusive implementations, which is exactly what
cfg_select! expresses as a single construct.

One case is deliberately left as #[cfg]: a #[macro_export] macro_rules!
that is referred to by an absolute path ($crate::/crate::) cannot be
wrapped in cfg_select!, because a macro produced by macro expansion may
not be named that way (see rust-lang/rust#52234). print_macro in
print.rs hits this and is kept as paired #[cfg]; macros invoked only by
their bare name, such as the asm! wrapper in lib.rs, are unaffected and
are converted.

Link: https://github.com/Rust-for-Linux/linux/issues/1183
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nika Krasnova <nika@nikableh.moe>
---
 rust/kernel/cpu.rs                   |  21 ++---
 rust/kernel/cpumask.rs               |  42 +++++-----
 rust/kernel/debugfs.rs               | 145 ++++++++++++++++++-----------------
 rust/kernel/driver.rs                |  44 ++++++-----
 rust/kernel/drm/device.rs            |  53 +++++++------
 rust/kernel/error.rs                 |  47 ++++++------
 rust/kernel/kunit.rs                 |  54 +++++++------
 rust/kernel/lib.rs                   |  77 ++++++++++---------
 rust/kernel/mm.rs                    |  36 +++++----
 rust/kernel/sync/atomic.rs           |  54 +++++++------
 rust/kernel/sync/atomic/predefine.rs |  35 +++++----
 rust/kernel/time.rs                  |  82 ++++++++++----------
 12 files changed, 366 insertions(+), 324 deletions(-)

diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
index cb6c0338ef5a..b6730331fda8 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -4,20 +4,21 @@
 //!
 //! C header: [`include/linux/cpu.h`](srctree/include/linux/cpu.h)
 
-use crate::{bindings, device::Device, error::Result, prelude::ENODEV};
+use crate::{bindings, cfg_select, device::Device, error::Result, prelude::ENODEV};
 
 /// Returns the maximum number of possible CPUs in the current system configuration.
 #[inline]
 pub fn nr_cpu_ids() -> u32 {
-    #[cfg(any(NR_CPUS_1, CONFIG_FORCE_NR_CPUS))]
-    {
-        bindings::NR_CPUS
-    }
-
-    #[cfg(not(any(NR_CPUS_1, CONFIG_FORCE_NR_CPUS)))]
-    // SAFETY: `nr_cpu_ids` is a valid global provided by the kernel.
-    unsafe {
-        bindings::nr_cpu_ids
+    cfg_select! {
+        any(NR_CPUS_1, CONFIG_FORCE_NR_CPUS) => {
+            bindings::NR_CPUS
+        }
+        _ => {
+            // SAFETY: `nr_cpu_ids` is a valid global provided by the kernel.
+            unsafe {
+                bindings::nr_cpu_ids
+            }
+        }
     }
 }
 
diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
index 44bb36636ee3..f86ec96acfe2 100644
--- a/rust/kernel/cpumask.rs
+++ b/rust/kernel/cpumask.rs
@@ -307,28 +307,34 @@ pub fn try_clone(cpumask: &Cpumask) -> Result<Self> {
 impl Deref for CpumaskVar {
     type Target = Cpumask;
 
-    #[cfg(CONFIG_CPUMASK_OFFSTACK)]
-    fn deref(&self) -> &Self::Target {
-        // SAFETY: The caller owns CpumaskVar, so it is safe to deref the cpumask.
-        unsafe { &*self.ptr.as_ptr() }
-    }
-
-    #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
-    fn deref(&self) -> &Self::Target {
-        &self.mask
+    cfg_select! {
+        CONFIG_CPUMASK_OFFSTACK => {
+            fn deref(&self) -> &Self::Target {
+                // SAFETY: The caller owns CpumaskVar, so it is safe to deref the cpumask.
+                unsafe { &*self.ptr.as_ptr() }
+            }
+        }
+        _ => {
+            fn deref(&self) -> &Self::Target {
+                &self.mask
+            }
+        }
     }
 }
 
 impl DerefMut for CpumaskVar {
-    #[cfg(CONFIG_CPUMASK_OFFSTACK)]
-    fn deref_mut(&mut self) -> &mut Cpumask {
-        // SAFETY: The caller owns CpumaskVar, so it is safe to deref the cpumask.
-        unsafe { self.ptr.as_mut() }
-    }
-
-    #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
-    fn deref_mut(&mut self) -> &mut Cpumask {
-        &mut self.mask
+    cfg_select! {
+        CONFIG_CPUMASK_OFFSTACK => {
+            fn deref_mut(&mut self) -> &mut Cpumask {
+                // SAFETY: The caller owns CpumaskVar, so it is safe to deref the cpumask.
+                unsafe { self.ptr.as_mut() }
+            }
+        }
+        _ => {
+            fn deref_mut(&mut self) -> &mut Cpumask {
+                &mut self.mask
+            }
+        }
     }
 }
 
diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index d7b8014a6474..39657bfd1714 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -75,22 +75,22 @@
 impl Dir {
     /// Create a new directory in DebugFS. If `parent` is [`None`], it will be created at the root.
     fn create(name: &CStr, parent: Option<&Dir>) -> Self {
-        #[cfg(CONFIG_DEBUG_FS)]
-        {
-            let parent_entry = match parent {
-                // If the parent couldn't be allocated, just early-return
-                Some(Dir(None)) => return Self(None),
-                Some(Dir(Some(entry))) => Some(entry.clone()),
-                None => None,
-            };
-            Self(
-                // If Arc creation fails, the `Entry` will be dropped, so the directory will be
-                // cleaned up.
-                Arc::new(Entry::dynamic_dir(name, parent_entry), GFP_KERNEL).ok(),
-            )
+        cfg_select! {
+            CONFIG_DEBUG_FS => {
+                let parent_entry = match parent {
+                    // If the parent couldn't be allocated, just early-return
+                    Some(Dir(None)) => return Self(None),
+                    Some(Dir(Some(entry))) => Some(entry.clone()),
+                    None => None,
+                };
+                Self(
+                    // If Arc creation fails, the `Entry` will be dropped, so the directory will be
+                    // cleaned up.
+                    Arc::new(Entry::dynamic_dir(name, parent_entry), GFP_KERNEL).ok(),
+                )
+            }
+            _ => { Self() }
         }
-        #[cfg(not(CONFIG_DEBUG_FS))]
-        Self()
     }
 
     /// Creates a DebugFS file which will own the data produced by the initializer provided in
@@ -360,19 +360,19 @@ pub fn write_callback_file<'a, T, E: 'a, W>(
     // Unless you also extract the `entry` later and schedule it for `Drop` at the appropriate
     // time, a `ScopedDir` with a `Dir` parent will never be deleted.
     fn scoped_dir<'data>(&self, name: &CStr) -> ScopedDir<'data, 'static> {
-        #[cfg(CONFIG_DEBUG_FS)]
-        {
-            let parent_entry = match &self.0 {
-                None => return ScopedDir::empty(),
-                Some(entry) => entry.clone(),
-            };
-            ScopedDir {
-                entry: ManuallyDrop::new(Entry::dynamic_dir(name, Some(parent_entry))),
-                _phantom: PhantomData,
+        cfg_select! {
+            CONFIG_DEBUG_FS => {
+                let parent_entry = match &self.0 {
+                    None => return ScopedDir::empty(),
+                    Some(entry) => entry.clone(),
+                };
+                ScopedDir {
+                    entry: ManuallyDrop::new(Entry::dynamic_dir(name, Some(parent_entry))),
+                    _phantom: PhantomData,
+                }
             }
+            _ => { ScopedDir::empty() }
         }
-        #[cfg(not(CONFIG_DEBUG_FS))]
-        ScopedDir::empty()
     }
 
     /// Creates a new scope, which is a directory associated with some data `T`.
@@ -430,47 +430,50 @@ pub struct File<T> {
     scope: Scope<T>,
 }
 
-#[cfg(not(CONFIG_DEBUG_FS))]
-impl<'b, T: 'b> Scope<T> {
-    fn new<E: 'b, F>(data: impl PinInit<T, E> + 'b, init: F) -> impl PinInit<Self, E> + 'b
-    where
-        F: for<'a> FnOnce(&'a T) + 'b,
-    {
-        try_pin_init! {
-            Self {
-                data <- data,
-                _pin: PhantomPinned
-            } ? E
-        }
-        .pin_chain(|scope| {
-            init(&scope.data);
-            Ok(())
-        })
-    }
-}
+cfg_select! {
+    CONFIG_DEBUG_FS => {
+        impl<'b, T: 'b> Scope<T> {
+            fn entry_mut(self: Pin<&mut Self>) -> &mut Entry<'static> {
+                // SAFETY: _entry is not structurally pinned.
+                unsafe { &mut Pin::into_inner_unchecked(self)._entry }
+            }
 
-#[cfg(CONFIG_DEBUG_FS)]
-impl<'b, T: 'b> Scope<T> {
-    fn entry_mut(self: Pin<&mut Self>) -> &mut Entry<'static> {
-        // SAFETY: _entry is not structurally pinned.
-        unsafe { &mut Pin::into_inner_unchecked(self)._entry }
+            fn new<E: 'b, F>(data: impl PinInit<T, E> + 'b, init: F) -> impl PinInit<Self, E> + 'b
+            where
+                F: for<'a> FnOnce(&'a T) -> Entry<'static> + 'b,
+            {
+                try_pin_init! {
+                    Self {
+                        _entry: Entry::empty(),
+                        data <- data,
+                        _pin: PhantomPinned
+                    } ? E
+                }
+                .pin_chain(|scope| {
+                    *scope.entry_mut() = init(&scope.data);
+                    Ok(())
+                })
+            }
+        }
     }
-
-    fn new<E: 'b, F>(data: impl PinInit<T, E> + 'b, init: F) -> impl PinInit<Self, E> + 'b
-    where
-        F: for<'a> FnOnce(&'a T) -> Entry<'static> + 'b,
-    {
-        try_pin_init! {
-            Self {
-                _entry: Entry::empty(),
-                data <- data,
-                _pin: PhantomPinned
-            } ? E
+    _ => {
+        impl<'b, T: 'b> Scope<T> {
+            fn new<E: 'b, F>(data: impl PinInit<T, E> + 'b, init: F) -> impl PinInit<Self, E> + 'b
+            where
+                F: for<'a> FnOnce(&'a T) + 'b,
+            {
+                try_pin_init! {
+                    Self {
+                        data <- data,
+                        _pin: PhantomPinned
+                    } ? E
+                }
+                .pin_chain(|scope| {
+                    init(&scope.data);
+                    Ok(())
+                })
+            }
         }
-        .pin_chain(|scope| {
-            *scope.entry_mut() = init(&scope.data);
-            Ok(())
-        })
     }
 }
 
@@ -702,12 +705,16 @@ fn empty() -> Self {
             _phantom: PhantomData,
         }
     }
-    #[cfg(CONFIG_DEBUG_FS)]
-    fn into_entry(self) -> Entry<'dir> {
-        ManuallyDrop::into_inner(self.entry)
+    cfg_select! {
+        CONFIG_DEBUG_FS => {
+            fn into_entry(self) -> Entry<'dir> {
+                ManuallyDrop::into_inner(self.entry)
+            }
+        }
+        _ => {
+            fn into_entry(self) {}
+        }
     }
-    #[cfg(not(CONFIG_DEBUG_FS))]
-    fn into_entry(self) {}
 }
 
 impl<'data> ScopedDir<'data, 'static> {
diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index bf5ba0d27553..871ea9e04804 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -328,29 +328,31 @@ pub trait Adapter {
     ///
     /// If this returns `None`, it means there is no match with an entry in the [`acpi::IdTable`].
     fn acpi_id_info(dev: &device::Device) -> Option<&'static Self::IdInfo> {
-        #[cfg(not(CONFIG_ACPI))]
-        {
-            let _ = dev;
-            None
-        }
+        cfg_select! {
+            CONFIG_ACPI => {
+                let table = Self::acpi_id_table()?;
 
-        #[cfg(CONFIG_ACPI)]
-        {
-            let table = Self::acpi_id_table()?;
-
-            // SAFETY:
-            // - `table` has static lifetime, hence it's valid for read,
-            // - `dev` is guaranteed to be valid while it's alive, and so is `dev.as_raw()`.
-            let raw_id = unsafe { bindings::acpi_match_device(table.as_ptr(), dev.as_raw()) };
-
-            if raw_id.is_null() {
+                // SAFETY:
+                // - `table` has static lifetime, hence it's valid for read,
+                // - `dev` is guaranteed to be valid while it's alive, and so is `dev.as_raw()`.
+                let raw_id = unsafe { bindings::acpi_match_device(table.as_ptr(), dev.as_raw()) };
+
+                if raw_id.is_null() {
+                    None
+                } else {
+                    // SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of
+                    // `struct acpi_device_id` and does not add additional invariants, so
+                    // it's safe to transmute.
+                    let id = unsafe { &*raw_id.cast::<acpi::DeviceId>() };
+
+                    Some(table.info(
+                        <acpi::DeviceId as crate::device_id::RawDeviceIdIndex>::index(id),
+                    ))
+                }
+            }
+            _ => {
+                let _ = dev;
                 None
-            } else {
-                // SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of `struct acpi_device_id`
-                // and does not add additional invariants, so it's safe to transmute.
-                let id = unsafe { &*raw_id.cast::<acpi::DeviceId>() };
-
-                Some(table.info(<acpi::DeviceId as crate::device_id::RawDeviceIdIndex>::index(id)))
             }
         }
     }
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 477cf771fb10..61a184241d55 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -41,33 +41,36 @@
     },
 };
 
-#[cfg(CONFIG_DRM_LEGACY)]
-macro_rules! drm_legacy_fields {
-    ( $($field:ident: $val:expr),* $(,)? ) => {
-        bindings::drm_driver {
-            $( $field: $val ),*,
-            firstopen: None,
-            preclose: None,
-            dma_ioctl: None,
-            dma_quiescent: None,
-            context_dtor: None,
-            irq_handler: None,
-            irq_preinstall: None,
-            irq_postinstall: None,
-            irq_uninstall: None,
-            get_vblank_counter: None,
-            enable_vblank: None,
-            disable_vblank: None,
-            dev_priv_size: 0,
+cfg_select! {
+    CONFIG_DRM_LEGACY => {
+        macro_rules! drm_legacy_fields {
+            ( $($field:ident: $val:expr),* $(,)? ) => {
+                bindings::drm_driver {
+                    $( $field: $val ),*,
+                    firstopen: None,
+                    preclose: None,
+                    dma_ioctl: None,
+                    dma_quiescent: None,
+                    context_dtor: None,
+                    irq_handler: None,
+                    irq_preinstall: None,
+                    irq_postinstall: None,
+                    irq_uninstall: None,
+                    get_vblank_counter: None,
+                    enable_vblank: None,
+                    disable_vblank: None,
+                    dev_priv_size: 0,
+                }
+            }
         }
     }
-}
-
-#[cfg(not(CONFIG_DRM_LEGACY))]
-macro_rules! drm_legacy_fields {
-    ( $($field:ident: $val:expr),* $(,)? ) => {
-        bindings::drm_driver {
-            $( $field: $val ),*
+    _ => {
+        macro_rules! drm_legacy_fields {
+            ( $($field:ident: $val:expr),* $(,)? ) => {
+                bindings::drm_driver {
+                    $( $field: $val ),*
+                }
+            }
         }
     }
 }
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index a56ba6309594..733c2d08c5e6 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -8,7 +8,7 @@
 
 use crate::{
     alloc::{layout::LayoutError, AllocError},
-    fmt,
+    cfg_select, fmt,
     str::CStr,
 };
 
@@ -173,29 +173,32 @@ pub fn to_ptr<T>(self) -> *mut T {
         unsafe { bindings::ERR_PTR(self.0.get() as crate::ffi::c_long).cast() }
     }
 
-    /// Returns a string representing the error, if one exists.
-    #[cfg(not(testlib))]
-    pub fn name(&self) -> Option<&'static CStr> {
-        // SAFETY: Just an FFI call, there are no extra safety requirements.
-        let ptr = unsafe { bindings::errname(-self.0.get()) };
-        if ptr.is_null() {
-            None
-        } else {
-            use crate::str::CStrExt as _;
-
-            // SAFETY: The string returned by `errname` is static and `NUL`-terminated.
-            Some(unsafe { CStr::from_char_ptr(ptr) })
+    cfg_select! {
+        testlib => {
+            /// Returns a string representing the error, if one exists.
+            ///
+            /// When `testlib` is configured, this always returns `None` to avoid
+            /// the dependency on a kernel function so that tests that use this
+            /// (e.g., by calling [`Result::unwrap`]) can still run in userspace.
+            pub fn name(&self) -> Option<&'static CStr> {
+                None
+            }
         }
-    }
+        _ => {
+            /// Returns a string representing the error, if one exists.
+            pub fn name(&self) -> Option<&'static CStr> {
+                // SAFETY: Just an FFI call, there are no extra safety requirements.
+                let ptr = unsafe { bindings::errname(-self.0.get()) };
+                if ptr.is_null() {
+                    None
+                } else {
+                    use crate::str::CStrExt as _;
 
-    /// Returns a string representing the error, if one exists.
-    ///
-    /// When `testlib` is configured, this always returns `None` to avoid the dependency on a
-    /// kernel function so that tests that use this (e.g., by calling [`Result::unwrap`]) can still
-    /// run in userspace.
-    #[cfg(testlib)]
-    pub fn name(&self) -> Option<&'static CStr> {
-        None
+                    // SAFETY: The string returned by `errname` is static and `NUL`-terminated.
+                    Some(unsafe { CStr::from_char_ptr(ptr) })
+                }
+            }
+        }
     }
 }
 
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index cdee5f27bd7f..5ec15bfbfee6 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -14,18 +14,21 @@
 /// Public but hidden since it should only be used from KUnit generated code.
 #[doc(hidden)]
 pub fn err(args: fmt::Arguments<'_>) {
-    // `args` is unused if `CONFIG_PRINTK` is not set - this avoids a build-time warning.
-    #[cfg(not(CONFIG_PRINTK))]
-    let _ = args;
-
-    // SAFETY: The format string is null-terminated and the `%pA` specifier matches the argument we
-    // are passing.
-    #[cfg(CONFIG_PRINTK)]
-    unsafe {
-        bindings::_printk(
-            c"\x013%pA".as_char_ptr(),
-            core::ptr::from_ref(&args).cast::<c_void>(),
-        );
+    cfg_select! {
+        CONFIG_PRINTK => {
+            // SAFETY: The format string is null-terminated and the `%pA` specifier matches the
+            // argument we are passing.
+            unsafe {
+                bindings::_printk(
+                    c"\x013%pA".as_char_ptr(),
+                    core::ptr::from_ref(&args).cast::<c_void>(),
+                );
+            }
+        }
+        _ => {
+            // `args` is unused if `CONFIG_PRINTK` is not set - this avoids a build-time warning.
+            let _ = args;
+        }
     }
 }
 
@@ -34,18 +37,21 @@ pub fn err(args: fmt::Arguments<'_>) {
 /// Public but hidden since it should only be used from KUnit generated code.
 #[doc(hidden)]
 pub fn info(args: fmt::Arguments<'_>) {
-    // `args` is unused if `CONFIG_PRINTK` is not set - this avoids a build-time warning.
-    #[cfg(not(CONFIG_PRINTK))]
-    let _ = args;
-
-    // SAFETY: The format string is null-terminated and the `%pA` specifier matches the argument we
-    // are passing.
-    #[cfg(CONFIG_PRINTK)]
-    unsafe {
-        bindings::_printk(
-            c"\x016%pA".as_char_ptr(),
-            core::ptr::from_ref(&args).cast::<c_void>(),
-        );
+    cfg_select! {
+        CONFIG_PRINTK => {
+            // SAFETY: The format string is null-terminated and the `%pA` specifier matches the
+            // argument we are passing.
+            unsafe {
+                bindings::_printk(
+                    c"\x016%pA".as_char_ptr(),
+                    core::ptr::from_ref(&args).cast::<c_void>(),
+                );
+            }
+        }
+        _ => {
+            // `args` is unused if `CONFIG_PRINTK` is not set - this avoids a build-time warning.
+            let _ = args;
+        }
     }
 }
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index cdcbb34047c0..ba233a037fe6 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -276,30 +276,34 @@ macro_rules! concat_literals {
     };
 }
 
-/// Wrapper around `asm!` configured for use in the kernel.
-///
-/// Uses a semicolon to avoid parsing ambiguities, even though this does not match native `asm!`
-/// syntax.
-// For x86, `asm!` uses intel syntax by default, but we want to use at&t syntax in the kernel.
-#[cfg(any(target_arch = "x86", target_arch = "x86_64"))]
-#[macro_export]
-macro_rules! asm {
-    ($($asm:expr),* ; $($rest:tt)*) => {
-        ::core::arch::asm!( $($asm)*, options(att_syntax), $($rest)* )
-    };
-}
-
-/// Wrapper around `asm!` configured for use in the kernel.
-///
-/// Uses a semicolon to avoid parsing ambiguities, even though this does not match native `asm!`
-/// syntax.
-// For non-x86 arches we just pass through to `asm!`.
-#[cfg(not(any(target_arch = "x86", target_arch = "x86_64")))]
-#[macro_export]
-macro_rules! asm {
-    ($($asm:expr),* ; $($rest:tt)*) => {
-        ::core::arch::asm!( $($asm)*, $($rest)* )
-    };
+cfg_select! {
+    any(target_arch = "x86", target_arch = "x86_64") => {
+        /// Wrapper around `asm!` configured for use in the kernel.
+        ///
+        /// Uses a semicolon to avoid parsing ambiguities, even though this does
+        /// not match native `asm!` syntax.
+        // For x86, `asm!` uses intel syntax by default, but we want to use at&t
+        // syntax in the kernel.
+        #[macro_export]
+        macro_rules! asm {
+            ($($asm:expr),* ; $($rest:tt)*) => {
+                ::core::arch::asm!( $($asm)*, options(att_syntax), $($rest)* )
+            };
+        }
+    }
+    _ => {
+        /// Wrapper around `asm!` configured for use in the kernel.
+        ///
+        /// Uses a semicolon to avoid parsing ambiguities, even though this does
+        /// not match native `asm!` syntax.
+        // For non-x86 arches we just pass through to `asm!`.
+        #[macro_export]
+        macro_rules! asm {
+            ($($asm:expr),* ; $($rest:tt)*) => {
+                ::core::arch::asm!( $($asm)*, $($rest)* )
+            };
+        }
+    }
 }
 
 /// Gets the C string file name of a [`Location`].
@@ -334,19 +338,16 @@ macro_rules! asm {
 /// ```
 #[inline]
 pub fn file_from_location<'a>(loc: &'a core::panic::Location<'a>) -> &'a core::ffi::CStr {
-    #[cfg(CONFIG_RUSTC_HAS_FILE_AS_C_STR)]
-    {
-        loc.file_as_c_str()
-    }
-
-    #[cfg(all(CONFIG_RUSTC_HAS_FILE_WITH_NUL, not(CONFIG_RUSTC_HAS_FILE_AS_C_STR)))]
-    {
-        loc.file_with_nul()
-    }
-
-    #[cfg(not(CONFIG_RUSTC_HAS_FILE_WITH_NUL))]
-    {
-        let _ = loc;
-        c"<Location::file_as_c_str() not supported>"
+    cfg_select! {
+        CONFIG_RUSTC_HAS_FILE_AS_C_STR => {
+            loc.file_as_c_str()
+        }
+        all(CONFIG_RUSTC_HAS_FILE_WITH_NUL, not(CONFIG_RUSTC_HAS_FILE_AS_C_STR)) => {
+            loc.file_with_nul()
+        }
+        not(CONFIG_RUSTC_HAS_FILE_WITH_NUL) => {
+            let _ = loc;
+            c"<Location::file_as_c_str() not supported>"
+        }
     }
 }
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 4764d7b68f2a..b3937d37b3a2 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -12,7 +12,7 @@
 //! C header: [`include/linux/mm.h`](srctree/include/linux/mm.h)
 
 use crate::{
-    bindings,
+    bindings, cfg_select,
     sync::aref::{ARef, AlwaysRefCounted},
     types::{NotThreadSafe, Opaque},
 };
@@ -174,25 +174,27 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
     /// When per-vma locks are disabled, this always returns `None`.
     #[inline]
     pub fn lock_vma_under_rcu(&self, vma_addr: usize) -> Option<VmaReadGuard<'_>> {
-        #[cfg(CONFIG_PER_VMA_LOCK)]
-        {
-            // SAFETY: Calling `bindings::lock_vma_under_rcu` is always okay given an mm where
-            // `mm_users` is non-zero.
-            let vma = unsafe { bindings::lock_vma_under_rcu(self.as_raw(), vma_addr) };
-            if !vma.is_null() {
-                return Some(VmaReadGuard {
-                    // SAFETY: If `lock_vma_under_rcu` returns a non-null ptr, then it points at a
-                    // valid vma. The vma is stable for as long as the vma read lock is held.
-                    vma: unsafe { VmaRef::from_raw(vma) },
-                    _nts: NotThreadSafe,
-                });
+        cfg_select! {
+            CONFIG_PER_VMA_LOCK => {
+                // SAFETY: Calling `bindings::lock_vma_under_rcu` is always okay given an mm where
+                // `mm_users` is non-zero.
+                let vma = unsafe { bindings::lock_vma_under_rcu(self.as_raw(), vma_addr) };
+                if !vma.is_null() {
+                    return Some(VmaReadGuard {
+                        // SAFETY: If `lock_vma_under_rcu` returns a non-null ptr, then it
+                        // points at a valid vma. The vma is stable for as long as the vma
+                        // read lock is held.
+                        vma: unsafe { VmaRef::from_raw(vma) },
+                        _nts: NotThreadSafe,
+                    });
+                }
+            }
+            _ => {
+                // Silence warnings about unused variables.
+                let _ = vma_addr;
             }
         }
 
-        // Silence warnings about unused variables.
-        #[cfg(not(CONFIG_PER_VMA_LOCK))]
-        let _ = vma_addr;
-
         None
     }
 
diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 9cd009d57e35..d67dc44e8b2e 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -26,6 +26,7 @@
 pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
 
 use crate::build_error;
+use crate::cfg_select;
 use internal::AtomicRepr;
 use ordering::OrderingType;
 
@@ -620,25 +621,28 @@ pub fn fetch_sub<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
     }
 }
 
-#[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
-#[repr(C)]
-#[derive(Clone, Copy)]
-struct Flag {
-    bool_field: bool,
-}
-
-/// # Invariants
-///
-/// `padding` must be all zeroes.
-#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
-#[repr(C, align(4))]
-#[derive(Clone, Copy)]
-struct Flag {
-    #[cfg(target_endian = "big")]
-    padding: [u8; 3],
-    bool_field: bool,
-    #[cfg(target_endian = "little")]
-    padding: [u8; 3],
+cfg_select! {
+    any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64) => {
+        #[repr(C)]
+        #[derive(Clone, Copy)]
+        struct Flag {
+            bool_field: bool,
+        }
+    }
+    _ => {
+        /// # Invariants
+        ///
+        /// `padding` must be all zeroes.
+        #[repr(C, align(4))]
+        #[derive(Clone, Copy)]
+        struct Flag {
+            #[cfg(target_endian = "big")]
+            padding: [u8; 3],
+            bool_field: bool,
+            #[cfg(target_endian = "little")]
+            padding: [u8; 3],
+        }
+    }
 }
 
 impl Flag {
@@ -656,10 +660,14 @@ const fn new(b: bool) -> Self {
 // SAFETY: `Flag` and `Repr` have the same size and alignment, and `Flag` is round-trip
 // transmutable to the selected representation (`i8` or `i32`).
 unsafe impl AtomicType for Flag {
-    #[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
-    type Repr = i8;
-    #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
-    type Repr = i32;
+    cfg_select! {
+        any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64) => {
+            type Repr = i8;
+        }
+        _ => {
+            type Repr = i32;
+        }
+    }
 }
 
 /// An atomic flag type intended to be backed by performance-optimal integer type.
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 3d63f40791fa..7156e9b67c8c 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -76,23 +76,24 @@ fn rhs_into_delta(rhs: i64) -> i64 {
 // Defines an internal type that always maps to the integer type which has the same size alignment
 // as `isize` and `usize`, and `isize` and `usize` are always bi-directional transmutable to
 // `isize_atomic_repr`, which also always implements `AtomicImpl`.
-#[allow(non_camel_case_types)]
-#[cfg(not(testlib))]
-#[cfg(not(CONFIG_64BIT))]
-type isize_atomic_repr = i32;
-#[allow(non_camel_case_types)]
-#[cfg(not(testlib))]
-#[cfg(CONFIG_64BIT)]
-type isize_atomic_repr = i64;
-
-#[allow(non_camel_case_types)]
-#[cfg(testlib)]
-#[cfg(target_pointer_width = "32")]
-type isize_atomic_repr = i32;
-#[allow(non_camel_case_types)]
-#[cfg(testlib)]
-#[cfg(target_pointer_width = "64")]
-type isize_atomic_repr = i64;
+cfg_select! {
+    all(not(testlib), not(CONFIG_64BIT)) => {
+        #[allow(non_camel_case_types)]
+        type isize_atomic_repr = i32;
+    }
+    all(not(testlib), CONFIG_64BIT) => {
+        #[allow(non_camel_case_types)]
+        type isize_atomic_repr = i64;
+    }
+    all(testlib, target_pointer_width = "32") => {
+        #[allow(non_camel_case_types)]
+        type isize_atomic_repr = i32;
+    }
+    all(testlib, target_pointer_width = "64") => {
+        #[allow(non_camel_case_types)]
+        type isize_atomic_repr = i64;
+    }
+}
 
 // Ensure size and alignment requirements are checked.
 static_assert!(size_of::<isize>() == size_of::<isize_atomic_repr>());
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 363e93cbb139..5cca5b9d111e 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -27,6 +27,8 @@
 use core::marker::PhantomData;
 use core::ops;
 
+use crate::cfg_select;
+
 pub mod delay;
 pub mod hrtimer;
 
@@ -360,15 +362,14 @@ impl ops::Div for Delta {
 
     #[inline]
     fn div(self, rhs: Self) -> Self::Output {
-        #[cfg(CONFIG_64BIT)]
-        {
-            self.nanos / rhs.nanos
-        }
-
-        #[cfg(not(CONFIG_64BIT))]
-        {
-            // SAFETY: This function is always safe to call regardless of the input values
-            unsafe { bindings::div64_s64(self.nanos, rhs.nanos) }
+        cfg_select! {
+            CONFIG_64BIT => {
+                self.nanos / rhs.nanos
+            }
+            _ => {
+                // SAFETY: This function is always safe to call regardless of the input values
+                unsafe { bindings::div64_s64(self.nanos, rhs.nanos) }
+            }
         }
     }
 }
@@ -441,30 +442,32 @@ pub const fn as_nanos(self) -> i64 {
     /// to the value in the [`Delta`].
     #[inline]
     pub fn as_micros_ceil(self) -> i64 {
-        #[cfg(CONFIG_64BIT)]
-        {
-            self.as_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
-        }
-
-        #[cfg(not(CONFIG_64BIT))]
-        // SAFETY: It is always safe to call `ktime_to_us()` with any value.
-        unsafe {
-            bindings::ktime_to_us(self.as_nanos().saturating_add(NSEC_PER_USEC - 1))
+        cfg_select! {
+            CONFIG_64BIT => {
+                self.as_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
+            }
+            _ => {
+                // SAFETY: It is always safe to call `ktime_to_us()` with any value.
+                unsafe {
+                    bindings::ktime_to_us(self.as_nanos().saturating_add(NSEC_PER_USEC - 1))
+                }
+            }
         }
     }
 
     /// Return the number of milliseconds in the [`Delta`].
     #[inline]
     pub fn as_millis(self) -> i64 {
-        #[cfg(CONFIG_64BIT)]
-        {
-            self.as_nanos() / NSEC_PER_MSEC
-        }
-
-        #[cfg(not(CONFIG_64BIT))]
-        // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
-        unsafe {
-            bindings::ktime_to_ms(self.as_nanos())
+        cfg_select! {
+            CONFIG_64BIT => {
+                self.as_nanos() / NSEC_PER_MSEC
+            }
+            _ => {
+                // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
+                unsafe {
+                    bindings::ktime_to_ms(self.as_nanos())
+                }
+            }
         }
     }
 
@@ -474,22 +477,21 @@ pub fn as_millis(self) -> i64 {
     /// limited to 32 bit dividends.
     #[inline]
     pub fn rem_nanos(self, dividend: i32) -> Self {
-        #[cfg(CONFIG_64BIT)]
-        {
-            Self {
-                nanos: self.as_nanos() % i64::from(dividend),
+        cfg_select! {
+            CONFIG_64BIT => {
+                Self {
+                    nanos: self.as_nanos() % i64::from(dividend),
+                }
             }
-        }
-
-        #[cfg(not(CONFIG_64BIT))]
-        {
-            let mut rem = 0;
+            _ => {
+                let mut rem = 0;
 
-            // SAFETY: `rem` is in the stack, so we can always provide a valid pointer to it.
-            unsafe { bindings::div_s64_rem(self.as_nanos(), dividend, &mut rem) };
+                // SAFETY: `rem` is in the stack, so we can always provide a valid pointer to it.
+                unsafe { bindings::div_s64_rem(self.as_nanos(), dividend, &mut rem) };
 
-            Self {
-                nanos: i64::from(rem),
+                Self {
+                    nanos: i64::from(rem),
+                }
             }
         }
     }

-- 
2.54.0

