Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A09A560AD9;
	Tue,  8 Sep 2026 16:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884244; cv=none; b=eauC1IMoorMo2KBiP0jCE7BkbKV1e0kGmeqjeXv/mT55os16R1zxfJKZmQ/GTM1BclUau5LNqMTfOFHdBmX8gkLezjJhKCgF7xJYrjaBlEBZoEcVIw+COrC+Kl37L+SQOJNcQVZ2NSdKtqzE1yiFP4VBTMYGQ/0JTAgOK0z+Ces=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884244; c=relaxed/simple;
	bh=VhtbgHp6h0dqS5ZVWVxq4CeAw3RPjyom1fu85v9eGYk=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q/Dd1xfHl+40fHdqahzSe87XptKWYt4UiP9K4NlF2co2mbaaN8XUX0riltC60EwsxBjKIA7uM0MbWxD9JqlQcnnIiqAE31JMU8I2nwPOiZ1IG3CfBPZEfnakcsVK9SNUVagCZGJnv21YAafuYbUMRrTz952mLZAljysiIz1La8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fc8mvDPq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fc8mvDPq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCDE1F00A3D;
	Tue,  8 Sep 2026 16:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788884242;
	bh=54OS7Cn1zHWFrSDiQLGxq53Zy9lcNfpZhwt1yzaz/Zw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fc8mvDPqlN39BQZv0mieTID9Wk4SyuQV36ziZpDPj/3nEFUqiynzBG00xLkFmEIZN
	 KTOTPlEba0rtBslsTFM639MJbT8+l2fSXtSUY5UVHGJ26YVW2DjqIlD8fnqFI0cT4z
	 lQh8oBs9OTWQHBA3MsHGRsKtMK9UhSOpD5yQFVMIpNDDd9jmtBXiFsuAzICfTbfvlu
	 q93oZYN0n3rqbHHPAFs7IeNL35yqNLCLpKJTcoysKjf0KKI295gddaF+u8yrnzPjfd
	 fzXjUMVAb6V8EZbTqwNgn7BDa5GRNxvavlUoMwuZV2xHES7PxLWx9DsN8AvXRu9kAU
	 /N1x0133ktqCg==
Subject: Re: [PATCH net-next v3 2/2] selftests: drv-net: Use cross-compilation
 environment for the io_uring check
From: netdev-bot+sashiko@kernel.org
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com, horms@kernel.org,
 shuah@kernel.org, matttbe@kernel.org, sdf@fomichev.me, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-kselftest@vger.kernel.org
Date: Tue, 08 Sep 2026 16:17:20 +0000
Message-ID: <178888424081.219967.2552199457302763291@kernel.org>
In-Reply-To: <20260907161438.755125-3-maxime.chevallier@bootlin.com>
References: <20260907161438.755125-3-maxime.chevallier@bootlin.com>
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

- [Medium] Incomplete fix: the new guard `ifeq ($(LLVM)$(CC),cc)` in
  tools/testing/selftests/drivers/net/hw/Makefile only overrides CC when…
- [Low] Missing `Fixes:` tag.

--

selftests: drv-net: Use cross-compilation environment for the io_uring check

This sets CC to $(CROSS_COMPILE)gcc in the drivers/net/hw selftests
Makefile before the liburing feature probe runs, so that the probe uses the
target toolchain instead of the host compiler. The override is applied only
when make's CC is still the built-in default and LLVM is unset.

No Link: tag present in the commit header.

> diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
> index 6105be8e590f7..f9458dc6c1508 100644
> --- a/tools/testing/selftests/drivers/net/hw/Makefile
> +++ b/tools/testing/selftests/drivers/net/hw/Makefile
> @@ -1,5 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0+ OR MIT
>  
> +# Set CC for the io_uring check
> +ifeq ($(LLVM)$(CC),cc)
> +CC := $(CROSS_COMPILE)gcc
> +endif

[Severity: Medium]
Does this condition cover the case where CC comes from the environment
rather than from make's built-in default?

With something like:

    export CC=gcc-13
    make -C tools/testing/selftests/drivers/net/hw CROSS_COMPILE=aarch64-linux-gnu-

$(LLVM)$(CC) expands to gcc-13, so the override is skipped and the probe
below runs the host gcc-13. Later, lib.mk does:

    tools/testing/selftests/lib.mk:
    ifneq ($(LLVM),)
    CC := $(CLANG) $(CLANG_FLAGS) -fintegrated-as
    else
    CC := $(CROSS_COMPILE)gcc
    endif # LLVM

Since that is a := assignment in a makefile, it overrides the
environment-origin CC, so the compiler that actually links iou-zcrx is not
the one that was probed.

Would an origin test such as:

    ifeq ($(origin CC),default)

or mirroring lib.mk's own ifneq ($(LLVM),) ... else CC := $(CROSS_COMPILE)gcc
structure (as tools/testing/selftests/arm64/mte/Makefile does) make both
sides agree, and also close the LLVM case noted in the commit message?

[Severity: Low]
Should this carry a Fixes: tag?

git blame on the baseline attributes the whole probe block, including the
$(CC) -luring invocation and the COND_GEN_FILES += iou-zcrx gate, to:

    f81171fecd0c ("selftests: hw-net: auto-disable building the iouring C code")

Before that commit there was no CC-dependent probe in this Makefile. Adding
the tag would let backporters pick this up into trees that already carry
f81171fecd0c.

>  
>  # Check if io_uring supports zero-copy receive
>  HAS_IOURING_ZCRX := $(shell \
>  	echo -e '#include <liburing.h>\n' \

[Severity: Medium]
Related to the CC question above: the probe invokes only $(CC) -luring and
passes none of CFLAGS/CPPFLAGS/LDFLAGS/USERCFLAGS/USERLDFLAGS, while the
generic C rule in lib.mk does pass them when linking $(OUTPUT)/iou-zcrx.
Can a target liburing that is only reachable through user-supplied
-I/-L/sysroot flags stay invisible to this probe?

The two failure modes both come from the probe answering for a different
toolchain than the build:

    ifeq ($(HAS_IOURING_ZCRX),y)
    $(OUTPUT)/iou-zcrx: LDLIBS += -luring
    endif

Host-only liburing gives y and the cross link of iou-zcrx then fails on
-luring, taking the whole drivers/net/hw build with it. Target-only liburing
gives an empty value and the test is dropped with the warning "excluding
iouring tests, liburing not installed or too old".

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260907161438.755125-1-maxime.chevallier%40bootlin.com
