Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB519389DF3;
	Thu, 16 Jul 2026 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784182021; cv=none; b=Z0GhgFdG1ZYxQ6I+z1qC+zY0z+vGRDiNjSF9I/JKLui2UW1A/DKmoAI1an9mNY2AiSeefH8Rl82JXkzyfd7hMKBeBfG55gVFFB6098sj1AKBOGjtdEaTU8SFpAxbExFCmQcySd6n72bWVR8oDL4f2ZOpWqZMvekN48mo/OWPwhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784182021; c=relaxed/simple;
	bh=jg0hHfpGnwyHv03Z1hCwmgAUCXVb388LYJneIvskxlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fx3sqlF9dl9XZmDKcVM0FiOriFFzhdpNFVcQKrup68tvBn7xUsf3WaRrp7BSi0iSbVX5iTuPh0BTLqR0RL6cBfrWZt6XT3o6Ax8ARuaDc6Rdmof11u+CR2KVobs/r71rSzqZd2Gog1z5kkz3TPxW0AIDerm4RG4nJnRFDGM6MeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxW4gExI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxW4gExI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47E11F000E9;
	Thu, 16 Jul 2026 06:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784182019;
	bh=L27aDEOtIhuxLNy7MyEok9eUqvvl9O0jW79d0mjRuwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RxW4gExIw0hkM+y9+43pUo0apzAdH9+Qb/9FoLL5GHGZ05RliT4wgU1WTWs6Uxivi
	 WqHTzFM1UoFcMcerlgoF318CQ+/kz7I6n63yQ+dHxEGpZFRVvuNmqcXpE91sI3xAvJ
	 3U4AnR6HCUeBkd+w1r3vRcmECoOq6I5+twvEdZuk3jxYgherC6TUXn7UL6tJAPhSCj
	 BXcuYon06k5QjBjWRqedNuCPlbaJRJkfEj3Y2QaQPG3+byDEQCExgGx4NR8hMOp+Ox
	 IoChYAsdQ4ZAeWx/D6Irzkq3zhxDqvXChQo7b2nQmPnROsn1lcrzdjSE6ASgMx/GT8
	 DrAbW8UTlbfxA==
Date: Thu, 16 Jul 2026 09:06:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Matlack <dmatlack@google.com>,
	Luca Boccassi <luca.boccassi@gmail.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: [RFC PATCH] liveupdate: Allow multiple openers for
 /dev/liveupdate
Message-ID: <alh0_aCbZITvSaox@kernel.org>
References: <20260714190356.190328-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714190356.190328-1-dmatlack@google.com>

(adding Luca for systemd POV)

On Tue, Jul 14, 2026 at 07:03:56PM +0000, David Matlack wrote:
> Remove the single-opener restriction for /dev/liveupdate by removing the
> atomic in_use tracking and the exclusive open check in luo_open() that
> returned -EBUSY. Protect luo_session_deserialize() with a mutex guard so
> that concurrent open attempts by multiple processes safely executes
> deserialization only once. Update liveupdate selftest to verify that
> multiple concurrent openers succeed.
> 
> LUO does not inherently require a single opener. There is some
> documentation about it simplifying state management, but the only thing
> it actually protects is the session deserialization during first open,
> which can be easily handled with a mutex.
> 
> Relaxing the single-opener requirement avoids the kernel forcing a
> design pattern on userspace that it itself does not require, e.g.
> allowing multiple userspace processes to create and manage sessions.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Samiullah Khawaja <skhawaja@google.com>
> 
>  kernel/liveupdate/luo_core.c                  | 46 +++----------------
>  kernel/liveupdate/luo_session.c               |  8 +++-
>  .../testing/selftests/liveupdate/liveupdate.c | 14 +++---
>  3 files changed, 18 insertions(+), 50 deletions(-)
> 
> diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
> index 1b2bda22902d..931bb79da276 100644
> --- a/kernel/liveupdate/luo_core.c
> +++ b/kernel/liveupdate/luo_core.c
> @@ -254,19 +254,8 @@ bool liveupdate_enabled(void)
>   * which allows a userspace agent to manage the LUO state machine and its
>   * associated resources, such as preservable file descriptors.
>   *
> - * To ensure that the state machine is controlled by a single entity, access
> - * to this device is exclusive: only one process is permitted to have
> - * ``/dev/liveupdate`` open at any given time. Subsequent open attempts will
> - * fail with -EBUSY until the first process closes its file descriptor.
> - * This singleton model simplifies state management by preventing conflicting
> - * commands from multiple userspace agents.
>   */
>  
> -struct luo_device_state {
> -	struct miscdevice miscdev;
> -	atomic_t in_use;
> -};
> -
>  static int luo_ioctl_create_session(struct luo_ucmd *ucmd)
>  {
>  	struct liveupdate_ioctl_create_session *argp = ucmd->cmd;
> @@ -329,28 +318,9 @@ static int luo_ioctl_retrieve_session(struct luo_ucmd *ucmd)
>  
>  static int luo_open(struct inode *inodep, struct file *filep)
>  {
> -	struct luo_device_state *ldev = container_of(filep->private_data,
> -						     struct luo_device_state,
> -						     miscdev);
> -
> -	if (atomic_cmpxchg(&ldev->in_use, 0, 1))
> -		return -EBUSY;
> -
>  	/* Always return -EIO to user if deserialization fail */
> -	if (luo_session_deserialize()) {
> -		atomic_set(&ldev->in_use, 0);
> +	if (luo_session_deserialize())
>  		return -EIO;
> -	}
> -
> -	return 0;
> -}
> -
> -static int luo_release(struct inode *inodep, struct file *filep)
> -{
> -	struct luo_device_state *ldev = container_of(filep->private_data,
> -						     struct luo_device_state,
> -						     miscdev);
> -	atomic_set(&ldev->in_use, 0);
>  
>  	return 0;
>  }
> @@ -419,17 +389,13 @@ static long luo_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>  static const struct file_operations luo_fops = {
>  	.owner		= THIS_MODULE,
>  	.open		= luo_open,
> -	.release	= luo_release,
>  	.unlocked_ioctl	= luo_ioctl,
>  };
>  
> -static struct luo_device_state luo_dev = {
> -	.miscdev = {
> -		.minor = MISC_DYNAMIC_MINOR,
> -		.name  = "liveupdate",
> -		.fops  = &luo_fops,
> -	},
> -	.in_use = ATOMIC_INIT(0),
> +static struct miscdevice luo_dev = {
> +	.minor = MISC_DYNAMIC_MINOR,
> +	.name  = "liveupdate",
> +	.fops  = &luo_fops,
>  };
>  
>  static int __init liveupdate_ioctl_init(void)
> @@ -437,6 +403,6 @@ static int __init liveupdate_ioctl_init(void)
>  	if (!liveupdate_enabled())
>  		return 0;
>  
> -	return misc_register(&luo_dev.miscdev);
> +	return misc_register(&luo_dev);
>  }
>  late_initcall(liveupdate_ioctl_init);
> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> index b79b2a488974..ca4d0639d39a 100644
> --- a/kernel/liveupdate/luo_session.c
> +++ b/kernel/liveupdate/luo_session.c
> @@ -584,13 +584,17 @@ static int luo_session_deserialize_one(struct luo_session_header *sh,
>  
>  int luo_session_deserialize(void)
>  {
> -	struct luo_session_header *sh = &luo_session_global.incoming;
> +	static DEFINE_MUTEX(luo_session_deserialize_lock);
>  	static bool is_deserialized;
> +	static int saved_err;
> +
> +	struct luo_session_header *sh = &luo_session_global.incoming;
>  	struct luo_session_ser *ser;
>  	struct kho_block_set_it it;
> -	static int saved_err;
>  	int err;
>  
> +	guard(mutex)(&luo_session_deserialize_lock);
> +
>  	/* If has been deserialized, always return the same error code */
>  	if (is_deserialized)
>  		return saved_err;
> diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
> index 502fb3567e38..a8e1a8911849 100644
> --- a/tools/testing/selftests/liveupdate/liveupdate.c
> +++ b/tools/testing/selftests/liveupdate/liveupdate.c
> @@ -11,7 +11,7 @@
>   * /dev/liveupdate character device and its session management capabilities.
>   *
>   * Tests include:
> - * - Device access: basic open/close, and enforcement of exclusive access.
> + * - Device access: basic open/close, and support for multiple openers.
>   * - Session management: creation of unique sessions, and duplicate name detection.
>   * - Resource preservation: successfully preserving individual and multiple memfds,
>   *   verifying contents remain accessible.
> @@ -70,13 +70,12 @@ TEST_F(liveupdate_device, basic_open_close)
>  }
>  
>  /*
> - * Test Case: Exclusive Open Enforcement
> + * Test Case: Multiple Open Support
>   *
> - * Verifies that the /dev/liveupdate device can only be opened by one process
> - * at a time. It checks that a second attempt to open the device fails with
> - * the EBUSY error code.
> + * Verifies that the /dev/liveupdate device can be opened by multiple openers
> + * concurrently without errors.
>   */
> -TEST_F(liveupdate_device, exclusive_open)
> +TEST_F(liveupdate_device, multiple_open)
>  {
>  	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
>  
> @@ -85,8 +84,7 @@ TEST_F(liveupdate_device, exclusive_open)
>  
>  	ASSERT_GE(self->fd1, 0);
>  	self->fd2 = open(LIVEUPDATE_DEV, O_RDWR);
> -	EXPECT_LT(self->fd2, 0);
> -	EXPECT_EQ(errno, EBUSY);
> +	ASSERT_GE(self->fd2, 0);
>  }
>  
>  /* Helper function to create a LUO session via ioctl. */
> 
> base-commit: 10fd52dc7bbd6013e949ff1833be0821b7553fb0
> -- 
> 2.55.0.141.g00534a21ce-goog
> 

-- 
Sincerely yours,
Mike.
