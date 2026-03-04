Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DFD35B62D
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 22:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772663462; cv=none; b=urzTqQtpuBUS6RpbSNBXgVJ4hrxA92FfW2OC6jtPWAUTaAx6LKr2R3DLk/HqTl2Sic0EwYVkolbbXo2wqeyKvBl+JWS5ubalrUkoOlaKGecdrjV3LcSXAKKBVdgzE/Bl9tdGbXiquf0+7sy4ah9Iw4ZGaaTHRGcShGBMe0ZTTEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772663462; c=relaxed/simple;
	bh=3b0QgQI2KwZHXszgh9/7axf/lYL7GsCs8HcBmenTR2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asNskGpXYJ3E4AdSxklXP/skXkfyXAKrUasdNijNORGPhwzlzutlXUBuz+vJOqPHZ2FiXqVdz6yPfXpMzNl8lpsMA5/Gur25OhX8Z7+Q+8i4laH1XhYSy12CSxqX2Czja9w2H6hGvE+baMA5kJVoaW67HSG4SVjF7CPykyQAOFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vD2i5SMu; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vD2i5SMu"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ae613edd6dso9626405ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 14:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772663461; x=1773268261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3fTU8QManykyH146Geu+QI8WoaA0wZ9bvU2xLy47ZE=;
        b=vD2i5SMurNFacnyzJMrYluFl7ycNVV6Eo9At/6AlHbmgLGPU4tYAMO97Gw/nDUu4vK
         qUVNnCjghISReLonASix0SJG8NZ3ppTTxyMPs2JdZZqjmkvjNhFYSAPP61SwgRS9BO5J
         bdUIHPP5Jfwcz8J/Oqbxdqyu05KBU8Ss6uVLfUEVQ0DAotIUB2gIP0n3ugqCnWRvZxH4
         uMI99FXZgX3pbJyOOu8QF4MnR8FfJ2jRSk2N29Omd+Y4XWqbW0gd7eQFxsX5bllGJvHh
         rqnGj+iAKSSz2PQCB6dC5fS8WPbUMPhcRpeTcWKz20/YzpVBWZqsw1x5ebr7g2gJXZ4B
         uLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772663461; x=1773268261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3fTU8QManykyH146Geu+QI8WoaA0wZ9bvU2xLy47ZE=;
        b=iHb9SAUHcHwWe7qZgZhcGeHCwAd2dhV/crsF8MyyYj9YORl+M5d8DXQTuD0WJRoEG1
         6IlXN1yTAVx+w6v555ArEVNnSD8MtluijpG+t/5SsaQuFihAM7JCxlQg1rWbGgqXDxrE
         24ycmZesn1pUnzWCoc1kqP42iEUPGCQifmqL46ahyp73ZtNiie8jVibKMkFQ8fnHNEjy
         TVlmTQnnhjg2ahbwAhXJXTjYnZyTsfhvk8R88NdGcbmAT9FmJ25BB8TB4349fBJdpPRe
         WXnvlc8GizUJG206B+10mitcMCoSxd4/oqQD7Pa2lM94cmC2eW8qfPdObiJxW8PZznWu
         +B3w==
X-Forwarded-Encrypted: i=1; AJvYcCVkLyqp7r/MzltJaCTmTazxbC1p/gZjG3J/162a79Exf+oV0JJ21sKaK+cb76wLGioo8zGAKY5AjeIkhQGQU20=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQHCSXic7s6yxszopgqK+V16r2Oe9agyAre9d78Nw8uM9jThYM
	CwD2yH/+TA1ECu27JRrR0NQzciwMFQyvOBC6kgfNoUNkxlx023OOVTXaQ6CYMpJNnA==
X-Gm-Gg: ATEYQzxn68snc3+yKj6c5QXIw6gHOeZTGk4q9P8ZUqj552yCmo0l+nnb/1mmXlEoLSe
	FaVIeUICVuFh2EderyxSGl7az+bowwK21c+yJFRgv/Kmnp7i2d1XFqRRWaHQ0yNkOC+eSSam2N6
	BW4UwivoKyNLPIJ931CIPyK3aQ9hDE5tAMnQkyjiUOuEFIOUJb36wljGESdzG1OXwkyboSzytlR
	l/prgnrrPPUD1UNHKt6FTXW65BbSGL14ggP/CQ6sAo82K9FVE8DY5hXmj9KE8kHGhOAWgv10gpy
	E/it6hCD+bf177f7pLiufy6QHKGyTcQUY5MvtOj+0VgO0CU5u4DvlsjJ8AFZrJ53zbO2NY/cF4p
	yVR2NG9OIPNkLaVM6Z3zjKi28k6mq+QPcDPxKh19FxdA6yx4C+cfd0NUWR36l6UZM+lcenCyyJq
	yxDr+xqSegGScsh8jWmFIShNYpDfgO/3YcsDDWh0A0asAJisbUrb97QG+ubdOBRQ==
X-Received: by 2002:a17:902:e790:b0:2ae:6457:309a with SMTP id d9443c01a7336-2ae6aaf3d37mr32457385ad.37.1772663460415;
        Wed, 04 Mar 2026 14:31:00 -0800 (PST)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4cd40e4dsm108183855ad.92.2026.03.04.14.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:30:59 -0800 (PST)
Date: Wed, 4 Mar 2026 22:30:55 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Mastro <amastro@fb.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vfio: selftests: fix crash in vfio_dma_mapping_mmio_test
Message-ID: <aaiyn8ZtRwOiQvfB@google.com>
References: <20260303-fix-mmio-test-v1-1-78b4a9e46a4e@fb.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-fix-mmio-test-v1-1-78b4a9e46a4e@fb.com>

On 2026-03-03 11:46 AM, Alex Mastro wrote:
> Remove the __iommu_unmap() call on a region that was never mapped.
> When __iommu_map() fails (expected for MMIO vaddrs in non-VFIO
> modes), the region is not added to the dma_regions list, leaving its
> list_head zero-initialized. If the unmap ioctl returns success,
> __iommu_unmap() calls list_del_init() on this zeroed node and crashes.
> 
> This fixes the iommufd_compat_type1 and iommufd_compat_type1v2
> test variants.
> 
> Fixes: 080723f4d4c3 ("vfio: selftests: Add vfio_dma_mapping_mmio_test")
> Signed-off-by: Alex Mastro <amastro@fb.com>
> ---
> The bug was missed because the test was originally run against a kernel
> without commit afb47765f923 ("iommufd: Make vfio_compat's unmap succeed
> if the range is already empty"). Without that fix, the unmap ioctl
> returned -ENOENT, taking the early return before list_del_init().

Thanks for the fix.

Looking back I remember testing your new test out without seeing a
failure. Turns out I had applied it on top of tag vfio-v6.19-rc1, which
did not have commit afb47765f923.

Reviewed-by: David Matlack <dmatlack@google.com>
