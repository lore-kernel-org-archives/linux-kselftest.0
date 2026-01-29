Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99FD305E2E;
	Thu, 29 Jan 2026 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769697488; cv=none; b=hAmZf2B051UBDT9klTE4PE8utYgrB/l+1Y+u4pdTbjjD0fLdWrFsFVflwQUVxPHOQQx56LFq4LQeKPw6Bp8RVMyx66zpHRKuuCG2Lri9Cw0oyITheAe0gyi9WOmJv2tTFGTeZoXXEukXrUurN4fzWRFljerpBHgC2o1+M06JrT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769697488; c=relaxed/simple;
	bh=oRiqfZx973OCISQ9UG3qJaNQvrA5pa5gYzVvCxDFQSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGSqhBO8fSsylqtxfZMlA8GmkevffJJvWvnsJeLt3dbX6VQdA+nwnQD3FDRPD2AfqUeBsXSP2wUd3T3DSxFvXVza2dT4vdgSQ7HQQueoF7SK3jl8m8y28E8BfvPHznzYyvepyCQOc0NH98Adv/qrKnz9gYasA0fqiVi4STxBFZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VH0fd2vs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VH0fd2vs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53450C2BC86;
	Thu, 29 Jan 2026 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769697488;
	bh=oRiqfZx973OCISQ9UG3qJaNQvrA5pa5gYzVvCxDFQSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VH0fd2vshJJ0nIksvD12zR3EzcUWOnnQ5XikiyuOAtrj7bJGHO+z2LWC4sboStBOm
	 xUUlk9rAyL1dbaEC1y5lGIyjIoSQKDFYpJavG7PUkczFYD0/NVgBTtVOg8vQEuBZLO
	 KCy3tovupg5YUHBBqFk5o/8zepyTmkZnfReCkETQdVEFem2AEGZXmGOYp7i6p9FxfV
	 gFZXwnbM2Hzb6626+FzeJ0w9NewBgio73A4QQqIaHWiwfyrIwnkDefId4QWtDsFnew
	 Mn3wAaQz0+C9RHMnCWgmj4N0kAQsktlSzSc+BJB1JyS3GQxOFHabXLGqtkhRTn+xI1
	 8ETVbF/FlDbPA==
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
Subject: [PATCH 3/4] revocable: fix SRCU index corruption by requiring caller-provided storage
Date: Thu, 29 Jan 2026 14:37:32 +0000
Message-ID: <20260129143733.45618-4-tzungbi@kernel.org>
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

The struct revocable handle stores the SRCU read-side index (idx) for
the duration of a resource access.  If multiple threads share the same
struct revocable instance, they race on writing to the idx field,
corrupting the SRCU state and potentially causing unsafe unlocks.

Refactor the API to replace revocable_alloc()/revocable_free() with
revocable_init()/revocable_deinit().  This change requires the caller
to provide the storage for struct revocable.

By moving storage ownership to the caller, the API ensures that
concurrent users maintain their own private idx storage, eliminating
the race condition.

Reported-by: Johan Hovold <johan@kernel.org>
Closes: https://lore.kernel.org/all/20260124170535.11756-4-johan@kernel.org/
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 .../driver-api/driver-model/revocable.rst     | 14 ++--
 drivers/base/revocable.c                      | 41 ++++-------
 drivers/base/revocable_test.c                 | 69 +++++++++----------
 include/linux/revocable.h                     | 54 ++++++++++-----
 .../revocable/test_modules/revocable_test.c   | 37 ++++------
 5 files changed, 102 insertions(+), 113 deletions(-)

diff --git a/Documentation/driver-api/driver-model/revocable.rst b/Documentation/driver-api/driver-model/revocable.rst
index ab7c0af5fbb6..350e7faeccdc 100644
--- a/Documentation/driver-api/driver-model/revocable.rst
+++ b/Documentation/driver-api/driver-model/revocable.rst
@@ -81,14 +81,14 @@ For Resource Providers
 
 For Resource Consumers
 ----------------------
-.. kernel-doc:: drivers/base/revocable.c
+.. kernel-doc:: include/linux/revocable.h
    :identifiers: revocable
 
 .. kernel-doc:: drivers/base/revocable.c
-   :identifiers: revocable_alloc
+   :identifiers: revocable_init
 
 .. kernel-doc:: drivers/base/revocable.c
-   :identifiers: revocable_free
+   :identifiers: revocable_deinit
 
 .. kernel-doc:: drivers/base/revocable.c
    :identifiers: revocable_try_access
@@ -104,11 +104,11 @@ Example Usage
 
 .. code-block:: c
 
-    void consumer_use_resource(struct revocable *rev)
+    void consumer_use_resource(struct revocable_provider *rp)
     {
         struct foo_resource *res;
 
-        REVOCABLE_TRY_ACCESS_WITH(rev, res);
+        REVOCABLE_TRY_ACCESS_WITH(rp, res);
         // Always check if the resource is valid.
         if (!res) {
             pr_warn("Resource is not available\n");
@@ -129,11 +129,11 @@ Example Usage
 
 .. code-block:: c
 
-    void consumer_use_resource(struct revocable *rev)
+    void consumer_use_resource(struct revocable_provider *rp)
     {
         struct foo_resource *res;
 
-        REVOCABLE_TRY_ACCESS_SCOPED(rev, res) {
+        REVOCABLE_TRY_ACCESS_SCOPED(rp, res) {
             // Always check if the resource is valid.
             if (!res) {
                 pr_warn("Resource is not available\n");
diff --git a/drivers/base/revocable.c b/drivers/base/revocable.c
index 1bcd1cf54764..8532ca6a371c 100644
--- a/drivers/base/revocable.c
+++ b/drivers/base/revocable.c
@@ -73,16 +73,6 @@ struct revocable_provider {
 	struct rcu_head rcu;
 };
 
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
 /**
  * revocable_provider_alloc() - Allocate struct revocable_provider.
  * @res: The pointer of resource.
@@ -145,20 +135,20 @@ void revocable_provider_revoke(struct revocable_provider __rcu **rp_ptr)
 EXPORT_SYMBOL_GPL(revocable_provider_revoke);
 
 /**
- * revocable_alloc() - Allocate struct revocable.
+ * revocable_init() - Initialize struct revocable.
  * @_rp: The pointer of resource provider.
+ * @rev: The pointer of resource consumer.
  *
  * This holds a refcount to the resource provider.
  *
- * Return: The pointer of struct revocable.  NULL on errors.
+ * Return: 0 on success, -errno otherwise.
  */
-struct revocable *revocable_alloc(struct revocable_provider __rcu *_rp)
+int revocable_init(struct revocable_provider __rcu *_rp, struct revocable *rev)
 {
 	struct revocable_provider *rp;
-	struct revocable *rev;
 
 	if (!_rp)
-		return NULL;
+		return -ENODEV;
 
 	/*
 	 * Enter a read-side critical section.
@@ -170,43 +160,36 @@ struct revocable *revocable_alloc(struct revocable_provider __rcu *_rp)
 		rp = rcu_dereference(_rp);
 		if (!rp)
 			/* The revocable provider has been revoked. */
-			return NULL;
+			return -ENODEV;
 
 		if (!kref_get_unless_zero(&rp->kref))
 			/*
 			 * The revocable provider is releasing (i.e.,
 			 * revocable_provider_release() has been called).
 			 */
-			return NULL;
+			return -ENODEV;
 	}
 	/* At this point, `rp` is safe to access as holding a kref of it */
 
-	rev = kzalloc(sizeof(*rev), GFP_KERNEL);
-	if (!rev) {
-		kref_put(&rp->kref, revocable_provider_release);
-		return NULL;
-	}
-
 	rev->rp = rp;
-	return rev;
+	return 0;
 }
-EXPORT_SYMBOL_GPL(revocable_alloc);
+EXPORT_SYMBOL_GPL(revocable_init);
 
 /**
- * revocable_free() - Free struct revocable.
+ * revocable_deinit() - Deinitialize struct revocable.
  * @rev: The pointer of struct revocable.
  *
  * This drops a refcount to the resource provider.  If it is the final
  * reference, revocable_provider_release() will be called to free the struct.
  */
-void revocable_free(struct revocable *rev)
+void revocable_deinit(struct revocable *rev)
 {
 	struct revocable_provider *rp = rev->rp;
 
 	kref_put(&rp->kref, revocable_provider_release);
-	kfree(rev);
 }
-EXPORT_SYMBOL_GPL(revocable_free);
+EXPORT_SYMBOL_GPL(revocable_deinit);
 
 /**
  * revocable_try_access() - Try to access the resource.
diff --git a/drivers/base/revocable_test.c b/drivers/base/revocable_test.c
index 7fc4d6a3dff6..a2818ec01298 100644
--- a/drivers/base/revocable_test.c
+++ b/drivers/base/revocable_test.c
@@ -15,7 +15,7 @@
  * - Try Access Macro: Same as "Revocation" but uses the
  *   REVOCABLE_TRY_ACCESS_WITH() and REVOCABLE_TRY_ACCESS_SCOPED().
  *
- * - Provider Use-after-free: Verifies revocable_alloc() correctly handles
+ * - Provider Use-after-free: Verifies revocable_init() correctly handles
  *   race conditions where the provider is being released.
  */
 
@@ -26,20 +26,21 @@
 static void revocable_test_basic(struct kunit *test)
 {
 	struct revocable_provider __rcu *rp;
-	struct revocable *rev;
+	struct revocable rev;
 	void *real_res = (void *)0x12345678, *res;
+	int ret;
 
 	rp = revocable_provider_alloc(real_res);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
 
-	rev = revocable_alloc(rp);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rev);
+	ret = revocable_init(rp, &rev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	res = revocable_try_access(rev);
+	res = revocable_try_access(&rev);
 	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
-	revocable_withdraw_access(rev);
+	revocable_withdraw_access(&rev);
 
-	revocable_free(rev);
+	revocable_deinit(&rev);
 	revocable_provider_revoke(&rp);
 	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
 }
@@ -47,43 +48,40 @@ static void revocable_test_basic(struct kunit *test)
 static void revocable_test_revocation(struct kunit *test)
 {
 	struct revocable_provider __rcu *rp;
-	struct revocable *rev;
+	struct revocable rev;
 	void *real_res = (void *)0x12345678, *res;
+	int ret;
 
 	rp = revocable_provider_alloc(real_res);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
 
-	rev = revocable_alloc(rp);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rev);
+	ret = revocable_init(rp, &rev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	res = revocable_try_access(rev);
+	res = revocable_try_access(&rev);
 	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
-	revocable_withdraw_access(rev);
+	revocable_withdraw_access(&rev);
 
 	revocable_provider_revoke(&rp);
 	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
 
-	res = revocable_try_access(rev);
+	res = revocable_try_access(&rev);
 	KUNIT_EXPECT_PTR_EQ(test, res, NULL);
-	revocable_withdraw_access(rev);
+	revocable_withdraw_access(&rev);
 
-	revocable_free(rev);
+	revocable_deinit(&rev);
 }
 
 static void revocable_test_try_access_macro(struct kunit *test)
 {
 	struct revocable_provider __rcu *rp;
-	struct revocable *rev;
 	void *real_res = (void *)0x12345678, *res;
 
 	rp = revocable_provider_alloc(real_res);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
 
-	rev = revocable_alloc(rp);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rev);
-
 	{
-		REVOCABLE_TRY_ACCESS_WITH(rev, res);
+		REVOCABLE_TRY_ACCESS_WITH(rp, res);
 		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
 	}
 
@@ -91,28 +89,22 @@ static void revocable_test_try_access_macro(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
 
 	{
-		REVOCABLE_TRY_ACCESS_WITH(rev, res);
+		REVOCABLE_TRY_ACCESS_WITH(rp, res);
 		KUNIT_EXPECT_PTR_EQ(test, res, NULL);
 	}
-
-	revocable_free(rev);
 }
 
 static void revocable_test_try_access_macro2(struct kunit *test)
 {
 	struct revocable_provider __rcu *rp;
-	struct revocable *rev;
 	void *real_res = (void *)0x12345678, *res;
 	bool accessed;
 
 	rp = revocable_provider_alloc(real_res);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
 
-	rev = revocable_alloc(rp);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rev);
-
 	accessed = false;
-	REVOCABLE_TRY_ACCESS_SCOPED(rev, res) {
+	REVOCABLE_TRY_ACCESS_SCOPED(rp, res) {
 		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
 		accessed = true;
 	}
@@ -122,32 +114,31 @@ static void revocable_test_try_access_macro2(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
 
 	accessed = false;
-	REVOCABLE_TRY_ACCESS_SCOPED(rev, res) {
+	REVOCABLE_TRY_ACCESS_SCOPED(rp, res) {
 		KUNIT_EXPECT_PTR_EQ(test, res, NULL);
 		accessed = true;
 	}
 	KUNIT_EXPECT_TRUE(test, accessed);
-
-	revocable_free(rev);
 }
 
 static void revocable_test_provider_use_after_free(struct kunit *test)
 {
 	struct revocable_provider __rcu *rp;
 	struct revocable_provider *old_rp;
+	struct revocable rev;
 	void *real_res = (void *)0x12345678;
-	struct revocable *rev;
+	int ret;
 
 	rp = revocable_provider_alloc(real_res);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
 
-	rev = revocable_alloc(NULL);
-	KUNIT_EXPECT_PTR_EQ(test, rev, NULL);
+	ret = revocable_init(NULL, &rev);
+	KUNIT_EXPECT_NE(test, ret, 0);
 
 	/* Simulate the provider has been freed. */
 	old_rp = rcu_replace_pointer(rp, NULL, 1);
-	rev = revocable_alloc(rp);
-	KUNIT_EXPECT_PTR_EQ(test, rev, NULL);
+	ret = revocable_init(rp, &rev);
+	KUNIT_EXPECT_NE(test, ret, 0);
 	rcu_replace_pointer(rp, old_rp, 1);
 
 	struct {
@@ -159,12 +150,14 @@ static void revocable_test_provider_use_after_free(struct kunit *test)
 
 	/* Simulate the provider is releasing. */
 	refcount_set(&rp_internal->kref.refcount, 0);
-	rev = revocable_alloc(rp);
-	KUNIT_EXPECT_PTR_EQ(test, rev, NULL);
+	ret = revocable_init(rp, &rev);
+	KUNIT_EXPECT_NE(test, ret, 0);
 	refcount_set(&rp_internal->kref.refcount, 1);
 
 	revocable_provider_revoke(&rp);
 	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
+	ret = revocable_init(rp, &rev);
+	KUNIT_EXPECT_NE(test, ret, 0);
 }
 
 static struct kunit_case revocable_test_cases[] = {
diff --git a/include/linux/revocable.h b/include/linux/revocable.h
index d5da3584adbe..e3d6d2c953a3 100644
--- a/include/linux/revocable.h
+++ b/include/linux/revocable.h
@@ -10,27 +10,46 @@
 #include <linux/cleanup.h>
 
 struct device;
-struct revocable;
 struct revocable_provider;
 
+/**
+ * struct revocable - A handle for resource consumer.
+ * @rp: The pointer of resource provider.
+ * @idx: The index for the RCU critical section.
+ */
+struct revocable {
+	struct revocable_provider *rp;
+	int idx;
+};
+
 struct revocable_provider __rcu *revocable_provider_alloc(void *res);
 void revocable_provider_revoke(struct revocable_provider __rcu **rp);
 
-struct revocable *revocable_alloc(struct revocable_provider __rcu *rp);
-void revocable_free(struct revocable *rev);
+int revocable_init(struct revocable_provider __rcu *rp, struct revocable *rev);
+void revocable_deinit(struct revocable *rev);
 void *revocable_try_access(struct revocable *rev) __acquires(&rev->rp->srcu);
 void revocable_withdraw_access(struct revocable *rev) __releases(&rev->rp->srcu);
 
-DEFINE_FREE(access_rev, struct revocable *, if (_T) revocable_withdraw_access(_T))
+DEFINE_FREE(access_rev, struct revocable *, {
+	if ((_T)->idx != -1)
+		revocable_withdraw_access(_T);
+	if ((_T)->rp)
+		revocable_deinit(_T);
+})
+
+#define _REVOCABLE_TRY_ACCESS_WITH(_rp, _rev, _res)				\
+	struct revocable _rev = {.rp = NULL, .idx = -1};			\
+	struct revocable *__UNIQUE_ID(name) __free(access_rev) = &_rev;		\
+	_res = revocable_init(_rp, &_rev) ? NULL : revocable_try_access(&_rev)
 
 /**
  * REVOCABLE_TRY_ACCESS_WITH() - A helper for accessing revocable resource
- * @_rev: The consumer's ``struct revocable *`` handle.
+ * @_rp: The provider's ``struct revocable_provider *`` handle.
  * @_res: A pointer variable that will be assigned the resource.
  *
  * The macro simplifies the access-release cycle for consumers, ensuring that
- * revocable_withdraw_access() is always called, even in the case of an early
- * exit.
+ * corresponding revocable_withdraw_access() and revocable_deinit() are called,
+ * even in the case of an early exit.
  *
  * It creates a local variable in the current scope.  @_res is populated with
  * the result of revocable_try_access().  The consumer code **must** check if
@@ -41,13 +60,15 @@ DEFINE_FREE(access_rev, struct revocable *, if (_T) revocable_withdraw_access(_T
  * are allowed before the helper.  Otherwise, the compiler fails with
  * "jump bypasses initialization of variable with __attribute__((cleanup))".
  */
-#define REVOCABLE_TRY_ACCESS_WITH(_rev, _res)					\
-	struct revocable *__UNIQUE_ID(name) __free(access_rev) = _rev;		\
-	_res = revocable_try_access(_rev)
+#define REVOCABLE_TRY_ACCESS_WITH(_rp, _res)					\
+	_REVOCABLE_TRY_ACCESS_WITH(_rp, __UNIQUE_ID(name), _res)
 
-#define _REVOCABLE_TRY_ACCESS_SCOPED(_rev, _label, _res)			\
-	for (struct revocable *__UNIQUE_ID(name) __free(access_rev) = _rev;	\
-	     (_res = revocable_try_access(_rev)) || true; ({ goto _label; }))	\
+#define _REVOCABLE_TRY_ACCESS_SCOPED(_rp, _rev, _label, _res)			\
+	for (struct revocable _rev = {.rp = NULL, .idx = -1},			\
+			      *__UNIQUE_ID(name) __free(access_rev) = &_rev;	\
+	     (_res = revocable_init(_rp, &_rev) ? NULL :			\
+		     revocable_try_access(&_rev)) || true;			\
+	     ({ goto _label; }))						\
 		if (0) {							\
 _label:										\
 			break;							\
@@ -55,13 +76,14 @@ _label:										\
 
 /**
  * REVOCABLE_TRY_ACCESS_SCOPED() - A helper for accessing revocable resource
- * @_rev: The consumer's ``struct revocable *`` handle.
+ * @_rp: The provider's ``struct revocable_provider *`` handle.
  * @_res: A pointer variable that will be assigned the resource.
  *
  * Similar to REVOCABLE_TRY_ACCESS_WITH() but with an explicit scope from a
  * temporary ``for`` loop.
  */
-#define REVOCABLE_TRY_ACCESS_SCOPED(_rev, _res)					\
-	_REVOCABLE_TRY_ACCESS_SCOPED(_rev, __UNIQUE_ID(label), _res)
+#define REVOCABLE_TRY_ACCESS_SCOPED(_rp, _res)					\
+	_REVOCABLE_TRY_ACCESS_SCOPED(_rp, __UNIQUE_ID(name),			\
+				     __UNIQUE_ID(label), _res)
 
 #endif /* __LINUX_REVOCABLE_H */
diff --git a/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c b/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c
index ae6c67e65f3d..a560ceda7318 100644
--- a/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c
+++ b/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c
@@ -24,23 +24,7 @@ struct revocable_test_provider_priv {
 
 static int revocable_test_consumer_open(struct inode *inode, struct file *filp)
 {
-	struct revocable *rev;
-	struct revocable_provider __rcu *rp = inode->i_private;
-
-	rev = revocable_alloc(rp);
-	if (!rev)
-		return -ENOMEM;
-	filp->private_data = rev;
-
-	return 0;
-}
-
-static int revocable_test_consumer_release(struct inode *inode,
-					   struct file *filp)
-{
-	struct revocable *rev = filp->private_data;
-
-	revocable_free(rev);
+	filp->private_data = inode->i_private;
 	return 0;
 }
 
@@ -48,25 +32,33 @@ static ssize_t revocable_test_consumer_read(struct file *filp,
 					    char __user *buf,
 					    size_t count, loff_t *offset)
 {
+	int ret;
 	char *res;
 	char data[16];
 	size_t len;
-	struct revocable *rev = filp->private_data;
+	struct revocable rev;
+	struct revocable_provider __rcu *rp = filp->private_data;
 
 	switch (*offset) {
 	case 0:
-		res = revocable_try_access(rev);
+		ret = revocable_init(rp, &rev);
+		if (ret) {
+			snprintf(data, sizeof(data), "%s", "(null)");
+			break;
+		}
+		res = revocable_try_access(&rev);
 		snprintf(data, sizeof(data), "%s", res ?: "(null)");
-		revocable_withdraw_access(rev);
+		revocable_withdraw_access(&rev);
+		revocable_deinit(&rev);
 		break;
 	case TEST_MAGIC_OFFSET:
 		{
-			REVOCABLE_TRY_ACCESS_WITH(rev, res);
+			REVOCABLE_TRY_ACCESS_WITH(rp, res);
 			snprintf(data, sizeof(data), "%s", res ?: "(null)");
 		}
 		break;
 	case TEST_MAGIC_OFFSET2:
-		REVOCABLE_TRY_ACCESS_SCOPED(rev, res)
+		REVOCABLE_TRY_ACCESS_SCOPED(rp, res)
 			snprintf(data, sizeof(data), "%s", res ?: "(null)");
 		break;
 	default:
@@ -83,7 +75,6 @@ static ssize_t revocable_test_consumer_read(struct file *filp,
 
 static const struct file_operations revocable_test_consumer_fops = {
 	.open = revocable_test_consumer_open,
-	.release = revocable_test_consumer_release,
 	.read = revocable_test_consumer_read,
 	.llseek = default_llseek,
 };
-- 
2.53.0.rc1.217.geba53bf80e-goog

