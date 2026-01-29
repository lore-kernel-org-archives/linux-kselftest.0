Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED992868B2
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 13:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769694169; cv=none; b=ncwD8oMGSyFhrhHYJDOxA0hGtqR0DJuBDp+6nJ6Se559Vje2+x+j12ma7VOmJ5mHZZS2UZx9GzfcJDVouMKXhCrgc02cUKKXx8Du+UAMTZG4q/NHacL2ZCaMHg/BnyeHHJikzdwjnVycMIcLt6rx+maiT6zCdUNejR8oZTaech0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769694169; c=relaxed/simple;
	bh=YBVpWb/wKpo5te9DXuKTTTurBJ7eElV5O2X8q6nV584=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CplRZDBjhPXOUjUF20RHYmqU+Vx+13MCg0DzDWQBc/AT/sR2yhZe5lLPemQdy44prKN22sYJFwGxi9oAgE601F7QHsIzMPtJhf9H1RJx+Ws71koi40EjiYqMveytxNAnVbWsb3A68EfAv3xIH9uaKC4jqMi3gdNV8DufbeUCwZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=bMTWVosz; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="bMTWVosz"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-503347dea84so11129031cf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 05:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1769694166; x=1770298966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GDzgMbZmK6TIECiS2445LXqg7oI2wOpfTfzYF6w3p+0=;
        b=bMTWVoszFlR7I632RUufRMqVojdaC+/4lJM+18oYWO2OEIvo+Fz3NXgLHTK2xOoRpv
         3Ok3eNEsuKSipD7jdgqRjlAqSB0cNyBjjYxpfWaJ0kO/OESfoKuEJxqioDOVOdVqzquW
         Ij8/KMc7p0hL5q6bQLHfDs0croHM2hS5qI9aHbn09GGG1cRUGt64Y3M3pAME9myasaSr
         o5Tvj8xDiqgwpMKvoQwBMukFa1Tt1hE8bJJ2xuq1T1r58WRV9/7iy6tiN6eAX4LsEVa8
         ul7lvO/7R2GTOhrIcc1r4spgOc+EMqGpMw/d3gsVefCFcnLxXPhlecRX2DvHuxeyPSgc
         6DZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769694166; x=1770298966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDzgMbZmK6TIECiS2445LXqg7oI2wOpfTfzYF6w3p+0=;
        b=sPAhSQAgHn/f+6hqGE4X66XANJXi/fL402UQmlVxr3qRMM/Hc5Dvl/Bft5HXELTnAB
         erI2qdssArJllZrYgjACC88DBR40v2jwSOGx+odbTVcFNGQJQkfo0XRTUleU2wmViaeb
         LuxwqGZ5k0gC4MkSNh2dQ6CgjiQR6aab/RHgeW8qgEC/dmEybccNgoqz1e8cQR12BiML
         DW9lxQSDCLzOiH1nGN7lrpW0Tngfb5YJf3EGsHUOhFcQoQQZSXKKBQSZKT66eIBJS9Vz
         Jb/LK78UdQE6CaQ1PkXTMhAxMEAj6bvqw5zYfLcliCoFU2ynAcF/Diu32xAsPpTZ5FO0
         smCg==
X-Forwarded-Encrypted: i=1; AJvYcCVyk/g+DCCwTWubXz621yS+STNXxcZ5Ld4Mwic9i/4gKNtnQFjiimBd36T10TeSSvqvJZMS2rqz7OA5ArzYbHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YykNlMjMT4VAa+tmsBUdU2rbz6MpJ8EsqOJCkSvJmp75+6u/5Al
	LgHVZ0N2BzDK/iZwatEbc3WjkFRbg9WzD++GjzPGUdIDWvo7W/VeJDAGMNaxsAGUltk=
X-Gm-Gg: AZuq6aIsU7ehBrqgAKnXmM8Kgv83PdFrIEXnCtKi7sT8MgUx0AT+LdKhNwxnFgxwAkE
	xgnwiymS8q/713pZPgsO27r9I9yDUN8EpkO5iu+nrlD+g90zzzpGvBwhBsbw75O62EKZimk0i2b
	ZSBLbAx3zfGAlsiAb29uXnSGCVv02CXGVs68LHLJ5ndKdAEQI+UJ3YlLsPLMI3MT36QUDBdHwGA
	fKDq+lPLQ6nt955Pt227Qk2MjFpDLQpmHM1IzRaiBgPZilG/y3cdcsGJmQhkn0G3PNJwn4DSo4q
	yM/38lJoEcVF4CmJY3IW3fKePBQIlCIgLQ/rwae0UEW6ocHyP/ywkphX7pP+pcoS31OmnWd7qaK
	5hs7aOWWoVH1oTRK8O5ZZV5XyVkqSGIRyDMjoXWAIMkr2j9aw/F5jlChpUcJFQzsGDyD3Ptwmwe
	/gSBFZBk2hwqUkgnVkGS/E7EiIaIJ1cOEjhDIUO/pl98UjWKhdSrfugJv3cJ3vIN79wlM=
X-Received: by 2002:a05:622a:15c6:b0:4ee:1563:2829 with SMTP id d75a77b69052e-5032fa1cc0fmr108491201cf.72.1769694166378;
        Thu, 29 Jan 2026 05:42:46 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d3764eb6sm37167556d6.49.2026.01.29.05.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 05:42:45 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vlSIH-00000009jxt-1Mph;
	Thu, 29 Jan 2026 09:42:45 -0400
Date: Thu, 29 Jan 2026 09:42:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Quentin Perret <qperret@google.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Alexey Kardashevskiy <aik@amd.com>, cgroups@vger.kernel.org,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org,
	akpm@linux-foundation.org, binbin.wu@linux.intel.com, bp@alien8.de,
	brauner@kernel.org, chao.p.peng@intel.com, chenhuacai@kernel.org,
	corbet@lwn.net, dave.hansen@intel.com, dave.hansen@linux.intel.com,
	david@redhat.com, dmatlack@google.com, erdemaktas@google.com,
	fan.du@intel.com, fvdl@google.com, haibo1.xu@intel.com,
	hannes@cmpxchg.org, hch@infradead.org, hpa@zytor.com,
	hughd@google.com, ira.weiny@intel.com, isaku.yamahata@intel.com,
	jack@suse.cz, james.morse@arm.com, jarkko@kernel.org,
	jgowans@amazon.com, jhubbard@nvidia.com, jroedel@suse.de,
	jthoughton@google.com, jun.miao@intel.com, kai.huang@intel.com,
	keirf@google.com, kent.overstreet@linux.dev,
	liam.merwick@oracle.com, maciej.wieczor-retman@intel.com,
	mail@maciej.szmigiero.name, maobibo@loongson.cn,
	mathieu.desnoyers@efficios.com, maz@kernel.org, mhiramat@kernel.org,
	mhocko@kernel.org, mic@digikod.net, michael.roth@amd.com,
	mingo@redhat.com, mlevitsk@redhat.com, mpe@ellerman.id.au,
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es,
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com,
	paul.walmsley@sifive.com, pbonzini@redhat.com, peterx@redhat.com,
	pgonda@google.com, prsampat@amd.com, pvorel@suse.cz,
	richard.weiyang@gmail.com, rick.p.edgecombe@intel.com,
	rientjes@google.com, rostedt@goodmis.org, roypat@amazon.co.uk,
	rppt@kernel.org, shakeel.butt@linux.dev, shuah@kernel.org,
	steven.price@arm.com, steven.sistare@oracle.com,
	suzuki.poulose@arm.com, tabba@google.com, tglx@linutronix.de,
	thomas.lendacky@amd.com, vannapurve@google.com, vbabka@suse.cz,
	viro@zeniv.linux.org.uk, vkuznets@redhat.com, wei.w.wang@intel.com,
	will@kernel.org, willy@infradead.org, wyihan@google.com,
	xiaoyao.li@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com,
	yuzenghui@huawei.com, zhiquan1.li@intel.com
Subject: Re: [RFC PATCH v1 05/37] KVM: guest_memfd: Wire up
 kvm_get_memory_attributes() to per-gmem attributes
Message-ID: <20260129134245.GD2307128@ziepe.ca>
References: <cover.1760731772.git.ackerleytng@google.com>
 <071a3c6603809186e914fe5fed939edee4e11988.1760731772.git.ackerleytng@google.com>
 <07836b1d-d0d8-40f2-8f7b-7805beca31d0@amd.com>
 <CAEvNRgEuez=JbArRf2SApLAL0usv5-Q6q=nBPOFMHrHGaKAtMw@mail.gmail.com>
 <20260129003753.GZ1641016@ziepe.ca>
 <aXqx3_eE0rNh6nP0@google.com>
 <20260129011618.GA2307128@ziepe.ca>
 <i22yykvttpc2e4expluuzucczqnetdnpee2wx2fzqwg7cnt45x@ovx7e7hok5iz>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i22yykvttpc2e4expluuzucczqnetdnpee2wx2fzqwg7cnt45x@ovx7e7hok5iz>

On Thu, Jan 29, 2026 at 11:10:12AM +0000, Quentin Perret wrote:

> A not-fully-thought-through-and-possibly-ridiculous idea that crossed
> my mind some time ago was to make KVM itself a proper dmabuf
> importer. 

AFAIK this is already the plan. Since Intel cannot tolerate having the
private MMIO mapped into a VMA *at all* there is no other choice.

Since Intel has to build it it I figured everyone would want to use it
because it is probably going to be much faster than reading VMAs.

Especially in the modern world of MMIO BARs in the 512GB range.

> You'd essentially see a guest as a 'device' (probably with an
> actual struct dev representing it), and the stage-2 MMU in front of it
> as its IOMMU. That could potentially allow KVM to implement dma_map_ops
> for that guest 'device' by mapping/unmapping pages into its stage-2 and
> such. 

The plan isn't something so wild..

https://github.com/jgunthorpe/linux/commits/dmabuf_map_type/

The "Physical Address List" mapping type will let KVM just get a
normal phys_addr_t list and do its normal stuff with it. No need for
hacky DMA API things.

Probably what will be hard for KVM is that it gets the entire 512GB in
one shot and will have to chop it up to install the whole thing into
the PTE sizes available in the S2. I don't think it even has logic
like that right now??

> It gets really funny when a CoCo guest decides to share back a subset of
> that dmabuf with the host, and I'm still wrapping my head around how
> we'd make that work, but at this point I'm ready to be told how all the
> above already doesn't work and that I should go back to the peanut
> gallery :-)

Oh, I don't actually know how that ends up working but I suppose it
could be meaningfully done :\

Jason
