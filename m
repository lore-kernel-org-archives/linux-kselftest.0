Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792633499;
	b=JAZay7ZeQ0R9FqdwrV3aWCgvJiBf+kRrK5uW1UMdw769uKCzNxi1hijgaAUpsM07sz/Z
	 jg/xjEweoJYTdPaG/LiLB3PqomkYaMxBPXfrEp+o1KKVNG+kAOLs/Jx+NvWYxlfUROxXc
	 jDaN4p3Upxd9nyApY6tPZH0jYih/Z04pxUNRO/Q2rOb/RTlEG6z8q3BPDyhF3dl6Z2Z/U
	 rfhfa4YYvmAwNF/2I0GcNDWSYjFRz+RDVMjtxSNKXaR8KG9vgDtQ8Z6sHWlODI07telRs
	 himlTVhdkMLLpOeyKhGagAuz3NL0vharlMQgWTgCZVrJYHehKndpjulwIX6vueTgaVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LS+EicQQq2YSXAcv/CHPjd9x8RnM4wjQksgtpzHAKuY=;
	b=IL3GiT3eclsugLoyqAtwwySIvUw73nIEvvKiXTKMC9hK5O7hgrbwX9DpYooa7BXBjynD
	 vUxjHGyrcmCH9Moo75JMLjJlfaKdwHAyiyydGlgDbAhWCii5josmxT791dCjdYIYlmutu
	 WmC6ucxVSBt1Bwy1nKdVU1YMk/iYTAJRd82y8xpGndV7AXGpwjsoEi59QKBM0EZn30HvA
	 NVbiJoP3EscasElGu6TpEWgQz5l4OzUtxtTGjOHdbINQw9rhls/QVkxjvkt1zO3aSZfS+
	 kovY76OkJX8sqxtxyNrIaJODfwsYOI4UmS+96fLxNQ0NHLLcOmzKPPAzSv8lo/A9oiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=a29lh53a;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C70A606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 01:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C70A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=a29lh53a
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so1066819241.3
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 18:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792633497; x=1793238297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LS+EicQQq2YSXAcv/CHPjd9x8RnM4wjQksgtpzHAKuY=;
        b=a29lh53aOFaSgInPOugDA6w3Jxk/dM2bSqceVpUB1dbglXI1+ELHAJGS7w2fsRTr4q
         6TAXei2sXE2XqwdLXz3TcBmgIHXdvBezAlwKzO3CzCoYzGnbiFhJU4u5LP4TQbgoh7Qp
         gXme3XEx7bUQ5RMQRx3aoKlPOhJjBWgP8u2PYAUVT0bzcIO6Rqp+C9ozSPPQbt+tb0lu
         WU6COpW6eEAVCYF8P/WwoqE7y3FrRjl8zrnFiUtTH4oQ3OYrwT12iNdbESAhCpmw3PzN
         FJ8pFxNrOjfSvdi8UTSv1KwIpnpsqVPkliYbSZJYy6/A8m9+III59H5neFGpYyvM+P8K
         YblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792633497; x=1793238297;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LS+EicQQq2YSXAcv/CHPjd9x8RnM4wjQksgtpzHAKuY=;
        b=Y6kiZ59wxRx2/iN4ID35gxauKUZhk3Ahwh8JREhw/m7bbaFEBedYu1p3ZghA4SZK7c
         7I9ArqO+EVxNAF/hQoOSw5LONMvOC8YtrZxtrslMpu9ScBx2b2IiMk1sqwQ3Rr+RZ4tL
         RolwBb23UyZ4sC4rK2FGPBIjrQm1Cyng2jotvZG78t8b4tW0xGn4tYIkaYmcmf0/Ifm7
         rpyv3bu8+jUdedfNATSCAJRBTqyV01DIYbaoFfPFOxAoMZ8vFhxkM/256U0UZyT2nzMR
         /3+MUTNtBnsZv6BhmJjwZ+I9/TBSyexbmD9I34qp/fUIJ2jyEAMdGv2gBxcg51wPxpJf
         XNOw==
X-Forwarded-Encrypted: i=1; AKwUvBwvYgnajryprm9jQ6QWm3iQy58YGxl/ebRHucgvg09EiiG+xy5M1LGP2mhkQQicDqEagM/qm6k7EhtDQdJSdK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhGZJ8UiNEAjgYyOzFU6S4X33XyvJyK2Je4S9+Hjdxw7/Vp0qH
	5RalFiFPrFzzwZkYT8UK4utpaGb9w7aTfh3tm0EQphJYgAVXByrghbWvj8p4eRGudPM=
X-Gm-Gg: AYBFou1C2Pr68TtqOKr2z4LPGa5CR3jAxQ5sHGYO5w9pmLs2lJFKUJkYMzDWFSf8LGe
	zOX3II67a1VHt9DE/WfdqqAOFKnRd9MwVPcFjsUlf/U0ek5FbiuRcwsAPXh1XMhCAr9VKceOB8n
	QapRJbZ3LbtYsi6UmKQjlavS7rVh9kN4dZxj0a0Q5QXrM5cE61SYz/FZoRYBArACoL0RwVzldTb
	/kI8Zw0tIQk7adpTURdGj/gs0cU7mbrVHWkA/Y6Azerzfmlh8BfkHTl94DOSZEZ0j9WQpdXWvNf
	s3CboJFLhrP5jbH9idX+bSylBigciWRSZnpMmhgJWLo9ujt4Mc8dkx+ceOdU27oEPHcmogFOe09
	HD2JhGypu0rh619fEcnJkwJ3tMUXFplTNTc6Q2gWulISqGlnmIG9OskekXxfsNh+JJCLsRv8Kum
	NqK2nVEKfTl+aUGzG2M8x04sOsycBRLx7tfyuqqn6C4oslErzA1/O8OAPU+47yu3bKAfgLItSj7
	VgRtIYRh//LejvxKWRumZgV6mJcCa5ptXmR2QPH3cZoH9HaZKVvnfAjIBJIZmuuaXDqMJGdBJtz
	/pElJWSUfmLIYceJPV4XmClcjC7NRxhBnk7Cwyh4cYBEunkbbloiCeIJs4MWOg2dkssJcfZC/WR
	HPQ==
X-Received: by 2002:a05:6102:418a:b0:7be:25d4:7ff0 with SMTP id ada2fe7eead31-7cc92469ecdmr1660230137.4.1792633497085;
        Wed, 21 Oct 2026 18:44:57 -0700 (PDT)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d104017bsm4933026241.4.2026.10.21.18.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:44:55 -0700 (PDT)
Date: Wed, 21 Oct 2026 21:44:55 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org, vipinsh@google.com,
	linux-kernel@vger.kernel.org, dmatlack@google.com,
	kexec@lists.infradead.org, graf@amazon.com
Subject: Re: [PATCH v2 1/2] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
 to freeze sessions early
Message-ID: <atlql8V0YcXGRxS3@google.com>
References: <20261020144710.4154339-1-pasha.tatashin@soleen.com>
 <20261020144710.4154339-2-pasha.tatashin@soleen.com>
 <2vxz4iefgy36.fsf@kernel.org>
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
In-Reply-To: <2vxz4iefgy36.fsf@kernel.org>

On 10-21 12:14, Pratyush Yadav wrote:
> On Tue, Oct 20 2026, Pasha Tatashin wrote:
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
> > @@ -218,18 +219,33 @@ static int luo_session_finish_one(struct luo_session *session)
> >  	return luo_file_finish(&session->file_set);
> >  }
> >  
> > -static void luo_session_unfreeze_one(struct luo_session *session,
> > -				     struct luo_session_ser *ser)
> > +static void luo_session_unserialize_one(struct luo_session *session,
> > +					struct luo_session_ser *ser)
> >  {
> >  	guard(mutex)(&session->mutex);
> > -	luo_file_unfreeze(&session->file_set, &ser->file_set_ser);
> > +	if (!session->frozen)
> > +		luo_file_unfreeze(&session->file_set);
> 
> "Wait, this looks wrong. If session is not frozen then unfreeze it?
> Should be the other way round, right?"
> 
> This was my first reaction until I realized that you only unfreeze
> _automatically_ frozen sessions. User-frozen sessions stay frozen. Which
> makes sense, but is not obvious at all.
> 
> Perhaps rename this to session->user_frozen and add a comment here?
> 
> With that fixed, feel free to add
> 
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Thank you, I am going to send out a new version soon.

Pasha

> 
> > +	memset(ser, 0, sizeof(*ser));
> >  }
> >  
> > -static int luo_session_freeze_one(struct luo_session *session,
> > -				  struct luo_session_ser *ser)
> > +static int luo_session_serialize_one(struct luo_session *session,
> > +				     struct luo_session_ser *ser)
> >  {
> > +	int err;
> > +
> >  	guard(mutex)(&session->mutex);
> > -	return luo_file_freeze(&session->file_set, &ser->file_set_ser);
> > +	if (!session->frozen) {
> > +		err = luo_file_freeze(&session->file_set);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	strscpy(ser->name, session->name, sizeof(ser->name));
> > +	ser->file_set_ser.count = session->file_set.count;
> > +	ser->file_set_ser.files =
> > +		kho_block_set_head_pa(&session->file_set.block_set);
> > +
> > +	return 0;
> >  }
> >  
> >  static int luo_session_release(struct inode *inodep, struct file *filep)
> [...]
> > @@ -267,6 +286,9 @@ static int luo_session_preserve_fd(struct luo_session *session,
> >  	int err;
> >  
> >  	guard(mutex)(&session->mutex);
> > +	if (session->frozen)
> > +		return -EBUSY;
> > +
> >  	err = luo_preserve_file(&session->file_set, argp->token, argp->fd);
> >  	if (err)
> >  		return err;
> > @@ -340,11 +362,40 @@ static int luo_session_get_name(struct luo_session *session,
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
> > +	err = luo_file_freeze(&session->file_set);
> > +	if (err)
> > +		return err;
> > +
> > +	err = luo_ucmd_respond(ucmd, sizeof(*argp));
> > +	if (err) {
> > +		luo_file_unfreeze(&session->file_set);
> > +		return err;
> > +	}
> > +
> > +	session->frozen = true;
> > +
> > +	return 0;
> > +}
> > +
> >  union ucmd_buffer {
> >  	struct liveupdate_session_finish finish;
> >  	struct liveupdate_session_preserve_fd preserve;
> >  	struct liveupdate_session_retrieve_fd retrieve;
> >  	struct liveupdate_session_get_name get_name;
> > +	struct liveupdate_session_freeze freeze;
> >  };
> >  
> >  /* Type of sessions the ioctl applies to. */
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav
