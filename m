Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793666900;
	b=HSeVLSnoDFhNKuPiABMwPdd2SGEZvEjPX/mkaNSJMzXizfMhYlygg4XcwVWbtXnT/Dwv
	 dfEnkZFLipKyYJW6YSHysKhcckzfo8IN1Mk1culYCAX/8IVbl0ngbLS24mHw96CBfPExB
	 jb+9aQrhUnI5XrG5v9zJtqrdAlrJ1LsFzcS4wspkPp4k3wtyHVnPap7+nfztaAZE7Exio
	 r05opHw+R6PIyoogc4Mv28ZvxyBFjTPIDVsBifOembz+DfbmoDUtMSlGu+fCjai7rqPx0
	 p8+1lw6ptfsVKFVG/LAObdBvaa81TIeRz966tikil0zV8yQqojRZRkTUOt0NavLQRNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+4komcI6Fb95Hps7JFHEwewY0Kj5nDX9+u+4ZAxqqJ4=;
	b=T2SP/vFw4Ls9SruSNtCkb/lCJRm7n2P8dEFqf8oBGhRfRjbFYRFQ8E+xvboMePDSBhrf
	 deg8AaMkj3mo91mFVyC9uL70a6gkE/3ZqVhAcX9A5FqsFRMPwO+ZqK1mu5v8kIiqrr+6W
	 w4TBF1fPfgwrZvkyPT2kIogqWWEauFwju2du9sk7sIiSe7U+nNybms+hoMftwJBvTfV/g
	 XBQi6oP/Clz6/mfuZHMbjr3yaYEkTn7xnt6ECBMPLMaTTfCDJnAWhbD0BYTPgLOxIw2s2
	 xy4CDJeAtFcUhDaOvkBBvFwGvORKviLrrKonOoXyZPCw6s4Erqrpcx7Nqc6YR8KUhCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gqJd9S+2;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50963606A32C
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 00:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50963606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gqJd9S+2
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e977109392so24823835ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 16:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793666900; x=1794271700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4komcI6Fb95Hps7JFHEwewY0Kj5nDX9+u+4ZAxqqJ4=;
        b=gqJd9S+2VdtxID87TVS8rub7eP/F+fyD4hLRhr8e3pyxoLIAnANscySrmXKiW8WJwY
         IZG0jUH9zGQi7xNVEDZta2cmM7rPFbTHVaRFvSfPY/cGQtg6Y6Ah4OhGSEMX+ptypDwQ
         I979HJSwPFkp6WCOLf4FEvkLFLPn6wTzjpZZGK79PdK26ojKvRC4FQH5MS2q7GuMDbG1
         3CVQAtW0iBcNPbtpnHC6vhDIbNHjfYgdoDy7OQoGZlg5m19jrUy2Q06EtNH6ggNOJXZO
         oCgrXl7l3xd/ntZpp2CpqphAu49EdMInLRRozvQb7Z15Fxs3cqhXWmJeLg/kc8P758og
         PpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793666900; x=1794271700;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4komcI6Fb95Hps7JFHEwewY0Kj5nDX9+u+4ZAxqqJ4=;
        b=xQ15Y4f0kBDQbYZV+OmHIOWIfLFKOv0YfuLGo8BDrdF1aicc8XCOIRyikFJM0Ae5KE
         aaHNq4HuQTDyNEMpXx+VM+z+XvBRNGTGPjZgsCAfzT3DjrPHR2r0/IEH8+FviyvWWFRY
         0ExBog7Kgc+1Lg9i1HlGfdvNPzu3bOCTIwh2PuqI3s4XhZ7EWgAGC+Dse4m9zoVAY0DH
         jBk9+HtwjRqHCPtjH8GOBhLGwR1NwSvnyD1mLVfrvMNxeBKOPIE5/AE/l+J6GdiaVkv8
         kVV2YhIFXbN5xfjFMaJStQ1Om56V9QeAsr9fU0cduBzEAZwCiB1EkGfA9W3iBj7hEzR4
         TUZw==
X-Forwarded-Encrypted: i=1; AKwUvByHtHjHmbpoFsp0BV6d+Fz1/MasVG3Kr/l+EVU2BEhmt84Sk3xL0YfAMhdaCykTHPYfMtnBjcRXZETu2qfaP6g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VWZUUR+lUXD2D7l2me4P6M4ZbcPCx0+/NQEt5tmh7Wg/3+kv9
	N/xkkhxV25ynB3EKquNHkuoMlwH3mht2BFmRpLlg/ni8q4655Nj90iTS1+PbynSyrg==
X-Gm-Gg: AYBFou3nXsXxb4s6QiCWmdxilRdqDIsuTQ950tD7lIYspzQ041Rc5atWV2BP99/rsWG
	UBRwExb2N8mpfj5Buw4eYVtmYiAJHkrRq+2l0nNkh8e7cOnljmNdC5Xj/Ni2QCUzc543TwY5QZU
	joaF9w1mwMv6tk4MaC7Z311H7LOyuJk4pDaoQG6CoMmGadB0sDC+m+CHUmRt5DP0RqYOj60g4R+
	4jG8YYnglWzItIXnVqu+KQWXy2C/08tX4ZhebMm9Bq+CnBXqklJoCKptqIhBLL5o0eRNO55dJV5
	MDRoyryPUrzKwv8cTsoxDImFu85GpxZvZkjeIgcs13o7ChXOiWCi5XZOQHblNlszPNndMqTaWDg
	JE6MvwAIjwW9adQkeLMmMwZ9wYEm0PITaJVzCJslKZ8Gks0Aiedlv6kyb/XmWbXs/KR0l9JVbNy
	pBJd2YL8WAeCFAiez+j3Ithkx3VVP8Ly9hJy41jC3lsW1IBvXBI3XRJOf/dHb8byuD7oF8xLfU3
	ftMxRo17RHbhtXW/wp/VEXTEXf1Qp/uvCYn0JcKCJdbtfHTpVkGTjMcDNJRhJ4i2u/Etp/r0Mri
	soIb27YpRABr2tpm6YN6rJ1VGrFgHfm7uUuae8tV3o49YZGcitaglnMGnE/G3le0
X-Received: by 2002:a17:90a:e7cd:b0:3a0:8050:2ec9 with SMTP id 98e67ed59e1d1-3ae897ccf9dmr9145000a91.16.1793666898905;
        Mon, 02 Nov 2026 16:48:18 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1454586a91.13.2026.11.02.16.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:48:18 -0800 (PST)
Date: Tue, 3 Nov 2026 00:48:14 +0000
From: David Matlack <dmatlack@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vipin Sharma <vipinsh@google.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, linux-mm@kvack.org,
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
Subject: Re: [PATCH v6 05/27] PCI: liveupdate: Add helpers to preserve struct
 pci_saved_state
Message-ID: <aukvTvnfyAvahb51@google.com>
References: <20261102153656.1431701-6-vipinsh@google.com>
 <20261102230624.GA1038787@bhelgaas>
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
In-Reply-To: <20261102230624.GA1038787@bhelgaas>

On 2026-11-02 05:06 PM, Bjorn Helgaas wrote:
> On Mon, Nov 02, 2026 at 07:36:34AM -0800, Vipin Sharma wrote:
> > struct pci_saved_state is private to the PCI core and its in-memory
> > layout is not a stable ABI. Add helpers to serialize it into a
> > caller-provided buffer and rebuild it in the next kernel with a stable
> > struct pci_saved_state_ser ABI. Using caller-provided buffers allows
> > drivers to embed the serialized saved state directly in their own
> > KHO-preserved data with a single allocation and lifetime.
>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>

We discussed this patch off-list this morning. I'll sharing the context
here since you were not there Bjorn.

The ABI added by this patch is not actually stable across kernel
versions.

struct pci_saved_state_ser is stable, but the contents of each
capability entry are not:

> > +struct pci_cap_saved_data_ser {
> > +	u16 cap_nr;
> > +	u16 extended;
> > +	u32 size;
> > +	u8 data[];
> > +} __packed;

@data is a memcpy() of the per-capability save buffer, and the layout
of that buffer is not defined by the device or the spec. It is whatever
registers that capability's pci_save_*_state() function happens to
read, in whatever order it reads them. 

None of that is described in include/linux/kho/abi/pci.h, so this patch
implicitly turns the private layout of every capability save buffer in
drivers/pci/ into Live Update ABI. Someone changing
pci_save_pcie_state() or pci_save_aer_state() has no way of knowing they
just broke Live Update compatibility.

And these layouts do change. Commit 898585172fa7 ("PCI: save and restore
PCIe 2.0 registers") grew the PCIe buffer from 4 to 7 registers, and the
AER, LTR, L1SS, PTM, TPH and DPC buffers were all added over time.

This is the problem I was trying to solve with:

  https://lore.kernel.org/linux-pci/20260924173501.856380-1-dmatlack@google.com/

That series replaces the per-capability buffers with a single store
indexed by config space offset.

Where a saved value goes is then determined by the device's config
space, not by the kernel that saved it, so the PCI core can change which
registers it saves without changing what the data means. Serializing
that for Live Update should be trivial (a size/flags header plus the
bitmap and the values). The cross-kernel compatibility question also
becomes explicit and per-register ("the previous kernel saved offset X
and this kernel doesn't restore it") instead of a size mismatch on an
opaque blob.

Bjorn, this is also related to your last comment:

> I think it would be helpful if the names of "config_space[]" and
> "caps[]" hinted at the connection between them (both are in config
> space).

With the offset-indexed layout the two are no longer separate. The
header and the capability registers are all just DWORDs in the same
config space map in struct pci_saved_state.

So I'd suggest that we land the saved state series first and then rebase
this patch on top of it.

I can send a v2 of that series this week that addresses Josh's feedback,
rebases on top of the PCI Live Update v10 series, and includes the
serialization helpers. We can use that as the basis for the next version
of this series.

Thanks,
David
