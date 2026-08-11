Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C13418341
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 21:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786483378; cv=none; b=V7y84dFwuu7UrXtow4ThrNu+O+KIC7uSxYl6fc1U/h5kq1QvglUPxY3p6TElxqzBf4y90E7zpbKZMiRES7xgMZsVc87msAFfphdk6YTv1j8tcZZ5aGVStWTM6vsIUKGPuSiXZPeoP0QQ1/fwS2pXUSfKGgomQ88fJ1VRKIB8zH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786483378; c=relaxed/simple;
	bh=XN/rifqNvJQDtxhcJX1CkOjTxm/idHUoaQKoCIcr3J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soJOFB4JMAzO4lG7hQeJC9TyWre+8lJri/ZB8zFBmcjBfA7vsgZ+vcrxhhO2ZGF3+xMRCfuRxkc9/Yo/7X5q9R3Rgv+U00z/jCuhoObrTfNFtWXp+QgbMFcRNqElIEdAKOE+VqXxhqNZE5M5zzyIC50HSBSyZO2L5fvMEulnRuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iHLshkuD; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iHLshkuD"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84f77cc7302so150369b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 14:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786483376; x=1787088176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=duzXNp2G2UESyfsX/Nv+I5To/x8QlNagRZc9TfujvZ8=;
        b=iHLshkuD8hBFuauu4Di391vGvcjQPTjaGzzEbn5A5oegjFPuo2toVazuiHN6PYmxAb
         /HpeaZ7L7FPd2yTnQjuluPzw2qiaz26lrtn3pQu1kZ4cVTxgo5BKjGilTiLxUTwV4eT6
         em6hDsWoiS+ZCtPV54S7Wg1VaWBad7TAFpQWvmLxaNR9V1eBftl8BqCFF6hraUieoE84
         BM/SD5uATWeSfQY/znDz3wI7Go4cW22PGFkMHMFP3eDnMDiuxegNYylALhxUhHMkIcHZ
         Bf7aMENNcRKgAG7GIoc3J9AIIgV16iuBudza6Y2fGq5QIb8b0/ewFob6ACmvz/5WZYnS
         QJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786483376; x=1787088176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duzXNp2G2UESyfsX/Nv+I5To/x8QlNagRZc9TfujvZ8=;
        b=XX8OekOk0T5zcKb2n00T/nUKvEiij4/geNJX7Pr6dt6aj1Q3ma9UAKpm6pp8dLcLsa
         yPWoYl/ewn+M1Yaf4wpSvkBHhcvRYoE+nyCK19cWOLs3SWtF+42nQ0ZoLGlQQfAn0Yxv
         6Witjzp8RACkA9gxxDbegaI4lc5WgAjnA/HTuNnPN3ZC4JetYYhaWAcdcwBFVQY9nZY+
         hHOIoUSehjY6gnwHGbe10tNl1uJAJ94aRNt7U/JCEje+C8xPTChF70L41/fGzUtycdsq
         oPs/V2kB7DwypuujUmcDhAfLxCRXUs60Ly1pk2ubm+jrmEdtyOwCAkGhUafUdVQbf28b
         1cvg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/W63rj3GoSWe7NI84QVHrfZY9YAznxQops0FBGR1HUgafNjUpssUN/QOkquEVjW2JRfxttuDk224SRffFyO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrxm6EEEk8GIDhZftLXhySRAQEOGlbbCO9yK1lQC97/4BxOgJM
	IdfJxeyVX98xkBhZJwC0Sb76hN/S2arf6fOZNL8SCtyHzq2oR1nw2nWRwNAFLgNdig==
X-Gm-Gg: AR+sD13uA+LMNp3oROS17C8U2DVBaHf95TjBmYhtvmaYpaLNzcdUR5HZNjlYRn3CsHp
	OuMpGOFEa0sHVkle26lblEXNmIv/jlxzBI3JMO1MT1dBgkOE7RN9fxFC11P0jK5MYI/salZati3
	srZxqqRob3BNoF2CT2NTEwJB5qak6FfnGQmNCUezxObygOjLYMG6SG4p7Ih1elh3GRrI+ncCk1u
	aDA7VuuD748bTuMdZdSl3Ef+N2eHVVwiXTWP982Qa9Q6Hc+eJmIvnrPf0YbZ3zIWkYcbjlz6Rk6
	H0Jd+8t1S9WsaerY5BSjo+fwx6B93S71ZeButpxnUWeX1P4ILHIzaWJQUxB5kiUYjhvFf8Ms9MA
	FZocG0kbyXEd3BHf1TZio3+4hrTbgnvLMy7EMH3FcGqq0CPl64LTjtzJ/uIOdowtIGRh115Sszf
	N1UtaPiGEcqQUpuqGzRrrQ8ONfiD6Gt3ZpkmwdQM8RB4LmkG1DH496jbWEwIo8uccuHvZRR2GaO
	vTnmc3hMOSBoJ3xWLzYlb2eJc7eRA==
X-Received: by 2002:a05:6a20:a105:b0:3c3:a168:edc3 with SMTP id adf61e73a8af0-3cc2bcbf252mr7676629637.38.1786483374995;
        Tue, 11 Aug 2026 14:22:54 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbed8bdaeb5sm1461553a12.11.2026.08.11.14.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:22:53 -0700 (PDT)
Date: Tue, 11 Aug 2026 21:22:50 +0000
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
Subject: Re: [PATCH v3 11/11] vfio: selftests: mlx5 driver - add send_msi
 support
Message-ID: <anuSqnU7WPy-9enn@google.com>
References: <0-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
 <11-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>

On 2026-07-16 02:03 PM, Jason Gunthorpe wrote:
> Wire an MSI-X vector to a dedicated EQ so the mlx5 driver supports
> send_msi().
> 
> Each EQ can be linked to an MSI-X vector, and the CQ can be set up
> to deliver an event to the EQ. Thus, when everything is armed, an
> RDMA WRITE posted to the QP generates a CQE, which generates an
> EQE, which generates an MSI-X.
> 
> To keep things simple this just re-uses all the existing QPs and
> CQs, so they generate single MSIs during memcpy.
> 
> send_msi() drains any accumulated MSI EQ events from prior memcpy
> completions, posts a small signaled RDMA Write, then polls the CQ to
> consume the resulting CQE (avoiding stale completions on subsequent
> test cycles).
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: David Matlack <dmatlack@google.com>
