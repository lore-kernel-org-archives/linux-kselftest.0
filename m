Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984950;
	b=AC6c4X+P9KgTh8u8fydiPR80LWKEcul/VMBXvb2rj6ZUBltK7k2fv0RBXnM6H6xaO9y1
	 oDQw4RrZUYnJwI6rwX666Bzl1Oxm66fnFeUB0L+k5935bxNQ08jY5myixdcR0deQaFtdk
	 swtF8VgypH4RWwLqjBy8gopq70bHSk+Uo/xnbN1RKA/QUNKvpZEq7JmLLyF12zBJblqxe
	 N8v2GF7kUj2DhKWZ74r8EvwblH9AWjTpysLAgk9sB8scEnTCulQrY+L7tgbpZcjm0R3HS
	 jswlb9hcUd0tzbxlV9TWh9tkWbL6lvqiz6ZBJXVEtYA3wdVJV2M+2yKzhpCvu3CJ9Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=D3IFWTA7ou2igClaDYSbsGTVSgzRWm+OXVAzSzama/M=;
	b=h2jAYXAOZxllsxTB+Nykxr+xp6w7PPYzwDXTO7nphvfNy14R4WlMcN/FWXX7QOyaWR71
	 0Vl2P3D2SV6OwefxCyN6qe2WmrvrfchiOmng/4JpniW2x0aJJjj0IHFQDUbMOqP3ojIlh
	 pWJLl446i01pZ7fk+THEE+HQvGfR7ELE3fnc+dgghiyWrSWGWiksCxylKrfRx7zoma6N1
	 KqXqDAQ/60R1HqxY1I6lcFjPKa07lltlcttSsPvHwZdxtahYm6C8V0gXJdp2fKPRtqjoC
	 v+6o6WZlsr255fFU4QtqJYiEgyg9Z5XPTHPgid/GO0VTQLpkjM3/bb80Opcb4rxvz9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nM+9DlRr;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB4B606A333
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 06:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB4B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nM+9DlRr
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ee254f6eefso48125ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 22:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794984949; x=1795589749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D3IFWTA7ou2igClaDYSbsGTVSgzRWm+OXVAzSzama/M=;
        b=nM+9DlRrSc+VH8u2ub3VdFxYKqtFiGInc/JZw8T73N7OAqXa44YAOksg8x7jKYkkuF
         yOwhOSelLbR3ciacjrREpqKFfhwK5r7r/lk1Uuk8xfjoCoH/lNZCee8mUf7VWzgC2Bpb
         tu4epm3+IlJ0ND44vTbQq5ss3XdQK9+PEMFYKwhU6O5AlBrQKFaQWO73Goy4f29mqVNF
         kOuWgxQrag89XkFP2hXkoPYCBeCCPY7IogUEhAraGQ1G4jNGdi2k90Bcg85Nv9zDziAx
         kxmiwEPofn984RQ60OOeumbDhK4iguBvHixxVMsJ3QgsnlDAMgH23D0cSlu0yXLJ2j5K
         Zj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984949; x=1795589749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3IFWTA7ou2igClaDYSbsGTVSgzRWm+OXVAzSzama/M=;
        b=VY4Yw8Xg5EVTJH6epSbsDd4U2eMwK9nDeMisdnLhWGkmSRXrED0hx1aKtxZ5zBZ0Js
         ZK+hog0j6xw1SSYmmB8Exkv+8k5sw1Itf4z5HjT8qbZqEwCcy7HwiSTsRpKD7BqvJCDl
         OPcZO+O2NPeHom4adPlFyk+3M/5PL8VcWOpresMsgZqipvQBS33JHgvi1xAqQYv+gCY7
         Xy05t6a4HHjUDhrEnUzUUFyjcKRHKDNrjaY/oa1EuDy+Aqk2WOoY3K+Ug4u7Pps6QhQq
         GalxxxnR8LRXviBG/8GYgaJDjIdkaW74Rth7av5oCUIntv4yPPw60zAfgqU13IVmAx/u
         dTyQ==
X-Forwarded-Encrypted: i=1; AL+hErEiJ2tRPKln+y+oh8JaPsy+60KJ7HefqiqjyIvFE5sALh6vh55nI2mZ34nXcPS4hJqFmB9tBJckSV0Gq3ASmRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E+i8ItN4kcRZtOVObR3swimMA9s5JzzbTqx0Rd4VsSCL5FcUR
	gbiyPuG2+M3ULFLbLChOFRZeSDblazBQAIZmHDb6PA65N7IeOqYZ6hZIoTDw0r1Q0g==
X-Gm-Gg: AZFdTZcphk/3ec4LCpyWNUozsDJrZGzCSj8/mJwXdsmKjJmT/fF9jAkTFlrPTX0m6xV
	trvyzqTDL6yJmF4Dz8HJqecOKtzHFqF5SkOEInIetg844rzd5lBczCF9vIVztp9IAtBOVIu9rkq
	37KijAqS8D9hI5PiZo7eVMgN4iWPZBJ7TnHi7ElbHxbIj4skk0UnvN+B/qFnatRHjn6LXM0lZLu
	POmO6NM3b0iRiddSRVmGb2X5mHAbQzv+G5gOLdScs8CBY8ADKTWc2yB9HGFAtQtS7fywKD6TIvN
	LNEiCDe2FqIsECjHwZQ+c43wyhcuWheMqRpQ3s/J8E1C4pZ/FpVwMj6W+3y37/Uv9Tkzb/1UDvM
	Q5xB2uQWABi4Xft1BPpCPN7j0Xn/vjtfhuJk6dUulnrEmdUzkM1XR4FMXoQMau7I236gPVVj+JC
	i5H0391JUsOHS6eydayDWYzvSSpEL6jFdUeNUBkKV5RJKduuPwezZ3Z7p+ni+wIuWiyvc9FA6nB
	HIDPi4WhEtzOzOcXod/6IcOrFhHzHTEaf5T1dK/dtuXyaiGmuI7Rpv04cSLdSoT5NmppwgIdnPE
	q52/VhKGTPIED3mxdUh+UQWvtebXgMkkr2rr/FVr2m3XfvOzdknE05+44/gE8XHr
X-Received: by 2002:a17:902:ce10:b0:2e9:73e0:2a6e with SMTP id d9443c01a7336-2eff9952062mr2886095ad.17.1794984948419;
        Tue, 17 Nov 2026 22:55:48 -0800 (PST)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm657169b3a.20.2026.11.17.22.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:55:47 -0800 (PST)
Date: Tue, 17 Nov 2026 22:55:44 -0800
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
Subject: Re: [PATCH v6 07/27] vfio/pci: Preserve vfio-pci device files across
 Live Update
Message-ID: <20261118064707.GD2250529.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-8-vipinsh@google.com>
 <au5VMy7zhOb65xIE@google.com>
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
In-Reply-To: <au5VMy7zhOb65xIE@google.com>

On Fri, Nov 06, 2026 at 10:35:27PM +0000, Samiullah Khawaja wrote:
> On Mon, Nov 02, 2026 at 07:36:36AM -0800, Vipin Sharma wrote:
> > +/**
> > + * struct vfio_pci_core_device_ser - Serialized state of a single VFIO PCI
> > + * device.
> > + *
> > + * @domain: The device's PCI domain number (segment).
> > + * @bdf: The device's PCI bus, device, and function number.
> > + * @cfg_size: Size in bytes of the device's PCI configuration space
> > + *            (``PCI_CFG_SPACE_SIZE`` or ``PCI_CFG_SPACE_EXP_SIZE``).
> > + * @size: Total size in bytes of this serialized buffer, equal to
> > + *        ``sizeof(struct vfio_pci_core_device_ser) + 2 * @cfg_size + @saved_state_size``.
> > + * @flags: Bitmask of ``VFIO_PCI_SER_*`` flags; unknown bits are rejected.
> > + * @saved_state_size: Size in bytes of the serialized &struct pci_saved_state_ser
> > + *                    blob stored in @data after ``config_map``, or 0 if none.
> > + * @reserved: Reserved for future use; must be 0.
> > + * @data: Variable-length payload containing, in order:
> > + *        1. ``u8 vconfig[@cfg_size]`` - VFIO virtualized config space snapshot
> > + *           captured during ``freeze()``.
> > + *        2. ``u8 config_map[@cfg_size]`` - VFIO capability map snapshot
> > + *           captured during ``freeze()``.
> > + *        3. ``u8 saved_state[@saved_state_size]`` - serialized
> > + *           &struct pci_saved_state_ser captured during ``preserve()``.
> > + */
> > +struct vfio_pci_core_device_ser {
> > +	u32 domain;
> > +	u16 bdf;
> > +	u16 cfg_size;
> > +	u32 size;
> > +	u32 flags;
> > +	u32 saved_state_size;
> 
> We will need space for iommufd_token when we preserve that, we should
> probably add it now as otherwise the compatibility would be broken when
> we add it? Is the reserved here for that?

No, reserved was just to align data[] to 4 bytes boundary.

Based on David's suggestion, I am gonna get rid of variable length
data[]. This whole serialization struct will be fixed length.

I think it will be fine to extend this struct by adding a new field at
the end of struct in your series along with updated flag when you add
iommufd support. 

iommufd preserved vfio device cannot be rollbacked to this kernel where
there is no support for iommufd preservation, so, flags will be correct
to reject the change.

Do you have some other concerns when yiou compatibility would be broken?

> > +	u32 reserved;
> > +	u8 data[];
> > +} __packed;
> > +
