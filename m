Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793905944;
	b=bZiyCPTjthcoAeWs0LbfHy8yk03M4tm905RXWDvLsUdRtVX90IFHVYs5QZNO4aboh8Vb
	 xChsDl/plcPw+Y6amljKJ9yhz/zUFXA0XTv4Uzwqm65k5C5BbeUVBHa+Uo9ow+3K8GuGh
	 4pd61qJjuJAJMatoYjsm34UdXh0L4wdiqOwPj4W/ZjhyF2eHxIU5fUJsqCmVOhbvrNSgP
	 OHrCHhijkw6XDL9RaICTvB0CSoQ7n6rhbdK3VQzQO6LiALMzJroqtZ45Q/A9saZY+YGGZ
	 sTLjvkC9x2NYhGvtRtHJ+mFz8WX170NenGmyvcjujrnIo2agy7EiWf4tIBQQwHgR0Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QH8EWm3WpJvKmm+3SH11RyockHxBeCCGhqou8vP+rPk=;
	b=O3Ax6f9O8YK7dGnsmehNDCM99iSRfSKbrpXPtYfLOtnrmoubgE/RvjQFzoJusOa+XM0F
	 NmVX/eZX6z2SrztwVgHcCmrZ/ckuoc+BdtBS+K/lcuJMyMDO0cyYJxeSAvfmqZsORlrjn
	 tCERxOHnBM1VI+vqG45gziNZtZJ9ZaTEXS7IRMREE2KEPYpVKB1S3yWTKO6GtBFbODGXL
	 8aks+Wg1AtsHnjlLVkVSJDc5w99rti466Thae4zT2av0h59vbcDjf0ATEHvjKJDahZxAn
	 dEVbdifnrsjf38By9qPaK4MPeJHbGwkevK9izKbJhJJJ/ZUqoVq2eiygfAEBh5gs+9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B0MNLtWQ;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D00606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 19:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D00606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B0MNLtWQ
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so1349942a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 11:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793905942; x=1794510742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QH8EWm3WpJvKmm+3SH11RyockHxBeCCGhqou8vP+rPk=;
        b=B0MNLtWQGjDmicRxY8nTu69DmYdME/D2jJN8rX+nGAlTMa5/iKX0Zivd7mhh+flPfs
         xy3ZoNN4HgIKW4K4+mbAoNWhsSmDgb1P3WgIZCjZvecSakD2rB4XrTL8WwonQtbvNgZ8
         h8p2WNu5k95YFljALG1jMJJ03s4qGmEUPwOwManEDxZ+GcL/xuiqjJVeLqmp+5UyzAW6
         9EH7p2MmwcpUJDnOC5R25PxQkZi+0TuqQnMBjToaTQ/j5/LnlqaqNQd3J93XCaF2MN6H
         E7WHw7qCt48+ehLyUoviWDEPPA7ju+e/24ge/Nj8T6fML4Ui3s4IgQMHHYqUJVnOXFuq
         B5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905942; x=1794510742;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QH8EWm3WpJvKmm+3SH11RyockHxBeCCGhqou8vP+rPk=;
        b=No3sg8j0584GQuGJ0wI+4X+n1chqe1+C5a8twn9TmEfm38mRGKuy77oOF0dJ/S2VxI
         t7avf+8ToWIjOnRlbO2NeWogmiMRGEfTW4hdWDUhEtZT/K70sfTIR+HLdQtaTTpvkAFM
         L1Oz2N9VAaqHSKQnwuzlkE5o7WwBjdSYtvAtCisf+A5EgDdnXowkarTwVrhD1GP16BQY
         XuraT6TpXLPqvXhBlFbRNwVtUrTd1iN7BqFHeJDQYwE5Br+8RUaLHLeKkvGNZbpt4LQQ
         1tahRSHdzk/CEmeuGXsFCivE78IPuCjLOjp9DTgx3b3769MqHDXLyg6oJyuLnJWz5ajs
         zYZA==
X-Forwarded-Encrypted: i=1; AKwUvBwS+9Tv2hYRM/rx4zC6TLfwm+rpUd80esth3N9337+c4IYY6wQyjeSyhodkeYw9x4JQ2Bi+hImwkITXSGzXdag=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bxzVylIf1EHcatNDbh4yLt+yXbuWGwLe5LIgvdglsBQ4SnxZ9
	V8nBbsJHYL5gJoFv/xzf2xc85fVwh6TzPFYMtFZZ3zyWCH5D//ARSRMTjiE+sYYSZA==
X-Gm-Gg: AYBFou3E6g8kzWCwHUsZPsvvk4YeEMmxBfqBbmqATf/dyMPF8fvL54FjLklzVmWkH1O
	qLK0V6x6Kkr1gQ/z3aaz7UnmQKMqCEW2ECTMmxsRHMs4G1EYINUoljjrSlUrK8diyJ65sSgzXqK
	jZFUJZKKciDCzu+KIU4vBDjbB/nSjADW8zLpJDPAfhy/0leXFin0WM+yVz2HJdkfytN5mUG3WB7
	nO+Yo2eefcR3dsFk7S9JKNjtvcfU5CRiEnLBnJJnHc5wqVJVS2aYEBtLw31WG7uJUQq055haQdt
	XAhDOz9hLiANrJxVIk25ctaMOEqQYZjaVDs5hrAmzCcHMYx9eJBV0zFyxo0EucCj5tySC8LMhzR
	pbOFL4ZeXyOjSgRFJgQVx2VKAYm7oINeg/pFShhYFh2UTVUuXDhVKxFGo+G9+/+CcxzmeYwg+tH
	XAxVvD6HY302dCOvXbCZUXYNcsTmEUUQOio9m+LleDJnZeoe/USmtbXxLkfSEwJdJ+o8JJII+MM
	61eFGoceKr2cAWwU/L8ByCa1n/0gEalvgDAEUAHOzCjznjsziToCHCm7JbkaUI1wBU4Ney1bjne
	74rmdsGfk37kTa6Ct9YPF5f/BbFctZhNzF+xFR6o+8YhQcNjfLSa/EyMi1lOwVnu
X-Received: by 2002:a17:90b:268a:b0:3ac:7c52:faeb with SMTP id 98e67ed59e1d1-3ae89769d66mr17879218a91.41.1793905941532;
        Thu, 05 Nov 2026 11:12:21 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944eb1d1sm5401592a91.0.2026.11.05.11.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:12:20 -0800 (PST)
Date: Thu, 5 Nov 2026 19:12:17 +0000
From: David Matlack <dmatlack@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org,
	ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com,
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com,
	chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net,
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com,
	jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com,
	kees@kernel.org, kevin.tian@intel.com, leon@kernel.org,
	leonro@nvidia.com, lukas@wunner.de, mattev@meta.com,
	michal.winiarski@intel.com, parav@nvidia.com,
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org,
	rananta@google.com, rdunlap@infradead.org, rientjes@google.com,
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com,
	schnelle@linux.ibm.com, skhan@linuxfoundation.org,
	skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com,
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 07/27] vfio/pci: Preserve vfio-pci device files across
 Live Update
Message-ID: <auzVEUpFEoWltpVg@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-8-vipinsh@google.com>
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
In-Reply-To: <20261102153656.1431701-8-vipinsh@google.com>

On 2026-11-02 07:36 AM, Vipin Sharma wrote:
>  * TOCTOU synchronization: vfio_pci_dev_is_frozen() is checked locklessly
>    on entry to the ioctl, read/write and mmap paths, and re-checked under
>    a lock that freeze() holds before any operation that could change the
>    device or vconfig: under vdev->igate in vfio_pci_ioctl_set_irqs() and
>    around every config-space write in vfio_pci_config_rw_single(), under
>    vdev->memory_lock in vfio_pci_runtime_pm_entry(),
>    vfio_pci_ioctl_reset() and the SR-IOV enable path of
>    vfio_pci_core_sriov_configure(), and under dev_set->lock in
>    vfio_pci_dev_set_hot_reset(). A racing operation thus either completes
>    before freeze() takes its snapshot or fails, while existing BAR mmaps,
>    ioeventfds and dma-bufs keep working. Serializing config writes on
>    igate covers the PCI_COMMAND, INTx disable emulation, power state and
>    FLR paths at one point (the INTx disable emulation now uses the
>    igate-held __vfio_pci_intx_mask() and __vfio_pci_intx_unmask()
>    helpers), and also serializes the irq_type and virq_disabled accesses
>    of config writes with VFIO_DEVICE_SET_IRQS.

I think there's a simpler way to do this. Checking the frozen flag
locklessly and then re-checking it under whichever lock covers each
path spreads the synchronization across igate, memory_lock and
dev_set->lock. That makes it hard to convince yourself every path that
can change the device is covered. It also makes every config space
write take igate, for all vfio-pci users, even when
CONFIG_VFIO_PCI_LIVEUPDATE=n.

Instead, I suggest adding a per-device rw_semaphore to struct
vfio_device in the VFIO core, e.g. liveupdate_rwsem, that protects a
liveupdate_frozen flag:

 - vfio_device_fops_unl_ioctl(), vfio_device_fops_read() and
   vfio_device_fops_write() take liveupdate_rwsem for read and fail
   with -EIO if the device is frozen. That covers every device ioctl in
   one place, including the ones handled by the VFIO core
   (VFIO_DEVICE_FEATURE, VFIO_DEVICE_GET_REGION_INFO and
   VFIO_DEVICE_{ATTACH,DETACH}_IOMMUFD_PT). This patch doesn't block
   the last two at all today.

 - freeze() and unfreeze() take liveupdate_rwsem for write, before any
   other lock, and flip the flag. preserve() doesn't need it since it
   only serializes state that doesn't change after the device is
   opened.

Putting this in the VFIO core also means other VFIO drivers can reuse
it if they add Live Update support in the future.

The lock order then becomes:

  liveupdate_rwsem -> dev_set->lock -> igate -> memory_lock

freeze() can still take igate and memory_lock to check irq_type,
pm_runtime_engaged and sriov_active. But the ioctl, read and write
paths no longer need to re-check anything under those locks. So you
can drop the igate change in vfio_pci_config_rw_single(), the
open-coded vfio_pci_zap_and_down_write_memory_lock() in
vfio_pci_runtime_pm_entry() and vfio_pci_ioctl_reset(), and the
smp_load_acquire()/smp_store_release() pair.

Two paths still need their own handling because they don't go through
the device's file:

 - vfio_pci_core_sriov_configure() is reached through sysfs. Take
   liveupdate_rwsem for read around the frozen check and the
   sriov_active update.

 - VFIO_DEVICE_PCI_HOT_RESET issued on one device also resets the other
   devices in its dev_set. Keep the check in
   vfio_pci_dev_set_hot_reset() under dev_set->lock. freeze() sets the
   flag while holding both liveupdate_rwsem and dev_set->lock, so
   holding either one is enough to read it. Please don't take the other
   devices' liveupdate_rwsem there, since that would invert the lock
   order relative to freeze().

I don't think mmap needs to be blocked at all. Creating a new mapping
doesn't change the device or any of the state that gets preserved, and
existing mappings already keep working while the device is frozen.
Leaving mmap alone also avoids taking liveupdate_rwsem under mmap_lock,
which could deadlock: the ioctl, read and write paths can fault on user
memory (taking mmap_lock) while holding liveupdate_rwsem for read, and
freeze() may be waiting for the write lock. Please update the comment
in freeze() and the DOC section to match.

> diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
> index 9914f3ac69ae..1f1ac7a798aa 100644
> --- a/drivers/vfio/pci/vfio_pci_config.c
> +++ b/drivers/vfio/pci/vfio_pci_config.c
> @@ -644,10 +644,10 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>  
>  		if (virt_intx_disable && !vdev->virq_disabled) {
>  			vdev->virq_disabled = true;
> -			vfio_pci_intx_mask(vdev);
> +			__vfio_pci_intx_mask(vdev);
>  		} else if (!virt_intx_disable && vdev->virq_disabled) {
>  			vdev->virq_disabled = false;
> -			vfio_pci_intx_unmask(vdev);
> +			__vfio_pci_intx_unmask(vdev);
>  		}
>  	}

With the rwsem, config writes no longer need igate, so this change
isn't needed. If config writes and VFIO_DEVICE_SET_IRQS really do race
on irq_type and virq_disabled today, that's unrelated to Live Update.
Please send it as a separate fix.

Lastly, please add the freeze infrastructure and the checks in their
own commit ahead of this one, e.g. "vfio: Add infrastructure to freeze
devices for Live Update". Then this patch only has to implement
freeze() and unfreeze() on top of it, which will make both easier to
review.
