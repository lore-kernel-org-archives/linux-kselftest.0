Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1646643B4B7
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 16:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701830; cv=none; b=pSUlURLxNLC1fBspLxeP0+4PR8i64G5Fy04RjBiQdYuyDXRhghDo9D73IkOAcMpVpL1rS1Hbkq+Ky7AB2K71z1v8iXBFObPvEEVDLA3gx6WUmEmtk04b5ohIK1jitHoBON/jaIcIxS4/SP/mELIT6fTStFhnzO0NDiOD/9siFks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701830; c=relaxed/simple;
	bh=uIhVIgctXUQcWy00AudXCG6kW+KyBF/3q5iL5v2zEVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GS8ZOctCOjN+D9VIfCqv0V+a0jow9xOUB/Tv/ArLImSJUs8bs4vI1bqrhXq2uQXUhLXXDgVt/f9qX6jTtOfV/Ce7ScEJLZ6GwXXtHouYtmXeAGOEk0F15LGiKAjMzhu+9oOeK/nG2i9AAgT2oCdHV5Zd3eOI5LhiebJYPIgY3Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=AyS1Bxmo; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="AyS1Bxmo"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e55b62640so55849885a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 09:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701827; x=1784306627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WXM4slhr2CFKJAVwVD2VemgO6fJY6jlNQ4kyqua9fHY=;
        b=AyS1Bxmo0N6YHkVKH9oyazzctAf/4C32alIBv/QFTAAa8UmyfwpnYGzVReGFWv+DP3
         VcpePWyG1bS/CSWG/+IpVMdTuFeZrVes+MBNYw+9jRJF8pK+0K9aHMt4bLIgaQ/7/9hy
         VEfaWMdWITdKdLpPAeSE7Qtwa29EwC4oxt3cBiOlEwjIPNBgoy3jXc7Geh1fAHMdfQfZ
         Kmmja0r7dBY5Rh+6mWUg0+qVA8QOzx1s2Y0bHZcGk6L+fiUylkBBPLREklZMk2T+VfcS
         x9bojoZx144A8gDBS9ilm5M0wynR0XIEzLUj2z+6xCiHnXv+Il1atWK2ekrdouHfCya1
         A7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701827; x=1784306627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXM4slhr2CFKJAVwVD2VemgO6fJY6jlNQ4kyqua9fHY=;
        b=s01kY2DUW+LgyReABjcYQI+BmLrnOHBpQVA92qWe49chlewEMUMF8ouci9IqW6hN60
         mIUscnjHS9iFtm1VBYHFEXmhXkeOW7ERsWlHsfpPu04O79XXokJxhf2yevPCE2a791uo
         5C+dzNRd7AAhHPLyA9d2skjWyTZD09skVQgOieANWSI1o5I2sm3vLspfb+3IJhsugNyg
         Esu7ihFrOXNJLkl/I2+fLDGcsIB21Qvbma4+ZyGBzYZr9hAvhcBcD2gJtlSQgLnUcfTl
         U26Ua3tMjZ3LO23SpG1mRT5BBfQ0y95iwgUk8G6Sb1Eqt2zXshufYSsapauQ2X+qVJyK
         KhZQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1kKwWfvmOhty6dtn00nxYTh7x+gwUPaH3oSfWQ04WQGy4T00e4RDwX4Zlz8oiLMRtwxezLDtnVc0PQv0K6RY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVEVjz0c94afV4zadxV1rGxjofsOZw3UsSFDUffXqFoomEzawc
	+rc//Vv1Zx8v9XZaFDQzYnQShOgMrkbakS8D97YsXujUtyknvbRlJeGHm94XRls7Wss=
X-Gm-Gg: AfdE7cmaH/3lG1P/1mtyAafZrGzy/Pu1uykdBclA34gSVkNPIM5VJl+T+lCNDigw543
	aIcQWBBGE6l/aDCtGqXQfos44IzdCItQ0YRaCK+RUqFuds8gZmSxsdrl8MVNtZFMdvia9OQ3Yrj
	qKAmZn+sjNF3rDmqrZLOih1RyarlxxOS3oFM6KEijad3t1iSv18cxB1w3EMsQH7hlpOBtXbTic/
	ZmN749qe5GxgyvZ0qcQ+suk7H2xUca9p4zGHXX9S7uEA5f5ZOx9jAD3IC2GdmOlqG9We9uU6G5w
	mffaQ7ZiG00tChJMN0ClnDnIoIhB213A3i3TA1+mNDbQuJAl/ZO5thS821X2Sr3qG7OLdiaAW+Q
	G8YQ1wWHa2Rj5tJqMot9H75xGChTUwNVrd0Gsr/37rvvmbBWlWUor2CAOjTLJb1XfTlod7lg=
X-Received: by 2002:a05:620a:240f:20b0:92e:e569:dc20 with SMTP id af79cd13be357-92ee569e3c8mr347342685a.78.1783701827057;
        Fri, 10 Jul 2026 09:43:47 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee59223e7sm237517985a.0.2026.07.10.09.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:43:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEKH-00000007YpZ-3qzk;
	Fri, 10 Jul 2026 13:43:45 -0300
Date: Fri, 10 Jul 2026 13:43:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
	corbet@lwn.net, dakr@kernel.org, david@kernel.org,
	decui@microsoft.com, haiyangz@microsoft.com, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v7 7/8] accel/amdxdna: Use
 hmm_range_fault_unlocked_timeout() for range population
Message-ID: <20260710164345.GV118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345365679.660027.16671418103486907555.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345365679.660027.16671418103486907555.stgit@skinsburskii>

On Tue, Jul 07, 2026 at 12:47:36PM -0700, Stanislav Kinsburskii wrote:
> aie2_populate_range() takes mmap_read_lock() only around hmm_range_fault().
> It keeps a single HMM_RANGE_DEFAULT_TIMEOUT deadline for the populate pass
> and retries -EBUSY until that deadline expires.
> 
> Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
> the mmap lock and refreshes mapp->range.notifier_seq for its internal
> retries. Pass the remaining jiffies from the existing deadline to HMM,
> while preserving the driver's existing outer loop for interval invalidation
> retries and for selecting the next invalid mapping.
> 
> Keep returning -ETIME when the retry budget expires, matching the driver's
> existing timeout error convention.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  drivers/accel/amdxdna/aie2_ctx.c |   17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
