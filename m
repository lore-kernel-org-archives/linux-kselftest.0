Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC1833993
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 01:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107154; cv=none; b=pC5WHqUsY2sFm5UVRMKspr8mhV7Spa/GgpTdr1Z3FKpFpqXu6ZSMKIZxEqc5y9c79D/Bg7HAX9sxVnZNUafKJ7/uOpZAAXjmC8m8LbPvbo1bf/AvZTP3Fe1rQcUTtWIrcQU8FoYCEUr4a0VPfYANOI08Ks+5ORIHhT00LaHsQqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107154; c=relaxed/simple;
	bh=SPq7NgFqZxgaNG2O9E6O5X6uW4f8iqmz2KIvn6WVjRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pp/Ux/0031pc9W1ioVa5VrFCGNh+L4LP/xaODS4323Cd13PyPGxZ6f/9jZUaCTNp26Ju1RmI784tqwo9+L/Q9tF77IuoB/5jHfaC5u7LctL7OleiXBuqZEOtSrAVdmGQxpZRaXk074NgbTW7r/X8VqAcfeoLOmR3TV/YKqQx0oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THGM0mu+; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THGM0mu+"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1273349c56bso14921177c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 18:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773107151; x=1773711951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sas/jGM9/gBj/qBL5u5kVfFi+K6+9Elbw68TaVWyj4k=;
        b=THGM0mu+JyHCQt6S+jeDTzmUwfVY6Dsdn+fEpKLiDN5Je/Vk+wGV3RPKy6sFk0DGYr
         YJkn3KGRd/tnQ/hbNcZsJeIxI8kT6Uq9i/aLrjuspCz6OdJkx0mOHG4lXhb64rq8wsCK
         g+KNrD9Kxn5GGfQCs/PE3bOtrdFdYD/Ekl00ETDHlwMXUeu6UnoCQwsUBCMWGdOAdbzO
         hDza9pbycMVbHdNU7qG9DPC+QOhE/g87xUX3ddtvbCO98FUiF31E1oCuTaNs9ewrUvhq
         kDgLooTs1ofj3zgSVPddHhllDlWehDL4CHELIXrUUVXsy1CM77k+gjBHBfzW5DFh6k2k
         ALTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773107151; x=1773711951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sas/jGM9/gBj/qBL5u5kVfFi+K6+9Elbw68TaVWyj4k=;
        b=FwAJ3+UbrMCwk6NWzij5eOf6UwjrkK8FNBUndbve3OWvwR0VPIkBiaInr31GZ2Sgon
         b9cUsdEUWDOMebf17Ln85/ocJrif0mzr15maYy6lU1MnHdsIlol+K9A1/ve8VwNaB0b8
         JcAQ+GjmpIxzhqdZk+2yAG/4yu2IHT+QvU2GFYlx7dSIM6Oovu8p7uV9SzTYtZ1MXYyg
         MxybMXOBCG6bZ46wEEszuQOtZ9WmPTbcCWFMildl9kA2s2616bLDTamaHUV3Gexxmtks
         adBwzQSwBgJDrdunXHLTBbet/AcA0UfDuaVCeUav7cRjAeXOpYpQITt3cfzYFQdjxZin
         nJcA==
X-Forwarded-Encrypted: i=1; AJvYcCXve30FHlbcmxn1/J1kepp58b45vQ5lbgo/jFrUEQWUmN39ubxD5LZtT4iioaniwNH6xC5nkWd6xfT9oVNGmIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1z1vVx8fTKo35M+u4BTXKqZXEh4f/ETSlug/o7wz5Qi0X0Nc5
	CnLMJHFPfcJ+QhPFa305UaqsnvQTn15IEjR2lXfmH+O861rByo07CaHi
X-Gm-Gg: ATEYQzxl1kK8dQz1I3a4qwCi8FFc/C9w9Q6sLC9IA32YP2m9tdqe+c7OaDvPCSINzsJ
	BjHBePVcKO70ISkbRoxuXcq5XWCKH2HUjwobnHYdrDh8kdD8I/IconWff5L6VBionzTC2Twe5mu
	53QaNycKm1OCtdPpO19b7pOZ9D3meypww+TY+/1slu9MNqoSNKKoVP/AlLfNrP2gEi/aehWWoHe
	EVXhwWr9rZuemtecwIa3nydg7vXT7L2sZ3TSv6lRGtdU5kWNUedm9LkXKLF6R40ZYFr3UDU+aZA
	OgcPmJlfkhpIzktwBBP/HTqeRYVTw3XiUDGTixR+RBqbf4h70P/hszTaEH7NZUle+6wmfADBr7d
	KRQU09DIaKLqgQOQiNySE7qYCDVy/pdiWM+TXTm9O/vKdmTotkNhworOkEn7MEt2ImwX1+Pxwrt
	GNf/z1Jwo1eRlt7PghtCBLQyu0D7aXEuQJ
X-Received: by 2002:a05:7022:6b8e:b0:128:d375:f1d3 with SMTP id a92af1059eb24-128d375f681mr3154192c88.18.1773107150649;
        Mon, 09 Mar 2026 18:45:50 -0700 (PDT)
Received: from inky.localdomain ([2601:647:6700:64d0::5c10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f433d2sm11321482c88.10.2026.03.09.18.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:45:50 -0700 (PDT)
Date: Mon, 9 Mar 2026 18:45:46 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] selftests: riscv: Fix compilation issues for
 v_ptrace and cfi
Message-ID: <20260310014546.GA17809@inky.localdomain>
References: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
 <aa85yl-c2suNF5LO@curiosity>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa85yl-c2suNF5LO@curiosity>

On Tue, Mar 10, 2026 at 12:21:14AM +0300, Sergey Matyukevich wrote:
> Hello Charlie,
> 
> On Thu, Mar 05, 2026 at 12:11:28AM -0800, Charlie Jenkins via B4 Relay wrote:
> > There are a couple of compilation issues of the riscv selftests.
> > Coincidentally two of the issues are independent problems with not
> > including the header that includes the BIT() macro and the other issue
> > is from checkpatch incorrectly suggesting to remove non-redundant
> > braces.
> > 
> > Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > ---
> > Charlie Jenkins (4):
> >       selftests: riscv: Add definition of BIT() macro
> >       selftests: riscv: Add braces around EXPECT_EQ()
> >       riscv: ptrace: Fix BIT() compilation issues
> >       selftests: riscv: Add license to cfi selftest
> > 
> >  arch/riscv/include/uapi/asm/ptrace.h                     |  1 +
> >  tools/testing/selftests/riscv/cfi/Makefile               |  2 ++
> >  tools/testing/selftests/riscv/vector/Makefile            |  2 ++
> >  tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 16 ++++++++++------
> >  4 files changed, 15 insertions(+), 6 deletions(-)
> > ---
> > base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
> > change-id: 20260304-fix_selftests-c3f0ae46b3c7
> > 
> > Best regards,
> > -- 
> > Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> Thanks for catching this !
> 
> On rc3 I can also reproduce the issue reported by the kernel test robot
> for v_exec_initval_nolibc.c and vstate_exec_nolibc.c. The following
> addition to your fixes seems to resolve it:

I missed that locally since those file compilations were cached for me!

I think we want to keep those as nolibc so instead we can only add the
header to the CFLAGS for only the tests that want libc, I'll send out an
updated version.

- Charlie

> 
> diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
> index 92c4cfe5f34d..48d6cd5e72f6 100644
> --- a/tools/testing/selftests/riscv/vector/Makefile
> +++ b/tools/testing/selftests/riscv/vector/Makefile
> @@ -22,15 +22,13 @@ $(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpe
>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
>  
>  $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
> -	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> -		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
>  
>  $(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
>  
>  $(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
> -	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> -		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
>  
>  $(OUTPUT)/vstate_ptrace: vstate_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> index 4dde05e45a04..e3f062c85452 100644
> --- a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> +++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> @@ -9,6 +9,10 @@
>   * To be "clean" all values must be all zeroes.
>   */
>  
> +#include <stdlib.h>
> +#include <string.h>
> +#include <stdio.h>
> +
>  #define __stringify_1(x...)	#x
>  #define __stringify(x...)	__stringify_1(x)
>  
> diff --git a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
> index 12f1b1b1c7aa..ecd687bb8359 100644
> --- a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
> +++ b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
> @@ -1,6 +1,12 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  
> -#include <linux/wait.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <stdio.h>
> +
> +#include <sys/prctl.h>
> +#include <sys/wait.h>
>  
>  #define THIS_PROGRAM "./vstate_exec_nolibc"
> 
> 
> Regards,
> Sergey
