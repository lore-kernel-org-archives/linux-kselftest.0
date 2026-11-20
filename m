Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795136483;
	b=N1gkW9iAK11g1dot1KzyFGRWy//AaQ+abAWMpk3eJcIjdUX4k+RlvJZ664D/BADiVjGQ
	 CiyZYb9xvsYq/eatff7Rcw3x1YcLdZo9pemIvCcOykJ8JKtDGmeyNChJ/5IsSAnmAZZJ5
	 vyzRix5totOj3r/nLJYgYKGSv8RxMsVlQGVRTwyM55GCbMeRGdp3LxE9fCoa5Z5bWgUKV
	 ghaEQJVwFnCWPcNzVjqCQSM6hHdntxovYKSLBprQLPQZ6X0hBphVpHllf3H+hjsg1HXZ+
	 00+d+LMIhewwPdPVJwCvCNNXpoXwafEYGeNF1D/M6GNz/9R9rG0Zesp0XnhbspCh0HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795136483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=tQwX2YSXjHFZhdcGcul9Os/DsNb3L2Z/dlwRM94y3qk=;
	b=twPVsN6VkpLTdvQtOGOMn1TcQVfnI1f0jDrnH9ElQ/okak+gJMsAwcQ+qNKhnjVxZdYv
	 4snaMokHkX8cnzyuiSkK2Xe16VI9H9Hg9O9bNqnBohNIiUoEvgPkdbBQ39JodxoOD9PM+
	 uLQopd/qI935AFPoHyM7DlzGKKcjSs6lHBE/KSLCVzbK0dO5P/ezPJwamfUF1Lt539bFf
	 M2pHU+GB/AF9Gou3jE7BYRqw/wZyQI+aIBZuxblxVT3/DjOoLJXfpTYhlfix0vYfpl540
	 2uErYz/bW/0v4twF43J7XVv6hoX3FGdhrqNe36wNv3XyBovnovAcT81KGz7pPRW5kOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aB8MFpMM;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFF4606A326
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 01:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DFF4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aB8MFpMM
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b413997581so347395a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 17:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795136482; x=1795741282; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tQwX2YSXjHFZhdcGcul9Os/DsNb3L2Z/dlwRM94y3qk=;
        b=aB8MFpMMrxKiPFy6+JAlCebkuTAfB8STJ/MwS9WIwLqCpnefzKeDmhq5EVEBXBTAtk
         iZsFiOjSaZIDuUxvIML1Q/Pli5/DbL6gnCoGLgbUYawH5QdgI21J9H40Mcs3J1SkkOvI
         uWizmt1tDmGonLNXZ5YXlF2PsmUADiZT4OHccB3JI6LVrjbu/MATocrXjp79XyuUs34p
         GeFTzL2WyAVHxcYDZfAvaAkSSL4rOyfBbi+O8FFV0R2xboCacObeig/kcXV1qJPWJG1I
         K7A5+1J8wG+SXMXJhKIY8LO6D59Ticfnt/qzBmbcW/9Y7XR175kyxD2+3VefSFEg2uUQ
         J/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795136482; x=1795741282;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQwX2YSXjHFZhdcGcul9Os/DsNb3L2Z/dlwRM94y3qk=;
        b=XXibVnV3KLcIAfm8+wdjXENzudLCfYjlyGDqOzVLr6LOwRHa90/X8/4cQXUQqSG+n+
         eJma2hn9r34ipBi+BPkW5gttCe6g0JsLF+fU974Yiju/p9nkwH5Cgq+/F3SgO+NnhY3j
         C9JpXMnLUMEAY3zk3rH0hbJ3TfBgiz0H7ilnH3mdIswWn3emhPK0AuAxCwqPeKBsi0nc
         5/vaBGRvnmsg4I1LFSCZ5HQ/32iXV2an0vEePT78ROxvWKr2+VTSBg6QXtdAoDlSGy0p
         bt+Cd7ry6eECjtBm1SbFdnfMNjWYcP9pHozMh8J7zEgN3yx8aJQGGjbdVRPUmlCFM4iB
         i8fQ==
X-Forwarded-Encrypted: i=1; AL+hErGiItbpVuhIhhP1zu7DoEf97bL7iYbiExWvifMN2jNqTqMl/Q+cyAb74ibuvqGKdO+36ZDuXcfnTQKVuN7NQxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/cru503T0VPpodHBIUK0MG41OwyxEzCOYuTP0lP47ZqcTT6co
	gMOFpzXrF44wAY1Q+dXq5DonAh4iTnUmVY4VmDezSKvQYhnqMK02je3O2dalkR8QCg==
X-Gm-Gg: AZFdTZfh6Mi4F4fECaMQJOecCTZM1aSdYWOGTKYqmMuFlmbepdTwvQkxYwMnIUe2cRZ
	TduNR74lyUxgOhhMQY7gI2AKbyey2fw3xnpVKPRwweg0cliUdeyKRRBjRd85M+8KKMrZiguIwBU
	+Xb9v+RWCyI+qBO3r/VY9lWllrqWyjjZHOIcU9QphdtBF+xsL/8Cna+UORlQrbzoxTnAsOXa71z
	2BZSU67/ue6t4b2lzi3wy3mffME7/lI3TmW5yYPHZVc97DLI/37hQmEwrF22rJYFMeuuorJakrq
	9HwnYx0/GlAAKKyGi47kipQvAaEkclWZ2GtzhgFMpTSVugwqVS9YJz9QwEYEB4NUL07eOfSEb63
	i4HJL8Y/LIJ9JU3CGMdiZ1U5/z0pi3bF01fbQAd6VPDTtu2NbmvKNBMyZYuMsjS8dQ5kDWYazSd
	QilSk125H26jwELOByI4zdgLmQamInESGGap3Y9b/HJ4jJP+9Q1bmOpeifZ+QmCwN9HWtGccOjh
	7a/3TEhmqOgvbtO3AbybJ/DwCEO22bCNN3HvvTWXLvay1V+DDV7gvJXk81DtcjUXHUq4MpTL93P
	ztUcn/AxDXFRguegsO3Um9MQ6+kypCjTJ573anWU/QCGuaOu6R82vaBtW9dv2AQK
X-Received: by 2002:a17:90b:4b87:b0:3b4:a63:d55c with SMTP id 98e67ed59e1d1-3b41c93b17cmr965473a91.30.1795136481385;
        Thu, 19 Nov 2026 17:01:21 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm4865271a91.10.2026.11.19.17.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:01:20 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 17:01:19 -0800
Message-Id: <DMZMRTXS7OSC.M79XF39ZVEWE@google.com>
Cc: <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <dmatlack@google.com>, <graf@amazon.com>, <jacob.pan@linux.microsoft.com>,
 <jgg@nvidia.com>, <jgg@ziepe.ca>, <jrhilke@google.com>,
 <julianr@linux.ibm.com>, <kees@kernel.org>, <kevin.tian@intel.com>,
 <leon@kernel.org>, <leonro@nvidia.com>, <lukas@wunner.de>,
 <mattev@meta.com>, <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 11/27] vfio/pci: Retrieve preserved device files
 after Live Update
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, <kexec@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-12-vipinsh@google.com>
In-Reply-To: <20261102153656.1431701-12-vipinsh@google.com>

On Mon Nov 2, 2026 at 7:36 AM PST, Vipin Sharma wrote:
> Enable userspace to retrieve preserved VFIO device files after a Live
> Update by implementing the retrieve() and finish() file handler
> callbacks.
>
> During retrieve():
>  * Validate the handed-over struct vfio_pci_core_device_ser header,
>    sizes, and flags.
> [...]

Please make the commit messages in this series easier to read. They are
mostly long bulleted lists of everything the code does, which is hard to
follow and largely repeats the diff. A commit message should explain, in
prose, what problem the patch solves and why it solves it this way, and
only call out details that a reviewer can't easily get from the code.
This applies to most of the patches in the series (e.g. PATCH 07 and
PATCH 13 too).

> Do not implement can_finish(): closing a retrieved LUO session invokes
> finish, and refusing can_finish() would leak the session and leave
> unclaimed devices running. Instead, finish() always completes:
>  * If the retrieved device was claimed by opening it via
>    VFIO_DEVICE_BIND_IOMMUFD (which consumes vdev->liveupdate_incoming;
>    subsequent patches replace the open-time reset with non-reset
>    take-over, reject opening incoming devices other than via retrieve(),
>    and protect incoming kept-running devices across runtime PM, dev_set
>    resets, and non-noiommu boots), finish() simply completes its PCI
>    Live Update participation.
>  * If the device was not claimed (never retrieved, retrieve() failed, or
>    retrieved but never bound via VFIO_DEVICE_BIND_IOMMUFD),
>    vfio_pci_core_liveupdate_reset() logs one pci_warn() naming the
>    device, clears PCI_COMMAND_MASTER, resets the function, and restores
>    the inherited pci_saved_state just as closing the device would. If
>    the device has a function reset but is not reset, e.g. because
>    pci_dev_trylock() contends with a concurrent driver unbind, latch
>    vdev->liveupdate_reset_pending so vfio_pci_core_unregister_device()
>    completes the function reset and state restoration via
>    vfio_pci_core_liveupdate_reset_locked() under the device lock held by
>    device_release_driver(). Opening the device after finish() resets it
>    like any open, so it drops the latch.
>  * If the device was not retrieved, look it up under pci_dev_lock(),
>    which waits for a vfio-pci probe in progress. If it is bound to
>    vfio-pci, finish it as above. If it has no driver, clear bus
>    mastering and reset it. Otherwise leave it to the bound driver.
>  * Call pci_liveupdate_finish() and kho_restore_free() on every path.

This is a lot of complexity for one commit, and it's hard to review. I'd
like to start with the simplest approach and build from there: implement
can_finish() and have it return false until the device is fully
retrieved, i.e. retrieved and taken over by VFIO_DEVICE_BIND_IOMMUFD.
Then finish() only needs to free the incoming state and call
pci_liveupdate_finish().

That gets rid of vfio_pci_core_liveupdate_reset(),
vfio_pci_core_liveupdate_reset_locked(),
vfio_pci_liveupdate_finish_lookup() and its bridge and device locking,
liveupdate_reset_pending, and most of the finish documentation. If you
want to handle the other scenarios (devices that are never retrieved or
never bound, devices bound to other drivers, unbind racing with finish),
please add them in separate commits on top, each with its own
justification.

As for closing the session leaking it and leaving unclaimed devices
running: that only happens if userspace closes the session without
taking over all of its devices, and leaving the device running with its
memory still preserved is safe. Resetting the device in that case is
something that can be added later.

It also has a nice side effect: LUO calls can_finish() on every file in
a session before finishing any of them, so a memfd in the same session
that the device DMAs into can't be finished before the device has been
taken over.

> +static int
> +vfio_pci_liveupdate_attach_incoming(struct vfio_pci_core_device *vdev,
> +				    struct vfio_pci_liveupdate_incoming *in)
> +{
> +	guard(mutex)(&vdev->vdev.dev_set->lock);
> +
> +	if (vdev->liveupdate_incoming || vdev->liveupdate_claimed ||
> +	    !pci_liveupdate_is_incoming(vdev->pdev))
> +		return -EBUSY;
> +
> +	vdev->liveupdate_incoming =3D in;
> +	return 0;
> +}

The pci_liveupdate_is_incoming() check here is redundant with the one in
vfio_pci_liveupdate_retrieve(). Nothing can clear it in between, since
only finish() should do that (see below) and LUO holds the session mutex
across both retrieve and finish.

The liveupdate_claimed check is redundant too: LUO only lets a token be
retrieved successfully once, PATCH 12 prevents opening an incoming
device any other way, and the liveupdate_incoming check already prevents
attaching twice.

> +	if (!pci_liveupdate_is_incoming(pdev) ||
> +	    ser->cfg_size !=3D pdev->cfg_size) {
> +		ret =3D -EINVAL;
> +		goto out_put_dev;
> +	}

If the device isn't incoming here, that's a kernel bug. The previous
kernel only preserves the file after pci_liveupdate_preserve()
succeeds, the PCI core marks the device incoming when it's enumerated,
and only VFIO's finish() should clear it. So this should be a
WARN_ON_ONCE().

> +	if (pci_liveupdate_is_incoming(pdev))
> +		pci_liveupdate_finish(pdev);
> +}

Likewise, the device must still be incoming here, so
pci_liveupdate_finish() can be called unconditionally.

> +static inline void
> +vfio_pci_liveupdate_unregister_dev(struct vfio_pci_core_device *vdev)
> +{
> +	struct pci_dev *pdev =3D vdev->pdev;
> +
> +	scoped_guard(mutex, &vdev->vdev.dev_set->lock) {
> +		/*
> +		 * Complete a reset that finish() could not do, see
> +		 * vfio_pci_liveupdate_finish_vdev().
> +		 */
> +		if (vdev->liveupdate_reset_pending) {
> +			vfio_pci_core_liveupdate_reset_locked(vdev);
> +			vdev->liveupdate_reset_pending =3D false;
> +		}
> +		vfio_pci_liveupdate_free_incoming(vdev);
> +	}
> +
> +	if (pci_liveupdate_is_incoming(pdev))
> +		pci_liveupdate_finish(pdev);
> +}

VFIO should only call pci_liveupdate_finish() from its finish()
callback (see the kernel-doc of pci_liveupdate_finish()).

If vfio-pci is unbound from an incoming device before finish(), it
should just leave the device and its Live Update state alone. That's
fine: if vfio-pci is bound to the device again, the device is still
incoming and can still be retrieved. And once the device has been
retrieved, LUO holds a reference to the device file until finish(), so
vfio_unregister_group_dev() already blocks unbinding it like it does for
any other open device file.

If userspace binds a different driver to the device instead, that's
userspace's problem. The PCI core documentation already says it is the
user's responsibility to ensure that incoming preserved devices are
bound to the correct driver.

So I don't think the unbind path needs any Live Update handling at all.

>  #ifdef CONFIG_VFIO_PCI_LIVEUPDATE
>  	bool			liveupdate_frozen;
>  	bool			liveupdate_intx_disabled;
> +	bool			liveupdate_claimed;
> +	bool			liveupdate_reset_pending;
> +	struct vfio_pci_liveupdate_incoming *liveupdate_incoming;
>  #endif

With the simpler finish(), I don't think liveupdate_claimed or
liveupdate_reset_pending are needed.

PATCH 13 later inverts liveupdate_claimed into liveupdate_kept_running
and uses it to block dev_set resets while a preserved device is still
running. That can use pci_liveupdate_is_incoming() instead. It blocks
resets until finish() rather than until take-over, but since finish()
now requires take-over, userspace controls that window. If some flag is
still needed later, please introduce it once with its final name and
meaning instead of adding it here and inverting it in PATCH 13.
