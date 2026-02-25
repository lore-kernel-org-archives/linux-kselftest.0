Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ECF376BFF
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 23:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772061619; cv=none; b=WFId/En2CT8mQGqAb9yhwzzjJUGSEjyFZ7/U1tyfBWzjz6JaaVzqwiKVtmL3HraaMy9XL8L2G0Itz4NtdblWCBURH9A0dSQGfDO8AYSjMLIZJazi6Ajgsyvm7ULWfMec96Ks//RWcouqhtF3WYw906c29qu45lp7PEuI7yVvspY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772061619; c=relaxed/simple;
	bh=ncJ/yZrFQwmQDLQRu5VuYVpooUS7GC0HT5ZYkkiWhy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItL2vhC4NwPJgzH9jUxaCDovKAyEnfMlIeqSZrIgLHV4yk45ZLNbxME5Qv9cZ9e7Y/DD6kXM2Vl0As+9sPBFwgZB0O/0gW2ORVtf6OZfD86jWmLfnP83YkUSAJ3FXA5t27ecDiertCpeRFkx9pNr24T/ve+Cl6mtitV2179Ep+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uhzn4w6U; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uhzn4w6U"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8272a56b91cso284629b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 15:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772061617; x=1772666417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aEWfuL1WgCP/eH/o3qO74sPfk+Pg3+xsCKw2mq2gLYE=;
        b=uhzn4w6UtRIAbnLkkRvfqKWxBco+JaWGwiRza1DyJHeGRsQPcwqUw/970G9aidfPJB
         mZbdRLAhnelthWtXAM066H0ITzo931/rXkSCh69hexdD2OHYrTbdKJlhKIhprEmP7w/b
         rdddN8iQOeNU9st4sqX59824wjd8ufl7mLW0cssGI4D/bDvqtJsRQqxFdJIJ3WTtKIHm
         qc6NKD8dG52/9IkgsB+Vj1v6QZTk5/LgnyXMn08D/0xnIx6K2VYpmHTPCUmEHzHN4dMl
         EerY3NyQyRZA07tRMRN0OSocjAxMABPEh4iUXLFHvJwdvP4D9d+//76ht8k2auMf9DHp
         1h4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772061617; x=1772666417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEWfuL1WgCP/eH/o3qO74sPfk+Pg3+xsCKw2mq2gLYE=;
        b=agjz694dTC9XfpNLo2lG0mUTM+QOgymFJVAogpqnqC25xoqTcz4StBN5oOv6GaQuvm
         i8gOtdgJFEVsNM8UUMwVguaOkmh9+NWF73XfzYY4Fo0Fgnir48s9Ojw3gvZ/gmuwK1kG
         UW51Co9buseBmSSaIh/XaY8U0wE3KYvCWPPGi59e2ekt2OIV3z/OtHKWg/ANxFQb8FAz
         2GTnIG5B3/jEI1+WCW5mnjrjQ64PnezDKeE8+YfIsJruwBdxG1xAFkG8BtYPaeRguJRr
         eZS+vMQZHErDIjcL9SaacPqkE14yGCX0r04FfnEptnUTUiW4s8mCoZOxwR8yrYjt+qm/
         goYg==
X-Forwarded-Encrypted: i=1; AJvYcCXT9/xxLF7JiRaqrZKJCEx/N8bmi0h12oXWHBg9ciLSp0MKugHSL8gB/TqGEynl2ttD9PsbnE21HfEAsPQQmXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLAYMSUKKfEhHVETbYbyG5f4uWpXmmUXIE+y1Qbb266a2j8PJs
	RLpJjt+YLxcTmixXnVLwi3lCTB25uRb/pQQIF+MvWiLkXsZxqEYbVlrXKNHCFrrkwQ==
X-Gm-Gg: ATEYQzwHSzY04SUudaClfMP83I8/OL0cqt63So8NuZlAZXNK+uhj1KIvMLYKjHJO2og
	eZMPWT+OqoT87GkeGHxswZxRXeSVHhDjryFRXdRc7l8z6b6DLwRM23xyU7mrq06+JMJEUhw9Jl+
	EVOc5awIV1LrFjTF1FhuL9lZZK8OAxcLB5ib9PGjUzFH/WnhqjeSDFeowNl8ZY1uhbu3OkoakdN
	eXRlMf8BOiUgBJvPO/O7uOsvXLymMpseLY9xihJEF5KPqIfFwcUSV4FQOpyH19VjVP8NI6V8AtP
	rQM44bQM+iID2zNo9ij3g69mq5TSPnWMes/u2SpePhzj5rvp+bdAfPE+oueLo2z7rQUW5QpBEZH
	w/999Hl+EpuHxIGvjrPOINPRJwIFWHjGkCit+O9wEZlM40237EOKaGT2qauA5YUXJ9U+6+hwEEI
	AlZblWooL1jDgvjSgAJkSMOzzwVhYP5V2oj9Z0bxubT8zelH2GdlPagwsRpZyUtg==
X-Received: by 2002:a05:6a00:18a7:b0:81f:852b:a91c with SMTP id d2e1a72fcca58-8273390dcc3mr1547131b3a.64.1772061616376;
        Wed, 25 Feb 2026 15:20:16 -0800 (PST)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff37f1sm347240b3a.40.2026.02.25.15.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 15:20:14 -0800 (PST)
Date: Wed, 25 Feb 2026 23:20:10 +0000
From: David Matlack <dmatlack@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
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
	Pranjal Shrivastava <praan@google.com>,
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
Subject: Re: [PATCH v2 03/22] PCI: Inherit bus numbers from previous kernel
 during Live Update
Message-ID: <aZ-Dqi782aafiE_-@google.com>
References: <20260129212510.967611-4-dmatlack@google.com>
 <20260225224746.GA3714478@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225224746.GA3714478@bhelgaas>

On 2026-02-25 04:47 PM, Bjorn Helgaas wrote:
> On Thu, Jan 29, 2026 at 09:24:50PM +0000, David Matlack wrote:
> > Inherit bus numbers from the previous kernel during a Live Update when
> > one or more PCI devices are being preserved. This is necessary so that
> > preserved devices can DMA through the IOMMU during a Live Update
> > (changing bus numbers would break IOMMU translation).
> 
> I think changing bus numbers would break DMA regardless of whether an
> IOMMU is involved.  Completions carrying the data for DMA reads are
> routed back to the Requester ID of the read.

Ahh, makes sense. I'll clarify the commit message in the next version.
