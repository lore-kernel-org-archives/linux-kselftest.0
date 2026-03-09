Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9AB2DC76A
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 21:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091282; cv=none; b=MIGrFvBwdrs10klTkKjR6ITbZBsvm3vBU2j4fDFusR6ZiiqWNZXZqKMGwgJEY6A8t1fnXyWk1iqpOkvzzWUrtmAdKcA1yugKnX9dvhJHAJ0aCihanJtbmEb0X+E1Q27JFXFWb1Uay7uKMV8G4YjKsXphnCI0ck/JqzL719+XTFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091282; c=relaxed/simple;
	bh=vUN0P1C2rFmutu5iY2iU1uKl1ZMEsY4ucyehCMvH7GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQP6zYxgcqa6zf/e0S0Om+p7gnOZccRCnxbFjMhbnlGeW0OeR+iFI+jRuKPcJU/3uV38Bbl/3oR3PTvXri8ymbLkeKe2w5giJ6xHtXw4XV8ahrsjOpppyULKnp/m9jtkzUg1rDfXSg90quCOsOWBr02EHgGURFZOlSrNm59pqxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCQqzQG8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCQqzQG8"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so3907820f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 14:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773091278; x=1773696078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3mR/03iy2wclJWH4dE6b/zGJuZMq85sTEJ9qWO5p4OU=;
        b=CCQqzQG8PW2xnKP9RjMMCi3RS2kTPXyq7+3zJOlAnWjnwT9lSI2izOxvF4Nny9Ke+G
         N2dwuiDtRopd8kdXrJc7habzzbtjD/9zLgqTeOKfWsIfcYJJV9JKNRw+Z4Kb62EBk/7A
         1pnAMokPbGLPgLgPaceUrcGS7jx6Qk9BU7wSprzVJLEPhkwOzUpq+fRSzJ/iuv6H0kmO
         o7YItkePHlapdlP33s/EJK8sd0jG+DjdukbzWIwZWR6PSHP75OSv5IAHm4trNiMmsFkN
         /ERoyDDmGQUOOtZlBjpT2LGAmtVHnNt5XpOjLzN6hcIF1C4lAbqQY0ZTK5vv4E8+e+jp
         2D1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091278; x=1773696078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mR/03iy2wclJWH4dE6b/zGJuZMq85sTEJ9qWO5p4OU=;
        b=hIqr179Yw8OIYulz5qsTOOVh6+vjxBawW9lTXH+tsW/udircWKoG/+OVQPiB+lACuQ
         iRCtvavrh3RfBAJDqS8OP7IKlF4MEJEQ+xUikC3ao7QYNFFqagcVofBOgF3biR90PvTJ
         3c6xWqUzIRWQOhHRMhg1qhuXxAeaXLJsDLcW1qA3Kxi66OTi2+iYZKpydYOeYlu296y4
         ytbQXZAcPAVm9eoroe9iKj8VuqH8dIypHy3RDjFbxh1H+WZ5mWGhcbBU8mUfyvoEl3tP
         Q//tGkbm/VL/jPFwoLm0RACmYUfNb39FMlkVYA9WVKWgQxrpjwqv4vRaZpR7dThnzonN
         BFiA==
X-Forwarded-Encrypted: i=1; AJvYcCV+MzIXU0YKkHRF02th8cZISE+Fw8ABXZW4Cff0vuaj45Oo0LcEhcI8MrS4AZYrCMQPHsackZSaMvt1Hz9ru7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN1hmHmeFAukH3nys9mLMizs4+paN4L1TmkuMDjTtVphTFsq0l
	yOqlpwr7cFj5zgcrS52TNrsTXMgooNI3Lx0L8sCDXZ1UsStye/xmKyqm
X-Gm-Gg: ATEYQzyWIL2yZKnt9cKTii/WLv2csUOreTM43DQshWXZHWaW057aR+Y7WvdKAU3ccXT
	qK6vGpjmLg73+b0/jjhSwGB8LMEuCYBXrCmS6SyXpiJia5qdvtqhSHxVxwW7zHpDQ4+5aPooLxR
	TqAjYSjymj4nKgv/U1W1K/yeDwyMsxymUwK/cJRT1MdGe0wLC7sMde/4bUFyi5gkFdA6fCr9u4O
	YvpA6CYhKL/XEkZc8loqVFUXtOi8N1yYnBx/2XMzneHjXhvcXJbs3qbCWSXOzkRRZZkHK6rETKi
	8bYw7iMIAbll9Lax8LwwNUvIUktveHYY+kd2cte+M9QX5m6v4Bqn9QNZfW9GVsTJJlIVdeiXqtZ
	7fXdhrC4GEyrRPMy0xX4qj5RLiVjIfzlA78ZN3auDEurXmo2I5VeRqifhgn/ZyDI0mlH79miT5t
	4J1Tme4QVxLVP01Qd1
X-Received: by 2002:a05:600c:1f0f:b0:483:703e:4ad5 with SMTP id 5b1f17b1804b1-48526967cd9mr205736655e9.22.1773091278353;
        Mon, 09 Mar 2026 14:21:18 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aacd81sm18535685e9.14.2026.03.09.14.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:21:17 -0700 (PDT)
Date: Tue, 10 Mar 2026 00:21:14 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: thecharlesjenkins@gmail.com
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] selftests: riscv: Fix compilation issues for
 v_ptrace and cfi
Message-ID: <aa85yl-c2suNF5LO@curiosity>
References: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>

Hello Charlie,

On Thu, Mar 05, 2026 at 12:11:28AM -0800, Charlie Jenkins via B4 Relay wrote:
> There are a couple of compilation issues of the riscv selftests.
> Coincidentally two of the issues are independent problems with not
> including the header that includes the BIT() macro and the other issue
> is from checkpatch incorrectly suggesting to remove non-redundant
> braces.
> 
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> ---
> Charlie Jenkins (4):
>       selftests: riscv: Add definition of BIT() macro
>       selftests: riscv: Add braces around EXPECT_EQ()
>       riscv: ptrace: Fix BIT() compilation issues
>       selftests: riscv: Add license to cfi selftest
> 
>  arch/riscv/include/uapi/asm/ptrace.h                     |  1 +
>  tools/testing/selftests/riscv/cfi/Makefile               |  2 ++
>  tools/testing/selftests/riscv/vector/Makefile            |  2 ++
>  tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 16 ++++++++++------
>  4 files changed, 15 insertions(+), 6 deletions(-)
> ---
> base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
> change-id: 20260304-fix_selftests-c3f0ae46b3c7
> 
> Best regards,
> -- 
> Charlie Jenkins <thecharlesjenkins@gmail.com>

Thanks for catching this !

On rc3 I can also reproduce the issue reported by the kernel test robot
for v_exec_initval_nolibc.c and vstate_exec_nolibc.c. The following
addition to your fixes seems to resolve it:

diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index 92c4cfe5f34d..48d6cd5e72f6 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -22,15 +22,13 @@ $(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpe
 	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
-	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
-		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
 	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
-	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
-		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/vstate_ptrace: vstate_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
 	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
index 4dde05e45a04..e3f062c85452 100644
--- a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
@@ -9,6 +9,10 @@
  * To be "clean" all values must be all zeroes.
  */
 
+#include <stdlib.h>
+#include <string.h>
+#include <stdio.h>
+
 #define __stringify_1(x...)	#x
 #define __stringify(x...)	__stringify_1(x)
 
diff --git a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
index 12f1b1b1c7aa..ecd687bb8359 100644
--- a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
@@ -1,6 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#include <linux/wait.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdio.h>
+
+#include <sys/prctl.h>
+#include <sys/wait.h>
 
 #define THIS_PROGRAM "./vstate_exec_nolibc"


Regards,
Sergey
