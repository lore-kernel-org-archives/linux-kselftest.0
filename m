Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A812D877B
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 20:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541685; cv=none; b=oMgXYgdqfrfiXxDCrlv7uUmVpHn2UMB5eM4q+vnQ7GUTT9gGB5V5uZpTZIDwecN2jr0ff5yBUppkxI3+jViewDUP0e5Mhj8F3KvzJEme5R/AKmvxOMJV81JTFVC8gJF2vWcX7joTmq3fTRrK/wzS87EQ2BlabiiM1GZt0/hxkKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541685; c=relaxed/simple;
	bh=HBj6qiAQI/qqiQMcq1LilzS9r+rDo/koSKCkhyRsnnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aboS9xGvx5okzjQD1iuPmsbhE5O9DDq8KpvOXi/am6BO6VcZbPCy4pbF+cMNbYTZ7cxYsyIu3asG2HZwHbog+gSMIe2FyexPwZA0d4Jn4MoKDWfIRTHtFFuh1ABvVU6S7AI0ZT00CZqvoSq1Q97iD6SHP39uyhsQ98JE8+jgGT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HLn5cqVQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=r1rMs5o0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HLn5cqVQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="r1rMs5o0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783541682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/dH7u+EpgXCIs6Pm5DlLAIaA07OdnJPol506/hGZPc=;
	b=HLn5cqVQMTbWEg5cIleHdCc/JPe/+HBMSOqlTJuKaleHQhU0QTMRjzSe0MQ77diEGakZAe
	xT6yx2x3kIIdzK6WRTDjm2Cvmr5ICpCpUN24KWYHP0/jj6/Q2P6MuuTiGT9CsfEA9a5qkf
	4J5siHidtqkz8xtsHO5dI4bwh7hJAgA=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-rKG-xex9Puuzz1hfMDEN8w-1; Wed, 08 Jul 2026 16:14:41 -0400
X-MC-Unique: rKG-xex9Puuzz1hfMDEN8w-1
X-Mimecast-MFC-AGG-ID: rKG-xex9Puuzz1hfMDEN8w_1783541680
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9f6a49e69so1414220a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 13:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783541680; x=1784146480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/dH7u+EpgXCIs6Pm5DlLAIaA07OdnJPol506/hGZPc=;
        b=r1rMs5o0zgqB2Qy2n+L+qMAjVyXbV/TSSME9omIlp9eYu1SdNMXbd+J05Ltec/a0Yc
         RBCXu4g8zuXUEx90qqWnmYTmXIU9foE+IJDbn+1wh3Owdps4Q4kMZ5iJMOCFsKOhFmpB
         GCr03+USwedWqRQdd6hPBdwLsOsfgehoNob98N+xwfkMZTWwKZ3YDNgch0S2t+vQDNdg
         4wqdB+vih0+prRVHHtMsMZfEaGL/dxWGDBJumGh8zNrSm+hXJqzPAWm9IzFcp4HD+1EL
         9qd4I4BFY51ewSS4m3Bv2WWhy3k4fJMaRNEC0/Tggg5m938pTW0ToNCIe+F94dJUXdmG
         DqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783541680; x=1784146480;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/dH7u+EpgXCIs6Pm5DlLAIaA07OdnJPol506/hGZPc=;
        b=rROJYDqzB2vGOfhQE7UzatArH6NMWyMFaZlpegzj46VfF+F1zsyvdyLOJvK6Ven1b0
         56q++LjN0n23lEeUBcToEgOgQL921JqAVEsCKM0tTmT6J5nWBwS7ObNYz2+V3kQEfeJN
         /9qtt3fgn47u1JgzmUEBBj2xlzPi+D4tBjiN2U5LhAGT6CmrM6neL8visoC2/RuP8can
         R5VlIYPd8PIkUN4N5/pz74gdp/rDAOnCAscXdozys9MfIdTLBiNr+eBwBlWKZtVo1mT0
         w8lf7AcEHQW6S4ss2H9FwyZohdiqJtduZnMOTvYiRtOeZDqS9NJt7GQoOd4odk0AUyvF
         QKzQ==
X-Gm-Message-State: AOJu0YzCGpZEw1P0Fuzu7sSEofUnlv/5i280elr81phJg5bQrCpgwmoW
	NlLj++Lcmn0s05DH47AqCyKAwvoEAgFbNoPMW9hsYeZ+N981LhbAAtBFCXpbaMak0iVdpNKjrNy
	k7P1cpgMjksyCHZBmrjQ/UcijHJXUNF5HKM41nFtTfmwQ5gsv0DQlpCvmuSAbfwUFl36FUw==
X-Gm-Gg: AfdE7cl+tOvHPWwgA5awKVLM2x/YRsyE5b6XPaGCZzu/pdfKWmuBMZbnfHm388a6AtM
	K0Evwa7SZOSYtofTQKG5rM+5j8LZbkt9Ch3MbznD5NvBTBCFblpurwT7BzYVSGYahgzlXyt5L0h
	ty912ecZvOpwoQf46tU90U8U2csRepdOuhi72RiAxzhqXs2Jn1HS2IdJ9yfownYkhjDkQRjTQhc
	lH6zxeOe2lHUWgx3KFIzTPjOyIZTmScmJQMLRjo0OKXmgIgEKMjPH3gBbK/VATTm1XafRtrVqVt
	0KRqri4cq6nMQNTuvWfKWMSWVB5daTjGhmmsDN4eri2pShDW9bzmh2fPOuujOIf5q7xrEJ4Yjd8
	zMkvs8jNhGw==
X-Received: by 2002:a05:6830:2589:b0:7e3:d199:3164 with SMTP id 46e09a7af769-7ebcfe7ad5bmr2983117a34.11.1783541680265;
        Wed, 08 Jul 2026 13:14:40 -0700 (PDT)
X-Received: by 2002:a05:6830:2589:b0:7e3:d199:3164 with SMTP id 46e09a7af769-7ebcfe7ad5bmr2983090a34.11.1783541679717;
        Wed, 08 Jul 2026 13:14:39 -0700 (PDT)
Received: from [192.168.8.207] ([45.81.3.233])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb2631dfsm2528223a34.13.2026.07.08.13.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 13:14:38 -0700 (PDT)
Message-ID: <9b0fb337-88e5-484c-8618-09ed2274444e@redhat.com>
Date: Wed, 8 Jul 2026 14:16:12 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: do not override CFLAGS set by the build
 environment
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>,
 Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Seth Forshee <sforshee@kernel.org>,
 Tony Luck <tony.luck@intel.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Dave Martin <Dave.Martin@arm.com>,
 James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Abhinav Saxena <xandfury@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, raquini@redhat.com
References: <20260306002100.519673-1-aleksey.oladko@virtuozzo.com>
From: Nico Pache <npache@redhat.com>
Content-Language: en-US
In-Reply-To: <20260306002100.519673-1-aleksey.oladko@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/5/26 5:21 PM, Aleksei Oladko wrote:
> Some kselftests Makefiles assign CFLAGS using 'CFLAGS=...'
> which overrides any CFLAGS provided by the build environment.
> 
> If the environment set flags, overriding CFLAGS may result in
> inconsistent compiler and linker options and cause build failures,
> for example when building PIE binaries:
> 
>   # export CFLAGS="-fPIE"
>   # export LDFLAGS="-pie"
>   # make -C tools/testing/selftests/ TARGETS=mount_setattr
>   make: Entering directory '/build/kernel/tools/testing/selftests'
>   make[1]: Entering directory '/build/kernel/tools/testing/selftests/mount_setattr'
>     CC       mount_setattr_test
>   /usr/bin/ld: warning: -z pack-relative-relocs ignored
>   /usr/bin/ld: /tmp/ccikConN.o: relocation R_X86_64_32 against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIE
>   collect2: error: ld returned 1 exit status
>   make[1]: *** [../lib.mk:222: /build/kernel/tools/testing/selftests/mount_setattr/mount_setattr_test] Error 1
> 
> Fix this by appending to CFLAGS using 'CFLAGS+=' instead of
> overriding them.
> 
> The fix is not applied to the Makefiles in x86, riscv, mm, arm64
> and powerpc as they fully define their flags.
> 
> Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>

This is very much needed (I cant confirm for all the cases you changed here but
we are experiencing the same thing internally).

However this does not apply. Can you please do a refresh/RESEND and hopefully
you get more attention on the second round.

Cheers,
-- Nico


> ---
>  tools/testing/selftests/efivarfs/Makefile             | 2 +-
>  tools/testing/selftests/exec/Makefile                 | 2 +-
>  tools/testing/selftests/firmware/Makefile             | 4 ++--
>  tools/testing/selftests/ipc/Makefile                  | 4 ++--
>  tools/testing/selftests/mount/Makefile                | 4 ++--
>  tools/testing/selftests/mount_setattr/Makefile        | 2 +-
>  tools/testing/selftests/move_mount_set_group/Makefile | 2 +-
>  tools/testing/selftests/resctrl/Makefile              | 2 +-
>  tools/testing/selftests/safesetid/Makefile            | 2 +-
>  tools/testing/selftests/signal/Makefile               | 2 +-
>  tools/testing/selftests/timens/Makefile               | 2 +-
>  tools/testing/selftests/tty/Makefile                  | 2 +-
>  tools/testing/selftests/vDSO/Makefile                 | 2 +-
>  13 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/testing/selftests/efivarfs/Makefile b/tools/testing/selftests/efivarfs/Makefile
> index e3181338ba5e..f6c412059af3 100644
> --- a/tools/testing/selftests/efivarfs/Makefile
> +++ b/tools/testing/selftests/efivarfs/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -CFLAGS = -Wall
> +CFLAGS += -Wall
>  
>  TEST_GEN_FILES := open-unlink create-read
>  TEST_PROGS := efivarfs.sh
> diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selftests/exec/Makefile
> index 45a3cfc435cf..54cdefb9ccb0 100644
> --- a/tools/testing/selftests/exec/Makefile
> +++ b/tools/testing/selftests/exec/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -CFLAGS = -Wall
> +CFLAGS += -Wall
>  CFLAGS += -Wno-nonnull
>  CFLAGS += $(KHDR_INCLUDES)
>  
> diff --git a/tools/testing/selftests/firmware/Makefile b/tools/testing/selftests/firmware/Makefile
> index 7992969deaa2..dd9acf972cf5 100644
> --- a/tools/testing/selftests/firmware/Makefile
> +++ b/tools/testing/selftests/firmware/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  # Makefile for firmware loading selftests
> -CFLAGS = -Wall \
> -         -O2
> +CFLAGS += -Wall \
> +          -O2
>  
>  TEST_PROGS := fw_run_tests.sh
>  TEST_FILES := fw_fallback.sh fw_filesystem.sh fw_upload.sh fw_lib.sh
> diff --git a/tools/testing/selftests/ipc/Makefile b/tools/testing/selftests/ipc/Makefile
> index 50e9c299fc4a..5a5577767a35 100644
> --- a/tools/testing/selftests/ipc/Makefile
> +++ b/tools/testing/selftests/ipc/Makefile
> @@ -3,11 +3,11 @@ uname_M := $(shell uname -m 2>/dev/null || echo not)
>  ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/i386/)
>  ifeq ($(ARCH),i386)
>          ARCH := x86
> -	CFLAGS := -DCONFIG_X86_32 -D__i386__
> +	CFLAGS += -DCONFIG_X86_32 -D__i386__
>  endif
>  ifeq ($(ARCH),x86_64)
>  	ARCH := x86
> -	CFLAGS := -DCONFIG_X86_64 -D__x86_64__
> +	CFLAGS += -DCONFIG_X86_64 -D__x86_64__
>  endif
>  
>  CFLAGS += $(KHDR_INCLUDES)
> diff --git a/tools/testing/selftests/mount/Makefile b/tools/testing/selftests/mount/Makefile
> index 2d9454841644..38361a896363 100644
> --- a/tools/testing/selftests/mount/Makefile
> +++ b/tools/testing/selftests/mount/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Makefile for mount selftests.
> -CFLAGS = -Wall \
> -         -O2
> +CFLAGS += -Wall \
> +          -O2
>  
>  TEST_PROGS := run_unprivileged_remount.sh run_nosymfollow.sh
>  TEST_GEN_FILES := unprivileged-remount-test nosymfollow-test
> diff --git a/tools/testing/selftests/mount_setattr/Makefile b/tools/testing/selftests/mount_setattr/Makefile
> index 4d4f810cdf2c..fbdb8f69b548 100644
> --- a/tools/testing/selftests/mount_setattr/Makefile
> +++ b/tools/testing/selftests/mount_setattr/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Makefile for mount selftests.
> -CFLAGS = -g $(KHDR_INCLUDES) -Wall -O2 -pthread
> +CFLAGS += -g $(KHDR_INCLUDES) -Wall -O2 -pthread
>  
>  LOCAL_HDRS += ../filesystems/wrappers.h
>  
> diff --git a/tools/testing/selftests/move_mount_set_group/Makefile b/tools/testing/selftests/move_mount_set_group/Makefile
> index 94235846b6f9..8771a5491ea3 100644
> --- a/tools/testing/selftests/move_mount_set_group/Makefile
> +++ b/tools/testing/selftests/move_mount_set_group/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Makefile for mount selftests.
> -CFLAGS = -g $(KHDR_INCLUDES) -Wall -O2
> +CFLAGS += -g $(KHDR_INCLUDES) -Wall -O2
>  
>  TEST_GEN_FILES += move_mount_set_group_test
>  
> diff --git a/tools/testing/selftests/resctrl/Makefile b/tools/testing/selftests/resctrl/Makefile
> index 984534cfbf1b..1d566a91faa7 100644
> --- a/tools/testing/selftests/resctrl/Makefile
> +++ b/tools/testing/selftests/resctrl/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2
> +CFLAGS += -g -Wall -O2 -D_FORTIFY_SOURCE=2
>  CFLAGS += $(KHDR_INCLUDES)
>  
>  TEST_GEN_PROGS := resctrl_tests
> diff --git a/tools/testing/selftests/safesetid/Makefile b/tools/testing/selftests/safesetid/Makefile
> index e815bbf2d0f4..d3811515d8e3 100644
> --- a/tools/testing/selftests/safesetid/Makefile
> +++ b/tools/testing/selftests/safesetid/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Makefile for SafeSetID selftest.
> -CFLAGS = -Wall -O2
> +CFLAGS += -Wall -O2
>  LDLIBS = -lcap
>  
>  TEST_PROGS := safesetid-test.sh
> diff --git a/tools/testing/selftests/signal/Makefile b/tools/testing/selftests/signal/Makefile
> index e0bf7058d19c..6c437f95132d 100644
> --- a/tools/testing/selftests/signal/Makefile
> +++ b/tools/testing/selftests/signal/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -CFLAGS = -Wall
> +CFLAGS += -Wall
>  TEST_GEN_PROGS = mangle_uc_sigmask
>  TEST_GEN_PROGS += sas
>  
> diff --git a/tools/testing/selftests/timens/Makefile b/tools/testing/selftests/timens/Makefile
> index f0d51d4d2c87..357077792395 100644
> --- a/tools/testing/selftests/timens/Makefile
> +++ b/tools/testing/selftests/timens/Makefile
> @@ -1,7 +1,7 @@
>  TEST_GEN_PROGS := timens timerfd timer clock_nanosleep procfs exec futex vfork_exec
>  TEST_GEN_PROGS_EXTENDED := gettime_perf
>  
> -CFLAGS := -Wall -Werror -pthread
> +CFLAGS += -Wall -Werror -pthread
>  LDLIBS := -lrt -ldl
>  
>  include ../lib.mk
> diff --git a/tools/testing/selftests/tty/Makefile b/tools/testing/selftests/tty/Makefile
> index 7f6fbe5a0cd5..e9c22dafe5e1 100644
> --- a/tools/testing/selftests/tty/Makefile
> +++ b/tools/testing/selftests/tty/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -CFLAGS = -O2 -Wall
> +CFLAGS += -O2 -Wall
>  TEST_GEN_PROGS := tty_tstamp_update tty_tiocsti_test
>  LDLIBS += -lcap
>  
> diff --git a/tools/testing/selftests/vDSO/Makefile b/tools/testing/selftests/vDSO/Makefile
> index e361aca22a74..1f4628ceb975 100644
> --- a/tools/testing/selftests/vDSO/Makefile
> +++ b/tools/testing/selftests/vDSO/Makefile
> @@ -11,7 +11,7 @@ TEST_GEN_PROGS += vdso_test_correctness
>  TEST_GEN_PROGS += vdso_test_getrandom
>  TEST_GEN_PROGS += vdso_test_chacha
>  
> -CFLAGS := -std=gnu99 -O2 -Wall -Wstrict-prototypes
> +CFLAGS += -std=gnu99 -O2 -Wall -Wstrict-prototypes
>  
>  ifeq ($(CONFIG_X86_32),y)
>  LDLIBS += -lgcc_s

