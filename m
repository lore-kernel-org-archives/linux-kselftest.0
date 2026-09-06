Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0163B362154;
	Sun,  6 Sep 2026 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788706829; cv=none; b=QcVqfhOA8dB21JRo2wAfSiY4w0BfPcvV0ZEbIqtGk/LCfpWteL0dBDMAWeyx2h22VSQ2VEV9hTooX+j3Dtv+zW6SQksllev4D5/01uWZZADQQ52uIztDmUxYDs2WbR5XeDhbz3elv0ZeP8m/jyX3vskYa1yvWdyNjEjh9YlAHDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788706829; c=relaxed/simple;
	bh=Rxy4YBlBtB5HAWk/JMk7n71PFj1H+GTbtc/lh+EOM0g=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IMWS2j//NA2M26FodwvdxhEKd141A5frty/gLPoeLx9djxjCQKwbeQIeRzP+36SaWzLDQtmNAy3rFpLx8Txv7nKgVIg2UB2Hn9kLYzgCasOsx50f80Sb13nL3J7LU4Tv2ZiCthyg+ErIwmoK/Uur5kTEs7QUEn818Qku7Cn8sqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRVcQe14; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRVcQe14"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00C91F00A3A;
	Sun,  6 Sep 2026 15:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788706821;
	bh=7rsy1jb7TwXnL4D5XTd/EAACeqOWAzhGZYCkXITHWOA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kRVcQe1460Ja6zrZt9OaYiq9A/30dWehyzX5GqNDxT8szqoIsRuP1nhFGmd6HDgxw
	 kAnRS6HMqlq/L2/mcBuaHe3SgxOo2rEMFxRT4K/WvIF7yu5UtznhPLY1PeMvsGY5DF
	 fSTMS1wJItbQdkwNrvd21xIeK3udYQ+0w0IVpt1on+9Lvl/44l26dc8lMMqQ9t2Yhu
	 KvT3VWPyBmTVeJjsv4i+QtOUndsP7k813soOuCEAjmxiohXoZqOPh/NSdQbh6Il78n
	 7t2TDGmVQjJGoF9bsNMqK7LnsWqJYJuzyrSuYrTA0QzpvbCJbt2BqMoT7vqihFB3uv
	 ITqHP4KMTzdbA==
Subject: Re: [PATCH net-next v2 2/2] selftests: drv-net: Use cross-compilation
 environment for the io_uring check
From: netdev-bot+sashiko@kernel.org
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com, horms@kernel.org,
 shuah@kernel.org, matttbe@kernel.org, sdf@fomichev.me, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-kselftest@vger.kernel.org
Date: Sun, 06 Sep 2026 15:00:20 +0000
Message-ID: <178870682049.219967.8686151218558794028@kernel.org>
In-Reply-To: <20260903155524.2241065-3-maxime.chevallier@bootlin.com>
References: <20260903155524.2241065-3-maxime.chevallier@bootlin.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 1

- [Medium] Incomplete fix: the capability probe still uses a different
  compiler than the one lib.mk installs to build `iou-zcrx`, in two…
- [Low] Missing `Fixes:` tag.

--

selftests: drv-net: Use cross-compilation environment for the io_uring check

This patch sets CC to $(CROSS_COMPILE)gcc at the top of
tools/testing/selftests/drivers/net/hw/Makefile so that the liburing
zero-copy capability probe (HAS_IOURING_ZCRX) is compiled with the
cross compiler instead of make's built-in default. The override is
guarded by ifeq ($(LLVM)$(CC),cc).

[Severity: Low]

Should this carry a Fixes: tag?  git blame on the baseline attributes the
whole probe block, including the ifeq ($(HAS_IOURING_ZCRX),y) gating, to
f81171fecd0c3 ("selftests: hw-net: auto-disable building the iouring C
code").  Since no CC is set before the probe in this Makefile, in
tools/testing/selftests/Makefile, or in lib.mk, that commit is where the
probe started evaluating with the built-in CC=cc in cross builds:

  Fixes: f81171fecd0c3 ("selftests: hw-net: auto-disable building the iouring C code")

On the changelog wording:

> The CC value used for the io_uring library check defaults to the host
> compiler, which will fail in cross-compiling environments.

Does the check actually fail?  The compile of the probe program succeeds or
fails against the host's liburing, so the result simply describes the host
rather than the target.  The failure comes later, when iou-zcrx is
cross-built and linked with -luring, or the test is silently dropped.
Would it be more accurate to describe it that way?

> diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
> index 6105be8e590f..f9458dc6c150 100644
> --- a/tools/testing/selftests/drivers/net/hw/Makefile
> +++ b/tools/testing/selftests/drivers/net/hw/Makefile
> @@ -1,5 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0+ OR MIT
>  
> +# Set CC for the io_uring check
> +ifeq ($(LLVM)$(CC),cc)
> +CC := $(CROSS_COMPILE)gcc
> +endif
> +

[Severity: Medium]

Can the probe and the actual build of iou-zcrx still end up on different
compilers after this change?  The guard only matches when LLVM is empty and
CC still holds the built-in value cc.

Two cases seem to slip through:

  make LLVM=1 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- ...

  $(LLVM)$(CC) expands to "1cc", the ifeq is false, so HAS_IOURING_ZCRX is
  probed with the host cc while lib.mk later sets:

    CC := $(CLANG) $(CLANG_FLAGS) -fintegrated-as

CC arriving from the environment with any value other than cc.  The
top-level kernel Makefile has:

    export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG

so kbuild-driven builds such as make kselftest always have CC in the
environment (plain clang with no --target under LLVM=1).  The ifeq is
false, the probe uses that compiler, but lib.mk's plain := assignment
overrides an environment CC for the real build:

    CC := $(CROSS_COMPILE)gcc

In both cases, a host liburing that has io_uring_register_ifq sets
HAS_IOURING_ZCRX=y, which adds iou-zcrx to COND_GEN_FILES and enables:

    $(OUTPUT)/iou-zcrx: LDLIBS += -luring

Does the subsequent cross compile then abort on liburing.h or -luring
instead of taking the graceful path?

    $(warning excluding iouring tests, liburing not installed or too old)

The inverse case, where the target sysroot has liburing but the host does
not, would silently drop a supported test.

Since the probe is expanded well before include ../../../lib.mk, would it
be possible to mirror lib.mk's own CC derivation here, or to move the probe
after lib.mk is included, so the gate always matches the compiler that
builds iou-zcrx?

>  # Check if io_uring supports zero-copy receive
>  HAS_IOURING_ZCRX := $(shell \
>  	echo -e '#include <liburing.h>\n' \

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260903155524.2241065-1-maxime.chevallier%40bootlin.com
