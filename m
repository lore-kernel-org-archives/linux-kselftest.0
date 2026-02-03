Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B5E25DB0D;
	Tue,  3 Feb 2026 21:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770154508; cv=none; b=FKiMPie4flH0b2+quV5Bi2bI3MwfAdWBEo0fOgH4oZfQyYCamu+u3zVmKvC8Qf3eM0PBVY8zsG5W36PuoKO6pmbxqY7jfkDcP9TEFY0ed+mPQmbzhynU92ABhQS1qE8mHJM2HcbKhw3Dlh5TT88f1ge+JZ6+HeHJKrMW4dsRg8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770154508; c=relaxed/simple;
	bh=oFX0C4fdZz7L/7wnPCWwkkaD+kBob1iCjMkch5/ls9E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pxnq1uLyXWOXVko91nYlxgRwGx0zjKIgycLSQz2QJ4F0uNXRx+YgMFLH5edOy5FNzM4xWepmlApbB2ODv0k409iwNNyovSTIjNKw9+V0ohznVt0jIZ7w+Xz/dup2Y0DY70i3Ay/P6wu5x4Syexy6DdCdMTqRdcv6S4D6iuntiOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEEHxe2V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEEHxe2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B3CC116D0;
	Tue,  3 Feb 2026 21:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770154507;
	bh=oFX0C4fdZz7L/7wnPCWwkkaD+kBob1iCjMkch5/ls9E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KEEHxe2VcgTjrD7JvmlMBtNQCOcbIEHkj9xBWExAueBm8EmbiewF5rNLSk8iPETlk
	 6axlT3IlZuMMckjehyVM1HdLIcaa9sXtRC23e+JtlHC7QLBBmMQet+WO+Cq3iwM7hw
	 yJeAWX4/4q0XRRT58pfEiOjbXhSUywZDNAT26DcYiB0Se+6Kti9Rpll3S6Q0K2c+cJ
	 doyERSk8o5EfqTyXbAWJF0qvg8DxnUuGoIR5xtgxHkocL3G79WduT9TbuvRgqPfosi
	 VGvpBBjyp8q+iLTEqUiuYoz9j/iWL6NHlqUcIoVtozVosTfS2ijAK5crXNP5zOU81m
	 SXcgaOtwD7YBw==
From: Thomas Gleixner <tglx@kernel.org>
To: Nylon Chen <nylon.chen@sifive.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Zong Li
 <zong.li@sifive.com>, Nylon Chen <nylon.chen@sifive.com>
Subject: Re: [PATCH] selftests/futex: skip futex_numa_mpol without libnuma
In-Reply-To: <20260128-b4-futex-test-v1-1-ce73742068ad@sifive.com>
References: <20260128-b4-futex-test-v1-1-ce73742068ad@sifive.com>
Date: Tue, 03 Feb 2026 22:35:04 +0100
Message-ID: <877bst33zr.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 28 2026 at 22:32, Nylon Chen wrote:

> Use pkg-config --exists numa to derive HAVE_LIBNUMA.
> Only keep futex_numa_mpol in TEST_GEN_PROGS when libnuma is present.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> ---
>  tools/testing/selftests/futex/functional/Makefile | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/testing/selftests/futex/functional/Makefile
> index af7ec309ea78..ec3c39a51182 100644
> --- a/tools/testing/selftests/futex/functional/Makefile
> +++ b/tools/testing/selftests/futex/functional/Makefile
> @@ -1,10 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0
>  PKG_CONFIG ?= pkg-config
> +HAVE_LIBNUMA := $(shell sh -c "$(PKG_CONFIG) --exists numa > /dev/null 2>&1 && echo y")
>  LIBNUMA_TEST = $(shell sh -c "$(PKG_CONFIG) numa --atleast-version 2.0.16 > /dev/null 2>&1 && echo SUFFICIENT || echo NO")

Why another test? LIBNUMA_TEST fails when it does not exist or when the
version number is not enough. 

>  INCLUDES := -I../include -I../../ $(KHDR_INCLUDES)
>  CFLAGS := $(CFLAGS) -g -O2 -Wall -pthread -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64 $(INCLUDES) $(KHDR_INCLUDES) -DLIBNUMA_VER_$(LIBNUMA_TEST)=1
> -LDLIBS := -lpthread -lrt -lnuma
>  
>  LOCAL_HDRS := \
>  	../include/futextest.h \
> @@ -27,6 +27,13 @@ TEST_GEN_PROGS := \
>  
>  TEST_PROGS := run.sh
>  
> +ifeq ($(HAVE_LIBNUMA),y)
> +LDLIBS := -lpthread -lrt -lnuma
> +else
> +LDLIBS := -lpthread -lrt
> +TEST_GEN_PROGS := $(filter-out futex_numa_mpol,$(TEST_GEN_PROGS))

Why? The test contains more than just the libnuma dependend stuff. There
are two issues here:

One is -lnuma, which is trivial to solve:

LDLIBS := -lpthread -lrt
ifeq ($(LIBNUMA_TEST),SUFFICIENT)
LDLIBS += -lnuma
endif

The other is the include <numa*.h> in the source. I assume you can
figure out how to prevent those headers from being included, right?

Thanks,

        tglx
