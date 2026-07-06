Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E4236F413
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 22:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783378041; cv=none; b=LdOeY2LH0KgjTQlJfYihPQi05FyoNiDw6iFZJU+7xcd4KK1gICMZ0BlsbywhQUVim12jUUpoDyQTuU2NNZlpa6LSsjRLObmmzQyCW99NkZOG3PnLTmB3e7I7uCk7tMFjlCs9ta9e6yrphNsQKOpqZwY2qmGo5/BL6DW3fz0ywB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783378041; c=relaxed/simple;
	bh=jXTDaEhWRHoMk/Przi3L7PY4KIAFZ58iQthKv5UDUZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MfG3ANT0CGulvWjNgUOd6miFCvUXyzFw3aFZyj6Ja7dk5rm/duIBnGz674A4IhqVOhCjYPFRRc3hawLqVJbVQGUyKuG6M+CicpWHUg+6s3n4AVxvW0+tx1838E/90FrG+M8eM+upzChyhUuI8N9dFnnX63sIgYuO38hjo5mK0KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NZUO9Ug5; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NZUO9Ug5"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38759bcd877so547621a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 15:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783378040; x=1783982840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=suhuxO/tRTI7f2bw+z1Hg0Rvsi5wIp5BwW1hDBnSHQM=;
        b=NZUO9Ug5iyDDu8y1zgzJkc+6l2qkMS6AHtaV124tzS4RYa0xYY0kZzpjjy7AXz3EJQ
         D8F3lMn/oA3poRURX5PUo308VpH7NeRzgJA624M/+dFpcYn1sdWim6QxcUpjoGg+lln2
         HbqZWO6qvQcEh5O9QDBHbVljHNRQLLNxjWcJvmcHbq5hWFHiKJKxLrGXI//a5QbPkb3d
         /SRd3nqxanuCfDXx0HcRTBvGnyoMvtcslXKyGJ8pGtjZR8ZSj0OOPGGIPeMFGeaaZNqM
         Kv0PoLVag3IKjWUhIIeZy/bmJW8ysedb/M95fTDOaElqz3GDFfsnAIB/6JuwHWcOqsYQ
         wyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783378040; x=1783982840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suhuxO/tRTI7f2bw+z1Hg0Rvsi5wIp5BwW1hDBnSHQM=;
        b=VaxJqCphRE8CHU1VckZpWK5ua0cEL7sa3u6pTDGCWwKGQlIcBuIByDf/7vqqXeJ1YN
         zJV6W4h/gm2889ezvqebJpUDXjzJRFICrfh+QGLgMA1PjT/UpqOdG5Tm0JY3EA5XPwXw
         iCwk4O3up//9Sz1OBbEj5BL+5Ica/7X2RtXP9YQRXSjfX6/e5cK/XohHDJ9rexa1R28+
         eBWhIgqrnfAyCC/4lKvYVqGCDRJWfkX0oLad/HnPano+ACq0Nl4UNwcvo5KujVdwnZcU
         H8o1Q812d4+anKfRZMGUDKQXwjoqF21Ejapozr+Mq66+UUmqJI3ai6AxEcpvZr4Re8jw
         62sg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8gNYG8PxSEHJLU4TKSn+YVkZdzeNXMNLNBuWVONmKXyjPYimYug6BbMEkFwU3UKiCPi3YuxCnYphCCNgM2ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf2oYnTeRxl2qq40UTUaAr2TOoqCeS2NicgzzIeJKcMERWl6IK
	QD1o/I9iZMA2Ps2eYow/nR/nFYMiUQAx7zYKJCvse52pDoIRDBO6vIFyEtCQq2vUwg==
X-Gm-Gg: AfdE7cn+Dx9vE14R2myS6Z4XTiTgz/NhFsuVqcI5VLv1xft9w2WCiNGTmraRJX92JiH
	ZWG3NGIz15hOphVyeKf9C4dWElxtWO5w0FsJgr3Y5bx1H/MkwpNYKqVuo2XRNr3USEH5thnTAVU
	MdTUnZsOjOWArMEhrsVBqbZsVurWcLo0slrAbKgpq8N9EsW8A4XnBT8S5z9YHXuVy4MO6+nCmiS
	ZiWcBMd30ttEuVwiHMIWmF8mYKQ5QGlc/X7SOGy6qGKpUXdMNL0SpOIbgv3rSCz1YIh3Ym0BQy+
	LUuAcvEToOgs0r2TWjLdb/eCno6fDSySrSNCMVO3KatVqMQtDuC4bOMoe0jRIyXTECLSB7Msbtv
	pyhzTk/YYAHfDu7Egvd9b/J9Yqc3M7pvLv0bAGEnyPRlCxXu8mGYcUKM+0CX0yminRxrWaBaUOC
	cttCubv7hx7lYuAN+Tw/wolHmroz/7gmWTTKpfoW6f66wdtMG5Ses=
X-Received: by 2002:a17:90a:b108:b0:381:5ede:1296 with SMTP id 98e67ed59e1d1-3875547805amr2117566a91.11.1783378039537;
        Mon, 06 Jul 2026 15:47:19 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm1425915ad.6.2026.07.06.15.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:47:18 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:47:15 +0000
From: David Matlack <dmatlack@google.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: alex@shazbot.org, shuah@kernel.org, amastro@fb.com, rananta@google.com,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, vaibhav@linux.ibm.com,
	sbhat@linux.ibm.com, harshpb@linux.ibm.com
Subject: Re: [RFC PATCH 5/6] selftests/vfio: Accept sPAPR errno for DMA range
 overflow
Message-ID: <akwwcxwTojeAQHeW@google.com>
References: <20260703032806.40946-1-nnmlinux@linux.ibm.com>
 <20260703032806.40946-6-nnmlinux@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703032806.40946-6-nnmlinux@linux.ibm.com>

On 2026-07-02 11:28 PM, Narayana Murty N wrote:
> Accept sPAPR errno for DMA range overflow
> 
> The DMA map limit test expects an overflowing IOVA range to fail with
> -EOVERFLOW. That matches the Type1 and iommufd paths.
> 
> On sPAPR TCE v2, the same invalid range is rejected as outside the active
> TCE window and currently returns -ENXIO. Treat that as the expected ppc
> result for this RFC while keeping the existing -EOVERFLOW expectation for
> other backends.
> 
> This keeps the overflow test enabled for sPAPR TCE v2 instead of skipping
> it.
> 
> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> ---
>  tools/testing/selftests/vfio/vfio_dma_mapping_test.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/vfio/vfio_dma_mapping_test.c b/tools/testing/selftests/vfio/vfio_dma_mapping_test.c
> index 4411fdbd56da..cd2d3276a46c 100644
> --- a/tools/testing/selftests/vfio/vfio_dma_mapping_test.c
> +++ b/tools/testing/selftests/vfio/vfio_dma_mapping_test.c
> @@ -316,10 +316,18 @@ TEST_F(vfio_dma_map_limit_test, overflow)
>  	region->size = self->mmap_size;
>  
>  	rc = __iommu_map(self->iommu, region);
> +#ifdef __powerpc__
> +	ASSERT_EQ(rc, -ENXIO);
> +#else
>  	ASSERT_EQ(rc, -EOVERFLOW);
> +#endif

This should be based on the IOMMU mode, not __powerpc__, as that is what
actually determines what gets returned.
