Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901547;
	b=OR+M1b1rmOFE7+gRj7hTpohVvrk8IgUQUPBKz5E8W2wt/mWw5FAZu3Yo5CQWZI1b/nRt
	 DDnkO3Jn5EO/iy4mhvcnppJWyj8KcXCxjDnq0xdWrWF6Of+cMVPri9kEHgeJr3qXgS119
	 tzFn21K+xfPQJaj1xn0JWMj1wzf5mSbgWTeB11Zou6DVVr4uXBcx6Iafq4Ea/6Rfnhi3M
	 xV8FASKd8Gah2TNn5/o1jhQnENy+6qVhKMJ0CfH/sv1clqpPI+Iwlt4Hof2RiN5plHYq/
	 pNvG8s/wIA+cYs/qVMARILo2Fp9f+QcVH92NpOVi6GbX/FKdSQong53XlQj1wmlX50g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Y7xeTFp5Z0R3BfvoCv14UiADEzEqwyyGG4Zubwum7Zo=;
	b=wcdFmUfnGZEtIwiLQvnItmeV9qePe0iui4xGujFKMxqvCvn3GUo/QhxN7+ObBTrEIe6l
	 jxLMm2Z9gmKoJ6QnKWUpSNZvRDxtXJrYzLaTNsuugsr9HBJz3C80Tg02u0yQll4UYtbJ7
	 ZDkqftGSmf4jMj3ca6UdIAfVJwpkZJL6o63TFHQVvLU3sYvm+q2Rt7om9a7feUSf7n8ZC
	 JXRFx7wxvQS3fFfWTMNBbKraSClcLugPEJLwxom8xprLuaTSDaf5+9QsFdzjB18U51kiI
	 /z34yZ3m6ve+Zod5c8qH7sbBzzJAwYobAfxlwZCYO33B11Jgp9IZyqdc0/JI8pIj74A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=dqJ44NkJ;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A21606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 17:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A21606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=dqJ44NkJ
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-854b6e2e41fso1237005a34.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 09:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1793901546; x=1794506346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y7xeTFp5Z0R3BfvoCv14UiADEzEqwyyGG4Zubwum7Zo=;
        b=dqJ44NkJPiwGo2V96AHNwnQBndqAun+3UlTEsRT5Q7d+2bWxgD7zUbx4MAcSW3OVLv
         CpBI53xmJwrpxIDNzDkdWDhm46YxXpkmMEcMoo21KCOT6WzLpQ1jaVjd/wbajl90/xrS
         yFU5mkfQmPn1aCJBfCzRgxAhqy/lV6uDGRUtgtL4MRshxyqUrJ/Z1QGVUMk5qhT60yIM
         3mueNUrasfH/oVVd4ADB7ZQ4HcaGDYdEsKHNoy1BJK/tdieMGN9OOtYaSBZXcnbErdNJ
         YzSdAA2Dcnj4lQPwhMNUDyr3pYllAFHoZKHXfH4LsR6RfDYP+QDWA3gCThLqLMeChKPD
         teSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901546; x=1794506346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7xeTFp5Z0R3BfvoCv14UiADEzEqwyyGG4Zubwum7Zo=;
        b=VSmyNrqboo3qV/WLwdiqO8i1OlWri5ENYkxNUqsXV2avoFsT3L8qSA3HHJRb+6tTIg
         bifDi1LrmpqdjxguxMnYsz+jJq1sWLBfmOjiEAdYc2fzQ+NM2PePKrSnT99FC2q8oXoo
         givFW6OHt8Bfbobl2cVxfh8yJ85z+qsB5sHblX5cDn8gk61B8UkcD1a4dF23fV3AmSdK
         4crmDSxo7yQg8G/0+taueAMJMO5yCYsjtL2o7JqA0+EgFYTOYJ5Q1F5zG3mJHTZ4HZqj
         4js79fkjFxYIJXhdJLDt/lod+ZDrNc2+LuNfxcJmYQO3exto6n+1Muvomfx4O09anqc4
         oJEA==
X-Forwarded-Encrypted: i=1; AKwUvByI4dLGGWQnUa+dYGlyIlPMVMOHPIVtq2qqQoOx1+tBUmDh/YUGFxPsSKD9uIBcTHjC6BcY+XZRfYmOmquloM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R0uDUbkP2Q6RXoDuTGX9B8smzppTTmhVSvoxJ10dQVn4exqLY
	8VYDV70k7yniWHt8Sqfw64g3knJWWJzeXPEn2PhlIS+6K47Th9HdedXfZCA2bEzQcog=
X-Gm-Gg: AYBFou3I7seLlxJAFYcbRw1jFR2tBp16VNeh3cuzbaWqnAcrjStHO9NTYIcC4HKxys2
	ZGbiCjAM+likL08Z1I9Fm3MJLAE5E/JKHMk1xkSboEFhzZTSmmT/rD4pW9xwOP8uT+uXIVL3uN9
	WDczNrZw1GkEi/Qj2YvGrptwhxcHAL1V+os73eKcuHIccbTlW71zbY6y7Er5vuP0GSKKYKule4w
	LW70VoKhKW8xuNuHd3PdD4piQ/CeaMj5i13E8Yy9l3nElUKrnwpeSiWnfP9YRKWUSYnHkD++7yo
	9bP2K+TWR85lFEtXyjSRL07+zYuZJ1RCVWdV8iAoKkqtaaUqtasdULAtYnA5VGl0TumS2RvZO0l
	5gu1JOzIX4/+b0/PLTgylHD+Tww6eSliVBqpLpm9FCxXYD3HgeJME8lRw0taV1tRH7x84kTYw4R
	K+xPkBPyH5UhfsN6smgvGXFuq7q5CLJm3i8LD8pRdlMwp2c3qJPoV1kaRhksYzJe5yLRMimknXo
	RqlNKcwdoTj7nTGncOrg7mwMtARMvdi882akqhVeXFxzRqy5FMMsGwJmGqoXNbf9L7kMLH62jIk
	gCCpP6j3JjbeqUFMTvROcavwyJb05yc8lqwyvjs=
X-Received: by 2002:a05:6830:2b0e:b0:85c:4897:f2ff with SMTP id 46e09a7af769-85f1d0de43bmr99174a34.25.1793901545806;
        Thu, 05 Nov 2026 09:59:05 -0800 (PST)
Received: from localhost ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e603b9sm5021990a34.20.2026.11.05.09.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:59:05 -0800 (PST)
Date: Thu, 5 Nov 2026 11:59:04 -0600
From: Andy Chiu <tchiu@tenstorrent.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <andybnac@gmail.com>,
	Guobin Zhang <guobin.zhang@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests: riscv: test FP state restore when
 rt_sigreturn() faults
Message-ID: <auzD6JgYSnW186Bb@Tao-Chiu's-Mac>
References: <20261031161826.858908-1-nickolai@csail.mit.edu>
 <20261031161826.858908-3-nickolai@csail.mit.edu>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031161826.858908-3-nickolai@csail.mit.edu>

Hi Nickolai,

On Sat, Oct 31, 2026 at 12:18:26PM -0400, Nickolai Zeldovich wrote:
> Add a test for the previous patch: the signal frame sits on a
> userfaultfd page that the handler drops after dirtying the FP
> registers, so rt_sigreturn() sleeps in the middle of copying the FP
> registers from the frame. The interrupted code must get its own
> registers back.
> 
> The test is skipped without the D extension or when userfaultfd is not
> available to the caller.
>

The test is failing on qemu, with or without the patch applied.

> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
>  .../selftests/riscv/sigreturn/.gitignore      |   1 +
>  .../selftests/riscv/sigreturn/Makefile        |   5 +-
>  .../selftests/riscv/sigreturn/fp_restore.c    | 146 ++++++++++++++++++
>  3 files changed, 151 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/riscv/sigreturn/fp_restore.c
> 
> diff --git a/tools/testing/selftests/riscv/sigreturn/.gitignore b/tools/testing/selftests/riscv/sigreturn/.gitignore
> index 35002b8ae780..8ed282ecb618 100644
> --- a/tools/testing/selftests/riscv/sigreturn/.gitignore
> +++ b/tools/testing/selftests/riscv/sigreturn/.gitignore
> @@ -1 +1,2 @@
> +fp_restore
>  sigreturn
> diff --git a/tools/testing/selftests/riscv/sigreturn/Makefile b/tools/testing/selftests/riscv/sigreturn/Makefile
> index 8c77508641f3..ac7ae7a7c2ae 100644
> --- a/tools/testing/selftests/riscv/sigreturn/Makefile
> +++ b/tools/testing/selftests/riscv/sigreturn/Makefile
> @@ -4,9 +4,12 @@
>  
>  CFLAGS += -I$(top_srcdir)/tools/include
>  
> -TEST_GEN_PROGS := sigreturn
> +TEST_GEN_PROGS := sigreturn fp_restore
>  
>  include ../../lib.mk
>  
>  $(OUTPUT)/sigreturn: sigreturn.c
>  	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
> +
> +$(OUTPUT)/fp_restore: fp_restore.c
> +	$(CC) -static -pthread -o $@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/sigreturn/fp_restore.c b/tools/testing/selftests/riscv/sigreturn/fp_restore.c
> new file mode 100644
> index 000000000000..1a56684c5f28
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/sigreturn/fp_restore.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Check that rt_sigreturn() restores the FP registers from the signal
> + * frame when the copy of the frame sleeps on a page fault while the
> + * handler's FP state is dirty.  The frame is placed on a userfaultfd
> + * page that the handler drops, so the copy faults after f0-f15.
> + */
> +#include <fcntl.h>
> +#include <pthread.h>
> +#include <signal.h>
> +#include <stdint.h>
> +#include <string.h>
> +#include <sys/auxv.h>
> +#include <sys/ioctl.h>
> +#include <sys/mman.h>
> +#include <sys/syscall.h>
> +#include <ucontext.h>
> +#include <unistd.h>
> +#include <asm/hwcap.h>
> +#include <linux/userfaultfd.h>
> +#include "kselftest_harness.h"
> +
> +#define PAGE		4096UL
> +#define STACK_SIZE	65536UL
> +/* the page boundary falls this far into the FP image, after f0-f15 */
> +#define SPLIT		128
> +
> +#define F0_15	"0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15"
> +/* caller-saved only, so the handler's epilogue does not reload them */
> +#define HANDLER_REGS	"0, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15"
> +
> +static uint64_t pattern[16], handler_pattern[16];
> +static void *saved;
> +static int placed;
> +
> +static void handler(int sig, siginfo_t *si, void *context)
> +{
> +	ucontext_t *uc = context;
> +	unsigned long split = (unsigned long)&uc->uc_mcontext.__fpregs + SPLIT;
> +
> +	placed = !(split & (PAGE - 1));
> +	if (placed) {
> +		/* rt_sigreturn() will fault on this page and wait for serve() */
> +		memcpy(saved, (void *)split, PAGE);
> +		if (madvise((void *)split, PAGE, MADV_DONTNEED))
> +			_exit(1);
> +	}
> +	asm volatile(".irp i, " HANDLER_REGS "\n"
> +		     "fld f\\i, \\i * 8(%[h])\n"
> +		     ".endr\n"
> +		     : : [h] "r" (handler_pattern)
> +		     : "memory", "ft0", "ft1", "ft2", "ft3", "ft4", "ft5",
> +		       "ft6", "ft7", "fa0", "fa1", "fa2", "fa3", "fa4", "fa5");
> +}
> +
> +static void *serve(void *arg)
> +{
> +	struct uffdio_copy copy = { .src = (unsigned long)saved, .len = PAGE };
> +	struct uffd_msg msg;
> +	int fd = (long)arg;
> +
> +	while (read(fd, &msg, sizeof(msg)) == sizeof(msg)) {
> +		copy.dst = msg.arg.pagefault.address & ~(PAGE - 1);
> +		copy.copy = 0;
> +		ioctl(fd, UFFDIO_COPY, &copy);
> +	}
> +	return NULL;
> +}
> +
> +TEST(fp_restore_frame_fault)
> +{
> +	struct sigaction sa = {
> +		.sa_sigaction = handler,
> +		.sa_flags = SA_SIGINFO | SA_ONSTACK,
> +	};
> +	struct uffdio_api api = { .api = UFFD_API };
> +	struct uffdio_register reg = { .mode = UFFDIO_REGISTER_MODE_MISSING };
> +	stack_t ss = { .ss_size = STACK_SIZE };
> +	long pid = getpid(), tid = syscall(__NR_gettid);
> +	uint64_t out[16];
> +	unsigned long fcsr, shift;
> +	pthread_t thread;
> +	int fd, i;
> +
> +	if (!(getauxval(AT_HWCAP) & COMPAT_HWCAP_ISA_D))
> +		SKIP(return, "no D extension");
> +
> +	fd = syscall(__NR_userfaultfd, O_CLOEXEC);
> +	if (fd < 0)
> +		SKIP(return, "userfaultfd not available");
> +	ASSERT_EQ(0, ioctl(fd, UFFDIO_API, &api));
> +
> +	for (i = 0; i < 16; i++) {
> +		pattern[i] = 0x4010000000000000ULL + i;
> +		handler_pattern[i] = 0xbff0000000000000ULL + i;
> +	}
> +
> +	saved = mmap(NULL, PAGE, PROT_READ | PROT_WRITE,
> +		     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	ASSERT_NE(MAP_FAILED, saved);
> +	ss.ss_sp = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
> +			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	ASSERT_NE(MAP_FAILED, ss.ss_sp);
> +	/* populate it, so only the page the handler drops faults */
> +	memset(ss.ss_sp, 0, STACK_SIZE);
> +	reg.range.start = (unsigned long)ss.ss_sp;
> +	reg.range.len = STACK_SIZE;
> +	ASSERT_EQ(0, ioctl(fd, UFFDIO_REGISTER, &reg));
> +	ASSERT_EQ(0, pthread_create(&thread, NULL, serve, (void *)(long)fd));
> +	ASSERT_EQ(0, sigaction(SIGUSR1, &sa, NULL));
> +
> +	/* lower the frame until the FP image crosses a page at SPLIT */
> +	for (shift = 0; shift < PAGE && !placed; shift += 16) {
> +		register long a0 asm("a0") = pid;
> +		register long a1 asm("a1") = tid;
> +		register long a2 asm("a2") = SIGUSR1;
> +		register long a7 asm("a7") = __NR_tgkill;
> +
> +		ss.ss_size = STACK_SIZE - shift;
> +		ASSERT_EQ(0, sigaltstack(&ss, NULL));
> +		fcsr = 0x1f;
> +		asm volatile(".irp i, " F0_15 "\n"
> +			     "fld f\\i, \\i * 8(%[in])\n"
> +			     ".endr\n"
> +			     "csrw fcsr, %[fcsr]\n"
> +			     "ecall\n"
> +			     "csrr %[fcsr], fcsr\n"
> +			     ".irp i, " F0_15 "\n"
> +			     "fsd f\\i, \\i * 8(%[out])\n"
> +			     ".endr\n"
> +			     : "+r" (a0), [fcsr] "+r" (fcsr)
> +			     : "r" (a1), "r" (a2), "r" (a7),
> +			       [in] "r" (pattern), [out] "r" (out)
> +			     : "memory", "ft0", "ft1", "ft2", "ft3", "ft4", "ft5",
> +			       "ft6", "ft7", "fs0", "fs1", "fa0", "fa1", "fa2",
> +			       "fa3", "fa4", "fa5");
> +	}
> +	ASSERT_TRUE(placed);
> +
> +	for (i = 0; i < 16; i++) {
> +		EXPECT_EQ(pattern[i], out[i]) TH_LOG("f%d", i);
> +	}
> +	EXPECT_EQ(0x1fUL, fcsr);
> +}
> +
> +TEST_HARNESS_MAIN
> -- 
> 2.53.0
> 
