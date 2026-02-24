Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448A3364EBB
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 08:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771921581; cv=none; b=fF6ChatxbQoqDPmhEozk8l3nysjJwtzu41TDLUOEf45mc/h2lQ+othv1ToszjQuzbLeq92C2dsWZ0RrefXWjjgAV+ibqcHaya7Aiy3bqSIgPmvXz4YpOXpmhPWXr/MOtLaMHp4kcUyD1odBPTqm2Usirc1Vogr1LW34l3OPjJ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771921581; c=relaxed/simple;
	bh=FtVWnKmSAhQscaTbVknx7Fz3wyNfwC/jGqjGpMz7VS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7K1iWsRj+/vDUAt4jvUqUwRAIxutbDPVQPfv3ESCr6fX5A+v45wTYkGNywjBTMoPWd+qTjxQ9BGr7rQCfn03JVg+SpwhCDOz9rUMWMWcTLRpM9eQZrPeN9d4akHGyZpINdCUNVTwPC20wmMlXeq4VlnriMVOWnpDN7m/BsW8Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BzspBYjl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BzspBYjl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a964077671so69585ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 00:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771921580; x=1772526380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iUKKSXBfGZuIEKcFLX2f8iJcwGvlTC3YM5y4lXwVnQE=;
        b=BzspBYjlzJho/96OyJYC3/gHlaMUuKjiw/QoS90zqVUIVPaB1+4cmFktKshaEN64oN
         zPGDaxiy7uah8Ty1NTrZSA56zwLNViSRrvAhU3CzYvYqHVtdE1JxUltMvAbg2Y0Z7iZ7
         oodAGSR30NSP8Spay1Qb9whhfK0FcfkaU68AU8wkjBFuJMQz/F2SQYIo/+QfFR2sVJgc
         55BgOqCT3TICyhtcjz0RFUkIHBBDi+vRzXiN0GVSzVMH8I297zVcjKCPk8KICUw9+P8T
         Dl94M4PzFks+1ul9h2UtYgullQAUdTVuz+swCqQpFZEs+fBWJDQD+bx+OeZfxxLBLV8v
         VNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771921580; x=1772526380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUKKSXBfGZuIEKcFLX2f8iJcwGvlTC3YM5y4lXwVnQE=;
        b=WUx08oTnT7WObFQy8ptfsRKPmZf4muUPTt/csGwYtf13WGb+ji9NGaz5zNV85ZBoWS
         FZIUqL5VE7+kgqjfO2JleiSKTxRS5OM/94LT6gfszwUVFyA2weuX0C7DAUUYa59DqJ7C
         Dx4zmVgLjzdHHojORNeF9CqtloZ2uc8mLrV40CjkgWaDBpIUiTlUS9IHgC432pXaMJWu
         P2xPYUJnou2Bb/BDJCECztzPFjLDaA+oRG2Cu1LVQW0stZCZBn+GwVityJV9q981v+sA
         k0wxFukbKxJIeAxJ2MtjAggMIsKRwmX/N3xb3BtU03za18WB/vmfDnMtW0u2p8t+xlWo
         B5eg==
X-Forwarded-Encrypted: i=1; AJvYcCXHp2yDD6tSStJ+EN5xp1FrwbwoNaxbYn73NFAfjLzo/bSMV80nDMby/wXwc7ReJghSCsjjpe/QJzK///X2ROo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvNIC6ram8mm0tI6W5lsPtw8ttGc+sWmWLvmtSVYCMhmCJr/fi
	V5HQddgOhVovz79xpYuPZFV6BDw6Jd22gz0zMkCess2s0/iKEa+O4RMBKGzBMpBmyw==
X-Gm-Gg: ATEYQzzKkiln/ZjAdi7K0L9TY2bnZbrPZeywz01m6l8y8rmzsPNeG87J+M1aqYGI42t
	fP2ysKRHozHG+GxhGTwyR/hb/VluHSv4vLnlY6lWsUWIkwxcXcQQ6tjDSw5kxRZY+b/EZVfC1/s
	0XN2vWLIIm6WFt+ndrZ2OSZ2k0JM/4w5LULbXKamHspEGr8PhXyP53vnupY58KzWxcKHlx7nAFa
	onjXaUPvsBgiUbexKecwmuSXxusr7iu8jnY4XJyQ4TnLfzgMNCqLURDnWE2tDQjWeb88KbG1AvY
	/W1LycD0Yd3feE/uEJDd9SxTeGWecSZWIFpVYTrHxkCH3Fj2wskkwWK6sUMATG/3mOXdD2Yw6/V
	EJxWAvcWOn9ucR497vhzVnWxbBvyTNZxi2kSukGJsN/f21Z/f+a46JZboDgj59J6600W9plsvjR
	H4MwfESDrtpUuwRABEQyYIsw6nK+ilZ7gTKlqqMXsPrJRXntvmX5f8xkkiCyNT3xfzQtJOZeo=
X-Received: by 2002:a17:903:2f04:b0:2a0:7fac:c031 with SMTP id d9443c01a7336-2ad997f5113mr1474945ad.14.1771921579006;
        Tue, 24 Feb 2026 00:26:19 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ada77cc13bsm13228715ad.47.2026.02.24.00.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 00:26:18 -0800 (PST)
Date: Tue, 24 Feb 2026 08:26:08 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>,
	Alistair Popple <apopple@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org,
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
	Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Tomita Moeko <tomitamoeko@gmail.com>,
	Vipin Sharma <vipinsh@google.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>,
	Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: Re: [PATCH v2 01/22] liveupdate: Export symbols needed by modules
Message-ID: <aZ1goNCgY8xz9n6K@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-2-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129212510.967611-2-dmatlack@google.com>

On Thu, Jan 29, 2026 at 09:24:48PM +0000, David Matlack wrote:
> Export liveupdate_enabled(), liveupdate_register_file_handler(), and
> liveupdate_unregister_file_handler(). All of these will be used by
> vfio-pci in a subsequent commit, which can be built as a module.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  kernel/liveupdate/luo_core.c | 1 +
>  kernel/liveupdate/luo_file.c | 2 ++
>  2 files changed, 3 insertions(+)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
> index dda7bb57d421..59d7793d9444 100644
> --- a/kernel/liveupdate/luo_core.c
> +++ b/kernel/liveupdate/luo_core.c
> @@ -255,6 +255,7 @@ bool liveupdate_enabled(void)
>  {
>  	return luo_global.enabled;
>  }
> +EXPORT_SYMBOL_GPL(liveupdate_enabled);
>  
>  /**
>   * DOC: LUO ioctl Interface
> diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
> index 35d2a8b1a0df..32759e846bc9 100644
> --- a/kernel/liveupdate/luo_file.c
> +++ b/kernel/liveupdate/luo_file.c
> @@ -872,6 +872,7 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
>  	luo_session_resume();
>  	return err;
>  }
> +EXPORT_SYMBOL_GPL(liveupdate_register_file_handler);
>  
>  /**
>   * liveupdate_unregister_file_handler - Unregister a liveupdate file handler
> @@ -917,3 +918,4 @@ int liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh)
>  	liveupdate_test_register(fh);
>  	return err;
>  }
> +EXPORT_SYMBOL_GPL(liveupdate_unregister_file_handler);
> -- 
> 2.53.0.rc1.225.gd81095ad13-goog
> 
