Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A0E47CC67
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017959; cv=none; b=PH2PE9pvGjueUJfxbA+bq1UIvMSIvZmym4q5g4nYG3OoJIYXm/HUGFrWTipIeutnj++MNhyhsECaOXruXyIviFs3eajTziE1/SNkdyQRHOAQiouGkDwaeBVAPefNX29dxW7OeCiXTgIJDzhWgoiorEbY0i6BKUSicTsSLRUI+20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017959; c=relaxed/simple;
	bh=0bY3+VnKsZDDkii4NqRrIp5qMNrkGIBYkCIcna1PA6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQ7wldDcTuz4ihrROzBhdlsXIt3/5wAh4mWqZheGdS+QEYSL5LsdLbGrzTMlvb2Fba351fSZhfSOr+fjxH6X2umNQou9IQaBQu6jdX8glSMsosE7Phz/8GYkhp0ZFCsaSU/Uf5aDq8O6DXjVMmyFq/NjX/LtaEJGy9iiZ+htdbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=SPIeTAfq; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="SPIeTAfq"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-915ab38ac14so621456385a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1781017952; x=1781622752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PSHte4tw4Fe/hwOe0BydbVQDJ1bfJM9PJbtvHiFr8Bw=;
        b=SPIeTAfq/uVTl/qWnURHgq9vcM2ig2PCso96nfK+CWLcDp9CeWt9zpIcjt/7ZRItjv
         PYzMsTe7GwbPRNzwPXWnqKM5QzYM8fSP9nIZfjKs2jq9vn0W3XF4fZKRzos6e0H4K3oK
         8TS5794ywJKGemb4SgIr87Lb2mNB7ZmzFv/gROITpCWvzJRppDBxsT86OSDYMHXjSNO0
         aL48CnI69GtNAF6Z7KMOY5HdF/BwUiMPmFhbY8hxhWVUAfFJ/f/AcTjQTpQKXKr65AuF
         bHkV679q6101p+i3Jbkk9hSr3LNPI+8CKDGk3Na/uF5cWitQeBwWihsImNRsiLTwXlE2
         6qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017952; x=1781622752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSHte4tw4Fe/hwOe0BydbVQDJ1bfJM9PJbtvHiFr8Bw=;
        b=NgbQBmvvl62vuqgrY8TSmSqYeDlTD7N7h8epfukxVSGYaLdUL4uQKn5qwxfJCNkAh4
         NRsEhv+GZcHbSO0vAuDRh2p0Y42A8JoRIPA3kmbRChfaWWGc8y9ASRMGzdqfkKdL3etq
         sgGOAHUC44cAfDerqZZ+Rr10K1iRD0rnfwalG9TdUXp/gAjeS1kqFmJFb1HhqgszMx/O
         TxGlCJI3ma5avX52C+C5Eo+3OKR7lKuoZjmzitMdLrHHXt+cD26njNl0pTuxQuBiArLe
         tE0v/EvNVI1LxFsjq0xkT52jxrkHVrY9W45kBluencuAxFEoIXwREeq22EwY/L02MACD
         3xlw==
X-Forwarded-Encrypted: i=1; AFNElJ8agbmz9xYLFM6/DkNw0Es3y8rvqgkULWlrGMdTI04QWWw9BZGhS+rcfTlL0kH3LHYzvi8LPf0ciKIRDF0qLd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVnf4CjUe2zNQu29+O1dDbvVbykZGMb4k9KXj4fyoRFei2cuvI
	9Y1ev4ktRnI8cYUDUDiovT94PuMS6pyMGEc/1VqwccGVEOaAiqeVszxngKuDDi0oEzM=
X-Gm-Gg: Acq92OGbNOxyI8om65LlCovZwVVMat2pgkSWowa/xWlEVnY8Ztc58ppPLu2YYvSzuZR
	0md/fHYb7DM/XWO/U35Lg4Mb9av7uDUAWK7fxThw7E2JOtd47HOfx3nonLJZD/E0QTk1fdi/FcR
	Gdz0MiTRkNWbwoFWoHfkqAjFUNFpo+720hm0SzA6r8sCTKtxHC+ZRBcYDTLr+XdavBOLaU4be/G
	eURgB3X2GLdE1Sxw7KDLMm3QcEd6QN/npp5M8uxkkN1eYuZTOadlK8LgBl8+AOWSDYvcOJV7gIZ
	pjVC9vK8M7SrNqYRS28NYuv45yqO+JoCi21fhEBHHliOsfi6O79ZIZroL1sB7IjKU5vrI8jxKv6
	pYMNR/Hrju/UBmWGEzqHb91mTXtgsHQfwCZ2e40DpdY+oeVCD3MRtzUku90icZsnVsA6RMMMbob
	VDQA7umMBDF82KdcZZHxI+ILMyf3JV77petrS/aN8jklncjvD3i0agjLrUvborpNxAm2iglNLLm
	itAXss182WviIM7OA==
X-Received: by 2002:a05:620a:2587:b0:915:9c4b:fdae with SMTP id af79cd13be357-915a9cb2d33mr3324652285a.21.1781017952150;
        Tue, 09 Jun 2026 08:12:32 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a411333sm2261055685a.46.2026.06.09.08.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:12:31 -0700 (PDT)
Date: Tue, 9 Jun 2026 11:12:29 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	linux-cxl@vger.kernel.org, linux-kselftest@vger.kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, osalvador@suse.de, shuah@kernel.org,
	alison.schofield@intel.com, Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com, apopple@nvidia.com
Subject: Re: [PATCH v4 4/9] mm/memory_hotplug: add
 __add_memory_driver_managed() with online_type arg
Message-ID: <aigtXQsFhJ4SB39t@gourry-fedora-PF4VCD3F>
References: <20260605211911.2160954-1-gourry@gourry.net>
 <20260605211911.2160954-5-gourry@gourry.net>
 <9361f783-5af4-4380-a901-8d330370491a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9361f783-5af4-4380-a901-8d330370491a@kernel.org>

On Tue, Jun 09, 2026 at 11:55:24AM +0200, David Hildenbrand (Arm) wrote:
> On 6/5/26 23:19, Gregory Price wrote:
> > 
> > diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> > index f059025f8f8b..d3edeb80aadb 100644
> > --- a/include/linux/memory_hotplug.h
> > +++ b/include/linux/memory_hotplug.h
> > @@ -294,6 +294,9 @@ extern int __add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
> >  extern int add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
> >  extern int add_memory_resource(int nid, struct resource *resource,
> >  			       mhp_t mhp_flags);
> > +int __add_memory_driver_managed(int nid, u64 start, u64 size,
> > +				const char *resource_name, mhp_t mhp_flags,
> > +				enum mmop online_type);
> 
> We prefer two-tab indent on second parameter line while touching code / adding
> new code.
> 
> Same applies to the other instances below.
> 

Will fix on next spin, thanks!

> 
> Apart from that (still) LGTM.
> 
> -- 
> Cheers,
> 
> David
