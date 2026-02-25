Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8122D3A86
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 22:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772058594; cv=none; b=G1NzRmziJAlAj5mt3jnlKV8UjqY9efhKRcN7rKPFT4rU1OYnbbRVBT9rdon2749YQrv5DexkdVjmKxn93aNe9w3Ko7W7bE2bMkOVlVH/8idD6Fikh3ajWlRhWB/ZRERKcGKZ+OZBSjVpFIVs80S/7koY71PGuAb13Ehn+FRnn7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772058594; c=relaxed/simple;
	bh=GQ5r1G3VoaIJD/4mlI2bH7JYCa7TXODdwhiG6pJZSvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Di3mxfcNekXQF46gi4e18E8D+KZN7ufKk6aOakTJq5fNcYGtdJzUTSjk76SJGjZUPVjtPBdbBALdt0yi+xoNv0j/abcjuEjv0BDzBNKOnNY2oS0dKtor4Dk5Jiz9LXzXKst9lea5V7oK2U2NLYXvS7yIiQQG8KHOhfU/Dx2Flog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cPHKs0df; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cPHKs0df"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a964077671so29515ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 14:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772058591; x=1772663391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EvlpF/Rbdy5yVGOyUM/AWdTkLEwWYWZDygf5cNk3LN8=;
        b=cPHKs0dfuLBGgP9RWwQzmk7U66+8Eq/gOPwRH/k1Xb0Y4nkwfPCZ24XFofGoEDIBqs
         Q0G7eW5zOXDzRBm4wn7YSnutAdpv53y6VrRE2RDcQTJT8FtApKQEN20OZ6nRtFAP8jWX
         RfysxOfv8MuykU81yo1oEOUIy6paNULcscWeYr9zvdjR8S9dBEiTWZrx8PVHJ/YT6DPD
         DoaY9s4zuj0QNt2tsnLipkHAQCcDJBhnW6uTt17O2AkaR+v5LiUgK5dV984uZOPeLW6i
         giWsPH1lm9RSap7rmBg/41ix4hX3tvohbZXhlcElEfSSNnOfSaz+oBqznDl7za2o/FD2
         Ag9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058591; x=1772663391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvlpF/Rbdy5yVGOyUM/AWdTkLEwWYWZDygf5cNk3LN8=;
        b=ugkuTjBeciLoMbIBPb1Wb2+UHjUehxHLEag4VH9atNBAeVIh5I+bG7Ex7BTp1G/4y3
         cQNh190vcRLD2Kw11K9TxqA0QoYGu+l9dTTj8uTylZiS8ov69hQr40+ijgQbs8kPHNKJ
         sFtyLSJ7R6cUGWo+E+wddNHXUABe+6aSDtOvZ6xUD/JvrgSBl9UD+vezwCM6+RnBKiLN
         2c55zrOwsNpqkftrf9gvZq9eywsV+ZIoM11zzDhKJW6Nu/p+T5/0NwtVnBpprHd8c/aU
         IbdU+udEu1lY/XM+rLO+LZJiBZArAgKWAmsfxJ+ysbhcBEHGpxOsoIcd/+Op4UW2/0Qx
         dNnA==
X-Forwarded-Encrypted: i=1; AJvYcCUcB28Q2OSqNEKo6R6WKFeL7zKJP85WS2ZKnjYuX6Clts18i9AFJWqbT4uRScC3sf1xUNXdCEEZC3aCZBJBLhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhcLyvgpTWi9MBbtEoAQ0Dcz7XTlsakoj8FjdZH73biwMnhmi6
	BdX/whACytdB5o413DrZPZIrTpCaSGUIyFjTCvnS/Uuw+YgG/qENCmAlsr3nWoA6/g==
X-Gm-Gg: ATEYQzzRojmi+iPbRSfao7UKI3qzZFQLvESgzFONp+1KKA0Q0YMfyBAfpFa1RycNGmZ
	tAWLgF4YLRv1UN0IShKVo+t6tl5Fc/5Vuwst92vGA8EG9ui9YNBwe4XWqZkrSHfACTgDKeWK9ja
	empXt/UErVRgCaTYl6uCwzllrVrhJqLzyrf3pR/aWpqm/B407SJeCihIa2LTvtDghx4ONWbGbgg
	e9C2j1TMnAMeVOu57mOP3Y29PJVW30/84YXpochbFB+lRhMmcBIbBEw5FUvOiqicJ93diI9TgzE
	QQcWD7nMy5imevBVBv5OPmGwSrfRY/6dZlzXuDzwjf7hgenKQPAESvsCo6xPjAg9OkikLBA39b2
	bPE96SuEC04ljvREoiR+heYMT7WXJg68JooOQ+tvWProfReJngp1TwB3DMejqTLA1GyBFrsM9oU
	v8DC4A0ZV3STNc/YXfKOCC4UVUZm/UdeKvmUbazx4t8zTqFqbchSUX1Tba0z+19Weu4BnDT8M=
X-Received: by 2002:a17:903:15ce:b0:2a3:cd98:f07 with SMTP id d9443c01a7336-2adfefd95b6mr300155ad.3.1772058591084;
        Wed, 25 Feb 2026 14:29:51 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b2309sm2774685ad.19.2026.02.25.14.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:29:50 -0800 (PST)
Date: Wed, 25 Feb 2026 22:29:41 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: David Matlack <dmatlack@google.com>,
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
Subject: Re: [PATCH v2 04/22] vfio/pci: Register a file handler with Live
 Update Orchestrator
Message-ID: <aZ931bYILhhkhW-Y@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-5-dmatlack@google.com>
 <20260225143328.35be89f6@shazbot.org>
 <aZ9yWlcqs2b6FLxy@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ9yWlcqs2b6FLxy@google.com>

On Wed, Feb 25, 2026 at 10:06:18PM +0000, Pranjal Shrivastava wrote:
> On Wed, Feb 25, 2026 at 02:33:28PM -0700, Alex Williamson wrote:
> > On Thu, 29 Jan 2026 21:24:51 +0000
> > David Matlack <dmatlack@google.com> wrote:
> > > diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> > > index 0c771064c0b8..19e88322af2c 100644
> > > --- a/drivers/vfio/pci/vfio_pci.c
> > > +++ b/drivers/vfio/pci/vfio_pci.c
> > > @@ -258,6 +258,10 @@ static int __init vfio_pci_init(void)
> > >  	int ret;
> > >  	bool is_disable_vga = true;
> > >  
> > > +	ret = vfio_pci_liveupdate_init();
> > > +	if (ret)
> > > +		return ret;
> > > +
> > >  #ifdef CONFIG_VFIO_PCI_VGA
> > >  	is_disable_vga = disable_vga;
> > >  #endif
> > > @@ -266,8 +270,10 @@ static int __init vfio_pci_init(void)
> > >  
> > >  	/* Register and scan for devices */
> > >  	ret = pci_register_driver(&vfio_pci_driver);
> > > -	if (ret)
> > > +	if (ret) {
> > > +		vfio_pci_liveupdate_cleanup();
> > >  		return ret;
> > > +	}
> > >  
> > >  	vfio_pci_fill_ids();
> > >  
> > > @@ -281,6 +287,7 @@ module_init(vfio_pci_init);
> > >  static void __exit vfio_pci_cleanup(void)
> > >  {
> > >  	pci_unregister_driver(&vfio_pci_driver);
> > > +	vfio_pci_liveupdate_cleanup();
> > >  }
> > >  module_exit(vfio_pci_cleanup);
> > >  
> > > diff --git a/drivers/vfio/pci/vfio_pci_liveupdate.c b/drivers/vfio/pci/vfio_pci_liveupdate.c
> > > new file mode 100644
> > > index 000000000000..b84e63c0357b
> > > --- /dev/null
> > > +++ b/drivers/vfio/pci/vfio_pci_liveupdate.c
> > > @@ -0,0 +1,69 @@
> > ...
> > > +static const struct liveupdate_file_ops vfio_pci_liveupdate_file_ops = {
> > > +	.can_preserve = vfio_pci_liveupdate_can_preserve,
> > > +	.preserve = vfio_pci_liveupdate_preserve,
> > > +	.unpreserve = vfio_pci_liveupdate_unpreserve,
> > > +	.retrieve = vfio_pci_liveupdate_retrieve,
> > > +	.finish = vfio_pci_liveupdate_finish,
> > > +	.owner = THIS_MODULE,
> > > +};
> > > +
> > > +static struct liveupdate_file_handler vfio_pci_liveupdate_fh = {
> > > +	.ops = &vfio_pci_liveupdate_file_ops,
> > > +	.compatible = VFIO_PCI_LUO_FH_COMPATIBLE,
> > > +};
> > > +
> > > +int __init vfio_pci_liveupdate_init(void)
> > > +{
> > > +	if (!liveupdate_enabled())
> > > +		return 0;
> > > +
> > > +	return liveupdate_register_file_handler(&vfio_pci_liveupdate_fh);
> > > +}
> > 
> > liveupdate_register_file_handler() "pins" vfio-pci with a
> > try_module_get().  Since this is done in our module_init function and
> > unregister occurs in our module_exit function, rather than relative
> > to any actual device binding or usage, this means vfio-pci CANNOT be
> > unloaded.  That seems bad.  Thanks,
> 
> Hmm... IIUC the concern here is about liveupdate policy if the user 
> wants to unload a module which was previously marked for preservation?
> 
> AFAICT, In such a case, the user is expected to close the LUO session FD,
> which "unpreserves" the FD. Finally, when rmmod is executed, the __exit 
> (vfio_pci_cleanup) calls vfio_pci_liveupdate_cleanup() which ends up 
> calling liveupdate_unregister_file_handler(), thereby dropping the ref
> held by the liveupdate orchestrator which allows the module to be
> unloaded.
> 

Ohh wait, You're right, Alex. I just realized the __exit won't even be 
reached because of the internal pin. The current implementation creates
a catch-22 where the module pins itself during init and can't reach the
unregister call in exit. I believe we should drop the ref when the user
closes the session FD? Additionally, should we move try_module_get out of
the global liveupdate_register_file_handler() and instead take the ref
only when a file is actually marked for preservation?

Thanks,
Praan

> I think we should document this policy somewhere or have a dev_warn to
> scream at the users when they try unloading the module without closing
> the session FD.
> 
> Thanks,
> Praan
> 
> > 
> > Alex
> > 
> > > +
> > > +void vfio_pci_liveupdate_cleanup(void)
> > > +{
> > > +	if (!liveupdate_enabled())
> > > +		return;
> > > +
> > > +	liveupdate_unregister_file_handler(&vfio_pci_liveupdate_fh);
> > > +}
