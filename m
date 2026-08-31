Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826B2549394;
	Mon, 31 Aug 2026 15:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191113; cv=none; b=W8kHc6ayWh47ozpfpRIh1QMQmUnjR9SUuJnW//dctau4BrOBKzgoVyzXM8xH5Kzxk4nu7WQFfYni42F0lf4mRORkHP+guMMRKxKCnlMpxgYjiu/AmS+S6mljRHZJzqmpfKSBq2hkJ7eO8dLNt+kOMQhZRyIGtxl9voGASE+EChg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191113; c=relaxed/simple;
	bh=wEBiLSwa8F4U0JArTcaT42ozqOvFT/Sv0tXuONE+RdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MoTXHU/ICXkg4kYXXYd1sicbdot1vAqf7xSf8uJAFRbq0kZhmWB3g0YEier/4EetgSNCec7bCsE6pMe29k/fMGGSJMAifeX9koUOcloII2qgTTcGEYdaatGtFkZgTeaEwpZVsus+kOoiPLrj9VWS1d3vgIQ0Q2CADgDK6IVoY+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=iDsXhSRX; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="iDsXhSRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1788191109;
	bh=wEBiLSwa8F4U0JArTcaT42ozqOvFT/Sv0tXuONE+RdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDsXhSRX/9GS3DFXo7zPcAzFMbUaGsFpgd831tKf0camptWUikPYsjAe97G16cT0V
	 YybhQPYd9qnzK8kmwFDK+FIjehJh5Cbmx/jPfCVCotyIz2Mg/QIEvDiUlMoWTIeAom
	 auv/bSG/IDuYl+CgYJcBRGSexXnmtSc7hrs1CH2w=
Date: Mon, 31 Aug 2026 17:45:08 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Michal Simek <monstr@monstr.eu>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH 0/4] microblaze: KUnit support
Message-ID: <74ccab6d-b700-4397-a598-3ce1a9bc321f@t-8ch.de>
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <b1be5d00-dc18-4b36-93e4-a866dff49766@monstr.eu>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1be5d00-dc18-4b36-93e4-a866dff49766@monstr.eu>

On 2026-08-31 14:57:36+0200, Michal Simek wrote:
> Hi,
> 
> On 8/4/26 07:32, Thomas Weißschuh wrote:
> > Add the necessary prerequisites and configuration to run KUnit on
> > microblaze.
> > 
> > Please note that various KUnit tests will fail with the default
> > configuration as the memmove() implementation from
> > arch/microblaze/lib/memmove.c seems to be broken.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> > Thomas Weißschuh (4):
> >        microblaze: uaccess: Zero out destination on failed get_user()
> >        microblaze: reset: Call POWER_OFF handlers
> >        microblaze: reset: Provide a power off handler through an unaligned PC
> >        kunit: qemu_configs: Add microblaze configuration
> > 
> >   arch/microblaze/Kconfig                        |  9 +++++++++
> >   arch/microblaze/include/asm/uaccess.h          |  3 ++-
> >   arch/microblaze/kernel/reset.c                 | 22 ++++++++++++++++++++++
> >   tools/testing/kunit/qemu_configs/microblaze.py | 17 +++++++++++++++++
> >   4 files changed, 50 insertions(+), 1 deletion(-)
> > ---
> > base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> > change-id: 20260802-kunit-microblaze-7a3f6ac88b4d
> > 
> > Best regards,
> > --
> > Thomas Weißschuh <linux@weissschuh.net>
> > 
> 
> One more thing. I see that this test is also failing on 32bit riscv. Is this
> something 32bit architecture related? That was only one test which failed on
> little endian Microblaze.

This is a general issue of this test on 32-bit:
https://lore.kernel.org/lkml/20260830103321.2042968-1-david@davidgow.net/

(...)

> [14:53:56]     # gpu_test_buddy_alloc_exceeds_max_order:
> drivers/gpu/buddy.c:519: gpu_buddy_assert(!mm->used_scoreboard[i])
> [14:53:56] [FAILED] gpu_test_buddy_alloc_exceeds_max_order
> [14:53:56] # gpu_buddy: Testing GPU buddy manager, with random_seed=0x11376afa
> [14:53:56] # module: gpu_buddy_tests
> [14:53:56] ==================== [FAILED] gpu_buddy ====================
> [14:53:56] ============================================================
> [14:53:56] Testing complete. Ran 1 tests: failed: 1
> [14:53:56] Elapsed time: 6.310s total, 0.001s configuring, 4.289s building,
> 1.982s running
