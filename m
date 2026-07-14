Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542B33C13E2
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 12:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031425; cv=none; b=R/zCHM+jsv8d/VRpWYavfuQiXg/S2eL3x4KvxkHc5Urt0nItCNFTXq/rv7KRlTA/yZmwQw/0N3kslMcG/UZEXBEFCFWs561sfZbU6BRLp9uSWa/FKjSVL384BWWaZLcH4dI1wUqzNE1a3Y9yKPSTNzyVwV2QSLR4G21kGPcZ8Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031425; c=relaxed/simple;
	bh=4FOmCbRkjtyqUknu75vO3Enpin5oL1Kk7tq0fO5zQWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AuoqVScI4xnxp1bU4Ynhp7JbAObiev3e9N3GA/Ghmj9zDqeZSlmeIpqokd3C1ddsob6cIIZe4XY/Mc0EegIzo+Q2yl+CeI9e44aN5sq5xgh61doaa1iY5jsQBXZCBSN2u8of8xtP78FYwiLQb/7dAHWOhgPkadAM8eCtQQ4MfUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daQnjhci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daQnjhci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313651F00A3E
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 12:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784031421;
	bh=ObYWkLNfQi85p38uahLx6yranNyzKYkaSbUyvi+K6ZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=daQnjhcicbJzzzDaAuFYC6b8ZcYAs9CAE+dZjOfq5dbSgkVQwiNPgO9MRAxwXqH3M
	 frDdW60C9rIy4AQot91BiEaZCb0SCnuGD61TraVaNNcc5VsahjP/J8WpPGZthzFyE3
	 wqHvAQmiLyFXK8cFDxO5QeMIdXDFc7fWF/UcVBYpg8XrvEZIMixtV9kxHwgSz4HZvR
	 gJzt3e4715WhNhMLe2N7EbbM8orlnN7teYudfE692wxRhsI1aVImOeJaucjq2DZ2/t
	 QC7jxAMJ+OrLhzuv9LF7i3GZ9sqF1S0C/Ie48KpNLLEiDr5Gb8IRo9oVZx9NVlnO7b
	 zZFswpfh9K8pg==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so1623815a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 05:17:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrPEfF/zzBoPGsskS0772ghwgLvqFhtKMj8nQ0JiJ3yEwy4zx0vW9KWs+UyKNoOqMz2o20F6OqQwNHq4Yc03Yk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Vr57HT3UzBFAROxzj0iTITiZQj1h3FjhijfUq3+kMpKR1te6
	ukQ4UKshVHBtJvQI5/hdZjk1/XvYrCGHJW7369iSSHcjixPL0SBAbF05c3LTbG4hicvVhM16mYH
	wtIU3s8c8UXwnEwy5AKnK55c3dCrdEHw=
X-Received: by 2002:a05:6402:5187:b0:698:5610:76e5 with SMTP id
 4fb4d7f45d1cf-69c5ef85585mr5895270a12.6.1784031419744; Tue, 14 Jul 2026
 05:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601092823.110362-1-dongtai.guo@linux.dev>
 <20260601093930.112758-1-dongtai.guo@linux.dev> <2vxzjyqzj8s2.fsf@kernel.org>
In-Reply-To: <2vxzjyqzj8s2.fsf@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 14 Jul 2026 20:17:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5B6Mj2-AffkstJ4f8EEmvvPOGXoDy2QNudKD2kSz2XkA@mail.gmail.com>
X-Gm-Features: AUfX_mxp11E4giDW39QHMMI9j_IZOTy-7xjXpv5wTuK8FeqnLx4XCv9zSCzZnnY
Message-ID: <CAAhV-H5B6Mj2-AffkstJ4f8EEmvvPOGXoDy2QNudKD2kSz2XkA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] LoongArch: kexec: add KHO support for FDT-based
To: Pratyush Yadav <pratyush@kernel.org>
Cc: George Guo <dongtai.guo@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Shuah Khan <shuah@kernel.org>, 
	George Guo <guodongtai@kylinos.cn>, WANG Xuerui <kernel@xen0n.name>, 
	Alexander Graf <graf@amazon.com>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, Kexin Liu <liukexin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Pratyush,

On Mon, Jul 13, 2026 at 9:53=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Mon, Jun 01 2026, George Guo wrote:
>
> > From: George Guo <guodongtai@kylinos.cn>
> >
> > Enable Kexec Handover (KHO) on LoongArch64 for FDT-based systems.
> >
> > - Kconfig: select ARCH_SUPPORTS_KEXEC_HANDOVER for CONFIG_64BIT
> > - kexec.h: add fdt/fdt_mem fields to kimage_arch to hold the KHO FDT
> >   kexec segment virtual and physical addresses
> > - machine_kexec_file.c: add kho_load_fdt() which copies the running
> >   kernel's FDT (initial_boot_params), appends linux,kho-fdt and
> >   linux,kho-scratch properties to /chosen, and loads the result as a
> >   kexec segment; called from load_other_segments().  Returns -EINVAL
> >   when initial_boot_params is NULL (ACPI-only boot) since that path
> >   requires separate handling.
> > - machine_kexec.c: before jumping to the new kernel, update the
> >   DEVICE_TREE_GUID entry in the EFI config table to point to the KHO
> >   FDT segment so the second kernel finds it via efi_fdt_pointer() and
> >   early_init_dt_check_kho() calls kho_populate()
> >
> > Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
> > Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
> > Signed-off-by: George Guo <guodongtai@kylinos.cn>
> > ---
> >  arch/loongarch/Kconfig                     |   3 +
> >  arch/loongarch/include/asm/kexec.h         |   4 +
> >  arch/loongarch/kernel/machine_kexec.c      |  27 +++++
> >  arch/loongarch/kernel/machine_kexec_file.c | 118 +++++++++++++++++++++
> >  4 files changed, 152 insertions(+)
> >
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index 606597da46b8..d494418545f5 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -684,6 +684,9 @@ config ARCH_SUPPORTS_KEXEC
> >  config ARCH_SUPPORTS_KEXEC_FILE
> >       def_bool 64BIT
> >
> > +config ARCH_SUPPORTS_KEXEC_HANDOVER
> > +     def_bool 64BIT
> > +
> >  config ARCH_SELECTS_KEXEC_FILE
> >       def_bool 64BIT
> >       depends on KEXEC_FILE
> > diff --git a/arch/loongarch/include/asm/kexec.h b/arch/loongarch/includ=
e/asm/kexec.h
> > index 209fa43222e1..adf54bfcdd49 100644
> > --- a/arch/loongarch/include/asm/kexec.h
> > +++ b/arch/loongarch/include/asm/kexec.h
> > @@ -39,6 +39,10 @@ struct kimage_arch {
> >       unsigned long efi_boot;
> >       unsigned long cmdline_ptr;
> >       unsigned long systable_ptr;
> > +#ifdef CONFIG_KEXEC_HANDOVER
> > +     void *fdt;              /* virtual address of KHO FDT segment buf=
fer */
> > +     unsigned long fdt_mem;  /* physical address of KHO FDT segment */
> > +#endif
> >  };
> >
> >  #ifdef CONFIG_KEXEC_FILE
> > diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/ker=
nel/machine_kexec.c
> > index ad27fef098f1..98529c71d001 100644
> > --- a/arch/loongarch/kernel/machine_kexec.c
> > +++ b/arch/loongarch/kernel/machine_kexec.c
> > @@ -6,6 +6,7 @@
> >   */
> >  #include <linux/compiler.h>
> >  #include <linux/cpu.h>
> > +#include <linux/efi.h>
> >  #include <linux/kexec.h>
> >  #include <linux/crash_dump.h>
> >  #include <linux/delay.h>
> > @@ -289,6 +290,32 @@ void machine_kexec(struct kimage *image)
> >       pr_notice("We will call new kernel at 0x%lx\n", start_addr);
> >       pr_notice("Bye ...\n");
> >
> > +#ifdef CONFIG_KEXEC_HANDOVER
> > +     /*
> > +      * Point the EFI FDTPTR config table entry at the modified FDT so=
 the
> > +      * second kernel picks up the linux,kho-fdt and linux,kho-scratch
> > +      * properties via early_init_dt_check_kho().
> > +      */
> > +     if (internal->fdt_mem) {
> > +             /*
> > +              * FDT-based system: DEVICE_TREE_GUID already exists in t=
he EFI
> > +              * config table; just update its pointer to our KHO FDT.
> > +              */
> > +             efi_system_table_t *st =3D
> > +                     (efi_system_table_t *)TO_CACHE(systable_ptr);
> > +             efi_config_table_t *ct =3D
> > +                     (efi_config_table_t *)TO_CACHE((unsigned long)st-=
>tables);
> > +             unsigned long i;
> > +
> > +             for (i =3D 0; i < st->nr_tables; i++) {
> > +                     if (!efi_guidcmp(ct[i].guid, DEVICE_TREE_GUID)) {
> > +                             ct[i].table =3D (void *)internal->fdt_mem=
;
> > +                             break;
> > +                     }
> > +             }
> > +     }
> > +#endif
>
> Honestly this and the ACPI stuff looks worse to me than what your
> previous version did. Now I am not an expert on EFI and architecture
> stuff, and know nothing about Loongarch, but to me this looks hacky and
> I am not sure if it is doing the right thing.
>
> I think you should get some alignment with Loongarch maintainers on what
> the kexec boot protocol looks like. It looked odd to me, but if the
> Loongarch maintainers are fine with using the kernel cmdline for
> bootloader to pass data to the kernel, then I think we should go back to
> that.
>
> Huacai, do you have any thoughts? For KHO we essentially need a way for
> the pre-kexec kernel to tell the post-kexec kernel about a blob of
> memory that has some information it can use. For x86, we do that via
> setup data. See arch/x86/include/uapi/asm/setup_data.h and struct
> kho_data for example. On arm64, we use the boot FDT's /chosen node. See
> kho_add_chosen() in drivers/of/kexec.c.
>
> Ideally, all device tree platforms should use the FDT path. But
> Loongarch also has ACPI only and I don't know what a good idea for that
> is.
>
> So, do you have any suggestions on where to best place a pointer to this
> blob of data on Loongarch? v1 of this series put it in the kernel
> commandline, but I found that odd and asked if it can be done via DT
> instead. But to me, this code looks even more hacky.
I don't know which is the best way, but I can give some information.

ARM64 and RISC-V create a FDT to contain all needed boot information
(EFI system table, command line, etc.) in efistub. In other words,
both ACPI booting and FDT booting have an existing FDT to pass the
blob.

But LoongArch is different, the efistub doesn't create a FDT, instead
it passes the EFI system table and command line to the core kernel
directly.


Huacai

>
> > +
> >       /* Make reboot code buffer available to the boot CPU. */
> >       flush_cache_all();
> >
> [...]
>
> --
> Regards,
> Pratyush Yadav
