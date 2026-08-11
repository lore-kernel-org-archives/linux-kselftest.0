Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148E147CC62
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 21:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786482889; cv=none; b=CnCUlDX1YCYGpisUsIyCOewSxjBLfYWwjN7PIUz7b5ZVPJEuhQD+iID5GzmMhwmz01lqOLdni96fX0XUwZfnrbaVfwKVcUqUYraAmhS8swSlihc7i3BiDK5UpEJZ99ivF9T1K7/Hzq1zscPu3PiH/iV4GsRg7s9sjBceZv321tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786482889; c=relaxed/simple;
	bh=vELLWw0jcQS3izlB2sdDvaRC3WcKac/J6CTcP0dIWC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUvPcrSqOw4PhPZ6l78qxRSZOWsVnLyGVqU4QdPhvlVABITAvpaSWt7PW0GBGo0VFR6gBu4uVzMOLMM7sLrPE/gVb4kByBjdW/5/j6xQJR/wth0YqmhII97JWRSoKLODBwNZ/oq0A/1jqA69W6I8IsCxGObW1wrFNghFNzq5rU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H+MFTJjL; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H+MFTJjL"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so330930b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 14:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786482886; x=1787087686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsIA9G0uzM6tK8/PrMCXpabodZWsD0MRjRT85WaMGF4=;
        b=H+MFTJjL6DsFW2bzdPklh53KwLU1o6fu5ZdLvHvRyYZBSRBDNXc1mfw7Rmn9vx6wuB
         TVL7t3DDP0gxCQVFmbfKbcee4LFVgaOGZOaUQx9FJF3AYplQJbE9EDUE87C5KLY9x3VM
         K3o0LEMu+2mAPcQQ2tWaFzZBlhDEcv3QXxFikaf8A5j61EaZPghIAgORHVnuYl11g6P9
         ut9OCBpauyhJ5uYP+FdxMdDsJ2RZsV+BNdYEG8y3aRr26tm9HI5uHwS2ON5THX5QAZ9h
         bsXvRj3D6ROk1ILtMYNTwLm5ueHhrmCD6V1SuuEoA7k+faqDM810Sa50pDHDK93z2YRR
         sKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786482886; x=1787087686;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsIA9G0uzM6tK8/PrMCXpabodZWsD0MRjRT85WaMGF4=;
        b=lykCojx+IhRTYW9kYd36emABQZAH+vyyU9Ulyj5z+pxgidmc/DFjsJO4xkrNDV9WPO
         RefH7FN+XGm5EcUiIajO+5Os8BbIB0C4dkUOLozzhAJUHu5LPOR1gxxGhRVseAuOm6ef
         9hIZpUqDF7eDzb9L8kmcfjpSEar5dUzc3+/wxOqMAuIpdwO8mbP6EId84rLtgH6rvOdh
         qOpUBBUbp2wMQBG3+lsbgAcAsudDsZ3QF0smUBLEENVEB0Mtqm+R8xn8qYlXqd3+f11r
         AsH5QK15Db5h/GWwO5qg/hNZu7struQ849UgGGevY9gxcIR/7Cds3Bjy6pOB0yM3SaYo
         4kng==
X-Forwarded-Encrypted: i=1; AHgh+RrQcm3yUou0PHVr8CywXMmThEA4PDjfdx/5RZHRT3RKrho3vQIa7eDocvZDFWCDC8aCB71iiIqk5Wf4sFTWxqA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywusn1Pht6fbaHr/w0bWlMDxXPbZ1eJ2Z40nU0Po3h1NDZspRt5
	lqyrVEVdrDeV57SMrgpNIkdYeKfbhY4Gb8wWQzj0AY0yoQoMG28ky+PTzD1uut56tQ==
X-Gm-Gg: AR+sD10F0X6o4YOQzK3hXbKRocdSojtnrJXeMHEMPLoFVVvuTuC+8ajlx2iwC+vLfi/
	FaZs4inqQjzrqHjlNy0iYH1KQELo2rdEvzey69e4COFoMjNyIQ1zehXnkMNBzWWk2oXddMqpG33
	y8VrCbJo/tR6J5Z33XSLipUN2zM23rUqBbSBaEoFsMdAxzNIBs0CUJRGu36ZOduaC8M99ShvYMT
	AQeKyM/x+hL57I/6K7bV3rDNCPM7GMFogjpg2jv1Yi0dCCr0z91emCtvOX+6RZt4x3qpUM/Qo/Z
	ncUR186JNyIwfSAyC9PUMxX/ZcUI0LbhWqw//q+Jd0/zLPgOTlprDixAdJ+ZF9mBYeb4LDici3i
	z2ghsQSIzsJD8RwFn4F8Ogva/LzbBTDWuaGThb76zl3nJW1HynSkvdeSWWLWzSD5LBJgmjECCsV
	F0gAsczM/2tak5jnKqnwdZVUmo6+/eAspAMecQSTzZkIJfulvWTmW4Tdjgo5Bi7XrwjgVOLJ0J9
	1nRtVBoepmoPVuFF1lGikNQgkVOCg==
X-Received: by 2002:a05:6a00:1d98:b0:848:4c0c:9482 with SMTP id d2e1a72fcca58-84fb5596c31mr161407b3a.35.1786482885795;
        Tue, 11 Aug 2026 14:14:45 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1f2645bsm237399b3a.50.2026.08.11.14.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:14:45 -0700 (PDT)
Date: Tue, 11 Aug 2026 21:14:42 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Justin Stitt <justinstitt@google.com>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, llvm@lists.linux.dev,
	Mark Bloch <mbloch@nvidia.com>, Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>, patches@lists.linux.dev
Subject: Re: [PATCH v3 06/11] selftests: Fix arm64 IO barriers to match kernel
Message-ID: <anuQwhVv5UhjS_ER@google.com>
References: <0-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
 <6-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>

On 2026-07-16 02:03 PM, Jason Gunthorpe wrote:
> The tools/include readl/writel MMIO accessors on arm64 use
> inner-shareable barriers (dmb ish) while the kernel uses
> outer-shareable (dmb osh).  Fix them to match.
> 
> Add __io_bw() and __io_ar() definitions matching the kernel's
> arch/arm64/include/asm/io.h, including the dummy control dependency
> in __io_ar() that orders MMIO reads against all subsequent
> instructions.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

With the changes to tools/testing/selftests/lib.mk removed,

Reviewed-by: David Matlack <dmatlack@google.com>

> ---
>  tools/arch/arm64/include/asm/io.h | 20 ++++++++++++++++++++
>  tools/include/asm/io.h            |  2 ++
>  tools/testing/selftests/lib.mk    |  5 +++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 tools/arch/arm64/include/asm/io.h
