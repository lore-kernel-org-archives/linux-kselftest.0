Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E643C109C
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 06:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782369836; cv=none; b=RDljdXdn3t0cKVypvpYAScxADuYkc2KffMrAU1qwGQjjyeq5y0hNggMn6MWaERSRyKv8xFMjHguzvWqJIySipUxcoR3p05zVzYNRIzXeje94LPYRC/rdILEtGePYsx4JKU+bypvZzT8hKDnbGo7RgRjrN50TSe6na1FSA5hzgmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782369836; c=relaxed/simple;
	bh=J3ogWlHgltCmMWC539Oq83gosIFEq131LmU2pKtUrtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQ2fhk/ZXCl9/DpRmB6H2E/wvG7pgcuVewWxUSVqL5Uv7+HCgPAKFfqljnjat/N+zLiB8xsaGl124swcB2AzNkyEMcmoNIepFO4sQsI0WIJlwUdXfNTVmJJhm1w/wPrQT4D7Yhf40gaxhk7Fn/dL0ZE1sAZjdOyzkeS5J16wHjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ppNCiiEh; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ppNCiiEh"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-519ddebce3dso16850891cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 23:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782369834; x=1782974634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAbcZ3NxbmsxcgeRZOVz8olu265ZXR9ZINnNyOlf82k=;
        b=ppNCiiEhdCyF124WItgZi302Xrv8VaYfoWT22ULNSNTSg8o5NnPcwA+GwkNSCr8mMq
         gFOmBAq5Spp193FiDc7hjQ5P3RglzvMfa3iVSQIfQnfvGSk9wh8/frHUn6Q07KQzJpbm
         BEZlW+zdpunju+UM1dRLS8qhSIwZOf9DuvO2/smA7cJ+LzgAHhuPQWuUBkMMIJnIgE81
         5Z5Ix5ddIfyTjKRuZ7QRDujd4yhf6IkFk+fBtXdFSO3UUo0uG5cVf3npen8Tg1mxmB5A
         m72o6NMvbylti6d4GePJ18RGsBHjrY2G6bOdjrI1jejek+o55mRCJ4PY+3NQX3NAjicm
         13+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782369834; x=1782974634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAbcZ3NxbmsxcgeRZOVz8olu265ZXR9ZINnNyOlf82k=;
        b=JpaDC4gD080Ogj1ZQQ9YS9ia1lClKD1PqQsyH9/Go6KbakGlk1oY/oVZrKqZ4lc+Ff
         O8dhB2ppHL95C0BDLMTRAo6ibRwLG5GPCfyobmMraWjvNGaLw3AXZygID9Kf6un6Rt3m
         2b7zty8uLCHSuqtdFTeuDuUslRq/bh6kfOTTHJhSK43WTvK0tL/elqnJCfSuqlwF3E2L
         0SHODkyPIO2shS+N+vO3Yii/Lyt3GccNPDkHGIT97Mlr4zGsnKGur0HWwmbVDMR9O/mT
         sinYXz9v23Y/I2vslhaRg+Qg0pJ4d6Dze3rrv+AZP+mbazEhHkI0C7opZiC23lnTn+8o
         nNDw==
X-Forwarded-Encrypted: i=1; AFNElJ/nwSIqjzAuH7oONltxwb1jYHfP5d4EMUyywxZ+rkqpsEOFS8THaU/6V/IFXOJtopPXE68briETbtlqM2RRO7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIfJ5ZRImtPTSwBqFa+zhQvPz2bulyCjV0V/JhX30VXTopecO2
	yW9nL1ZETAbOItYReazrdnYicPMILKx+h35/s2uFaMqk1UG3ugtsHvqDWKYy1k/qoJM=
X-Gm-Gg: AfdE7cngGmOn36VabZhubpMGd6szPXpSVbJwIgKzyf90LCDH3DJQ3OQQcZBABH8ux5m
	zxIOrSi8eB2XOl4VKah2LC7ccpl9g9dz3vuBM7r7c8PG3v3+lIGul1a8Sh6KYBmQv4vK+uXSHhQ
	Bap6c3Z3SDNZ3IXREKeorLWISNKdTKkFt9oo8yKOcMnrpMCnlSqoWiwDNwu7YL7qpCFAYE69/ic
	0rFRPwPRkvI0xQuHpvj2DN93jIGzsCPsK4nsyeMJMzuiOKA7smxg3Hhx5Rdo9P3VLkQA/mf2RGg
	g39Nw5chZeHNOQV9YPXi8NiCpYyFGuEpdyjFQXhdYq7VhDhuqBAcdqnBdojCczSguTIdAP9S+dd
	fG0l4GAikn+JRFV2LW4NZAWWjlZG6QCiiMgB/t3J8zpNGhSscpwkHfwO/mnR8wV6Rv8j6cYu+xI
	zeN+8PVa5GfAIPdFwNjCAFMR//KHAOx2moChoJrIvmksXGB0wEDcfPGdfCaSX8kiqhchbu
X-Received: by 2002:ac8:5f85:0:b0:517:83e5:7859 with SMTP id d75a77b69052e-51a72a8d81fmr15082801cf.53.1782369833788;
        Wed, 24 Jun 2026 23:43:53 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f015e50sm171495166d6.6.2026.06.24.23.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 23:43:53 -0700 (PDT)
Date: Thu, 25 Jun 2026 02:43:48 -0400
From: Gregory Price <gourry@gourry.net>
To: Hannes Reinecke <hare@suse.de>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com, ira.weiny@intel.com,
	apopple@nvidia.com
Subject: Re: [PATCH v5 8/9] dax/kmem: add sysfs interface for atomic
 whole-device hotplug
Message-ID: <ajzOJPgV1acrUfr4@gourry-fedora-PF4VCD3F>
References: <20260624145744.3532049-1-gourry@gourry.net>
 <20260624145744.3532049-9-gourry@gourry.net>
 <8e42587a-d614-4259-ae6b-5bca1479b425@suse.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e42587a-d614-4259-ae6b-5bca1479b425@suse.de>

>
> Why do we need to treat the 'unbind' call as a given thing?
> If we know that we cannot handle online memory during unbind,
> can't we just disallow unbind in that case?

No.  Unbind is a violent operation - unbinds cannot fail, and a
straight, uncoordinated unbind is essentially a `--force` flag:
the admin accepts the risks.

To your point, the admin either does the nice thing are they
muck up the system.

But we should still try to do something sane to defend the kernel,
in this case we should try to prevent that task from becoming
deadlocked.  The only way to do that is to leak the resources.

I'm making a small modification to this code to reinstate the
legacy behavior when "state!=UNPLUGGED".

~Gregory
