Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE03F3264E7
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 16:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773677038; cv=none; b=X8vcG/qFuHtrLMJIVY0dqoJDspkOwqhQwrZyTtDSbdSoBHJHN5ynG0kanOhD4922TnNoyzezEA1XNnKeg5PH5qIfjxi5IWXqEVZ0OeG2fl2+USYQR4YpUxwDCuYPAwJ2FQgUTZ1LKuRH7EU2l0g062zjgaOnZmo1TOc9lkN2swY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773677038; c=relaxed/simple;
	bh=VInkhQ5cN1UgrkyCqVsf7W0yAPyJU1+jBM2qlhzBzLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gD6tdL0fz965HMu6w/XRvfUD2KJ/m9VXCVXawqfpW2kO3ZfBQd8bTeOXhhQbzqrs4oyRncFkjxu0jslkQhrdwKDyLlPyYKYkui0rb9lnFF4KSYf3og7ykxB/0RyVQWTyqF/BZGMdnxOdVlvx6i6auG4jq8whcx/3Y8RTrIs9A2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y/weheCp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y/weheCp"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2aeab6ff148so160465ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 09:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773677036; x=1774281836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f55pgibkB6ee+8s3SeqViClU/kNvQ9qZ/ylLM13UAeM=;
        b=Y/weheCpwOKFypb5JRCCbqkQbARpJ0gg5UKZ3L20u70gNb31B+A98JTQDJxRPNpyrT
         1BT47ZquWv8Q8WpBrU+rXXE2eS/BjJjMtpZxJTxogZi0tSuV9gf4pFsk6/VXaWt7FFI6
         Lzjfw2KIZCwYttcgCjqzPcSDy81mX7r6wCQzsW7gvkpjHmMtpl/BmBImlzN08xL8EXor
         LkF8ntWJ8kWAb5jMytzFmsghAXeIXxBD63U/4SSIB25iRWPsWuzkJuIfQ3eh5LQ3RvnV
         DU6U4xo06jf6Ycp2DblajTywRg5TEcSHnfG9Lu/PcfjfYw9VvATNDry+JRT6gOh7NXwp
         acMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773677036; x=1774281836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f55pgibkB6ee+8s3SeqViClU/kNvQ9qZ/ylLM13UAeM=;
        b=cEAc0DYWq+Acpk0OYEXlQ6NCTOioZQ88rCXp2jDRFwrIKU/yJTi2rg5jt5FuGMETmC
         1926yhlMvo59p58WzZ7m+PisytYx27hc/35leHF7SmNH4KqmLOjkXDKrf54DpQWI0p0Q
         Uf+fSUN7l2co09ZO1Eh6WnXwLZSJbrDoSZzny+BelBYEyJaoB2PEfqeSFCxGaam7ezD6
         hu5nhzco7y/dT+dm6ImvOaZMYEINOqtzaH+7fBGiaX4Bara+ADCmHONl0TkqobLuX5QV
         kH16ZYBUnM1/caSldRiC5wg/VlBSh8z9AV+z54TKXAREDZ+p2oBJEgJRRe17LVgakFYa
         PCVw==
X-Forwarded-Encrypted: i=1; AJvYcCWEOckq53jAy9IFtkdlltqM8Fq1G0MJ2BH0zm6vzNV1qYZ2K6Nxlv/VP+NsY/C5XaG+fmyaupDNsPI3+jG34Ic=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRceMmgukajsm7cQ+SsED3Z0lWURURYfw6VWu2Q5MICaEJxavJ
	2GnHIMRXajs+vQlSZ7VfhTvRLggpM/PKH2FppgKSWDPpyI/TAeNi+dPEkj/cBGFrXg==
X-Gm-Gg: ATEYQzwyVVqiCNtDp08gM47UVojH3XjUYgAR+tt0Q8Hh3Xa/Liba9Z2E21dAT6I70MW
	bemmiL9Hj4IrtfwCIRyIxLM0/Xm8N8zpcQvvE3Xlw3WbG5D2CEgFlcpVKq0z9mdITXWrMTHlyKq
	Vh8e3HfgqJ/wQaJBY+NDySxeGgF5pXY28nMV7YEhkeFFeYyIWXp/USxLDX0mO8C7vPMxSAqDTsR
	K80dEEWttv5Fv/pSP3wpU1+jcbJUoHo24eVFUjwrd2+oDOqbcwAMULYQh9cCzoOwx0p9mr699zW
	20FfKXn3lwbJAVnNb8mmdq8sho9FcTT5U15MFcfHuyH0KhrEvQNNUafq1Ljv7c1ugrTX/4hg2Wj
	HIQXVsxet4HPEN0EMKbTNxVDP/2WNlbk/pCttuqvt0PBBL9il3GKD0vmFHaCwJQeqwywgZgw0cf
	ZDYSSCjlsxADfC5gbso3bywzvOOy+2ZaTVtpXOxukkwLxe3Rgd+YBzG+SdjA==
X-Received: by 2002:a17:902:f54f:b0:2ae:d10c:6382 with SMTP id d9443c01a7336-2b042102968mr4463575ad.20.1773677035489;
        Mon, 16 Mar 2026 09:03:55 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb9966cesm9261411a12.10.2026.03.16.09.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 09:03:54 -0700 (PDT)
Date: Mon, 16 Mar 2026 09:03:50 -0700
From: Vipin Sharma <vipinsh@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Alex Williamson <alex@shazbot.org>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Alistair Popple <apopple@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Tomita Moeko <tomitamoeko@gmail.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: Re: [PATCH v2 07/22] vfio/pci: Notify PCI subsystem about devices
 preserved across Live Update
Message-ID: <20260314061747.GD4177610.vipinsh@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-8-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129212510.967611-8-dmatlack@google.com>

On Thu, Jan 29, 2026 at 09:24:54PM +0000, David Matlack wrote:
> diff --git a/drivers/vfio/pci/vfio_pci_liveupdate.c b/drivers/vfio/pci/vfio_pci_liveupdate.c
> @@ -192,10 +200,24 @@ static struct liveupdate_file_handler vfio_pci_liveupdate_fh = {
>  
>  int __init vfio_pci_liveupdate_init(void)
>  {
> +	int ret;
> +
>  	if (!liveupdate_enabled())
>  		return 0;
>  
> -	return liveupdate_register_file_handler(&vfio_pci_liveupdate_fh);
> +	ret = liveupdate_register_file_handler(&vfio_pci_liveupdate_fh);
> +	if (ret)
> +		return ret;
> +
> +	ret = pci_liveupdate_register_fh(&vfio_pci_liveupdate_fh);

May be we should rename pci_liveupdate_register_fh() to something like
pci_register_to_liveupdate_flb(). In the current way, it is confusing to
why same handler is getting registered at two places.

Above name will also make it similar to IOMMU series as well
  https://lore.kernel.org/kvm/20260203220948.2176157-2-skhawaja@google.com/
