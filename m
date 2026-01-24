Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EEF1482E8;
	Sat, 24 Jan 2026 17:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769274947; cv=none; b=gyyhnJBPds2AL5MSUDPZflvEPQUUhxyfwG5h84LpkR2ALL/OmRLU9I7tvakicPhzqE0GFpWpNFx+GRLniiy8jdYZG06Lc7FLN0H6TCCrqMvN6T6mmB4R2zUOMDROLCnm47nhP+QAfIX3IxqXEX7Fhm11K2EUrB3aLUw0rMS10Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769274947; c=relaxed/simple;
	bh=RR254ofngNJVcoH69yQU5APzgVQfgMF0pu0YNY8o4Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBKnQ4xc1GTRXv1c7oQ4+HlrokPv7Tb69DPWFGK60wcxk1DcWsCFI/hTGr2R++gZUU8hBoQslu/3PSpF/vD9q093K2u8TR8bZX4eTZ7RW43NRS2PXO/NgPqlrYy98Mfcs8pJW1TYaobK/lC0x/MytVNX72F3buGSZDjfQzfLAqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaydNOh4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaydNOh4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4D0C19424;
	Sat, 24 Jan 2026 17:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769274947;
	bh=RR254ofngNJVcoH69yQU5APzgVQfgMF0pu0YNY8o4Dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BaydNOh4ByMk+psjcHcYFqcukFTEauyPbp4Hf4iCpK8vYwq6Alk9Vn5Z5w8+ZYCF5
	 W98NgA71tBzjyMHTkJckwthuV4rDodbQp5yuhpQ0ygVW7LF5Oi+OgGsxUcONwbBXRN
	 o2WxStqCEqX1l+3Tyu3K8epCIJ9r+piF4Nq9cVe8JLIUaeAuMNpTc0XQ/1MesaKvK0
	 0TxJSz50sHvzyhWDaLpmZKmx9o+u4soFTWbT2T3fPteqLO6wuKyYgQDSrTs+wXkM8B
	 phncxTo597Ba9/e1KgMMyYIe6sz9L12nIlC2EgI+bn3LeG+/7OXNI7dSX06swQdaog
	 mZnr8t79xAMxw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vjhEg-000000003Hz-0nBA;
	Sat, 24 Jan 2026 18:15:46 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/3] Revert "revocable: Revocable resource management"
Date: Sat, 24 Jan 2026 18:05:35 +0100
Message-ID: <20260124170535.11756-4-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124170535.11756-1-johan@kernel.org>
References: <20260124170535.11756-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 2da75b5b72559e5214a24aaf7ac933bb5bc2f1fe.

The revocable implementation uses two separate abstractions, struct
revocable_provider and struct revocable, in order to store the SRCU read
lock index which must be passed unaltered to srcu_read_unlock() in the
same context when a resource is no longer needed:

	struct revocable {
		struct revocable_provider *rp;
		int idx;
	};

	void *revocable_try_access(struct revocable *rev)
	{
		struct revocable_provider *rp = rev->rp;

		rev->idx = srcu_read_lock(&rp->srcu);
		return srcu_dereference(rp->res, &rp->srcu);
	}

	void revocable_withdraw_access(struct revocable *rev)
	{
		struct revocable_provider *rp = rev->rp;

		srcu_read_unlock(&rp->srcu, rev->idx);
	}

Multiple threads may however share the same struct revocable and
therefore potentially overwrite the SRCU index of another thread which
can cause the SRCU synchronisation in revocable_provider_revoke() to
never complete.

This can specifically happen when two threads share an open file and a
revocable resource has been allocated on open(), which was the primary
example of how revocable could be used (e.g. see the now reverted
revocable selftests).

This would also affect any future revocable resource that may be
accessed from multiple contexts (e.g. a gpio used in both process and
interrupt context).

Revert the revocable implementation until a redesign has been proposed
and evaluated properly.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 .../driver-api/driver-model/index.rst         |   1 -
 .../driver-api/driver-model/revocable.rst     | 152 -----------
 MAINTAINERS                                   |   7 -
 drivers/base/Makefile                         |   2 +-
 drivers/base/revocable.c                      | 241 ------------------
 include/linux/revocable.h                     |  69 -----
 6 files changed, 1 insertion(+), 471 deletions(-)
 delete mode 100644 Documentation/driver-api/driver-model/revocable.rst
 delete mode 100644 drivers/base/revocable.c
 delete mode 100644 include/linux/revocable.h

diff --git a/Documentation/driver-api/driver-model/index.rst b/Documentation/driver-api/driver-model/index.rst
index 8e1ee21185df..4831bdd92e5c 100644
--- a/Documentation/driver-api/driver-model/index.rst
+++ b/Documentation/driver-api/driver-model/index.rst
@@ -14,7 +14,6 @@ Driver Model
    overview
    platform
    porting
-   revocable
 
 .. only::  subproject and html
 
diff --git a/Documentation/driver-api/driver-model/revocable.rst b/Documentation/driver-api/driver-model/revocable.rst
deleted file mode 100644
index 22a442cc8d7f..000000000000
--- a/Documentation/driver-api/driver-model/revocable.rst
+++ /dev/null
@@ -1,152 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-==============================
-Revocable Resource Management
-==============================
-
-Overview
-========
-
-.. kernel-doc:: drivers/base/revocable.c
-   :doc: Overview
-
-Revocable vs. Devres (devm)
-===========================
-
-It's important to understand the distinct roles of the Revocable and Devres,
-and how they can complement each other.  They address different problems in
-resource management:
-
-*   **Devres:** Primarily address **resource leaks**.  The lifetime of the
-    resources is tied to the lifetime of the device.  The resource is
-    automatically freed when the device is unbound.  This cleanup happens
-    irrespective of any potential active users.
-
-*   **Revocable:** Primarily addresses **invalid memory access**,
-    such as Use-After-Free (UAF).  It's an independent synchronization
-    primitive that decouples consumer access from the resource's actual
-    presence.  Consumers interact with a "revocable object" (an intermediary),
-    not the underlying resource directly.  This revocable object persists as
-    long as there are active references to it from consumer handles.
-
-**Key Distinctions & How They Complement Each Other:**
-
-1.  **Reference Target:** Consumers of a resource managed by the Revocable
-    mechanism hold a reference to the *revocable object*, not the
-    encapsulated resource itself.
-
-2.  **Resource Lifetime vs. Access:** The underlying resource's lifetime is
-    independent of the number of references to the revocable object.  The
-    resource can be freed at any point.  A common scenario is the resource
-    being freed by `devres` when the providing device is unbound.
-
-3.  **Safe Access:** Revocable provides a safe way to attempt access.  Before
-    using the resource, a consumer uses the Revocable API (e.g.,
-    revocable_try_access()).  This function checks if the resource is still
-    valid.  It returns a pointer to the resource only if it hasn't been
-    revoked; otherwise, it returns NULL.  This prevents UAF by providing a
-    clear signal that the resource is gone.
-
-4.  **Complementary Usage:** `devres` and Revocable work well together.
-    `devres` can handle the automatic allocation and deallocation of a
-    resource tied to a device.  The Revocable mechanism can be layered on top
-    to provide safe access for consumers whose lifetimes might extend beyond
-    the provider device's lifetime.  For instance, a userspace program might
-    keep a character device file open even after the physical device has been
-    removed.  In this case:
-
-    *   `devres` frees the device-specific resource upon unbinding.
-    *   The Revocable mechanism ensures that any subsequent operations on the
-        open file handle, which attempt to access the now-freed resource,
-        will fail gracefully (e.g., revocable_try_access() returns NULL)
-        instead of causing a UAF.
-
-In summary, `devres` ensures resources are *released* to prevent leaks, while
-the Revocable mechanism ensures that attempts to *access* these resources are
-done safely, even if the resource has been released.
-
-API and Usage
-=============
-
-For Resource Providers
-----------------------
-.. kernel-doc:: drivers/base/revocable.c
-   :identifiers: revocable_provider
-
-.. kernel-doc:: drivers/base/revocable.c
-   :identifiers: revocable_provider_alloc
-
-.. kernel-doc:: drivers/base/revocable.c
-   :identifiers: devm_revocable_provider_alloc
-
-.. kernel-doc:: drivers/base/revocable.c
-   :identifiers: revocable_provider_revoke
-
-For Resource Consumers
-----------------------
-.. kernel-doc:: drivers/base/revocable.c
-   :identifiers: revocable
-
-.. kernel-doc:: drivers/base/revocable.c
-   :identifiers: revocable_alloc
-
-.. kernel-doc:: drivers/base/revocable.c
-   :identifiers: revocable_free
-
-.. kernel-doc:: drivers/base/revocable.c
-   :identifiers: revocable_try_access
-
-.. kernel-doc:: drivers/base/revocable.c
-   :identifiers: revocable_withdraw_access
-
-.. kernel-doc:: include/linux/revocable.h
-   :identifiers: REVOCABLE_TRY_ACCESS_WITH
-
-Example Usage
-~~~~~~~~~~~~~
-
-.. code-block:: c
-
-    void consumer_use_resource(struct revocable *rev)
-    {
-        struct foo_resource *res;
-
-        REVOCABLE_TRY_ACCESS_WITH(rev, res);
-        // Always check if the resource is valid.
-        if (!res) {
-            pr_warn("Resource is not available\n");
-            return;
-        }
-
-        // At this point, 'res' is guaranteed to be valid until
-        // this block exits.
-        do_something_with(res);
-
-    } // revocable_withdraw_access() is automatically called here.
-
-.. kernel-doc:: include/linux/revocable.h
-   :identifiers: REVOCABLE_TRY_ACCESS_SCOPED
-
-Example Usage
-~~~~~~~~~~~~~
-
-.. code-block:: c
-
-    void consumer_use_resource(struct revocable *rev)
-    {
-        struct foo_resource *res;
-
-        REVOCABLE_TRY_ACCESS_SCOPED(rev, res) {
-            // Always check if the resource is valid.
-            if (!res) {
-                pr_warn("Resource is not available\n");
-                return;
-            }
-
-            // At this point, 'res' is guaranteed to be valid until
-            // this block exits.
-            do_something_with(res);
-        }
-
-        // revocable_withdraw_access() is automatically called here.
-    }
diff --git a/MAINTAINERS b/MAINTAINERS
index fac638cbb40a..da9dbc1a4019 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22370,13 +22370,6 @@ F:	include/uapi/linux/rseq.h
 F:	kernel/rseq.c
 F:	tools/testing/selftests/rseq/
 
-REVOCABLE RESOURCE MANAGEMENT
-M:	Tzung-Bi Shih <tzungbi@kernel.org>
-L:	linux-kernel@vger.kernel.org
-S:	Maintained
-F:	drivers/base/revocable.c
-F:	include/linux/revocable.h
-
 RFKILL
 M:	Johannes Berg <johannes@sipsolutions.net>
 L:	linux-wireless@vger.kernel.org
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index bdf854694e39..8074a10183dc 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -6,7 +6,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
 			   cpu.o firmware.o init.o map.o devres.o \
 			   attribute_container.o transport_class.o \
 			   topology.o container.o property.o cacheinfo.o \
-			   swnode.o faux.o revocable.o
+			   swnode.o faux.o
 obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
 obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
 obj-y			+= power/
diff --git a/drivers/base/revocable.c b/drivers/base/revocable.c
deleted file mode 100644
index b068e18a847d..000000000000
--- a/drivers/base/revocable.c
+++ /dev/null
@@ -1,241 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright 2026 Google LLC
- *
- * Revocable resource management
- */
-
-#include <linux/device.h>
-#include <linux/kref.h>
-#include <linux/revocable.h>
-#include <linux/slab.h>
-#include <linux/srcu.h>
-
-/**
- * DOC: Overview
- *
- * The "revocable" mechanism is a synchronization primitive designed to manage
- * safe access to resources that can be asynchronously removed or invalidated.
- * Its primary purpose is to prevent Use-After-Free (UAF) errors when
- * interacting with resources whose lifetimes are not guaranteed to outlast
- * their consumers.
- *
- * This is particularly useful in systems where resources can disappear
- * unexpectedly, such as those provided by hot-pluggable devices like USB.
- * When a consumer holds a reference to such a resource, the underlying device
- * might be removed, causing the resource's memory to be freed.  Subsequent
- * access attempts by the consumer would then lead to UAF errors.
- *
- * Revocable addresses this by providing a form of "weak reference" and a
- * controlled access method.  It allows a resource consumer to safely attempt to
- * access the resource.  The mechanism guarantees that any access granted is
- * valid for the duration of its use.  If the resource has already been
- * revoked (i.e., freed), the access attempt will fail safely, typically by
- * returning NULL, instead of causing a crash.
- *
- * The implementation uses a provider/consumer model built on Sleepable
- * RCU (SRCU) to guarantee safe memory access:
- *
- * - A resource provider, such as a driver for a hot-pluggable device,
- *   allocates a struct revocable_provider and initializes it with a pointer
- *   to the resource.
- *
- * - A resource consumer that wants to access the resource allocates a
- *   struct revocable which acts as a handle containing a reference to the
- *   provider.
- *
- * - To access the resource, the consumer uses revocable_try_access().
- *   This function enters an SRCU read-side critical section and returns
- *   the pointer to the resource.  If the provider has already freed the
- *   resource, it returns NULL.  After use, the consumer calls
- *   revocable_withdraw_access() to exit the SRCU critical section.  The
- *   REVOCABLE_TRY_ACCESS_WITH() and REVOCABLE_TRY_ACCESS_SCOPED() are
- *   convenient helpers for doing that.
- *
- * - When the provider needs to remove the resource, it calls
- *   revocable_provider_revoke().  This function sets the internal resource
- *   pointer to NULL and then calls synchronize_srcu() to wait for all
- *   current readers to finish before the resource can be completely torn
- *   down.
- */
-
-/**
- * struct revocable_provider - A handle for resource provider.
- * @srcu: The SRCU to protect the resource.
- * @res:  The pointer of resource.  It can point to anything.
- * @kref: The refcount for this handle.
- */
-struct revocable_provider {
-	struct srcu_struct srcu;
-	void __rcu *res;
-	struct kref kref;
-};
-
-/**
- * struct revocable - A handle for resource consumer.
- * @rp: The pointer of resource provider.
- * @idx: The index for the RCU critical section.
- */
-struct revocable {
-	struct revocable_provider *rp;
-	int idx;
-};
-
-/**
- * revocable_provider_alloc() - Allocate struct revocable_provider.
- * @res: The pointer of resource.
- *
- * This holds an initial refcount to the struct.
- *
- * Return: The pointer of struct revocable_provider.  NULL on errors.
- */
-struct revocable_provider *revocable_provider_alloc(void *res)
-{
-	struct revocable_provider *rp;
-
-	rp = kzalloc(sizeof(*rp), GFP_KERNEL);
-	if (!rp)
-		return NULL;
-
-	init_srcu_struct(&rp->srcu);
-	rcu_assign_pointer(rp->res, res);
-	kref_init(&rp->kref);
-
-	return rp;
-}
-EXPORT_SYMBOL_GPL(revocable_provider_alloc);
-
-static void revocable_provider_release(struct kref *kref)
-{
-	struct revocable_provider *rp = container_of(kref,
-			struct revocable_provider, kref);
-
-	cleanup_srcu_struct(&rp->srcu);
-	kfree(rp);
-}
-
-/**
- * revocable_provider_revoke() - Revoke the managed resource.
- * @rp: The pointer of resource provider.
- *
- * This sets the resource `(struct revocable_provider *)->res` to NULL to
- * indicate the resource has gone.
- *
- * This drops the refcount to the resource provider.  If it is the final
- * reference, revocable_provider_release() will be called to free the struct.
- */
-void revocable_provider_revoke(struct revocable_provider *rp)
-{
-	rcu_assign_pointer(rp->res, NULL);
-	synchronize_srcu(&rp->srcu);
-	kref_put(&rp->kref, revocable_provider_release);
-}
-EXPORT_SYMBOL_GPL(revocable_provider_revoke);
-
-static void devm_revocable_provider_revoke(void *data)
-{
-	struct revocable_provider *rp = data;
-
-	revocable_provider_revoke(rp);
-}
-
-/**
- * devm_revocable_provider_alloc() - Dev-managed revocable_provider_alloc().
- * @dev: The device.
- * @res: The pointer of resource.
- *
- * It is convenient to allocate providers via this function if the @res is
- * also tied to the lifetime of the @dev.  revocable_provider_revoke() will
- * be called automatically when the device is unbound.
- *
- * This holds an initial refcount to the struct.
- *
- * Return: The pointer of struct revocable_provider.  NULL on errors.
- */
-struct revocable_provider *devm_revocable_provider_alloc(struct device *dev,
-							 void *res)
-{
-	struct revocable_provider *rp;
-
-	rp = revocable_provider_alloc(res);
-	if (!rp)
-		return NULL;
-
-	if (devm_add_action_or_reset(dev, devm_revocable_provider_revoke, rp))
-		return NULL;
-
-	return rp;
-}
-EXPORT_SYMBOL_GPL(devm_revocable_provider_alloc);
-
-/**
- * revocable_alloc() - Allocate struct revocable.
- * @rp: The pointer of resource provider.
- *
- * This holds a refcount to the resource provider.
- *
- * Return: The pointer of struct revocable.  NULL on errors.
- */
-struct revocable *revocable_alloc(struct revocable_provider *rp)
-{
-	struct revocable *rev;
-
-	rev = kzalloc(sizeof(*rev), GFP_KERNEL);
-	if (!rev)
-		return NULL;
-
-	rev->rp = rp;
-	kref_get(&rp->kref);
-
-	return rev;
-}
-EXPORT_SYMBOL_GPL(revocable_alloc);
-
-/**
- * revocable_free() - Free struct revocable.
- * @rev: The pointer of struct revocable.
- *
- * This drops a refcount to the resource provider.  If it is the final
- * reference, revocable_provider_release() will be called to free the struct.
- */
-void revocable_free(struct revocable *rev)
-{
-	struct revocable_provider *rp = rev->rp;
-
-	kref_put(&rp->kref, revocable_provider_release);
-	kfree(rev);
-}
-EXPORT_SYMBOL_GPL(revocable_free);
-
-/**
- * revocable_try_access() - Try to access the resource.
- * @rev: The pointer of struct revocable.
- *
- * This tries to de-reference to the resource and enters a RCU critical
- * section.
- *
- * Return: The pointer to the resource.  NULL if the resource has gone.
- */
-void *revocable_try_access(struct revocable *rev) __acquires(&rev->rp->srcu)
-{
-	struct revocable_provider *rp = rev->rp;
-
-	rev->idx = srcu_read_lock(&rp->srcu);
-	return srcu_dereference(rp->res, &rp->srcu);
-}
-EXPORT_SYMBOL_GPL(revocable_try_access);
-
-/**
- * revocable_withdraw_access() - Stop accessing to the resource.
- * @rev: The pointer of struct revocable.
- *
- * Call this function to indicate the resource is no longer used.  It exits
- * the RCU critical section.
- */
-void revocable_withdraw_access(struct revocable *rev) __releases(&rev->rp->srcu)
-{
-	struct revocable_provider *rp = rev->rp;
-
-	srcu_read_unlock(&rp->srcu, rev->idx);
-}
-EXPORT_SYMBOL_GPL(revocable_withdraw_access);
diff --git a/include/linux/revocable.h b/include/linux/revocable.h
deleted file mode 100644
index 659ba01c58db..000000000000
--- a/include/linux/revocable.h
+++ /dev/null
@@ -1,69 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright 2026 Google LLC
- */
-
-#ifndef __LINUX_REVOCABLE_H
-#define __LINUX_REVOCABLE_H
-
-#include <linux/compiler.h>
-#include <linux/cleanup.h>
-
-struct device;
-struct revocable;
-struct revocable_provider;
-
-struct revocable_provider *revocable_provider_alloc(void *res);
-void revocable_provider_revoke(struct revocable_provider *rp);
-struct revocable_provider *devm_revocable_provider_alloc(struct device *dev,
-							 void *res);
-
-struct revocable *revocable_alloc(struct revocable_provider *rp);
-void revocable_free(struct revocable *rev);
-void *revocable_try_access(struct revocable *rev) __acquires(&rev->rp->srcu);
-void revocable_withdraw_access(struct revocable *rev) __releases(&rev->rp->srcu);
-
-DEFINE_FREE(access_rev, struct revocable *, if (_T) revocable_withdraw_access(_T))
-
-/**
- * REVOCABLE_TRY_ACCESS_WITH() - A helper for accessing revocable resource
- * @_rev: The consumer's ``struct revocable *`` handle.
- * @_res: A pointer variable that will be assigned the resource.
- *
- * The macro simplifies the access-release cycle for consumers, ensuring that
- * revocable_withdraw_access() is always called, even in the case of an early
- * exit.
- *
- * It creates a local variable in the current scope.  @_res is populated with
- * the result of revocable_try_access().  The consumer code **must** check if
- * @_res is ``NULL`` before using it.  The revocable_withdraw_access() function
- * is automatically called when the scope is exited.
- *
- * Note: It shares the same issue with guard() in cleanup.h.  No goto statements
- * are allowed before the helper.  Otherwise, the compiler fails with
- * "jump bypasses initialization of variable with __attribute__((cleanup))".
- */
-#define REVOCABLE_TRY_ACCESS_WITH(_rev, _res)					\
-	struct revocable *__UNIQUE_ID(name) __free(access_rev) = _rev;		\
-	_res = revocable_try_access(_rev)
-
-#define _REVOCABLE_TRY_ACCESS_SCOPED(_rev, _label, _res)			\
-	for (struct revocable *__UNIQUE_ID(name) __free(access_rev) = _rev;	\
-	     (_res = revocable_try_access(_rev)) || true; ({ goto _label; }))	\
-		if (0) {							\
-_label:										\
-			break;							\
-		} else
-
-/**
- * REVOCABLE_TRY_ACCESS_SCOPED() - A helper for accessing revocable resource
- * @_rev: The consumer's ``struct revocable *`` handle.
- * @_res: A pointer variable that will be assigned the resource.
- *
- * Similar to REVOCABLE_TRY_ACCESS_WITH() but with an explicit scope from a
- * temporary ``for`` loop.
- */
-#define REVOCABLE_TRY_ACCESS_SCOPED(_rev, _res)					\
-	_REVOCABLE_TRY_ACCESS_SCOPED(_rev, __UNIQUE_ID(label), _res)
-
-#endif /* __LINUX_REVOCABLE_H */
-- 
2.52.0

