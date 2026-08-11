Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A94E42467C
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 21:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786483356; cv=none; b=dYlZWZy6Z/yfvkBHAWrwySU0ujIYyWUOVr1Ks93f7TWaJ0qIkTg/yknvRzROuyAIdMiTA1zzzIuBMOOk2XwXtFk/p1vgtq6doAltpgqIABOV2sFPeZC+nO4IzbrBGgUeOsSSw914vbxiD3B3c8Erja5jbBY0Oja37XA0x3LkIpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786483356; c=relaxed/simple;
	bh=NdaLGblalh7y8lVJYv0NjjfAvsT9Ho42+c6mULsp9Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlQyk8ufZSvj3aA2kD9b4yBsqiIuNjKEH5nhTguSoVJLsEiiB8f003rSMg6WxYVaf/egBbA3nctSPj/1Wh3j3kQkYWNQxCP05/xPSkzYPD8KLhiPlLsysuFjOb5RDvRdG9T89/lTCVzj2VOhz6YFm9vzQP7NiuRM1vsydZ47uJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r5TP5iaf; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r5TP5iaf"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso381780a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 14:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786483354; x=1787088154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hg+Yr9bSAREbkWFulA8TyFK9VZyeo5bqgSMI0IG+zlA=;
        b=r5TP5iafDRspKFczahdfGJLKRRvKfzl9hagc82bQ9hk7Vh6URuNL0fkVTJuWao00eY
         HKLHouLnXi7QNhg954xas/CqncJDw8vJWxVLGz8ZMzc4TSsyOgUTSDZYub+my/QLHagd
         lHinOg4NKlsJoOoWEuxUC66CMZBBMXUKJyikaluDHF1f3dc3hSSsQIL9xJuGmXgSvBhe
         4fm552xZ5ZqmhQ5908lu4oOUIJ7nhxkrjkAtwxG2X/925DRTrA+rUQFxxUnGm8zE3cCo
         pzWzgcK3ydzN40598Fi0FCOXwP2F6QPz57ZCPPs8zfuJ4lAhhXvMft076UjmDBjTRfw/
         06LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786483354; x=1787088154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hg+Yr9bSAREbkWFulA8TyFK9VZyeo5bqgSMI0IG+zlA=;
        b=Box7PWvSXEIwUqgnlUkyoQieSxq0UMIcJZ4rBKtyaRF5DZbBpK6+SinzFysadqeyv0
         kW4+BLhaf1oCJm90xn2PrRDRGM1ygW8gndd0xf2avHKYGdBO2qGNcFE5ExQs0SsFBeva
         B/Du8i8GFKF2xWluTm3L9PV+uPOvzfPfa+o8W5Z3diqf+5kE9+mmV2VedpRqH9WfUnLm
         b1d++w1gBRnC/CN9GeQmRLxxL1+LusnmyJSFcVpf3l0YMx6CHPn5DMQoszmf47uBf7yc
         Xm4JruQS2B7CsoZ1V1rlN1OPkBbe6IHRGxfVLf4GT9eOM5rA/pQRrTfDZFqJbfRq8rc5
         3xug==
X-Forwarded-Encrypted: i=1; AHgh+RqMG9MSjSo/yzwz6dsjKFsZikyXzSUx2vLZ8sZxJo3AsAlS+08AqpM09MIZPgnuMYM+//QGBAtkbNkLXbDv2zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrtT72rdtMZhj5/JdrS1yA4AlObzadUVammwjyD28I1tDynQqP
	sypiJUdG1kvgGAlufCCjSrF8W9ILE0LVkXrOT2VGr69LdjpsPcw5kiLRjuYDlQnBZg==
X-Gm-Gg: AR+sD12ZIkiK/5ZZIqBTHThidchmAbWRCHXdE2TrV2pWIo4vXa7jrJmLVKj6ypFv1Ui
	8qr+v9A/VqdBhx5avJgn6P2uN5IFVyVSSG/CQ85tW+SlauBvlX78jK3+p3foYaAMW/hRkyXGV7I
	IkM8s71DVm5oyLhhdD/dHWcI6b8/yYZf58kEkWabembGxeeWbf0TjxvmKNMrAMQWPkFKw5/yIwl
	YoQGjpbM2xg50yfvprMZ/y6tgfqZCfvQN5s1JlasRQAjpBVrbWmSWhAlk7PS/7cuFIsltU5bPyi
	ljBoNBIm5cbhAS2QI4bqPUTWi3kNcq4tMI5LrIoOsX+raGHnD9jJUsWCLvAolUYUeeF+kme8bAt
	JjkxK2zasE+o3CEeWAnLAIh6GL4cOMQlpskUX6kwCeqw7zP8GvOeIes5YyAsXrAV+jjwTJn9z0U
	aoap0aoOuNM8kE8FTAeDSCIzn6W0JXuQiii9EIcJDmpi0Fb+wdaaRgre80dwGzolwWJo57mpNBU
	HkId7LDawzPjovlDcnFroZM6m/Obw==
X-Received: by 2002:a17:90b:4a82:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-392ec672d1emr6461856a91.18.1786483353815;
        Tue, 11 Aug 2026 14:22:33 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f85feb67sm1080532a91.0.2026.08.11.14.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:22:33 -0700 (PDT)
Date: Tue, 11 Aug 2026 21:22:30 +0000
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
Subject: Re: [PATCH v3 10/11] vfio: selftests: Add mlx5 driver - data path
 and memcpy ops
Message-ID: <anuSlnCd7NERCp4B@google.com>
References: <0-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
 <10-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>

On 2026-07-16 02:03 PM, Jason Gunthorpe wrote:
> Complete the mlx5 driver by adding CQ/QP creation, QP state
> transitions, WQE posting, CQ polling, and the
> memcpy_start/memcpy_wait callbacks. After this patch the driver is
> functional for DMA tests.
> 
> The data path implements RDMA Write self-loopback via an RC QP with
> force-loopback.  WQEs are posted to a 16-entry send queue with an
> NC doorbell, and completions are polled from a 16-entry CQ.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: David Matlack <dmatlack@google.com>
