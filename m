Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437974;
	b=1Ng5w2VjOY3jqlMZ4mBAPiTXDjxl/Y6Ygw2fuE21IgI7yiwcKj7eCxfuDs/CWesv6zoa
	 HTSIe5opHex4r84qovEUVFGTCOIqmZk85tRiV64Ksl4pOWq+ulA9yMrPioyjorFPxzZUa
	 NrqZuNNrZU/2Mm4HMkIYKj8cdmyDpKstwt/5OOpaoUuNI2aVkEYVlNt6XCDAiG/7v4epY
	 kY/jch+IAi07pTwOgi1M3G9BbzNgsw3EdhsK+C0GSvRqZat5iqq+pOvM0OQo/OZ5V1wGO
	 DlKWQc2MdDrpqKyNmX832jK9LI/+dXWhxIjw29lNIvxAHzi0Y5hNrUmUmJMa1rK9f8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Content-Type;
	bh=2rb0/sEAsfacPJuMtkQHcEOl+6Blya8Qkve331V8u98=;
	b=c9xMfoVts7YsgLF5SAYugxY2RrkzpQuqRPzHexEY4PVXUVK5mc5l90ZeIRkxDnMBMtOH
	 IV6LL+YcvxVQC29bZ5kbD+8f6f/1BJozt1SF15YSewdsaDkFQB60VLbHvljgHyta4ZThO
	 AQcUIxh1gG4xrlUx4TSpO/Ke0fDWlG0ovcn+6cEQKRt++cU9TERcYkNURduuTcgRh6wJt
	 KyXYboZvx93gH0znQ09OrM7kM2b3Y1n1Au6b1NOYQilsvDF0RqW+/Ohv46/dhxbn9JycW
	 964azzt19KeKSfZBjaAC7JaN3mjYOsThU6famKWf9892YgvbEKCIPAr960ccl23VOEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PMicobun;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B98B606A31C
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 19:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B98B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PMicobun
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c429d9d05f0so208697366b.1
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 12:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792437972; x=1793042772; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rb0/sEAsfacPJuMtkQHcEOl+6Blya8Qkve331V8u98=;
        b=PMicobunIMAW4EiLQS43o4Di6ycucaDcGTpdfhWz41J4CR4TU9Jwo0UzfZtGz1ki8c
         lP1q9YOWAnNlotCK3dvtCFgrZmK0bg44JR9pqFeG7f6yK66stx2RnCoOTNOvlUrn1Swh
         BmhZLWIvDbtMXU+K3Kt6FDBrWMJxAe/R8iQHaAeRoip6ssIvsPyvGtlRHBIdJNY2pwts
         b7nkWN2StFSqqF8TBjrzSdCA0ZRwqqM5DiggCVpPAbqg94J9iTbxPFVum8EuQI5nehSQ
         00mdnf2IXymsHzuu1FWMesWVVMqfK6URnQ4As+MaYre1+rA68EGAjRBGndPAp8NVMGdP
         xqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437972; x=1793042772;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rb0/sEAsfacPJuMtkQHcEOl+6Blya8Qkve331V8u98=;
        b=25HnrqABNAyiox6Liyz9eMoQZl3JN2gIJ/Y3ybVWnFAnq55d/yCF3f4Fh/ukkyO+Rw
         IEzA1vSltDOBphwv4USTZkPEo8b4yKOYU4jitzSEU6gjkzlMlolCJoj/NAPfRVVvcvoQ
         Xy1tDJlZsT/2L9bE0C31h5tg2Wk7qsH+SzuunrEoy/MZ1oBs0p8m7GGJVTT4/ZmftvVx
         a+yfiY5qHJXa9NrJQLd+GQHATblqjQ7oQYSo2mxU3Tbl2/xie2SJq+TZrEYRu/y74XOm
         /URt1KABamt86ELp/Bfq6TQqcGZDLODfFlYENrseEeeckGmjFXcyX3ej3NFnboTgIc+V
         6law==
X-Forwarded-Encrypted: i=1; AKwUvByHzKaTSA9c8QjI23VSRHMVq3EbyBxBRg2xj/X8d87QU8WWohAR+J7N3OVZG8ARNT29jSfAnMwCoIYIf8rbBBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIPBENmlHzReLZJQxcCCCvo44q0gUMYikJ8ye8rX29rBjKcVN0
	Zf65B98R8nklcuA9NRO8JuDLaid08ZGqFvGxISFKoj5hryV8rwSO/6RGyydECLT6w5xYIA0dKvT
	sBRLc0PMjAZfkWmjTtA==
X-Received: from ejzr6.prod.google.com ([2002:a17:906:c286:b0:c3f:cc01:4b71])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c308:b0:c40:773e:4f22 with SMTP id a640c23a62f3a-c419fbf1fa2mr575427066b.42.1792437971742;
 Mon, 19 Oct 2026 12:26:11 -0700 (PDT)
Date: Mon, 19 Oct 2026 19:26:11 +0000
In-Reply-To: <20261015093816.2438942-4-pasha.tatashin@soleen.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com> <20261015093816.2438942-4-pasha.tatashin@soleen.com>
Message-ID: <9huzwlrdh4q4.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v1 3/7] liveupdate: Pass user argument to file preserve
 and retrieve
From: tarunsahu@google.com
To: Pasha Tatashin <pasha.tatashin@soleen.com>, linux-kselftest@vger.kernel.org, 
	rppt@kernel.org, shuah@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, vipinsh@google.com, linux-kernel@vger.kernel.org, 
	dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
	graf@amazon.com
Content-Type: text/plain; charset="UTF-8"


As Per Today's Hypervisor liveupdate meeting, This patch will be picked
by @dmatlack@google.com for latest tmpfs preservation series.

I have a suggestion to make here.

Let's send this patch as a saperate patch so that I can also use this in
my guest_memfd preservation work. This will help landing this feature
sooner and unblock other subsystem who needs it.

Let me know what you think?

~Tarun


Pasha Tatashin <pasha.tatashin@soleen.com> writes:

> Allow userspace to pass a file-handler-specific argument structure when
> preserving or retrieving an FD via LUO. File handlers may need
> additional context during preservation or retrieval, such as a target
> FD, device location, or handler-specific parameters, without introducing
> separate ioctls for each file type. Whether the argument is required,
> optional, or unused is defined by the file handler.
>
> Extend struct liveupdate_session_preserve_fd and
> struct liveupdate_session_retrieve_fd with a 64-bit arg field pointing
> to a handler-defined argument structure that begins with a 32-bit size
> field. Because IOCTL_OP validates a minimum size up to the token field,
> existing callers passing the 16-byte struct remain compatible and have
> arg zero-filled by copy_struct_from_user().
>
> Add parg and rarg (struct liveupdate_arg_spec) to
> struct liveupdate_file_ops, initialized via LIVEUPDATE_ARG(_struct,
> _min_last), which records the full struct size and minimum required size
> while enforcing at compile time that handler argument structures begin
> with a 32-bit size field. When arg is non-zero, LUO validates the
> minimum size and copies the user argument via copy_struct_from_user() up
> to the handler's expected size and passes the kernel copy in
> struct liveupdate_file_op_args, or returns -EOPNOTSUPP if the handler
> does not accept an argument.
>
> Also provide liveupdate_claim_file() and liveupdate_unclaim_file() so
> handlers whose .retrieve() callback restores state into an existing
> user-supplied file descriptor can claim it in luo_preserved_files before
> modifying the file.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  include/linux/liveupdate.h       | 60 +++++++++++++++++++
>  include/uapi/linux/liveupdate.h  |  6 ++
>  kernel/liveupdate/luo_file.c     | 99 +++++++++++++++++++++++++++++---
>  kernel/liveupdate/luo_internal.h |  5 +-
>  kernel/liveupdate/luo_session.c  |  6 +-
>  5 files changed, 164 insertions(+), 12 deletions(-)
>
> diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
> index 885ec0bbc4b8c..52d3f453ae011 100644
> --- a/include/linux/liveupdate.h
> +++ b/include/linux/liveupdate.h
> @@ -22,6 +22,36 @@ struct liveupdate_flb;
>  struct liveupdate_session;
>  struct file;
>  
> +/**
> + * struct liveupdate_arg_spec - Specification of a file handler user argument.
> + * @size:     Full size of the argument structure in the current kernel.
> + * @min_size: Minimum valid user-supplied size (offsetofend of the last
> + *            required field).
> + */
> +struct liveupdate_arg_spec {
> +	size_t size;
> +	size_t min_size;
> +};
> +
> +/**
> + * LIVEUPDATE_ARG - Validated specification of a file handler argument struct.
> + * @_struct:   The argument structure type.
> + * @_min_last: The last required member in @_struct.
> + *
> + * All file handler argument structures passed via
> + * &liveupdate_session_preserve_fd.arg or &liveupdate_session_retrieve_fd.arg
> + * must begin with a 32-bit @size field so they can be extended compatibly.
> + * Use this macro to initialize &liveupdate_file_ops.parg and
> + * &liveupdate_file_ops.rarg.
> + */
> +#define LIVEUPDATE_ARG(_struct, _min_last)				\
> +	{								\
> +		.size = sizeof(_struct) +				\
> +			BUILD_BUG_ON_ZERO(offsetof(_struct, size) != 0) + \
> +			BUILD_BUG_ON_ZERO(sizeof_field(_struct, size) != sizeof(u32)), \
> +		.min_size = offsetofend(_struct, _min_last),		\
> +	}
> +
>  /**
>   * struct liveupdate_file_op_args - Arguments for file operation callbacks.
>   * @handler:          The file handler being called.
> @@ -39,6 +69,11 @@ struct file;
>   *                    is not preserved. Set by the handler's .preserve()
>   *                    callback, and must be freed in the handler's
>   *                    .unpreserve() callback.
> + * @arg:              Kernel copy of the user-provided argument for .preserve()
> + *                    and .retrieve(), or %NULL if none was provided. Allocated
> + *                    to the handler's expected argument size with any trailing
> + *                    bytes beyond the user-supplied size zero-filled. Valid
> + *                    only for the duration of the callback.
>   *
>   * This structure bundles all parameters for the file operation callbacks.
>   * The 'data' and 'file' fields are used for both input and output.
> @@ -49,6 +84,7 @@ struct liveupdate_file_op_args {
>  	struct file *file;
>  	u64 serialized_data;
>  	void *private_data;
> +	const void *arg;
>  };
>  
>  /**
> @@ -67,6 +103,12 @@ struct liveupdate_file_op_args {
>   *                resources in the session.
>   * @finish:       Required. Final cleanup in the new kernel.
>   * @get_id:       Optional. Returns a unique identifier for the file.
> + * @parg:         Optional. Specification of the user argument structure
> + *                accepted by @preserve, initialized via LIVEUPDATE_ARG(). If
> + *                unset, non-zero user arguments are rejected with -EOPNOTSUPP.
> + * @rarg:         Optional. Specification of the user argument structure
> + *                accepted by @retrieve, initialized via LIVEUPDATE_ARG(). If
> + *                unset, non-zero user arguments are rejected with -EOPNOTSUPP.
>   * @owner:        Module reference
>   *
>   * All operations (except can_preserve) receive a pointer to a
> @@ -83,6 +125,8 @@ struct liveupdate_file_ops {
>  	bool (*can_finish)(struct liveupdate_file_op_args *args);
>  	void (*finish)(struct liveupdate_file_op_args *args);
>  	unsigned long (*get_id)(struct file *file);
> +	struct liveupdate_arg_spec parg;
> +	struct liveupdate_arg_spec rarg;
>  	struct module *owner;
>  };
>  
> @@ -237,6 +281,11 @@ int liveupdate_reboot(void);
>  int liveupdate_register_file_handler(struct liveupdate_file_handler *fh);
>  void liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh);
>  
> +int liveupdate_claim_file(struct liveupdate_file_handler *fh,
> +			  struct file *file);
> +void liveupdate_unclaim_file(struct liveupdate_file_handler *fh,
> +			     struct file *file);
> +
>  int liveupdate_register_flb(struct liveupdate_file_handler *fh,
>  			    struct liveupdate_flb *flb);
>  void liveupdate_unregister_flb(struct liveupdate_file_handler *fh,
> @@ -269,6 +318,17 @@ static inline void liveupdate_unregister_file_handler(struct liveupdate_file_han
>  {
>  }
>  
> +static inline int liveupdate_claim_file(struct liveupdate_file_handler *fh,
> +					struct file *file)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void liveupdate_unclaim_file(struct liveupdate_file_handler *fh,
> +					   struct file *file)
> +{
> +}
> +
>  static inline int liveupdate_register_flb(struct liveupdate_file_handler *fh,
>  					  struct liveupdate_flb *flb)
>  {
> diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
> index 1644c502521e0..57a3c129d5a9d 100644
> --- a/include/uapi/linux/liveupdate.h
> +++ b/include/uapi/linux/liveupdate.h
> @@ -127,6 +127,8 @@ struct liveupdate_ioctl_retrieve_session {
>   * @size:  Input; sizeof(struct liveupdate_session_preserve_fd)
>   * @fd:    Input; The user-space file descriptor to be preserved.
>   * @token: Input; An opaque, unique token for preserved resource.
> + * @arg:   Input; User-space pointer to a file-handler-specific argument
> + *         structure starting with a 32-bit size field, or 0 if unused.
>   *
>   * Holds parameters for preserving a file descriptor.
>   *
> @@ -150,6 +152,7 @@ struct liveupdate_session_preserve_fd {
>  	__u32		size;
>  	__s32		fd;
>  	__aligned_u64	token;
> +	__aligned_u64	arg;
>  };
>  
>  #define LIVEUPDATE_SESSION_PRESERVE_FD					\
> @@ -161,6 +164,8 @@ struct liveupdate_session_preserve_fd {
>   * @fd:    Output; The new file descriptor representing the fully restored
>   *         kernel resource.
>   * @token: Input; An opaque, token that was used to preserve the resource.
> + * @arg:   Input; User-space pointer to a file-handler-specific argument
> + *         structure starting with a 32-bit size field, or 0 if unused.
>   *
>   * Retrieve a previously preserved file descriptor.
>   *
> @@ -180,6 +185,7 @@ struct liveupdate_session_retrieve_fd {
>  	__u32		size;
>  	__s32		fd;
>  	__aligned_u64	token;
> +	__aligned_u64	arg;
>  };
>  
>  #define LIVEUPDATE_SESSION_RETRIEVE_FD					\
> diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
> index 3c1c86ff14d69..e3bfdbc6baedc 100644
> --- a/kernel/liveupdate/luo_file.c
> +++ b/kernel/liveupdate/luo_file.c
> @@ -112,6 +112,7 @@
>  #include <linux/xarray.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/uaccess.h>
>  #include "luo_internal.h"
>  
>  static LIST_HEAD(luo_file_handler_list);
> @@ -176,6 +177,36 @@ static unsigned long luo_get_id(struct liveupdate_file_handler *fh,
>  	return fh->ops->get_id ? fh->ops->get_id(file) : (unsigned long)file;
>  }
>  
> +/**
> + * liveupdate_claim_file - Claim a file in the LUO preserved files table.
> + * @fh:   The file handler claiming @file.
> + * @file: The file to claim.
> + *
> + * File handlers whose .retrieve() callback restores state into an existing
> + * user-supplied &struct file (rather than allocating a new one) should call
> + * this before modifying @file to ensure @file is not already managed by LUO.
> + *
> + * Return: 0 on success, -EBUSY if @file is already managed by LUO, or a
> + *         negative errno on allocation failure.
> + */
> +int liveupdate_claim_file(struct liveupdate_file_handler *fh,
> +			  struct file *file)
> +{
> +	return xa_insert(&luo_preserved_files, luo_get_id(fh, file),
> +			 file, GFP_KERNEL);
> +}
> +
> +/**
> + * liveupdate_unclaim_file - Release a claimed file from the LUO preserved files table.
> + * @fh:   The file handler that claimed @file.
> + * @file: The file to release.
> + */
> +void liveupdate_unclaim_file(struct liveupdate_file_handler *fh,
> +			     struct file *file)
> +{
> +	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
> +}
> +
>  static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
>  {
>  	struct luo_file *iter;
> @@ -188,11 +219,45 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
>  	return false;
>  }
>  
> +static int luo_copy_user_arg(u64 user_arg, const void **argp,
> +			     const struct liveupdate_arg_spec *spec)
> +{
> +	void *karg __free(kfree) = NULL;
> +	void __user *uptr;
> +	u32 user_size;
> +	int err;
> +
> +	if (!user_arg)
> +		return 0;
> +	if (!spec->size)
> +		return -EOPNOTSUPP;
> +
> +	uptr = u64_to_user_ptr(user_arg);
> +	if (get_user(user_size, (u32 __user *)uptr))
> +		return -EFAULT;
> +	if (user_size < spec->min_size)
> +		return -EINVAL;
> +	if (user_size > PAGE_SIZE)
> +		return -E2BIG;
> +
> +	karg = kmalloc(spec->size, GFP_KERNEL);
> +	if (!karg)
> +		return -ENOMEM;
> +
> +	err = copy_struct_from_user(karg, spec->size, uptr, user_size);
> +	if (err)
> +		return err;
> +
> +	*argp = no_free_ptr(karg);
> +	return 0;
> +}
> +
>  /**
>   * luo_preserve_file - Initiate the preservation of a file descriptor.
>   * @file_set: The file_set to which the preserved file will be added.
>   * @token:    A unique, user-provided identifier for the file.
>   * @fd:       The file descriptor to be preserved.
> + * @arg:      User-space pointer to the handler argument structure, or 0.
>   *
>   * This function orchestrates the first phase of preserving a file. Upon entry,
>   * it takes a reference to the 'struct file' via fget(), effectively making LUO
> @@ -208,9 +273,11 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
>   *    (allocates if needed).
>   * 3. Iterates through registered handlers, calling can_preserve() to find one
>   *    compatible with the given @fd.
> - * 4. Calls the handler's .preserve() operation, which saves the file's state
> + * 4. Copies the user argument structure (if @arg is non-zero) according to the
> + *    handler's parg specification.
> + * 5. Calls the handler's .preserve() operation, which saves the file's state
>   *    and returns an opaque private data handle.
> - * 5. Adds the new instance to the file_set's internal list.
> + * 6. Adds the new instance to the file_set's internal list.
>   *
>   * On success, LUO takes a reference to the 'struct file' and considers it
>   * under its management until it is unpreserved or finished.
> @@ -225,10 +292,12 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
>   *         -EBADF if the file descriptor is invalid.
>   *         -ENOSPC if the file_set is full.
>   *         -ENOENT if no compatible handler is found.
> + *         -EOPNOTSUPP if @arg is non-zero and the handler does not accept an arg.
>   *         -ENOMEM on memory allocation failure.
>   *         Other erros might be returned by .preserve().
>   */
> -int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
> +int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
> +		      u64 arg)
>  {
>  	struct liveupdate_file_op_args args = {0};
>  	struct liveupdate_file_handler *fh;
> @@ -264,10 +333,14 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
>  	if (err)
>  		goto err_fput;
>  
> +	err = luo_copy_user_arg(arg, &args.arg, &fh->ops->parg);
> +	if (err)
> +		goto err_module_put;
> +
>  	err = xa_insert(&luo_preserved_files, luo_get_id(fh, file),
>  			file, GFP_KERNEL);
>  	if (err)
> -		goto err_module_put;
> +		goto err_free_arg;
>  
>  	err = luo_flb_file_preserve(fh);
>  	if (err)
> @@ -290,6 +363,7 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
>  	if (err)
>  		goto err_kfree;
>  
> +	kfree(args.arg);
>  	luo_file->serialized_data = args.serialized_data;
>  	luo_file->private_data = args.private_data;
>  	list_add_tail(&luo_file->list, &file_set->files_list);
> @@ -303,6 +377,8 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
>  	luo_flb_file_unpreserve(fh);
>  err_erase_xa:
>  	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
> +err_free_arg:
> +	kfree(args.arg);
>  err_module_put:
>  	module_put(fh->ops->owner);
>  err_fput:
> @@ -533,6 +609,7 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
>   * luo_retrieve_file - Restores a preserved file from a file_set by its token.
>   * @file_set: The file_set from which to retrieve the file.
>   * @token:    The unique token identifying the file to be restored.
> + * @arg:      User-space pointer to the handler argument structure, or 0.
>   * @filep:    Output parameter; on success, this is populated with a pointer
>   *            to the newly retrieved 'struct file'.
>   *
> @@ -552,9 +629,10 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
>   *          kernel.
>   * Return: 0 on success. Returns a negative errno on failure:
>   *         -ENOENT if no file with the matching token is found.
> + *         -EOPNOTSUPP if @arg is non-zero and the handler does not accept an arg.
>   *         Any error code returned by the handler's .retrieve() op.
>   */
> -int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
> +int luo_retrieve_file(struct luo_file_set *file_set, u64 token, u64 arg,
>  		      struct file **filep)
>  {
>  	struct liveupdate_file_op_args args = {0};
> @@ -591,9 +669,14 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
>  		return 0;
>  	}
>  
> +	err = luo_copy_user_arg(arg, &args.arg, &luo_file->fh->ops->rarg);
> +	if (err)
> +		return err;
> +
>  	args.handler = luo_file->fh;
>  	args.serialized_data = luo_file->serialized_data;
>  	err = luo_file->fh->ops->retrieve(&args);
> +	kfree(args.arg);
>  	if (err) {
>  		/* Keep the error code for later use. */
>  		luo_file->retrieve_status = err;
> @@ -604,9 +687,9 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
>  	/* Get reference so we can keep this file in LUO until finish */
>  	get_file(luo_file->file);
>  
> -	WARN_ON(xa_insert(&luo_preserved_files,
> -			  luo_get_id(luo_file->fh, luo_file->file),
> -			  luo_file->file, GFP_KERNEL));
> +	if (xa_load(&luo_preserved_files,
> +		    luo_get_id(luo_file->fh, luo_file->file)) != luo_file->file)
> +		WARN_ON(liveupdate_claim_file(luo_file->fh, luo_file->file));
>  
>  	*filep = luo_file->file;
>  	luo_file->retrieve_status = 1;
> diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
> index b42369c3b1f30..3bd9ef442934e 100644
> --- a/kernel/liveupdate/luo_internal.h
> +++ b/kernel/liveupdate/luo_internal.h
> @@ -87,13 +87,14 @@ int __init luo_session_setup_incoming(u64 sessions_pa);
>  int luo_session_serialize(void);
>  int luo_session_deserialize(void);
>  
> -int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd);
> +int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
> +		      u64 arg);
>  void luo_file_unpreserve_files(struct luo_file_set *file_set);
>  int luo_file_freeze(struct luo_file_set *file_set,
>  		    struct luo_file_set_ser *file_set_ser);
>  void luo_file_unfreeze(struct luo_file_set *file_set,
>  		       struct luo_file_set_ser *file_set_ser);
> -int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
> +int luo_retrieve_file(struct luo_file_set *file_set, u64 token, u64 arg,
>  		      struct file **filep);
>  int luo_file_finish(struct luo_file_set *file_set);
>  int luo_file_deserialize(struct luo_file_set *file_set,
> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> index 403906937bc0f..74f8a1bf1da8c 100644
> --- a/kernel/liveupdate/luo_session.c
> +++ b/kernel/liveupdate/luo_session.c
> @@ -284,7 +284,8 @@ static int luo_session_preserve_fd(struct luo_session *session,
>  	if (session->frozen)
>  		return -EBUSY;
>  
> -	err = luo_preserve_file(&session->file_set, argp->token, argp->fd);
> +	err = luo_preserve_file(&session->file_set, argp->token, argp->fd,
> +				argp->arg);
>  	if (err)
>  		return err;
>  
> @@ -307,7 +308,8 @@ static int luo_session_retrieve_fd(struct luo_session *session,
>  		return argp->fd;
>  
>  	mutex_lock(&session->mutex);
> -	err = luo_retrieve_file(&session->file_set, argp->token, &file);
> +	err = luo_retrieve_file(&session->file_set, argp->token, argp->arg,
> +				&file);
>  	mutex_unlock(&session->mutex);
>  	if (err < 0)
>  		goto err_put_fd;
> -- 
> 2.56.0.385.gd3acb90ef8-goog
