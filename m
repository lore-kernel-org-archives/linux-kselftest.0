Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CF73E7647
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672765; cv=none; b=SI3+4GsPmTG2eyREMFaYi0Ont1wDEN/3mDxfDi7DhqFndxe4eF/F78qnyLIxHq5PPQuNONwfvbzYNTFmkf17EuANl3FGeGVeQk3GoQjIyJCjt9r9hugkDgCUS/Gj1/z16FSB+9CERjdf64vuu2t/yk3ZWYMvxjZY6ZcxNzNtlqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672765; c=relaxed/simple;
	bh=8QBQayhQNtGpDP1n1M55xxpbZasgavD+PCoPdkBpQbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3dHebii1tYV7gaMua5YBgQL9sDAxU6aFi9d+fxAy09ATbet4qje3dIkoQ+IG2tdz7/FNOVw8k5L/7AzOiQf51Ikv5CSc/nWHLTv7OE2NIV4RgINXZS+K6ILzizsuwraf8+ZzwnSyPVKmWeWMta1ub5Lh/iw0OWuCW/ie800RLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1WfZCkW; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1WfZCkW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so2232023f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 02:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790672748; x=1791277548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7TExyK8zIEMku3wrghEduJ+4wDucgiERD4p9sT26jE8=;
        b=f1WfZCkWoJSJP9SKuQu/OlU1rcke1hUiwlY0qZUBTbAamFQusLRIjb72bT6CHp1Yqh
         Wh8D06X2DBJisX44YaKRpMizJCm0SIcMsV99a2Tdtw1JGfr9PLWJ0BWJ7AOE4EV4moyo
         dsw0l1NJ4A0Rz5yAwTDOoQyKFs0MMSwPRXR0gZ3uIPOz2pxaLWGz2EBJWbmlr/S78Iif
         IMU1jJvkKdZ4pDRuDMyB4b5+nxBgMAWm6ZplKomwACPiwPMj8PXkHni0VA3cn+w+QvxG
         avyBz41KdVyP7/aMxReIzh3eOxHK2/HcvlXOFDzkf50En9/zj+vZYygIHkjGx7cxZ03N
         8j6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672748; x=1791277548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TExyK8zIEMku3wrghEduJ+4wDucgiERD4p9sT26jE8=;
        b=Z5+5gzCOqc1It2mS6dNoex7R8n3lCC9QK476uiLefL7Suu9H64i/x5kjvKd7uqgYOK
         R8zKIextw+aVuHa06bk55IE18lox0YYxLPGtsAZ7nYdtEZnBeJq8deHykyiZLE6/OzFj
         xTBKt/BZyqV+Loq4RaLnhttaQvNy54CoJNeEnciqxOn0lo1JyiDyC96CULsFSKK/++5t
         ItG8AY33So2CMqFM1Z+QkpOjQO0mU5WaEuI58ExJoEWa4odb7LPBazidHDsKWHZwYizP
         6wdJJUrxI27Wyz1rZOONKkWBtgYBmNP/qJQfyAC23mawAkxF5dDF7KdRFfoL61Fl7+Nt
         StdQ==
X-Forwarded-Encrypted: i=1; AKwUvByrLkcmiRZ/eQk/kP2WW9gBAuly0YMH/jmMfpkjJka/BjqQJ0csURhsa8KrHiqwDDzQlgVKeI68vr4ddZRjzv0=@vger.kernel.org
X-Gm-Message-State: AFuF++kkANyeD+E4K8htD8IHGaKsYODXec+JOE5YTO1Olb69xLKU01/c
	hoTa1S7gBCYL2viSWk56xphGrIgrPZMPs7xMcxHa1e9y3zttt7eXzfjD
X-Gm-Gg: AYBFou1HnIRWxCvp5YD3091NIAShj1JDv8jhrzejlMb6toeqlsyA/qU2FbFMa67vhbb
	8CGpCSMde68EXOU80R8JwTQHFDCTcayX5Twt3mR/pTYwX+eI0LP0aZ+kiMMC4QvLVmv27gFgNfq
	vv3K7rgZJRpx79mtRdySwm+82hylYPm+q/7lazX7UrYSxvHRPiPXeT86uE/xfkt+WsP6jcXUeDr
	4ayNXi3LfvjNAGCCs4oAP3oWoR8xT4ZHJ2OCP4UDGNml5aP363cQ1Klt2rXFfij2cn3Kr+b0EBF
	VjHkirD9ToopR7nVqm56j79t5elf98cBRHGLDDF8frSBO1SbD8PcjYReZgMZ9MwmeGsW3g4XKxo
	D5K7kFZj1N12lbuqloWAtkJzHHtK13AlHLjp0qycICp14LMbZmEzz0E4xbhgPuhgB993K7jhL0l
	qGukOOLqksn6tLzg2YJckI7ksOjffLqOIhDnCRzdlmNan0h1g3tTu/hgTRp2E=
X-Received: by 2002:a05:600c:4f45:b0:49f:fed0:fc47 with SMTP id 5b1f17b1804b1-49ffed0fe54mr144940245e9.1.1790672747833;
        Tue, 29 Sep 2026 02:05:47 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf868b5sm90738705e9.1.2026.09.29.02.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:05:47 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:05:44 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: check MREMAP_DONTUNMAP mlock accounting
Message-ID: <art-TQZISqp3frvp@gmail.com>
References: <20260928111055.482136-1-azpijr@gmail.com>
 <ae606df5-7d14-47b4-8569-fe47321bfac7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae606df5-7d14-47b4-8569-fe47321bfac7@kernel.org>

On Mon, Sep 28, 2026 at 02:08:51PM +0200, David Hildenbrand (Arm) wrote:
> On 9/28/26 13:10, Jose A. Perez de Azpillaga wrote:
> > MREMAP_DONTUNMAP keeps the source VMA in place, but clears its mlock flags
> > for the whole VMA while setting them on the destination VMA.  Two cases
> > leak mm->locked_vm as a result:
> >
> >  - an unfaulted mlock-on-fault VMA moved behind itself self-merges, so the
> >    single resulting VMA loses the flags without the accounting being
> >    dropped;
> >
> >  - a partial mremap() moves only part of the range, leaving the pages which
> >    are not moved accounted as locked in a VMA whose flags were cleared.
> >
> > Add three cases to the MREMAP_DONTUNMAP selftest which mlock() the source
> > VMA, with and without MLOCK_ONFAULT, perform the operation and check that
> > VmLck comes back to zero once everything is unmapped.  Each case runs in
> > its own process, so it starts from a clean mm with VmLck at zero and a
> > failure cannot propagate to the cases which follow.
> >
> > Verified on x86_64: the three cases fail on v7.3-rc5 and pass on
> > mm-unstable with the fixes from the "mm/mremap: fix two issues with
> > MREMAP_DONTUNMAP" series applied.
> >
> > Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> > ---
> >  tools/testing/selftests/mm/mremap_dontunmap.c | 273 +++++++++++++++++-
>
> @Lorenzo, could something like this also be implemented (maybe with less churn)
> in the vma.c selftests?

if the size is the concern, most of it is the per case process and error
handling, and I could try folding that into one helper if you would
prefer a smaller patch.

--
cheers,
jose a. p-a
