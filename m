Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C5234F24A
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704690; cv=none; b=G2gLYpw+/jhlC+ViZHQo0aO6IrCkgghhwwl/IlhX0kV/pAczGe+r5AQmGYQK9My0Dc+KmtmtpPWfyfR04hjHElwZ0knvi45JwucKt/uWjkahy5jPwcJqPC28yZ1675XV4LKYzSl9ZJF5l+eHyiNu+RjPERF7SSrm3+gBzO/gwxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704690; c=relaxed/simple;
	bh=sciy78VQ+TjMF1dQqvjPGwKW3z7aIilJWwyI4uCbDIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQqrHQ3G4swJTHphXcTR8MrIFota2wRy5idjjrEuFSRQ45DAXpR39sR/ye6xurArfyCY8dOE4Ya/lOPJ+5kJAOo/wbuD/olAYv9TWsvpLrXFI06K5fS+bZDT0fc9NCRi9uFXSbEw5TGurTGxcNpInoaesH9PHRKbBxXei3mnzR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYiTqryd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYiTqryd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF26A1F00ADF
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779704689;
	bh=/TRhXlL7M+bh0nA0422zvkrUv8DgtfhlLo+sCPkC9ec=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fYiTqrydGo6pyM/gWpNIEM8yZmtV+yJecLIqyHCIoDJxhs2iNO/WYscK11D6uGQYq
	 xKjAoy1Zk25Xj2wZF9H5PgfaYfyPB3mgotclC+zba5J8vYasLbAluUzgN6nnOAt4BU
	 PgkgdVCcJVdn6miy793M5dQJI+v4pSZdvRkujTLYIUKf18G4l49E/bF3SgjhUk3d8g
	 9y9HPN4CE6LMX/eCjNEt1T7ij3PgX84WcCGxCQ46a508ludZT2WyhJZYORvO+kaXCS
	 /uUyVTGOfEQOlFAkG7QLvpqkTdNRz1jvwTPNdXMbF2RpofdhCdjDxVlCeqGaNYsmsL
	 b81BWygIsYU3A==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso1713179866b.1
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 03:24:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8w14IHMwVx4GtY/go5dx9hdAnhvCdR16N97SvSj+PcU34HOliJ+Slz9JwYewSAVAx9ujq08HC+DXgmnIcCY7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi6tTK1wi/HQrG4eIc6C8oke8FMqmaJkj91FiYBm4DX9d3HG/Q
	NfqloeupNuzsQqy+cUpCDUPn2X5vOvvCk9EWM9VHfOO/eqmZKU8wUWSe9+ZAUXV06bTc5gwSzzW
	7aFYU8X15QkVHaJClDGmmmGtMSpxTx/8=
X-Received: by 2002:a17:906:dc8b:b0:bd2:aeaf:470c with SMTP id
 a640c23a62f3a-bdd267c8024mr853835966b.40.1779704687546; Mon, 25 May 2026
 03:24:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525062810.103367-1-dongtai.guo@linux.dev> <177969529480.4047269.2120994507098781563.b4-review@b4>
In-Reply-To: <177969529480.4047269.2120994507098781563.b4-review@b4>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 25 May 2026 18:25:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4p8xe_Hfx81kjxNrp5g7RKvi4f1QM7avLvnf_r+VazFA@mail.gmail.com>
X-Gm-Features: AVHnY4LTd0Kg3PKCCZqbfiXECjfM-2DhE2l34GPEKNdQUAn6_sdoLxbmWOkvxmI
Message-ID: <CAAhV-H4p8xe_Hfx81kjxNrp5g7RKvi4f1QM7avLvnf_r+VazFA@mail.gmail.com>
Subject: Re: [PATCH 0/7] LoongArch: add KHO support and selftests
To: Mike Rapoport <rppt@kernel.org>
Cc: George Guo <dongtai.guo@linux.dev>, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	kernel@xen0n.name, graf@amazon.com, shuah@kernel.org, 
	loongarch@lists.linux.dev, kexec@lists.infradead.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Mike,

On Mon, May 25, 2026 at 3:48=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Mon, 25 May 2026 14:28:03 +0800, George Guo <dongtai.guo@linux.dev> wr=
ote:
>
> Hi,
>
> > [...]
> >
> > Bug fixes (patches 3-4)
> > ------------------------
> > Patch 3 fixes a build failure with CONFIG_KFENCE=3Dy: virt_to_phys() an=
d
> > phys_to_virt() in asm/io.h expand to use offset_in_page() and
> > page_address(), which require <linux/mm.h> that was not included.
>
> This fix looks unrelated to KHO, it makes sense to send it as a separate
> patch.
He tried, but it causes new problems, but I agree this patch has
nothing to do with KHO.
https://lore.kernel.org/loongarch/202605211925.DbDvQ6ii-lkp@intel.com/T/#t

>
> >
> > Patch 4 moves KEXEC_CONTROL_CODE from 0x100000 to 0x180000.  QEMU
> > places its machine FDT at 0x100000 when booting with '-kernel'; the
> > previous placement silently overwrote the FDT with the relocation
>
> And I believe that patch 2 and patch 4 can be folded into patch 1 so
> that addition of KHO support will be a single patch.
Patch 2 should be folded, but Patch 4 can be separate, because it
should be backported.

>
> > trampoline, breaking earlycon in the kexec'd kernel.
> >
> > Selftest support (patches 5-7)
> > -------------------------------
> > Patch 5 adds loongarch.conf and extends vmtest.sh to recognise
> > loongarch64 as a build target.  QEMU's LoongArch virt machine is
> > FDT-only (no ACPI), so 'earlycon' must appear on the kernel cmdline or
> > the console UART is never discovered and the test log stays empty.
> >
> > Patch 6 disables SERIO_I8042 and its dependents in the QEMU_KCONFIG
> > fragment.  QEMU's LoongArch virt machine has no i8042 controller; the
> > fallback port probe hits a page fault on the memory-mapped I/O range an=
d
> > panics before reaching userspace.
>
> This should be folded into patch 5 for sure.
I completely don't know why Patch 6 is needed, for normal use I8042
doesn't cause problems in virtual machines.

Huacai

>
> >
> > Patch 7 polls the serial output for the test verdict and kills QEMU onc=
e
> > it appears.  QEMU provides no EFI runtime services on LoongArch, so
> > machine_restart() falls through to an infinite idle loop and QEMU never
> > exits after kexec.
>
> And since without this selftest would hang on loongarch, the timeout
> handing should be folded into patch 5.
>
> In general, the rationale when adding new features is to make sure that
> after each patch there are no regressions and the new functionality
> either works or cannot be enabled until completely implemented.
>
> --
> Sincerely yours,
> Mike.
>
