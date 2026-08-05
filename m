Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322943932E2
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 18:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785955026; cv=none; b=OTOoN7Se12Rr/XmMIrMTdcr5+JZaEsd031GY6LI4OMejTixk88jNBG9jgpvBqa5jcYUKY6BEcAfOvcXqSSqDJQ+Nf0m+4bZRWbRNmxIgB0n7Di2mifC/RfWx/s+5GpjmFNyl8TTLFv8oX+PBMIW0bfUgJb7+ZpZ9fdmFYoVtkow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785955026; c=relaxed/simple;
	bh=Tf9syscAZW5PE8qDFT2Yh4y+Oi/xeH7ih1X/P3PhvsY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKRCLFE6XuUTTm+PiXg568zfTHwTFC643IvEANCAocWE5YDFKXtjxry2SpGIWdC+pj+9W3YGx5yKr4yXRdPfRPWNvMhEuICA/Ww3yYBZMOq/BSb4gjUP/Jsj0rGsZYPiDmMLZ5Pltfs8cKKdWvBrG05jvla1evjgjkEkXuzpfpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jhNQd57d; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jhNQd57d"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9061a795d76so13475966d6.3
        for <linux-kselftest@vger.kernel.org>; Wed, 05 Aug 2026 11:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785955024; x=1786559824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tf9syscAZW5PE8qDFT2Yh4y+Oi/xeH7ih1X/P3PhvsY=;
        b=jhNQd57d/5RFTMm/Uy5rP7pgx/NBI9hYroqjEZoK19E6AEzW57ciTbO5EiR78dzu4+
         lz8r/LlG+IIoVcIPiFPRu9jRl8lK31e7EAMs4nqrvkdFxP/26x3ST8kEldHGuYzAzLpN
         ZHuQgq633y3Y/NICC5s3XWYQwQEfuwGE44+76X9OXwU1Eljwg3wi1/nwV1rAmovQNjtz
         Pyj/CxyD5gUAgactg9sXYlMDe3G6+zo9YjDxUr2sCMHTObxDpNQkGx7+5R3WDuwWlRAc
         4ter0qS6r+znnJuy0ethP9gUPinBfq5fBYxddMvFwuSosm0jSbPOuYR2vkDOevPaqz5j
         0YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785955024; x=1786559824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tf9syscAZW5PE8qDFT2Yh4y+Oi/xeH7ih1X/P3PhvsY=;
        b=f/NfXRDWLTV3sWerAXxmQPe4M2QRwFxrxWJNkvx0/RUYXoLHxVEaa0fCY97c/9BCLD
         Wwz1EMxykUZ2nqilklgpTPC4t/ZRYVpLOQS8vXeOiedC33LvTT6Cj1ANA8iqzE4iBE6/
         yHVeZ4o2CC7iqe+Qkmrw4XNmtLZe4dbOP/fmPlcNK3odNbXruQ6voWPpmCbChquvozZh
         eRtLJ+SG7dHRJHaiE3am1zlopZpU4vHi0eKE1H3Bv38VzosQsz0kVH1xTwbcVwW7pyKV
         vBYny9C5qpvpCxbLzrRGS5soTIlSxYiIj6BnoyLARFOfi+xwCsgWI7VgyIBw3wJ4UypS
         jrlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrb220+sYhG/TwQJPRwUgv8I/JtoRRt7wbFttsjkZiB4uXF/m+LqfLxSMLoQJUJn9rI6Wu8+7HZKU2PqE3uTzk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyun63nr7ivRgbLwWlr+FA+p6BTMjvxaQsqoSjAXWCqJSN70VbN
	z6bf4+XG7O9tYqAvpCDexYNSgF7aKmDIcw1rlL9ZXnnFuEPSYQWdeQvD3dcxnX75uhA=
X-Gm-Gg: AR+sD13P/SiZq7s64V+vpsPJUs4s2RzXQVmFI7wZzzPgK/NUlQiu9kIvawEZMdeZOe0
	p2tEvfGihp+8heWgwONxF4MIuoLYZ0LZOsZaaS0RG7zJsvD6ovOH97abh0x++mixWRDnQuIDON/
	GassqU8gWiZno7v0kN+WqbVTF99e9B++xjhmEbGWwYktTrREKMbzF+TAUVyKq0L8IzzspDSNXGT
	HCTLtnnffMd7nJRye1/M/2c8chn1g1gFXUGiIRgHSO3XxV4wFwFNDT2RKGScB42buEkn3ByYVrj
	EAb0zJtogv9VuNTQFzo4uzvE+psbSc1E2DJHf0D/odR9kjXNXPIwYqS/Ae8DxLIIbJtjneiDC7R
	11yYiLW8vvU/8TPexKl3J1Fh6UlUWW2bQ3Qxy0nqx90jrkiX+Vw+RutZzgqIcVG0YVb7/ZQVzDk
	N4qcOhQBxrTo7PQ/udYvWbgclbQ+oqllY0LRFN8Q==
X-Received: by 2002:a05:6214:f08:b0:8f0:a849:f392 with SMTP id 6a1803df08f44-90881203d0cmr103220766d6.14.1785955024046;
        Wed, 05 Aug 2026 11:37:04 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ff9d807sm31895686d6.2.2026.08.05.11.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:37:03 -0700 (PDT)
From: jgg@ziepe.ca
X-Google-Original-From: Jason Gunthorpe <jgg@nvidia.com>, David Matlack <dmatlack@google.com>
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wrgUA-00000000Iyd-2zvD;
	Wed, 05 Aug 2026 15:37:02 -0300
Date: Wed, 5 Aug 2026 15:37:02 -0300
To: Alex Williamson <alex@shazbot.org>,
	Justin Stitt <justinstitt@google.com>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, llvm@lists.linux.dev,
	Mark Bloch <mbloch@nvidia.com>, Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>
Cc: patches@lists.linux.dev
Subject: Re: [PATCH v3 00/11] mlx5 support for VFIO self test
Message-ID: <20260805183702.GA72896@nvidia.com>
References: <0-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>

On Thu, Jul 16, 2026 at 02:03:16PM -0300, Jason Gunthorpe wrote:
> Add an mlx5 driver to VFIO self test. This is largely a remix of the
> existing VFIO mlx5 driver in rdma-core. It uses an RDMA loopback QP
> to issue RDMA WRITE operations which effectively perform memory
> copies using DMA. Since mlx5 has a stable programming ABI this
> should work on devices from CX5 to current HW. The device FW must
> support the QP loopback configuration.

David I was going to respin this to fix the minor nits, do you have
any more feedback or are we good to merge it ?

Thanks,
Jason
