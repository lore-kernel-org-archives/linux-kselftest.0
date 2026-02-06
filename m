Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0182D2264D9;
	Fri,  6 Feb 2026 22:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770415365; cv=none; b=Z2gRSu88NA526c+X+ywOpAzNVFi5I5xoi/jNDjA3Ozj/QxR2h7JVmwbUb9h1wEQkhjOwzmqsbPlXzHVhKzfprJ0k8xRI4rmGhwaOfJliSmaVejnzwuD0K8kFqnHes9MtTBQFFaX5EKlt72ojzHH9GomGPKO9cDClBoBNFKyX4nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770415365; c=relaxed/simple;
	bh=bfPUMs2b42VX42YQ1nfGegyoQworNugo/zCJtYGGP3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTxFZf6y2ywiCa7v3tuY5ThEr0YSdU5t9F5SxJjvare5j+VVJwG6dtEXmH6/QceyqYExxltiUWTD6jg3oqHZD/48PnmiDYhbZrFtFI69tO2ulTjZCbiVq1vITF3fCXO0hCYp/ecGmzNCeevNjAWZBm6Lu0Zt3qUMd3dI0jZL6KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5lNQAGP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5lNQAGP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22C6C116C6;
	Fri,  6 Feb 2026 22:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770415364;
	bh=bfPUMs2b42VX42YQ1nfGegyoQworNugo/zCJtYGGP3M=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=m5lNQAGPw4lfc9EU6KMQLYf4GvC5QUtL4EmGcfqHX3kyv1EgRLJAsPMMLRmetZETB
	 Py4hL0wyqbotb889upEQTYijoAKtK3xNpDPOBvYcKKDeoFVq9j/PG04wuzjqHMlXkm
	 fLJIureI8XXAt0xkRxkPi4ApRgXQ3dizqGr0Vry6g8Z7nUZS1aUIp+1+I8TtFi1dkQ
	 ZGLaImNn5OhMije3K+CGQPHAY7l/LL5wJhV0oVT/yWbakcBYROJ688LXNWCSQoVb9I
	 18B0rkEmGrxe85jUXQ05Z2C8Bv9SvpvhuYEvb8EaCWNLzPsj26vrIz4xzrZ9Yu6V88
	 X35JGr6jhZmZg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 29797CE0F9F; Fri,  6 Feb 2026 14:02:44 -0800 (PST)
Date: Fri, 6 Feb 2026 14:02:44 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] revocable: hide the implementation details from users
Message-ID: <fc68da89-7c2b-432b-9a78-6ab55fcb0e9e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260206103216.38623-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206103216.38623-1-bartosz.golaszewski@oss.qualcomm.com>

On Fri, Feb 06, 2026 at 11:32:06AM +0100, Bartosz Golaszewski wrote:
> Revocable stacks two layers of SRCU on top of each other: one to protect
> the actual revocable resource and another to synchronize the revoking.
> While this design itself is questionable, it also forces the user of
> revokable to think about the implementation details and annotate the
> pointer holding the address of the revocable_provider struct with __rcu.
> Hide the real type of struct revokable_provider behind a typedef to free
> the users from this responsability. While adding new typedefs goes
> against current guidelines, it's still better than the current
> requirement.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> I realized that one important person was missing from the whole review
> process: Paul E. McKenney who wrote and maintains SRCU. I had Paul look
> at the SRCU usage in GPIO and I think he should have also signed off on
> revocable before it got queued.
> 
> Paul: I'm Cc'ing you on this patch to bring revocable to your attention.
> The series that implemented it and made its way into v7.0 is here:
> 
>   https://lore.kernel.org/all/20260116080235.350305-1-tzungbi@kernel.org/
> 
> Could you please take a look and say if the design looks sane to you?
> Especially the double SRCU on the revocable_provider.

The first patch in the above URL adds SRCU, and the other
two add various tests.  I do not see a double SRCU, just an
srcu_read_lock() in revocable_try_access() and an srcu_read_unlock()
in revocable_withdraw_access().

You are allowed to nest srcu_read_lock(), if that is what you are asking.
*However*, nesting revocable_try_access() on the same revocable structure
is buggy because the second call to revocable_try_access() would overwrite
the rp->srcu value written by the first call.  This could result in both
SRCU grace-period hangs and too-short SRCU grace periods, more likely
the former than the latter.

Or do you mean something else by "double SRCU"?

							Thanx, Paul

>  drivers/base/revocable.c                           |  8 ++++----
>  drivers/base/revocable_test.c                      | 14 +++++++-------
>  include/linux/revocable.h                          |  8 +++++---
>  .../base/revocable/test_modules/revocable_test.c   |  4 ++--
>  4 files changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/base/revocable.c b/drivers/base/revocable.c
> index 8532ca6a371c..02dd3ec2c9ad 100644
> --- a/drivers/base/revocable.c
> +++ b/drivers/base/revocable.c
> @@ -82,7 +82,7 @@ struct revocable_provider {
>   * Return: The pointer of struct revocable_provider.  NULL on errors.
>   * It enforces the caller handles the returned pointer in RCU ways.
>   */
> -struct revocable_provider __rcu *revocable_provider_alloc(void *res)
> +revocable_provider_t revocable_provider_alloc(void *res)
>  {
>  	struct revocable_provider *rp;
>  
> @@ -94,7 +94,7 @@ struct revocable_provider __rcu *revocable_provider_alloc(void *res)
>  	RCU_INIT_POINTER(rp->res, res);
>  	kref_init(&rp->kref);
>  
> -	return (struct revocable_provider __rcu *)rp;
> +	return (revocable_provider_t)rp;
>  }
>  EXPORT_SYMBOL_GPL(revocable_provider_alloc);
>  
> @@ -120,7 +120,7 @@ static void revocable_provider_release(struct kref *kref)
>   * It enforces the caller to pass a pointer of pointer of resource provider so
>   * that it sets \*rp_ptr to NULL to prevent from keeping a dangling pointer.
>   */
> -void revocable_provider_revoke(struct revocable_provider __rcu **rp_ptr)
> +void revocable_provider_revoke(revocable_provider_t *rp_ptr)
>  {
>  	struct revocable_provider *rp;
>  
> @@ -143,7 +143,7 @@ EXPORT_SYMBOL_GPL(revocable_provider_revoke);
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -int revocable_init(struct revocable_provider __rcu *_rp, struct revocable *rev)
> +int revocable_init(revocable_provider_t _rp, struct revocable *rev)
>  {
>  	struct revocable_provider *rp;
>  
> diff --git a/drivers/base/revocable_test.c b/drivers/base/revocable_test.c
> index 27f5d7d96f4b..732197c887ef 100644
> --- a/drivers/base/revocable_test.c
> +++ b/drivers/base/revocable_test.c
> @@ -30,7 +30,7 @@
>  
>  static void revocable_test_basic(struct kunit *test)
>  {
> -	struct revocable_provider __rcu *rp;
> +	revocable_provider_t rp;
>  	struct revocable rev;
>  	void *real_res = (void *)0x12345678, *res;
>  	int ret;
> @@ -52,7 +52,7 @@ static void revocable_test_basic(struct kunit *test)
>  
>  static void revocable_test_revocation(struct kunit *test)
>  {
> -	struct revocable_provider __rcu *rp;
> +	revocable_provider_t rp;
>  	struct revocable rev;
>  	void *real_res = (void *)0x12345678, *res;
>  	int ret;
> @@ -79,7 +79,7 @@ static void revocable_test_revocation(struct kunit *test)
>  
>  static void revocable_test_try_access_macro(struct kunit *test)
>  {
> -	struct revocable_provider __rcu *rp;
> +	revocable_provider_t rp;
>  	void *real_res = (void *)0x12345678, *res;
>  
>  	rp = revocable_provider_alloc(real_res);
> @@ -101,7 +101,7 @@ static void revocable_test_try_access_macro(struct kunit *test)
>  
>  static void revocable_test_try_access_macro2(struct kunit *test)
>  {
> -	struct revocable_provider __rcu *rp;
> +	revocable_provider_t rp;
>  	void *real_res = (void *)0x12345678, *res;
>  	bool accessed;
>  
> @@ -128,7 +128,7 @@ static void revocable_test_try_access_macro2(struct kunit *test)
>  
>  static void revocable_test_provider_use_after_free(struct kunit *test)
>  {
> -	struct revocable_provider __rcu *rp;
> +	revocable_provider_t rp;
>  	struct revocable_provider *old_rp;
>  	struct revocable rev;
>  	void *real_res = (void *)0x12345678;
> @@ -167,7 +167,7 @@ static void revocable_test_provider_use_after_free(struct kunit *test)
>  
>  struct test_concurrent_access_context {
>  	struct kunit *test;
> -	struct revocable_provider __rcu *rp;
> +	revocable_provider_t rp;
>  	struct revocable rev;
>  	struct completion started, enter, exit;
>  	struct task_struct *thread;
> @@ -206,7 +206,7 @@ static int test_concurrent_access_consumer(void *data)
>  
>  static void revocable_test_concurrent_access(struct kunit *test)
>  {
> -	struct revocable_provider __rcu *rp;
> +	revocable_provider_t rp;
>  	void *real_res = (void *)0x12345678;
>  	struct test_concurrent_access_context *ctx;
>  	int ret, i;
> diff --git a/include/linux/revocable.h b/include/linux/revocable.h
> index e3d6d2c953a3..f0aea6f56a25 100644
> --- a/include/linux/revocable.h
> +++ b/include/linux/revocable.h
> @@ -12,6 +12,8 @@
>  struct device;
>  struct revocable_provider;
>  
> +typedef struct revocable_provider __rcu *revocable_provider_t;
> +
>  /**
>   * struct revocable - A handle for resource consumer.
>   * @rp: The pointer of resource provider.
> @@ -22,10 +24,10 @@ struct revocable {
>  	int idx;
>  };
>  
> -struct revocable_provider __rcu *revocable_provider_alloc(void *res);
> -void revocable_provider_revoke(struct revocable_provider __rcu **rp);
> +revocable_provider_t revocable_provider_alloc(void *res);
> +void revocable_provider_revoke(revocable_provider_t *rp);
>  
> -int revocable_init(struct revocable_provider __rcu *rp, struct revocable *rev);
> +int revocable_init(revocable_provider_t rp, struct revocable *rev);
>  void revocable_deinit(struct revocable *rev);
>  void *revocable_try_access(struct revocable *rev) __acquires(&rev->rp->srcu);
>  void revocable_withdraw_access(struct revocable *rev) __releases(&rev->rp->srcu);
> diff --git a/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c b/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c
> index a560ceda7318..30cc9c145725 100644
> --- a/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c
> +++ b/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c
> @@ -17,7 +17,7 @@
>  static struct dentry *debugfs_dir;
>  
>  struct revocable_test_provider_priv {
> -	struct revocable_provider __rcu *rp;
> +	revocable_provider_t rp;
>  	struct dentry *dentry;
>  	char res[16];
>  };
> @@ -37,7 +37,7 @@ static ssize_t revocable_test_consumer_read(struct file *filp,
>  	char data[16];
>  	size_t len;
>  	struct revocable rev;
> -	struct revocable_provider __rcu *rp = filp->private_data;
> +	revocable_provider_t rp = filp->private_data;
>  
>  	switch (*offset) {
>  	case 0:
> -- 
> 2.47.3
> 
