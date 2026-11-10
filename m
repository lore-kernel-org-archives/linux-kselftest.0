Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337339;
	b=yGQY3tUkcsyxiWDVsSpguKoVaz81DIrKkPLzC++OkOpIgPghacgsRV/c16W2VCLKA1/F
	 m7FItnE3stf0CE3XcU0eD//LnNlSl+8TMhP2JT9T30f43Q5PNEL+LpNTVFtsO4clLgBdr
	 BpRlRV/WmdZYzjZFCECrD0fvNzXZTAeNwnMxOIw1q3RaijtxML9HLQlnCRInekdolFWPi
	 nvtfXgUye2h3UauMJZvzAUo1MZ64Xk+WvTcVXQHC62v5ndIHKJtD5DGxYul/mDMsOGRJY
	 guzms/iOzAUbGjlfH5WRrq4s2UlqvY0A8FGByVI2B86D/NugIYpRgOTUoYITb8hwTpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Rc92iNBDR3TpfE1Wb0FPlqB33KW4gheFc7Efbj9D4zA=;
	b=YZYMh6USCLox2BmW8sZZvBrjT3LImDJaTVTtkll8QJ1On6uc02BcLNN+fWpzgxmdNcxg
	 xYxe4JOUq/mE42a26kZgw93OjAtS6NDMoenn/HrDQGGkKKwoZ1xKWV4e+YbRtcAouBOep
	 /N0cr2/Bv8aRPwnRa28naJEBDUkBeIay1bqLeGyq7VW8u2SeWYqqVUtvI2y4vo/tKJxxb
	 YOMVHHsZV2i++KlYPR9w2CF0ht/dLu33Xl/48TUZ6vSf5P7Gw5KZRg8Z5V6yxYLFB19Na
	 xs7NJ6LtX7lH7d859CtYbt6wjlNqRhUpPCP6YJ5mCftk0Y6SS2u4n2OfgSfQO1hqNMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qO+JZOY4;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593F1606A32D
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 19:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593F1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qO+JZOY4
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9f6a16afcso5855ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 11:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794337338; x=1794942138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rc92iNBDR3TpfE1Wb0FPlqB33KW4gheFc7Efbj9D4zA=;
        b=qO+JZOY4XThqw7+Njn/UYcPIm7ZmOo3MiW+t20KLHVibC+4UuvF6oB0AUlTA5C+Kz5
         8bfjmyokmdpWkvtsirhnzw3yZxnpal6DZh4ctcbQuikaRqogrXN0Fg5MkiFa8k3d0ZdV
         6yHbQWhuX6VDHoqmvKkSeQVgoE06RF1Rh46qLj1+0lLUGq1fvXjYSdZ/wzPg2gJdk5mk
         ri70ob/7Sp1bFE8dTCuvgv7LeNHaYdC667uwY7mMMz+afixjYSayD4a69OskUXzmcrNu
         AXpWknVWVYiL/bjDdQg7mYlZxD1abxJRY2WRtUvcVfj93a3zD+lUsfOsoLuWUOnWKoUl
         Z+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337338; x=1794942138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc92iNBDR3TpfE1Wb0FPlqB33KW4gheFc7Efbj9D4zA=;
        b=uSLmZdvsv/65dSihyYJFO86g5KXK+Tb3lZwUdDJBUTknh/cnA2DEcBEhR4p8aqcSZm
         BlWuDEvKHYz7R23LOJcRv/0gc/P3N0umYd4InzhHA0o0GTxbl81uR/9eS6C99LZHOyYK
         A5pqR/ckt/nRVU/TJ/xpPEZQW9/Dmm0MA50Bs7XoOycGM3TIgjlSicOFhXg4Iec41iG6
         SXdpe2FbhT76MsCoH0v7zIXm9lX90YWGTPfBQ/kfZVVr2E5FM+CCrsdcRDEkrki1iKjK
         FqBPtqLeKe53r7uhP62B6vJuqlIU7juOAhPcByBjYem/9Vu593q++6A1vN7GNTX7GxgR
         UCBw==
X-Forwarded-Encrypted: i=1; AL+hErHJ9HyChzquXMoZq1ok4/5zOfdgxB/O5B9LrA2EIdVT3w3pL7ZOn/AYGc9sNdiK42uhZ7WJK5dW489V5IH6A1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AxE+bmYKwlNYByfKqSjka2lvJCcqpeRY/VdOJ1Ha44e4sdHMh
	Xxk9Pgc84fYvCXGmVzdSJfwrG+WkskxfwwttCquqydCtgHWzlaTK+3TLmx4Oxg35Cg==
X-Gm-Gg: AYBFou057iOV6X+k4ZjmAc4q+Mtnn22hsfY2+EWacTydYlDBEKMURK/uwD7Yc7c7+2b
	z6XDiUrvFt58MSFF2QZSyGUIhjKyof69KWzCTnjmALuh4sCLPMrfGdl2B+h8AJrnBfE9ZCnyr6Q
	i5PiK3SGfbMhudj9pdAegrJ22Ng0DUCPtO21ChsAD+w8Fh8D0Yb9EvpQxkXwyJDGyUt7E1/rw/O
	C+j+Ofa/MxkyrZE+2J8giRUTWb/ut58AheDWOmi43gZ8G+lwuM+ybaa+qnrh7+dyjuGaXiLbKXQ
	XjshdNYXy3CbIOaFSFvucAZlE9i1u/mya4yXJIJqtzJI/74hL8GbXhnTs4jorSzuGGGuiKoWzxC
	ej/OJiIgn4hpjzYpo6eSXQiZJlxOte0Rod4eYi4Bw+4mK8RMwmRZgjWpVzFAZGiVbIoSkBY16qM
	xqdcEgL1OCMS0+WDsxLTTKrvHPlZLrBIXYGO36ltFa0sUmaNvK39Z2pnfkzVwm0ofsSbCnBwTLQ
	RL7qnlJXipX1Wy3vLEKxkgrJhVHXanh+s/oOmI60ydjrA223wKqlZNq0EI/BqkvUJaHwVI6qCWz
	giMbN21S1M+BSo+ruKYd/iiE8IAipSXZh4Zy8J1rSWBt9ItiguhqgIKYj++IvelV
X-Received: by 2002:a17:903:1b44:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2edba3e2a10mr5113665ad.15.1794337336971;
        Tue, 10 Nov 2026 11:02:16 -0800 (PST)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db31cafsm914394a91.3.2026.11.10.11.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:02:15 -0800 (PST)
Date: Tue, 10 Nov 2026 11:02:11 -0800
From: Vipin Sharma <vipinsh@google.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	dmatlack@google.com, graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, 
	jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rdunlap@infradead.org, rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, schnelle@linux.ibm.com, skhan@linuxfoundation.org, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 04/27] vfio/pci: Register a file handler with Live
 Update Orchestrator
Message-ID: <20261110185305.GC519525.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-5-vipinsh@google.com>
 <au5T7qouVfxJSDmr@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au5T7qouVfxJSDmr@google.com>

On Fri, Nov 06, 2026 at 10:29:06PM +0000, Samiullah Khawaja wrote:
> On Mon, Nov 02, 2026 at 07:36:33AM -0800, Vipin Sharma wrote:
> > Register a live update file handler for vfio-pci device files. Add stub
> > implementations of all required callbacks so that registration does not
> > fail. Register it with both live update framework and PCI subsystem.
> > 
> > This file handler will be extended in subsequent commits to enable a
> > device bound to vfio-pci to run without interruption while the host is
> > going through a kexec Live Update.
> > 
> > Put this support behind a new Kconfig VFIO_PCI_LIVEUPDATE. Initial
> > support is added for no-iommu model vfio-pci devices.
> > 
> > Co-developed-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: Vipin Sharma <vipinsh@google.com>
> > ---
> > MAINTAINERS                            |  1 +
> > drivers/vfio/pci/Kconfig               | 11 ++++
> > drivers/vfio/pci/Makefile              |  1 +
> > drivers/vfio/pci/vfio_pci.c            | 11 +++-
> > drivers/vfio/pci/vfio_pci_liveupdate.c | 75 ++++++++++++++++++++++++++
> > drivers/vfio/pci/vfio_pci_priv.h       | 14 +++++
> > include/linux/kho/abi/vfio_pci.h       | 28 ++++++++++
> > 7 files changed, 140 insertions(+), 1 deletion(-)
> > create mode 100644 drivers/vfio/pci/vfio_pci_liveupdate.c
> > create mode 100644 include/linux/kho/abi/vfio_pci.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5d1b58271989..167aa9d66ce8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -28662,6 +28662,7 @@ F:	Documentation/ABI/testing/debugfs-vfio
> > F:	Documentation/ABI/testing/sysfs-devices-vfio-dev
> > F:	Documentation/driver-api/vfio.rst
> > F:	drivers/vfio/
> > +F:	include/linux/kho/abi/vfio_pci.h
> > F:	include/linux/vfio.h
> > F:	include/linux/vfio_pci_core.h
> > F:	include/uapi/linux/vfio.h
> > diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> > index 296bf01e185e..e8285ad93a69 100644
> > --- a/drivers/vfio/pci/Kconfig
> > +++ b/drivers/vfio/pci/Kconfig
> > @@ -42,6 +42,17 @@ config VFIO_PCI_IGD
> > 	  and LPC bridge config space.
> > 
> > 	  To enable Intel IGD assignment through vfio-pci, say Y.
> > +
> > +config VFIO_PCI_LIVEUPDATE
> > +	bool "VFIO PCI support for Live Update in no-iommu mode"
> > +	depends on PCI_LIVEUPDATE && VFIO_NOIOMMU
> 
> Can we handle this dependency in code instead of doing through
> configs? Are there any build dependencies on noiommu?

I can remove it but then by itself VFIO series will enable LIVEUPDATE
irrespective of VFIO_NOIOMMU and it will just fail when someone tries to
enable it. So, kconfig looks cleaner to me.

Can your series modify this kconfig and add (VFIO_NOIOMMU ||
IOMMU_LIVEUPDATE)? Will that work for you?
