Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1473E1688
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 22:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783635781; cv=none; b=dVhbwhBh+ldYXgwLs3eEiPQu/gmZAF1Cc6VLp6EprSSHLtId/90IeiBbh4Hcw0u65o9+w9NzKvUMoVssV3wcUdPB27/4hYvS1gsuE+XTxG5LqbVAcQSsJR+MAu0sI/bNynraT64YoXa937FuUm/a6+XDlTr6QB8+o9kjqIvrYuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783635781; c=relaxed/simple;
	bh=F9KJPRgK4L705MdJhF7jSetuwwe9QE17mcbAei3OvSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1W267T535pVt93+dstW91OnZaPskeEO0WI4opwz9jJXZFMJI5ZPPuEZ4PyyWvawR9tm2cRIm+Bl0n7APjkm8o95tSPMMlzdtxKkv3GmCq6NicLLZ2cXIyhNxCIi0BW8CywRXwmBS3oPYkQalhCmE8GRvF/ccbILJeaN2nncDno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Ym/nNC7x; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Ym/nNC7x"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c2149571dso2171811cf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 15:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783635777; x=1784240577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b50SGMSOIyssQj3plHocLLhkQW1pcBLVRqoMkWAD4k0=;
        b=Ym/nNC7xnOytLC7XYyyXeQU1Qcymqj/RUWB/43ngPmgvjZw4FNhcDHqLezVw2aGa8v
         4WL7EprYsWTvV4V7rm6PvWfLm0G/exjsygMismS/4OLDUXNktcx6xrWV3OukhQHD/VLB
         ezMJfkNYJgNMSliSyaxaOvOSb6MkSFhA7oRMBWos1WvWBbhV4nwI1twXqGW7LJsSvout
         2S64GC9e29rsLWS6Mp5O3FKkE8RcOLUokVAIBF05pUn1/UJI+faAHjA0P3WHf7C3XIZI
         4tsidaWo3GfzwRFJIqod085JOQy9OoqxyL5+iiKNvzJzuMyIvGINZd6+5+1ToDlABa4P
         0mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783635777; x=1784240577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b50SGMSOIyssQj3plHocLLhkQW1pcBLVRqoMkWAD4k0=;
        b=Dx95uJVbps44YiWEK/yXh4F8aS2SYScoRWdd+5MJksgTyDRXJXtCVZMHENpx3IPAha
         8UonYIx5PcNLZvw6adPuK3iJhtEP7riWbrB2BsOqf2ForBclufx9UTpM53rV69EpWdvE
         yj28zq/7GGOxoLzJcLBUHlobHZJSIOIbPrjKze+TOFMZZw0D7Jn/yj1Cj4ON+qmuVgtq
         Au+tll6JPl/feFgVf9t/WvL4sl/PeXyktw1BRsthPcti+xrdM5JYnMoK2ooQ6CX8ymvY
         84pj095vR/AvDzWRcxWXOvTE75AtpBucuisp1xBX5zo8/eRbEC/yEQ3oqBz4dPI1qITE
         kIrw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5YjM59BplBzSaIm6t9zPCkQuH5p+cT9JjlJl8W5zF2H/MXEe8F+gYbHS135R8EXy+p4EhGegaptefKr9hziQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsT4bT/jq67uIAMUHTh3pyFoX8Az/iZL/iisD6ySJLZtQCchby
	Mz6a6AiWW91Zvy8TOKuUEOyX7xw4dbKpIqlX5JoXleUSx+EaxcjQ66C46YgbViqT3W4=
X-Gm-Gg: AfdE7cmSBHEIX7NUy3lFj5jBa+3bbWXO2H+vNtyG6LgON8052qmf2WILHX8NMu5get+
	IR3fb2e1eMhG+aDDKiBvbQnl9cWM9C2f7BaeUXBLZKamLhqqulBNYHpG3K8bCBDwzDGiLPIMPc6
	Eh+GhINxEpsPjap4SeV0IdjOWLh7RsLEgqX/wCF/ysKJ4y+fEzs2TZCPyYrwy41Jusz1CQ/SdmE
	V7PZAoY140sVyFgisUr/+lL8cHKzI+Sqn0CTXqh5z6wfUNZeE6zo+l0LO0dWtYgqqAwrgLLVMC2
	A1iSr8Z2S2pOJKJtOyhGIvNUe/5KomFuaxeluMrP0+SvJ2FoGB9JNoo6D00/uHo5IMW324Uwo1w
	/6hlCenbTdA7vcCCJnl5wPcVwLaLiT8GGAnYCDEeTYY+YKCvfKEeuNc7lpz0thtl0ef+9Nj9Ml5
	jvwhZFcG5d290QPq1BfbECVld0yqNy5l8LuuWQvv2a5rPbLSHFR2xWCZg51AwkKZZvDb1m
X-Received: by 2002:ac8:5a02:0:b0:51a:8c97:fb91 with SMTP id d75a77b69052e-51c8b4bac92mr100050501cf.58.1783635777304;
        Thu, 09 Jul 2026 15:22:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caace31a4sm4283401cf.12.2026.07.09.15.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 15:22:56 -0700 (PDT)
Date: Thu, 9 Jul 2026 18:22:51 -0400
From: Gregory Price <gourry@gourry.net>
To: Dave Jiang <dave.jiang@intel.com>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 09/10] dax/kmem: add sysfs interface for atomic
 whole-device hotplug
Message-ID: <alAfOxnnYQxPW8DO@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-10-gourry@gourry.net>
 <6fd50351-93e0-4d65-960f-53dee655a786@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fd50351-93e0-4d65-960f-53dee655a786@intel.com>

On Thu, Jul 09, 2026 at 03:14:26PM -0700, Dave Jiang wrote:
> > diff --git a/Documentation/ABI/testing/sysfs-bus-dax b/Documentation/ABI/testing/sysfs-bus-dax
> > index b34266bfae49..2dcad1e9dad0 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-dax
> > +++ b/Documentation/ABI/testing/sysfs-bus-dax
> > @@ -151,3 +151,29 @@ Description:
> >  		memmap_on_memory parameter for memory_hotplug. This is
> >  		typically set on the kernel command line -
> >  		memory_hotplug.memmap_on_memory set to 'true' or 'force'."
> > +
> > +What:		/sys/bus/dax/devices/daxX.Y/state
> > +Date:		June, 2026
> > +KernelVersion:	v6.21
> 
> Kernel version a bit old :)
> 
> DJ
> 

It has been a hot second since i started this n_n;;;;

~Gregory
