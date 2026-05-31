Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE783242BA;
	Sun, 31 May 2026 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219736; cv=none; b=Shd2jK77ot3uXeAVrtpucSyGn5as2wxAD8a/30AzbjfPFKejQrDlnd63zWIxE0IHNhiJlDnfcGAgvulcJyW7Q1mk8fIkrME+5+zwBQbswp+VPNH7HzQZEeBPhRdJndp80sTmcaFKSY/Y0mVep0CsVEm4Rj9nmOyjwma7Snht87A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219736; c=relaxed/simple;
	bh=mpvZfsQeHvn569z1As7CtJtrMrjCYL/bEmdkPJGN0E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3moXmnGWgNklNz/PUEfXtrE08wdIqsRf1W4p9aJZ3qeuHpMAkhBSlAhFeMZU3riMXUhcJqa+2jF+6WsmSs8r7pkFABBrWu+JHvoyTX/lgY4Rcc3hsVSUfYnA2ZmQOYTm72jykc7QIctglvoJGHp+d9xyjEw+MfwJm2aCgJlw74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rez7EVFp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rez7EVFp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0A11F00893;
	Sun, 31 May 2026 09:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780219735;
	bh=sKVLCLu8XTfsvb4XdRoPm7KvsQtWzPp56I8MFy8zhao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rez7EVFpovoH5ATL25xVJfV9kmDIZar9McePukksCWV9f6z3A32X4rp/Miehff7Pu
	 pSh6vOduka57MCJpt/oqUNBbev7WkZ5mUBS0z3YjxCJ+35wmJDqb3J8CGYMuup9CyX
	 RW3OhrJVLdjgyVZqAD6WN68jTQ2yPuTvwRu3G2tA5TrCR0kPk9trY3R4kZ1Xj5jGJc
	 Jd0iGSgxC68WFOdG3BFEzZ9IK9qw7cLjJ3CBAMzBGNbAuJ2ynJO1HTugu1aLHbuHTu
	 HBjZu/5dhv30F1d9FKs5DpoYZRJMKkKwAAyr8947gK76H1CPrR+CsHX00AZJ1MBpbD
	 hm+oilmW9WQTA==
Date: Sun, 31 May 2026 12:28:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: George Guo <dongtai.guo@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>, Shuah Khan <shuah@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Alexander Graf <graf@amazon.com>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, George Guo <guodongtai@kylinos.cn>
Subject: Re:
Message-ID: <ahv_T6WwFEysgIeg@kernel.org>
References: <20260529143238.169169-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529143238.169169-1-dongtai.guo@linux.dev>

Hi,

On Fri, May 29, 2026 at 10:32:34PM +0800, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
> 
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> #26: 
> containing only /chosen with the two KHO properties.  Since DEVICE_TREE_GUID
> 
> ERROR: Invalid commit separator - some tools may have problems applying this
> #34: 
> -------------------------------
> 
> total: 2 errors, 1 warnings, 0 lines checked

I believe something went wrong with sending the emails :)

Please include changes from revision to revision in the cover letter next
time.

You also may want to consider using b4 prep/send for sending the patches.

> >
> Date: Fri, 29 May 2026 21:54:01 +0800
> Subject: [PATCH v2 0/4] LoongArch: add KHO support and selftests
> 
> This series adds Kexec Handover (KHO) support for LoongArch and extends
> the KHO selftest infrastructure to run on LoongArch under QEMU.
> 
> KHO passes metadata (the KHO state FDT and scratch area addresses) to the
> second kernel via the FDT /chosen node, using the linux,kho-fdt and
> linux,kho-scratch properties that drivers/of/kexec.c:kho_add_chosen()
> writes and drivers/of/fdt.c:early_init_dt_check_kho() reads.
> 
> Selftest support (patches 3-4):
> 
> Patch 3 adds loongarch.conf and extends vmtest.sh to recognise loongarch64
> as a build target.  The LoongArch virt machine is FDT-only (no ACPI), so
> 'earlycon' must appear on the kernel cmdline or the console UART is never
> discovered.  PS/2 input devices are also disabled since QEMU's LoongArch
> virt machine has no i8042 controller; the fallback port probe hits a page
> fault and panics before reaching userspace.

Patch 3 should not introduce regressions
 
> Patch 4 handles QEMU not exiting after kexec on LoongArch.  QEMU provides
> no EFI runtime services, so machine_restart() falls through to an infinite
> idle loop.  QEMU_NEEDS_KILL=1 in loongarch.conf signals vmtest.sh to run
> QEMU in the background, poll the serial output for the test verdict, and
> kill QEMU once it appears, so the test completes unattended.

And patch 4 should be folded into patch 3.
As I said during v1 review, the whole wait and kill loop can be replaced
with 'timeout' command which does not need to be specific for LoongArch.
The actual timeout value might, though.

Will wait for v3 for more detailed review.
 
> George Guo (4):
>   LoongArch: kexec: add KHO support for FDT-based systems
>   LoongArch: kexec: add KHO support for ACPI-only systems
>   selftests/kho: add LoongArch vmtest support
>   selftests/kho: handle QEMU not exiting after kexec on LoongArch
> 
>  arch/loongarch/Kconfig                     |   3 +
>  arch/loongarch/include/asm/kexec.h         |   7 +
>  arch/loongarch/kernel/machine_kexec.c      |  38 +++
>  arch/loongarch/kernel/machine_kexec_file.c | 256 +++++++++++++++++++++
>  arch/loongarch/kernel/setup.c              |  21 +-
>  tools/testing/selftests/kho/loongarch.conf |  13 ++
>  tools/testing/selftests/kho/vmtest.sh      |  35 ++-
>  7 files changed, 365 insertions(+), 8 deletions(-)
>  create mode 100644 tools/testing/selftests/kho/loongarch.conf
> 
> -- 
> 2.25.1
> 
> 

-- 
Sincerely yours,
Mike.
