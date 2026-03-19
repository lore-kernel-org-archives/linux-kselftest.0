Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71678307AF4
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 19:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773947221; cv=none; b=pi6/KNOuP7Yj0+losyq26caWmw8iC99mE6xjjzr+POcxtIGJv9mbxt05FIH3NowLXrlJLVeN/ljgEQ6qTmKhYtHMS/RLI1GATsMNIcgYcywsWY/o6E2JZkHlZgYTG0pgh5IJJHkurnDP6sZOnOJkzwzUd4lBOIYhUSUDGFIj/2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773947221; c=relaxed/simple;
	bh=XjoV3s736aR8sM/sA7glYOfqjHDH07Dta2JTZblenKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+FluqWCjHLBrdl+QIDgi6ZqznMNJ1xNy0sOaU5B5nx4u7dA6yiu9tNS6cO+4Md+cztR45Zc3ySv1UOZUOvGFYZqLbP3X9nw5Dc0FPQ/qbwFItKh7+EnQKBrwFzGLMfbJBJYdWMSBwc/HKDRkTYb6lGrNnNOGsybZWuIbWCWg4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KIabVsyM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KIabVsyM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ab46931cf1so19850055ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 12:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773947220; x=1774552020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f/+swNqWVmqRudMkBNM8NGYRj9vJ89Oy0kp/E/RZk/M=;
        b=KIabVsyMjzqnvxfuONg9Zj9VnzFjbZrVFnl0BE2CDXkAWM+SFoUA0pT7RTAS2ZCceL
         FbV3wAhP3TCaiAru/5/tgnbu3E13AWjgtyVP5ses5sqNbykt9fYlqB3f0Ag/PP2TNaoN
         RUL32fjV/lEQMnRZDy0Q7t64OYH6jNh4CpW0TdKHT11o1YCn/+AcVnBeb3PlywqqYMSM
         snmUnfZYQBITKYv1514ZrzC5ny3VPPXf2HaOEHWKGlH8Q+T7ru6N0xJQuOwY+HZWsWMJ
         4lethloVnEMe24hWQP+ByV9pvUZXwJx8CJ4ScyKEkE97MYQRLPfYzGKBPCen41t4gkx7
         dz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773947220; x=1774552020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/+swNqWVmqRudMkBNM8NGYRj9vJ89Oy0kp/E/RZk/M=;
        b=ZIfmdbqu4SsrjDQmY9b4j5x4qDy8LH4vPlFax/BvUt3rczDZjgMFt3hp36KhVD978V
         vAUJ4cgcjvnC2J/7y8YJIY06aa21Z2o//VktiUvm2kkO43GGKag3MiiMRQfGN+ghZZ1A
         eKAPl4cG/T8cF3po5NajRJ4EEkamiOjMeoMRLdf1HtCIRZjB4hwW0hRbpZtPpz/Jdul4
         jPOU5K6Di0WmrQ66B2jHT/WT3PIliaZEdT3z2YCtFztDNypacLmA2giO5T6AN5Za6nh2
         x+dgFVT1RJ4bQYccP+AP9TKoRS5YUZZyt18dg8a/RBe4xKEkfJ7mb3gayoe6D8vgcQkH
         IQlw==
X-Forwarded-Encrypted: i=1; AJvYcCX78PjVum7tehW+8QHxXUvovR5sgMpoHXrgWIo8B9GpDf0EUw48APY05hb9ifER1b0vR4nEoCM2cJyBt4OsymI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4sClHzS/6fnt/OST0McFlGBrQTQKizfMtbgjRuBui5x4WyQmj
	c1be4zq0+UYRDdXrAcR0k2tSUn7tC4uncf2REsysnnIe68f6S5vrzDEw0vRqpTSBVQ==
X-Gm-Gg: ATEYQzxE20y8oIa2mU+GPSNC64olqVe8ii4rlcd+b+2M6aAR/1t73EXHz0SCSD0gSFp
	OgYEPoYPzXq9SuX735tjzGapbCidBXj8BWqwNqqDgNrzPgF7jp/4GwlaBesF7r8ZQTf7i0VBvPZ
	LyqPoUuS3UCRMYKtwiUjLPC/cLjxGfFlN995JuiEPpoaQYAg/5YwmnWKfXyED0PeguU0y2ATAgC
	o9z6y8hoM/HgXDgvmQyzZLSGcFMwWtE4RQdYsegt1o7L//gHHVCvKnBwq8+LSP1/j2/5dkI8i3H
	fXdowiKBxKRm4WRVhf0c+D1rldyZmW0iwoghpGNOejfI1WHftX5ycl4/jznSNV1E4lVLX/BabUV
	VQ+iIV4vWtpwEuTX4nBLXPqJF7u1+MitlpUcX08lAIjMwLn5BFoBvvQ9b6d2NPcFfI5mwDkY89M
	jHydRMDq9MVbu1huhhJKgPZhRolFySt6xbq4ztrn3f14jW1+mNJz5M52IexNQGrw==
X-Received: by 2002:a17:903:1a2e:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b077165dabmr35441315ad.10.1773947219305;
        Thu, 19 Mar 2026 12:06:59 -0700 (PDT)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e61cacbsm63163125ad.72.2026.03.19.12.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:06:58 -0700 (PDT)
Date: Thu, 19 Mar 2026 19:06:54 +0000
From: David Matlack <dmatlack@google.com>
To: Rubin Du <rubind@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/2] selftests/vfio: Add NVIDIA GPU Falcon DMA test
 driver
Message-ID: <abxJTqmqHOK5KxIy@google.com>
References: <20260317214239.124857-1-rubind@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317214239.124857-1-rubind@nvidia.com>

On 2026-03-17 02:42 PM, Rubin Du wrote:
> This patch series adds a new VFIO selftest plugin driver for NVIDIA 
> GPUs that enables DMA testing via the Falcon microcontrollers.

Thanks for adding a new driver! I'm glad to see more devices getting
support so that VFIO selftsets can be run by more developers and in more
environments.

I haven't taken a deep look at the driver implementation yet, because I
had some higher level questions first that I left in the patches.

> Changes in v9:
> - Squashed patch 3 (PMU falcon support for Kepler and Maxwell Gen1)
>   into patch 2, as the registers and fields required have been approved
>   for open source disclosure

I did not see versions 1-8 on the mailing list. Are these from an
internal review? If so, it would probably be best to drop them when
sending upstream and start upstream reviews again at v1.
