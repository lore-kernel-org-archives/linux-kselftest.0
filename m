Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793809864;
	b=OiN9jNjPjLhnUIrXr9CmYgMDNDHNFPFe4c31KjxZQiYxI/cvuggrBI/3vD5jb8ilLmDh
	 2/woNip3JFPJAbWn3Os+9mTf3hhae/qiY0Zuyj6ntfIHT2639USk7kMKnuJnZR/t1fOyI
	 4eFubs8thwLg7nvBXoZjV4+vEhdngZ/LcGOcpwgai18MRJA5rEoFEbBdJO69U/erKZfNx
	 kLoeoT3O9j/KjGZ8kWGuSTtklfbXJ8QfoFWeDC9rawQl1Rrbx3xHlFVKL78aiGWrh46EK
	 q/WaSYgCSlrStVYPh2z53pUmff8yse7N/V6fEZ2ceh92utXU55HXw3bTnaYFA+DokIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NyjRNFEeE3nmYhNk8vaSRwH7n51z01zX9N7rg1mXM0E=;
	b=omdOLb7GzHtswWIEIJhzgFrSbK7aAzmgCY98AtPA5+W4chuBXLlv3UDp0VEpmSycwqNx
	 a1ZHthlKIIDO6SLD2rH4jT8wFocQAxqmhytuYG30o7u5Fk5KEeZyWo3oCtElEs5uVcTuT
	 fssm1Peiwdupvge3uH5b1cBLz8aTTfKAVVVi0W1rvxBqyPOVWgcyvsVP27DEykjxuadEO
	 CLN4evkZjz4t3vPOBJgRKAGn4GGL2YAcOVUSOkHlN27BFfVlhJELsuF3Jc03zo74Qhwgm
	 +2brmqfDGlv/fx04nKbi4p0lLok3fzHPSF5PYMiPlLuoMFUmuVp2mrGIxFeHL+DLYlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OdxaJB4E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04139606A31B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04139606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OdxaJB4E
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso12245a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793809862; cv=none;
        d=google.com; s=arc-20260327;
        b=YewH9p1Z4zw714S4+k5iyraDCHYp7BMkgQHJndqCA85eBgWkdtZwUr/HslEKmDWqN2
         i0nStMmXO9P257AL2LGPDYbGjD4Rx6TrRmLKh2hITXVQAHbXt3WDC6Fp+U8JcUno+TOm
         kFtIaCrl4OTDw8A5Qah2RpFV5/hbHKED6h/CKW3Xbp5VA8noeOhRDUd48Av6/ZSRVkzo
         fu3RysJ5ivKSSFGuIAIUK5DQbxLiofa7BiPF621aPVpexbJyY/BdcfnFaQzu+XQSU2ak
         XUN0vwfqSXuJbkr4tSLqGmxP2jRAPzi0VyWPFvdxj1LRz9AsJrDhQ4KiDHWY9makNdaS
         qmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NyjRNFEeE3nmYhNk8vaSRwH7n51z01zX9N7rg1mXM0E=;
        fh=xfg4nwzxGwdNLL9gW5F4KYh0fKrBgwwpBblCgr16Ll4=;
        b=f8Luoir+VBaS8+pllryXfXj9ae92cegZlHRQfO7zoMGxlJcuavXSt+P/tw0z7OczpU
         j4Eo6ZvnPI4tUnwHkAvFOHIecmGusJzGQDBWyEH5otTtUtcq7mE4lI0f26LDb2qcNDRd
         ljsrGTmOnDH/dAKaS7Vs2WVMZhhvjbisqFLYiG3CMehnRREQALrNo+e913KWPJx/37rc
         i4t8MPxWW/BB3lJjjJvzaVwckEYp8i5T5e8kT52isnB1HZijjIeaSV6/nBoT9133Ys0O
         DF+ohlo6wCCCO8qr+he7IsBCelbcmv9zak2hyiS72o7T+m7jCSV+7m5v+F17eiKUJG8Q
         Edcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793809862; x=1794414662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NyjRNFEeE3nmYhNk8vaSRwH7n51z01zX9N7rg1mXM0E=;
        b=OdxaJB4EnDuV4Hidcru6kJitmdCqTBvMRu1+/AxM8mR29nxWHSzf1TGPtq08Q/FyeM
         BqiQ5UWsRtRzykRX9dHeDcMk+iJsYuP0Kdmb/FZTBnu31lJYAGiEwb2qv4bwAIm5qaGL
         IAHFIVaAlQ6RQHbPq3KVPxtIMj+aqGjGQz6ZxauYWKTClbyEeG1+dphKJcJLdKuhRKSF
         u+0Tycys46CnLNZ0EObmu0V61pUHh0NUS71EPx9l3Ys2ZgQT5SXC5pwkna3a5yBsZ+cn
         xLnBUt5xe4nNJKHPDJ61g3w9xSDjOZtQz1k8hoiXujknHw3C9rCYb8zZUkZTFkbh4cdD
         ADBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809862; x=1794414662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NyjRNFEeE3nmYhNk8vaSRwH7n51z01zX9N7rg1mXM0E=;
        b=HP5fyW9SCyQTHZil7hqubHSJoYEvFDBjXyC4epBKfYEdFl43qLsttR197oBWkpXuJG
         lFcn2gxIEA8GzdZiHL7I4t/wSSYfLHs+yWZGoZkYZ5VTECxNRz5HaUoqQRP0tbx4OQPV
         7lxpYvPglbP/eMd2R7teyW9DS+yWx7OAtD/jN4VCGsqHaRR7yGtQ2SpKe8tNdsE3g/Bi
         Ikj+wor3HkSkMfxD2i7j0eovbsplk0Y/VdF3/7g98O/TThM7zluy1pwMfCVRsLdW2ySt
         18fXopyps1ITYC0hlIemfLVT4NFNmr4EMzciShfwPsY2XyNiTmYdNr/dsZpyB7M0ZMY8
         gs4g==
X-Forwarded-Encrypted: i=1; AKwUvBw80O05WuOPyfiOvPLxLUyOi9S/+thRma0Nw5Kb45YcGA0IZjvmkMTFjb81iq3Xx3fiU1Jcw2pYQiLjXQwysgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ej5D/1NmtKcVDsPa2EfJVlihp8gBTygvuYu1BLRxJGzNXsBS6
	+twjl9dUqnLI8tmvsUC07RBKYk7eXjrpUJxKGw4FYE9e+DVPVI6ZYothcUva78GWbSRg1BUIqyM
	fFZ0QxkF1M8YqXRG08afvRD8tAdsJ6IyGi2UwzIqt
X-Gm-Gg: AYBFou0E88R8GLams1R3Kiu/+WErdRoW0SYP5FWYUk+O1CYZ8tZDgkc2lJn+1Bt7Du7
	Is1WvyUA5KvXZyqQfgvf5C/lsXc1u0aVbJkLWuUOdKJA2eokpzK/wjmK8b8lzge8CBmhdbzAb5X
	M5szVCiOSAOln4M+a6iqCtOSWK6E7OuLcXGRJjOUmYu/y64jw7MnoT+Rntqb25vFl8cg0TUDlpY
	eQRBDKhc7JfqU6a3qag9pdwOos1sRou82h7LBM5oGYCyMacImVOHIq4F8Jz9uXufJ3vhmulMKAM
	LSeKr3g21MIxmxVxaTgLq/woxptMZQvjfloUiN4aeJwpAV1rXpa6l6qSvpm/Y4yfIULHoVTHwqk
	H6QFP6NgoTFw0ICDnRzsh0H4rsXH+611LRBTogas0ps0LBM3XyaxTc2E/XAPU8Yiaig==
X-Received: by 2002:aa7:d647:0:b0:6b4:629a:6352 with SMTP id
 4fb4d7f45d1cf-6b556219774mr85656a12.5.1793809861709; Wed, 04 Nov 2026
 08:31:01 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102230445.3993629-1-almasrymina@google.com>
 <20261102230445.3993629-4-almasrymina@google.com> <20261103102721.5d76c471@shazbot.org>
In-Reply-To: <20261103102721.5d76c471@shazbot.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 4 Nov 2026 08:30:50 -0800
X-Gm-Features: AclHuK-9GylVYqo-TMtSosiXb5Ui2K5HFBRmFtb7498f4BCUrjDMBqO1v8NJ_60
Message-ID: <CAHS8izPfFpNQWLFW4Xgf_=vF5j37_Z7XDcuPMJXHj-KQzo=8jQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] vfio: selftests: Test BAR write faults after clear_refs
To: Alex Williamson <alex@shazbot.org>
Cc: Peter Xu <peterx@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, Shuah Khan <shuah@kernel.org>, 
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Raghavendra Rao Ananta <rananta@google.com>, Vipin Sharma <vipinsh@google.com>, Alex Mastro <amastro@fb.com>, 
	Matt Evans <matt@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:27=E2=80=AFAM Alex Williamson <alex@shazbot.org> w=
rote:
>
> On Mon,  2 Nov 2026 23:04:45 +0000
> Mina Almasry <almasrymina@google.com> wrote:
>
> > Add a regression test in vfio_pci_device_test to verify that huge_fault
> > on writable MAP_SHARED VFIO PCI BAR mappings handles write faults after
> > soft-dirty tracking clears VM_SOFTDIRTY and downgrades vma->vm_page_pro=
t
> > to read-only via /proc/self/clear_refs ("4").
> >
> > Use vfio_pci_find_mem_bar() to locate a memory-backed BAR of at least
> > 2 MiB that is safe to read and write, and zap existing BAR mappings via
> > PCI_COMMAND_MEMORY before each sub-test to verify both:
> >
> > 1. Read-then-write fault sequence after clear_refs, exercising in-place
> >    huge PMD/PUD write-protection upgrade via wp_huge_pmd()/wp_huge_pud(=
).
> > 2. Direct initial write fault on an unpopulated BAR VMA after clear_ref=
s,
> >    exercising vmf_insert_pfn_pmd()/vmf_insert_pfn_pud() with
> >    FAULT_FLAG_WRITE set.
> >
> > Skip gracefully when the device has no known memory-backed BAR >=3D 2 M=
iB
> > or when /proc/self/clear_refs soft-dirty tracking (CONFIG_MEM_SOFT_DIRT=
Y)
> > is unavailable.
> >
> > Suggested-by: Alex Williamson <alex@shazbot.org>
> > Cc: David Matlack <dmatlack@google.com>
> > Cc: Matt Evans <matt@ozlabs.org>
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > ---
> >  .../selftests/vfio/vfio_pci_device_test.c     | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >
> > diff --git a/tools/testing/selftests/vfio/vfio_pci_device_test.c b/tool=
s/testing/selftests/vfio/vfio_pci_device_test.c
> > index 93c11fd5e081..323a316f59e7 100644
> > --- a/tools/testing/selftests/vfio/vfio_pci_device_test.c
> > +++ b/tools/testing/selftests/vfio/vfio_pci_device_test.c
> > @@ -1,10 +1,13 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> > +#include <errno.h>
> >  #include <fcntl.h>
> >  #include <stdlib.h>
> > +#include <unistd.h>
> >
> >  #include <sys/ioctl.h>
> >  #include <sys/mman.h>
> >
> > +#include <linux/compiler.h>
> >  #include <linux/limits.h>
> >  #include <linux/pci_regs.h>
> >  #include <linux/sizes.h>
> > @@ -102,6 +105,68 @@ TEST_F(vfio_pci_device_test, validate_bars)
> >       }
> >  }
> >
> > +static void zap_bar_mappings(struct vfio_pci_device *device)
> > +{
> > +     vfio_pci_cmd_clear(device, PCI_COMMAND_MEMORY);
> > +     vfio_pci_cmd_set(device, PCI_COMMAND_MEMORY);
> > +}
> > +
> > +static int clear_soft_dirty_refs(void)
> > +{
> > +     ssize_t ret;
> > +     int fd;
> > +
> > +     fd =3D open("/proc/self/clear_refs", O_WRONLY);
> > +     if (fd < 0)
> > +             return -errno;
> > +
> > +     ret =3D write(fd, "4\n", 2);
> > +     if (ret < 0)
> > +             ret =3D -errno;
> > +     else
> > +             VFIO_ASSERT_EQ(ret, 2);
> > +
> > +     VFIO_ASSERT_EQ(close(fd), 0);
> > +     return ret < 0 ? ret : 0;
> > +}
> > +
> > +TEST_F(vfio_pci_device_test, bar_write_fault_after_clear_refs)
> > +{
> > +     struct vfio_pci_mem_bar mem_bar;
> > +     int ret;
> > +     u32 val;
> > +
> > +     if (!vfio_pci_find_mem_bar(self->device, SZ_2M, &mem_bar))
> > +             SKIP(return, "No memory-backed BAR >=3D 2M on %s\n", devi=
ce_bdf);
> > +
> > +     zap_bar_mappings(self->device);
> > +
> > +     ret =3D clear_soft_dirty_refs();
> > +     if (ret =3D=3D -ENOENT || ret =3D=3D -EINVAL)
> > +             SKIP(return, "soft-dirty clear_refs unsupported (%d)\n", =
ret);
>
> My comment on v2 that this doesn't accurately test whether soft-dirty
> is supported, potentially leading to a false pass still stands.
>
> Please also have the courtesy to give reasonable time for review before
> a respin.  Personally I would expect self review and testing to take
> longer than the 80 minutes between David's feedback and v3.  Thanks,
>

Ack, my apologies. Will do.

--=20
Thanks,
Mina
