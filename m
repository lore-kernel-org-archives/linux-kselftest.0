Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566259;
	b=3x/EeB4Y39o6GgQscbAkNngy+xu3UEXvna1W2to8A4r2m17LZ9w0XI+O4nm499EiDZAp
	 ANb4LqvMIaGreSjolVkkjozVKN3YY4WFAiUCd5ZIsyrpwK7gFbAZKiEEzFfogW/vee7xi
	 n3137mpMN0Jy3g6PiK7TRloBnHM/9LAIr2WQpTDhKZiHcLm3sWvpp1wb3osQOj9oBgF7c
	 H2NqpQ4LbHIqWHeu6YgxqP90A8iNTXUcTU5GLn2AWUAkb/pB2fPPHKXvwh2SdXSN83ynn
	 O4Zr4v5MX0s5NmIJMx+hItc12WR6cGcVDCzjmDS7oUGplP7SpAt4JyiArqyp0UYL+uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YMO/Q4LHoS6IxvSYVAkwFpWA6bWqlpOH+BNCvhBFP1g=;
	b=VeACCAw0aulPoRUHNbnWZuj4QMa6nysZbFiIVzhFVOELt3lX6WSGDaCol6D1Ps7hUrHF
	 2IW4OP7ajHK9vdvFAOG+QfKrsZjzDhwU2b9R9fkb+uA/2jC/uTnNkcP01/LZ+muh7CgCu
	 gORmoGXIVXUrCtbF5p2CZdhRR3Fbj2nwTSMphgPq9wU4tPku2Swp5Cf40iyhlz5bLzg1t
	 JOF4tfAHcSNTdpB0CnTe7sI5OqsHNRsLySvTZipNDOeyo4SJ/2HcXa3MhueebFuhwvQRf
	 iNC1IW5N3Mv3OkgthlUOIaEoTa8Fnl7aMzLjB2e6CQCXYjVwCsEn8rUpE+VrHNaAgjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nvA4xsJY;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4687C606A329
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 00:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4687C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nvA4xsJY
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f048bc09d7so242595ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 16:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795566258; x=1796171058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YMO/Q4LHoS6IxvSYVAkwFpWA6bWqlpOH+BNCvhBFP1g=;
        b=nvA4xsJYbyjlVUxR+uk4yXS/M0iXumDNQvEFcjik+fzfX0hxCUG8igTP+aEBUQKhWU
         01rPlsYZxijr1nIFh0HnhmIqvQDte+9GB9vgwkcgoDmEZlgpGqs5n719qFTdxZxpqmHD
         smlvTgzd2MsCxkh4iC3Pj3xgW0A8Vxl/d+etRiBo7TyLfUmGaEDmFSkc1zKYBT1NH1su
         QsnQAeJzEmHi0cQJ30I2MOkUNe8XLlufgoLeZ9DETN2Ob5Y/qQNwZctS+bf7T52hpQPK
         WciL243GxjFlJ67fODnf4z60/dH9j68n9GubZQYbMlxniUpHCzE0u2iUedJtX7wAGNLR
         a8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795566258; x=1796171058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMO/Q4LHoS6IxvSYVAkwFpWA6bWqlpOH+BNCvhBFP1g=;
        b=JhR7Ua+v4GZ0qlNYoIiT4DQLsApKjw5Xk10hR3+Rr7aXJ+xEzPsYRJuF9eYqjg7XLI
         C8VgJHU7EGx5ve/jdz3ZJWPDJSMCndbqwerAEfhVNVFEBPwnbUpejznh5jKIHHrGFOJN
         Y6+7bTiQLGOxi0q1dH77IOdE/qbXDSBxyu18SlPC0AA5w2Ne6vKhqsULqt+LwPodoR0p
         xMHvG47AMkc8jed20aOdXwk5AS0httiYvjlz3yQ2wCCnh7ioG0tvGWH86gqnA3Hy/MBs
         hjO0dF/wenCm88dd7c664yNgTTvmx1hwseJF2IxLk3LOncM71bUhhA+Y/mmlUPMxnF/X
         OsLg==
X-Forwarded-Encrypted: i=1; AL+hErFyKZwS3Lvx2Hs8HmmEA+grsMwJgRwEbwhhpna10lhYg1s+SK8zjkwdfPulQtHhUH9LK2JlgBItVkuo/JsPhgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BJqsp+9u1C3vw4akHgSNSrC1iOhRfPt8DggCt8+nU8+fEHzFT
	A68MuYR3bTUeczYIGwzMpLiFyCzPTAB4defvGyJw1TO5RgE851F5GwWunHCL+rlQ/Q==
X-Gm-Gg: AZFdTZfBhKjdc/XQaxU49p4ZGQrUL68MmYS/IlB5GokaZN2ZKE/EKLfRKlvSDzr+aUm
	ow1vAd2Gvnz/TwmDtVQCCmR34gXlwHJ1fgD7SpB426zr93GKtbLBiiUPw5zr7rfP2WGy6APClc2
	WFyvUNTLt1cVLgiD7Y0q8AUrbxjy/Z/gBi+5reSL7ETCwKO/lFlx2q68qpEnjzCVVxRdpZt18L8
	X8gMGLQvW63d3bXgU0NA9zXAyfmthY9U9fT8aRx4PLN6Xn1/BCxJx0/cu3XIeXYFGu+4SzuHVN2
	Iy6W6dd5Ps7pzR2DGBJnKca49gsfKBmhqJceOQTpzifZsWOQbSWDfd5f7lW4/jdYIyDZzl6Is4H
	9NtZJYyBSpciuphQvx0sdUnjWvWafAzSqEuJlSs3FsT5AZOBZFjoBf88EfSpIM+V4Z035hM6Jvc
	aty/mLQjOY0ci527dA+8p380G4TeE+lxIF75bB8CPnUtR+/Y7Uf7fl6meln2pVFKoxqIiSpjcBL
	CgXRZZE1XmuMbDKZ5xh/XKotx2k+ZQkbgzljPciqca+U/hfMjJBHn+i+vdioINitI1v8zsh5HQf
	+K+TPOzOGuZ6zhf4CdS0vTMG6UbuMm5bbcXY3rDIGmqdppOigGqfpgQH4QMDfoK/p936comPw6S
	RYfvqRNv4okaj
X-Received: by 2002:a17:902:e950:b0:2d5:c090:3810 with SMTP id d9443c01a7336-2f06242bd42mr16475105ad.2.1795566257244;
        Tue, 24 Nov 2026 16:24:17 -0800 (PST)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cff4c1asm7632022a12.15.2026.11.24.16.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:24:16 -0800 (PST)
Date: Tue, 24 Nov 2026 16:24:12 -0800
From: Vipin Sharma <vipinsh@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, kevin.tian@intel.com, 
	leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, mattev@meta.com, 
	michal.winiarski@intel.com, parav@nvidia.com, pasha.tatashin@soleen.com, praan@google.com, 
	pratyush@kernel.org, rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 12/27] vfio: Enforce preserved devices are retrieved
 via LIVEUPDATE_SESSION_RETRIEVE_FD
Message-ID: <20261125002302.GC3545683.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-13-vipinsh@google.com>
 <DMZLVV5YW6GW.1HMW8L8NIQ1XR@google.com>
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
In-Reply-To: <DMZLVV5YW6GW.1HMW8L8NIQ1XR@google.com>

On Thu, Nov 19, 2026 at 04:19:34PM -0800, David Matlack wrote:
> On Mon Nov 2, 2026 at 7:36 AM PST, Vipin Sharma wrote:
> > diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> > index 12557d45dfee..e6ca4c3fda06 100644
> > --- a/drivers/vfio/vfio.h
> > +++ b/drivers/vfio/vfio.h
> > @@ -11,6 +11,7 @@
> >  #include <linux/cdev.h>
> >  #include <linux/module.h>
> >  #include <linux/vfio.h>
> > +#include <linux/pci.h>
> >  
> >  struct iommufd_ctx;
> >  struct iommu_group;
> > @@ -446,4 +447,21 @@ static inline void vfio_device_debugfs_init(struct vfio_device *vdev) { }
> >  static inline void vfio_device_debugfs_exit(struct vfio_device *vdev) { }
> >  #endif /* CONFIG_VFIO_DEBUGFS */
> >  
> > +#ifdef CONFIG_VFIO_PCI_LIVEUPDATE
> > +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_device *device)
> > +{
> > +	struct device *d = device->dev;
> > +
> > +	if (dev_is_pci(d))
> > +		return pci_liveupdate_is_incoming(to_pci_dev(d));
> > +
> > +	return false;
> > +}
> > +#else
> > +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_device *device)
> > +{
> > +	return false;
> > +}
> > +#endif /* CONFIG_VFIO_PCI_LIVEUPDATE */
> 
> No need for the ifdef here and 2 definitions here. If
> CONFIG_PCI_LIVEUPDATE is not enabled then the compiler should be able to
> optimize vfio_liveupdate_incoming_is_preserved() to false.

Okay, I will remove it.
