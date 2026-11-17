Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952746;
	b=WVnDmDoave+DLbLdIdRRZq3MRWTxF+GEnXPF7ADLdG2+rLe1uDfy13rvdIeVObjZTnxk
	 gwu0Kp02H7uBbhHSB+gz8r91KXDF64jfIsBM5XybeUtCcc/d/KIhfyp39+j0r2SUSUxEg
	 JELe5Xc2dG2kYvsmBtBeScKQoxzgLCVaNylaF9jtbzLl2rZOT/oBB+p34rDIl05uyppPn
	 1CF96Er5WcPY9su6Cwy/8gBVozPJ5d9c/mahJdv9p3INlFmqnvWRAMg8WrUwEesF9fHk2
	 Pa0kssDGxWzQjPl7ZcG/F4IswU0Rq8hBtG9r3quEGp1Iym6wk6XWbC6IMw1xFOP+S8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6ppas4HZ2NGOZcFcrTWA/+6VjpboNZmJZl+VQIcgy64=;
	b=zfg+Te4huBzv7QtgqAJrJWcny/Aqz9nUXDdheq1Nyd/AVo+EqB49fM5jLa68CuCq9NqU
	 7v83VE7caGaqmimJOA5aWasMLxVLoCxIiMcaM7kkfAEnoA9d6+ox4DQYaFH2P74C7W57+
	 Q2sgkcopUD44ruse7P1qZAzjsLp6+tlcnIw6yKYOsesby3QcERB9EMTNoTlXgJP9Oj1/X
	 amtDTDn4RPiGY58nEW6ehXNRUo9MJ82xO2r/aM7ZDCgcRr+io4TMnAxUJocPKmeI2zsXl
	 vv+qNAhsFtlI0eMiHBPtntWY0lXXrNina0VXohrv7ZQvU2LZcnAKaHCAVvP9dlBP5Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EfJXDMRe;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5648606A330
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 21:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5648606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EfJXDMRe
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ed3f563739so21535ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 13:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794952745; x=1795557545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ppas4HZ2NGOZcFcrTWA/+6VjpboNZmJZl+VQIcgy64=;
        b=EfJXDMRe6em8z635NUEChDgMdqWOKqo0Ntv8rvsuf/jUawXGDGUYrN9oAIqxv1+c0U
         ZENiouw7xqD64r/dkBosaSnCVTs5QOI8dP8jqaoMnGyIHsAv5DAoyCovx0fieD13wagD
         UjV8/gdiVoChlZxwDASL07PfN1GyMbRWcyVl6jwlymYaGWs2bhlIHwLr1yyQXZ4cR8y9
         KtZrqL5WlnWD6iJ1pKsZCa2RHH6jbyLcG30nTBHmV3sf/MINwUM/StzUdO484WOWfkP4
         U61AJKGxSjv4tnnVb4bvEcfbFPIllJKH6t7RrFpnDC+nwYAFsHDYMBaCLf7UQsJX1Iqw
         26rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952745; x=1795557545;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ppas4HZ2NGOZcFcrTWA/+6VjpboNZmJZl+VQIcgy64=;
        b=QcF+Yx6x34BYUER8sCdGUClIqNAo8jZ0iwjKNL/y3pIzdlUy6uDyP1oooxQIBTcotC
         OmSmQY2X+08S+W8C27YlSmKgP1VfXNFELTPxPO71ZXfq2aC9pdb19k4yIfukWtYZVSEI
         sscFrpyXUwLNwpoVT77xe1Kn/S71S2VNgwrsRzMABmHEFBWpFCsoEPZMJ7M/RKo+7q1I
         sS8u3KZM+8ZxtLA0nje2FqVD9NECtlDwkYmg+Vx1vhaNJUau7Pne5AzJ6Z+BaQEGPFFv
         Rf/D/S74cGk+NgVBjvzZOjhtE4E9ZU6eDRicva3228MdUNgJKpuv5LyKnbA2NXTpCQ29
         G0zQ==
X-Forwarded-Encrypted: i=1; AL+hErGpElEl4giDwdc1yZUXbFyTTgdJMagAoV4XOXEi/unSIjj/wIYRybY2HrGIxSuLK+1Q4eaOjwkPm1lJ+MqauCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qyBfsfRm3VS7wnc4cGVHJtrZRkyy7v1mN0Z5rtgW6gC6ezWIW
	l53GqaV+rmDa6YcxKfoC1x9Fkcra1sonUKL8YTZ63lZazUyzPTwUTb0/UVYqeMJnuQ==
X-Gm-Gg: AZFdTZdccwbUwiqFF+9mpyYgkRK4hDh0Hlc8g5sQ2yJKzQ78o3urV4VBcsuFbjZyAmw
	+43S5vBl/j7+Wnx7QpudYMcKXEFKyi7JwMWYx/r/J1Pr/0pS64QtCJsV2Ax7y88yE619c+cVVMq
	3HbDYjGB8qA7x99fTpLuH0z2hCLBc63/gKm1ctgFmk7o7Rf+Jy5n00tlVTIxziSQ8tzWP1UNKW8
	i3YeBYAB4gK3ofDUhmte6kV8RvPdETmYtW5YDXnv516Jp9u1X1xmCaSHkrmT2pyP7edtnw6v+pJ
	hQ/fY3XZeWdFi8xHRxjjwS0T8XN791cc0H1LxBD+IoCndk/pIbyfJenxWqu407jEWs8AiYTW5Qg
	BG37d6VgwtAp+69atLUoo6NXDTkb06/ta7bVJbKa8DWIK7soLj2lGPmTCEhcAH42IlIUbB1HlMo
	8jThMzP5AuNT5jJlCP+qnVrZBxoZrEyMXI7wc5AEkH/hDZsoB8NS76lr9fWRyRkvxR0JCA4Takj
	4dY2JfR4WnF32Y+vr5kCMCJ0T9SvpNOmgbXwQ0jnko4TI9EK8ORBF7e3l5g07+PyKbkM8U6jMoc
	JQVpaIBudeJQGSYrETBDYkQRDuuju0YNlwah2KikSMYJ8B3IfVoTolhSWxOHKq9k6hrSvFvT0RL
	0+CZNHxYqT++8
X-Received: by 2002:a17:903:3d0e:b0:2df:96ca:d7c7 with SMTP id d9443c01a7336-2eff98e2025mr646525ad.10.1794952744396;
        Tue, 17 Nov 2026 13:59:04 -0800 (PST)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff623c4c6sm2756405ad.54.2026.11.17.13.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:59:03 -0800 (PST)
Date: Tue, 17 Nov 2026 13:59:00 -0800
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
Subject: Re: [PATCH v6 07/27] vfio/pci: Preserve vfio-pci device files across
 Live Update
Message-ID: <20261117003405.GA4153658.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-8-vipinsh@google.com>
 <auzVEUpFEoWltpVg@google.com>
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
In-Reply-To: <auzVEUpFEoWltpVg@google.com>

On Thu, Nov 05, 2026 at 07:12:17PM +0000, David Matlack wrote:
> On 2026-11-02 07:36 AM, Vipin Sharma wrote:
> >  * TOCTOU synchronization: vfio_pci_dev_is_frozen() is checked locklessly
> >    on entry to the ioctl, read/write and mmap paths, and re-checked under
> >    a lock that freeze() holds before any operation that could change the
> >    device or vconfig: under vdev->igate in vfio_pci_ioctl_set_irqs() and
> >    around every config-space write in vfio_pci_config_rw_single(), under
> >    vdev->memory_lock in vfio_pci_runtime_pm_entry(),
> >    vfio_pci_ioctl_reset() and the SR-IOV enable path of
> >    vfio_pci_core_sriov_configure(), and under dev_set->lock in
> >    vfio_pci_dev_set_hot_reset(). A racing operation thus either completes
> >    before freeze() takes its snapshot or fails, while existing BAR mmaps,
> >    ioeventfds and dma-bufs keep working. Serializing config writes on
> >    igate covers the PCI_COMMAND, INTx disable emulation, power state and
> >    FLR paths at one point (the INTx disable emulation now uses the
> >    igate-held __vfio_pci_intx_mask() and __vfio_pci_intx_unmask()
> >    helpers), and also serializes the irq_type and virq_disabled accesses
> >    of config writes with VFIO_DEVICE_SET_IRQS.
> 
> I think there's a simpler way to do this. Checking the frozen flag
> locklessly and then re-checking it under whichever lock covers each
> path spreads the synchronization across igate, memory_lock and
> dev_set->lock. That makes it hard to convince yourself every path that
> can change the device is covered. It also makes every config space
> write take igate, for all vfio-pci users, even when
> CONFIG_VFIO_PCI_LIVEUPDATE=n.
> 
> Instead, I suggest adding a per-device rw_semaphore to struct
> vfio_device in the VFIO core, e.g. liveupdate_rwsem, that protects a
> liveupdate_frozen flag:
> 
>  - vfio_device_fops_unl_ioctl(), vfio_device_fops_read() and
>    vfio_device_fops_write() take liveupdate_rwsem for read and fail
>    with -EIO if the device is frozen. That covers every device ioctl in
>    one place, including the ones handled by the VFIO core
>    (VFIO_DEVICE_FEATURE, VFIO_DEVICE_GET_REGION_INFO and
>    VFIO_DEVICE_{ATTACH,DETACH}_IOMMUFD_PT). This patch doesn't block
>    the last two at all today.
> 
>  - freeze() and unfreeze() take liveupdate_rwsem for write, before any
>    other lock, and flip the flag. preserve() doesn't need it since it
>    only serializes state that doesn't change after the device is
>    opened.
> 
> Putting this in the VFIO core also means other VFIO drivers can reuse
> it if they add Live Update support in the future.
> 
> The lock order then becomes:
> 
>   liveupdate_rwsem -> dev_set->lock -> igate -> memory_lock
> 
> freeze() can still take igate and memory_lock to check irq_type,
> pm_runtime_engaged and sriov_active. But the ioctl, read and write
> paths no longer need to re-check anything under those locks. So you
> can drop the igate change in vfio_pci_config_rw_single(), the
> open-coded vfio_pci_zap_and_down_write_memory_lock() in
> vfio_pci_runtime_pm_entry() and vfio_pci_ioctl_reset(), and the
> smp_load_acquire()/smp_store_release() pair.
> 
> Two paths still need their own handling because they don't go through
> the device's file:
> 
>  - vfio_pci_core_sriov_configure() is reached through sysfs. Take
>    liveupdate_rwsem for read around the frozen check and the
>    sriov_active update.
> 
>  - VFIO_DEVICE_PCI_HOT_RESET issued on one device also resets the other
>    devices in its dev_set. Keep the check in
>    vfio_pci_dev_set_hot_reset() under dev_set->lock. freeze() sets the
>    flag while holding both liveupdate_rwsem and dev_set->lock, so
>    holding either one is enough to read it. Please don't take the other
>    devices' liveupdate_rwsem there, since that would invert the lock
>    order relative to freeze().
> 
> I don't think mmap needs to be blocked at all. Creating a new mapping
> doesn't change the device or any of the state that gets preserved, and
> existing mappings already keep working while the device is frozen.
> Leaving mmap alone also avoids taking liveupdate_rwsem under mmap_lock,
> which could deadlock: the ioctl, read and write paths can fault on user
> memory (taking mmap_lock) while holding liveupdate_rwsem for read, and
> freeze() may be waiting for the write lock. Please update the comment
> in freeze() and the DOC section to match.
> 

Thanks for suggestion, this is indeed simpler.

> > diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
> > index 9914f3ac69ae..1f1ac7a798aa 100644
> > --- a/drivers/vfio/pci/vfio_pci_config.c
> > +++ b/drivers/vfio/pci/vfio_pci_config.c
> > @@ -644,10 +644,10 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
> >  
> >  		if (virt_intx_disable && !vdev->virq_disabled) {
> >  			vdev->virq_disabled = true;
> > -			vfio_pci_intx_mask(vdev);
> > +			__vfio_pci_intx_mask(vdev);
> >  		} else if (!virt_intx_disable && vdev->virq_disabled) {
> >  			vdev->virq_disabled = false;
> > -			vfio_pci_intx_unmask(vdev);
> > +			__vfio_pci_intx_unmask(vdev);
> >  		}
> >  	}
> 
> With the rwsem, config writes no longer need igate, so this change
> isn't needed. If config writes and VFIO_DEVICE_SET_IRQS really do race
> on irq_type and virq_disabled today, that's unrelated to Live Update.
> Please send it as a separate fix.
> 

This will go away.

> Lastly, please add the freeze infrastructure and the checks in their
> own commit ahead of this one, e.g. "vfio: Add infrastructure to freeze
> devices for Live Update". Then this patch only has to implement
> freeze() and unfreeze() on top of it, which will make both easier to
> review.

Sounds good. Thanks for the review.
