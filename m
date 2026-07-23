Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E79355055
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 23:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784847700; cv=none; b=DoaYG7zBWrnG7yKvH2ztaj9DVM4N51W4hxQ1hD6rWACp18QzMUzev2uWkjuIh0fXDI5iG38UInLQ4nDWZPQdF7Rwa6U3oS1iha37cmOG5Pdi0N77s2QRSqB247/A2feu5J39cjQ6+FHMBLNbQDGajnaDVYTsHOalpZ51T1mwpFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784847700; c=relaxed/simple;
	bh=YQmY4vjJG753/gpjkNKmDPwhu3EZ6zY1miOKlUbxQnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSJDNq+zor55cj3Ip8gO0Rm358U2H91Hr4uS6bIV+BKhHVjYLZe0t/rCpB5GAMTf02u570PbIEQdi6L+WTk4+Ga08I11mNvq7Q6Q8ruFBMwow36snFdZ/gH8bpDdoVIYbiGR7TYxrAI5r6+1A5acelq/aHFQk2KoEiLASXn3El0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s/mfXA06; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s/mfXA06"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ccdf36f63dso5555ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 16:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784847698; x=1785452498; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6FoDnuIQXevfuc8nCvkdqJumo9L7Gv87izvbO8ewc4c=;
        b=s/mfXA06twbXNFjVcPaD3yldwp/7N024tvIxayWl47Fkgl84v2WbyTHBVNDvOAJrEF
         pI7w8Ve+D7yw+l9ARQ5VuQpiJMjxM55IaQ/G5v6QEIigmrGrqgyiNouhNXMTE/LXeq8r
         zVlO3xLB76KikNjmUF6wryzYKFcoBdwiS+rsUSBdHrQrFMXFsATDvjS6zaP4FlsN+JEV
         SZQESqHwo6HXw+Eb2E3Yk+up4l5eeer09BjIGrhioRIlp3W9YZewQDr8rjWlva8aBUe9
         SUS/s5TtTTYFFYoOoIxnUQeDX6gehp8Cigx2sl1pP4khpv8iu8BDlMTGTkkaKFJV/QO+
         0YyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784847698; x=1785452498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6FoDnuIQXevfuc8nCvkdqJumo9L7Gv87izvbO8ewc4c=;
        b=oz4HrbkbYQFDAHGcRebVWzX/4syDLjoSprGXfpRzqBilVBf5e76h0JuSm/HDOLHV3Y
         T4JO1eSz6JwhmH+HI7Ypy5FbmvJcqkRgeAd7f58FXi0jGNPPXbJIh29K1OT9jY69wbDn
         zYAqxRz/fr36b71RXp5jI9oTuGOHOsAqCajcjqJhD7bilTjXSQ+Usw442kGjvomwMRDG
         eMMXTyZ1wrBtmetza6H4ufnSRK+pX2HLP5cbL9U1Tge0XUAudwQXg+8KnlLWv8qo+2XA
         KgLwPXQqYLB4bclTyTD++uv4yEzvYoVC/GOMoFdtSyBA4mpqpfpu5r+zA5sHjzf1VnKC
         ZouQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqd6zhfzSOxhCfTHTNd9kENjIxMPPADiIvQQJaJbWLEU79kJs81rx1q76Ddg4jXP9KxbspXCrdi08bJLiV3RJA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw58Fo9lRUzK4D+MQKIrvRKglOMHEblbJzjDBKBf2maySbxcuJJ
	NS6RYM6KaQw4he+BLFx1L6hkExXd+FE5XF78Ow1pLJKCEkaaVE2OJwyjbQ/Jx+E8bg==
X-Gm-Gg: AR+sD108risN10blXeFVjjO3dgC0vrKIdLp8SOKS3Jsci6NDqZ6XAb+5/WAo4t++wjO
	IJ+b89us6c1T+m1kC1z/ReugXt1W+nBuSHRW/pED6bt5Byq1O80vq8ussvPiAbvThI1gGOgr0NY
	flR3xJznOKXVb/W+O8HA8JokZzdULCDWj6wKyqNB6OINVCuEzXPwiPkJJErMjCQ8XoRCKL1zMGD
	nn0DMKbP+4xIZJkPUli88AbnFqfciCwA75rh2pW7Uk19SNe++xCEfLxTzE5fPgwsZncy+xXTRLA
	7aCCJjXDfhuGmMCH5P89RL1NhtfdO5fQksLEnze7ZXhxv0JFLT7YsIpyDeKp+orH8q4omIw7LUO
	m2qp9YeLN2+gGYC1biqfx8CDXZDu37GizPgh2TrFeWSLRn1mdfwr4ocjibkacAzfQ+VtgESCpXq
	gfAoIJt3Yzyfbj0cnYUOgM/1ZiSTXp3NY2cVAW
X-Received: by 2002:a17:902:f687:b0:2b9:e831:5e5c with SMTP id d9443c01a7336-2cfc01915f2mr1772685ad.4.1784847697393;
        Thu, 23 Jul 2026 16:01:37 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f310644sm40753485ad.55.2026.07.23.16.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 16:01:35 -0700 (PDT)
Date: Thu, 23 Jul 2026 16:01:31 -0700
From: Vipin Sharma <vipinsh@google.com>
To: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, graf@amazon.com, 
	jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, jrhilke@google.com, 
	julianr@linux.ibm.com, kees@kernel.org, kevin.tian@intel.com, leon@kernel.org, 
	leonro@nvidia.com, lukas@wunner.de, mattev@meta.com, michal.winiarski@intel.com, 
	parav@nvidia.com, pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, schnelle@linux.ibm.com, skhan@linuxfoundation.org, 
	skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, yi.l.liu@intel.com
Subject: Re: [PATCH v5 00/20] vfio/pci: Base Live Update support for VFIO
Message-ID: <20260723225943.GE260824.vipinsh@google.com>
References: <20260714151505.3466855-1-vipinsh@google.com>
 <2c03ac97-60a6-4352-a942-27dcebae8d22@linux.dev>
 <8fd94fad-e457-4839-9e41-ae257a138bee@linux.dev>
 <20260720163452.GC1191959.vipinsh@google.com>
 <cebd1045-5dd7-4f35-8750-9c39790ceae9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cebd1045-5dd7-4f35-8750-9c39790ceae9@linux.dev>

On Thu, Jul 23, 2026 at 03:18:55PM -0700, Yanjun.Zhu wrote:
> 
> On 7/20/26 10:08 AM, Vipin Sharma wrote:
> > On Thu, Jul 16, 2026 at 06:22:07PM -0700, Yanjun.Zhu wrote:
> > > On 7/16/26 4:24 PM, Yanjun.Zhu wrote:
> > > > 
> > > > On 7/14/26 8:14 AM, Vipin Sharma wrote:
> > > > > Testing
> > > > > -------
> > > > > 
> > > > > Tested using VFIO Live Update selftests in both QEMU and bare-metal
> > > > > environment (Intel DSA PCIe device).
> > > > I want to make tests VFIO Live Update selftests in QEMU. But how to
> > > > select a PCIe device?
> > > > 
> > > > what device do the PCI ID 0000:00:04.0 and 0000:6a:01.0 mean in the
> > > > following testcase?
> > Sorry, this was my copy-paste mistake when combining things from both
> > qemu and baremetal. You only need one device not two separate ones.
> > 
> > For testing using QEMU, you can use QEMU PCI test device.
> > 
> >    -device pci-testdev
> > 
> > In VM, use `lspci` command to find the BDF of the PCI device. It will show
> > output like:
> > 
> >    00:04.0 Unclassified device [00ff]: Red Hat, Inc. QEMU PCI Test Device
> > 
> > Then prefix the domain (generally, 0000) to the BDF and use the testing
> > commands.
> > 
> > `0000:6a:01.0` was the BDF of the Intel DSA device on my host. I
> > incorrectly mixed two devices during my copy-paste.
> > 
> > Limitation of qemu pci-testdev is that it does not have the DMA
> > capability. I used physical host with Intel DSA to verify that the
> > device performing DMA during live update gets reset.
> > 
> > > In my qemu,
> > > 
> > > 00:04.0 System peripheral: InnoTek Systemberatung GmbH VirtualBox Guest
> > > Service
> > >      Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
> > > Stepping- SERR- FastB2B- DisINTx-
> > >      Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
> > > <MAbort- >SERR- <PERR- INTx-
> > >      Interrupt: pin A routed to IRQ 20
> > >      Region 0: I/O ports at d040 [size=32]
> > >      Region 1: Memory at f0400000 (32-bit, non-prefetchable) [size=4M]
> > >      Region 2: Memory at f0800000 (32-bit, prefetchable) [size=16K]
> > >      Kernel driver in use: vboxguest
> > >      Kernel modules: vboxguest
> > > 
> > > I am wondering if the above pci device can work well with this patch set or
> > > not.
> > I think you should be able to test Live Update with any PCI device which
> > can be attached vfio-pci driver.
> > 
> > `vfio_pci_liveupdate_kexec_test` will initiate DMA if the VFIO selftest
> > framework has the driver for the passed device (Intel DSA) otherwise it
> > will just skip over the DMA flow and do the remaining things.
> 
> Thanks a lot. I'll run some tests with QEMU's `pci-testdev`.
> 
> If I understand correctly, when using `pci-testdev`, only the DMA test case
> is expected not to work, while all the other test cases should work
> correctly.
> 

Yes, other test cases should work.

