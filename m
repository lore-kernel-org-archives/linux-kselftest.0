Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A62C3E5EDB
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 22:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784847534; cv=none; b=EqkPBUXv5FFUMqKB0JjSjii82MJJJhxTk6ANMVcHnR/L30uoI//uA6iFqB/0G4rc4ZIl1tzdQvoImafzC+2zQAGNeFILh77fdtPbYFo2wGJAPPs+rICjFEsaKEQVEIw2NQsWFB0di4R9I8pPm0c6IVvUFfqWtWF7cawbZfAdaps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784847534; c=relaxed/simple;
	bh=yVe6z1RcUZaY3Sf56/QfYhtCxfjWa8zL2up9uH95h30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ij2mG6c9aq9NbJQNmELHTX/mGM+vlESsQF9VOw5Y5iX4nwzQTJpRkftTHykGb2PhujEmsJrghSBGAlFx1OSA+4jEeobcpTIczqxifgr81O7Xcpj5p+7WuxkbkTPVwJPuCQ/r95VQu/H65pmWzvDUUkPEqQJdwP80tuV4uIj0Hks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mn4LlFnP; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mn4LlFnP"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccdf36f63dso4865ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 15:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784847531; x=1785452331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zj8yGGu0ZvQspv+dm8spEGL6AmJp5gd8JQ+4SasQ24M=;
        b=mn4LlFnPZHnhq6bgD26muuFAuTY3LEmaHjdmqYiV/FOtSRLYtcs/IryJ8ya5My0fHX
         DjwNelgeHWvdrC4iZSQvHMhwQjSOspc0MhoZ9uuia8dU3h9HozAIlHkScfQCljztzp39
         KoX0g7l/df5N/BMI/6WjwsVmI6c18nDM+N7Iwk/rHFXKoiZh5nVm3XIRg1WJOfAUQ+4V
         xfEGYOfo/wqmxDgJDXTWS//xj+3YdcnRqjLm77AgBw+utfliuI1fUBW0BMPcupzfKG2W
         O+Z3gUNErYx3rWxI16VN/F2xsD7i69tFm/Uwk2ERnWPHBYKHsMSuTFXDUtkkb9ja0KJr
         bMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784847531; x=1785452331;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zj8yGGu0ZvQspv+dm8spEGL6AmJp5gd8JQ+4SasQ24M=;
        b=P03yfS5AclNIv0ZPxeHYlsXjel7eXOtmhdoUK96czgRA1fnUT0qQtavd8OwI4pLf9M
         DtAGqbj3Ar7/7+6PX1PyovpSSHCLZYPMwAzD09Zd7stJuuSqG0KSheeN53WnzpiNURKi
         loVmdIAkcCgsWPPQy/gdBgU4PLxwTefYJJQro2umU6aOIwRQPgV5Qul+La49uMgwX1Gw
         vfxYNjEFBhc07sxPZ5CuKN1aYqW9DEMO4Lac5ebqnSgGYLVFe8qPwCh//gb8lLMq1s4j
         s2pwkevpEkCW7vOuXs0YEZVMH1c/j8C8v1hwdmJbNytfaUqRIbmeMZG30f+lWM+EV89d
         PwHw==
X-Forwarded-Encrypted: i=1; AHgh+RqhbFRW/7EXSqaDyZEG08ckfdYG0VETg5SzUd7s0GgVGKLPoms3awprHZdKxr9Tt5T4Zefm/QHETgZd7DX7XBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjMocTLdNYHZ/95aDTamUXlx4Vb+mWN0yHq3NEH3Qo1WOfdsEG
	GWb6vwMMU7uXLbmpOT3zKpBfvNync6Js5Xh9hE5JlbN4XIT/SOBz8QiXRQSg18odYA==
X-Gm-Gg: AR+sD11BiBU5cbQoHJK0lARiLjgkNnuO9e6XJLtR2kADp61P/Nf+f7r3cJ7SwlmEhP5
	gPNhXDJgPw6jpCh1dxw7Kxj53PaNiOSsqq8VwnclxcicBe2MiDXkwLZsqkaUJOCWcL7oliYarL+
	cR/aY1bHveJrgiKe96RAHyz1cWLGXCD81aWtEktu7nQqumbZz/f3OVFDUvczt5+qUJEVYk40gLf
	kFXccXsas8kvOsbDDq2cHBqat/5PT1PQp86Nd6zBg3hqf3YQPJzJb1s3uxZPbSIkKWiuGpjyiE0
	ZXlSdDIxow6m4NsnfyMw74ezYZN+Ofxq6tWz/vTd8dHC7qBXysRrce0OzepUq4WTMPr+oWPyRPN
	qAeFVI7zouuJUPHngiQhrInAnF+uFdvLhxc71etXelkOZT3W4BAgq1NV3s9vTXMjNHdzwLKZJNW
	7SVfvfhAhLF+UXSvlb9XFz/1LxfS9TSp5E1n9J6q4=
X-Received: by 2002:a17:902:d4c6:b0:2c9:a222:47e0 with SMTP id d9443c01a7336-2cfc049d8efmr1917685ad.20.1784847530903;
        Thu, 23 Jul 2026 15:58:50 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17236924sm3686474b3a.7.2026.07.23.15.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 15:58:50 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:58:45 -0700
From: Vipin Sharma <vipinsh@google.com>
To: alex@shazbot.org, rppt@kernel.org, pasha.tatashin@soleen.com, 
	pratyush@kernel.org
Cc: ajayachandra@nvidia.com, amastro@fb.com, ankita@nvidia.com, 
	apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, 
	corbet@lwn.net, dmatlack@google.com, graf@amazon.com, 
	jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, jrhilke@google.com, 
	julianr@linux.ibm.com, kees@kernel.org, kevin.tian@intel.com, leon@kernel.org, 
	leonro@nvidia.com, lukas@wunner.de, mattev@meta.com, michal.winiarski@intel.com, 
	parav@nvidia.com, praan@google.com, rananta@google.com, rientjes@google.com, 
	rodrigo.vivi@intel.com, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 00/20] vfio/pci: Base Live Update support for VFIO
Message-ID: <20260723215749.GC260824.vipinsh@google.com>
References: <20260714151505.3466855-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714151505.3466855-1-vipinsh@google.com>

On Tue, Jul 14, 2026 at 08:14:45AM -0700, Vipin Sharma wrote:
> Hello,
> 
> This series can be found on Github:
> 
>   https://github.com/shvipin/linux vfio/liveupdate/v5
> 
> This series provides the base support to enable Live Update feature for
> VFIO PCI devices using the Live Update Orchestrator (LUO) and Kexec
> Handover (KHO).
> 

Hi Alex, Pasha, Mike, and Pratyush,

I'd like to discuss which maintainer tree should take the VFIO Live
Update series.

For context on related efforts:

  - PCI Live Update is targeting the Live Update tree (maintained by
    Pasha, Mike, and Pratyush, with David Matlack maintaining the
    PCI-specific code).
    https://lore.kernel.org/linux-pci/20260710212616.1351130-2-dmatlack@google.com/

  - IOMMU Live Update is planned to go through the IOMMU tree.
    https://lore.kernel.org/linux-iommu/20260614233728.2212104-3-skhawaja@google.com/

Given these different approaches, what is your preference for routing
the VFIO Live Update code?

Thanks
Vipin Sharma

