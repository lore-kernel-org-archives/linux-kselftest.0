Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808948;
	b=PGe+T2Tnp+K3jMDl1p4haptLFOK9Cvg7ovsb/Do82/+LGeKDmySqz0l+DXILdvefknqx
	 mkdWCwRr3xT/NqpvO+TNQjtMPea8HCjlxat7diSCggRmGCDbn4+t98JzwyS6npPki701h
	 MpTMxrwRyISnu31Y/YVVIwDESxAuISsz7M4ztbOlGWA4/32w+lH4Mmr8xUNFifk4rhgkP
	 KOlQ5eOvpRXmAryZK7Dfx/tw5rqRdkh95f1ESgMv+9Y9uwpAOJBN1ULq6wUZ0c1Eijy16
	 +sqHd4TDe6HHO2EAxoBDb2KVCUK3fNz/D/cTXU+vQ3L9XdbvuG02JaSbLMW/BqoIF4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OJqTJ4xyg07hJqswmJ5AikQ26UFbu12PW8dHC4PPKvs=;
	b=VgM0pk8YXQFHSzhgCyt/KfphI8bdu6GNwWm2PiBkNlSqAvmaazXMQqzjepPMG+L4629f
	 OoRyZZOwaRiJ72OXOeATi4TQDvxEVzwP4yg0aPhyybD7Gb7Rj6t0IRA8qqQEcPDT0pPX1
	 XOy2tedkwNvA7Qd6pFzOg/YZzdsMwlCRRa5pKLha7r5YSiIhavGziXVZy7LoRw+ZIf7A1
	 H0y3TIjMiTuQa8eKHfqSPSQsiUgvSBFXiB21AfYoJohPgZYeGYHfvA7Fkps9tCdAzm/7y
	 YrSJh+DahHgj2FICPrPNgz/YJ51+hFDDnG9gIc5bb8tIAIS7YJC6R86JYzbkCtGnlvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=OzvPmeDW;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13E9606A334
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13E9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=OzvPmeDW
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9906034086cso231179241.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793808947; x=1794413747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJqTJ4xyg07hJqswmJ5AikQ26UFbu12PW8dHC4PPKvs=;
        b=OzvPmeDW5bBy+zfv1z1W+Hmr2oI47pvOy3dB2/UBfqW2eCXCyi9tDXfI1TlMvDh/rl
         Nm2x9kE47US+HAkFxSooytHhU9bNEBF7Anl4SHKfnGI5RJhiNbRUq+CLiQtBws3hzBfb
         UPAjgPGjSaLt0PZlNevCOa9kBEtMkl30A3wq5rHlIE4Vyrnsiin2y3A2Q9JDein/WeUT
         nZpeL3Lp5JvX5cX+oy8ByhLUpP8fEbIvuV0jmpmf1JIiPRaeYWMr24XjK8gw5gsR4vrz
         iNZXpFU3ev7+1CybZzNzBhEdzleQ6Ti8vJ1TsXIgjQc0UjvVAbaP5rN4oFy5egP6V9RO
         8/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808947; x=1794413747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJqTJ4xyg07hJqswmJ5AikQ26UFbu12PW8dHC4PPKvs=;
        b=T2FokGvybfivc3pIbB2TqJQ+Wp8fE/FeQsTY4F8MglkHvNTXvqck0DZl6376HY3Wmq
         FZsXqiAotYlMYWUvTkj5gXwBvyvFaRi3kwfg0RPOFqO0LE/4guqgnG9L1AuaOQIAzbXr
         oHdegV3QyT0eTSyf3/bedlw6B/pcLI5Pf/S/ADxJayyS6FLmVt10RJKEib6fPS80OuTZ
         ILareiqyBtk3LdlaDRg9u+pEgRpjx+N2z41Fg/1lgJcs6HpflIfnrwonTOr8/r5LmqzO
         2LzhfpfgmExw4QefBcTdGS1W+Fy3a4II6WKgHOgjUWixmQsQrM2g35UUsGtM9Sgu4M8D
         Q6mg==
X-Forwarded-Encrypted: i=1; AKwUvBzM80yzTRCObsOcktabYNNpdl5voySDFzkjlGbEcoE7Y0cz4ICcuPCTDz4J1Lhwfg3ZrDGr3x7HPDO8dJot2k4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ljT7FR+6surxMUS2zQjreLO3uMX3DJ2WDvRGgJEaAPSSgsABP
	cP3IgEfaZyJTBQZ1jyaWfuYzgyv6S/KvMbhkIeC15l7URkTT3JLdrf3zOQLe771qj7U=
X-Gm-Gg: AYBFou2kNlp7P736RHvyfGWiQwwPG0/L1cpXXw2L6cOmZlHPYneWVhV+CCrL/E1Wu1w
	MRPC+C37ZwyJtYNFt2iPXnuWPFGxY5ug78AgMfvJwJKnkoMISLoIVCTR8fgl1+BND7Vr0l44GWq
	lp6XbnSn0J9/TYM6q14M+8ZunOeqOkTZNj6shBhYF7vuLBWTdwtw2cqn+dO5wctoOQwNOLA6lFc
	gMibPRIW+KqhB0Ruf14OFavkLNkMaAILqR08fSyO0/7KuSHdQA/GGsXP5P7xJwk5fN64xxCiOB3
	29JAYT5RYJLBMB/BhkSUA6pvi5TYGpyUFzhyrLO1Qo7VyNhK6Hd8FdPvr6RqUnBhN/litpAIc4f
	VZGoyD3Rw52q3vwWgC5OMDhHFNHiovlo78v7eM9PV4fhX7SRFrWxdrwyGHoWkWrwoobVGioSjpy
	0kEYZMZahyYvjlTtRq2vGtw1/0XHsipNShnpiab0ZYyiQUZKr2QtN0Io41BvD/3BX17cTS1X73w
	Siwonq7lKDCOQOax/oE2zspxBDaAFbkZvBGYWeijyjZkO22UtT1kjHaDm1dPBLQvxcHB/O7YUch
	/7SPmTmpDz3ybSJ9vVTCV6+SVGqKwCGUgPtKZas/vzZjakbcSdNg88hz0C90BhSauqS3Ykeyg77
	JAKqo+nMqDNMt1oyyypT1uM1Yg7po
X-Received: by 2002:a05:6102:8092:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7d0725cfd86mr6050535137.13.1793808946717;
        Wed, 04 Nov 2026 08:15:46 -0800 (PST)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d8afbfe6sm2262989241.3.2026.11.04.08.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:15:46 -0800 (PST)
Date: Wed, 4 Nov 2026 11:15:45 -0500
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 03/10] liveupdate: Allow file handlers to mark
 retrieve failures as retryable
Message-ID: <autW_3fjUS_hEhZf@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-4-dmatlack@google.com>
 <2vxzv76ck7n9.fsf@kernel.org>
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
In-Reply-To: <2vxzv76ck7n9.fsf@kernel.org>

On 11-04 15:12, Pratyush Yadav wrote:
> On Tue, Nov 03 2026, David Matlack wrote:
> 
> > From: Pasha Tatashin <pasha.tatashin@soleen.com>
> >
> > When luo_retrieve_file() invokes a handler's .retrieve() callback and it
> > returns an error, LUO currently records the error in
> > luo_file->retrieve_status and blocks any subsequent retrieve attempts.
> > This is necessary when the handler has already partially consumed or
> > freed the preserved KHO state.
> >
> > However, with user arguments passed to .retrieve(), a handler may fail
> > early while validating caller-supplied parameters (such as a missing
> > argument, an invalid or read-only target file descriptor, or a non-empty
> > target file) before touching any preserved KHO state. In such cases,
> > userspace should be able to fix the argument and retry
> > LIVEUPDATE_SESSION_RETRIEVE_FD, and if the file is never retrieved,
> > .finish() must still run to release the preserved KHO state.
> >
> > Add a retryable output flag to struct liveupdate_file_op_args. When a
> > handler sets args->retryable = true on error, luo_retrieve_file() leaves
> > luo_file->retrieve_status at 0 so the retrieve operation can be retried
> > and .finish() will still clean up the unconsumed preserved state if the
> > session is finished without retrieving the file.
> 
> Should we give some sort of signal to userspace whether the error is
> retriable or not? How would it know it can or should try again?

The goal of args->retryable is internal kernel state tracking.

From userspace's perspective, LUO ioctls behave like any other syscall 
where errno is the signal: userspace decides whether and how to retry 
based on the error code (e.g. retrying on -EAGAIN, or picking a 
different mount on -EROFS/-EACCES, or adjusting flags/arguments on 
-EINVAL).
