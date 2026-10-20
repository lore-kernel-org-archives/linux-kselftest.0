Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494499;
	b=T1PV///pfevCBRA4ckxj8oGla67UY7HUwtNkGuBQ28NTees6lEGfNHSTfwcPujT3l5MU
	 AP2dhwAIurq0gHcAuJzqQvB428otmss3XNw9GHqq6YxqTyxUBgch8kWVLwILJQOYt9sB7
	 sgtnF/jDdold0Zf3j/z4u8praflFiw5xnV8Dk9O5q14XN+n+kY3sLoM97UIlUkylu4FG+
	 XjpB9C354YL2NvrRim4aNONmoT9Mie7AD6oNyWXRuy0+De8d0DNn1Xm5WTMPIYp6E9UZ2
	 B3vgMYzchp193XWERKbqKlpQXNUtEUscrSQM9JRe+Nnm+j0l8XDyNhK8RIwaPWOW/aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494499;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=PlF7ghBaTUOdulozqC4E2cPwGAg3QGfupH1MiS+T580=;
	b=zlOQMsj772VSkWFSMTIk9U7V9psdgYdBD19WaEjITiHRyWrK70zP0/H/7HE2NotyybPp
	 5Q2IG80LIi9/asgvLL4YUi2vUbURiSFUiD7/xR2i4yq07+31bqDt9M1FlwA1O1RfObdaw
	 dbZ4OL4Rr4dN9b/I/ROssS5uVzQ4tTf2qkyHDypRGbsqLcI+wmNeSN+01kDKftSBTgDUm
	 q6sVGHm+liCub+WJIr+xnf/ZtmnaS9lWJZf5qhFBh3Qd3EyVndskPdbI5xmIYMcVFsApn
	 RyocVniOWGnvpstWvch7KGZ+x3pz4kXNG9Pn9VLj4XcwpGNVKf6q0BWdf9H08IFXhtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LWoFlziJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F63B606A324;
	Tue, 20 Oct 2026 11:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LWoFlziJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547E81F000CB;
	Tue, 20 Oct 2026 11:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792494498;
	bh=PlF7ghBaTUOdulozqC4E2cPwGAg3QGfupH1MiS+T580=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=LWoFlziJUISk7pi2VMy49q89tXOvLa/1vZF+kaDch//hMl5Rx1cjBvmCoEF4tW91w
	 FXfNinvQWAvC/afqzLQ3j4gvmvJb4va7CW0t01WIfQjOKxzvl7VDb6rbonvcR8Vrd0
	 KpbWN2F0nb7zY2sfYGyfiZbT5oklOmB9eY2lTKKh0UfwyB9R8GHkZhoVHiWMZcvJFB
	 YJnESXMK/u8fvej2k/lO/oW9/P54hRW31vDPeLvnkHBwrgZ1vN9lCrdggmUf6zF8io
	 UCUwEn4YAWBCXEj+D4ulM0xpZdmvppDAsQQUt9HywjvbKdIS46IoVdqXavtJQ0o18G
	 NYyNXupfdPSLw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,  vipinsh@google.com,
  linux-kernel@vger.kernel.org,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  graf@amazon.com
Subject: Re: [PATCH v1 1/7] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
 to freeze sessions early
In-Reply-To: <20261015093816.2438942-2-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Thu, 15 Oct 2026 05:38:10 -0400")
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
	<20261015093816.2438942-2-pasha.tatashin@soleen.com>
Date: Tue, 20 Oct 2026 13:08:14 +0200
Message-ID: <2vxz8q3shboh.fsf@kernel.org>
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

Hi,

On Thu, Oct 15 2026, Pasha Tatashin wrote:

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
[...]
> @@ -487,8 +488,10 @@ int luo_file_freeze(struct luo_file_set *file_set,
>  		file_ser->token = luo_file->token;
>  	}
>  
> -	file_set_ser->count = file_set->count;
> -	file_set_ser->files = kho_block_set_head_pa(&file_set->block_set);
> +	if (file_set_ser) {
> +		file_set_ser->count = file_set->count;
> +		file_set_ser->files = kho_block_set_head_pa(&file_set->block_set);
> +	}
>  
>  	return 0;
>  
> @@ -501,7 +504,7 @@ int luo_file_freeze(struct luo_file_set *file_set,
>  /**
>   * luo_file_unfreeze - Unfreezes all files in a file_set and clear serialization
>   * @file_set:     The file_set whose files are to be unfrozen.
> - * @file_set_ser: Serialized file_set.
> + * @file_set_ser: Serialized file_set, or %NULL if not serialized yet.
>   *
>   * This function rolls back the state of all files in a file_set after the
>   * freeze phase has begun but must be aborted. It is the counterpart to
> @@ -512,7 +515,8 @@ int luo_file_freeze(struct luo_file_set *file_set,
>   * their respective .unfreeze() handler callbacks.
>   *
>   * Context: This is called when the live update is aborted during
> - *          the reboot() syscall, after luo_file_freeze() has been called.
> + *          the reboot() syscall, after luo_file_freeze() has been called,
> + *          or when an early-frozen session is released before kexec.
>   */
>  void luo_file_unfreeze(struct luo_file_set *file_set,
>  		       struct luo_file_set_ser *file_set_ser)
> @@ -521,7 +525,8 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
>  		return;
>  
>  	__luo_file_unfreeze(file_set, NULL);
> -	memset(file_set_ser, 0, sizeof(*file_set_ser));
> +	if (file_set_ser)
> +		memset(file_set_ser, 0, sizeof(*file_set_ser));
>  }
>  
>  /**
> diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
> index 64879ffe73781..b42369c3b1f30 100644
> --- a/kernel/liveupdate/luo_internal.h
> +++ b/kernel/liveupdate/luo_internal.h
> @@ -64,6 +64,8 @@ struct luo_file_set {
>   *              previous kernel) sessions.
>   * @retrieved:  A boolean flag indicating whether this session has been
>   *              retrieved by a consumer in the new kernel.
> + * @frozen:     A boolean flag indicating whether this session has been
> + *              frozen early from userspace.
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
> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> index f48e9a4185f97..403906937bc0f 100644
> --- a/kernel/liveupdate/luo_session.c
> +++ b/kernel/liveupdate/luo_session.c
> @@ -34,10 +34,11 @@
>   * 1.  Creation: A userspace agent calls `luo_session_create()` to create a
>   *     new, empty session and receives a file descriptor for it.
>   *
> - * 2.  Serialization: When the `reboot(LINUX_REBOOT_CMD_KEXEC)` syscall is
> - *     made, `luo_session_serialize()` is called. It iterates through all
> - *     active sessions and writes their metadata into a memory area preserved
> - *     by KHO.
> + * 2.  Freeze / Serialization: Sessions may be frozen early from userspace
> + *     via `LIVEUPDATE_SESSION_FREEZE`. When the `reboot(LINUX_REBOOT_CMD_KEXEC)`
> + *     syscall is made, `luo_session_serialize()` is called to freeze any
> + *     remaining active sessions and write all session metadata into a memory
> + *     area preserved by KHO.
>   *
>   * 3.  Deserialization (in new kernel): After kexec, `luo_session_deserialize()`
>   *     runs, reading the serialized data and creating a list of `struct
> @@ -222,6 +223,10 @@ static void luo_session_unfreeze_one(struct luo_session *session,
>  				     struct luo_session_ser *ser)
>  {
>  	guard(mutex)(&session->mutex);
> +	if (session->frozen) {
> +		memset(&ser->file_set_ser, 0, sizeof(ser->file_set_ser));
> +		return;
> +	}
>  	luo_file_unfreeze(&session->file_set, &ser->file_set_ser);
>  }
>  
> @@ -229,6 +234,12 @@ static int luo_session_freeze_one(struct luo_session *session,
>  				  struct luo_session_ser *ser)
>  {
>  	guard(mutex)(&session->mutex);
> +	if (session->frozen) {
> +		ser->file_set_ser.count = session->file_set.count;
> +		ser->file_set_ser.files =
> +			kho_block_set_head_pa(&session->file_set.block_set);
> +		return 0;
> +	}

This is getting messy. If early freeze, then you set the file_set_ser
here, if late freeze, you set it in luo_file_freeze().

I think it is better to just set it here, and drop the code from
luo_file_freeze() entirely.

Same for unfreeze.

Maybe also rename the function to make it clear it only runs for
serialization? The core of serialization is done by luo_file_freeze().

>  	return luo_file_freeze(&session->file_set, &ser->file_set_ser);
>  }
>  
> @@ -249,8 +260,11 @@ static int luo_session_release(struct inode *inodep, struct file *filep)
>  		}
>  		sh = &luo_session_global.incoming;
>  	} else {
> -		scoped_guard(mutex, &session->mutex)
> +		scoped_guard(mutex, &session->mutex) {
> +			if (session->frozen)
> +				luo_file_unfreeze(&session->file_set, NULL);
>  			luo_file_unpreserve_files(&session->file_set);
> +		}
>  		sh = &luo_session_global.outgoing;
>  	}
>  
> @@ -267,6 +281,9 @@ static int luo_session_preserve_fd(struct luo_session *session,
>  	int err;
>  
>  	guard(mutex)(&session->mutex);
> +	if (session->frozen)
> +		return -EBUSY;
> +
>  	err = luo_preserve_file(&session->file_set, argp->token, argp->fd);
>  	if (err)
>  		return err;
> @@ -340,11 +357,34 @@ static int luo_session_get_name(struct luo_session *session,
>  	return luo_ucmd_respond(ucmd, sizeof(*argp));
>  }
>  
> +static int luo_session_freeze(struct luo_session *session,
> +			      struct luo_ucmd *ucmd)
> +{
> +	struct liveupdate_session_freeze *argp = ucmd->cmd;
> +	int err;
> +
> +	if (argp->reserved)
> +		return -EINVAL;
> +
> +	guard(mutex)(&session->mutex);
> +	if (session->frozen)
> +		return -EBUSY;
> +
> +	err = luo_file_freeze(&session->file_set, NULL);
> +	if (err)
> +		return err;
> +
> +	session->frozen = true;
> +
> +	return luo_ucmd_respond(ucmd, sizeof(*argp));
> +}
> +
[...]

-- 
Regards,
Pratyush Yadav
