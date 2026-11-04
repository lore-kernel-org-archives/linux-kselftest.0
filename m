Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821525;
	b=uwQIHKBY162+TTNuHEvcviKZq/fh7sKgNSO12x5jiFootQL6IZO7oiF1FDLcuMw+3AWY
	 NWdNRcvfGNy2idcHRawJ7cKVMj5BTbWDb8/cgQue2JD16sHzkhjB3XCGe2wfQw30QwcT0
	 uKpznHiRdDvdHAkbsl5kNVqHNUDQ98LfASSOzviaoNs2txOOlJN4/sp2J4VpmBXZ9PB8J
	 /KxPEEcL+fjIab1Zz4f/7GBSmEW3AFy3oLWFq5EB87cvijmw+/D6KU1uX+dqvsyy8kfu1
	 tEVSYotRiQHIhnk2KOcI2qxnY835qx7kuYehgcJnmNWo0OlyyW1a5PpDMygT/FFML6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AhauLcYrkNfZ4d386lPMrnU0qCgiFUOVmgX6lCm/lmo=;
	b=cKxViXlRPiqW9QywTo4rI4Bhe/CwZEaNDkyUM9U/u0iAINGf0LcmlcREcLpv3IZqlo0m
	 xAZ+usWwrH+x/2zo1ObfoWsgO8VLumaPL3OiH/bgR1bj7nEZ0gxxR4ljJ+Nx4Nt8EvsKI
	 +G9tkOaHNiuvrTxP4n+tRh/q/I50eKn3kuhTCWppurPIEjVvj4uZk0+bPg5aqxU+I4lVE
	 cLP1mEZTuPRi9D1cOrtF6df2f+PxDyfmcMmRGMBMIxtCBjxEcJA5wL12J28acnDqFcZij
	 APqRYLe37yaRHk8A5he5ZILIDYGeLFJpuy/hWAaJKks0WbBnUDOaMYnkUFSDDHj6tjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=WC5ocPUo;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF46608B6E8
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 19:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AF46608B6E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=WC5ocPUo
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eab93a9862so272060e0c.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 11:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793821524; x=1794426324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AhauLcYrkNfZ4d386lPMrnU0qCgiFUOVmgX6lCm/lmo=;
        b=WC5ocPUo+tlRFkU95XGXMDbL6gRJ3pR33pHcTZQ3vEvWYmERsJIIiWabyoYjJkVHib
         mDPBAtqGztGVDEwx2Txbp9/W5N0yj7Tm9YQjy13e/5KVnFje3EitBqJiJGhfo5yo2r68
         0dw2J2R1tLuPWx0dNr/hkp4Fko/46f0EcQzLLqYW/VDsPDjPYysiohYaTScRueqQDXq3
         Z+aLzvLwt7Egd7UsVvUgENoXVcgqi6ljJNxX6GTEuEGhLFWXuzWMujlT7b9iuQ6slD7U
         wtDOUYuXcmHlCjxC2MpCiRjvOiJfbs5DWFxpPBVgbMcZMvEJXFdkKlPj6LjAzhPdwPSU
         TuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821524; x=1794426324;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhauLcYrkNfZ4d386lPMrnU0qCgiFUOVmgX6lCm/lmo=;
        b=cfDJqpOdopXMR+bjcZnr5Toljac0BMi+96oBR6uFjxxx7LCbnTzm8J+Mrr4TbATRVf
         NtlCydx93PlQnTalx41sMJrFRxqF/sDj430XiEdn7UqhPtwJTzMHJMXEKZLKEZDMzMje
         hhffYU2zdX/Rksy+zTx4VsoPGjor5xtKoPISiAcZeikAnhL8PFPsdawl1GOxNuSZphCV
         25m7y79wN8tejWPWajrl8dYTiavVnoyUXzEJjynLEc7tsroFgBz+8v2xI7gFxWrbyebx
         iqWXW2AC1anGaeDPN9YHU3GFiaOPEFfccjhjnHRcrEaJX9XgX4WdPdx8g17647fk77lB
         O3Ng==
X-Forwarded-Encrypted: i=1; AKwUvByiHdVSS08jLWI/vOSVYya/A4Nrpa4bWwvAj08ju76S2pH4rfTE3NxL2NfYaDbm3q1DI1QvBxKv+96/BGbRqtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jZck7BLmt/Y4UB+JgPJLNRnrXiUHqHhtIKeSNM/Yv1BITdIWy
	ZA4dqNMXgVT6UqRsn42W0NJWQSQCEqZJUjPMLd0SHkKTDOVD1ma2UYLh5qRD5it7vlM=
X-Gm-Gg: AYBFou0YRsqyfMIhb7zFqLo8EfqIgpSjQ7nPFqpeuvn7JmA6qfUjaALQJcHttVUnpHy
	cpvKEtq8mEWwCuew5VEuFaxIaeiAHnIUWqN5iS0LghaJ9qjAG97LYAb1hLHNDK475XGKvCvboNc
	PsXlJY0AZ2WjNVAp5i9v3VBMuLRNkHXQ8EidydNzD2zMtJHtDPgxHV/iCjqbnpa/D2wM92MmUl/
	4NlPr98151Bl0T5GaFJUi32ZhFy65fkKf4OdqpE3RK+lTVCu+PTcU8/HrxKoOBLsgvES/MFpdiJ
	iu7x+K+XvSk7LEBBGsDtKLUygbg362bU9qEaGsXbfGhv1wuIH9BeAFFQ3IRMkFjjiRk9MLuhNO8
	nmVBrsktqijNbj0hDBxIyOvu4CC4pA5s9SHa2xSAubM80zOrkCVUR8G0Xw1EwSknJHS8aSPLupQ
	GQQRzzFt2cQLgM0yGGmenpUFGxiEevlVf3DxLOxEJkUn8qkeaZpaw7t2r+d0VJB6c4shEQDvy7Y
	iCYe55TeoHJ0zJdhSO07jVgKpWSiaKRM9hdp9OH7+YT/c5LnC1voHdMHAshJEBBZcRajn857uYp
	wRgH87Ii8AvDCSN3pjQ3JJ4SCe7wXOgBc/DHNnj9oq3R95dKKbiIwu1jPp5Fac95N8yVD/tX94K
	8Dq0V0VOQwteOw+6YARSbTyCsfKXs
X-Received: by 2002:a05:6122:54e:b0:5e5:29f7:489 with SMTP id 71dfb90a1353d-5ec6899f507mr7074700e0c.22.1793821524335;
        Wed, 04 Nov 2026 11:45:24 -0800 (PST)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca889381asm2496927e0c.0.2026.11.04.11.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:45:23 -0800 (PST)
Date: Wed, 4 Nov 2026 14:45:23 -0500
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
Subject: Re: [PATCH v3 09/10] mm/shmem_luo: Allow retrieving tmpfs files with
 O_RDONLY
Message-ID: <auuJ4msatqzoOrjN@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-10-dmatlack@google.com>
 <2vxz5wyck08d.fsf@kernel.org>
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
In-Reply-To: <2vxz5wyck08d.fsf@kernel.org>

On 11-04 17:52, Pratyush Yadav wrote:
> On Tue, Nov 03 2026, David Matlack wrote:
> 
> > Allow userspace to pass O_RDONLY in struct liveupdate_shmem_retrieve_arg
> > to retrieve a tmpfs file read-only.
> >
> > open() requires write access for O_TMPFILE, so create the file writable
> > like before, then reopen it read-only with dentry_open() using the flags
> > of the writable file, which file_open_root() normalized, and drop the
> > writable file. Like open(), which grants the requested access to a new
> > file regardless of its mode, don't check permission for the read-only
> > open.
> >
> > Retrieving a file read-only allows a restored binary to be executed
> > before the session is finished. LUO keeps the retrieved file open until
> > then, and executing a binary that is open for writing fails with
> > -ETXTBSY. Being able to execute restored binaries right away matters
> > when they are needed to finish restoring the system, e.g. to bring up
> > the services that retrieve and finish the remaining sessions.
> 
> Can't you put all your binaries in a separate session, retrieve it as
> the very first thing, and then finish the session? Then you can execute
> those and retrieve all the other sessions.

This is a good workaround. I am not opposed to this patch for 
completeness of functionality, but if we decide to keep it, perhaps it 
should simply be squashed into an earlier patch. The current diffstat
looks bad, as it mostly deletes code that was introduced earlier in this 
series.

In any case, given Pratyush's suggestion, we could also drop it.

> 
> Why do we need to support this in the kernel?
> 
> Also, please put the motivation as on the top-ish of the commit message,
> and the mechanics later. For example, your second paragraph should
> likely come below this one.
> 
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav

-- 
Pasha
