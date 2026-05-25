Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6FA2EDD6B;
	Mon, 25 May 2026 07:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695303; cv=none; b=L3dGRDX2ReX2LVryXs+mp2sQDvk36ZGnAHJ3ThUSTGW3D/jMGnuoG+6lOFPO0seIwQADJQGNgkRv8BeP32BlsTJC2FOOCz/wiLrBQvo8oAOuFACyba2gNj0A+QnYKfQn2IjuUXYWc7Q05QaORs4GqdzKwQkmhS+S5AYZw1ipEHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695303; c=relaxed/simple;
	bh=Ibr2lpj6fzkS2oQK+71o+7MIFEYRdzhXTX6R0eSdUEw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=pcjoBzs6VCP/FHy3xtQzsewNtzpL/T66WrSE/NDwtrpKQ6gildS6SyY0GWpMxpmvory+mCazfcZFdGzmfVPQIBLRFZ9QLTKdYrLUsVMa/teGlF//jO+/heCW3/uPRCzRMhEu3wrGGZjLYhAM35x2QBdKH5veHG/BvBar/F1+fBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6Ums5B+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6Ums5B+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00941F000E9;
	Mon, 25 May 2026 07:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779695301;
	bh=ffTsCl52tDDJ9WJMBEtPkp7+qwtVftVHOsX4VQzd+hQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=J6Ums5B+7Lu3MakC2zVCTCT3gKG+WJsmtE0pvAGhRPT1rudrXkgUpO07M33BcCgEN
	 TMXK2GayHABOZ6GioC9+c7H6qHOZMwl1ZL64YTN0J8aVvt1OD9DCpfL9h4rofi0RuI
	 4KB9Fsx4prdeFZvt4Z97sNj92YQDvrXqtvszS/ZLnSlsre9eF0/hfmcd5nhL+PIqy1
	 nIznVI0znL3PR+eHwnsK9TtjgufBF0B6T7eJo1woXIR/y60oWcP9mejxnyv1xkLRoW
	 ttIb9AYZPRhR+FlF3lzPS10iGRR7fxbNPi6+EfjOSo1nE7O5vsAKNNgKCJDKQ+3Zl1
	 e95B8kRLjRc+g==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/7] LoongArch: add KHO support and selftests
From: Mike Rapoport <rppt@kernel.org>
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, rppt@kernel.org, pasha.tatashin@soleen.com, 
 pratyush@kernel.org, kernel@xen0n.name, graf@amazon.com, shuah@kernel.org, 
 loongarch@lists.linux.dev, kexec@lists.infradead.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Guo <guodongtai@kylinos.cn>
In-Reply-To: <20260525062810.103367-1-dongtai.guo@linux.dev>
References: <20260525062810.103367-1-dongtai.guo@linux.dev>
Date: Mon, 25 May 2026 10:48:14 +0300
Message-Id: <177969529480.4047269.2120994507098781563.b4-review@b4>
X-Mailer: b4 0.15.2

On Mon, 25 May 2026 14:28:03 +0800, George Guo <dongtai.guo@linux.dev> wrote:

Hi,

> [...]
> 
> Bug fixes (patches 3-4)
> ------------------------
> Patch 3 fixes a build failure with CONFIG_KFENCE=y: virt_to_phys() and
> phys_to_virt() in asm/io.h expand to use offset_in_page() and
> page_address(), which require <linux/mm.h> that was not included.

This fix looks unrelated to KHO, it makes sense to send it as a separate
patch.

> 
> Patch 4 moves KEXEC_CONTROL_CODE from 0x100000 to 0x180000.  QEMU
> places its machine FDT at 0x100000 when booting with '-kernel'; the
> previous placement silently overwrote the FDT with the relocation

And I believe that patch 2 and patch 4 can be folded into patch 1 so
that addition of KHO support will be a single patch.

> trampoline, breaking earlycon in the kexec'd kernel.
> 
> Selftest support (patches 5-7)
> -------------------------------
> Patch 5 adds loongarch.conf and extends vmtest.sh to recognise
> loongarch64 as a build target.  QEMU's LoongArch virt machine is
> FDT-only (no ACPI), so 'earlycon' must appear on the kernel cmdline or
> the console UART is never discovered and the test log stays empty.
> 
> Patch 6 disables SERIO_I8042 and its dependents in the QEMU_KCONFIG
> fragment.  QEMU's LoongArch virt machine has no i8042 controller; the
> fallback port probe hits a page fault on the memory-mapped I/O range and
> panics before reaching userspace.

This should be folded into patch 5 for sure.

> 
> Patch 7 polls the serial output for the test verdict and kills QEMU once
> it appears.  QEMU provides no EFI runtime services on LoongArch, so
> machine_restart() falls through to an infinite idle loop and QEMU never
> exits after kexec.

And since without this selftest would hang on loongarch, the timeout
handing should be folded into patch 5.

In general, the rationale when adding new features is to make sure that
after each patch there are no regressions and the new functionality
either works or cannot be enabled until completely implemented.

-- 
Sincerely yours,
Mike.

