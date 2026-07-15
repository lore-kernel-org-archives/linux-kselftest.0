Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDBD2EEE9C;
	Wed, 15 Jul 2026 13:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123438; cv=none; b=sAV2j654vWlEzZnneD2QMG77TcYWtd5YVEbg0jSbPvGAa1AdbWPdLGCvX2rrE0yHU8QDXve3mkujd91fuT6O+AdFsRDqI9ec1TbJ2e8LD1MSUysZnPlPdHvu5ETXC+k8YlM70jE63+6eQNk7yL0x0TXpvmlcNGoyI3z44oqNSSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123438; c=relaxed/simple;
	bh=KJKrnYDs7Mbca5HEuXXoPWRKrRKjfzGibLV3dYoPsto=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Nyn6nBw64djyMYDHfIKQDD2oh/Y4oXQx74mmmXyS2RUBU/CLWQBIWWu3mpMeNs0p7DanCq4Vfizpeqthb1L8zVdQ7/SbNHsKgS+S/frebA99my3BNEWIVnDqcfdlLKlFeOelDQaVG/m0ibZUirwsuzYTnrUfaCyOEIlDB7sgpUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5ZT8/xr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5ZT8/xr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58551F000E9;
	Wed, 15 Jul 2026 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784123436;
	bh=nL9GPZ2szRYHsC9eAZvo3RDUzkznJI28ai3TQi5RPkA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=A5ZT8/xr39wA6NS/MgYhY1USpGS6fGqQvdo3U4a3m/9JO/5+iL9gzH02SNIdeLTmW
	 rNwqzp23GkKepp/SBawEDTyntIvDw1aWanz94WzyWXHmcRR51GnscSQhdzOW+Odwyi
	 TmTX7eDOdS7Jk046PqBYT79qm8gJpdLrJITrZLfbaYmktX97uTs9NiKYPS1erHR18S
	 HrpfM9vpQ/BxxtOxav+QEWsxN+Gi11Aerkw03P0D15mMxqlqL7Qzz3WjUu6jQsUE17
	 sDiQ95Q8v7e1WSRvACN2DuBMwVcckk5WF4eh48083ZUZMgN5xXMuHW4SEdw+5pcw0A
	 WbnkjLDKhTJLA==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  Jason Gunthorpe <jgg@nvidia.com>,  Mike
 Rapoport <rppt@kernel.org>,  Pasha Tatashin <pasha.tatashin@soleen.com>,
  Pratyush Yadav <pratyush@kernel.org>,  Samiullah Khawaja
 <skhawaja@google.com>,  Shuah Khan <shuah@kernel.org>
Subject: Re: [RFC PATCH] liveupdate: Allow multiple openers for /dev/liveupdate
In-Reply-To: <20260714190356.190328-1-dmatlack@google.com> (David Matlack's
	message of "Tue, 14 Jul 2026 19:03:56 +0000")
References: <20260714190356.190328-1-dmatlack@google.com>
Date: Wed, 15 Jul 2026 15:50:33 +0200
Message-ID: <2vxzy0fcicpi.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi David,

On Tue, Jul 14 2026, David Matlack wrote:

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

Agreed. When the kernel had a global state machine in the early versions
of LUO, this might have been more relevant. With sessions, even if we
later add a state machine, it likely will be per-session instead of
being global. So I think letting userspace open /dev/liveupdate multiple
times makes a lot of sense.

Also, today's systemd only supports preserving individual files, and
does not hand out sessions. To get sessions, userspace must open
/dev/liveupdate and create a session. This opens up room for one bad
process to block every other process from creating sessions. It also
imposes a need for userspace to add a polling/retry logic for getting
sessions and serializes their execution around this point.

I don't see any architectural reasons for doing so from kernel's side.
If userspace wants to only have one owner of /dev/liveupdate, they are
free to do so by unlinking the device from devtmpfs after opening or
restricting its permissions.

So the idea has my vote :-)

Acked-by: Pratyush Yadav (Google) <pratyush@kernel.org>

That said, a comment on the code below.

>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
[...]
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

Do we really need a new lock? Can we re-use sh->rwsem instead?

It can block session retrieve (but not file retrieve) for a short time
though since luo_session_retrieve() also takes it. But the block will be
short since only the first open of /dev/liveupdate does work. After that
it just checks is_deserialized and returns. And session retrieval should
not be very frequent anyway.

I don't have very strong opinion on this, but I reckon the less locks to
keep track of the better.

> +
>  	/* If has been deserialized, always return the same error code */
>  	if (is_deserialized)
>  		return saved_err;
[...]

-- 
Regards,
Pratyush Yadav
