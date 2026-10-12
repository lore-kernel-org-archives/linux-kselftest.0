Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981E348FF9E
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816381; cv=none; b=ckCfHYe5sbn3waV+JLWgUx9R7+qBY6UJZLv7NwHSULb4qfjhulETu07zorvOI/5FrDOZgViDce6XoWnmd/IQOeqR+p7oPDrdhqTiLkKYLg0lFnehLjO6F1LySTTxcir+N+iPobzOYx2HV2UOSqb8VNpuoMyOQosOvolevp6ZF4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816381; c=relaxed/simple;
	bh=YarLj6Tl5drs4d48GxIIPRySQhK4PE3lDvu4dKT16oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igwWgk+udOmpJPWEXTVBxzhg5VYUlrM7GDKE1GA1d3i5wls261cKJuaGtMNPUyEpHtSpLeUX2FeGkHdqYQh2rU/xOMxFv7AB4GJl1SMuFiUbafiUr/tuxK1/0XEaApQnry8ZnglSxG1eGUyuIbuA22W2QfpihsHkX7gLcfrobM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Z66BZ70G; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Z66BZ70G"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5338f65913dso22436951cf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 07:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791816378; x=1792421178; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kVDh4BcUbgvIW1O8+CoyCzwwqxHQNia8D9+ovujPztQ=;
        b=Z66BZ70GrL+G3fRSAa++wQ031ECfO0fS51Dh7ERYYOaggt42Ne8wL05RkyY1CINEJx
         dAH4bDpFvoxbV3Nbjo3T5t/TWrmGZHrIaHJ9rcDe6CzZ9JrhHdcdLybNTy1l+a5THPKR
         S8kXtrdBlOtRke0qkwgW0ZzCpt6Wqs/1kXrxSZcTNVeiBcEKEEZvvz/TgLuQTSihrHNf
         WBCQjBquZ+J0ZmdWo4+Qm1Nuj90rzq5A1TlecjN39HHMKV8Q0WhqMj1Bjf/7FOQjpsJC
         GuPr1dSttLysga5Bo4FH5pVFcvDbUY/9aZgigWdULgd+2dTZVipw3eKr12O3MtUUSavl
         2fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816378; x=1792421178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kVDh4BcUbgvIW1O8+CoyCzwwqxHQNia8D9+ovujPztQ=;
        b=u8DZ6SKcB9JDNu0IOC0Y+dCwUDSwR7DJJQK5ZZjEKYDBh6EHAEV32Db74mqFyUCXuf
         fkdniiLD5SBQum7coRkFnK39g6HW6q3dJ0bsEU0FYGixASypXca11LSjYMZvvLt+bOl1
         ryT7DHwEiUdeql1g7jzoBLlfLIOFMwu5KZqH52WOUKTVPi4bNWDNA5L9ElkP1nXRjpYn
         wwUHkkQPBUCpUISKAgBLlonFf8VDH8GnexAPl/liWP+I/CpW56cCDTb6J21AVTwb14GS
         aRS2gPMyAq1G7frSanMrMkMvzpg5OVIC0prrkEwKO32nC8zfojfsWbUj8I8UEitVJuwt
         U/WQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/kDvbtk8FlWrap4U2z862ujjuLfI+/wUf5uNgOqQ4u/ulChrJdr5OqI+8kYLAk2JQlEVYjJQdKhtSxixYj5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIEm08s1LuHrEu6UmDjAmbDgR0gzkJnoSuNq55m19lPYlZR1Jj
	98xlGoC4QmswSph/J020+co5kJKMNmEfRlHBLKsOiIUNgM4lCJySjHkBXH87dwSOP/w=
X-Gm-Gg: AYBFou37772m5MajH64dhIhBWzzjf5Q1PMmd532kYdHn+IwWO3huS0EyHLhYm1Cxq5u
	tX4C0/oCXLjCfIovDg7fUMIFozQY4blV5XZ3oHK4kxql+ejyQC9/F5W8fvFyWH+b6vvq+X5ylv0
	fz2bdRTU1nGfZzHeB1AYZ+4okFhoS1+7ILTnSDVXBkVUNKscAAG85NkMWeeti0cctvykfRqKrzi
	nVbqS3Jyb0Be8O5CzbhDIE6qZ29i2HtNOCY3Fp4Z8SANY57qHtVKGZ/QolNHQh72lCBNTNmFo/G
	bFBMtHD7AJQDQW04/vMcIrhkhDq5ZPRkq1U1bIFOj0jT5iLm8x3d+sMuiSFqIk9szzmiE3aFG5l
	VI0D6P2WbluErQy+m+Qqgdry1t3jDL9bPEOIXeuZ8pFJb5j2Qdk6O1YCpcmwU3MKy29DFOwol3S
	QXb6DEGRMuFZc4uruRAIqPHM76XAkbiv+iqX1X6GiHquh3iCzRdud+QewNS1RHVAlxufsLVIxlA
	qAikf51AWXFIhDlqGR9k1pDyMGgGoM6oWveYkKpa0ifv23ghtU2ha7C
X-Received: by 2002:a05:622a:2487:b0:535:1134:91b with SMTP id d75a77b69052e-5359faead4bmr160454661cf.14.1791816378499;
        Mon, 12 Oct 2026 07:46:18 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535e652f3c7sm3157041cf.26.2026.10.12.07.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:46:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGHI8-00000006SW2-2nlk;
	Mon, 12 Oct 2026 11:46:16 -0300
Date: Mon, 12 Oct 2026 11:46:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [RFC PATCH 2/6] dma-buf: Add get_phys() to describe a physical
 run
Message-ID: <20261012144616.GF14213@ziepe.ca>
References: <a04f17cc-f59a-4240-81c8-29776eee3a2e@amd.com>
 <20261005132046.30025-1-griffoul@gmail.com>
 <f0077cec-10fe-400a-b229-f7434e297364@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0077cec-10fe-400a-b229-f7434e297364@amd.com>

On Mon, Oct 05, 2026 at 04:53:34PM +0200, Christian König wrote:
> > KVM gets its frames through the KVM-private guest_memfd provider
> > interface from David's series. iommufd gets them through a private
> > interface with the exporter, as it already does for vfio-pci. The new
> > version adds a small registry in iommufd for that, which replaces the
> > symbol_get() of the sample in David's series. The dma-buf is then only
> > the handle and the existing revoke.
> 
> Yeah that approach sounds totally sane to me.
> 
> We have drivers which stuff all kind of resources, not just memory,
> into a DMA-buf. That ranges from MMIO BARs to trigger FW operations
> (doorbells) over full HW blocks (ordered appends, global wave sync
> etc...) where two or more applications need to share which one is
> used.
> 
> That you then have a exporter private interface is for accessing
> this is perfectly ok.
> 
> The problem you are facing here is more that this is not limited to
> one driver/module but multiple ones and you don't want module inter
> dependencies because of the symbols.
> 
> So symbol_get() is probably the right thing to do as long as we
> don't have something like weak symbols or similar.

I don't want to keep expanding this hack in iommufd. If dmabuf is to
be used then dmabuf needs to provide a pluggable way to fill the
iommu_domain that many exporters can plug into. I don't want to
hardwire every exporter into iommufd, that makes no sense.

The existing arrangement is to motivate solving this problem
generically, not something to be expanded on.

Jason
