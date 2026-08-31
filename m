Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659DC548565;
	Mon, 31 Aug 2026 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190996; cv=none; b=UdR9M3PdV806qgK46FSJKf94LlGaAJ50dopbk31fBRiYy0E14I7MSFdq1LKLUoW8pz+iTeOVGSoIGnPLAFckXnqyLtssFvdLX8rA0vK4P6QTgkjRuGfJhystjsRIMrqJVQgevhvaJJPAU3lyT/z0JvNnbZq0/vcgMJSDywIYsoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190996; c=relaxed/simple;
	bh=6BVx4xmeINn5ezJg2Nnc2l8Yh3PU0JFHjGc2cijcjjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffK6IqwwGjolJ2qEEtYi34q+bBbpXKRORgnwZgZbQASg/ur18hu4mq9rX8FIVqxtM92r6nu+cKE/H3jBYnpyQkDFzqeuickgMrV/DT4ho4PLkcGzlKJkLUhF97/3LAh4VzMDEbuupmvzmrcsjCWZhSB0WUMpM8iKty7+brnffH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=KodgbCXW; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="KodgbCXW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1788190992;
	bh=6BVx4xmeINn5ezJg2Nnc2l8Yh3PU0JFHjGc2cijcjjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KodgbCXWdoMCAha4nIXYowrum4++ayzomFBur+QKcc46BiT0nFFjCH6RmAmwZD3+i
	 W4BJIk1lsWevi8g2yTQPo5a+OQB4gtRwZ/lGR5ttMVH5CGKY/A+Tyj1LVwK8AGMS5W
	 8EyAYas7KQbuUxa1KBDS2KloBL8ryuaAGoJ2pdIM=
Date: Mon, 31 Aug 2026 17:43:11 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Michal Simek <michal.simek@amd.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH 4/4] kunit: qemu_configs: Add microblaze configuration
Message-ID: <60d4618b-3620-4ecc-a2c6-2b382de68724@t-8ch.de>
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <20260804-kunit-microblaze-v1-4-6dcdfe12eb40@weissschuh.net>
 <5cd8df03-ad51-460c-9b20-3bf288831b5a@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cd8df03-ad51-460c-9b20-3bf288831b5a@amd.com>

On 2026-08-31 12:48:08+0200, Michal Simek wrote:
> On 8/4/26 07:32, Thomas Weißschuh wrote:
> > Add a basic configuration to run kunit tests on microblaze.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >   tools/testing/kunit/qemu_configs/microblaze.py | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> > 
> > diff --git a/tools/testing/kunit/qemu_configs/microblaze.py b/tools/testing/kunit/qemu_configs/microblaze.py
> > new file mode 100644
> > index 000000000000..ff012095e77d
> > --- /dev/null
> > +++ b/tools/testing/kunit/qemu_configs/microblaze.py
> > @@ -0,0 +1,17 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +from ..qemu_config import QemuArchParams
> > +
> > +QEMU_ARCH = QemuArchParams(linux_arch='microblaze',
> > +						   kconfig='''
> > +CONFIG_CPU_BIG_ENDIAN=y
> 
> Big endian is quite old and I am even surprised that it is working.

Oh ok. This was the only configuration that I got working.

> > +CONFIG_SERIAL_UARTLITE=y
> > +CONFIG_SERIAL_UARTLITE_CONSOLE=y
> 
> I think it is just pure luck that this worked for you because you didn't
> rewrite the most important parts of config.
> 
> You should define at least these values
> 
> CONFIG_KERNEL_BASE_ADDR=0x90000000
> CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
> CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
> CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
> CONFIG_XILINX_MICROBLAZE0_USE_DIV=0
> CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
> CONFIG_XILINX_MICROBLAZE0_USE_FPU=0
> 
> to be aligned with s3adsp1800

Will do.

> It will solve these two issues too.
> ERROR: Microblaze BARREL, MSR, PCMP or DIV-different for kernel and DTS
> ERROR: Microblaze HW_MUL-different for kernel and DTS
> 
> > +CONFIG_MB_POWER_OFF_THROUGH_UNALIGNED_PC=y
> > +''',
> > +						   qemu_arch='microblaze',
> > +						   kernel_path='arch/microblaze/boot/linux.bin',
> > +						   kernel_command_line='kunit_shutdown=poweroff',
> > +						   extra_qemu_params=[
> > +							'-M', 'petalogix-s3adsp1800',
> > +						   ],
> > +)
> > 
> 
> That's bring us to different topic. When qemu runs I see these 2 issues
> 
> qemu-system-microblaze: -accel kvm: invalid accelerator kvm
> qemu-system-microblaze: -accel hvf: invalid accelerator hvf

That is an artifact on how KUnit starts qemu. It should not matter.

> I don't have any issue if you want to wire big-endian version but would be
> more useful to wire little endian version.

Understood. Let's try to have both.

> If there is an issue with memmove implementation I can't see any issue to
> disable that options to let it pass from the beginning and solve it
> separately.

Ack. Could you take care of this? I have next to no idea about microblaze.

> This should be fragment for Little endian.

Thanks, unfortunately this hangs for me with my distros QEMU 11.1.0.
No output, 100% CPU usage during boot. I am using qemu-system-microblaze
instead of qemu-system-microblazel, as the latter is not available
anymore, but the former is documented to also handle little endian
automatically.

> 
> [linux](next)$ cat tools/testing/kunit/qemu_configs/microblazeel.py
> # SPDX-License-Identifier: GPL-2.0-only
> from ..qemu_config import QemuArchParams
> 
> QEMU_ARCH = QemuArchParams(linux_arch='microblaze',
> 						   kconfig='''
> 
> CONFIG_KERNEL_BASE_ADDR=0x50000000
> CONFIG_XILINX_MICROBLAZE0_FAMILY="virtex5"
> CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
> CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
> CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
> CONFIG_XILINX_MICROBLAZE0_USE_DIV=1
> CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=2
> CONFIG_XILINX_MICROBLAZE0_USE_FPU=1
> CONFIG_CPU_LITTLE_ENDIAN=y
> CONFIG_SERIAL_8250=y
> CONFIG_SERIAL_8250_CONSOLE=y
> CONFIG_SERIAL_8250_16550A_VARIANTS=y
> CONFIG_SERIAL_OF_PLATFORM=y
> CONFIG_MB_POWER_OFF_THROUGH_UNALIGNED_PC=y
> ''',
> 						   qemu_arch='microblazeel',
> 						   kernel_path='arch/microblaze/boot/linux.bin',
> 						   kernel_command_line='kunit_shutdown=poweroff',
> 						   extra_qemu_params=[
> 							'-M', 'petalogix-ml605',
> 						   ],
> )
