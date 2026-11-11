Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395940;
	b=1nblDouqVchvfj8+4ygDkKRFFqNwOnisvjt5HcLSVEDxi+RxBVZl2ZQHnHRvvgpz7BHZ
	 GWnIgIqvpxZWOtot4j3AoPSLWjnimuhTyFB82otFuk964H3jvslKQpTAmR6lHGIFv+p2q
	 sXnbgoth8u3nKUl8ClUNz6TQvrtwOtQpbRW1uklEaBHUvVPHqextOT1s0rB3bP7qE8eG/
	 LWPrIp6n4RKE5dIs2cogEK23kvfzSMEQtlk5RT/zVJTJkTi6TdrqeG/zMJbpg9A0jvjsU
	 25NSb0/Lt6eYdbKDlPOSZN+OBV0u6M4z5A1sO8I3jdhRltRncPQBeISoAVOPACWIbJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395940;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=jyQ9oXJqyRV2PK6xmrLBDNVxBhe05N3TbbbdEicnpsM=;
	b=wGnXSbyK+5EMSll9sRPc5L6SvoeBMahsNxKuIQXygPF+tO3uX6Mru4GMJLZlSmNzeNQl
	 eGZOH+7vXW5F6lBtayAqR1tCZXdQS/axT3ZO//AHKueVhMfeJWTk+1nDI5RwpcZ8atPoO
	 Raif8SdaQnD80qYnA1rfZ9RyusMaeokcPL47VZQFhDXEYTs1FBHaC8ymu2ULjUOmaQ9na
	 JkfxyPhrIdjMzeeTWfyOSbQ1OOCIIO9pMhMlbNWqggVMmlHvKC51i24aF+c4q5bAVtPGg
	 XFTTIEqXeURFE6WWB75R8Wmuk8Ij6S8lXseauntkWM+f+BnjszV6Iapa9HVnvd83Rgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ewLo9oO6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C87606A332;
	Wed, 11 Nov 2026 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ewLo9oO6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9371F00A06;
	Wed, 11 Nov 2026 11:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395939;
	bh=jyQ9oXJqyRV2PK6xmrLBDNVxBhe05N3TbbbdEicnpsM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ewLo9oO6TLopmAVEFkiTyD0JvqqL2S5hA/vr8gQqfQ9ijUq4G5DynSGkxODqE7Us8
	 LhXrMUlllSQ0gjeQvGrDU978hZSQwkPlwv76hUJNeAsGOUcHzK4GhgOENOfu4OTCNl
	 2mYL4CR7c0reeZ0ExxMmpkT14g5CMTj4IlTsqcv58VAZUCsE9fdL23s0Kt/smTTvHJ
	 BmdfvSW1GLMVCh9NnH0D472+QKMsk3NL+HAcmNv2ed9ZGzlS+/J66zZ86NjJv5RDrq
	 YOBnWAJA5zStaoFtpwoMGzk/XS2SU01pbNbMhJ6YT60Bxu9yfQdtChE+U2YS+cUrAt
	 n7dlpzl9/WZPw==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 4/6] liveupdate: luo_flb: support incremental
 outgoing FLB publication
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 linux-mm@kvack.org, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
 vipinsh@google.com, linux-kernel@vger.kernel.org, corbet@lwn.net, 
 dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
 rdunlap@infradead.org, graf@amazon.com
In-Reply-To: <20261105050053.3063001-5-pasha.tatashin@soleen.com>
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
 <20261105050053.3063001-5-pasha.tatashin@soleen.com>
Date: Wed, 11 Nov 2026 13:18:40 +0200
Message-Id: <179439592041.425130.7284974054491864276.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi,

> When a session is published to KHO via luo_session_publish_one() ahead
> of reboot, any FLBs that its preserved files depend on must already be
> present in the outgoing KHO FLB array so the KHO tree remains
> self-consistent.
> 
> Currently, outgoing FLB metadata in luo_ser->flbs_pa is populated only
> during reboot by luo_flb_serialize(), leaving luo_ser->flbs_pa empty
> when sessions are published earlier.
> 
> Publish outgoing FLBs from luo_session_publish_one() via
> luo_file_publish_flbs() -> luo_flb_file_publish() ->
> luo_flb_ser_publish_one(), and drop the now-redundant
> luo_flb_serialize() pass from liveupdate_reboot(). For each published

Oh, my :(
Why do we care about exact long call sequence here?

> file, luo_flb_ser_publish_one() either appends a new luo_flb_ser entry
> with count = 1 using smp_store_release() on header_ser->count or
> increments the existing entry's count in place, keeping the serialized
> count equal to the exact number of published files in KHO without
> including uncommitted sessions or transient
> liveupdate_flb_get_outgoing() references.

Got tired here, the prose needs a lot of human touch.

> FLB publication is one-way and never needs to unpublish: before reboot
> it runs only when a session is committed, and a committed session never
> unpreserves its files, keeping private->outgoing.count >= 1 until
> reboot so flb->ops->unpreserve() is never called on a published FLB.
> If more FDs using an already-published FLB are preserved later,
> flb->ops->preserve() is not called again; file handlers update the
> shared live object via liveupdate_flb_get_outgoing(). Consequently, FLB
> handlers must:
> - return a stable root KHO handle in argp->data from .preserve() whose
>   address does not change as FDs are added later;
> - synchronize concurrent mutations to outgoing.obj with their own lock;
> - support per-FD rollback when uncommitted sessions close without
>   disturbing already-committed entries.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  kernel/liveupdate/luo_core.c     |  10 +--
>  kernel/liveupdate/luo_file.c     |  16 +++++
>  kernel/liveupdate/luo_flb.c      | 111 ++++++++++++++++++++-----------
>  kernel/liveupdate/luo_internal.h |   3 +-
>  kernel/liveupdate/luo_session.c  |   2 +
>  5 files changed, 95 insertions(+), 47 deletions(-)
>
> diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
> index 1b2bda22902d2..9fef5161a1f3d 100644
> --- a/kernel/liveupdate/luo_core.c
> +++ b/kernel/liveupdate/luo_core.c
> @@ -219,18 +219,10 @@ late_initcall(luo_late_startup);
>   */
>  int liveupdate_reboot(void)
>  {
> -	int err;
> -
>  	if (!liveupdate_enabled())
>  		return 0;
>  
> -	err = luo_session_serialize();
> -	if (err)
> -		return err;
> -
> -	luo_flb_serialize();
> -
> -	return 0;
> +	return luo_session_serialize();

I suppose the wall of text above describes why you change this.

>  }
>  
>  /**
> diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
> index 988eb313a135f..611b9967a3a91 100644
> --- a/kernel/liveupdate/luo_file.c
> +++ b/kernel/liveupdate/luo_file.c
> @@ -380,6 +380,22 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
>  	kho_block_set_destroy(&file_set->block_set);
>  }
>  
> +/**
> + * luo_file_publish_flbs - Publish FLBs for all preserved files in a file_set.
> + * @file_set: The file_set being published to the outgoing KHO subtree.
> + *
> + * Iterates through all preserved files in @file_set and ensures their
> + * associated FLB metadata is published in the outgoing KHO FLB array before
> + * the session itself becomes visible in KHO.
> + */
> +void luo_file_publish_flbs(struct luo_file_set *file_set)
> +{
> +	struct luo_file *luo_file;
> +
> +	list_for_each_entry(luo_file, &file_set->files_list, list)
> +		luo_flb_file_publish(luo_file->fh);
> +}
> +
>  static int luo_file_freeze_one(struct luo_file_set *file_set,
>  			       struct luo_file *luo_file)
>  {
> diff --git a/kernel/liveupdate/luo_flb.c b/kernel/liveupdate/luo_flb.c
> index cd715a7c1d992..6cd87a9f8307d 100644
> --- a/kernel/liveupdate/luo_flb.c
> +++ b/kernel/liveupdate/luo_flb.c
> @@ -34,6 +34,15 @@
>   * This reference-counted approach ensures that shared state is saved exactly
>   * once and restored exactly once, regardless of how many files depend on it,
>   * and that its lifecycle is correctly managed across the kexec transition.
> + *
> + * Serialization: Outgoing FLB metadata is published into the KHO FLB array
> + * incrementally as sessions are published to KHO (when committed early via
> + * LIVEUPDATE_SESSION_FREEZE_COMMIT or during reboot). Because a committed
> + * session never unpreserves its files, FLB publication is one-way: once
> + * published, the FLB's .unpreserve() callback is never invoked and its root
> + * KHO handle from .preserve() remains immutable in KHO, while later sessions
> + * may still add or remove per-FD state in the shared live object under the FLB
> + * handler's own synchronization.
>   */


>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> @@ -72,6 +81,13 @@ static struct luo_flb_global luo_flb_global = {
>  	.list = LIST_HEAD_INIT(luo_flb_global.list),
>  };
>  
> +/*
> + * Serializes updates to luo_flb_global.outgoing.header_ser and .ser[].
> + * Lock hierarchy:
> + *   luo_register_rwlock -> private->outgoing.lock -> luo_flb_ser_lock
> + */
> +static DEFINE_MUTEX(luo_flb_ser_lock);
> +
>  /*
>   * struct luo_flb_link - Links an FLB definition to a file handler's internal
>   * list of dependencies.
> @@ -104,6 +120,36 @@ static struct luo_flb_private *luo_flb_get_private(struct liveupdate_flb *flb)
>  	return private;
>  }
>  
> +static void luo_flb_ser_publish_one(const struct liveupdate_flb *flb, u64 data)
> +{
> +	struct luo_flb_header *fh = &luo_flb_global.outgoing;
> +	u64 nr;
> +
> +	guard(mutex)(&luo_flb_ser_lock);
> +	if (!fh->active)
> +		return;
> +
> +	nr = fh->header_ser->count;
> +	for (u64 i = 0; i < nr; i++) {
> +		if (!strcmp(fh->ser[i].name, flb->compatible)) {
> +			WRITE_ONCE(fh->ser[i].count, fh->ser[i].count + 1);

An LLM says:

  Why the WRITE_ONCE()? All writers hold luo_flb_ser_lock, and nobody reads
  this before kexec.

> +			return;
> +		}
> +	}
> +
> +	if (WARN_ON_ONCE(nr >= LUO_FLB_MAX))
> +		return;
> +
> +	strscpy(fh->ser[nr].name, flb->compatible, sizeof(fh->ser[nr].name));
> +	fh->ser[nr].data = data;
> +	fh->ser[nr].count = 1;
> +	/*
> +	 * Ensure the serialized FLB entry is visible before exposing the
> +	 * incremented count to concurrent KHO readers.
> +	 */
> +	smp_store_release(&fh->header_ser->count, nr + 1);

An LLM says:

  And this release store pairs with nothing.

-- 
Sincerely yours,
Mike.

