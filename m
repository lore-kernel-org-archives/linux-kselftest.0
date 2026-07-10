Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4188C43B492
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 16:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701872; cv=none; b=CJ6WSd+wM7N2C/g4mrG1Hcxj2xhwKXjiqjQV/Asd0TtocI1LfuxlPkiIudFvT3gkWWDvPd6kTf+WjWEbh3DLG/qPqM0Xo5RP1fGiy2NzEhg+abjSubV9BYyVqi5xDSVCBi94g0R9tEVs1+DufbtU/skNQ8sl7jQ7P4IqSsmlV9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701872; c=relaxed/simple;
	bh=f7MiJ/V3Sa3Z4+LOlKBCBuiD8YraJfksnG/xFb+njPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwWUPq2k5Ddym+lH3mVeisZg7lkseRTtuk+btjSiYIHY+TGPEYtaFz22pmlHqayMiHFj41wVnov9VlWqXuo5fK11yZdEumaD0okwSrJuQ2Ugmpc/nlLPF1OUuin77l/tR8rjah8c1Rw+Hikl7nfAO6qf3SsbNpyCRqBeaE8Fffo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=FI3oP9YY; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="FI3oP9YY"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c1372f84dso6814051cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 09:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701869; x=1784306669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f7jwDOcuUIXFwEJ3t6jZRtuRC5qCtLyV1KSZwcqARY0=;
        b=FI3oP9YYHhgE4T+LuS14BPDc6wqIOy69I4OhseWi8Rt1tf/J5Mw3KqzOf6S+XJf4aX
         tV/TkU2s864YpvGiyNx/mIKxQhOkoEySrwrleUYzVE/nk7OeZ09B60cbMn2C3XmSQBy0
         dqUTDIHtc1vDT6N+p+5/Cqtfo4tviypiymM9uA+GYCDiJoYk42KS1Thf96n87SaVikK8
         5dCSyAFF9LCmzGimeccwBw2zwbOpBfwEa5eAjiDX/+tKjtEvbX2JvgOrjflIojIjBHVg
         u4wJfYIrprUsVaVeeMCc8E4o9AmWKP8vhp3Wh/GBkbzhgV/KPNV40AuvmCVuiOEOMOXf
         te3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701869; x=1784306669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7jwDOcuUIXFwEJ3t6jZRtuRC5qCtLyV1KSZwcqARY0=;
        b=Zhx8WbqnMXNACf67TjFuWcvfe9cp7DFL1X0Up0YmrpoztES9/Sv8dH6+7GhP0GSYXo
         gdDGS06viL9ErP/zp8nJ7BIKw5emQ8XsmGRNQELxKp8PpfXP+GswY0fotDDcMRDRIlqG
         zp4en5U9d/YkWtm5cTkRACDrzFhXEzCxzk3FJP5VIWz3Y7xNo5UDnuAf+wxZBkb5PJlD
         h90Wer3azZWZlbBmO+wNHiGucGgEqdYuMhQG1aOW6qbHzAzDSeavFz+ecA2aDTasbwXM
         weGwZWLvYhiF3B+gY0vRHQOA5grz8zep2pe6teqeuGcYO/4GBY7BEUFBwCwTY2gkPfrZ
         VOgg==
X-Forwarded-Encrypted: i=1; AHgh+RpxtzJv/ohaPK8WShEXUwv7342IiZVOf05s5jaZT8ZNxMlkLGIo3AcZHCDpQ6GAF6BF4p06uUsB/S99F6baFh4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+3JfAK8EYoB6/Rc8vnOVQz8B3p5A2hItcIJJSiNm0kTo6md5x
	X68wL90+wTYIPC7ignFSRVpys9Q3v4fRWyl1GamkAuYbI85P4atiWGbrDM6GzPRSM8w=
X-Gm-Gg: AfdE7cnVyIBRYJ8JfXeRU02AXGtuiJmsWrfgi7yuXCjN/2EjflmCGzfxISW27ZPvIRA
	Y/rkRXJRk7kdrll+aiJlnzSNyiJVcGoz70xo3jAsqPoEmR6ZeohW2lj5DmkOKfvPHaWcjGTEdXe
	8XVnYApOLZtczE/WCRmBvZll809q+NLtJG9LIk8BG6ql2Wc8qIqo6/W1obw+dq7rAY6aj6Sp7GA
	AxeGMRJ8cqaNMMl47pkvClRVBM9a4B+sOkKFMuUm5oSFy8j/FMxz+LLHVJeU9vygUO6jACcu/Ls
	DdN1xU7hPaO1nKN3LOsFIN7a1Su2thwN7lKbcImXSTYPjXwFEmyRRNgZR0ZQIY5AmiiJ51PGA3k
	pWvmUGucywrYUJ46HHG03Rhm7AYkofw8uL46plAKcAykU93Poc70pGPEC+ZpX
X-Received: by 2002:a05:622a:96:b0:51c:7b12:5ff5 with SMTP id d75a77b69052e-51c8b43fec2mr132124531cf.81.1783701869227;
        Fri, 10 Jul 2026 09:44:29 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4b91sm45168766d6.19.2026.07.10.09.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:44:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEKx-00000007Yxj-3wpY;
	Fri, 10 Jul 2026 13:44:27 -0300
Date: Fri, 10 Jul 2026 13:44:27 -0300
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
Subject: Re: [PATCH v7 8/8] drm/gpusvm: Use
 hmm_range_fault_unlocked_timeout() for range faults
Message-ID: <20260710164427.GW118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345366389.660027.12986386801605494596.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345366389.660027.12986386801605494596.stgit@skinsburskii>

On Tue, Jul 07, 2026 at 12:47:43PM -0700, Stanislav Kinsburskii wrote:
> Several GPU SVM paths take mmap_read_lock() only to call hmm_range_fault(),
> then retry -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires. Those paths use
> MMU interval notifiers whose mm matches the mm that was locked for the HMM
> fault.
> 
> Use hmm_range_fault_unlocked_timeout() for those faults and pass the
> remaining retry budget to HMM. The helper owns mmap_lock acquisition and
> refreshes range->notifier_seq internally for each retry, while GPU SVM
> keeps its existing driver-lock validation with mmu_interval_read_retry()
> after a successful fault.
> 
> Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
> called with the mmap lock already held by its caller.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c |   52 ++++++------------------------------------
>  1 file changed, 7 insertions(+), 45 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> -	mmap_read_unlock(range->gpusvm->mm);
> +	err = hmm_range_fault_unlocked_timeout(&hmm_range,
> +				max_t(long, timeout - jiffies, 1));

Same remark about max_t

Jason
