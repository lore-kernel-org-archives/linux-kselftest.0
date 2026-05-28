Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022B9405874
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 18:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779992196; cv=none; b=bRZ+2N5tBULqDmiFRLjBPAPowjCj/7gq/glRsbFXrmdl1/u5u/ZEVhm2Uo42lcckMrow6NSNBBAdlxdL8/hQqhUIWB8T6lZk4JBCi/Vy+9Jyp09n+O3cI+s3SE8MHie1nKloWTBTJrEdAkn7TZofzdkxdUj5eFHRyIB7ZqKxnm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779992196; c=relaxed/simple;
	bh=Ds1Jip4Q+szH28JOmLE2MWPcuCX4YqkYawFCTzZTR90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5cpg5igKogWx8K4D17QadwHCiPJvnXT+z+kY9xF8sihtEhpIR/yxNek32oIbzQNBmhyjiRRh3Fxh0wEPvlFMagCMZCJ4ahqnSmMhtItqgQs55A9xl9OVImjmDbR16dqs2oHxZeWHmFgdj3u+Ga4t+gaQJSpOUIJ1U4EFZBp9UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RyZNpRs+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RyZNpRs+"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bccb978bd9so79496165ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 11:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779992194; x=1780596994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H98Vwp3bRkB0ayStNiyEfxNXiTSUpiEWRaZG/RbuOdc=;
        b=RyZNpRs+WU8aaHArotM1GhEH+4IG/W6JG/A180LYcb6mTAbHHfMA3yWAmrY+A2tCwJ
         hCaDauM5MjOTuOTGCKs0S+LnmxMyz73w/HFyeJIWiFBGq6owf2Ibf2s37PZw2q15/mXS
         6f77pnlux284O/7Id3CkJRFJpeeUeNb2UmM8c7arhefVic/AvOaOwKQ9ed537esl+aG4
         FYktz9N2sWlGqPOUNaO3T4IlEzWPJfu21Vvn1f7/T7T2nF54UnCmfcVNj953WncNb3MX
         jdeTrDcjKcPiXq/fbjjQ7vW7uf5M9eTU9HdmHeWRJx5Nfvn+Fh7aTrgghxa2b7/6A4Ga
         jhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779992194; x=1780596994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H98Vwp3bRkB0ayStNiyEfxNXiTSUpiEWRaZG/RbuOdc=;
        b=TvbDkNy7DQ4fgPSOKmrS1HdT7r0khKGGmMKA+vLzep73Al+qiTXXaIgxE6CeZBMsRB
         cV1TGJHum5VtOi+uPGLlhg9kJvPZkdTfrmnigEWjZ45evxUkVHG/EEeCojFzbpvAOr3H
         N9/O/rLC8q8T6S7TitMI9vM1NtG+rVycUHf1FF3Ayonjj1Pc2p+g96FrrBgmRvTsIM6/
         dDClaeKMD3WCMd9VpAVxTdByJzIgvAwgXvu99Ha9P9fdsoCsSefjYq1OJPHXQg3cihid
         x2+I380YNAoeP7PEpWlgk8D0nWSnHzkp3oaZgI/iGy88lH1P71ouMXSsdqS0hi/fbFwu
         1vpA==
X-Forwarded-Encrypted: i=1; AFNElJ8dSj02hmeZyHGosJumpnbN2WsVG3VTOkLNHy4oDvb59Vi7OAnjJGpVBQxbnT95nEg6wzz8lN0ISal6t90HLZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPWJVTPZQeIUomww2ZiLRndo6FvTE8gtRO5BdEf2b9tYs7ntVu
	9h24qlM7JCckZ/V1a5/Loe4gPOrvZAsxIRZ+36V0IjsfKgMpcvz45l2p2ukiT1wlFg==
X-Gm-Gg: Acq92OFD3ElXpXHxGVC4jzFQgyiprEax41/cGE5rr7z3x9o1ATEOwZjeb7btRuiinqM
	64vlrYvwYQwmx1SXO4NyQkJ+aZH4BeKN6Bp6yG5tN1IXIOM/hIFNvOPzmqDgMTE4dz5M9E7VFFV
	oWA9EhdGMo0F4xRJe5H8/+C0F8of4EZ4XsGhqEssTm06bT0TpERfwcnhmGzHaTx/xNgEU1rwBOI
	HeX0ogrkVjWpcvqRD14pAZmqUeYTDsMVnhbaPPm5jQsjrmW9JWcLA1IAOxRA6mUWe05PquSxhky
	5DpJ/wmpCn00e3McYeIpY658r7y0Ac3h9P0TTI89E99IpLL4xY56zbVZGw9evm4pFxpvMg2GJsh
	V2focDodNjfwNXm+UOpeFsJ8gP3yuxki59h0ott6PUJcRcf+4HDypHIiEgBtTuSJtdUnBhJaGJn
	aUCqiMNkwGK5K3JT2VbftYKGLixKc2A8giBLc+7avHSOqMOvGQwuCOt/O9A8/Kj7XQtkIOAooO
X-Received: by 2002:a17:902:db05:b0:2bf:1845:baf5 with SMTP id d9443c01a7336-2bf1845bde2mr12584885ad.12.1779992193939;
        Thu, 28 May 2026 11:16:33 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58dde4fsm198930285ad.67.2026.05.28.11.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:16:33 -0700 (PDT)
Date: Thu, 28 May 2026 18:16:30 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>,
	netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	patches@lists.linux.dev
Subject: Re: [PATCH v2 05/11] selftests: Add additional kernel functions to
 tools/include/
Message-ID: <ahiGflOWOOk0U_b4@google.com>
References: <0-v2-72e9640932fd+2c64-mlx5st_jgg@nvidia.com>
 <5-v2-72e9640932fd+2c64-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5-v2-72e9640932fd+2c64-mlx5st_jgg@nvidia.com>

On 2026-05-15 02:30 PM, Jason Gunthorpe wrote:
> These are needed by the VFIO mlx5 selftest in the following patches,
> which includes some headers from mlx5 and also needs a few more
> MMIO-related features.
> 
> - DECLARE_FLEX_ARRAY in new tools/include/linux/stddef.h (wraps
>   existing __DECLARE_FLEX_ARRAY from uapi/linux/stddef.h)
> 
> - dma_wmb/dma_rmb barriers: x86 uses compiler barrier
>   (DMA-coherent), arm64 uses dmb oshst/oshld (outer-shareable for
>   device visibility), generic fallback uses wmb/rmb
> 
> - ioread32be/iowrite32be in tools/include/asm-generic/io.h for
>   big-endian MMIO register access
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: David Matlack <dmatlack@google.com>
