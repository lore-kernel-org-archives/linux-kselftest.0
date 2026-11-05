Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908668;
	b=o7G8mZAUUjV0xWXMwwEeeuFGcKQIo6pJ7qDbtjudnK/jV/uRr/YEQ6QvPRMiFpuiLSAe
	 mgWjCxig0KldN9611LUKAHl2ELDqZPHtTk1b8XCzNx/dDpoBMQylI8CsrccrDy/w7uEiI
	 6mbFyWEwaqeP+WVDmGP/NboNrMXMKFWNz7iEopdkhVdcmRmrsrMt5KVqyEObHFZbWLZbc
	 NBXf1iZv3xibA0WrlRPNPSieAJcUyYrfBz5wVRMgKB7eDvH4n3hWTQMknt6ykw9y8qhpY
	 zXM84tE8IlbpTA9XG/sth1ZQwP5mNFr93hkViKPwsY4T2L50CiqiDBSbJdhlYPPPQGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5M1pVxSHRgoftylSS6+7dytfFVlWyjkEZ+vlzow5Ync=;
	b=mNCDy3E2QA6Cs0QYmykmwl3J0CaXWDqKi5wKady54SvqmWhnCD4kKUtfdO3tVcwfTmbe
	 OvD9Umc1xrlhj+utMRf16z06Uy+TR3rd1NPSCrCeTy5O3uLsm+xBahELctWiZQ2XUmURY
	 bcCf28d4ZsdpyEFFKEkQqgJMjg13wgnWnjhDzi5COpwm5yRkQip+MQWBoKtP5d/ju7S+m
	 ON4paMqfFUuXv6Ai7RuAtRIPCeamVrTtJVPMZ2nUpSUAaXr1pKs8G1UqiaWHSDtDbapid
	 cIhGkywB6GDWvm5EG7zFuMuN9XPl0KE/CXWmhoghGtSRqCYMLOVjKIsElsq4GrqreWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FvZGj512;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4F2606B9EA
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 19:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C4F2606B9EA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FvZGj512
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0afe09854so784089a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 11:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793908667; x=1794513467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5M1pVxSHRgoftylSS6+7dytfFVlWyjkEZ+vlzow5Ync=;
        b=FvZGj5121a1NtgHB6chRnlzy241vze8erM8dB9mPTaymnUBZxnIKHYbDizc+tsNdMC
         9xXANnArwrAe4jM1L+kNwZVsWwHaxd8DC+kdYh2zfwJxDx5a3S+NZg+dpjKFQC+je0eu
         8cpyXra2NEA7/SJPFX44jlSYBGwL8JIEBGjujrV92PVab4E4xGy+h/VASb+A1piazcv0
         1GpbgW1c3t4cnKg5ljJ9HbCKe+cSfQ69Q9QSygs0vmFzk4hJuLt6M5NQJkreV4AZvog3
         3UOCCtMHKTzbO1wNZaNos6J/Z9k8iE1aMgZz9sd1DYfmk6DbXLVI0GFisrrpGoC5KxZS
         4mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908667; x=1794513467;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5M1pVxSHRgoftylSS6+7dytfFVlWyjkEZ+vlzow5Ync=;
        b=osh3dPYGGXnfakV8MOmFCyd8BP4CpHHkz1FWJiCzTlSN68QFbl47IdJ7kTgvKxZ64M
         /DKN1LWyOER8TUJo1f0X4iXXeVEmokdE3oJ/lK53r5lDfR6gIwmFvGngFgtrsyxoUvR9
         YJPMG2X++ILp1SaLB8/9D9HFgPjUlHA8sk7/NVJpmzdf2fRx04SWCnV17ubeG+ax/pmM
         7J+BscODfYW3rJTOniGiWHHoU6vh3+O0vOpPzXtsbj3A6GBHbpJv63hQ4XNFAA2+NobP
         0yprmYuzBeecCrUJBa/GkdVEmHkHGtkfZZYnE65cx4yEzd8X5Z3Fio+Je4+Cg3wI90zC
         Uj4w==
X-Forwarded-Encrypted: i=1; AKwUvBz0jd2kEsXZjF79m466p1wKzimeLtBpJkvYgnlcZ027ndE4beDkapNhD1DRAHyaKSlhkuDzZrweH1tB112csZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mVFUrpM+kKqb3L1a4ckn0rpNrt3EaqrQ/vTofBn7HQTfq2aOm
	Wr8FKSOnbqvI1tXvevfZwI8v3X5OuWvvOceXArW7yXit7p2oe1l3noaEDyPqlF0cVg==
X-Gm-Gg: AYBFou2s7rjbCm057PbUTJOeDMxEZ7f1wNPcS8imM3bmfgvr4E0J4IrJWY3ivk1cewW
	an2v/t+KThEAV+ThDt9vcURk6pAdAbrMNpLrhrpBy+ss1ki2urXYeSMH2/3rqqVSjojJQ+vef8s
	E44BvSJ8VTLmJD0FbR7kjJVQvBGfoVuYHX4NCRkbAjdEsX5sLv2PykiWAbTdOVdP2CPC9VjaPxr
	/80ZYGk+n7uk8UlydavQfLPHyHgqWRpxAkI50mJWLgWO1g70+E8n0jW8ZZyv+ErOJ9LU4dYNPou
	7KmY6djJ59EWGKpfwTmggsIdTwzzTv0mf/Tgj3K99eLax/ZL7sqirrBnSdHsFziZeDmezMo6K2U
	kHSyIoJyg5l5bg5X4fazBwTnHPt6dca1ynUfEOctFUUDuAlpf6tJa2dfNw4bTuxV2NW4WcJBVnv
	RVnqxCR1wwydZoxNTZnuf/lnYAB8yvR3YVvvZJ6rfZCmzU/4oDbHGB917wPVkgQ+NLNOh9zRm6C
	r5vIIaY8HR5rzJXywLU7Qg1gr4HyqBquuAB6Lga8oiyAR/oOgBgjmS+HYo5j27OlTZXLpd26DIj
	m1Ikw4YWoAPurIj5cvSDqjzDE51wTr6G2deyDZMG+lpFlEnCLaSL/y3kQCiU7cCn
X-Received: by 2002:a17:90b:3c04:b0:3b0:968f:fdee with SMTP id 98e67ed59e1d1-3b0db7190d8mr58712a91.55.1793908665982;
        Thu, 05 Nov 2026 11:57:45 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b326add7sm4962363a91.8.2026.11.05.11.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:57:43 -0800 (PST)
Date: Thu, 5 Nov 2026 19:57:41 +0000
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
Message-ID: <auzftbPFO_6XBYVw@google.com>
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
> + * DMA Memory Ordering Contract
> + * ============================
> + *
> + * Because a preserved noiommu device continues performing DMA using physical
> + * addresses across kexec, any memory buffer targeted by device DMA must remain
> + * at the same physical address in both kernels and must not be freed to the
> + * page allocator while the device can still access it:
> + *
> + *  * When using a LUO-preserved ``memfd``, userspace **must** preserve the
> + *    ``memfd`` in the **same** LUO session as the VFIO device and **before**
> + *    preserving the VFIO device. LUO finishes files within a session in reverse
> + *    preservation order (LIFO), guaranteeing that if the device is not taken
> + *    over in the new kernel, VFIO's ``finish()`` callback stops bus mastering
> + *    and resets the device before the ``memfd``'s ``finish()`` callback releases
> + *    its folios. Cross-session ordering is the responsibility of userspace.
> + *
> + *  * After retrieving a preserved ``memfd`` in the new kernel, its folios are
> + *    ordinary unpinned shmem page cache until pinned again; userspace must keep
> + *    the ``memfd`` alive and re-pin/map it before finishing the session, and
> + *    must not rely on a ``memfd`` whose ``LIVEUPDATE_SESSION_RETRIEVE_FD`` call
> + *    failed (failed ``memfd`` retrieval frees its folios immediately).

Most of this section documents LUO and memfd behavior (finish ordering
within and across sessions, what happens to memfd folios after
retrieval), which belongs in the LUO and memfd documentation rather than
here. The VFIO documentation should just state what VFIO requires of
userspace and what happens if userspace violates it. Something like:

  DMA Memory
  ==========

  A preserved device keeps performing DMA across kexec to the physical
  addresses it was programmed with before kexec. VFIO does not know
  which memory the device accesses and does not preserve it. Userspace
  must ensure that all memory the device can access stays allocated at
  the same physical address in both kernels until the device is stopped,
  either by userspace after taking it over or by VFIO when the session
  is finished. If userspace violates this, the device can corrupt memory
  that has been freed and reused by either kernel. VFIO cannot detect
  this.

VFIO doesn't stop the device when the session is finished until
PATCH 11, so either add this section there or drop that clause here and
add it in PATCH 11.

> +	cfg_size = pdev->cfg_size;
> +
> +	if (cfg_size != PCI_CFG_SPACE_SIZE && cfg_size != PCI_CFG_SPACE_EXP_SIZE)
> +		return -EINVAL;

pdev->cfg_size isn't limited to these two values. PCI quirks set other
sizes, e.g. quirk_citrine() (0xA0) and quirk_nfp6000() (0x600), and
vfio-pci handles those devices fine since vconfig is just pdev->cfg_size
bytes. This check only seems to exist to bound the variable-length
layout of struct vfio_pci_core_device_ser, which goes away with the
changes suggested below. Please drop it.

> +	total_size = size_add(sizeof(*ser),
> +			      size_add(size_mul(2, cfg_size), saved_size));
> +	if (total_size > U32_MAX)
> +		return -EOVERFLOW;
> +
> +	ser = kho_alloc_preserve(total_size);
> +	if (IS_ERR(ser))
> +		return PTR_ERR(ser);
> +
> +	if (saved_size) {
> +		void *dst = ser->data + 2 * (size_t)cfg_size;
> +
> +		err = pci_liveupdate_serialize_saved_state(vdev->pci_saved_state,
> +							   dst, saved_size);
> +		if (err) {
> +			kho_unpreserve_free(ser);
> +			return err;
> +		}
> +	}

Please don't embed struct pci_saved_state_ser in VFIO's serialized
struct. Variable-length serialized structs should be preserved in their
own allocation, and VFIO should just store the physical address (0 if
there is no saved state). That way the PCI core owns the size, flags and
validation of its own ABI, either struct can grow without changing the
layout of the other, and the offset math here and in PATCH 11 goes away.
struct pci_ser already references its devices array the same way.

I plan to structure the PCI core helpers for serializing and
deserializing struct pci_saved_state to require this. The PCI core will
do the allocation and just return a pointer to the serialized saved
state. But I just wanted to call it out here.

> +	ser->flags = vdev->reset_works ? VFIO_PCI_SER_RESET_WORKS : 0;

reset_works shouldn't be serialized. Alex's series replaces
vdev->reset_works with pci_reset_supported() [1], which only looks at
pdev->reset_methods. Those are set up at enumeration without resetting
the device, so the next kernel can answer the question itself. And the
next kernel's answer is the one that matters, since it's the kernel that
will reset the device.

Please base on that series (or cherry-pick that patch) and drop
VFIO_PCI_SER_RESET_WORKS, along with the incoming reset_works copy and
the reset_works argument to vfio_pci_core_liveupdate_reset() in PATCH
11, and the copy in vfio_pci_liveupdate_take_over() in PATCH 14. flags
then has no defined bits, but please keep it (and keep rejecting unknown
bits) for future features, see below.

> +	if (!vdev->vconfig || !vdev->pci_config_map ||
> +	    ser->cfg_size != pdev->cfg_size)
> +		return -EINVAL;

ser->cfg_size was set from pdev->cfg_size in preserve(), and
pdev->cfg_size doesn't change after enumeration, so the cfg_size check
can't fail.

> +	memcpy(ser->data, vdev->vconfig, ser->cfg_size);
> +	memcpy(ser->data + ser->cfg_size, vdev->pci_config_map, ser->cfg_size);

pci_config_map doesn't need to be preserved. PATCH 14 already rebuilds
it with vfio_config_init() in the next kernel and only uses the
preserved copy to check that the two are identical.

I assume the intent is to detect changes to vfio-pci's config emulation
between the two kernels, but the map isn't a good proxy for that. It
changes for differences that don't matter (e.g. hiding a capability or
learning the length of a new extended capability), which would fail
take-over and lose the Live Update on exactly the kernel upgrades Live
Update is meant for. And it doesn't change for differences that do
matter, like which bits are virtualized or writable within a capability.

Preserving vconfig makes vfio-pci's config emulation part of the
contract between kernels either way. I think changes to the config
emulation that affect how a preserved vconfig is interpreted need to be
tied to a userspace opt-in, recorded as a flag in struct
vfio_pci_core_device_ser. A kernel that doesn't understand the flag then
rejects the preserved device, and userspace shouldn't opt in while it
can still roll back to a kernel without the new emulation.

> +	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
> +	vdev->liveupdate_intx_disabled = !!(cmd & PCI_COMMAND_INTX_DISABLE);
> +	if (!vdev->liveupdate_intx_disabled)
> +		pci_intx(pdev, 0);

This doesn't mask INTx on devices with pdev->broken_intx_masking set,
either because PCI_COMMAND_INTX_DISABLE isn't writable or because a
quirk marks INTx masking as broken. vfio-pci normally masks INTx for
those devices at the interrupt controller, but nothing does that across
kexec, so the device can still assert INTx in the next kernel before
anything is ready to handle it. If the line is shared, that can get the
line disabled as spurious and break the other device.

Please reject those devices in preserve() if they have an INTx pin and
!pci_intx_mask_supported(pdev), and add that to the Restrictions in the
DOC. Check the PCI core flag rather than vdev->pci_2_3, since
vfio_pci.nointxmask=1 clears pci_2_3 even when INTx masking works.

> +struct vfio_pci_core_device_ser {
> +	u32 domain;
> +	u16 bdf;
> +	u16 cfg_size;
> +	u32 size;
> +	u32 flags;
> +	u32 saved_state_size;
> +	u32 reserved;
> +	u8 data[];
> +} __packed;

Once config_map and the saved state are gone, vconfig is the only
variable-length part left. Please either make it a fixed-length array
sized for the largest config space (PCI_CFG_SPACE_EXP_SIZE), or preserve
it in a separate allocation like the saved state. Either way this struct
becomes fixed-size and data[] goes away.

cfg_size should stay, to record how much of vconfig is valid. The next
kernel computes pdev->cfg_size on its own and could come up with a
different value, so it needs to check that ser->cfg_size matches (and
fits in the vconfig buffer) before using the preserved vconfig. Doing
that once in retrieve() should be enough.

I understand this will waste some memory today, since each KHO
allocation must be a multiple of a PAGE_SIZE. But that is a KHO problem
that can be fixed later.

> +#ifdef CONFIG_VFIO_PCI_LIVEUPDATE
> +	bool			liveupdate_frozen;
> +	bool			liveupdate_intx_disabled;
> +#endif

nit: liveupdate_intx_disabled reads like "INTx is disabled for Live
Update", but it actually records whether INTx was already disabled
before freeze(). Inverting it to something like liveupdate_masked_intx
(i.e. freeze() masked INTx, so unfreeze() needs to unmask it) would make
freeze() and unfreeze() easier to follow.

[1] https://lore.kernel.org/kvm/20260812045325.2733631-6-alex.williamson@nvidia.com/
