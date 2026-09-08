Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1302D56511A;
	Tue,  8 Sep 2026 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884242; cv=none; b=kHc80bpGLOk1RB3FV85/gxUAG2uwECMFyO4ScVnBjGkVhYJXVh5u/LgEzrXY1Wjgjh0QIdTtAgjzIHjkPzb61XUm2vGlLr/Hqe0GFwcJWPzKPqs51J004QsBFf6tTAjtbWUwyxf/zB+vxnW/7FxQKwEhuO80wxFc9ndM1Hoy6ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884242; c=relaxed/simple;
	bh=mpaFVyriRVwxZie3nUSonYwy6aTXt5fAlkbg/iUCwvs=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Df1SV7cLWfrDrR4HXwPiX2D4xZJEClUsB8XE2Ap6nmCfPPSU3zyMdJ61MfxckYzpaZLCteOObLHqgZFMkgMCjyhz5FoafJ5A0w5L4J6Vv3gAvzRUg3x1RaA9WFsqa7rjQlNy/02MmmxiZdYYoxB7ee90AtJFgGpmwajUMxtxL5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtCOvI5w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtCOvI5w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D023C1F00A3A;
	Tue,  8 Sep 2026 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788884240;
	bh=dJygEWdiBFnUxPVyHSXjDo/ZQNNJ59pd99ovvBKOnGk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WtCOvI5wTIOGvLiG6H+JUpuOJZQb/bfsUmIBLAFiMwiquPUpbpgujfILHrfchE15P
	 NfRwrT6jIaBBHyP6r852UicSSNW6T0LBvvFHR22VgYtlMxsWjVnsFUqRkiwoljWS4a
	 JRdQrGF8zJ0rYozpaud4D0KFcJKuY2uV85K2/z9NCx1ZNQ0kvrNWLmOj0kO3CeZQSY
	 JvgSc5iTrZgWHI5dIEGtl3G2zFhy5t5kAkxOMasJSX90XdaMnbFGiGXE2UViSR9cRg
	 zUGQKM6rkhDvAQ7gDt49CNaK3V8RNUfgUprPsctrvtlIeHT36EtwfonKhOPh82807e
	 3GbYbmnMtn4/w==
Subject: Re: [PATCH net-next v3 1/2] tools: ynl: Allow cross-compiling ynl and
 associated tools
From: netdev-bot+sashiko@kernel.org
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com, horms@kernel.org,
 shuah@kernel.org, matttbe@kernel.org, sdf@fomichev.me, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-kselftest@vger.kernel.org
Date: Tue, 08 Sep 2026 16:17:19 +0000
Message-ID: <178888423937.219967.10276622634271984772@kernel.org>
In-Reply-To: <20260907161438.755125-2-maxime.chevallier@bootlin.com>
References: <20260907161438.755125-2-maxime.chevallier@bootlin.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 0

- [Medium] tools/net/ynl/ynltool/Makefile now inherits the tools/ `O=` ->
  `OUTPUT` contract from tools/scripts/Makefile.include but only half-…
- [Medium] Removing the `CC=gcc` pin while letting Makefile.include
  select clang makes the GCC-only `-static-libasan` flag reach clang,…

--

tools: ynl: Allow cross-compiling ynl and associated tools

The four ynl Makefiles now include tools/scripts/Makefile.include so that
CC and AR honour CROSS_COMPILE and LLVM, the ynltool CFLAGS assignment is
switched from := to += and the local Q definition is dropped in favour of
the one from Makefile.include.

No Link: tags in the commit header.

Two questions below, one about O= handling in ynltool and one about
-static-libasan now that CC is no longer pinned to gcc.

> diff --git a/tools/net/ynl/Makefile b/tools/net/ynl/Makefile
> index 3cefe4ed96cb9..838c465d65aa8 100644
> --- a/tools/net/ynl/Makefile
> +++ b/tools/net/ynl/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> +include ../../scripts/Makefile.include
>  include ../../scripts/Makefile.arch
>  
>  INSTALL	?= install
> diff --git a/tools/net/ynl/generated/Makefile b/tools/net/ynl/generated/Makefile
> index ea4128f612d6c..5a186349b5a86 100644
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
> index 9b98c05996000..7b3eae89982f8 100644
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
> diff --git a/tools/net/ynl/tests/Makefile b/tools/net/ynl/tests/Makefile
> index 40827ca8e579d..99ae7dcd63484 100644
> --- a/tools/net/ynl/tests/Makefile
> +++ b/tools/net/ynl/tests/Makefile
> @@ -2,8 +2,8 @@
>  # Makefile for YNL tests
>  
>  include ../Makefile.deps
> +include ../../../scripts/Makefile.include
>  
> -CC=gcc

[Severity: Medium]

With the CC=gcc pin removed here, does a "make LLVM=1 -C tools/net/ynl"
build still complete?  Makefile.include picks clang for LLVM builds:

  ifneq ($(LLVM),)
  ...
    $(call allow-override,CC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))

and tests/Makefile turns the sanitizer flags on unless NDEBUG=1:

  ifneq ("$(NDEBUG)","1")
    CFLAGS += -g -fsanitize=address -fsanitize=leak -static-libasan
  endif

clang's driver does not accept -static-libasan.  Other selftests Makefiles
guard exactly this flag, for example
tools/testing/selftests/filesystems/openat2/Makefile:

  # gcc requires -static-libasan in order to ensure that Address Sanitizer's
  # library is the first one loaded. However, clang already statically links the
  # Address Sanitizer if -fsanitize is specified. Therefore, simply omit
  # -static-libasan for clang builds.
  ifeq ($(LLVM),)
      CFLAGS += -static-libasan
  endif

tests is listed in SUBDIRS of tools/net/ynl/Makefile and the default goal
is "all: $(SUBDIRS) libynl.a", so this is hit by a plain build with LLVM=1
(with or without CROSS_COMPILE, which is the configuration named in the
commit message).

The same unguarded flag sits on the DEBUG=1 paths of lib/Makefile,
generated/Makefile and ynltool/Makefile.  Should all four get the
ifeq ($(LLVM),) guard as part of this change?

>  CFLAGS += -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow \
>  	-I../lib/ -I../generated/ -I../../../testing/selftests/ \
>  	-idirafter $(UAPI_PATH)
> diff --git a/tools/net/ynl/ynltool/Makefile b/tools/net/ynl/ynltool/Makefile
> index 48b0f32050f0e..b8c67cdb4fdf0 100644
> --- a/tools/net/ynl/ynltool/Makefile
> +++ b/tools/net/ynl/ynltool/Makefile
> @@ -1,12 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
>  include ../Makefile.deps
> +include ../../../scripts/Makefile.include

[Severity: Medium]

Does pulling Makefile.include in here break "make O=<dir>" for ynltool?
Makefile.include translates a command line O= into OUTPUT:

  ifneq ($(O),)
  ifeq ($(origin O), command line)
          $(if $(shell cd $(PWD); test -d $(O) || echo $(O)),$(error O=$(O) does not exist),)
	  ABSOLUTE_O := $(shell cd $(PWD); cd $(O) ; pwd)
	  OUTPUT := $(ABSOLUTE_O)/$(if $(subdir),$(subdir)/)

ynltool/Makefile already names its targets with that prefix:

  OBJS := $(patsubst %.c,$(OUTPUT)%.o,$(SRCS))

  YNLTOOL := $(OUTPUT)ynltool

but the only object rule carries no $(OUTPUT) and does not create the
directory:

  %.o: %.c ../libynl.a
	$(Q)echo -e "\tCC $@"
	$(Q)$(COMPILE.c) -MMD -c -o $@ $<

For a target such as /tmp/out/ynl.o and a target pattern containing no
slash, make strips the directory, matches the stem, and re-prepends the
directory to the derived prerequisite, so it looks for /tmp/out/ynl.c.
There is no vpath and nothing creates /tmp/out, so does
"make -C tools/net/ynl/ynltool O=/tmp/out" stop with "No rule to make
target '/tmp/out/<name>.o', needed by '/tmp/out/ynltool'"?

Command line variables propagate through MAKEFLAGS, and the top level
recipe runs the sub-makes with

  $(SUBDIRS):
	@if [ -f "$@/Makefile" ] ; then \
		$(MAKE) -C $@ ; \
	fi

so "make -C tools/net/ynl O=/tmp/out" reaches the same path through the
default goal.  Other tools/ Makefiles that honour this interface spell the
rule as $(OUTPUT)%.o: %.c - would that plus an mkdir be the fix here?

The install rule interpolates the prefixed name too:

  install: $(YNLTOOL)
	$(INSTALL) -m 0755 $(YNLTOOL) $(DESTDIR)$(bindir)/$(YNLTOOL)

With OUTPUT set, does the destination become
$(DESTDIR)/usr/bin//tmp/out/ynltool rather than $(DESTDIR)/usr/bin/ynltool?

Related: lib/Makefile, generated/Makefile and tests/Makefile now include
Makefile.include but ignore OUTPUT entirely, so an O= build would keep
writing their objects into the source tree while only ynltool tries to
honour it.  Was leaving the four sub-makefiles inconsistent about O=
intentional, or should O= be rejected until they all handle it?

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

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260907161438.755125-1-maxime.chevallier%40bootlin.com
