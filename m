Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D762E2BE639
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 01:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788916322; cv=none; b=ezQ8AbCialSA/Ul2VfG32MiBqVRsTOAsudCzCjlZrwSwGQ4mQAoTC8JhQMAr9SAtAf4DE7KjrgQY5+eaYS2Gxngb4u8ADrqM/Qx9c672hiLIzw29Mj6Wpx9nSYJHEMzl0VlH0LOjmfiBi71UWjopAkHi4/UpI5qAL8phVtkpOp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788916322; c=relaxed/simple;
	bh=78YHx0yWVPDvUyOR4u9IIre+/Nu/Oz2FqNSImaYhDvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eD858PbiY7tO7fLka9bMohLlVLm6F3MhaWCxdMMQVeTBOn+nv2BrH7mslHpeqRkOHwTnDlN4AhgI22iJlIH/zGm8U6tzhipCC6PXsf1iLxTb5Nt3TQnRiPKc6JD990W9FwliqoafMM7nso3gvXrDHqyTV5UmCcIp1w/O/eJwGHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVOT3mJ3; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVOT3mJ3"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9b4b70so322263fac.0
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 18:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788916320; x=1789521120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=69NpNYRfiy3q+HXuUHJlVfVJ+ZNmTg+OdYZin1d+3V4=;
        b=aVOT3mJ3bTZdvPl3Gyb4h2YE1+QYhs5543Cdy6Q7VvquNJVtkUG0qqmvKguIfNmF6D
         OpbPcsa5l03LbNoVpcSnafwI12bbpfUaL1pB7kvpm/OAUsissldaEedGckjRR8t4xAqg
         VAC8MrMNEOx4tp7DTwW5wgc0uLmY1Hown1QCBN7jla+D0RAlFt6iWJYl3H8vC1Nyf2yH
         qizogNqjsK6ZbhCfSxc2NJ+Uy5x0HSWRbvhon58r6UgU5dpPbRUBE2im3nK1dcmExsKJ
         yaXEVIn0NkPhjnRJ2DLZi8MNL8C1UdUdyJDukJ7fYMSUwNYt7fzdNY6SiQNI7sU57yWf
         iNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788916320; x=1789521120;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69NpNYRfiy3q+HXuUHJlVfVJ+ZNmTg+OdYZin1d+3V4=;
        b=lXlf0O450YfSjPWWYvrfH61m8Q3HwEw9Ul5aR/mX19DV0R7zp0HHxbNawA2GZcti+L
         d0jcZkLy7kyCBXyhtbuDDuvtHjzMtDBPtdf5Ti48Ldav3PrZ/cuwy+q1km9hJVUbjP9H
         S6L9mNqyLGCKdrD0FCoonPbTSyGlaxzj2zYOiS5Bm7aOzZ0EuuULb+en2ezph0qF55DW
         AAxV2hUv4Yu40VtDaalTO5FgCFHIpTu9CZCtGGDi0J2EDfHGBnrMSgZBPEO517wlGney
         rfZiv2CqmOKWmBCcEaNsLkTmUQY2exGLM3s7wAQ7TnxEO++rl4D8z3+n5F1PgaTd9M4t
         DTYA==
X-Forwarded-Encrypted: i=1; AKwUvBzzbg/QPTdiEiZopAtroT0ldZvSq70j+o/DuL9VjtAPRWr42uoELoBurgwz/8Qct/EYRs/aC3YgtCB4W4uBIaI=@vger.kernel.org
X-Gm-Message-State: AFuF++nTmep1a0dKFDKJrAso4KuZFoWV5GGp/DdrXcCZWLzuuLcrvY3+
	UYBP3Qlx/OQHrn84dilazmnj3Cyn8d/rmSH3bnMHbbtr205nT/TNvG2v
X-Gm-Gg: AYBFou3sTzcb3Vibd4elTAvBiAEQ3qh8hIVo8CqLp9vBK9l3nOIVR2iVxjGEV+/orSd
	8QFTOVMdrO956cHSufJZyW+wLSJ2jQBVEzFe2IgWiOiNgbIf7OtTfBzPrKavAMQibh8lQYZzn0W
	vL6JrudUq+xc3gK/C4lawnX/5CXAm3PgdubiYdOgOAiA3NXGpnSiXrzYzWjyNecHD+KrBp0A7+K
	X3CU9Ys3MCFgP34brQg0lW1o09YWYuNIGKRaeblxrZjsDxlxJPW4PAd6maI6NoX1DAmWDFZ3ovH
	TcVY1UegpMt7cgiBJMuARDTnArub/OgHQhapToM+IdZEfx5+Nr+Suu4peGkS5z0IDHWMkWufSs3
	oC6WXkxhf8a5YF3AXK6niDjdO4bE4lGo2kox2IoWQAxo48zIn+V6CTvchugCFyz5xzYakw7EMJg
	8dj3B+XAe82ZE65GKyDPhssVBL8w+EaOVVQri9V5vucl2tqBTuoVDeoSKXPam9ByWQZaBQME7K0
	ZMaJkeo0uSJxBzSIK/z
X-Received: by 2002:a05:6820:60e:b0:6b5:ec3f:4988 with SMTP id 006d021491bc7-6bc27fe0322mr3929278eaf.35.1788916319677;
        Tue, 08 Sep 2026 18:11:59 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:53::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc38bsm17083879eaf.4.2026.09.08.18.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 18:11:57 -0700 (PDT)
Date: Tue, 8 Sep 2026 18:11:53 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	matttbe@kernel.org, Stanislav Fomichev <sdf@fomichev.me>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/2] tools: ynl: Allow cross-compiling ynl
 and associated tools
Message-ID: <aqCyWQxqKDuQnZYR@devvm29614.prn0.facebook.com>
References: <20260907161438.755125-1-maxime.chevallier@bootlin.com>
 <20260907161438.755125-2-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907161438.755125-2-maxime.chevallier@bootlin.com>

On Mon, Sep 07, 2026 at 06:14:35PM +0200, Maxime Chevallier (Netdev Foundation) wrote:
> The ynl tool and libraries may be built standalone or through the
> drivers/net/hw selftest machinery. This may target a different arch, so
> we need to take the CROSS_COMPILE variable into account for LLVM and
> gcc.
> 
> Let's include the tools/scripts/Makefile.include that deals with the
> CC/AR resolution.
> 
> Fixup the ynltool CFLAGS handling to use +=, so that we don't override
> the ones set in Makefile.include.
> 
> Makefile.include also sets the Q variable for verbose mode, so we can
> drop it from the ynltool Makefile. This will allow properly selection
> the verbosity of ynltool builds with the V=1 make flag.
> 
> Reviewed-by: Matthieu Baerts (Netdev Foundation) <matttbe@kernel.org>
> Signed-off-by: Maxime Chevallier (Netdev Foundation) <maxime.chevallier@bootlin.com>

Hey Maxime,

It seems that this patch may break some invocations of make:

  # make -C tools/net/ynl/ynltool O=/tmp/o1
  make: Entering directory '/data/users/bobbyeshleman/linux-worktrees/review/tools/net/ynl/ynltool'
  make: *** No rule to make target '/tmp/o1/json_writer.o', needed by '/tmp/o1/ynltool'.  Stop.
  make: Leaving directory '/data/users/bobbyeshleman/linux-worktrees/review/tools/net/ynl/ynltool'

Best,
Bobby

> ---
>  tools/net/ynl/Makefile           | 1 +
>  tools/net/ynl/generated/Makefile | 3 ++-
>  tools/net/ynl/lib/Makefile       | 3 ++-
>  tools/net/ynl/tests/Makefile     | 2 +-
>  tools/net/ynl/ynltool/Makefile   | 6 ++----
>  5 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/net/ynl/Makefile b/tools/net/ynl/Makefile
> index 3cefe4ed96cb..838c465d65aa 100644
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
> diff --git a/tools/net/ynl/tests/Makefile b/tools/net/ynl/tests/Makefile
> index 40827ca8e579..99ae7dcd6348 100644
> --- a/tools/net/ynl/tests/Makefile
> +++ b/tools/net/ynl/tests/Makefile
> @@ -2,8 +2,8 @@
>  # Makefile for YNL tests
>  
>  include ../Makefile.deps
> +include ../../../scripts/Makefile.include
>  
> -CC=gcc
>  CFLAGS += -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow \
>  	-I../lib/ -I../generated/ -I../../../testing/selftests/ \
>  	-idirafter $(UAPI_PATH)
> diff --git a/tools/net/ynl/ynltool/Makefile b/tools/net/ynl/ynltool/Makefile
> index 48b0f32050f0..b8c67cdb4fdf 100644
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
> @@ -27,8 +27,6 @@ include $(wildcard *.d)
>  
>  all: $(YNLTOOL)
>  
> -Q = @
> -
>  $(YNLTOOL): ../libynl.a $(OBJS)
>  	$(Q)echo -e "\tLINK $@"
>  	$(Q)$(CC) $(CFLAGS) -o $@ $(OBJS) ../libynl.a -lm
> -- 
> 2.55.0
> 
