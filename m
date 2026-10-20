Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506611;
	b=S2QOH5qMCfUn0pcgNgOEX6bwropmnJCq03+SkqOVqmqgh11qh75Dw7/BkVMG+2N2uFum
	 wRXnoevG91sF4BJhm7jBwovhYDKjF7NaNJknmaR6YplwS5Q/PMbu49aexkwwiK8ViGkeK
	 eiSJdqa2fja3RBBM1z1MjX+HsK9fR55EhyRbevhYNGx3qFzsFpueJZHMtjPgLv7rM7rjp
	 CWYsTFVyGJqU6pVgXJvAeu8bF4Q49bEzb+pHsMJA2qrRAfMZcfPnKTBj8rBrGbFNJoDoD
	 fuNBcydnmZNPyq9N1PD4ZDXKuGzCnzpoS/2csjELDINb+s0hnk/f5R36J3t0/hrcZUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Xf7TkZF3OBqfOdq3p0Xj300grOV6/XXUYozCmNJzyro=;
	b=gkmQhW4oXbqShmwAYNsMmp0Ml0dzOVIL4c479jxMtxuiijDhiLMVDMh7SggWy1aIwX3L
	 HeLySF68ZLop3Kj6RMbEeJ2CdhOzeAunOvwPeMAAgQCuSlbWq3XuV2oaDZdtG8wKd0Ab0
	 ikEShmRM0LnD2CsF2tB1HQ7WMIlFD8rWk5n8l5EpJLj/6jYpEOLQCxuj/eMORCc52dIrc
	 eEpe2hD89fUoTQFu4oabmynuZlC3lSHuZFUfarkME/vDKQEC7bxPoPyqx0WMj/wPKKm4c
	 hDvRmSMHhEHBbbnyInb7w+h3QD/juHlwIFY15pErcgYARC9nd3ePl08b2SzYr8Oxa4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=Y4PdXNc2;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E8A606A31D
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E8A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=Y4PdXNc2
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eac48af23fso888939e0c.2
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792506610; x=1793111410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xf7TkZF3OBqfOdq3p0Xj300grOV6/XXUYozCmNJzyro=;
        b=Y4PdXNc2cM9BskKGMFzBwlWrJdLAc8rIQmdISWOj3T5xevM8MiipH3Iwjq22o13IPH
         PDwdieZAEMH3I6FVZwIE40UH2GOvmPTiTbJ4PDl5a4NL2jrm7J8hTLex47no6oIsx7x7
         ZyNzyKNdiMSU8+/xnfM2e3Zh91lfYDkZdOzWZGs16WgHn9qlIEhBG593eA8qgdZ7y1qG
         nq5I0zF3zDIQNKZN1FpdXsWRYuucF9oi5gFULyuZoIBTeirAd3PvWG9ONEVBZcjp+I0X
         t4OU5+Uod+QqBRUmAuaOYO+QvEDtaEcS80NVIrydSWjRSlnUciBpnKqxTM9WGDkq2YUM
         Qy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506610; x=1793111410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xf7TkZF3OBqfOdq3p0Xj300grOV6/XXUYozCmNJzyro=;
        b=YbjAhEm2Fi68ynQc2U/0Dp9cL5Fs8BTk169TcNtJVU4wn4spJjodJNvXDUJg9G76Ve
         mhlrcm/m7aiBXCDKx9nKW9oRkK95bd6QEUEb/+D1EBzoaIC7BYjP4+yRCSdiOJKazn2n
         W77METRYSX0yi1Q5fw/X09EvQ1fxcm5sKOnv+94YJEEMTGAvmRyPgQ47BVjLklLo6HzY
         uT+AKU+4hLEqXUcDTGUMUKKVJiZ2e5cKUk+A5aVOgiDTqAjevZfBBiXpEusDNwwrArNS
         9z+t51aivX0GEXsF7Qs7hYWDpUzk4pNJFgp+sUOT05IJradsO5dtR9KLj5sVu2TmUpA0
         Yq6w==
X-Forwarded-Encrypted: i=1; AKwUvBz6VMcUpCVj+IbNguZc89wRO5/mjfHsNg7TP/PJ0NZZ56OZ2S//RDJkL0v95gRtxA6njooNtHip0M1UVZJIruY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1manDYsEwzMVrOkN4FD52RH9KIgKgDWtL0syI4IuhoHtMo6DE
	7DGdYvjNMV1MMBlJ2vWKlqZdfzTLMJk+U9eJCY8XVGaErf7JKq2zi6V/xi9x92yd1N8=
X-Gm-Gg: AYBFou2VgHGtTAUUEUCcBJiwsHH36F2JCv2wIbWdGt+PMbpEK2VmsI34bff2FAe4Zdd
	epdCnbOiGsbwVSlg6dtbygTZZx6so67X7+Kfz3ewnqe/8jktSr4scV/ChEcQoSL9DB4oUnIPZhm
	80Lj18WAHR96z1CuuacLKX1kR/KvDXQdvbADgp4qTY5UFK3JIgdaEP3wjx9qtY03u1NkpiyqgA1
	6IICxR6eQvGX7uGuiiXO6Xc/6D6u5Y1V0bAJWxHuZejy4kh5+NBsWcbbE7H07F6GWM3iowqX9ej
	fscabty2e91JAyKMSAkbH4TW7zN0wdGCQtPmkcV/92TYZpK1XvljNkoXbYJia9UfiVYWlFcSUos
	P8An+YM1XYNAnEP8cFaiwwkHbToJfSsnH0rYFalK+OSR3XcawG2KnxJ1A76fW11+Lj+u1qEH1bR
	5MgzEleNIodQunfJ8t47lAkD9OTVgAViKyxsVz/G4S1R17Uahrph7hPYEF6x4xAID7ToC48c5bh
	6wOfEcCKa1Df01fGXG1KqTu5y1mJaTzWuxwoRbdB/8NQXyD01haELzNwy2B8lE00m5W1bUT6dk=
X-Received: by 2002:a05:6122:20a4:b0:5ea:cc3c:9449 with SMTP id 71dfb90a1353d-5eacc3c9891mr1844327e0c.19.1792506610182;
        Tue, 20 Oct 2026 07:30:10 -0700 (PDT)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eaca7cc59asm5934172e0c.5.2026.10.20.07.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:30:09 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:30:08 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org, vipinsh@google.com,
	linux-kernel@vger.kernel.org, dmatlack@google.com,
	kexec@lists.infradead.org, graf@amazon.com
Subject: Re: [PATCH v1 1/7] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
 to freeze sessions early
Message-ID: <atd68E5_LA9bsfeV@google.com>
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
 <20261015093816.2438942-2-pasha.tatashin@soleen.com>
 <2vxz8q3shboh.fsf@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxz8q3shboh.fsf@kernel.org>

On 10-20 13:08, Pratyush Yadav wrote:
> Hi,
> 
> On Thu, Oct 15 2026, Pasha Tatashin wrote:
> 
> > Currently, LUO sessions are frozen automatically only inside the
> > reboot(LINUX_REBOOT_CMD_KEXEC) pathway, where luo_session_serialize()
> > iterates through all outgoing sessions under global write locks and
> > freezes them serially during shutdown. Allowing userspace to decide when
> > to freeze a session once it is done with it (and to freeze multiple
> > sessions in parallel, since luo_session_freeze() only acquires the
> > per-session mutex) avoids postponing this work to kexec shutdown and
> > reduces blackout time.
> >
> > Introduce LIVEUPDATE_SESSION_FREEZE on session file descriptors to freeze
> > a session early. The ioctl runs .freeze() across all preserved files in the
> > session and serializes their metadata. Once frozen, no additional files can
> > be added to the session, and subsequent freeze calls return -EBUSY. Freeze
> > is only valid on outgoing sessions and returns -EINVAL on incoming ones.
> >
> > During kexec, sessions that were already frozen early are skipped, while
> > sessions that did not invoke this ioctl auto-freeze as before. If an
> > early-frozen session is released before kexec, its files are rolled back
> > via .unfreeze() before being unpreserved.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> [...]
> > @@ -487,8 +488,10 @@ int luo_file_freeze(struct luo_file_set *file_set,
> >  		file_ser->token = luo_file->token;
> >  	}
> >  
> > -	file_set_ser->count = file_set->count;
> > -	file_set_ser->files = kho_block_set_head_pa(&file_set->block_set);
> > +	if (file_set_ser) {
> > +		file_set_ser->count = file_set->count;
> > +		file_set_ser->files = kho_block_set_head_pa(&file_set->block_set);
> > +	}
> >  
> >  	return 0;
> >  
> > @@ -501,7 +504,7 @@ int luo_file_freeze(struct luo_file_set *file_set,
> >  /**
> >   * luo_file_unfreeze - Unfreezes all files in a file_set and clear serialization
> >   * @file_set:     The file_set whose files are to be unfrozen.
> > - * @file_set_ser: Serialized file_set.
> > + * @file_set_ser: Serialized file_set, or %NULL if not serialized yet.
> >   *
> >   * This function rolls back the state of all files in a file_set after the
> >   * freeze phase has begun but must be aborted. It is the counterpart to
> > @@ -512,7 +515,8 @@ int luo_file_freeze(struct luo_file_set *file_set,
> >   * their respective .unfreeze() handler callbacks.
> >   *
> >   * Context: This is called when the live update is aborted during
> > - *          the reboot() syscall, after luo_file_freeze() has been called.
> > + *          the reboot() syscall, after luo_file_freeze() has been called,
> > + *          or when an early-frozen session is released before kexec.
> >   */
> >  void luo_file_unfreeze(struct luo_file_set *file_set,
> >  		       struct luo_file_set_ser *file_set_ser)
> > @@ -521,7 +525,8 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
> >  		return;
> >  
> >  	__luo_file_unfreeze(file_set, NULL);
> > -	memset(file_set_ser, 0, sizeof(*file_set_ser));
> > +	if (file_set_ser)
> > +		memset(file_set_ser, 0, sizeof(*file_set_ser));
> >  }
> >  
> >  /**
> > diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
> > index 64879ffe73781..b42369c3b1f30 100644
> > --- a/kernel/liveupdate/luo_internal.h
> > +++ b/kernel/liveupdate/luo_internal.h
> > @@ -64,6 +64,8 @@ struct luo_file_set {
> >   *              previous kernel) sessions.
> >   * @retrieved:  A boolean flag indicating whether this session has been
> >   *              retrieved by a consumer in the new kernel.
> > + * @frozen:     A boolean flag indicating whether this session has been
> > + *              frozen early from userspace.
> >   * @file_set:   A set of files that belong to this session.
> >   * @mutex:      protects fields in the luo_session.
> >   */
> > @@ -71,6 +73,7 @@ struct luo_session {
> >  	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
> >  	struct list_head list;
> >  	bool retrieved;
> > +	bool frozen;
> >  	struct luo_file_set file_set;
> >  	struct mutex mutex;
> >  };
> > diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> > index f48e9a4185f97..403906937bc0f 100644
> > --- a/kernel/liveupdate/luo_session.c
> > +++ b/kernel/liveupdate/luo_session.c
> > @@ -34,10 +34,11 @@
> >   * 1.  Creation: A userspace agent calls `luo_session_create()` to create a
> >   *     new, empty session and receives a file descriptor for it.
> >   *
> > - * 2.  Serialization: When the `reboot(LINUX_REBOOT_CMD_KEXEC)` syscall is
> > - *     made, `luo_session_serialize()` is called. It iterates through all
> > - *     active sessions and writes their metadata into a memory area preserved
> > - *     by KHO.
> > + * 2.  Freeze / Serialization: Sessions may be frozen early from userspace
> > + *     via `LIVEUPDATE_SESSION_FREEZE`. When the `reboot(LINUX_REBOOT_CMD_KEXEC)`
> > + *     syscall is made, `luo_session_serialize()` is called to freeze any
> > + *     remaining active sessions and write all session metadata into a memory
> > + *     area preserved by KHO.
> >   *
> >   * 3.  Deserialization (in new kernel): After kexec, `luo_session_deserialize()`
> >   *     runs, reading the serialized data and creating a list of `struct
> > @@ -222,6 +223,10 @@ static void luo_session_unfreeze_one(struct luo_session *session,
> >  				     struct luo_session_ser *ser)
> >  {
> >  	guard(mutex)(&session->mutex);
> > +	if (session->frozen) {
> > +		memset(&ser->file_set_ser, 0, sizeof(ser->file_set_ser));
> > +		return;
> > +	}
> >  	luo_file_unfreeze(&session->file_set, &ser->file_set_ser);
> >  }
> >  
> > @@ -229,6 +234,12 @@ static int luo_session_freeze_one(struct luo_session *session,
> >  				  struct luo_session_ser *ser)
> >  {
> >  	guard(mutex)(&session->mutex);
> > +	if (session->frozen) {
> > +		ser->file_set_ser.count = session->file_set.count;
> > +		ser->file_set_ser.files =
> > +			kho_block_set_head_pa(&session->file_set.block_set);
> > +		return 0;
> > +	}
> 
> This is getting messy. If early freeze, then you set the file_set_ser
> here, if late freeze, you set it in luo_file_freeze().
> 
> I think it is better to just set it here, and drop the code from
> luo_file_freeze() entirely.
> 
> Same for unfreeze.
> 
> Maybe also rename the function to make it clear it only runs for
> serialization? The core of serialization is done by luo_file_freeze().

Agreed, that is cleaner. In v2 I dropped struct luo_file_set_ser * from 
luo_file_freeze() and luo_file_unfreeze() completely, and renamed the 
session helpers to luo_session_serialize_one() / 
luo_session_unserialize_one() so all of struct luo_session_ser is 
populated and cleared there.

Pasha

> 
> >  	return luo_file_freeze(&session->file_set, &ser->file_set_ser);
> >  }
> >  
> > @@ -249,8 +260,11 @@ static int luo_session_release(struct inode *inodep, struct file *filep)
> >  		}
> >  		sh = &luo_session_global.incoming;
> >  	} else {
> > -		scoped_guard(mutex, &session->mutex)
> > +		scoped_guard(mutex, &session->mutex) {
> > +			if (session->frozen)
> > +				luo_file_unfreeze(&session->file_set, NULL);
> >  			luo_file_unpreserve_files(&session->file_set);
> > +		}
> >  		sh = &luo_session_global.outgoing;
> >  	}
> >  
> > @@ -267,6 +281,9 @@ static int luo_session_preserve_fd(struct luo_session *session,
> >  	int err;
> >  
> >  	guard(mutex)(&session->mutex);
> > +	if (session->frozen)
> > +		return -EBUSY;
> > +
> >  	err = luo_preserve_file(&session->file_set, argp->token, argp->fd);
> >  	if (err)
> >  		return err;
> > @@ -340,11 +357,34 @@ static int luo_session_get_name(struct luo_session *session,
> >  	return luo_ucmd_respond(ucmd, sizeof(*argp));
> >  }
> >  
> > +static int luo_session_freeze(struct luo_session *session,
> > +			      struct luo_ucmd *ucmd)
> > +{
> > +	struct liveupdate_session_freeze *argp = ucmd->cmd;
> > +	int err;
> > +
> > +	if (argp->reserved)
> > +		return -EINVAL;
> > +
> > +	guard(mutex)(&session->mutex);
> > +	if (session->frozen)
> > +		return -EBUSY;
> > +
> > +	err = luo_file_freeze(&session->file_set, NULL);
> > +	if (err)
> > +		return err;
> > +
> > +	session->frozen = true;
> > +
> > +	return luo_ucmd_respond(ucmd, sizeof(*argp));
> > +}
> > +
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav
