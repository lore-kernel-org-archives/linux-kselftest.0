Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740461;
	b=So7I5F0UEC5zcD2VQqmBEfleEHlLsZzvcXPw+ZRInPyM+IBsE1BVc5hWZh+QVKix3DEm
	 L1R5PT2iW7v2+mSwRVa814aZElsKIU4h0yfbVj+UlOCDMOvMGkOL/MHctbI4ylMxg80R+
	 4VKOR3jiO7fmtP+lb9JFvel2aeSnbVSIrJOmaqj/KyQ3zYLSBwW+UYxcGvUxDRmTkemxk
	 FDB2vVRQex05xMRqw3cFQCAV8uybZjINcjFfg9zbaDlpZ661UK769EpBfQbI81Y5Lu1th
	 9FxKPjiDBPO7LmdeLAeOGXQ0akiMw05rcdknnyCXyKkba9PCWFwk9huasGPMYG03Isw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740461;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Bt3g7cG/T+dUsUClX1/GlTBepGeumJSA4Ti6aIN23uo=;
	b=EH1H+xSx7fHy/MTJsYIB5s2TwZGR/Bkcg966SbRIUEAbnAaAgE4b/ClxIsAWXtqE3NkP
	 kKnxn18Xl9BF8/MM5rytZad9mNmS43XN8jmHFgfbXt9CEAOT08fchNgxWIc8Mdyquc+ct
	 dKp6R0dJC++aIqWn/iKqKtwrvBASVyJfWG2WrI2kscWRdBPqjRMHMcbK8sUuR0hln0mHj
	 CyQkshFT1fpt0UJM4bsPmOHfZusW//OO2fxLEuVSCGCbdirh5VC4kq3eVmXmh+/6+oh1W
	 IQogHC+0wE6SLPOdkfHHxlthW2mpUk/YaToadYWCzVDdkdXqRrhopekXo59xbZItlsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WFM7byuF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302DA606A31A;
	Fri, 23 Oct 2026 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WFM7byuF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431B21F01825;
	Fri, 23 Oct 2026 07:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792740460;
	bh=Bt3g7cG/T+dUsUClX1/GlTBepGeumJSA4Ti6aIN23uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WFM7byuFQdos23jYHwQymyRwbRbvu75+SI/zKK8InCuKcALgXefCam3Za1Y07BB6U
	 hfjcZn2WFoeiPIASjFpKdRRJs+pN9vCM5FO0F7iSI0MxXzzuQZJ6CDAH75XMWqGuE6
	 TS1ZpsNdBzCZa6cQgbHeHsmefjZjPZgK4LTiqnRlwY1vNTa/ZdJR9LVZmxiN4KgQnt
	 fyANJ2q9zjO8IjNlUzyPigxGxn777U28odFuRL88K4pGWBPtpYdjI112Meu7iyluLE
	 OY7ikHMpBdvVG/zGUkcSVJuRizhgtD1IT1MKrjitJzZWI4VPThgMuvyoXZz1wjQH0j
	 rC+7m5c659BRQ==
Date: Fri, 23 Oct 2026 10:27:33 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org, vipinsh@google.com,
	linux-kernel@vger.kernel.org, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, graf@amazon.com
Subject: Re: [PATCH v2 1/2] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
 to freeze sessions early
Message-ID: <atsMZW4ChOWj7Lqv@kernel.org>
References: <20261020144710.4154339-1-pasha.tatashin@soleen.com>
 <20261020144710.4154339-2-pasha.tatashin@soleen.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261020144710.4154339-2-pasha.tatashin@soleen.com>

On Tue, Oct 20, 2026 at 10:47:03AM -0400, Pasha Tatashin wrote:
> Currently, LUO sessions are frozen automatically only inside the
> reboot(LINUX_REBOOT_CMD_KEXEC) pathway, where luo_session_serialize()
> iterates through all outgoing sessions under global write locks and
> freezes them serially during shutdown. Allowing userspace to decide when
> to freeze a session once it is done with it (and to freeze multiple
> sessions in parallel, since luo_session_freeze() only acquires the
> per-session mutex) avoids postponing this work to kexec shutdown and
> reduces blackout time.
> 
> Introduce LIVEUPDATE_SESSION_FREEZE on session file descriptors to freeze
> a session early. The ioctl runs .freeze() across all preserved files in the
> session and serializes their metadata. Once frozen, no additional files can
> be added to the session, and subsequent freeze calls return -EBUSY. Freeze
> is only valid on outgoing sessions and returns -EINVAL on incoming ones.
> 
> During kexec, sessions that were already frozen early are skipped, while
> sessions that did not invoke this ioctl auto-freeze as before. If an
> early-frozen session is released before kexec, its files are rolled back
> via .unfreeze() before being unpreserved.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  include/linux/liveupdate.h       |  3 +-
>  include/uapi/linux/liveupdate.h  | 25 ++++++++++
>  kernel/liveupdate/luo_file.c     | 73 +++++++++++++---------------
>  kernel/liveupdate/luo_internal.h |  9 ++--
>  kernel/liveupdate/luo_session.c  | 82 +++++++++++++++++++++++++-------
>  mm/memfd_luo.c                   |  5 +-
>  6 files changed, 134 insertions(+), 63 deletions(-)
> 
> diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
> index 6051abc0612c..851692571e13 100644
> --- a/include/linux/liveupdate.h
> +++ b/include/linux/liveupdate.h
> @@ -59,7 +59,8 @@ struct liveupdate_file_op_args {
>   *                compatible with the given file.
>   * @preserve:     Required. Performs state-saving for the file.
>   * @unpreserve:   Required. Cleans up any resources allocated by @preserve.
> - * @freeze:       Optional. Final actions just before kernel transition.
> + * @freeze:       Optional. Prepares final state before kexec (via
> + *                LIVEUPDATE_SESSION_FREEZE or during reboot).
>   * @unfreeze:     Optional. Undo freeze operations.
>   * @retrieve:     Required. Restores the file in the new kernel.
>   * @can_finish:   Optional. Check if this FD can finish, i.e. all restoration
> diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
> index 4043d4038712..1644c502521e 100644
> --- a/include/uapi/linux/liveupdate.h
> +++ b/include/uapi/linux/liveupdate.h
> @@ -60,6 +60,7 @@ enum {
>  	LIVEUPDATE_CMD_SESSION_RETRIEVE_FD = 0x41,
>  	LIVEUPDATE_CMD_SESSION_FINISH = 0x42,
>  	LIVEUPDATE_CMD_SESSION_GET_NAME = 0x43,
> +	LIVEUPDATE_CMD_SESSION_FREEZE = 0x44,
>  };
>  
>  /**
> @@ -236,4 +237,28 @@ struct liveupdate_session_get_name {
>  #define LIVEUPDATE_SESSION_GET_NAME					\
>  	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SESSION_GET_NAME)
>  
> +/**
> + * struct liveupdate_session_freeze - ioctl(LIVEUPDATE_SESSION_FREEZE)
> + * @size:     Input; sizeof(struct liveupdate_session_freeze)
> + * @reserved: Input; Must be zero. Reserved for future use.
> + *
> + * Freezes the session early from userspace before the reboot kexec phase.
> + *
> + * When this ioctl is called, the kernel executes the .freeze() callback on all
> + * preserved files in the session and serializes their metadata. Once frozen,
> + * no further files can be preserved in the session.
> + *
> + * During the subsequent reboot kexec, this session is recognized as already

Nit: kexec reboot

> + * frozen and is skipped from the late auto freeze.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +struct liveupdate_session_freeze {
> +	__u32		size;
> +	__u32		reserved;
> +};
> +
> +#define LIVEUPDATE_SESSION_FREEZE					\
> +	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SESSION_FREEZE)
> +
>  #endif /* _UAPI_LIVEUPDATE_H */
> diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
> index a39992da504f..7f79890beb31 100644
> --- a/kernel/liveupdate/luo_file.c
> +++ b/kernel/liveupdate/luo_file.c
> @@ -31,9 +31,9 @@
>   *   - unpreserve(): Cleans up any resources allocated by .preserve(), called
>   *     if the preservation process is aborted before the reboot (i.e. session is
>   *     closed).
> - *   - freeze(): A final pre-reboot opportunity to prepare the state for kexec.
> - *     We are already in reboot syscall, and therefore userspace cannot mutate
> - *     the file anymore.
> + *   - freeze(): Prepares the final state for kexec. Invoked either early via

Nit: I'd drop "early", it seems relevant only to the current change, but
will be more confusing than useful later.

> + *     the LIVEUPDATE_SESSION_FREEZE ioctl once userspace is done modifying
> + *     the session's files, or during the reboot() syscall.
>   *   - unfreeze(): Undoes the actions of .freeze(), called if the live update
>   *     is aborted after the freeze phase.
>   *   - retrieve(): Reconstructs the file in the new kernel from the preserved
> @@ -48,7 +48,8 @@
>   *    handler, calls its .preserve() operation, and creates an internal &struct
>   *    luo_file to track the live state.
>   *
> - * 2. Freeze (Pre-Reboot): Just before the kexec, luo_file_freeze() is called.
> + * 2. Freeze (Pre-Reboot): Either explicitly via LIVEUPDATE_SESSION_FREEZE or
> + *    just before the kexec during reboot(), luo_file_freeze() is called.
>   *    It iterates through all preserved files, calls their respective .freeze()
>   *    operation, and serializes their final metadata (compatible string, token,
>   *    and data handle) into a contiguous memory block for KHO.
> @@ -74,15 +75,16 @@
>   *
>   * 1. Abort Before Reboot: If the userspace agent aborts the live update
>   *    process before calling reboot (e.g., by closing the session file
> - *    descriptor), the session's release handler calls
> - *    luo_file_unpreserve_files(). This invokes the .unpreserve() callback on
> - *    all preserved files, ensuring all allocated resources are cleaned up and
> - *    returning the system to a clean state.
> + *    descriptor), the session's release handler unfreezes the files if the
> + *    session was already frozen and calls luo_file_unpreserve_files(). This
> + *    invokes the .unpreserve() callback on all preserved files, ensuring all
> + *    allocated resources are cleaned up and returning the system to a clean
> + *    state.
>   *
> - * 2. Freeze Failure: During the reboot() syscall, if any handler's .freeze()
> - *    op fails, the .unfreeze() op is invoked on all previously *successful*
> - *    freezes to roll back their state. The reboot() syscall then returns an
> - *    error to userspace, canceling the live update.
> + * 2. Freeze Failure: During LIVEUPDATE_SESSION_FREEZE or the reboot() syscall,
> + *    if any handler's .freeze() op fails, the .unfreeze() op is invoked on all
> + *    previously *successful* freezes to roll back their state, and an error is
> + *    returned to userspace.

I think we still want to say that freeze failure at reboot cancels live
update.

>   *
>   * 3. Finish Failure: In the new kernel, if a handler's .finish() op fails,
>   *    the luo_file_finish() operation is aborted. LUO retains ownership of
> @@ -440,12 +442,11 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
>  
>  /**
>   * luo_file_freeze - Freezes all preserved files and serializes their metadata.
> - * @file_set:     The file_set whose files are to be frozen.
> - * @file_set_ser: Where to put the serialized file_set.
> + * @file_set: The file_set whose files are to be frozen.
>   *
> - * This function is called from the reboot() syscall path, just before the
> - * kernel transitions to the new image via kexec. Its purpose is to perform the
> - * final preparation and serialization of all preserved files in the file_set.
> + * This function is called from LIVEUPDATE_SESSION_FREEZE or from the reboot()
> + * syscall path. Its purpose is to perform the preparation and serialization of

Nit:                                          ^ final?

> + * all preserved files in the file_set.
>   *
>   * It iterates through each preserved file in FIFO order (the order of
>   * preservation) and performs two main actions:
> @@ -457,22 +458,20 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
>   *
>   * 2. Serializes Metadata: After a successful freeze, it copies the final file
>   *    metadata—the handler's compatible string, the user token, and the final
> - *    private data handle—into the pre-allocated contiguous memory buffer
> - *    (file_set->files) that will be handed over to the next kernel via KHO.
> + *    private data handle—into the pre-allocated serialization blocks
> + *    (file_set->block_set) that will be handed over to the next kernel via KHO.
>   *
>   * Error Handling (Rollback):
>   * This function is atomic. If any handler's .freeze() operation fails, the
> - * entire live update is aborted. The __luo_file_unfreeze() helper is
> - * immediately called to invoke the .unfreeze() op on all files that were
> - * successfully frozen before the point of failure, rolling them back to a
> - * running state. The function then returns an error, causing the reboot()
> - * syscall to fail.
> + * __luo_file_unfreeze() helper is immediately called to invoke the .unfreeze()
> + * op on all files that were successfully frozen before the point of failure,
> + * rolling them back to an unfrozen state, and an error is returned to the
> + * caller.

Don't you want to say that reboot is canceled here too?

>   *
> - * Context: Called only from the liveupdate_reboot() path.
> + * Context: Called from LIVEUPDATE_SESSION_FREEZE or the liveupdate_reboot() path.
>   * Return: 0 on success, or a negative errno on failure.
>   */
> -int luo_file_freeze(struct luo_file_set *file_set,
> -		    struct luo_file_set_ser *file_set_ser)
> +int luo_file_freeze(struct luo_file_set *file_set)
>  {
>  	struct luo_file *luo_file;
>  	struct kho_block_set_it it;
> @@ -506,9 +505,6 @@ int luo_file_freeze(struct luo_file_set *file_set,
>  		file_ser->token = luo_file->token;
>  	}
>  
> -	file_set_ser->count = file_set->count;
> -	file_set_ser->files = kho_block_set_head_pa(&file_set->block_set);
> -
>  	return 0;
>  
>  err_unfreeze:
> @@ -519,28 +515,25 @@ int luo_file_freeze(struct luo_file_set *file_set,
>  
>  /**
>   * luo_file_unfreeze - Unfreezes all files in a file_set and clear serialization
> - * @file_set:     The file_set whose files are to be unfrozen.
> - * @file_set_ser: Serialized file_set.
> + * @file_set: The file_set whose files are to be unfrozen.
>   *
>   * This function rolls back the state of all files in a file_set after the
> - * freeze phase has begun but must be aborted. It is the counterpart to
> - * luo_file_freeze().
> + * freeze phase has begun. It is the counterpart to luo_file_freeze().
>   *
>   * It invokes the __luo_file_unfreeze() helper with a NULL argument, which
> - * signals the helper to iterate through all files in the file_set and call
> - * their respective .unfreeze() handler callbacks.
> + * signals the helper to iterate through all files in the file_set, call their
> + * respective .unfreeze() handler callbacks, and clear the serialized blocks.
>   *
>   * Context: This is called when the live update is aborted during
> - *          the reboot() syscall, after luo_file_freeze() has been called.
> + *          the reboot() syscall, after luo_file_freeze() has been called,
> + *          or when an early-frozen session is released before kexec.
>   */
> -void luo_file_unfreeze(struct luo_file_set *file_set,
> -		       struct luo_file_set_ser *file_set_ser)
> +void luo_file_unfreeze(struct luo_file_set *file_set)

I went several time back and forth trying to understand why we remove
*file_set_ser here.

Maybe add a preparation patch that does the renames and moves file_set_ser
handling?

>  {
>  	if (!file_set->count)
>  		return;
>  
>  	__luo_file_unfreeze(file_set, NULL);
> -	memset(file_set_ser, 0, sizeof(*file_set_ser));
>  }
>  
>  /**
> diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
> index dac6644bfb18..b3fc3dcf5f36 100644
> --- a/kernel/liveupdate/luo_internal.h
> +++ b/kernel/liveupdate/luo_internal.h
> @@ -64,6 +64,8 @@ struct luo_file_set {
>   *              previous kernel) sessions.
>   * @retrieved:  A boolean flag indicating whether this session has been
>   *              retrieved by a consumer in the new kernel.
> + * @frozen:     A boolean flag indicating whether this session has been
> + *              frozen early from userspace.

s/early/explicitly

>   * @file_set:   A set of files that belong to this session.
>   * @mutex:      protects fields in the luo_session.
>   */
> @@ -71,6 +73,7 @@ struct luo_session {
>  	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
>  	struct list_head list;
>  	bool retrieved;
> +	bool frozen;
>  	struct luo_file_set file_set;
>  	struct mutex mutex;
>  };

-- 
Sincerely yours,
Mike.
