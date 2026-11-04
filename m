Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831432;
	b=L8smpfTJhQ90aycWSl+1FwTwJivLclf+a+WIYONgwZ8k2/JG3hwLVOAqXQfAf+PYSSh+
	 LYSNI+KFl5UpZi3UaU3nq2b5Orp3vhPJXcLclqKqK6Dj07Ly4O9iWt4mflgJsxO+KVhNp
	 Prg3YfB18YaDJIaiJPsuP6cjFG8kS6KYoWUX113SjIx4n7VtvXP8tIF+yOv0Z3QjA5wGF
	 zS/d0nsw3ixWVQdOtkcR/k10PTGsYwJhTiuBjz6pY7YR3ZF0oWQ7yx+JpdSceShW46/rr
	 I8m3OD66pUujbTEVQ+Bx/d7uLVPfe8vn/qczQfrDbSxtomxIGxhTyEaWN0PGmplty7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=45IHMvHuNfQHmQp3e/l7ZQyBPSv/bWU1s+/SnIhe5+k=;
	b=e37xF2GqNHj5IHDSmKMb2IGl/+/Fg4fwXck2UkAgFHh2JqhPfjdHcxv3DNWTks0k9tn8
	 LItCwKDuRYVUCqqivRpp2Pa0woaqs2AmY/qzQSXhlKEJQ5zeqtJi9nSKUlS7oOUXRO8hX
	 mJjxpEGimyBswBY/oc9NTLmhmL4fu/erSxfzeroFnB6tup+8GgTluvn9j9gyAP+1/E31p
	 jnkAQHthWDledMC6NjpP/3vKp8Owbm2lCTdejMWlVJ/I+dphOUGQ6nG6GIemUuiGe8ToO
	 C5Ugn7YGPYUquId9TEpOSvZ7mDUJ+8MhYb9AVE3ZGatIkXMa4/ikD7gxKIiT8oPvcdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GSTNqouf;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E45C606B381
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 22:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E45C606B381
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GSTNqouf
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0accf6229so348824a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 14:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793831431; x=1794436231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=45IHMvHuNfQHmQp3e/l7ZQyBPSv/bWU1s+/SnIhe5+k=;
        b=GSTNqoufmOCpxSxB6DIpnTk/eG5C/2yBvhJutiJie6deAzBZ820GjEL0CwYPGLbU12
         EGLHaicSIjyD5q59jnIYNF/yUOO0e7lkkX4gor5VSz4qsPiv1W68/jSR9STrKAh/pYtD
         rnge8JQSnBOwRVZw85l6zX2S2zaRLkfH0DzEs+F8IRPdZP+8NAT2VOD4XZNQuhBu9eUL
         MKWZ5opKy6BtnPv3UuxcBNcMz/E85flXa/LbKJD+lWdihEadWL1HmlWmyuxUseRN+ZP6
         0jBi7LZgNJcl5EC8H4nxpA4XIVD0kGDgTjMHs54S6JHs5tUFCaTzvLOmGRUZ6MrG2+gw
         PSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831431; x=1794436231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45IHMvHuNfQHmQp3e/l7ZQyBPSv/bWU1s+/SnIhe5+k=;
        b=GqolS54znXJN1LZHBEci/wHNmrE/E0HL0u9qXfTlpyjOkhKzKaNVpZj0707HyNmq5P
         8kOTZmWLSN3fXz/Q9yWSR3vjs4DVXo220czsZe6vnS9FahokDv0zFsIXFXay4wNj+q/p
         Y4f6RWxVVgB6pzjNpLCABEFdziiLnmhFX01n1lbpWaDx1tmIvF/nYe0HqnTVXJ/NrtEG
         9V0tnmHvs7DIQqNxgFo8+pAr8Ko5AeNu4vzSV0wWRR+voMydMadkle7b/b4NrR/F1urX
         5k8xGq6fvy3RIEPvYdJjuYu+wO4xwyGCjIUbLBnaEg50ASpd26UYJbZvmclgKZUCSN1r
         MiNQ==
X-Forwarded-Encrypted: i=1; AKwUvByplKcKjO3aXzlbT9STpE7DYIgAtGuxYHr17+wkzvJwQEExsFDmRQ/muMMtGFrUhNTuQfkJzzhxxqYeSzfzFPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0LV3LMqRJJlcL8OCF1kd2XS2j0TKA6iMHsPMh5iTsZnRFA60c
	+3RBxASWT0kP/GBCgfI6x521xcyG0ekcrzUFWhEbfMu6xMBMgwUh/adTIpIALsotfA==
X-Gm-Gg: AYBFou0MtPydRs8nDVuULQ1U9g/DMEuaIZKgFmMHChahRTnZ2ngkGfTb6VQ77YOBDHU
	BoWbguwRVz663NmuSyv3jVdWfAKvjMHLbfdgMilf4WKqX8n74nSy+PFK+Fh98ir9H52zFS1yTDf
	9UuET3qc8CjdUjUEklWl+hKNF9jt87NwK+BKso8S2BD5m50B7FYTONFl9yzgRiX4vHd3VLM/W46
	DRXwus4vw5iPYd0Epkv1MeboOj46iHtouPHK9PYH4+1HEJqDzQCR/QDkKAC/t7DYYct9IcLRs06
	pYXwKsWd473LbTWq9kKbfVhKq0SHqnCcDXY/cx+/vOgcP2+5a8DAYQPowjCfxfS1rRGdtt2l84n
	RKraeZn4W2COvlS7VDknn/W3vZXT3z0Q5+ktvoUTtA9b5Gi21vkC55ffA67jHveALv8O50dQRwH
	XLGDjztT356rcj6g/aN7BxoDLxd7ywVCmiuq7D28Bz+iJhaeEywfT+lfg09FGvLMR+92RgyCFAt
	2cxccnWkIhjUe0nDP0pn2nZYMuvJu6qPBQZdb8ZbKcJrzX5JeRWlye7eIY+Jg0WCd5wv2RuIkyZ
	NP8jcw7Ll7inmnUI5CLjOog9qXnlzfz0c62T7Mg8pHnFAX3QYqHYIukY6y7mu1hG
X-Received: by 2002:a17:90b:3d8e:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3ae8979a140mr13152373a91.40.1793831430846;
        Wed, 04 Nov 2026 14:30:30 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31638fdsm743618a91.8.2026.11.04.14.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:30:29 -0800 (PST)
Date: Wed, 4 Nov 2026 22:30:26 +0000
From: David Matlack <dmatlack@google.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 07/10] mm/shmem_luo: Retrieve tmpfs files onto a tmpfs
 mount chosen by userspace
Message-ID: <auuyAseOISaOWwbO@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-8-dmatlack@google.com>
 <2vxzecd0k1dg.fsf@kernel.org>
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
In-Reply-To: <2vxzecd0k1dg.fsf@kernel.org>

On 2026-11-04 05:27 PM, Pratyush Yadav wrote:

> > + * If @flags contains unknown flags or O_PATH, if @mode contains unknown mode
> > + * bits, or if @dirfd is not on a tmpfs mount, the retrieve fails with -EINVAL.
> > + * If the file can't be created, the retrieve fails with the same errors as
> > + * open(). A retrieve that fails before the preserved contents are restored can
> > + * be retried.
> 
> How is userspace supposed to tell if preserved contents were restored?

Through the error code, like Pasha said on patch 3. I'll reword this in
v4 in terms of errors instead of kernel internals: errors from checking
the argument and creating the file, e.g. -EINVAL, -EBADF and the errors
that open() returns, can be retried after fixing the argument. Errors
while restoring the contents, e.g. -ENOMEM, or -ENOSPC when the contents
don't fit on the mount, are permanent, and retrieving the token again
returns the same error.

Thanks for the review. I'll address the rest in v4.
