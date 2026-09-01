Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D4949E5CB;
	Tue,  1 Sep 2026 18:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287630; cv=none; b=KN05jLNju+NowUZBNsrjYPwUEPGX21/DCj6NbSWMEDjZyUThmxMW+RX9ObfFLVU1/rnS0rrbJvSnezCn3iRLDHQzZRIM+VtmW6LlbIxT8gd5PqYivrKbIoxpgJ1nn6lKonLT9tlc45sp1+wv+QUEicBeEz81Pis07XBYoR4uHKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287630; c=relaxed/simple;
	bh=gyHmnvEnpDzLxIA9secLY/W9xDC3IeZgi6WRNA5ZYps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3wwd1CA2kGtgc4ULrsYwTb6G0Y4frxprW6syysjO2gwaPZsl8r29831vmuF4Wm2uj93Zr5mR/ShuXpFM7cTxqKtRK/I+SarXQaOsyPiuUZxFG0sfUUGI/1ZESorJTx8YoYjnIHWSIIfmjFNEBINxJmd2d7hNrFImXHQH2eISbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=A0yb3DaC; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="A0yb3DaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1788287619;
	bh=gyHmnvEnpDzLxIA9secLY/W9xDC3IeZgi6WRNA5ZYps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0yb3DaChar/alzw1Grjv30Hy+sNhyJoL4FD3Y9s8cg+JFOV2NG+v4O95KtpVkc2y
	 +OjF77XNKQqFGungkclgVtdGRFKabbQL7vwz6IX0Q52TiczwZTBEeVqJBmV7T1tifz
	 L9hNli9JB/VWbfbaoQUOiFvbKQ+kdhbtTf5nJFGM=
Date: Tue, 1 Sep 2026 20:33:39 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Michal Simek <michal.simek@amd.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH 4/4] kunit: qemu_configs: Add microblaze configuration
Message-ID: <b48fee3e-d113-4551-aed4-100a089e33b5@t-8ch.de>
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <20260804-kunit-microblaze-v1-4-6dcdfe12eb40@weissschuh.net>
 <5cd8df03-ad51-460c-9b20-3bf288831b5a@amd.com>
 <60d4618b-3620-4ecc-a2c6-2b382de68724@t-8ch.de>
 <40f679a2-fb5d-4d69-96dd-ab6c6718ac07@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40f679a2-fb5d-4d69-96dd-ab6c6718ac07@amd.com>

On 2026-09-01 15:33:11+0200, Michal Simek wrote:
> On 8/31/26 17:43, Thomas Weißschuh wrote:
> > On 2026-08-31 12:48:08+0200, Michal Simek wrote:

(...)

> > > If there is an issue with memmove implementation I can't see any issue to
> > > disable that options to let it pass from the beginning and solve it
> > > separately.
> > 
> > Ack. Could you take care of this? I have next to no idea about microblaze.
> 
> On little endian this is passing. I can add it to my todo list but big
> endian is very very old and likely none is using it anymore.

If it is not supposed to work maybe mark it as BROKEN or disable the
custom memmove() implementation there and instead rely on the generic
one from lib/string.c?

> > 
> > > This should be fragment for Little endian.
> > 
> > Thanks, unfortunately this hangs for me with my distros QEMU 11.1.0.
> > No output, 100% CPU usage during boot. I am using qemu-system-microblaze
> > instead of qemu-system-microblazel, as the latter is not available
> > anymore, but the former is documented to also handle little endian
> > automatically.
> > 
> 
> I built the latest qemu like this
> 
> ../qemu/configure --target-list=microblaze-softmmu,microblaze-linux-user,microblazeel-linux-user
> --enable-gcrypt --disable-docs
> 
> /mnt/projects/xilinx-new-git/qemu.org/build-microblaze/qemu-system-microblaze
> --version
> QEMU emulator version 11.1.50 (v11.1.0-779-gd2e570cc0f97)

For me it still doesn't work. I am using the same build of QEMU and GCC
13.4.0 (or 16.2.0) from crosstools.kernel.org.

> And can't see any issue.

(...)

> /mnt/projects/xilinx-new-git/qemu.org/build-microblaze/qemu-system-microblaze
> -nodefaults -m 1024 -kernel .kunit/arch/microblaze/boot/linux.bin -append
> 'kunit.enable=1 kunit_shutdown=poweroff' -no-reboot -nographic -accel kvm
> -accel hvf -accel tcg -serial stdio -M petalogix-ml605
> qemu-system-microblaze: -accel kvm: invalid accelerator kvm
> qemu-system-microblaze: -accel hvf: invalid accelerator hvf
> qemu-system-microblaze: falling back to tcg
> qemu-system-microblaze: warning: nic xlnx.axi-ethernet.0 has no peer
> random: crng init done
> Ramdisk addr 0x00000000,
> FDT at 0x5058e528
> Linux version 7.3.0-rc1-00023-g5a713478d535 (monstr@monstr-desktop3)
> (microblazeel-amd-linux-gcc.real (GCC) 13.4.0, GNU ld (GNU Binutils)

I guess this is a special GCC variant. Could you try with one from
https://mirrors.edge.kernel.org/pub/tools/crosstool/ ?

(...)


Thomas
