Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133203;
	b=koTyU+uAjayiRc7FQFrsSU//nFvDoduQr8+V9YNYgGEyYkBmaEJr0hBl154BEeQFI2UY
	 lMTx78Jq85fOYVx0TkOvi9SG69EbgwEDUe8T0AEXIPQElX7+SUmJri7LX+etjPp8caBkp
	 5Q/PE9/0G6nUdzMPuIk71e+9j7iw7oc0jl8+aA3hE6T7vqVDBCvA4qyuu3Q7Y/RMzxOCe
	 odbUq5X1W0C9G+AWA1ozN/gU64toZpjXGgduffbR4GZ1QtoyLf3I4hlMXA64PjqDyrPZT
	 hzxH6OUvHz/l778VX/cu3vOU2yM04qMc0chtJ21XZoiXDdkhVnZpmcjrPR3I4RRkv9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=8PsDwtqZ7ZOXHEr9V4C4myUyqMWkC/3w4Fd9za5pDc8=;
	b=iQc2rjZUESQOpFrZUtzLiqy4I/pNhxHQwT9cXLr0gy4a7kzj6MBJGcb8e1Sq4zbS+YTC
	 F4XDa2nIY8dhmOBLp4FNpABiQsCn3WxRoT9atahXzbokhdIwsRju0w9D3v78WHHmajFXd
	 z6HUPPu18nCf1KlAT+YyPcnwq1rhX7dZK5gTP0zcx2DWVU7qkSbVqGz01tElJpAIA57bu
	 cqpRE84UuOCqLRszEHWlQVlCGqWf5Vq/H8JCRFAexffOEhfSpvCMFj+VFDAExOdbjkQXW
	 iNBmYnGjZ0D1nwGRXRvtbyWUv0wLBbsguZLYV4DTCAkFI8AxXsVGkp7u/ybsE/jTvgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=atGBYYwm;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5514C60A2614
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 00:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5514C60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=atGBYYwm
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so183593a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 16:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795133203; x=1795738003; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8PsDwtqZ7ZOXHEr9V4C4myUyqMWkC/3w4Fd9za5pDc8=;
        b=atGBYYwmFdTs408RYeRx/rBd5NWMEB+wa4iq8eOwXZoi1PQZuEVmO6c9ZFxjFJILJ8
         8tFx4uJZ6XAt9i7Ltt7bGwkv300BwOkUf8RIEN21M1ZlrnrpWf19L50BxLsElGpm2fIm
         3KYHowzeJPcfLDaKycuVAsvRHhgVEHM3+ci6vsxlKvO9snTlzdE14WMQPwC8ZCEqPmiW
         xFXYRWayPRx7B8OcCRY84K0LTrF7flDFnzkPkM3VBq8aNOdkGvKPFipkvcbsC+9urxYg
         f88SGG2R+HqhnBlp9ZNosz5Ha9nuQbjEneT4pUsCJI3kqzO13XGtjCV0ZiXHcnThfxIp
         scvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795133203; x=1795738003;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8PsDwtqZ7ZOXHEr9V4C4myUyqMWkC/3w4Fd9za5pDc8=;
        b=GH1MTTH8k+MN223pJB9TrgT0VTBnDE4eeI7Bz5NH7+gLXl1HqjzqDrA2ChO4R72gMe
         EaOK9RQVI+tYWfGfgjjfMyDGizCLSkJsEidPEoaXxvcLgIuH8EEYCbYnsy3laM39dEvf
         4swaBEy94/mxTM5OWYvY6ujd9OftdsYWyudjbDNG63ATBngKDpqlYD5U7zCTs2fNQrWl
         vxhmPz3icl4IL6pW8dHDXBPVTWrWGGDlbKTXUwHm6TyMg/Ep2Nou8am3R3mBo1l2kHzp
         EgIOQkyInnhDDpF4xoS11qNd1EVQysVQiO/M1BG9Vgllip9zM+6Uy6xMg1HveVVz+i0I
         qRBQ==
X-Forwarded-Encrypted: i=1; AL+hErHypeW+axyeX9SDVVc+6ksVBMlFsbGIDacr+tgf1N5VIn+emW3bI+ZqI3Nq4ZbvMp5PXCkQp7AyInWCLvJLg54=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pGGp+nmQVOMECrv/pW4S+cDjC4GnPaAFFeWczG9XAiW1RME2G
	m7C4VeMqrW2Jo2MSeOK7QvcsBk0WgBsBzfjz6PHS5bsi39jb0Klibn531pvA8NGCDQ==
X-Gm-Gg: AZFdTZc2Y645CPWmKAI8zG2uP0AdRXFYc/h+X58ekAj8nTGH8gjmLHiQpa1Zz/pehaA
	vt0YrZWoKFTRef2BPCuL8vZKboYkp4h/RIqs2W1yX9mZsxY22dQ+bUGl8PngQc+w03johYbdaPB
	mPWeHkk90cgkHo5De/m7vk1gXAar3e2gqDhjDhCSJfxzMAZNNVDRkokidgcDroSAWbFDpXzOIXg
	xIt9psoA90ORony0Rg560lxteBW2Yj4zUOlCL+OKHdUSWHZp2v5zCW9DA2m8p5dDvHA/ilkIB/y
	EKSwNxyKTI7DEfPz+8eBRp4qKnNwhkqxAp/6wXRf7fapgIGLWPlylaDncxh7XQbeq5i5H4oBlfH
	BmvJRchilkIYsZ6teQ+aVUnbNCgEwh8KTVUL4hrdsd+VBfk9YIPuh2jMcIQ9zJS0ZSaGbltTRBn
	uGm5I0v+UrH60rrqHnIorgk8YsmL6niHSC7dkDTlm9gxTqqOuV0+b+h6pT0w39utLhg2oeuad0v
	aknnTkzfEKLvGp1bCdsHz/b464F8w5Wy/LXBZIIKfaOmpJrN3Uyzu4duRkjtZFQHsJwxsRSi2Gf
	vLk/zyqybWQjYmG5Qv9YFqb8h5SuXT/IV5WfeTY/UhqllAC+jWKyvuSEhLczTN2r
X-Received: by 2002:a17:90b:442c:b0:3b3:ab74:cc9b with SMTP id 98e67ed59e1d1-3b41c554624mr967136a91.0.1795133201767;
        Thu, 19 Nov 2026 16:06:41 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ff5d3easm328044a91.1.2026.11.19.16.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 16:06:40 -0800 (PST)
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
Date: Thu, 19 Nov 2026 16:06:38 -0800
Message-Id: <DMZLLYOVIGOU.1RXWYJN6UQTM@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, "David Matlack"
 <dmatlack@google.com>
Cc: <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <graf@amazon.com>, <jacob.pan@linux.microsoft.com>, <jgg@nvidia.com>,
 <jgg@ziepe.ca>, <jrhilke@google.com>, <julianr@linux.ibm.com>,
 <kees@kernel.org>, <kevin.tian@intel.com>, <leon@kernel.org>,
 <leonro@nvidia.com>, <lukas@wunner.de>, <mattev@meta.com>,
 <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 07/27] vfio/pci: Preserve vfio-pci device files
 across Live Update
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-8-vipinsh@google.com> <auzftbPFO_6XBYVw@google.com>
 <20261117220059.GA2250529.vipinsh@google.com>
In-Reply-To: <20261117220059.GA2250529.vipinsh@google.com>

On Tue Nov 17, 2026 at 10:44 PM PST, Vipin Sharma wrote:
>> pci_config_map doesn't need to be preserved. PATCH 14 already rebuilds
>> it with vfio_config_init() in the next kernel and only uses the
>> preserved copy to check that the two are identical.
>>=20
>> I assume the intent is to detect changes to vfio-pci's config emulation
>> between the two kernels, but the map isn't a good proxy for that. It
>> changes for differences that don't matter (e.g. hiding a capability or
>> learning the length of a new extended capability), which would fail
>> take-over and lose the Live Update on exactly the kernel upgrades Live
>> Update is meant for. And it doesn't change for differences that do
>> matter, like which bits are virtualized or writable within a capability.
>
> I think it does matter because reads and writes of unitialized
> capabilities in VFIO PCI config space goes to hardware directly. So, in
> the new kernel if pci_config_map changes it from PCI_CAP_ID_INVALID to
> others then those reads/writes can go to vconfig which will contain
> stale unitialized data from the old kernel's heap.
>
> This also changes behavior under a running user. Writes that reached
> hardware before Live Update can be silently dropped or redirected to
> vconfig. See the comment above struct perm_bits unassigned_perms{}
> in vfio_pci_config.c

That's true. Unassigned bytes passed through and vconfig is never
initialized for them, so hiding or exposing a capability does matter.
For example, 6467d0740a2b ("vfio/pci: Add DVSEC PCI Extended Config
Capability to user visible list") changed DVSEC from hidden (all bytes
raw) to exposed with a virtualized header. Across that boundary, v6
would have served DVSEC from uninitialized bytes in vconfig.

> How would a userspace opt-in? New kernel can change a capability visiblit=
y
> or virt and write permission of the bits inside a capability. Kernel
> cannot know if userspace used the capability or not. Creating a VFIO
> device in the new kernel by default results in a opt-in and currently
> there is no way for userspace to opt-out unless we add a new
> functionality where userspace can disable/enable features something
> similar to KVM capabilities.
>
> For now, I think we don't need to worry about it. As this version will
> be a base and if any serialized data with flags set received in this
> kernel will lead to erroring out restore.

We don't need an opt-in mechanism in this series. Detecting mismatches
is enough to make Live Update safe in both directions: if the next
kernel would emulate the device in an incompatible way, retrieve should
fail.

But an opt-in is needed to make rollback possible once vfio-pci starts
changing its emulation. I imagine something like a VFIO_DEVICE_FEATURE
that userspace can use to enable new emulation behavior right after
opening the device, with the enabled bits recorded in a field appended
to struct vfio_pci_core_device_ser behind a required flag. Devices that
don't opt in keep the baseline emulation and stay compatible with older
kernels. But that can come in a follow-on series.

> In the next version, I will not preserve pci_config_map. Hopefully,
> anyone changing VFIO code doesn't forget to update flags if they change
> capability or permission bits (I will write comments at appropriate
> places.)
>
> If we want to be very careful, we can do two things in this series:
>
> 1. Create a per bit valid mask for the vconfig and compare this between
>    new and old kernel during restore. In the new kernel, VFIO then takes
>    each bit from the preserved copy only where the mask says it was
>    valid, and keeps its own freshly initialized value elsewhere.
> 2. Create a hash or store virt and writable bits in config space.
>    Compare it with the new kernel.
>
> Both of the above combined will safeguard against forgotten flag update
> in the code.
>
> We don't have to do it but it safeguards against mistakes. Let me know
> what you prefer.

I think we should do both in this series, as two per-bit masks over
config space, preserved in place of pci_config_map:

 - virt[]: the bits whose value vfio-pci keeps in vconfig and returns
   instead of the device's value. This says which bits of the preserved
   vconfig are valid.

 - write[]: the bits whose writes take effect. For bits in virt they
   update vconfig, and for other bits they are forwarded to the device
   (possibly after validation). Writes to other bits are ignored.

The masks should describe what vfio-pci actually does rather than copy
perm->virt and perm->write.

vfio-pci can keep changing its implementation in ways that don't break
Live Update, e.g. start intercepting writes to a register to sanity
check them before forwarding them to the device.

Something like:

  struct vfio_pci_core_device_ser {
          ...
          u8 virt[PCI_CFG_SPACE_EXP_SIZE];
          u8 write[PCI_CFG_SPACE_EXP_SIZE];
          u8 vconfig[PCI_CFG_SPACE_EXP_SIZE];
  } __packed;


[ Note: I'd probably store virt[], write[], and vconfig[] on their
  own folios to avoid multi-order folio allocations, but I am embedding
  them here for simplicity. ]

The outgoing kernel computes virt[] and write[] through a helper in
vfio_pci_config.c and saves vconfig[] during freeze().

The incoming kernel computes its own virt[] and write[] masks and
requires both to match exactly with what's in vfio_pci_core_device_ser,
otherwise it fails the retrieve. On take-over it uses the preserved
value for bits in virt and its own freshly initialized value for the
rest, like your option 1.

I'd store the full masks rather than a hash, so that a mismatch can be
pinpointed.
