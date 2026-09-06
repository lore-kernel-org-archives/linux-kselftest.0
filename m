Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015A634CFC5;
	Sun,  6 Sep 2026 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788706830; cv=none; b=G8mnAbB7j/ZByM6ufiAa1rKl4X8yWIOZS1Bbo4V6MPMK6+qMc4VP+ESeMNmfi3PNYaJHLZUm5j193qJMa26pSzzr15ZTROYnZrFKVnWmxu6XM+MmCeqsuiX+Sm0n/ktmcMRh6dX0wqa4fkkd5phcp+z1+f0wtw3QmXT7jM5O/0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788706830; c=relaxed/simple;
	bh=lXdLylgUppWXqndGD5M043CnO4y8gC0ombHPHU+I8kM=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EVqRqhsoir0wmib8plD09f0t1sNw2Q7hOZJ+BQCmPlZtOr1zH3d4aa1R2REjWZZ/ncoJesJhUMOg8xixM/c4NehdlDOIPsYUVmLJe46SMK8BuNwnpU4DCEEy8cfAOvksLgQl+AenwiiyJFXmbB+jJQ8D1lgha4s62St2WyDpjtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fn4gIv7I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fn4gIv7I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912AE1F00A3D;
	Sun,  6 Sep 2026 15:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788706820;
	bh=L9WQPmk3lG1YhB+ecDgtcWY/E3QHxA5qdfMZgqUKad8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Fn4gIv7IMZK0fua0FBAzRUHjI2uOupN8IBCjKks/y8bhF2hJzBP0yre8lYM2b+D4J
	 +9olHCuAzAUHuMle9lwj9edkWqTHW5Y0Z8NBylSdH38lm9wFHoNGSZNXakqHP3f6kc
	 +PPRJV6yFXELNBST+JndkvDyUupJQOZnbDVp6cGYskp2cmwWzWNIyy00MOBaNuwjZc
	 /IpRjDU/lIjb+/GUyb2PJuiU9xhoMw09Qsi8t/4f7dnUGBle1qENitSuZh0tlnlg8T
	 pxdM3O1OMh/6XmMuQeAoUvp2/z/RezlOy1fHw7jRfijd/EGiX9VbpQvPnW1UOcBKr0
	 4Kx+onmx/+lVA==
Subject: Re: [PATCH net-next v2 1/2] tools: ynl: Allow cross-compiling ynl and
 associated tools
From: netdev-bot+sashiko@kernel.org
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com, horms@kernel.org,
 shuah@kernel.org, matttbe@kernel.org, sdf@fomichev.me, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-kselftest@vger.kernel.org
Date: Sun, 06 Sep 2026 15:00:19 +0000
Message-ID: <178870681916.219967.14635919564673520317@kernel.org>
In-Reply-To: <20260903155524.2241065-2-maxime.chevallier@bootlin.com>
References: <20260903155524.2241065-2-maxime.chevallier@bootlin.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 2 · Low: 1

- [Medium] Incomplete LLVM cross-compilation support: the commit claims
  to "account for the cross-compiling options such as CROSS_COMPILE or…
- [Medium] Include ordering bug in tools/net/ynl/Makefile: `include
  ../../scripts/Makefile.include` is added on line 4, i.e. *after*…
- [Low] Verbosity-control mismatch in tools/net/ynl/ynltool/Makefile: the
  patch adds `include ../../../scripts/Makefile.include` (line 4), which…

--

tools: ynl: Allow cross-compiling ynl and associated tools

The ynl Makefiles stop hardcoding CC=gcc and instead include
tools/scripts/Makefile.include so that CC/AR are resolved from
CROSS_COMPILE and the LLVM variables, and the ynltool CFLAGS assignment is
switched from := to += so it no longer clobbers the flags coming from
Makefile.include.

> diff --git a/tools/net/ynl/Makefile b/tools/net/ynl/Makefile
> index 3cefe4ed96cb..8bf72c063e86 100644
> --- a/tools/net/ynl/Makefile
> +++ b/tools/net/ynl/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  include ../../scripts/Makefile.arch
> +include ../../scripts/Makefile.include
>  
>  INSTALL	?= install
>  prefix  ?= /usr

[Severity: Medium]
Should the new include come before Makefile.arch rather than after it?

Makefile.arch probes the compiler with a simply-expanded assignment, so
${CC} and ${CFLAGS} are expanded at include time:

tools/scripts/Makefile.arch:
  LP64 := $(shell if command -v $(firstword ${CC}) >/dev/null 2>&1; then echo __LP64__ | ${CC} ${CFLAGS} -E -x c -; fi | tail -n 1)

At that point CC is still make's builtin cc and CFLAGS is empty, because
the allow-override of CC from CROSS_COMPILE and the CFLAGS += $(CLANG_CROSS_FLAGS)
in Makefile.include only run on the following line.

LP64 then feeds libdir_relative and libdir in this same Makefile:

  ifeq ($(LP64), 1)
    libdir_relative = lib64
  else
    libdir_relative = lib
  endif
  libdir  ?= $(prefix)/$(libdir_relative)

and libdir is used by the install target:

  @$(INSTALL) -d $(DESTDIR)$(libdir)
  @$(INSTALL) -m 0644 libynl.a $(DESTDIR)$(libdir)/libynl.a

So does make CROSS_COMPILE=arm-linux-gnueabihf- install on an x86_64 host
end up installing the 32-bit libynl.a under $(prefix)/lib64, with the
reverse happening on a 32-bit host cross-building for aarch64?

Other in-tree users of the same LP64/libdir_relative pattern include
Makefile.include first, for example tools/lib/perf/Makefile:

  include $(srctree)/tools/scripts/Makefile.include
  include $(srctree)/tools/scripts/Makefile.arch

Would simply swapping the two includes here be enough?

> diff --git a/tools/net/ynl/generated/Makefile b/tools/net/ynl/generated/Makefile
> index ea4128f612d6..5a186349b5a8 100644
> --- a/tools/net/ynl/generated/Makefile
> +++ b/tools/net/ynl/generated/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -CC=gcc
> +include ../../../scripts/Makefile.include
> +
>  CFLAGS += -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow \
>  	-I../lib/ -idirafter $(UAPI_PATH)
>  ifeq ("$(DEBUG)","1")
> diff --git a/tools/net/ynl/lib/Makefile b/tools/net/ynl/lib/Makefile
> index 9b98c0599600..7b3eae89982f 100644
> --- a/tools/net/ynl/lib/Makefile
> +++ b/tools/net/ynl/lib/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -CC=gcc
> +include ../../../scripts/Makefile.include
> +
>  CFLAGS += -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow
>  ifeq ("$(DEBUG)","1")
>    CFLAGS += -g -fsanitize=address -fsanitize=leak -static-libasan
> @@ -8,7 +9,6 @@ endif

[Severity: Medium]
The commit message says the change accounts for "the cross-compiling options
such as CROSS_COMPILE or the LLVM-specific variables". Does this also cover
the documented LLVM form described in Documentation/kbuild/llvm.rst, that is
make LLVM=1 ARCH=<arch> with no CROSS_COMPILE?

In tools/scripts/Makefile.include, the target triple is only appended inside
the CROSS_COMPILE branch:

  else ifneq ($(CROSS_COMPILE),)
  ifeq ($(CLANG_CROSS_FLAGS),)
  CLANG_TARGET := $(notdir $(CROSS_COMPILE:%-=%))
  ...
  CFLAGS += $(CLANG_CROSS_FLAGS)

With LLVM=1 and an empty CROSS_COMPILE, CC resolves to plain clang with no
--target, so lib/ynl.o and generated/*-user.o would be built for the host.

For the selftests path, tools/testing/selftests/lib.mk computes a
target-aware compiler from ARCH:

  CC := $(CLANG) $(CLANG_FLAGS) -fintegrated-as

but tools/testing/selftests/net/ynl.mk only forwards GENS and RSTS to the
sub-make:

  $(Q)$(MAKE) -C $(top_srcdir)/tools/net/ynl \
  	GENS="$(YNL_GENS)" RSTS="" libynl.a

Since ynl.mk forces the YNL_GEN_FILES targets (ncdevmem, toeplitz in
tools/testing/selftests/drivers/net/hw/Makefile) to link $(OUTPUT)/libynl.a,
does make LLVM=1 ARCH=arm64 -C tools/testing/selftests/drivers/net/hw fail at
link time with host objects in libynl.a against aarch64 objects?

If that configuration is out of scope for now, could the commit message say
so? The later patch "selftests: drv-net: Use cross-compilation environment
for the io_uring check" states the limitation explicitly ("this doesn't cover
the LLVM cross-compiling case though"), while this one reads as if the LLVM
case is handled.

[ ... ]

> diff --git a/tools/net/ynl/ynltool/Makefile b/tools/net/ynl/ynltool/Makefile
> index 48b0f32050f0..85cc0840b403 100644
> --- a/tools/net/ynl/ynltool/Makefile
> +++ b/tools/net/ynl/ynltool/Makefile
> @@ -1,12 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
>  include ../Makefile.deps
> +include ../../../scripts/Makefile.include
>  
>  INSTALL	?= install
>  prefix  ?= /usr
>  
> -CC := gcc
> -CFLAGS := -Wall -Wextra -Werror -O2
> +CFLAGS += -Wall -Wextra -Werror -O2
>  ifeq ("$(DEBUG)","1")
>    CFLAGS += -g -fsanitize=address -fsanitize=leak -static-libasan
>  endif

[Severity: Low]
This isn't a bug, but now that Makefile.include is pulled in here, the
existing Q assignment later in this same file disagrees with it:

tools/scripts/Makefile.include:
  ifeq ($(V),1)
    quiet =
    Q =
  else
    quiet = quiet_
    Q = @
  endif
  ...
  export quiet Q

tools/net/ynl/ynltool/Makefile, after the include:
  Q = @

  $(YNLTOOL): ../libynl.a $(OBJS)
  	$(Q)echo -e "\tLINK $@"
  	$(Q)$(CC) $(CFLAGS) -o $@ $(OBJS) ../libynl.a -lm

Since the local assignment comes after the include, does make V=1 -C
tools/net/ynl/ynltool still hide the CC and LINK command lines, which is
what one would want to look at when debugging a cross build? The same
overridden Q is also exported into the $(MAKE) -C ../ recursion for
../libynl.a. Could the local Q = @ line be dropped now?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260903155524.2241065-1-maxime.chevallier%40bootlin.com
