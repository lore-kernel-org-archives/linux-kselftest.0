Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2713CC9F3
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 18:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043255; cv=none; b=QgcCTc6ZNqYV55oHo4EICyUHMQdKWCSpGpu02pstidt1zH9J3rqBWRxO4W+KQQz36Koq5K3hUXmwOITL8njmjoM5JpQSns7JwmAD9W0idZUVwvJa8il4jsEoSeZObx1H4IeUPwkUhUk9u06KW7Mpj8OdWIoobACUz67CV22cYgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043255; c=relaxed/simple;
	bh=0kpVpDj+XWlJIzQDiyFGQk8iMRHNhireUEHGx1sDQkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WicvOck3Epg7svZ3tqqFl60z9t0Ei6Vz2YSz++YyM3uV7fQcua07GIa55BDltU3jjQ6nShY2ZtR7wnkQB8wH/17dZ3ZPJ+49bilcZ0kx3Qs7M6X6Mz4ChFWGaUVEDujqoQYVHv3G8lMfEFJZPefJU7oQ8Nme92lpJGT8gLBr9xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=TfTiem+5; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="TfTiem+5"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8bb4e8a5240so24538046d6.1
        for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 11:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1779043253; x=1779648053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yO9O8pu4RjDyHVPuvzyCd3iEZISD+KMOY00JM/YV72g=;
        b=TfTiem+5WDnnCIzlAqfMtLzTa59DMOdCCycU2k0GQcqEQNHNAk81xwA01H6rbyG38n
         vtf6+ev6ZUvyRR9izAD5DqnpGcLGWCaUj4g1GYWB1bsykUJdiZNdmmKmaofNLc1uKWat
         0ucsJ03P5dIIk+KzOf0xIRNKp01QNteDQKw5TOjTIlfw5/nZPV60Zr79UALvN8wc4Z8f
         LixlbH+BNInlIZmVch/S4Cic68+dHfMlC1kepOcytrw9pwobJM1hV3gTqxSvjaLh0qdD
         i0M8scCn0cQyyP5hGmj8w+iYZfwXAqYrDpWtOBBRPC+8lZFv9bbTc5LHN0Efc1viLLj6
         Ombg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779043253; x=1779648053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yO9O8pu4RjDyHVPuvzyCd3iEZISD+KMOY00JM/YV72g=;
        b=OkOOjyJIZ3iIZTKkygzkvUSiZq7mvmU4uttG/t6a2LbkmrjDSIe4EiJ2yuqvsLwKru
         U08UhSHj12x3qCpRWl+jL/rC2KujcnkVOyo4n50TAXjGf8nKR/bV9HTHYjau9egHnBTt
         mfCyA051Ynp6bixn04JPIo6JrCoF+IhjzhSs8TvTgSl1Llm8cd1VlmL0Ytler4dVKcDS
         Q0EoMnnPoMkSX4c8pKmXvh/+VwmvBXmdQSvkN+57bLnpcnipgL5gZ2us3eqc46HGUyfe
         HX+VKgiAGdsSLXE/goT+Azn6iaGh45MXutu+4b55ed8+qhhfJ3ggAXZVCVAT/HBT8dJL
         7sRA==
X-Forwarded-Encrypted: i=1; AFNElJ/3aai36TIZLKl8dfSmni2yV21o45f9jnNYnpt5YxHfeXBB+qr3P9Qz620M2ckptUN0RJx+hdeDn+BsQlGCNUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcuOVwwWsrw4UynCdIIqyCIKoSRaUjiFCHWwCR0Ab7JFfLbqKP
	XhKfD2MwiVCJw7U991Z47kBw6wuzUFeSBErcqCMRVwuNVhjwsm2I4FptoUzvk7rk+n4=
X-Gm-Gg: Acq92OF0Ex02PZNhx9E9j270/JyaRxAB2X4eu0fvoSrHL869yEeLq2jGl4zXR1g0eug
	KN6KHxM78t5RN24eNsZ4fE3vNK7VIrPNClhqJumJscmvOkordUdLvxkN+W9QIh1N/tUC9rc2pe1
	cdXrHs4V8RATaf3E/TGcEYdUGonk6MkIx1gIPn8v4OcXHgEtHqVJem+ukwZV8aL6XE8P6WhHEQm
	dWfLr+ZIMTMLDGugOoRJGE9Ul+mdTDsrIlPs+J0BolPti5wxqW3V02AABKUrcXFpD+DzWBzkD+W
	O38lN4Gdp/Nx4xQFdZDkzJ1VCrE1kDu4fOhNjiXbmgpjIUUMd9H6+bcAXbQ1kCxflJILBc6Odep
	AYr6CLrVHG71zqPmNzSO557PkLTWZb1MvvH5/FX1j8I+tyZIv1oFrz1y98wOUc2zuw+QrfB8JtZ
	6BQ1uqFdBoAqb8HqsVTZouCga07nGVpDT4k9UZmTaVaJGZu5Njhs0=
X-Received: by 2002:a05:6214:23cc:b0:89a:f0b:60e9 with SMTP id 6a1803df08f44-8ca1ecce8bbmr127423436d6.13.1779043253347;
        Sun, 17 May 2026 11:40:53 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca3619c7d9sm29192256d6.36.2026.05.17.11.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:40:52 -0700 (PDT)
Date: Sun, 17 May 2026 18:40:50 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v2 04/10] liveupdate: add support for linked-block
 serialization
Message-ID: <agoK7TRpT1LErW8H@plex>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-5-pasha.tatashin@soleen.com>
 <agn6QeIamoeMkesv@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agn6QeIamoeMkesv@kernel.org>

On 05-17 20:26, Mike Rapoport wrote:
> On Thu, May 14, 2026 at 10:26:22PM +0000, Pasha Tatashin wrote:
> > Introduce a linked-block serialization mechanism for LUO state.
> > 
> > Previously, LUO used contiguous memory blocks for serializing sessions
> > and files, which imposed limits on the total number of items that could
> > be preserved across a live update.
> > 
> > This commit adds the infrastructure for a more flexible, block-based
> > approach where serialized data is stored in a chain of linked blocks.
> > This is a preparatory step to allow an unlimited number of
> > luo_sessions and luo_files to be preserved.
> 
> Shouldn't it be a part of KHO?

It can be. However, at the moment, it is only used by LUO, so I kept it 
there. Sami is also planning to use it for IOMMU; if so, he will adopt 
the interface for his usage as well, and move it to a separate KHO 
library.

>  
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  Documentation/core-api/liveupdate.rst |   8 +
> >  include/linux/kho/abi/luo.h           |  22 ++
> >  kernel/liveupdate/Makefile            |   1 +
> >  kernel/liveupdate/luo_block.c         | 388 ++++++++++++++++++++++++++
> >  kernel/liveupdate/luo_internal.h      |  57 ++++
> >  5 files changed, 476 insertions(+)
> >  create mode 100644 kernel/liveupdate/luo_block.c
> 
> -- 
> Sincerely yours,
> Mike.
