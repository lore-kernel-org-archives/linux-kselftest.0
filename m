Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758F0313529;
	Fri, 13 Feb 2026 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770974650; cv=none; b=iSUj5OdJJhK/q4Zn6NUGqnKwb3IBgVvCaLZMRgvM8nT9erJTOouL0JaipJh3xiRnJ26uYR+Ths58UtX7+lmnEgbx7yRCXRfLmNhePmDg7zwr33RiAe+Eu1DVjS9FAWrxQWTfQ/ZoPUIub7770E6e758JoOqtzXzV8mFyp51BAFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770974650; c=relaxed/simple;
	bh=bjvszWc+PsJDxL0SP6iemb2kEO9lxVsZeFfud64kThc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i4sKYsWbCDJv2N32Ce6/6kSi0nPa+AjmSXSiU5640dcFpxJ+Cc8E6h5e5is8pc8IBT7v9lr9pyeCsVBrAE/HCFMRLu5fyRRMh1V1AZ9ziRQxYWJA5EwdexnWZcjKZLFwxGD/YxHLtIaURPugCO6ZxezXc3aqTflopLsh0ZkCNtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5/OnWtm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5/OnWtm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75670C2BC86;
	Fri, 13 Feb 2026 09:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770974650;
	bh=bjvszWc+PsJDxL0SP6iemb2kEO9lxVsZeFfud64kThc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u5/OnWtmTy4gxXK2vmHHOxMyVM/XH6Xmjlv+9Az/D5v9fnHWKwL1DOTRX4oqCvuYR
	 YAOkq7etbIYv1CWCUVdZmkLzV0lIxaL0n7sOOtjVWRNHvOt+XRHAFf9wt/xhs3fsM1
	 7qD9tHgRXh7Bwgo0w4Je+7W/Ckf1lZEx7Sk/FXWCmaAv4W95lK+HHGPMVJANMD3DoM
	 yjW3x2+bwDRVlGqz8d6wq2HM3aGudwryUnUxYybSYVWLRH6iDp5nbJgtSWudkfadsL
	 2No1qfuCTPosqnZVUHVTDQPLARhDH96jBpCkg0vLZdeOX8bsyj8gJRYd6in8Iah9kZ
	 8V/64CgxyJOjA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v8 1/3] revocable: Revocable resource management
Date: Fri, 13 Feb 2026 09:23:05 +0000
Message-ID: <20260213092307.858908-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
In-Reply-To: <20260213092307.858908-1-tzungbi@kernel.org>
References: <20260213092307.858908-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "revocable" mechanism is a synchronization primitive designed to
manage safe access to resources that can be asynchronously removed or
invalidated.  Its primary purpose is to prevent Use-After-Free (UAF)
errors when interacting with resources whose lifetimes are not
guaranteed to outlast their consumers.

This is particularly useful in systems where resources can disappear
unexpectedly, such as those provided by hot-pluggable devices like
USB.  When a consumer holds a reference to such a resource, the
underlying device might be removed, causing the resource's memory to
be freed.  Subsequent access attempts by the consumer would then lead
to UAF errors.

Revocable addresses this by providing a form of "weak reference" and
a controlled access method.  It allows a resource consumer to safely
attempt to access the resource.  The mechanism guarantees that any
access granted is valid for the duration of its use.  If the resource
has already been revoked (i.e., freed), the access attempt will fail
safely, typically by returning NULL, instead of causing a crash.

It uses a provider/consumer model built on Sleepable RCU (SRCU) to
guarantee safe memory access:

- A resource provider, such as a driver for a hot-pluggable device,
  allocates a struct revocable and initializes it with a pointer
  to the resource.

- A resource consumer that wants to access the resource allocates a
  struct revocable_consumer containing a reference to the provider.

- To access the resource, the consumer uses revocable_try_access().
  This function enters an SRCU read-side critical section and returns
  the pointer to the resource.  If the provider has already freed the
  resource, it returns NULL.  After use, the consumer calls
  revocable_withdraw_access() to exit the SRCU critical section.  There
  are some macro level helpers for doing that.

  The API provides the following contract:

  - revocable_try_access() can be safely called from both process and
    atomic contexts.
  - It is permitted to sleep within the critical section established
    between revocable_try_access() and revocable_withdraw_access().
  - revocable_try_access() and the matching revocable_withdraw_access()
    must occur in the same context.  For example, it is illegal to
    invoke revocable_withdraw_access() in an irq handler if the matching
    revocable_try_access() was invoked in process context.

- When the provider needs to remove the resource, it calls
  revocable_revoke().  This function sets the internal resource
  pointer to NULL and then calls synchronize_srcu() to wait for all
  current readers to finish before the resource can be completely torn
  down.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v8:
- Squash:
  - fdeb3ca3cca8 revocable: Remove redundant synchronize_srcu() call
  - 4d7dc4d1a62d revocable: Fix races in revocable_alloc() using RCU
  - 377563ce0653 revocable: fix SRCU index corruption by requiring caller-provided storage
- Rename macro names:
  - REVOCABLE_TRY_ACCESS_WITH() -> revocable_try_access_with().
  - REVOCABLE_TRY_ACCESS_SCOPED() -> revocable_try_access_with_scoped().
- Rename terminologies as now normal users should only "see" provider
  handles, using a shorter name for provider handle to echo the main
  concept.
  - struct revocable -> struct revocable_consumer.
  - struct revocable_provider -> struct revocable.
  - revocable_provider_alloc() -> revocable_alloc().
  - revocable_provider_revoke() -> revocable_revoke().
- New APIs:
  - revocable_get().
  - revocable_put().
  - revocable_try_access_or_return_err().
  - revocable_try_access_or_return().
  - revocable_try_access_or_return_void().
  - revocable_try_access_or_return_err_scoped().
  - revocable_try_access_or_return_scoped().
  - revocable_try_access_or_void_scoped().
  - revocable_try_access_or_skip_scoped().
- Add API contract that revocable_try_access() works from process and
  atomic context while also allowing sleeping inside the critical
  sections.
- Add revocable.h to the DRIVER CORE entry in MAINTAINERS.

v7: https://lore.kernel.org/all/20260116080235.350305-2-tzungbi@kernel.org
- "2025" -> "2026" in copyright.
- Documentation/
  - Rephrase section "Revocable vs. Devres (devm)".
  - Include sections for struct revocable_provider and struct revocable.
- Minor rename: "revocable" -> "access_rev" for DEFINE_FREE().
- Add Acked-by tag.

v6: https://lore.kernel.org/chrome-platform/20251106152330.11733-2-tzungbi@kernel.org
- Rename REVOCABLE_TRY_ACCESS_WITH() -> REVOCABLE_TRY_ACCESS_SCOPED().
- Add new REVOCABLE_TRY_ACCESS_WITH().
- Remove Acked-by tags as the API names changed a bit.

v5: https://lore.kernel.org/chrome-platform/20251016054204.1523139-2-tzungbi@kernel.org
- No changes.

v4: https://lore.kernel.org/chrome-platform/20250923075302.591026-2-tzungbi@kernel.org
- Rename:
  - revocable_provider_free() -> revocable_provider_revoke().
  - REVOCABLE() -> REVOCABLE_TRY_ACCESS_WITH().
  - revocable_release() -> revocable_withdraw_access().
- rcu_dereference() -> srcu_dereference() to fix a warning from lock debugging.
- Move most docs to kernel-doc, include them in Documentation/, and modify the
  commit message accordingly.
- Fix some doc errors.
- Add Acked-by tags.

v3: https://lore.kernel.org/chrome-platform/20250912081718.3827390-2-tzungbi@kernel.org
- No changes.

v2: https://lore.kernel.org/chrome-platform/20250820081645.847919-2-tzungbi@kernel.org
- Rename "ref_proxy" -> "revocable".
- Add introduction in kernel-doc format in revocable.c.
- Add MAINTAINERS entry.
- Add copyright.
- Move from lib/ to drivers/base/.
- EXPORT_SYMBOL() -> EXPORT_SYMBOL_GPL().
- Add Documentation/.
- Rename _get() -> try_access(); _put() -> release().
- Fix a sparse warning by removing the redundant __rcu annotations.
- Fix a sparse warning by adding __acquires() and __releases() annotations.

v1: https://lore.kernel.org/chrome-platform/20250814091020.1302888-2-tzungbi@kernel.org

A way to verify Documentation/:
- `make O=build SPHINXDIRS=driver-api/driver-model/ htmldocs`.

 .../driver-api/driver-model/index.rst         |   1 +
 .../driver-api/driver-model/revocable.rst     | 256 ++++++++++++++++++
 MAINTAINERS                                   |   9 +
 drivers/base/Makefile                         |   2 +-
 drivers/base/revocable.c                      | 228 ++++++++++++++++
 include/linux/revocable.h                     | 194 +++++++++++++
 6 files changed, 689 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/driver-api/driver-model/revocable.rst
 create mode 100644 drivers/base/revocable.c
 create mode 100644 include/linux/revocable.h

diff --git a/Documentation/driver-api/driver-model/index.rst b/Documentation/driver-api/driver-model/index.rst
index 4831bdd92e5c..8e1ee21185df 100644
--- a/Documentation/driver-api/driver-model/index.rst
+++ b/Documentation/driver-api/driver-model/index.rst
@@ -14,6 +14,7 @@ Driver Model
    overview
    platform
    porting
+   revocable
 
 .. only::  subproject and html
 
diff --git a/Documentation/driver-api/driver-model/revocable.rst b/Documentation/driver-api/driver-model/revocable.rst
new file mode 100644
index 000000000000..25f7ce82fa05
--- /dev/null
+++ b/Documentation/driver-api/driver-model/revocable.rst
@@ -0,0 +1,256 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================
+Revocable Resource Management
+==============================
+
+Overview
+========
+
+.. kernel-doc:: drivers/base/revocable.c
+   :doc: Overview
+
+Revocable vs. Devres (devm)
+===========================
+
+Revocable and Devres address different problems in resource management:
+
+*   **Devres:** Primarily addresses **resource leaks**.  The lifetime of the
+    resources is tied to the lifetime of the device.  The resource is
+    automatically freed when the device is unbound.  This cleanup happens
+    irrespective of any potential active users.
+
+*   **Revocable:** Primarily addresses **invalid memory access**,
+    such as Use-After-Free (UAF).  It's an independent synchronization
+    primitive that decouples consumer access from the resource's actual
+    presence.  Consumers interact with a "revocable object" (an intermediary),
+    not the underlying resource directly.  This revocable object persists as
+    long as there are active references to it from consumer handles.
+
+**Key Distinctions & How They Complement Each Other:**
+
+1.  **Reference Target:** Consumers hold a reference to the *revocable object*,
+    not the encapsulated resource itself.
+
+2.  **Resource Lifetime vs. Access:** The underlying resource's lifetime is
+    independent of the number of references to the revocable object.  The
+    resource can be freed at any point.  A common scenario is the resource
+    being freed by `devres` when the providing device is unbound.
+
+3.  **Safe Access:** Revocable provides a safe way to attempt access.  Before
+    using the resource, a consumer uses the Revocable API (e.g.,
+    revocable_try_access()).  This function checks if the resource is still
+    valid.  It returns a pointer to the resource only if it hasn't been
+    revoked; otherwise, it returns NULL.  This prevents UAF by providing a
+    clear signal that the resource is gone.
+
+4.  **Complementary Usage:** `devres` and Revocable work well together.
+    `devres` can handle the automatic allocation and deallocation of a
+    resource tied to a device.  The Revocable mechanism can be layered on top
+    to provide safe access for consumers whose lifetimes might extend beyond
+    the provider device's lifetime.  For instance, a userspace program might
+    keep a character device file open even after the physical device has been
+    removed.  In this case:
+
+    *   `devres` frees the device-specific resource upon unbinding.
+    *   The Revocable mechanism ensures that any subsequent operations on the
+        open file handle, which attempt to access the now-freed resource,
+        will fail gracefully (e.g., revocable_try_access() returns NULL)
+        instead of causing a UAF.
+
+In summary, `devres` ensures resources are *released* to prevent leaks, while
+the Revocable mechanism ensures that attempts to *access* these resources are
+done safely, even if the resource has been released.
+
+API and Usage
+=============
+
+For Resource Providers
+----------------------
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_get
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_put
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_alloc
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_revoke
+
+For Resource Consumers
+----------------------
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_consumer
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_init
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_deinit
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_try_access
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_withdraw_access
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_try_access_with
+
+Example Usage
+~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int consumer_use_resource(struct revocable *rp)
+    {
+        struct foo_resource *res;
+
+        revocable_try_access_with(rp, res);
+        // Always check if the resource is valid.
+        if (!res) {
+            pr_warn("Resource is not available\n");
+            return -EAGAIN;
+        }
+
+        // 'res' is guaranteed to be valid until this function exits.
+        do_something_with(res);
+        return 0;
+    } // revocable_withdraw_access() is automatically called here.
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_try_access_or_return_err
+
+Example Usage
+~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int consumer_use_resource(struct revocable *rp)
+    {
+        struct foo_resource *res;
+
+        // Returns -ENXIO if access fails.
+        revocable_try_access_or_return_err(rp, res, -ENXIO);
+
+        // 'res' is guaranteed to be valid if we reach here.
+        do_something_with(res);
+        return 0;
+    } // revocable_withdraw_access() is automatically called here.
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_try_access_or_return
+
+Example Usage
+~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int consumer_use_resource(struct revocable *rp)
+    {
+        struct foo_resource *res;
+
+        // Returns -ENODEV if access fails.
+        revocable_try_access_or_return(rp, res);
+
+        // 'res' is guaranteed to be valid if we reach here.
+        do_something_with(res);
+        return 0;
+    } // revocable_withdraw_access() is automatically called here.
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_try_access_with_scoped
+
+Example Usage
+~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int consumer_use_resource(struct revocable *rp)
+    {
+        struct foo_resource *res;
+
+        revocable_try_access_with_scoped(rp, res) {
+            // Always check if the resource is valid.
+            if (!res) {
+                pr_warn("Resource is not available\n");
+                return -EAGAIN;
+            }
+
+            // 'res' is valid for the rest of this block.
+            do_something_with(res);
+        }
+        // revocable_withdraw_access() is automatically called here.
+
+        return 0;
+    }
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_try_access_or_return_err_scoped
+
+Example Usage
+~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int consumer_use_resource(struct revocable *rp)
+    {
+        struct foo_resource *res;
+
+        // Returns -ENXIO if access fails.
+        revocable_try_access_or_return_err_scoped(rp, res, -ENXIO) {
+            // 'res' is guaranteed to be valid in this block.
+            do_something_with(res);
+        }
+        // revocable_withdraw_access() is automatically called here.
+
+        return 0; // Only reached if resource was accessed.
+    }
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_try_access_or_return_scoped
+
+Example Usage
+~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int consumer_use_resource(struct revocable *rp)
+    {
+        struct foo_resource *res;
+
+        // Returns -ENODEV if access fails.
+        revocable_try_access_or_return_scoped(rp, res) {
+            // 'res' is guaranteed to be valid in this block.
+            do_something_with(res);
+        }
+        // revocable_withdraw_access() is automatically called here.
+
+        return 0; // Only reached if resource was accessed.
+    }
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_try_access_or_skip_scoped
+
+Example Usage
+~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int consumer_use_resource(struct revocable *rp)
+    {
+        struct foo_resource *res;
+
+        revocable_try_access_or_skip_scoped(rp, res) {
+            // This block is ONLY entered if 'res' is not NULL.
+            do_something_with(res);
+        }
+        // revocable_withdraw_access() is automatically called here.
+
+        return 0;
+    }
diff --git a/MAINTAINERS b/MAINTAINERS
index a638a9ddb0ff..01670bc4db8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7702,6 +7702,7 @@ F:	include/linux/device.h
 F:	include/linux/fwnode.h
 F:	include/linux/kobj*
 F:	include/linux/property.h
+F:	include/linux/revocable.h
 F:	include/linux/sysfs.h
 F:	lib/kobj*
 F:	rust/kernel/debugfs.rs
@@ -22407,6 +22408,14 @@ F:	include/uapi/linux/rseq.h
 F:	kernel/rseq.c
 F:	tools/testing/selftests/rseq/
 
+REVOCABLE RESOURCE MANAGEMENT
+M:	Tzung-Bi Shih <tzungbi@kernel.org>
+L:	driver-core@lists.linux.dev
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
+F:	drivers/base/revocable.c
+F:	include/linux/revocable.h
+
 RFKILL
 M:	Johannes Berg <johannes@sipsolutions.net>
 L:	linux-wireless@vger.kernel.org
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 8074a10183dc..bdf854694e39 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -6,7 +6,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
 			   cpu.o firmware.o init.o map.o devres.o \
 			   attribute_container.o transport_class.o \
 			   topology.o container.o property.o cacheinfo.o \
-			   swnode.o faux.o
+			   swnode.o faux.o revocable.o
 obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
 obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
 obj-y			+= power/
diff --git a/drivers/base/revocable.c b/drivers/base/revocable.c
new file mode 100644
index 000000000000..aeda9f46351f
--- /dev/null
+++ b/drivers/base/revocable.c
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Google LLC
+ *
+ * Revocable resource management
+ */
+
+#include <linux/kref.h>
+#include <linux/revocable.h>
+#include <linux/slab.h>
+#include <linux/srcu.h>
+
+/**
+ * DOC: Overview
+ *
+ * The "revocable" mechanism is a synchronization primitive designed to
+ * manage safe access to resources that can be asynchronously removed or
+ * invalidated.  Its primary purpose is to prevent Use-After-Free (UAF)
+ * errors when interacting with resources whose lifetimes are not
+ * guaranteed to outlast their consumers.
+ *
+ * This is particularly useful in systems where resources can disappear
+ * unexpectedly, such as those provided by hot-pluggable devices like
+ * USB.  When a consumer holds a reference to such a resource, the
+ * underlying device might be removed, causing the resource's memory to
+ * be freed.  Subsequent access attempts by the consumer would then lead
+ * to UAF errors.
+ *
+ * Revocable addresses this by providing a form of "weak reference" and
+ * a controlled access method.  It allows a resource consumer to safely
+ * attempt to access the resource.  The mechanism guarantees that any
+ * access granted is valid for the duration of its use.  If the resource
+ * has already been revoked (i.e., freed), the access attempt will fail
+ * safely, typically by returning NULL, instead of causing a crash.
+ *
+ * It uses a provider/consumer model built on Sleepable RCU (SRCU) to
+ * guarantee safe memory access:
+ *
+ * - A resource provider, such as a driver for a hot-pluggable device,
+ *   allocates a struct revocable and initializes it with a pointer
+ *   to the resource.
+ *
+ * - A resource consumer that wants to access the resource allocates a
+ *   struct revocable_consumer containing a reference to the provider.
+ *
+ * - To access the resource, the consumer uses revocable_try_access().
+ *   This function enters an SRCU read-side critical section and returns
+ *   the pointer to the resource.  If the provider has already freed the
+ *   resource, it returns NULL.  After use, the consumer calls
+ *   revocable_withdraw_access() to exit the SRCU critical section.  There
+ *   are some macro level helpers for doing that.
+ *
+ *   The API provides the following contract:
+ *
+ *   - revocable_try_access() can be safely called from both process and
+ *     atomic contexts.
+ *   - It is permitted to sleep within the critical section established
+ *     between revocable_try_access() and revocable_withdraw_access().
+ *   - revocable_try_access() and the matching revocable_withdraw_access()
+ *     must occur in the same context.  For example, it is illegal to
+ *     invoke revocable_withdraw_access() in an irq handler if the matching
+ *     revocable_try_access() was invoked in process context.
+ *
+ * - When the provider needs to remove the resource, it calls
+ *   revocable_revoke().  This function sets the internal resource
+ *   pointer to NULL and then calls synchronize_srcu() to wait for all
+ *   current readers to finish before the resource can be completely torn
+ *   down.
+ */
+
+static void revocable_release(struct kref *kref)
+{
+	struct revocable *rp = container_of(kref, struct revocable, kref);
+
+	cleanup_srcu_struct(&rp->srcu);
+	kfree(rp);
+}
+
+/**
+ * revocable_get() - Increase a reference count to the provider handle.
+ * @rp: The pointer of resource provider.
+ *
+ * This holds a refcount to the resource provider.
+ */
+void revocable_get(struct revocable *rp)
+{
+	kref_get(&rp->kref);
+}
+EXPORT_SYMBOL_GPL(revocable_get);
+
+/**
+ * revocable_put() - Decrease a reference count to the provider handle.
+ * @rp: The pointer of resource provider.
+ *
+ * This drops a refcount to the resource provider.  If it is the final
+ * reference, revocable_release() will be called to free the struct.
+ */
+void revocable_put(struct revocable *rp)
+{
+	kref_put(&rp->kref, revocable_release);
+}
+EXPORT_SYMBOL_GPL(revocable_put);
+
+/**
+ * revocable_alloc() - Allocate struct revocable.
+ * @res: The pointer of resource.
+ *
+ * This allocates a resource provider handle and holds 2 initial reference
+ * counts to the handle.  If revocable_alloc() succeed:
+ *
+ * - The provider should call revocable_revoke() for dropping a reference.
+ * - The caller should call revocable_put() for dropping another reference.
+ *
+ * Return: The pointer of struct revocable.  NULL on errors.
+ */
+struct revocable *revocable_alloc(void *res)
+{
+	struct revocable *rp;
+
+	rp = kzalloc(sizeof(*rp), GFP_KERNEL);
+	if (!rp)
+		return NULL;
+
+	init_srcu_struct(&rp->srcu);
+	RCU_INIT_POINTER(rp->res, res);
+	kref_init(&rp->kref);
+	revocable_get(rp);
+	return rp;
+}
+EXPORT_SYMBOL_GPL(revocable_alloc);
+
+/**
+ * revocable_revoke() - Revoke the managed resource.
+ * @rp: The pointer of resource provider.
+ *
+ * This sets the resource `(struct revocable *)->res` to NULL to indicate
+ * the resource has gone.
+ *
+ * This drops a refcount to the resource provider.  If it is the final
+ * reference, revocable_release() will be called to free the struct.
+ */
+void revocable_revoke(struct revocable *rp)
+{
+	rcu_assign_pointer(rp->res, NULL);
+	synchronize_srcu(&rp->srcu);
+	revocable_put(rp);
+}
+EXPORT_SYMBOL_GPL(revocable_revoke);
+
+/**
+ * revocable_init() - Initialize struct revocable_consumer.
+ * @rp: The pointer of resource provider.
+ * @rev: The pointer of resource consumer.
+ *
+ * This holds a refcount to the resource provider.
+ */
+void revocable_init(struct revocable *rp, struct revocable_consumer *rev)
+{
+	revocable_get(rp);
+	rev->rp = rp;
+}
+EXPORT_SYMBOL_GPL(revocable_init);
+
+/**
+ * revocable_deinit() - Deinitialize struct revocable_consumer.
+ * @rev: The pointer of resource consumer.
+ *
+ * This drops a refcount to the resource provider.  If it is the final
+ * reference, revocable_release() will be called to free the struct.
+ */
+void revocable_deinit(struct revocable_consumer *rev)
+{
+	struct revocable *rp = rev->rp;
+
+	revocable_put(rp);
+}
+EXPORT_SYMBOL_GPL(revocable_deinit);
+
+/**
+ * revocable_try_access() - Try to access the resource.
+ * @rev: The pointer of resource consumer.
+ *
+ * This tries to de-reference to the resource and enters a SRCU critical
+ * section.
+ *
+ * The function is safe to be called from both process and atomic contexts.
+ * While holding the access (i.e. before calling revocable_withdraw_access()),
+ * the caller is allowed to sleep.
+ *
+ * Note that revocable_try_access() and the matching
+ * revocable_withdraw_access() must occur in the same context.  For example, it
+ * is illegal to invoke revocable_withdraw_access() in an irq handler if the
+ * matching revocable_try_access() was invoked in process context.
+ *
+ * Return: The pointer to the resource.  NULL if the resource has gone.
+ */
+void *revocable_try_access(struct revocable_consumer *rev)
+	__acquires(&rev->rp->srcu)
+{
+	struct revocable *rp = rev->rp;
+
+	rev->idx = srcu_read_lock(&rp->srcu);
+	return srcu_dereference(rp->res, &rp->srcu);
+}
+EXPORT_SYMBOL_GPL(revocable_try_access);
+
+/**
+ * revocable_withdraw_access() - Stop accessing to the resource.
+ * @rev: The pointer of resource consumer.
+ *
+ * Call this function to indicate the resource is no longer used.  It exits
+ * the SRCU critical section.
+ *
+ * The function is safe to be called from both process and atomic contexts.
+ *
+ * Note that revocable_try_access() and the matching
+ * revocable_withdraw_access() must occur in the same context.  For example, it
+ * is illegal to invoke revocable_withdraw_access() in an irq handler if the
+ * matching revocable_try_access() was invoked in process context.
+ */
+void revocable_withdraw_access(struct revocable_consumer *rev)
+	__releases(&rev->rp->srcu)
+{
+	struct revocable *rp = rev->rp;
+
+	srcu_read_unlock(&rp->srcu, rev->idx);
+}
+EXPORT_SYMBOL_GPL(revocable_withdraw_access);
diff --git a/include/linux/revocable.h b/include/linux/revocable.h
new file mode 100644
index 000000000000..90a03b80db49
--- /dev/null
+++ b/include/linux/revocable.h
@@ -0,0 +1,194 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2026 Google LLC
+ */
+
+#ifndef __LINUX_REVOCABLE_H
+#define __LINUX_REVOCABLE_H
+
+#include <linux/cleanup.h>
+#include <linux/compiler.h>
+#include <linux/kref.h>
+#include <linux/srcu.h>
+
+/**
+ * struct revocable - A handle for resource provider.
+ * @srcu: The SRCU to protect the resource.
+ * @res:  The pointer of resource.  It can point to anything.
+ * @kref: The refcount for this handle.
+ */
+struct revocable {
+	struct srcu_struct srcu;
+	void __rcu *res;
+	struct kref kref;
+};
+
+/**
+ * struct revocable_consumer - A handle for resource consumer.
+ * @rp: The pointer of resource provider.
+ * @idx: The index for the SRCU critical section.
+ */
+struct revocable_consumer {
+	struct revocable *rp;
+	int idx;
+};
+
+void revocable_get(struct revocable *rp);
+void revocable_put(struct revocable *rp);
+struct revocable *revocable_alloc(void *res);
+void revocable_revoke(struct revocable *rp);
+void revocable_init(struct revocable *rp, struct revocable_consumer *rev);
+void revocable_deinit(struct revocable_consumer *rev);
+void *revocable_try_access(struct revocable_consumer *rev)
+	__acquires(&rev->rp->srcu);
+void revocable_withdraw_access(struct revocable_consumer *rev)
+	__releases(&rev->rp->srcu);
+
+DEFINE_FREE(access_rev, struct revocable_consumer *, {
+	revocable_withdraw_access(_T);
+	revocable_deinit(_T);
+})
+
+#define _revocable_try_access_with(_rp, _rev, _res)				\
+	struct revocable_consumer _rev;						\
+	struct revocable_consumer *__UNIQUE_ID(name) __free(access_rev) = &_rev;\
+	revocable_init(_rp, &_rev);						\
+	_res = revocable_try_access(&_rev)
+
+/**
+ * revocable_try_access_with() - A helper for accessing revocable resource
+ * @_rp: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ *
+ * The macro simplifies the access-release cycle for consumers, ensuring that
+ * corresponding revocable_withdraw_access() and revocable_deinit() are called,
+ * even in the case of an early exit.
+ *
+ * It creates a local variable in the current scope.  @_res is populated with
+ * the result of revocable_try_access().  Callers **must** check if @_res is
+ * ``NULL`` before using it.  The revocable_withdraw_access() function is
+ * automatically called when the scope is exited.
+ *
+ * Note: It shares the same issue with guard() in cleanup.h.  No goto statements
+ * are allowed before the helper.  Otherwise, the compiler fails with
+ * "jump bypasses initialization of variable with __attribute__((cleanup))".
+ */
+#define revocable_try_access_with(_rp, _res)					\
+	_revocable_try_access_with(_rp, __UNIQUE_ID(name), _res)
+
+/**
+ * revocable_try_access_or_return_err() - Variant of revocable_try_access_with()
+ * @_rp: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ * @_err: The error code to return if resource is revoked.
+ *
+ * Similar to revocable_try_access_with() but returns from the current function
+ * with @_err if the resource is revoked.  Callers don't need to check @_res for
+ * ``NULL`` as this handles the revocation case by returning early.
+ */
+#define revocable_try_access_or_return_err(_rp, _res, _err)			\
+	_revocable_try_access_with(_rp, __UNIQUE_ID(name), _res);		\
+	if (!_res)								\
+		return _err
+
+/**
+ * revocable_try_access_or_return() - Variant of revocable_try_access_with()
+ * @_rp: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ *
+ * Similar to revocable_try_access_or_return_err() but returns -ENODEV if the
+ * resource is revoked.
+ */
+#define revocable_try_access_or_return(_rp, _res)				\
+	revocable_try_access_or_return_err(_rp, _res, -ENODEV)
+
+/**
+ * revocable_try_access_or_return_void() - Variant of revocable_try_access_with()
+ * @_rp: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ *
+ * Similar to revocable_try_access_or_return_err() but returns void if the
+ * resource is revoked.
+ */
+#define revocable_try_access_or_return_void(_rp, _res)				\
+	revocable_try_access_or_return_err(_rp, _res, )
+
+#define _revocable_try_access_with_scoped(_rp, _rev, _label, _res)		\
+	for (struct revocable_consumer _rev,					\
+			*__UNIQUE_ID(name) __free(access_rev) = &_rev;		\
+	     ({ revocable_init(_rp, &_rev);					\
+		_res = revocable_try_access(&_rev);				\
+		true; });							\
+	     ({ goto _label; }))						\
+		if (0) {							\
+_label:										\
+			break;							\
+		} else
+
+/**
+ * revocable_try_access_with_scoped() - Variant of revocable_try_access_with()
+ * @_rp: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ *
+ * Similar to revocable_try_access_with() but with an explicit scope from a
+ * temporary ``for`` loop.
+ */
+#define revocable_try_access_with_scoped(_rp, _res)				\
+	_revocable_try_access_with_scoped(_rp, __UNIQUE_ID(name),		\
+					  __UNIQUE_ID(label), _res)
+
+/**
+ * revocable_try_access_or_return_err_scoped() - Variant of revocable_try_access_with_scoped()
+ * @_rp: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ * @_err: The error code to return if resource is revoked.
+ *
+ * Similar to revocable_try_access_with_scoped() but returns from the current
+ * function with @_err if the resource is revoked.  Callers don't need to check
+ * @_res for ``NULL`` as this handles the revocation case by returning early.
+ */
+#define revocable_try_access_or_return_err_scoped(_rp, _res, _err)		\
+	_revocable_try_access_with_scoped(_rp, __UNIQUE_ID(name),		\
+					  __UNIQUE_ID(label), _res)		\
+	if (!_res) {								\
+		return _err;							\
+	} else
+
+/**
+ * revocable_try_access_or_return_scoped() - Variant of revocable_try_access_with_scoped()
+ * @_rp: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ *
+ * Similar to revocable_try_access_or_return_err_scoped() but returns -ENODEV
+ * if the resource is revoked.
+ */
+#define revocable_try_access_or_return_scoped(_rp, _res)			\
+	revocable_try_access_or_return_err_scoped(_rp, _res, -ENODEV)
+
+/**
+ * revocable_try_access_or_return_void_scoped() - Variant of revocable_try_access_with_scoped()
+ * @_rp: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ *
+ * Similar to revocable_try_access_or_return_err_scoped() but returns void
+ * if the resource is revoked.
+ */
+#define revocable_try_access_or_return_void_scoped(_rp, _res)			\
+	revocable_try_access_or_return_err_scoped(_rp, _res, )
+
+/**
+ * revocable_try_access_or_skip_scoped() - Variant of revocable_try_access_with_scoped()
+ * @_rp: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ *
+ * Similar to revocable_try_access_with_scoped() but skips the following code
+ * block if the resource is revoked.
+ */
+#define revocable_try_access_or_skip_scoped(_rp, _res)				\
+	_revocable_try_access_with_scoped(_rp, __UNIQUE_ID(name),		\
+					  __UNIQUE_ID(label), _res)		\
+	if (!_res) {								\
+		break;								\
+	} else
+
+#endif /* __LINUX_REVOCABLE_H */
-- 
2.53.0.310.g728cabbaf7-goog

