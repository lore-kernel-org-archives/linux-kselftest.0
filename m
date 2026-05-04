Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A95386C0F
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 22:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934476; cv=none; b=tKrOBS14Ae075eJ2sng7VDPQlrrn3WtG+1PkPfv4TEf4v+Rz2gPMjQGR8Xo+du5lsW00qDyih1eAz++HD9Ee33rVkuzVbBVnSEfz5kNYeL/GbErRPRHe974AhypRXWDrKyRihHQm9YQP81tSdYQnv/xD70unuPWrzA4rUBg/8v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934476; c=relaxed/simple;
	bh=RzOqRkn/R0QNDsfK7K++CoXWWR3SbKNw/NPdyEFB+4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHN8EbXOnQzlB4IeD137NpdbAFuqhYMUKb07h9996gPP6nskQFnkq7oPE0Sw+WtxITcNE4dfUzY/2OTCEf/jgncROQwKaVN8lzJ34wrMqWTa4zBusBVuhau8Zw9np17zHyVIcw3K6MG48FxmVhR0cMC9Dvhj1PIFYKgqO2K0QWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aXEFVUOR; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aXEFVUOR"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-365313b86bfso1149717a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 15:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777934473; x=1778539273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5BrO7xosGb8uYxA7cSQfYj/uPUPleoSCzn2z5rA8SqU=;
        b=aXEFVUORW+VWRWX9PZ4Dj88eFq/r3Qi8qperJz4m5LEGZ1aPVScvbXQ2Ac1jckISiY
         6JCWu+p+s7UdfbqGa5GuPE3YhmiWfW5S0DurA3EYhgt4S9m+DrwwF3FiiAP0f3eYgU9A
         5yOEg830m3ph2AUyCO9u9nf9ZqyPX+UrKxLPOiSSJ9OZJvnyXabZZOPFiY3rjhmLPw+M
         Rq+bCCUG1m5g1hespIECc86mxR80ghIupUnkGQhjq+OGjsS7OOPcK62JgrPBCZkMMyMz
         o67a6r/hn6qzbhQN9usdHlGxclrTa7VZY3k8bLhcYV8bVFlz2eRKo+VP2CxuDoFLGM7k
         HToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934473; x=1778539273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BrO7xosGb8uYxA7cSQfYj/uPUPleoSCzn2z5rA8SqU=;
        b=S5PPSTUVDwumoS0jSwKggUugA0EWFdYt5IwHIgTVjX+Ox2QRykJE5syYfdPuJezkZh
         LuSu9RCH7apduDqYGMoNoFn0ZIKkN7gWqd6XaNlOQ59LdCGv79zKhESiruaM1MjO+Zyb
         c1GCDU9p5Cw7yVoJiaP8FmXRew4cC9a2EyFrmywIIn1lvVjlwNOJzSCV/IASmqoimIRH
         SWT4Ece8AKsoLddhK+7eupR8gDKBGy3H1IKVZS/sp2wYCxcnXHhA7hIJnIml5mygHH5e
         TArhgSN2F3NzrDRmi9Mg9zvUiwNdViDXaTw4DymD+DhMnDS4xK1iZKLOfSkb3xc1Z9Dq
         RdjA==
X-Forwarded-Encrypted: i=1; AFNElJ9Hx+5PGChppk/Xz8T1iFnsfULjWU2tjvCLHt/F4w88UEETECkN85m03MQ6elH7+ONfYYEjEYKWRz8JeDgGH38=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx12Jeh4U50iXx3P+s4FNHCs5LiuSwgPjkiIF3N1m/MgPvrqsxh
	ow2iffNM77dUzVFHlOBFcma2s/9yZ2kcHAfFYtvmAIq/VlrNcuKm2HlDQ1k+7xpPgAUlu/9ETNV
	5+t1y3Q==
X-Gm-Gg: AeBDieuTKpRCmRgnlcafwEGQMxZKGRlbKUvj0NzIUa27xZ4HC+2jvGaH+6ye0gjxrid
	+mLgNh0L+nZpS1I9LIx+ABKQfmJDuzQvklDm6PWS00qw9oslPl9BiQ+Gl6clbnDjRCnnUhreuxz
	vjFaVFQA79DMxWTWSdBP9/joLaQhn4UUat+Hb9SpdaEkOvNJvRJrXLUEuI0h1UE4xn69uHTwYT+
	+508JalKENOI2C7IjPOC016yeweZCt0bblevhCXga5zrBsUG2pBmS9poV1N64jkaCO/GZPe7lZA
	ps7GR/ZDrMtLqymRB2YT9i0BnhOTu7dO1tN6wWoLGgQ/oTwPfsqv392uj5zzTiPyY/Z/0JqphR6
	0SL2nAsxZyIsENRGj6wq0oMxnZ2k8XegUb+uhrQ0s+llfC73AU0vVObhGSE8qvLZWpYB4ojO1Ir
	yVK6Ek5cDE9PD/sYmpS+1yVnkodI+6rvSWQFerStdfp6LjMkEYfq/0fzJ/nPTrOmYfJZvZmfUc0
	Smu2zlu3eYGLxx5
X-Received: by 2002:a17:902:e547:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2ba535ae6c3mr4752285ad.6.1777934472389;
        Mon, 04 May 2026 15:41:12 -0700 (PDT)
Received: from google.com (76.9.127.34.bc.googleusercontent.com. [34.127.9.76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7ee38sm111789655ad.16.2026.05.04.15.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 15:41:11 -0700 (PDT)
Date: Mon, 4 May 2026 22:41:08 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>,
	netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	patches@lists.linux.dev
Subject: Re: [PATCH 10/11] vfio: selftests: Add mlx5 driver - data path and
 memcpy ops
Message-ID: <afkghFm9Vo-SfF5c@google.com>
References: <0-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>
 <10-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>

On 2026-04-30 09:08 PM, Jason Gunthorpe wrote:

> @@ -1368,6 +1716,11 @@ static void mlx5st_init(struct vfio_pci_device *device)
>  	mlx5st_alloc_pd(dev);
>  	mlx5st_create_mkey(dev);
>  
> +	mlx5st_setup_datapath(dev);
> +
> +	device->driver.max_memcpy_size = 1 << 20;
> +	device->driver.max_memcpy_count = SQ_WQE_CNT - 1;

What are these limits a function of? e.g. Is the 1MB size a hardware
limit? Can we change SQ_WQE_CNT in the future to increase max count?

I'm interested in this because for Live Update testing we've found it
valuable to keep the device busy for several minutes so that it can do
DMA continuously throughout the Live Update.

> +
>  	dev_dbg(device, "mlx5 driver initialized\n");
>  }
