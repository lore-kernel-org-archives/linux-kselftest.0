Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3848A33D4FD
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 18:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773943206; cv=none; b=X6Rhn9vimcTut95Dh87o7aDa8mBiOyj9Lxgn7oXREWQxbhQS/auSuwvZ4SmjNYpUmqzsEv2hsZSNbr/fqopomMlpzSddGihDqxDshIHOCzeM95ftQTyVUfSPeLgSojGnqnYscN+ikA8vpCWZCb0DFC08UZN0ujYChlGIpN/scNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773943206; c=relaxed/simple;
	bh=mXLAjSFqN04nOAHia0KTAMGaR4TecROWc5whlp/KWVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apnUGXm/PHmPPCjv3IDS+xYNgFQrav27YfCAB31faxaPPaZLnbYFeARh2FK3DJG5xR3tj//jBgx26e/jusTJwgXqogrF+RzChCsVlaK12pgwyDalL/dnAXNgf2fwMofD0ZXnywdHRRpPi6zm242DsL5a/+Gsqti5Kwhy7Zb5EcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GG+e6Y4W; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GG+e6Y4W"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35bb9070644so775657a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 11:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773943205; x=1774548005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsqPGslUel1uxBrizy1vlfn3ckI3geGjJLxULvs8ikE=;
        b=GG+e6Y4WTq5um/NB0S19IKvZssOZiecnHiXI+4WCImZ4d992RFHI6NGYyAAsr8PXWs
         9qTEq2AScLGBc+cl3Wk9zRZf1mjZXsLXE38gz6OwAH+ujdkmCYgCb6EHxd/XX4y4+wfi
         xyFDBudHFsNbybXp18DEjOo8G3fE8S1BznNYCxl8uK+ldqwDYDmH5JgQezNnzZB44drX
         lmNxtc9wikKsq5XMeT1w39hHybNEzRPsQy8VXkN7Fub2uCFh4nYTxZhTHAb3BwtWPRMO
         Lcf0LNswIkzmjlt82ux6JdDlzuD8/mJj0d9xLeoGma+RuVgV0JHIJ/ujEME6xj/39j/q
         otRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773943205; x=1774548005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsqPGslUel1uxBrizy1vlfn3ckI3geGjJLxULvs8ikE=;
        b=PzoAhCAfwyP3lfK+D9CH2vlc2nBP9KKWjMhluJ2q7UVmLTcvnlyQG+hVrKq6ngfDba
         VnBgxtANJnIFj7us07TVGgPLXd6SeDXBDE/oxywA63aOXcbIlEBjMu7xqdcutEpieEx3
         8i9F0njV68QZ039g3ZWau5FdrKLHtjV6vMdhDvRQiYsg14SpmcjMv4nPU7KBVlUSflyc
         tsm7MP1F6U0BIfCeSx321eRsKv8Cb7lesMVh5E5b1MISQaPLu01dLFXwnoLQDWg8GGkS
         gUHayrD8m6/ol53Rcg4Ld5U7e7mV90/2e8Y5DwhAvuWwiwlrwO7oU8oNN1WK0SVLgoDw
         SzxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV1OV8yZD8lcr+0Xidtx7R5vTnmhsNudrm32i6X6/HZvtjBUwIF4S28Apeduq1U4Xy1CSX1Y6X0o9VYZl6I2A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztrylqw3IUkV1m2gevvUpPzFmGATYTHGOfXqvsSHL6G6bxr/kO
	dSB5VpDYFi9LwC5q5EryWgJaH4eCCuJvfSX/4ZJX485TEDgx3E6do63vG7cTdQqIrw==
X-Gm-Gg: ATEYQzz0w9H2OpIsYG4Km/9sYux+08/tR6K6nGgtBiB9Vjtjb27n8tqL6bT2NePWJT/
	cz16+x1spJMX8fDCfj4KgxZd3jn6OlWZBGga6sZpf5ogR54F2P35i4Pg2VmvWuvJ/Cp6W0u3sVg
	V0AWe+3OAqLD7/vYncXKqX9lkSy6ZmyYfv2o7kCFwW+Hdp+HuuvqokArLzAH1xVhlj/JiFqdVOT
	rfh6j0zt8zYgv8TbHe8BLFi9zw4xE7ASZEk7jvKTy7YKBsLhg/rIanvnWnSEYVmfdg1/9CRSx+6
	FLrCBMgtCL0EusNzRordLXmhM6CVHFhpTpWr1hWcZtH7RG2ioKQhEjo5EEURNcwW5mt7NS3YN0z
	SpbjmllAQMJH7nG9xFzuLom7J0pAj2zFf6CiiOFRgpS+dAGKrwPYQU6dS1HaR1Hx7DmRJqxMjC6
	WUYbiAO4zzBPTSWEcFMyfET+tlyt4C7tEWeS7RRSA8PwbBUZt5XS3jVa7V/S9fYg==
X-Received: by 2002:a17:903:2449:b0:2ae:c8b4:6d9e with SMTP id d9443c01a7336-2b0827134b5mr2112115ad.13.1773943204122;
        Thu, 19 Mar 2026 11:00:04 -0700 (PDT)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5ef42asm80250795ad.40.2026.03.19.11.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:00:03 -0700 (PDT)
Date: Thu, 19 Mar 2026 17:59:58 +0000
From: David Matlack <dmatlack@google.com>
To: Ted Logan <tedlogan@fb.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, Matt Evans <mattev@meta.com>
Subject: Re: [PATCH] vfio: selftests: Build tests on aarch64
Message-ID: <abw5ng4M14Je2OfU@google.com>
References: <20260317-vfio-selftests-aarch64-v1-1-2266077563e7@fb.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-vfio-selftests-aarch64-v1-1-2266077563e7@fb.com>

On 2026-03-17 04:25 PM, Ted Logan wrote:
> Also build vfio self-tests on aarch64 variants, in addition to arm64 and

s/self-tests/selftests/

> x86_64.

This could be worded better to clarify that this is about fixing the
VFIO selftests to allow native builds on arm64 host platforms.

> 
> Reported-by: Matt Evans <mattev@meta.com>
> Closes: https://lore.kernel.org/all/e51b4ff2-13c4-47d4-b781-3dcbd740d274@meta.com/

Please also add a fixes tag, since it was not the intent of the original
commit was to disallow native arm64 builds.

  Fixes: a55d4bbbe644 ("vfio: selftests: only build tests on arm64 and x86_64")

> ---
> Signed-off-by: Ted Logan <tedlogan@fb.com>
> ---
>  tools/testing/selftests/vfio/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
> index 8e90e409e91d..98bc8d6271a4 100644
> --- a/tools/testing/selftests/vfio/Makefile
> +++ b/tools/testing/selftests/vfio/Makefile
> @@ -1,4 +1,4 @@
> -ARCH ?= $(shell uname -m)
> +ARCH ?= $(shell uname -m | sed -e 's/aarch64.*/arm64/')

Perhaps we can just include tools/scripts/Makefile.arch to avoid having
to maintain yet another "uname -m" translation?

This would make it harder to prevent aarch64_be though, which Alex
indicated we might want to do.

>  
>  ifeq (,$(filter $(ARCH),arm64 x86_64))
>  # Do nothing on unsupported architectures
> 
> ---
> base-commit: 96ca4caf9066f5ebd35b561a521af588a8eb0215
> change-id: 20260317-vfio-selftests-aarch64-636abf0f7674
> 
> Best regards,
> -- 
> Ted Logan <tedlogan@fb.com>
> 
