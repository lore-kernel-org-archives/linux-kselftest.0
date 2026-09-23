Received: from mail-pj2-f31.google.com (mail-pj2-f31.google.com [74.125.227.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6515218A6
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 18:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187976; cv=none; b=obsZEunNWMNpi0Nn59MFzj4l46xovueQTfuyoEEscnaf/qVsQYG6vh5PWrPwrRBH9vJzU5CFdNb/scbuxWTVc5ZOrUir8Q8PdozLIzC6w9cGk6Sdw/6oJWdn37IewGUGTkaUNL+ijV2QNgDQ167zAy+bu9nDLHcvj8lFPsBT/g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187976; c=relaxed/simple;
	bh=LhiPso6phLQM0wA+k6tjmIhIVqDrjbY4C0VTVIyFW7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrW44SD2W/Ees9hqM87HBmg/jtWnu0a33UjFrGhHh8Y97qjcy+EVMMhqYgCqycg3hnO3hFOfuiqvHruTAZNzPnhlwnOChvbXTiljJYiV/DdOKCgMU7Bi8YdBtRG3PKedpT/eJsn66cEKxJBvxC74OOxtKQji3xgQ+9bf6u2g0dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cb3d6YzW; arc=none smtp.client-ip=74.125.227.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cb3d6YzW"
Received: by mail-pj2-f31.google.com with SMTP id d9443c01a7336-2dd53691be5so8626465ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 11:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790187972; x=1790792772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LNon7FG4gNvQZ8cTIn7dGZggjcYoEo+V3D2k9W/8Sxo=;
        b=cb3d6YzW6nrGuRRS6oSU6xIv3mfNSvAfD4J+NhlQOOwGhtfYHTTWnAIK8qaVqc1gkc
         r0EMkPHPvvuRU99MGAgbwLazKtATFcwxTWwuJdRVO4+8BXBh8alzfX+EQfop05AIYzub
         06zcGdrRIZeWntKW7Z/GsG8cDvxIw95aqKmtrB4GUybxBPseaSwjRFdzyNfnsxZG72WS
         i5rhwkf9o7Wlgs9oHqgmGnk8IXv+DAZEyXpVj2V0OHPL8M1QD/gqAlmwtAmJhqAp/zhs
         SElDmw4UvXWAAA0OKEDvJioloFPEYLJAT8X61OdhF18NghTfdBl6cuVTC59eTKPNsS4b
         LLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790187972; x=1790792772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNon7FG4gNvQZ8cTIn7dGZggjcYoEo+V3D2k9W/8Sxo=;
        b=YNgWubufXslAE8qd2DwB2Jvznc6IJPz5rDAXH4rVyZ/gNH4gNuatBc1C0fIK5a0g8U
         WPUfP21B3zs+/dmrEVtukbmGV/YFD848Y1VPyj4NUeZfujdr54JZXi8XoriuGYR5AkFL
         wLym0tBXsnXFLH4K+VtNj62FxlIFRAgfblyjv3jFDM34q74xMFpxWwbBELsmn1hT7hK3
         uoUzJ488PIHbd71c34dRaXVXol7VoF6C+b445lmvOw/OTdJwVSkOikeZOb54DLWuD5C0
         fMLHgIQwElGioxUmjIxCN/IKR0mlwgkhjGI/upan/NqoC79zZReXZwmbP/Mu1Gnt7gBu
         uJ4Q==
X-Forwarded-Encrypted: i=1; AKwUvByDGmujNnJBHTx/JuG/PmfDK+27LN5M41FZ9B3Mtj2SklcUG1UnE1zhP9Cok2DeWKufnRFiB8dhr7dVZif6QnM=@vger.kernel.org
X-Gm-Message-State: AFuF++nbXBYCR6ga2IIl4o/LEOFj3hUQrPBxLL7qchkxH5YX74GWPWRa
	07c6CUv2X6jmy+I77wxO8OS+qoDVjRzh4gp+c2XOs9A+PfbCVOIf5GTOAi2o/LLb4g==
X-Gm-Gg: AYBFou0IbnKSzo3zbcEZDsATVck4gpesV0R1na14+I18tYxU//jxfrFPbUWJFqeAHAW
	ACqdDliuvLebaunkN9Y+lSZNx6r9g1InXT7dzhgBlTHWc0fKXnOBqFNDifl4VfdKkz5HuAsq4pX
	NlYfgPA30SkzQbwe9eXr3gOr59yLvNfSAEqlDV5tflGllpOg2MDs9kfxkH5qeDWEAOgCm4TP8ia
	ZjlwSVlCTkUrtD7USc0gK68sM2KOPzmUU/kJ8bTxxeX3BlJ/g58qnoBXVuHN/O/FmWe4mP0DPuk
	B7ZejHC2SkftH/liovaWVNZUh8AMJ9sUJ6YzjF+YaXzYY3DAkRKwL7wZ64fUZt2lxd0G8937tIV
	leELuiBsfPGMLb7a+20df8JQ4efBp4zvw8Y1nWpPDrIeNXi5g7nAFhwzYROF+cfu3Qv/jsGuop3
	n1D7XjHJYTo1AI7qJ0heVWpWuk13j/tUArcpREWkA5YIHFNLKtGZ8ux+xu+/Z4Q5r4G8Z9922MQ
	PlI7PMvaGhXxykUGVdLV+csHDQStxloTztGbvR/RbtRXnqHyVk=
X-Received: by 2002:a17:902:ef52:b0:2df:3b09:664 with SMTP id d9443c01a7336-2df69dcdbf3mr30657015ad.32.1790187971787;
        Wed, 23 Sep 2026 11:26:11 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm15475075ad.64.2026.09.23.11.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:26:10 -0700 (PDT)
Date: Wed, 23 Sep 2026 18:26:06 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Mark Bloch <mbloch@nvidia.com>,
	netdev@vger.kernel.org, Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Sean Christopherson <seanjc@google.com>,
	Steffen Eiden <seiden@linux.ibm.com>, Shuah Khan <shuah@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tariq Toukan <tariqt@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>,
	patches@lists.linux.dev
Subject: Re: [PATCH v7 06/10] vfio: selftests: Allow drivers to specify
 required region size
Message-ID: <arQZvkNtgq-NlUkh@google.com>
References: <0-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
 <6-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>

On 2026-09-21 07:35 PM, Jason Gunthorpe wrote:
> Add a region_size field to struct vfio_pci_driver_ops so drivers can
> declare how much DMA-mapped region they need. The mlx5 driver will need
> ~18MB for firmware pages. Existing drivers pass in the sizeof their state
> struct. Since drivers all use only their declared state we can use the
> value directly and remove the SZ_2M hard coding.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: David Matlack <dmatlack@google.com>
