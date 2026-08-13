Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D942432B114
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 01:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786584075; cv=none; b=dlifqWE6nXi2iC1fF0iLyyF8rs/F3i/ZUmACte6svH5Pn9EXl2OLqQa5GWR8JoKVIfKjPK1wysWomboWLJhxRiFarE7gFOhgloIdEDF60FpPmAsaL0Xwp0V0HRS5VZiWgGF8yoLP8MouqbKBdyKudJomzwFa8c6xZNTgAVtKfiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786584075; c=relaxed/simple;
	bh=jQAWRVENXd5JGHsxo/hf6vUttuV6ujE/QtYCehIVHRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkZ/Til3b2tLuqTIuWF55sHJfsBZXOil1JIR6Ym3ev1+54+x7R6o6CbbaTp+awjn5CWXYHPzMWa7FwXweZMWXGdtjHAoCIr8u78GGDowQZY+zZXsN0ElVS7kMU3nCdnMb0qKEdg7j5uT66xbFQdOlmGoy4D/i9YcYux4cVtvVF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gV8Mq8xE; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gV8Mq8xE"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-90a6b298889so1876526d6.3
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 18:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1786584071; x=1787188871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZGIPGO62vUWJJtnlWOV7HnIzQD6+wbjwlpycp53S1ew=;
        b=gV8Mq8xEA4vtp2rDR+jnsK6TSSY301yKIdCVoD89t2x3h9Hgh1rrBdXjPL+CXFnKeT
         SgVmxK9YhwfBk26NKuanp3J6BqnN7/USTpDab1KXu05gblpMHZZhHLaHX6OYZjrkSTT+
         ndMAlJK/eFZotlpBWs/cl17UYJG9pm8sN7oSr2GxLXNHrirOvdufd5pCS61GGlFgjQET
         UblzbhY28gXamsNJPH9B9mCtMjh0uO2f2nXQy8B2vIpvJJnTFTdLMwOELMREAc5ZnPHV
         bljYuNumM7lTPeweZ05hCOaUTdzG6R7ZVXB7nWY2NU3i4BPv37QoHQw7aN/CUrDZSC0J
         p/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786584071; x=1787188871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGIPGO62vUWJJtnlWOV7HnIzQD6+wbjwlpycp53S1ew=;
        b=pbqYDijuyHaWWmmYG2PTfeBfQ2mxQQF20mKolEP9uBrlF4bB1ly3sd3CMUCCBaSx7M
         +SgO0RcMmQOntPDMaKE+a2wn587cvfAgfC7ETPfmpXU5YljVDF0whuvj25bM7WppXqHI
         LlSPfkpc8dAOCGRhDLhQhFHu58tpyTwvDRTODM9OBCEBER6J0GZwCmKw4dh6+O+G+UFp
         MFc9GsTSvaNq5TlMKS8GrBlaYkT7/iD3KxM4IgGqUgdU8h/eMFAyqHcPoCYQEWosvFKU
         YufGH7IRomddEofKqIwQcpz02iJkGHgFwzAIEFAj4TLjlu3hbsiwHBtBVXOLjabHypvt
         2+WQ==
X-Forwarded-Encrypted: i=1; AHgh+RoL/G2A3mLUdrMixqzYamPMQCkVNgLSYMf78wSQ6yynYgo+fatoS3Rb8Gw5uAQGgMHdhXOZ+oAEUDC6DPAN8sk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Nhf1hZB9Xrw+pI0qeQ86w9ED0gSIWlJXpY6/NYCQRZy9Oxrf
	DJcoIJFeeTcuwdd1xbp5FUnfWpqTtsk/5dE01uurGJyJ2YnmS/hJg3cW9ABgYtFnyLA=
X-Gm-Gg: AR+sD12XOW5Z9W1r5CD7OwWSUFYt3HqpWqYS7RooktuDQoumdkw9XpD9RRObl2y+Jcf
	NqMb8jD2Lut8xKVA52rU9XC6cx7YVJB3/9lNyXnonelkOWJF1tAr2VOub17hI8iTb2JL3hQQorn
	/XB8Vg8fJJ9I6rDr23F0OBaIsvqJiC4cn6+iCGFUuPqE3boDKRFg5DydH3J4Grzdwzt3p8Nk7AY
	ofSruBKOrtwYjCtOGFhk4QTzy00JVoVw0Cma8JP/3UE/0ZMdRZQPMEccmV5VePhz5kavXf7sej2
	K6Q20XXweBTVPHUoWzGZpRD6j1hE/R2rtAFM2CoNqb1VV4kFD4ckZU7CtyGcSeDuZ9YhGM/dH7c
	CAZ/nBF0JjkRt/7/Q+KKRE27kjDS+iVbmo26bsd52qn+zgDZT0LyHL+07f9E8X+ZwYkrYEeAtER
	/IvJwrTrye+nUkm+1QjC4SnZS8L7Jp5mB/SdRJAwky9Gf4ylA=
X-Received: by 2002:a05:6214:500b:b0:8f0:d710:26ba with SMTP id 6a1803df08f44-90a80bb0b74mr17793966d6.31.1786584071577;
        Wed, 12 Aug 2026 18:21:11 -0700 (PDT)
Received: from fedora ([2601:19e:8500:d3c0::28fe])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a8179e350sm4119856d6.6.2026.08.12.18.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 18:21:10 -0700 (PDT)
Date: Wed, 12 Aug 2026 21:21:04 -0400
From: Gregory Price <gourry@gourry.net>
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: linux-mm@kvack.org, Zhigang.Luo@amd.com, arun.george@samsung.com,
	balbirs@nvidia.com, brendan.jackman@linux.dev, yuzenghui@huawei.com,
	apopple@nvidia.com, alucerop@amd.com, matthew.brost@intel.com,
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, djbw@kernel.org,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, osandov@osandov.com, jannh@google.com,
	pfalcato@suse.de, jackmanb@google.com, hannes@cmpxchg.org,
	ziy@nvidia.com, pbonzini@redhat.com, osalvador@suse.de,
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
	ying.huang@linux.alibaba.com, kasong@tencent.com,
	qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org,
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
	yury.norov@gmail.com, linux@rasmusvillemoes.dk, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, mkoutny@suse.com,
	sj@kernel.org, jgg@ziepe.ca, jhubbard@nvidia.com, peterx@redhat.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev,
	usama.arif@linux.dev, xu.xin16@zte.com.cn, chengming.zhou@linux.dev,
	roman.gushchin@linux.dev, muchun.song@linux.dev,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org, linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org,
	cgroups@vger.kernel.org, damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com,
	"Gupta, Pankaj" <pankaj.gupta@amd.com>
Subject: Re: [PATCH v5 00/36] Private Memory NUMA Nodes
Message-ID: <an0cAMh_m8ZhGIm2@fedora>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <CAM9Jb+jpJ-Ui4qDHxsp2WiERiv8gmrQfKQ8Z0BmabefeQ6pg4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM9Jb+jpJ-Ui4qDHxsp2WiERiv8gmrQfKQ8Z0BmabefeQ6pg4A@mail.gmail.com>

On Wed, Aug 12, 2026 at 02:01:12PM +0200, Pankaj Gupta wrote:
> >
> > Bonus Configuration: HBM device memory tiering
> > ==============================================
> > echo 1 > dax0.0/private       # make the node private
> > echo 0 > dax0.0/adistance     # highest tier
> > echo 1 > dax0.0/reclaim       # reclaim active
> > echo 1 > dax0.0/demotion      # may demote from the node
> > echo 1 > dax0.0/user_numa     # mbind()
> > echo online_movable > dax0.0/state
> > echo 1 > numa/demotion_enabled
> 
> I am bit confused by the HBM device example being discovered as a DAX
> device. Is it to
> only to showcase the use-case? Or we see HBM device is actually
> expected to be discovered as
> DAX device with N_MEMORY_PRIVATE?
> 

"actually expected to be" -> no.  there's no requirement HBM be
discovered and boudn to DAX, DAX is simply a convenient intermediary
to memory-hotplug.  This is at best a demonstration.

A device driver could very well just call memory-hotplug directly,
or its memory could be brought up as a private node via a boot
paremeter (which I have sculpted for v7).  The former is preferred,
but there's a bit of a chicken/egg scenario for bootstrapping.

Most of these UAPI extensions are going to be consolidated into a
debugfs interface for testing purposes only in v7.  I've been working
on aggressive Linux Test Project test expansion to ensure there is no
UAPI regressions.

~Gregory
