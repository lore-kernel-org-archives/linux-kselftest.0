Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792547153;
	b=MdKcg4KvX03g99Bu52eQDFrItcYVrmXglabTEDYh6+fBIoK/2GqisPUJFqbVYBrbVgeX
	 5FlZBqQWzwKwuVH8vL9qKMGTrLinchcNQ8D+HjqjdpxXwoGdDtEVrPpPtF4JOh8deYiu9
	 AJ359vlWh8iVld2l7maRVj+hYEvGnopuB6KVgkQ6PQ+BB+/a3+JqEwdIb0alwQ8LgweD6
	 co9VptF+ThsMq1/ObcMnwNJWhgrsdN7qCkn/FvFuWix+rcbRqxjPPlHCelqWfMYwfOpGG
	 tekTbYuDeNyyAcbrhEmhkIno1BQ64trsfISTiJ+bOLtK0YpUlBCFADtes1AbaXkJ0QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792547153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=N685GSgBsocOGOaVWgwO0dJAiPky3e+vK7Q06g1oPm0=;
	b=GCnMX6MeAQET13wS5McOXbIiDumdJh11vIotshfAYjVxSafjx3ARyBA6WtYphTcwS1QG
	 na1YkCpNsywW0L3+ndraGYpZGBxPyMtapAdMUIBjgow7j2XUZitzQosdzC3WRm3j14gWT
	 RWJF8gikZpEzojKFKWGxySPsdUTIsbP/bjzizzRjXDjKXCasCF2lgEYLltsWUJCe/vDfK
	 BmR3m4x/kY+Ak0Pf67znPqbvlCaD+REFjkpZf1BWi3/4dc8a3rcAHN5FJ3DC5XzwCmUqC
	 0Kk5g7oDI6VdMHFpUBE7QSR8TNKEVSWlaY02u6ItmHnfNdw2G1GVEkXGQc4YFGBxf7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WzAyKkQI;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC701606A319
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 01:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC701606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WzAyKkQI
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so866295e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 18:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792547151; x=1793151951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N685GSgBsocOGOaVWgwO0dJAiPky3e+vK7Q06g1oPm0=;
        b=WzAyKkQIvP9jsHhriZZX2+NqaSKHWEKR32z2b8t/JWsBJhI9LmHVIAXIBLYTkAYA/r
         3TGyWsXWtYwy8KpoOhpjH1fl9t0x4k6khmQIJL92JvLawBrNY7VRYtODbZfszkWfDtlk
         HS0nv1yw2o3ojEl/F9RuwBcjrzTj35JtlKNkAkhlvMWTSlXyVZ0NbGvSXNaCYhh3lowr
         8K0sT7LNm0C5SEtYt1ojPcHQSTBf7euz4WpBK9GJv7QbGxr3yWS8zNzfRz3gj0S6JFTW
         mufD344rkM56yUSSjQ5vawwRV2ICenp24WFiu8fR5gwCnnlj0z9aDx00NOzWNERUlClx
         vtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792547151; x=1793151951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N685GSgBsocOGOaVWgwO0dJAiPky3e+vK7Q06g1oPm0=;
        b=WGCfFKnUtkwRWBp6uh2SZqB8NR5BFT6nW/6c0EvvDk5HNb/VXjJdyJuSAlo6Yhbqcq
         RQI1eJ6aNUnexIwAg1oQL+FkG27Bn7DUOc1sE/MaDn2SYeeg9yFEry0nUm6CLboE/A87
         6m76ghiTtDgYApNPmM4ygyLSkdBDI6boP43UvRGwqVgw/Q3nSlqfHiqXgrKXvrR4WWMd
         kUZlzpB50NC3c5S7/LZIddbeqhSI8cnPGrbWP/9YkVqdYkiuDkJ6QQwSE9WSXdSX5M7Z
         QQChBjWP1SZ0kQ9w7I6RZPN1PbCclJYxFdoiH0do3Tn/qWxAuoqLUvx62Igk+QN8vPWV
         3e3w==
X-Forwarded-Encrypted: i=1; AKwUvBw5lkda37S3LmLNxLqPk2qqSDXf9H9haH+IPOXQ4VBp2N6Z0pfU1IvZWA8TrSQib4CaUFGQkmJ18qDfuuV2uYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzZ+U+lGJDVxpSs69kQdF8yoY4twIIJ8U5PpMKPxtK54ncxyGZ
	pKtVUNHOdYXeJopf7QR0kUeXwk92cmtREWBhVCthiybjrlF7SnDZGkYd
X-Gm-Gg: AYBFou1kf7bOnDkTrL5ZayB91BuM6dmih8iU6Ri91Kg6pU41UWKiRPLclduRi/GXwp2
	bxb2D/dyN2DQREB/N/TVebcqPCt7SCLKWFVKC0thxPjsvAvHA7LOg98QbB+6T2ejhQH/IJ2oemN
	H965kH3NyQJtvvLogPKM3Xuyv6uHLl0XV14Wwz/QJY5xApYa0I3pOKyQUeL/ftbQie4zhcOv1XM
	FrCt7vE4CXNrPKZ5xcl+tZ2/Y+zWwTTX7/Z06MszGjsw+SfUBB6EFi5J1GEFOmy+WSsCZpkaTLP
	mIibuIf6NNXMA7PVwnHPH7Ld878UvkNZPwjJAUOTQC/l+0Jhnj6cKgkJNhVYRDW/Jcx78VaJnHb
	qL6ZBz79mPoWmJiB0qYfPD+bEfrReiXLvY/HeKIXLMhl5S2nX2304XuLA7OM9VZ7pwNmXz9L79P
	aKploXwUABkUXc21qGbsDY7zjP7D8Y6Cg6P7ydKOAq+UcqLgntM1K7mLRoA1QFcoNQX/HgfNNRb
	p/LWQMiPtzvLj/bY7cQlwwVBf2H/xdGZh7OzA76+Kc7UIKo/ggMRwgPNbW5L2FKgzvUk59KnMME
	LGRUcvoZe272Km8bxkCu1EVqOYMPV5EoFLCJmn0fqVuHgZlk2b8KIh4J/pc3+8R3isxrfUm8gN+
	t/qPNTLWRUWWXKZQ=
X-Received: by 2002:a05:600c:8714:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4a1fdd1604fmr8629335e9.16.1792547150977;
        Tue, 20 Oct 2026 18:45:50 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-095-117-105-001.95.117.pool.telefonica.de. [95.117.105.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ca3666sm118638605e9.1.2026.10.20.18.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:45:50 -0700 (PDT)
Date: Wed, 21 Oct 2026 03:45:14 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, 
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [RFC PATCH 0/6] iommufd: harden DMA-BUF PAL setup and release
Message-ID: <atgWXLYKOFj5cZ0F@gmail.com>
References: <cover.1792477872.git.kmehltretter@gmail.com>
 <atdKZpEJVZY0enR2@nvdebian.thelocal>
 <20261020182029.GH3008132@nvidia.com>
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
In-Reply-To: <20261020182029.GH3008132@nvidia.com>

On Tue, Oct 20, 2026 at 03:20:29PM +0100, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2026 at 10:16:26PM +1100, Alistair Popple wrote:
> 
> > I haven't had a chance to look at these patches yet, but if some of them are
> > fixing bugs in Jason's series it might be best for us to fold them into that
> > series, with correct attribution of course. Anyway I will take a closer look in
> > the morning.
> 
> Are any fixing bugs in tree right now? I think one of them is already
> applied from someone else..
> 

Good catch. None of these fixes a bug in the current mainline tree. I
based the series on the stale c37cf2824740d topic and missed two fixes
that landed in mainline afterward:

- patch 4 is already covered more broadly by f2d70dbd3dce
  ("iommufd: Destroy the pages content after detaching from dmabuf");
- patch 5 duplicates Ankit Soni's e745cd2c749e
  ("iommufd: Take dma_resv lock before dma_buf_unpin() in release path").

Patches 1-3 address lifecycle issues introduced by the PAL conversion,
and patch 6 tests those paths.

My main goal with this RFC was to put the concrete lifecycle issues and
tests on the table and get the discussion moving.

I am not concerned about preserving these as separate commits for
attribution purposes. Please fold or rework any useful pieces into the
mapping-type series as makes sense.

Thanks,
Karl
