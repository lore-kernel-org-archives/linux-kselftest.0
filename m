Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CF02FF15B
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 22:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781736909; cv=none; b=oLBJAE8driejbQNTaQAKzFcTJNlr3sMJW5dYTWpsqtszE+6dlgPfLlAb/eHN1z19EbYzhX4hU/GfHwvSYVlTM01u32+/+tZkvPNsvydZOwfbaNYLRVrPFzihsX1jVDB2sfmedO88teOXAEaYXJ8Wi8ev9s1+FICGxolao0yNNBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781736909; c=relaxed/simple;
	bh=XZNQCD0Wlzebe8+k82p0GQLAE+XVfMCy17xY+qRHYtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USb33THPPendhZSYuyWbkVo+3ta/0PPWA3Youd7Os/2hzgbjXJVDcuhdWm/DVDoPtx+n52lEGMiIVQa6IXWBittrhVkee997khjPn5nkKsB3K7AV5m+jP5uwDEV5QTfmE2MuFhhZ2hmN1l+TeWk1T5hC4rdSPcE6u9+a8umFxJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bOjR2tpW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bOjR2tpW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf1f074a12so3341885ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 15:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781736906; x=1782341706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=31pm6bOQX9ZGFrg4v1e61iShzXMdpZDAT+S55BgXi9I=;
        b=bOjR2tpWG0AYQDC8avd4GdHSX7j782z8Cgjq/6OJUzIYiYoazTRpi/Wzj+0f5Wy8UR
         l0Mcc4gbrrYC3xdOTJD69DbsUZgHO0w8ztyx0258WwnlvT+N1hDQfhAyPH6RvmIivB85
         y4Qefx5vxOm8M/ELtpfNye2NwSgnNdlX19bgoD6XLHDU2pgDAIyxU1IvwaRQPytgpHaj
         tZxxO85cOCTy8ULqq8kY6wV+R+IYNn3dJB+dukJ7ftA9eryOMzmAoIMotkgoUklOYQJO
         Y2BxsONgtQqYO/CFF6QERttj+j7vVyBUHhW9hv2F2IZHuircQVYqM+9z95fC9FEc6T38
         UIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781736906; x=1782341706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31pm6bOQX9ZGFrg4v1e61iShzXMdpZDAT+S55BgXi9I=;
        b=rcd4Ij8IYq0JhLqIaIBOyt1ubyADGV/Nbmgk0O5PCQOhOcrwL10zSyPNB0B4GoFjGA
         e0PSHOSl5AIJZAWA84z2gdghJxxN5aCUssOgE9xX7YqwvStQKZiItcdrdvFhAnwwN/Kk
         fF7mrWjJvvuquKJYwmbWCPVD7yfx3WnbOpmDhJiUzqfg7ar+PnFjwVJt41EaEJKl/crT
         XTaVUvkf5yoRHPaUfRNC4Yj0ouin4AryU+albKo7MoVc59G7x+USNS68ueBPx40CHSPD
         GEYZtEPbQO/MfCzM9JD/UTgoCDVdFscwgfjUWFK5N83gAtU/HQx+6YG5Cl4jpr0saHw3
         U8dw==
X-Forwarded-Encrypted: i=1; AFNElJ8hziSIXi0skPyRdhZlXvkfa2W6f97zZ5jloun1J4U6MlrGGpQdyIVMQsN3D1ZZijrNeTFqVZbrNq43MldMeYs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq9BweC6b4zHcV2ZHJNWNzKkuWDK0BQPX3K2oeypJJoCc43EVc
	JVIo0YyEdTFw+7RpOmUaauBw5IBqpL2w41fB0O3ft+Ub6Isd27wXSTwRYce1v8YmtXEVBLJSCxD
	0kYls5A==
X-Gm-Gg: AfdE7cks1EZIkbg1HEFPca1fsWEBj1jLytaVKhtR5BKnpwwZF7JHjtBDeCeXHHatsTA
	RXXVQne+Uw24ecIOlcwDsacPoyNXPzrApGCop9wOC4LfXHtgRiCtJdJ5Uz2Ec9Ng8mHVBFmI7+j
	q3JDNqNVixzhFuHzpoSR51QFHJqNhAFPY/h7uPkvzHmWTWnIom/mmRVBbIRIhaLoxjfUWLiMn4Q
	KcbC6H367YgG26R9qxulWwC83bqYP9FRdo7GoYofM7HEH6p4nCVgD52J8m6Za9UQS9KMDJXLEF+
	KZB4Uhe9chLmFk8HF3HLBjqrOyTUWZmg8G8Ne3q2dBTYMb1WgX+WUZ9D/MMyoKTz919seuNfkfB
	q8wXGCn4+bh7SEePRd4Djn46IsX2tmZePzQ/o2TdOZmLayygWsmmXkDeNPyY5Mjp4Y91+L6zOhJ
	UuOtf2LchMX1npD7VWeKXlfMVTCRuoHqLZTZUnREiNaczHUgiQcOk=
X-Received: by 2002:a17:903:196b:b0:2c6:cbcd:a0d7 with SMTP id d9443c01a7336-2c6cbcda883mr35120735ad.25.1781736906001;
        Wed, 17 Jun 2026 15:55:06 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb5411sm172146015ad.32.2026.06.17.15.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 15:55:05 -0700 (PDT)
Date: Wed, 17 Jun 2026 22:55:02 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Mastro <amastro@fb.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 0/2] vfio: selftests: Add allocation assert helpers
 and avoid VLAs
Message-ID: <ajMlxuklmaDfg84X@google.com>
References: <20260617-scratch-amastro-vfio-selftests-avoid-vlas-v4-0-b9f52f1e2c5a@fb.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-scratch-amastro-vfio-selftests-avoid-vlas-v4-0-b9f52f1e2c5a@fb.com>

On 2026-06-17 11:57 AM, Alex Mastro wrote:
> Add VFIO selftest {malloc,calloc}_assert() helpers, then use
> them in places that open-code malloc() or calloc() followed by
> VFIO_ASSERT_NOT_NULL().

Thanks!

> Use the helpers to replace VLAs with heap allocations. This avoids GCC
> rejecting initialized VLAs and avoids treating a u8 buffer as a possibly
> under-aligned VFIO request struct.
> 
> Changes in v4:
> - Add malloc_assert().
> - Link to v3: https://patch.msgid.link/20260615-scratch-amastro-vfio-selftests-avoid-vlas-v3-0-b3798415c72a@fb.com
> 
> Changes in v3:
> - Add the calloc_assert() helper as a precursor patch.
> - Convert existing VFIO selftest calloc() assertion sites.
> - Update the VLA fix to use calloc_assert().
> - Link to v2: https://patch.msgid.link/20260615-scratch-amastro-vfio-selftests-avoid-vlas-v2-1-4e4df462908a@fb.com
> 
> Changes in v2:
> - Reverse xmas tree variable ordering
> - Link to v1: https://patch.msgid.link/20260612-scratch-amastro-vfio-selftests-avoid-vlas-v1-1-ba3acb635f0a@fb.com
> 
> Signed-off-by: Alex Mastro <amastro@fb.com>
> ---
> Alex Mastro (2):
>       vfio: selftests: Add allocation assert helpers
>       vfio: selftests: Avoid VLAs

Reviewed-by: David Matlack <dmatlack@google.com>
