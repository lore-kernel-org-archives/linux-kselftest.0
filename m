Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974533246FE
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 20:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777928167; cv=none; b=bJz4wrMGb6s9J0d28sOAgNzLwatuyceaIEVEAPMvwdxNL59vQTzkGq5IdphgJVqsVOxxO4HhvWIkuWQOnJIa902rFeVZSTdtR1NU8vd/g5PVJ2FOFryW5DbjLsL9cn2wpMrVnLDV1cC105MTVBoxoqppH/cGqHVUB87frk+Uccc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777928167; c=relaxed/simple;
	bh=6b0uhsWOUueBJikO+3RxwH3ywe4vOaHqBvUoJ1iBG10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0d1YKlq+ijaadOgXP9HbbJMcY2z3Ot+LMkSZ1WjiHsOa34NvIcFcHK0z0Ybk1WeHnzkfxMbt0DE6zqBCVsVvrrio3WG80sJ+JTjhH2VFzAH/U0Cqvv0J9cmBrvXBwHTB2m5xIipY92cQHcM8IrxUGWzYyfedIBKs0L2Igd3bP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e8I0RQIW; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e8I0RQIW"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba17c8cfacso15284915ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 13:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777928163; x=1778532963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uAEnOAPj5fUgAFUXnOyePT2fFfy+RA0tHhuCu8Z9sp0=;
        b=e8I0RQIWCDwpXPl0zwFKbvPBkUL4uuvj/YzwuEeRwSD1/RzGp6Ds2YnVgBznjkvqXV
         NgS/RiwiwRaZmkSJhvDrZ9wpsz61E3uI8uu6TFxaC27O8HUEWFMldbI27OjpAyJufE61
         sHtQkwdVOz0ieMakt03HswwGvApprhDBUHTxMfhqkrpN14E5ya1ycHM4DvInNz+MaxDg
         PoB18jN7QCmgr4sDXizPHaLnc42NHLHwUJ955HcezumMxiFHnmwh+bAoaSovB9J9/PVl
         PzxgB//5/z4EwNoxQACSPFB2UWcw6K61C78Vx3ebh4F6o0IS9IJGnPFsZhrIQ7ap83RC
         SQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777928163; x=1778532963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAEnOAPj5fUgAFUXnOyePT2fFfy+RA0tHhuCu8Z9sp0=;
        b=FQrHhSoCk1sQSVR2cUF4Tpu1lSPkB8R43AUQuPkEOeA7AjxecQu0DxWKlzmheJTm7d
         bi1I/XxdE9UOWFIYu8xieb5raxUIRkZTLn+TF+kNooDbabTNi4dxeRrQNKKcB2rkCYUB
         osTnIGmCPGnZWIuyDHf9mJxI0CgwxH09JUbamZqqCBOV8h9UI8C9+qhE4PY/tziuAFxl
         CGaYq+8Zg6gO8gsZ1A6Cq1CZPaN9Rh5B/OsUHpbykoXUZ5OwIibhuCCEdvll1j+MsBI0
         2tGHJS15i1vQSrWWikPOS65BnS6GMBWMF9RPHGw3qbXutGWI/E82dkMobXUEgpKFFnwX
         XNFw==
X-Forwarded-Encrypted: i=1; AFNElJ+c4W8/6bSBhYFOv4MpQf8dOIcEhSkiQ71dJPX80uv92LVErN7shcSIf27FKKr9v20xHIDwpN7hrboHbYXrlOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZquMK5SuvvlFRNPPYpfBgyb1nbXqpMAmKDwNpBGZORNnFUZ16
	ol3vK24Z4spmBXRwLZnX86rMESvn56Selye7B9uejurQ1djKQO6WL8Ka6A3DdFM/SA==
X-Gm-Gg: AeBDiev8BOE3p6QkVuGJoT24uzuCRCo8KDcCk+Rh1xPjSPmOhgNtNYUf1OguvLs6LKR
	3KZW2x6zhwQRSy6NusHWoK4s9eJYt8/XJAGzdy73ZKS873PIBIEgo1PSY8fkwqpQy6rWh3mke9e
	bgxXnlxr04J0RtBHeealNoa196Uzz8A5UpT45e+ME35QuW23juKqYUXfkrNIMLz468Q3RVn4Xef
	iKT/dytw+LAmeoBAFwjWD6yqtc8sEJDBnbTjjMTq9qw69ZE0H04ssOv0QKcbSqbEpZnzJKWAQ3A
	UmFFCQYPq/2aXY/J62Ul7XIeKmgLVQ+MOs85bARm7ZlBnQ2308cnOF0IKvZNrchQakJve2aCG+p
	mL9myWE54y1HsoOP3lKgXe/fk8zcI+X3huKAP/vBNSJKAugjGlF364lGuMQitwO3kc8jtvLb0bh
	bQUtsNcniH8jvWrXnscDdPn2DnPJi7GT/bono/iBh5NKJxEK/UuOUh7oXRM51cQ9Z6QiUCOL9f1
	Vzs8g==
X-Received: by 2002:a17:902:f64a:b0:2b4:5a2e:98d9 with SMTP id d9443c01a7336-2ba53896e5bmr1405745ad.37.1777928162684;
        Mon, 04 May 2026 13:56:02 -0700 (PDT)
Received: from google.com (76.9.127.34.bc.googleusercontent.com. [34.127.9.76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7e7besm116816715ad.12.2026.05.04.13.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 13:56:02 -0700 (PDT)
Date: Mon, 4 May 2026 20:55:58 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>,
	netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	patches@lists.linux.dev
Subject: Re: [PATCH 07/11] vfio: selftests: Allow drivers to specify required
 region size
Message-ID: <afkH3pMJKkIbElhI@google.com>
References: <0-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>
 <7-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>

On 2026-04-30 09:08 PM, Jason Gunthorpe wrote:
> Add a region_size field to struct vfio_pci_driver_ops so drivers can
> declare how much DMA-mapped region they need. The mlx5 driver will
> need ~18MB for firmware pages. Existing drivers leave region_size as
> 0 and get the current default of SZ_2M.

I would like to get rid of the magic SZ_2M to make it easier for other
tests to use the driver framework. Can you make this commit update all
the drivers to set region_size? They can all use the same approach:

  struct vfio_pci_driver_ops foo_driver = {
          ...
          .region_size = roundup_pow_of_two(sizeof(struct foo)),
          ...
  };
