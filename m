Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14E3263F5E
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 16:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701800; cv=none; b=t5XneePU4N2WcvoWBDiaBD2Xy+tJJOjLnCb/nza2q5KBJupzg3nQSPPNBN9JAebe2jeZIlCVZjb3UEM3PLkG/Ta2EyJ2azMbRd9ny9ab3sOL57Dep+DwoIdS6gAvXxD4hVZeoUYSfl4KI43oFiLQNNbW9gRyeGyALMyZ76rNEwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701800; c=relaxed/simple;
	bh=ZL2zX2D9UZwwCtPCpSQDsF4TpGKLC8vJlz83DhiVqG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcD/NYhGwYjkF7RGaey/DTj1D0jBiQFRGSYla495m9Gj7hMu67k+i+/amQNA2yhrOp0uzv8Mb/GM8AlZTG1bu99VZGtYfltJU1k6ReC421Jy7gmCSb/zmZYVLVAaeJp2UCxj5UZAGYXHnJb7mlKwbFxXQxFwngsU+93D1oZ3vYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=nNEMWVJM; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="nNEMWVJM"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8efcfdb2b43so7501356d6.3
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 09:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701797; x=1784306597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cCrA5GvcNcomQ8YHAskvpnsx6mUAVwyB/JWdGkfbiJc=;
        b=nNEMWVJModhaBRCINi+FBpUkRF42YITDUmaNfZzSBHvPg9NrZ5EOLuypsRSdQlefg7
         oxcYZ19D8SEX6K4I0Lms+75ZlmArcj5nl+qk1BmuOaaTbYB9ax53/jER1y7CLNG4oWj3
         gUBLFBEwrsTU6tYh1gd2hNMX+69CEtCjCqYqVVfFvwliKbIff/rbnjtI9XMujtL5ligK
         8mnT2a+QOt9R4GAiwAN31xOSjAB0ygXLbNdv5D+OHihGYrgALqujJActN8caqbdDTDBs
         vQ7lt3H7VOzFpb7aTndu51FdomfRuXmRy2jMv76FmmRkrNC+hC5St8uDirIRn6ubESiC
         MDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701797; x=1784306597;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCrA5GvcNcomQ8YHAskvpnsx6mUAVwyB/JWdGkfbiJc=;
        b=XRHevItJ6NksIebvc5bZaPZMbNx77QcKpNIEgBTdxWtAOIJmgfraaCzIZWZTYJ7iKE
         JtKaWbjMULN11G56rYtR8iDyX7Hw5xPI1AJcQL02fYYXbrnm3pqn+MWY83Yd7SkliIIC
         BNJyJsmSw7BAckPFZQrItr7YLcelahGxSDlES89rahfaviwfCnBVNdzbqUmUEylQ1hil
         8GIO4BVhzzK2eJ5EePlwJWp16Fmps9L86mTk8ih6XGxoEikbSIlyz5s8hdPPFHUTOiv1
         P5nU8qQQ+tfgmE16kDnU4lpNFc2OiELNK2gdc4/Hiv4O6/AWNwDuxh4OdsL7PpCWPrMk
         H5gA==
X-Forwarded-Encrypted: i=1; AHgh+RqpHxt3Wn5WTZ8x4NYQ8nxIJedDe/jxH1MPQhgCtItyyOrhZKGPhSkDrboaYb+nrn2c6favyFXJMLX62Ou2I0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwidlaxMBuU+6YwoFDgMkL+E3E76YqDkrGJnx4mjK+fy4s/PQJk
	Pgeriuv9RmmqaRJzW0+7cxNBKc2F7jjY1g2rMIkB8jYIpGLnlY0Hy0fAEfN8WVuPQ8M=
X-Gm-Gg: AfdE7cmv2S5RuaMopIMMlXCa9qqw2aci0W9uVcLrAV+itPwWFdUOkG/Ji/T3XuBOozH
	fwWKaAHwgO2fIwcxCPf9dD83c1IKbSswisheMD0xBJG4l6vCObTtVRUhEh6/VZpEkH7G0hIDavc
	yA9YGoWJeL8EcVKQU9OpfU0BGOoju/r3SrkDpjMaYW9sEuUDkgnCvJj4raUnO5rx1DT1j+e+tE9
	fE2ha9kBTQmO9kTkjw4Mn4NCO80Mb2UglACZrCVuIraAz6P2Pk6waKEmjIujntRaCbQACoD/Urt
	t01AdHmZ3eDEwNVF51v885F6LtTDS3acTN85CjA9l2LnOPFNCOd48V4xCp3aoOLtMWtA5l/DC7W
	M+IA8MOHRCBzIiNQCrzI62+h6c+uXmBF0I6VDfyPufZg/o/FZBT1pAUojrk/t
X-Received: by 2002:a05:6214:43c8:b0:8f4:4d6:8adb with SMTP id 6a1803df08f44-8fec1d808a6mr146369176d6.22.1783701792723;
        Fri, 10 Jul 2026 09:43:12 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-900a7f8f5d6sm30725036d6.15.2026.07.10.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:43:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEJj-00000007Yof-1AFg;
	Fri, 10 Jul 2026 13:43:11 -0300
Date: Fri, 10 Jul 2026 13:43:11 -0300
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
Subject: Re: [PATCH v7 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout()
 for ODP faults
Message-ID: <20260710164311.GU118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345364975.660027.8790629832830633290.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345364975.660027.8790629832830633290.stgit@skinsburskii>

On Tue, Jul 07, 2026 at 12:47:29PM -0700, Stanislav Kinsburskii wrote:
> ib_umem_odp_map_dma_and_lock() takes mmap_read_lock() only around
> hmm_range_fault(), then retries -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT
> expires.
> 
> Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
> the mmap lock and refreshes range->notifier_seq for its internal retries.
> ODP keeps using HMM_RANGE_DEFAULT_TIMEOUT for each HMM fault attempt,
> while interval invalidation retries continue to be handled by the existing
> outer loop.
> 
> ODP still validates the interval notifier sequence while holding umem_mutex
> before DMA mapping pages.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  drivers/infiniband/core/umem_odp.c |   18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
