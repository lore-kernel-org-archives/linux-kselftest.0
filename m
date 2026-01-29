Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD152EBDD0;
	Thu, 29 Jan 2026 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769697484; cv=none; b=Aqt5CqWwDxn9QP3lSK5hL2asGfl3nlmst9NSKOprTEflQpp/e9ZQzryUcCKP/fqmHj+lbvk37wDZbBCE7Ly9ez2NjSrh066H0GBZLpeqosUZRzpWaTqfYPrilKWxkdeL1uM05NqTQf4/Tw4qhWhx3k0G7P4y8Tj+JZK4WtZ09Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769697484; c=relaxed/simple;
	bh=C5tmgGU5cz43OD3SA976f+0YYg5ZavulT15yW39I/tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKz4DMdlutiLtIPDQssx3DhGy1yCmpRSnnVGhsx8YG5Ktx3iIZk6GBxZfcioo7AeQJSozWH00laixJTxGrGHXxy0AcUjySo7A4SwzUKHJxBhQTtgMJ77rudB7RY7qeBgYdNRFs+Tu/UCtdLAXPk8Vtos4IPvUb2Y5wBv1j1o0hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWxcAga0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWxcAga0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856E1C116D0;
	Thu, 29 Jan 2026 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769697483;
	bh=C5tmgGU5cz43OD3SA976f+0YYg5ZavulT15yW39I/tQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eWxcAga0I5JSEhPiF7moNaGrYHTM6JUrdQ0jtHKH7gqVQhHscWnYDSW8szUoz6/ZC
	 HKay1egya42/1LFCnGvl19B5TK5pg5UJ33iMAdjWT8PjjMsuUzelNQEovP9qT1u3ct
	 0SbKTy5lf3YnMvS8pyEhxCZg/mre+2yYINfT98iqZOCx8mzmPPPEzdH48S6imzz2vU
	 LQZoZ7rhJ1efuigZ/umsq194ygC+OxX0j3pfucaWQwQfAgid2UvPYo7gIAjWnABmgY
	 i5n2r0yJTdon/YSnYBt/eNgeDukcJGbH96jYx6jzOv7QZNW5fUa197oTyITIvS7/hD
	 pR+YTsJVIXNHA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org
Subject: [PATCH 1/4] revocable: Fix races in revocable_alloc() using RCU
Date: Thu, 29 Jan 2026 14:37:30 +0000
Message-ID: <20260129143733.45618-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
In-Reply-To: <20260129143733.45618-1-tzungbi@kernel.org>
References: <20260129143733.45618-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two race conditions when allocating a revocable instance:

1. After a struct revocable_provider is revoked, the caller might still
   hold a dangling pointer to it.  A subsequent call to
   revocable_alloc() can trigger a use-after-free.
2. If revocable_provider_release() runs concurrently with
   revocable_alloc(), the memory of struct revocable_provider can be
   accessed during or after kfree().

To fix these:
- Manage the lifetime of struct revocable_provider using RCU.  Annotate
  pointers to it with __rcu and use kfree_rcu() for deallocation.
- Update revocable_alloc() to safely acquire a reference using RCU
  primitives.
- Update revocable_provider_revoke() to take a double pointer (`**rp`).
  It atomically NULLs out the caller's pointer before starting
  revocation.  This prevents the caller from holding a dangling pointer.
- Drop devm_revocable_provider_alloc().  The devm-managed model cannot
  support the required double-pointer semantic for safe pointer nulling.

Reported-by: Johan Hovold <johan@kernel.org>
Closes: https://lore.kernel.org/all/aXdy-b3GOJkzGqYo@hovoldconsulting.com/
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 .../driver-api/driver-model/revocable.rst     |  3 -
 drivers/base/revocable.c                      | 93 ++++++++++---------
 drivers/base/revocable_test.c                 | 20 ++--
 include/linux/revocable.h                     |  8 +-
 .../revocable/test_modules/revocable_test.c   | 19 ++--
 5 files changed, 72 insertions(+), 71 deletions(-)

diff --git a/Documentation/driver-api/driver-model/revocable.rst b/Documentation/driver-api/driver-model/revocable.rst
index 22a442cc8d7f..ab7c0af5fbb6 100644
--- a/Documentation/driver-api/driver-model/revocable.rst
+++ b/Documentation/driver-api/driver-model/revocable.rst
@@ -76,9 +76,6 @@ For Resource Providers
 .. kernel-doc:: drivers/base/revocable.c
    :identifiers: revocable_provider_alloc
 
-.. kernel-doc:: drivers/base/revocable.c
-   :identifiers: devm_revocable_provider_alloc
-
 .. kernel-doc:: drivers/base/revocable.c
    :identifiers: revocable_provider_revoke
 
diff --git a/drivers/base/revocable.c b/drivers/base/revocable.c
index b068e18a847d..1bcd1cf54764 100644
--- a/drivers/base/revocable.c
+++ b/drivers/base/revocable.c
@@ -64,11 +64,13 @@
  * @srcu: The SRCU to protect the resource.
  * @res:  The pointer of resource.  It can point to anything.
  * @kref: The refcount for this handle.
+ * @rcu: The RCU to protect pointer to itself.
  */
 struct revocable_provider {
 	struct srcu_struct srcu;
 	void __rcu *res;
 	struct kref kref;
+	struct rcu_head rcu;
 };
 
 /**
@@ -88,8 +90,9 @@ struct revocable {
  * This holds an initial refcount to the struct.
  *
  * Return: The pointer of struct revocable_provider.  NULL on errors.
+ * It enforces the caller handles the returned pointer in RCU ways.
  */
-struct revocable_provider *revocable_provider_alloc(void *res)
+struct revocable_provider __rcu *revocable_provider_alloc(void *res)
 {
 	struct revocable_provider *rp;
 
@@ -98,10 +101,10 @@ struct revocable_provider *revocable_provider_alloc(void *res)
 		return NULL;
 
 	init_srcu_struct(&rp->srcu);
-	rcu_assign_pointer(rp->res, res);
+	RCU_INIT_POINTER(rp->res, res);
 	kref_init(&rp->kref);
 
-	return rp;
+	return (struct revocable_provider __rcu *)rp;
 }
 EXPORT_SYMBOL_GPL(revocable_provider_alloc);
 
@@ -111,82 +114,80 @@ static void revocable_provider_release(struct kref *kref)
 			struct revocable_provider, kref);
 
 	cleanup_srcu_struct(&rp->srcu);
-	kfree(rp);
+	kfree_rcu(rp, rcu);
 }
 
 /**
  * revocable_provider_revoke() - Revoke the managed resource.
- * @rp: The pointer of resource provider.
+ * @rp_ptr: The pointer of pointer of resource provider.
  *
  * This sets the resource `(struct revocable_provider *)->res` to NULL to
  * indicate the resource has gone.
  *
  * This drops the refcount to the resource provider.  If it is the final
  * reference, revocable_provider_release() will be called to free the struct.
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
  *
- * This holds an initial refcount to the struct.
- *
- * Return: The pointer of struct revocable_provider.  NULL on errors.
+ * It enforces the caller to pass a pointer of pointer of resource provider so
+ * that it sets \*rp_ptr to NULL to prevent from keeping a dangling pointer.
  */
-struct revocable_provider *devm_revocable_provider_alloc(struct device *dev,
-							 void *res)
+void revocable_provider_revoke(struct revocable_provider __rcu **rp_ptr)
 {
 	struct revocable_provider *rp;
 
-	rp = revocable_provider_alloc(res);
+	rp = rcu_replace_pointer(*rp_ptr, NULL, 1);
 	if (!rp)
-		return NULL;
+		return;
 
-	if (devm_add_action_or_reset(dev, devm_revocable_provider_revoke, rp))
-		return NULL;
-
-	return rp;
+	rcu_assign_pointer(rp->res, NULL);
+	synchronize_srcu(&rp->srcu);
+	kref_put(&rp->kref, revocable_provider_release);
 }
-EXPORT_SYMBOL_GPL(devm_revocable_provider_alloc);
+EXPORT_SYMBOL_GPL(revocable_provider_revoke);
 
 /**
  * revocable_alloc() - Allocate struct revocable.
- * @rp: The pointer of resource provider.
+ * @_rp: The pointer of resource provider.
  *
  * This holds a refcount to the resource provider.
  *
  * Return: The pointer of struct revocable.  NULL on errors.
  */
-struct revocable *revocable_alloc(struct revocable_provider *rp)
+struct revocable *revocable_alloc(struct revocable_provider __rcu *_rp)
 {
+	struct revocable_provider *rp;
 	struct revocable *rev;
 
+	if (!_rp)
+		return NULL;
+
+	/*
+	 * Enter a read-side critical section.
+	 *
+	 * This prevents kfree_rcu() from freeing the struct revocable_provider
+	 * memory, for the duration of this scope.
+	 */
+	scoped_guard(rcu) {
+		rp = rcu_dereference(_rp);
+		if (!rp)
+			/* The revocable provider has been revoked. */
+			return NULL;
+
+		if (!kref_get_unless_zero(&rp->kref))
+			/*
+			 * The revocable provider is releasing (i.e.,
+			 * revocable_provider_release() has been called).
+			 */
+			return NULL;
+	}
+	/* At this point, `rp` is safe to access as holding a kref of it */
+
 	rev = kzalloc(sizeof(*rev), GFP_KERNEL);
-	if (!rev)
+	if (!rev) {
+		kref_put(&rp->kref, revocable_provider_release);
 		return NULL;
+	}
 
 	rev->rp = rp;
-	kref_get(&rp->kref);
-
 	return rev;
 }
 EXPORT_SYMBOL_GPL(revocable_alloc);
diff --git a/drivers/base/revocable_test.c b/drivers/base/revocable_test.c
index 873a44082b6c..1622aae92fd3 100644
--- a/drivers/base/revocable_test.c
+++ b/drivers/base/revocable_test.c
@@ -21,7 +21,7 @@
 
 static void revocable_test_basic(struct kunit *test)
 {
-	struct revocable_provider *rp;
+	struct revocable_provider __rcu *rp;
 	struct revocable *rev;
 	void *real_res = (void *)0x12345678, *res;
 
@@ -36,12 +36,13 @@ static void revocable_test_basic(struct kunit *test)
 	revocable_withdraw_access(rev);
 
 	revocable_free(rev);
-	revocable_provider_revoke(rp);
+	revocable_provider_revoke(&rp);
+	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
 }
 
 static void revocable_test_revocation(struct kunit *test)
 {
-	struct revocable_provider *rp;
+	struct revocable_provider __rcu *rp;
 	struct revocable *rev;
 	void *real_res = (void *)0x12345678, *res;
 
@@ -55,7 +56,8 @@ static void revocable_test_revocation(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
 	revocable_withdraw_access(rev);
 
-	revocable_provider_revoke(rp);
+	revocable_provider_revoke(&rp);
+	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
 
 	res = revocable_try_access(rev);
 	KUNIT_EXPECT_PTR_EQ(test, res, NULL);
@@ -66,7 +68,7 @@ static void revocable_test_revocation(struct kunit *test)
 
 static void revocable_test_try_access_macro(struct kunit *test)
 {
-	struct revocable_provider *rp;
+	struct revocable_provider __rcu *rp;
 	struct revocable *rev;
 	void *real_res = (void *)0x12345678, *res;
 
@@ -81,7 +83,8 @@ static void revocable_test_try_access_macro(struct kunit *test)
 		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
 	}
 
-	revocable_provider_revoke(rp);
+	revocable_provider_revoke(&rp);
+	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
 
 	{
 		REVOCABLE_TRY_ACCESS_WITH(rev, res);
@@ -93,7 +96,7 @@ static void revocable_test_try_access_macro(struct kunit *test)
 
 static void revocable_test_try_access_macro2(struct kunit *test)
 {
-	struct revocable_provider *rp;
+	struct revocable_provider __rcu *rp;
 	struct revocable *rev;
 	void *real_res = (void *)0x12345678, *res;
 	bool accessed;
@@ -111,7 +114,8 @@ static void revocable_test_try_access_macro2(struct kunit *test)
 	}
 	KUNIT_EXPECT_TRUE(test, accessed);
 
-	revocable_provider_revoke(rp);
+	revocable_provider_revoke(&rp);
+	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
 
 	accessed = false;
 	REVOCABLE_TRY_ACCESS_SCOPED(rev, res) {
diff --git a/include/linux/revocable.h b/include/linux/revocable.h
index 659ba01c58db..d5da3584adbe 100644
--- a/include/linux/revocable.h
+++ b/include/linux/revocable.h
@@ -13,12 +13,10 @@ struct device;
 struct revocable;
 struct revocable_provider;
 
-struct revocable_provider *revocable_provider_alloc(void *res);
-void revocable_provider_revoke(struct revocable_provider *rp);
-struct revocable_provider *devm_revocable_provider_alloc(struct device *dev,
-							 void *res);
+struct revocable_provider __rcu *revocable_provider_alloc(void *res);
+void revocable_provider_revoke(struct revocable_provider __rcu **rp);
 
-struct revocable *revocable_alloc(struct revocable_provider *rp);
+struct revocable *revocable_alloc(struct revocable_provider __rcu *rp);
 void revocable_free(struct revocable *rev);
 void *revocable_try_access(struct revocable *rev) __acquires(&rev->rp->srcu);
 void revocable_withdraw_access(struct revocable *rev) __releases(&rev->rp->srcu);
diff --git a/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c b/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c
index 1b0692eb75f3..ae6c67e65f3d 100644
--- a/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c
+++ b/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c
@@ -17,7 +17,7 @@
 static struct dentry *debugfs_dir;
 
 struct revocable_test_provider_priv {
-	struct revocable_provider *rp;
+	struct revocable_provider __rcu *rp;
 	struct dentry *dentry;
 	char res[16];
 };
@@ -25,7 +25,7 @@ struct revocable_test_provider_priv {
 static int revocable_test_consumer_open(struct inode *inode, struct file *filp)
 {
 	struct revocable *rev;
-	struct revocable_provider *rp = inode->i_private;
+	struct revocable_provider __rcu *rp = inode->i_private;
 
 	rev = revocable_alloc(rp);
 	if (!rev)
@@ -106,8 +106,8 @@ static int revocable_test_provider_release(struct inode *inode,
 	struct revocable_test_provider_priv *priv = filp->private_data;
 
 	debugfs_remove(priv->dentry);
-	if (priv->rp)
-		revocable_provider_revoke(priv->rp);
+	if (unrcu_pointer(priv->rp))
+		revocable_provider_revoke(&priv->rp);
 	kfree(priv);
 
 	return 0;
@@ -137,8 +137,8 @@ static ssize_t revocable_test_provider_write(struct file *filp,
 	 * gone.
 	 */
 	if (!strcmp(data, TEST_CMD_RESOURCE_GONE)) {
-		revocable_provider_revoke(priv->rp);
-		priv->rp = NULL;
+		revocable_provider_revoke(&priv->rp);
+		rcu_assign_pointer(priv->rp, NULL);
 	} else {
 		if (priv->res[0] != '\0')
 			return 0;
@@ -146,14 +146,15 @@ static ssize_t revocable_test_provider_write(struct file *filp,
 		strscpy(priv->res, data);
 
 		priv->rp = revocable_provider_alloc(&priv->res);
-		if (!priv->rp)
+		if (!unrcu_pointer(priv->rp))
 			return -ENOMEM;
 
 		priv->dentry = debugfs_create_file("consumer", 0400,
-						   debugfs_dir, priv->rp,
+						   debugfs_dir,
+						   unrcu_pointer(priv->rp),
 						   &revocable_test_consumer_fops);
 		if (!priv->dentry) {
-			revocable_provider_revoke(priv->rp);
+			revocable_provider_revoke(&priv->rp);
 			return -ENOMEM;
 		}
 	}
-- 
2.53.0.rc1.217.geba53bf80e-goog

