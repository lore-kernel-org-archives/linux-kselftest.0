Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798229;
	b=2h/B0jHGgOeorZNlBTQA8gd6v/Blu/ZczJUZdVQyjyXoboWz4g0f6YmgHD4pQVhaprIa
	 sdXaEy4HCsJ7jEQMnOUeRmeFEsDue1d3UgSc0hzRvEf59AoHDUg2yykpCikIzp5b/6RB8
	 5N+lO7wAtXmsVol3eTMPvgDw4tW7bzxE5CN+BubAvQVOfCYmLPJiuByWRJTQQHWtftDHL
	 KqezitQu9D6PZ5GqL626OZDq9nPpWvsio7I2E+eJw0ciddUVf85icM/Bkjwd+UCGFyse0
	 0VJ4TrWiqLhf8GGR6UiLyMsOpMom+85a8C2MPBxWhibDsfF0453KWRXCBELsV93wEWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798229;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=3H/gLjqgtzADma/hPoTM38pVJFvPU8bwDzlEhV95qGo=;
	b=0W6Ql/f+IkNRgrO0dU35S2XUrBoG1WXZuPs2WSn+KXctcw3wEENyhdOLO/n4h42twDE8
	 HcvPZnFrDdSfro4DBFOF/NG7Fy5GrxQr1i6Mz0zActOPJtcbcwv5s59xXnyyPp8uuLqcR
	 Gxg9o0cR8ryVurpKKF5oM1/jm/gyGlCEP/Q8E0P/1MccSRoLcO5sD/YSEMrbBTLYxt4rB
	 tAiS7EMThGO1pFO/SLqhFQ5Ps5bcKmvD+Yhq0mtnyY3PzdXiThzRN8fkSt2HI7r2f53Yv
	 PsgEENI9JOSVwF5ZtFR1ZneDVpdPwvQuDJYzG47tgjBPpqMB8M/0q04tMlj2FtC3oVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HE2Tpn85;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655A1606A31B;
	Wed,  4 Nov 2026 13:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HE2Tpn85
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A701F000C1;
	Wed,  4 Nov 2026 13:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798229;
	bh=3H/gLjqgtzADma/hPoTM38pVJFvPU8bwDzlEhV95qGo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HE2Tpn85fZMvn0+DJkYUDDR3jn5ssQG2Eg7aG5vFhVPpRV1s3R+3WJBlk7TTjy7x4
	 pZsV3SR6ixdLdbJYGtXX4sGRinDgIuoe7jrOgEo6H/XoULroAaHXYnmepfg1Pmoy3T
	 gsppAx8YM6H9D4OWt74plOz9XYcZrIH2wMjveDKgKoVSDmBpM+HP4cBEaL+Nx6RsLD
	 pL4J6YPdDrFzvy0I9nTJViPT9GvF5vCHLYQZn3uN9/SrHgUxOvfm8gzjQLrPmy7pgE
	 ApvfvNTHjEFSKLtdxVCBWYA1FOnJUxipVPYl4iaIKuZPc+HND7ewVf/ObCmGnSvSkh
	 PnFVazMO0ayQg==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-mm@kvack.org,  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Christian Brauner <brauner@kernel.org>,  David Hildenbrand
 <david@kernel.org>,  Hugh Dickins <hughd@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  "Liam R. Howlett" <liam@infradead.org>,  Lorenzo
 Stoakes <ljs@kernel.org>,  Michal Hocko <mhocko@suse.com>,  Mike Rapoport
 <rppt@kernel.org>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  Randy Dunlap <rdunlap@infradead.org>,
  Samiullah Khawaja <skhawaja@google.com>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Suren Baghdasaryan <surenb@google.com>,
  Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 01/10] liveupdate: Pass user argument to file
 preserve and retrieve
In-Reply-To: <20261103010216.3447716-2-dmatlack@google.com> (David Matlack's
	message of "Tue, 3 Nov 2026 01:02:07 +0000")
References: <20261103010216.3447716-1-dmatlack@google.com>
	<20261103010216.3447716-2-dmatlack@google.com>
Date: Wed, 04 Nov 2026 14:17:03 +0100
Message-ID: <2vxz4idwlos0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi David,

On Tue, Nov 03 2026, David Matlack wrote:

> From: Pasha Tatashin <pasha.tatashin@soleen.com>
>
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
> The argument only applies to the retrieve that restores the file.
> Retrieving a token that was already retrieved returns the existing file,
> so fail with -EBUSY if a non-zero argument is passed then, instead of
> silently ignoring it.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: David Matlack <dmatlack@google.com>

LGTM for the most part, only a couple nitpicks below.

[...]
> @@ -173,12 +178,17 @@ struct liveupdate_session_preserve_fd {
>   * attempts to retrieve the token fail with the same error code. Failed
>   * retrieves are not retried.
>   *
> + * Retrieving a token that was already retrieved successfully returns a new file
> + * descriptor for the same file. The @arg only applies to the retrieve that
> + * restores the file, so passing a non-zero @arg then fails with -EBUSY.
> + *

Hmm, let's see how that plays out in practice. I would guess that code
which does multiple retrieves isn't smart enough to know the file was
already retrieved by someone else.

Anyway, that's not really a kernel problem, so no need to change
anything. Just thinking out loud.

[...]
>  /**
>   * luo_preserve_file - Initiate the preservation of a file descriptor.
>   * @file_set: The file_set to which the preserved file will be added.
>   * @token:    A unique, user-provided identifier for the file.
>   * @fd:       The file descriptor to be preserved.
> + * @arg:      User-space pointer to the handler argument structure, or 0.
>   *
>   * This function orchestrates the first phase of preserving a file. Upon entry,
>   * it takes a reference to the 'struct file' via fget(), effectively making LUO
> @@ -222,9 +257,11 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
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

TBH, I think this whole list is pointless. There is no reason to list
what the code does in a comment. It's only purpose would be to go stale.
The comment should be a high level description of the function, and the
details are already in the code.

It would be very nice if you add a preparatory patch deleting the whole
thing, but since it isn't something added by your patch, I won't insist
on it. It's optional for this series.

>   *
>   * On success, LUO takes a reference to the 'struct file' and considers it
>   * under its management until it is unpreserved or finished.
> @@ -239,10 +276,12 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
>   *         -EBADF if the file descriptor is invalid.
>   *         -ENOSPC if the file_set is full.
>   *         -ENOENT if no compatible handler is found.
> + *         -EOPNOTSUPP if @arg is non-zero and the handler does not accept an arg.
>   *         -ENOMEM on memory allocation failure.
>   *         Other erros might be returned by .preserve().
>   */
[...]
> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> index f48e9a4185f9..ed9d53c7db77 100644
> --- a/kernel/liveupdate/luo_session.c
> +++ b/kernel/liveupdate/luo_session.c
> @@ -267,7 +267,8 @@ static int luo_session_preserve_fd(struct luo_session *session,
>  	int err;
>  
>  	guard(mutex)(&session->mutex);
> -	err = luo_preserve_file(&session->file_set, argp->token, argp->fd);
> +	err = luo_preserve_file(&session->file_set, argp->token, argp->fd,
> +				argp->arg);

Nit: I would prefer to start marking this as __user from here on out,
instead of keeping it u64 and hiding the fact that this is a user
pointer.

So luo_preserve_file() should take a "const void __user *arg" as
argument, instead of "u64 arg". And here we should pass
u64_to_user_ptr(argp->arg). Same for retrieve.

>  	if (err)
>  		return err;
>  
> @@ -290,7 +291,8 @@ static int luo_session_retrieve_fd(struct luo_session *session,
>  		return argp->fd;
>  
>  	mutex_lock(&session->mutex);
> -	err = luo_retrieve_file(&session->file_set, argp->token, &file);
> +	err = luo_retrieve_file(&session->file_set, argp->token, argp->arg,
> +				&file);
>  	mutex_unlock(&session->mutex);
>  	if (err < 0)
>  		goto err_put_fd;

-- 
Regards,
Pratyush Yadav
