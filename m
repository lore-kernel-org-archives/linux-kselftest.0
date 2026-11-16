Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862227;
	b=WUIbVehIjdXxqA+Jmgq2jr40uaT8lt1s53f/V5EF1cGNXDIMWhE/8lOVZe3qNHerxqFS
	 CmCkdvyG6OzIYlITDc6wnSHBFxa6SrMCJsFqywaXjCJpdnKeOaKMYIO5UIhOyYTsF3CEU
	 7a38Qd7C6mDzfDg4HIpjRJPOjq57NuTrZG7oTLkMDNF+ILeqgI4bTeqH4z7FcD0nLslQ4
	 uwSFCyHnI7ug82xkPiOOl4krKKW7d96XhjirkmQD4dR7g+4X7YwCQXzkmUchzSK2wJAIW
	 osbia5oYeuxrJ/oKjEaBMotC9wnclHB+FeFhQ6BRJw2ZQaXtbPiIFlM0Be5A/7qxW1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=itpoRBF/1k6lXJt+7gBQZf0XsZd0eRgpwFhim4ck9gw=;
	b=z9vQgsUDg5m+BMQEFHbhFzEqxDbLC+dI4I5QN5FXRAA8VBxb9tfWHMeQTwaM+x6DRrUd
	 ppEn/Y5m60EjGfQZAWya+a9ADYoqF6PisAIF6/5ufjI7vPfp6YceZPbvWfNZRX1l7+s0i
	 e+BSjh04tEicoHx0KXxZ1daAEQlByhC7fdxgSAtTcptFb2bHQpMc8peZ03Jq6KdbbKEha
	 ZRdtrrSwipe9nZ7iVTpnJyBOZWKE14T29cMOKaXCjmb2YzHYiprwTjcMvKoQsFdQDIt4m
	 SnsR1Zwoy6fhExF8jn1IqRiSQTpHMGlKMJh6T3Prn/0C7OlrvFoukCPtVd+dtRSvlsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dwg3aB5j;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56145606A329
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 20:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56145606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dwg3aB5j
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso1662167b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794862226; x=1795467026; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=itpoRBF/1k6lXJt+7gBQZf0XsZd0eRgpwFhim4ck9gw=;
        b=Dwg3aB5j/PWPJaLku3L1tUZkBCUnHRSbqBmF3A4BQGz08Tq28ncBeYQbG/So5ZsN+h
         NojTXp3MVD/ZSvcPTtCd3tmxdm9+qM5KoPTSkI+CLdlA+txelMPpn8SZybXuEjrLBIaV
         YowodJucWxxle8t1RD08hQ061mcCTFHAAfcigRC9haQR8iCHdz2xN+lplQeaY4S1h8P2
         rfyRhY/H0SQx7FRPTAB/RKZgvSK1AUAlv4LwLdvUsGDJp95HEf/Kqijr56sClMPAuG4N
         jqnkIcUVMlGE6mtQ8PhlTITjVU0VqdOlyT+0EtqE4DK5p65P3wpVCNkS6l7wiGteLlYw
         f3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862226; x=1795467026;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itpoRBF/1k6lXJt+7gBQZf0XsZd0eRgpwFhim4ck9gw=;
        b=edYypiEE96GcWBmpQ4yUTXoRxc4787fi0nKQMfRyO3Q397UYyDirLJ9komAYZBZ48X
         ED2Q0ygE2QBEHwbWk4GnFRqE1UxHPt3j8rhchDtDEwpDuvp/uIyunetgRwfHgje4m3nZ
         NG2SOn1yZMmgUCazFjt9baeqBbt70V69ocLGNH5t4bhIcC+fAjxCw43My4rdckake4z9
         t3bXK7EJTeY3MaQhMzn0CFWsZ2vC0F9r0wTCfSKwDfcq/K0fUnBjJf12+3G3SS4D0Sdc
         ks+AyXj0CGC9dnZZnHXBMBU6lJP+7ysP/LbSs+J1u/TsfBVA7d3GMRkCvQPcyKTXyOWo
         VMdA==
X-Forwarded-Encrypted: i=1; AL+hErFteHSztn+MN0RjnKLW4RilsC8eqR0FysuQ4oPQNb1kE4DpsW1MiMNY7KDaFU+0SalrPqP0gpkONZOkp3gUjmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Av+6qqcV1+GvLWQqDd6NqrqUhHFM/7l+n0yAtD7Yd/aY5XAub
	J59Yh2pO4Lf2Nvxxc2i7+48qA0IClJgsYAtCGqVXtoW2weh2V9zxgrH955B2KIcaLw==
X-Gm-Gg: AYBFou0wtZ64DSb1wghTM8dMOKO9SASsEcF3S4YWcimwT0Oigpl5C1NgxZ9Q5Abh+Fb
	BeswOomUoblth1GgX0n7K4gY4myXfNtJsY5N/EFwMavroUpNimF6L1QnWSfsfBe7AN6E+c4SZdl
	G62CtuQ6NIbbyUXNzwWlalPyYz13D3K+qrgMybDVJdJ4D3J4pShN3c/AGqqbJz7xfhzwHjSrQWO
	izTzekTas8Bx+BNeEvT5FPlrv1kq8i2xGf8X0p5vyqAzy030xDMxn1AdKHSoiZaZLDfmfUDK8+D
	/K+g2EMOQGCxfWGFaZzsykdjkrMRrzTGpHe15y+DYQ9oqg7ARFBCFX8iyZLBOIvu8VQQkKTlmhl
	gytMadhP5BOyxYLPuYnNgPyJpQRqu+rTFYj2qKTA3FK2OI9ahyyq3kK+jFsbQ+c8z+PCV266D9v
	55SZwGtxOT48mgSZ+3kRboHTnRMpNprZEc154vSuncNVtGc2bMIdjX444XV56K08jiIklrjCoKy
	umCI5OJjJGNIIt0EQmcOgf94xrxOR8XSTm/VyqtsQQPVQ28mPToHLdMcxl7Z6RjcB1ijEFnSBXG
	mEAdlex42VWE8EKv/uVaIiztN/L16QqcLwCADd42+VDxzQfBFUA2ybc/79rJWj7G
X-Received: by 2002:a05:6a20:ef03:b0:3e2:4350:1528 with SMTP id adf61e73a8af0-3f7a51ba2ffmr9092719637.7.1794862225898;
        Mon, 16 Nov 2026 12:50:25 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18c847asm4527944a12.28.2026.11.16.12.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:50:25 -0800 (PST)
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
Date: Mon, 16 Nov 2026 12:50:24 -0800
Message-Id: <DMWXK2VTL3XP.MWW7ZG7Z6HUF@google.com>
Cc: "Jason Gunthorpe" <jgg@nvidia.com>, "Alex Mastro" <amastro@fb.com>,
 <dri-devel@lists.freedesktop.org>, <iommu@lists.linux.dev>,
 <kvm@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-pci@vger.kernel.org>, "Alex
 Williamson" <alex@shazbot.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Josh Hilke"
 <jrhilke@google.com>, "Kevin Tian" <kevin.tian@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>, "Logan Gunthorpe" <logang@deltatee.com>,
 "Matt Evans" <mattev@meta.com>, "Matt Evans" <matt@ozlabs.org>, "Mina
 Almasry" <almasrymina@google.com>, "Shuah Khan" <shuah@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, "Vipin Sharma" <vipinsh@google.com>
Subject: Re: [RFC PATCH 0/7] vfio: selftests: Add peer-to-peer DMA selftest
From: "David Matlack" <dmatlack@google.com>
To: "Samiullah Khawaja" <skhawaja@google.com>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261111192411.4133780-1-dmatlack@google.com>
 <avYjFfqr3T/U7lvn@devgpu015.cco6.facebook.com>
 <DMTK99TDM9AM.SAM3Z4COP9WS@google.com>
 <20261115231946.GB1239159@nvidia.com>
 <CALzav=efnA_ABCZVicX0QeTmHknaEbMeWOy8cS+zHYVhm5z+iw@mail.gmail.com>
 <avtI--OIZu5E5sma@google.com>
In-Reply-To: <avtI--OIZu5E5sma@google.com>

On Mon Nov 16, 2026 at 10:24 AM PST, Samiullah Khawaja wrote:
> On Mon, Nov 16, 2026 at 10:02:56AM -0800, David Matlack wrote:
>>Looks like GPUs and NVMe can do both as well.
>
> AFAIU the memory BARs for GPUs would need initialization. The internal
> VRAM needs to be exposed (mapped) to the BARs.
>
> Do you think we should have a P2P device "setup" step that can be
> implemented for various types of devices?

Yes, I think we need something like that.

I've been prototyping a new optional op in struct vfio_pci_driver_ops:

  /*
   * Set up a range of device memory, accessible through a BAR,
   * that other devices can target with P2P DMA and that the CPU
   * can access through mem_bar->vaddr.
   */
  int (*mem_bar_setup)(struct vfio_pci_device *device, u64 min_size,
                       struct vfio_pci_mem_bar *mem_bar);

vfio_pci_find_mem_bar() falls back to calling it when the device does
not match any entry in mem_bar_descs[], sanity checks the returned
range, and then runs the existing memory verification on it.
mem_bar_descs[] stays around for devices like pci-testdev that need no
setup.

For NVIDIA GPUs, I had an LLM work on it and the setup was simpler than
I expected, at least on Blackwell. BAR1 comes out of reset in physical
mode, where BAR1 offset N maps directly to VRAM physical address N
without going through the GPU MMU. The LLM confirmed this on by writing
VRAM through BAR1 and reading it back through the BAR0 PRAMIN window
(and vice versa) at offsets from 256MiB up to 178GiB.

The nv_falcon implementation only has to:

  - Wait for FSP to finish booting, which takes a few seconds after the
    reset VFIO does when the device is opened.
  - Make sure BAR1 is in physical mode.
  - Return the range of BAR1 that maps VRAM (the size comes from
    NV_USABLE_FB_SIZE_IN_MB), staying clear of firmware reservations at
    either end.

With that the P2P test passes with a ConnectX-7 (mlx5 driver) as the
initiator and B200 VRAM as the target.

A couple of open questions:

 1. The prototype allows .mem_bar_setup() to be called before .init().
    That is enough for GPUs, but as Jason described, mlx5 device memory
    has to be allocated from firmware, which needs the command interface
    and therefore init(). Supporting mlx5 as a target would mean running
    .mem_bar_setup() after .init().

 2. nv_falcon does not support Falcon DMA on Blackwell yet, so a B200
    can only be a target for now. That requires a driver to be able to
    probe a device that cannot do memcpy. I am not sure I want to go
    down that road.
