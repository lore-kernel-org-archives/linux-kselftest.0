Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D4D13A86C
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 22:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255518; cv=none; b=GuS1D/G+QnaHIxPWizBxDCiuDBik2jyImuMtAsMG4TR+vBFRNz7giMP3VCsKFO69XVoMjeMTXnG/McLb4BZGTA6HlL+3TJSo+aYgAr/XKfDo1Q5/xbl/zA0QhnTMIo+OkJ47gFnzQN/NDUu78TME1er7vm+isXuF72cvQzGRFRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255518; c=relaxed/simple;
	bh=dCVzQ+2ZUEgOwhHEP9zxfIHH7Fby5pavu1Gyb7oLnrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKODzAenatkBelB2NHg8nnCiKfEwag36OX6q/xhk7ohHCjfW1+b8bbh8d4ib9wuoXMHrc+9j7pjHdlgEMRW4x5XvmihDAPOeU9M0UpLpZ/qdZdjiCX6v94LUwXQ8teEvJH24ikX6x2vKnOYEPibHnFm+Yo+/AzA4O64JJRz3N0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CbnEGOhY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CbnEGOhY"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b243198058so90825ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 15:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775255517; x=1775860317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gjuoZin8EjeumwxQWlEEfcXBzhIlUZuPBzNuCTkTKsY=;
        b=CbnEGOhYY93pCIdTzh75W2Fs0ASmGCfsfxM/8cvLTvA+xqj9LieZUWqsmuqvOm2RFq
         amVafFA7GnCExeWxZ1UIBihg8TUjx6ybismWgQrC5x2itFqdWFkJDel2YDKkHT8hxKQJ
         wl1GRp5QFEkPNJgxUqWTUykT8F3OzJClEx0BD7pzfgBQClOhaWCxur0LrPWD9AZW2+Gr
         Vr5HPA0Mhz1moiupTxEfWjb95Er5hBFm698UvnGaZt54NGQ3ZeP9k6NCl8YRrpD6RLj/
         bBi/svdYCYj2Gzp4QWWoV6XIi12l7PlwZnp9CX14af4vaRop3VnK7z1yV7tTESTSgZ/V
         c7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255517; x=1775860317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjuoZin8EjeumwxQWlEEfcXBzhIlUZuPBzNuCTkTKsY=;
        b=JPKAm0uc5Wc3kolfdCTKL33vcUBsHDl9BUXRAP3hYgzFPzVpfH2v6UY8byX1nPQaha
         QRrF79RSpJfZADQVtmKbIzInxw4omcoW3UvggkLUFQqr0S8Mll3XrXZIwGiFgBz3tMyf
         0mW/K61KCOOX1u7irx1UVz4ufiNbZtPGl3DDLoOZJAGK1bVkIoTSOPITi0rMXKx+NKc3
         a6Lu/SnmgvXcVeMY57Klfr1CnGqWCtBKJzd6lpuUzeDmpl8u5v2BiUCbdnOZoVNCrGQk
         uZB3o+ja7CaGhnIUv9gxXcG13zOtvDxb8sH/rDxm6Kl8WkOOSzTyoy+LzMChxZ4zn2hR
         tfXA==
X-Forwarded-Encrypted: i=1; AJvYcCVKDHoCTe+Bp4KTLEYdSltJfFI0Yi7JehEz7DA2YHeSsp2Ow47WCI6+CpxUCl0HxZ9MsnLONPjqxZubvyGoM0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFyvyIARSfWWyaqgkkksW99afpXhQv/JCpJ6u0PmonjDmcptSo
	/e/J/tCCLvCGTyHi9Mke7BhwZgw6wIsf0Em9jVsSDYPjK778saMC40r0m7Z4H4ZdFQ==
X-Gm-Gg: AeBDieuew9TfIV2lIJqscH5r7ia9gFGrTmfdVwfztJt8IhIoDdMPNAAZuV1oWTBPlCt
	Esg+SuzEqb60t1vbNUmDLbbZsFUMke4qhXPyvoVhAbeIxg5a5ANpQjgqm4pSqzdsZ9BRA+P6RuV
	BkjFJKsP6OWkkPfdgab++MNFxshE/Lf7n4EWRGSa3G9a51UBjI51Nz3m7h5ZfSBWwRAIFDXDvOp
	z3HR8jKKBjiUFqnSMHf9nbiUnstdJZwhlxrmwNDuM9TIOc1SBFXB7XSs1RpDexJGcFf72yRSsaY
	OOtv7FcfTIHI49/m8EVrO+QDhWYoBtyR5oFZK223njl8Mzmxj5eD//B9w75sg6Qc99FoNjojwpr
	arkgGspsyxJoAQ9TE/tjY5J5hWTRreH4ixtomzV1eIguf0MDYOeVme3fi25eOpToE53DsvbSvHX
	S8UzWbBnUjGzYxry/+ITpovblkatS/0TFj0a90uSXjsV+g4mEbYqrUtVDr24LKUuFG
X-Received: by 2002:a17:902:da87:b0:2ae:4453:3674 with SMTP id d9443c01a7336-2b282ed2eddmr3770265ad.4.1775255515833;
        Fri, 03 Apr 2026 15:31:55 -0700 (PDT)
Received: from google.com (115.112.199.104.bc.googleusercontent.com. [104.199.112.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe95abc3sm12613068a91.15.2026.04.03.15.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:31:55 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:31:51 +0000
From: Lisa Wang <wyihan@google.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: rientjes@google.com, seanjc@google.com, ackerleytng@google.com,
	vannapurve@google.com, michael.roth@amd.com, jiaqiyan@google.com,
	tabba@google.com, dave.hansen@linux.intel.com,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/7] mm: memory_failure: Allow
 truncate_error_folio to return MF_DELAYED
Message-ID: <adA_1zXLUBqmSHFl@google.com>
References: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-0-92c596402a7a@google.com>
 <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-2-92c596402a7a@google.com>
 <2f177e0f-2eb0-48d0-b48c-7a0a340caf5d@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f177e0f-2eb0-48d0-b48c-7a0a340caf5d@huawei.com>

> On Mon, Mar 30, 2026 at 03:02:01PM +0800, Miaohe Lin wrote:
[...snip...]
> > --- a/mm/memory-failure.c
> > +++ b/mm/memory-failure.c
> > @@ -941,6 +941,8 @@ static int truncate_error_folio(struct folio *folio, unsigned long pfn,
> >  	if (mapping->a_ops->error_remove_folio) {
> >  		int err = mapping->a_ops->error_remove_folio(mapping, folio);
> >  
> > +		if (err == MF_DELAYED)
> > +			return err;
> 
> Will it be better to add a pr_info here to provide some information for users?
> 
> Thanks.
> .
I think we don't need to add pr_info here; truncate_error_folio() always
leads to action_result, which already logs the recovery status.

Lisa
