Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990784;
	b=X1s/577TBgFQ6lmj2lA6pClkSOtzbeZx97s91R7AzuJMAi/HvjNX3+hrs6y+45J3z68F
	 +eiB+btPkU9Pedq9E+y3c0894iOMWjcPA/DaYwU9lUvpr0uMIBc0ytWhjEmNh1VITOAqU
	 LRRzjfEx6iVzLMB33VaD+M/gyBIT8oRa7bTP4rtHWeWlEWE/ogYPM2CMPWGRvBlG3Pqe/
	 TRaoNiWNBkgi1/m04QXg+3OVRs9GRomRiXSUf9U/6NHNJIOIHoag0ij0aorBhH1p2JnFC
	 EGNlEOle4up6ZqjpibFteCb5c4mx7ZbjdgDTLvTbIwkT5EclTXpu7gzF1uRe8XjRq3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mdb5UfcjVPqmmz40z4OyyqW7IHEgbzuUGCcwras+GW8=;
	b=uB6yAVXtjxGIIaWfK5xdYe3PborC1rlys+GcdcGn9BZS8pePyaR7zJWlBcfob3h+aDWB
	 jHgkAvfHmM9TQKN0P187MRRTKiU6YlbYlNp6lJzEDP/IQh3YY6uMpBFlI8Uclt/OT5yl0
	 /aphBuZpCcOr/o8hhLhW9ACs51l/e7VlmMibVAgtdrnwIxwbgg/jc9XaetCR594txwItt
	 QkAM65w4aKGcf5ftI7mUmGSwfqd2iJA/eaIS1yX/b1a/z8keEDzg7gHyQHO8lh4woEhDy
	 lYnB6YjQ8fSCEQ+urOSZNA7Fo/LKza4D/+NSb7Y+2jVNYysk2+APx2NJCVB4zU9MFPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xigg6Bad;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5836606A336
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 18:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5836606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xigg6Bad
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso1049777e87.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 10:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990782; x=1794595582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdb5UfcjVPqmmz40z4OyyqW7IHEgbzuUGCcwras+GW8=;
        b=Xigg6Bad8vROktjBLChSFTJxmcKHG1CvUIakZ3vsIaEefu44U3Bt8v/md9COyzvgy1
         XTgvSARD4JdJeR+rQSPUqOcAc27UTRpLj260564XNAwIlLen4CXP0/Ht+ee+wfYQztlb
         9jpDSOp5AurBUH0yhsghScu5an4AJi0eJFKgHx4MKXNFkKy1D0gnrzgQhm2B17C9Oc9I
         vbduQFpvwghiv7g7znqOGc7FaQLMfBzBiM7rjZU2GQu8RWP8AfhQNN0sYVInvUMU8aX8
         2cqgkZCXkFxNoek1WqERuz1cZS7HOG+Kk6uJP9STl4l6bKFDt6Y0GGmWMa1e6feOQ7qb
         F+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990782; x=1794595582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdb5UfcjVPqmmz40z4OyyqW7IHEgbzuUGCcwras+GW8=;
        b=iYNx3eztb9W2qia+zx67uNfkkhRdJpQ5BdjuF1bFTkyfDI6WtHCNdGW900peX2tDKb
         yy5MCWvVu/hKQ+fee0H406aceB74soAK2scljDKiMR9N38reRk78dTl90kne8DTkn3Tg
         TYIFkuVRs+3qJpIynEdTbxF6xWwy+KRd9/4yQs9PvK3uqB0QbZfphZ8EyL2g6u0Z93Em
         W7+Z0L9jX/3w6lhpSyEDx53XKKiiPD9L80/MLtwmcGRtFmjK2m2PDIGvRVmlIYnSF/wL
         kYvG+CBY4Mz6ieBEphADhy8C0MyiyId0zuxnpfq+hiBGv5ANN2qmr+oNZinEJ9Khd6UA
         tTkQ==
X-Forwarded-Encrypted: i=1; AL+hErFALLzvMcmE9A0CixXunmvkQko7dhbUIKkE+6caKs1aEev8sKQoW7ZvvhWg7tgiIK3Qv+aXjny434cFQJdGBE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UoP+hiEKsc6aB3pFbef8RIFPh/4yFeIkqnVSxpifHk/T0wvbD
	f80fHDpfXBnkhDZEbKVSHykTOZqy9P0pxSMvXcamFcstKPRKo04+tF08
X-Gm-Gg: AYBFou3E5fgQ/1NqNd6R69hovYwGbWNSw0dVtmlkKWU9PbZDiIdau3CekcumPhCOD9/
	AT8EfJ6nK8njIzkhK7lrrKLUyz9bmZM0tbk8sj+Ud17OpIa5up+s4WyzlNDm4WSGaS1abqvd8MK
	KA+xFQJxm+wpgGqRfQc1c6erks4b8PPfOnj5UYbZQ3sc9C1xD9069RH1FUvySYAl3fRXbmvnqEN
	SKQ8AFWuPF8oKeBeqzTVVmKxcPS/qJ3t/0Z8shNsxeAwu4wnGMzgixur9c/ejd2GULawxu4/K0/
	NinCHNj1U6m3R58Isp59Fmc+93PICa0PX7x7PVUcjI23kjpuoEEIftKV8Wc0vPVwhOXBER3cLIY
	DFmd4O1tNH0z2veKKN4YhRFsV8kaHCWCNH2RJuImsqX13/xeVfGLTxXGh2E4ZNyQqVBG8JYE8WF
	5kTasl5aSYcAY2aAygVUBxFd4TVlP92+3MD5qC+8dcLABNmSjhYKam3bDg3C+NfLCURdZ/1xkS6
	cICIQPmKq2SG7PH5NHTCY0Lr8PqrMX08IhTMcQWy1PsxGjUATsaHAU+DT2yKzJ01pNDc/bfG70G
	ryZSruxHHMf0HwePJ0bgVJv1CRtIwTdI
X-Received: by 2002:a05:6512:10c2:b0:5bf:f5a3:9a1d with SMTP id 2adb3069b0e04-5c0037aafbamr1088628e87.7.1793990781675;
        Fri, 06 Nov 2026 10:46:21 -0800 (PST)
Received: from localhost ([192.165.153.208])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c002ed4934sm466318e87.7.2026.11.06.10.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:46:21 -0800 (PST)
Date: Fri, 6 Nov 2026 19:46:20 +0100
From: Fredrik Noring <fredrik.noring@gmail.com>
To: Amit Patole <amit.patole@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] lib/genalloc: don't dereference a NULL pool in
 gen_pool_dma_[z]alloc()
Message-ID: <au4gfAfX_p4D4L75@aerith>
References: <20261106-kunit-genalloc-v1-0-ba1ea397dfd8@gmail.com>
 <20261106-kunit-genalloc-v1-1-ba1ea397dfd8@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106-kunit-genalloc-v1-1-ba1ea397dfd8@gmail.com>

Hi Amit,

On Fri, Nov 06, 2026 at 09:02:32AM -0500, Amit Patole wrote:
> gen_pool_dma_alloc() returned NULL for a NULL pool since it was added.
> Commit cf394fc5f715 ("lib/genalloc.c: Add algorithm, align and zeroed
> family of DMA allocators") moved that check into
> gen_pool_dma_alloc_algo(), but gen_pool_dma_alloc() now reads
> pool->algo and pool->data before calling it, so a NULL pool is
> dereferenced instead. gen_pool_dma_zalloc(), added by the same commit,
> has the same problem. The _algo() and _align() variants still return
> NULL.
> 
> All in-tree callers check the pool before calling, so this is not
> known to be reachable today, but the four entry points disagree and
> the original behaviour is easy to restore. Check for a NULL pool before
> dereferencing it.

If this change is accepted, may I suggest that the corresponding
documentation

	@pool: pool to allocate from

is updated to (something like)

	@pool: pool to allocate from, or %NULL

as well? There seem to be 8 instances, but some of the others currently
don't accept %NULL, for example gen_pool_virt_to_phys(), which I suppose
could be made to return -1 in that case?

And then there's gen_pool_destroy(), which currently doesn't accept
%NULL either. Error paths can often be simplified if free/destroy/release/etc.
accept %NULL.

I'm not up-to-date with the latest NULL handling policy in the kernel,
but I think some inconsistencies can be found still. :-)

Fredrik
