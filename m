Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AE2418A28
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 04:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447990; cv=none; b=XHef4Bzz5LwLqR9JrFndg44TF03R+FGte4qDL5otmGzS31g1dQx7KLF5OeNnfN7tp5Y80+vyNs7YaDnLB/gzhnc5hh4puZ9L+FHF/9Bbj5CHcPkJYeeowGRosGxVGsQD/VDHYeU5wrFTjZiW9AJHzvMkp9m0OV2cVKsSgr1HiZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447990; c=relaxed/simple;
	bh=PROcPA9h/eIHns0/JNm/9Pp+kQzscBwZHfrMH3A0lIc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=ERmb3NkQJ2RBdfE7uxrOdXJ7dQ4EYiYPFzRelAXDvbOpu9ZJkRtDidCYBCWyObZURGQVs+r7d+52L+VQaQOtN5leR7spkJs2xc6m4ciDMXTK0OiNkZ8+IRn06D6zt5PkERp8ftInlPnqnQnnu7UtGhSN0noyQWXGEn1TDBjSZDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQg7upzL; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQg7upzL"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-86265451beeso2652467b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 21:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789447988; x=1790052788; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ru4Ea1MD4/XyVDmXcP+1ObXpaU2Tn0Ejgynjuli47y4=;
        b=NQg7upzLcg1XDS+HTFOnnqAO5MUxye5vc/vKWnLUtwwlbiMHzCkYNmAoRVPG+uNu3i
         2BciHp+UaJDa1uFxlDnAxojOVZ1ppNY8xt/KyR/3tDai8wVI/rzaGj4zPoj7vn+WRjG4
         EaUw4VZoM8X69xiCO6tsKkdZaeUkeRoFC8M2fHag8qzjiN8gYLq4fCdXnwsAR2f7xj5R
         lrYsDpmOMccusPuzJ+S7jZQzFyDl6q5GOEkDTfycOy7jmQ0fl9cEyZeqf2ys52KBrR/J
         FxsSIfmAtg+WFIw0lWS1A8BhlycNrnoM8YTZudRt+evLeUvG5/cBIKLUlP82Z+hvhB5u
         epeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447988; x=1790052788;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ru4Ea1MD4/XyVDmXcP+1ObXpaU2Tn0Ejgynjuli47y4=;
        b=Vei9mg9PyVsymxHP7SL6yN30bOqBED1kNuV+VeCYKj0jT+5h//9rzh1EYa8VKVIDUL
         om4K8dM9qV8/QXkbhlj4zYrQel0JJYCTyx2RUgC7tYU6CiqbdpNTamkoRkvDVaxZdLXK
         W1MFoe18Fx8uNsMQDNBRo/G25imufVz/PyMy73e/GAVcu1Ifg5Gzkrm+XKIaZxS1Xlth
         Vc8MSV+4gxFvkljupiY87fA8ol1EvT7Hh1qo4CtCD/w+Fa/QDMSPaYaVpXALr+EPsktk
         KE9b9qdd5Bg+Vjgp8toT959sQ6hM/gWdyORwy4vvXzgHZNs6QMGBjuaZllFQMgg+WKTP
         IVDw==
X-Forwarded-Encrypted: i=1; AKwUvBz2RC28a/n3MrsIjnMoLYpLpkOv/Mm/0gtFQbQ9tN31EhSSQVNg5dJqdqusU64zcGW3laHl9gIx74kEiUSeHno=@vger.kernel.org
X-Gm-Message-State: AFuF++mfPKgjQFMXt+HOTmurWxs6Ik6kDtxc4SUF1pwCyRaIB5fbgGbc
	Y16I5ijJm4qEZ1UwcCmmBhFOuKKTA2r7734+dLw9Rq4dF/VaT5sh4ouN
X-Gm-Gg: AYBFou3QbGGnpHVDPAXb744Zd3n7DOXZJGLOTuR/o4MmEe8HN0bma1r4+pDFuAISrJh
	lxmyBO+pWudc79L9DlzyB+A1D1p5iBQiazQCpFT3lqBHXF4dl1lShJ/57UYv1LXDsWL/8Lc0Fbc
	JJWOxBwZqyInQ1NnisRcw5oEV3YfdWiA9tgDYYCJVrsGHAKoZYoQf5LmP58wRbysMt+JVSrGfR/
	/dchBtbv05pLijYxUbdRi/TyJxkUs5zpq0id3h6OmuWcSw4peGbvGRaEUd8qSYyUJn4VEZrFGKd
	jdakKMAv1qVADQZvqMD3Rc6UoaVZg9x+ohoZF8tGczt9Im7C6OKDqT7jYY7O5JOUomXKj/SQ47N
	XkwgqEkmWwg6K+RUew1ImXmUy4WzThYGydn6ZKAf9gA/i9/0qgf4xg1M/A7H7S0Ia7lgl8+Mwbv
	yhK2bGZEZc8qZE0SPIKAkZWQIS80iueoQ5qAi3KpPTdJpcuKmIreRa6eu+cPmijSgQbp3GZkjuY
	P3vWsG98sEOmUK1Yp2IbWWEcKyRgWXk7rq6c8hXCb6rnqier+fR6YM=
X-Received: by 2002:a05:6a20:c88b:b0:3d1:c0e2:936b with SMTP id adf61e73a8af0-3db404269e1mr14358079637.7.1789447987855;
        Mon, 14 Sep 2026 21:53:07 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33beb8b2872sm849937eec.15.2026.09.14.21.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 21:53:06 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Chris Chiu <chris.chiu@canonical.com>, maddy@linux.ibm.com, shuah@kernel.org
Cc: sshegde@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Chiu <chris.chiu@canonical.com>
Subject: Re: [PATCH] selftests/powerpc: Fix exec_prot test failure on Hash MMU
In-Reply-To: <20260909050919.3344699-1-chris.chiu@canonical.com>
Date: Tue, 15 Sep 2026 10:07:13 +0530
Message-ID: <wlsnyvt2.ritesh.list@gmail.com>
References: <20260909050919.3344699-1-chris.chiu@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

Chris Chiu <chris.chiu@canonical.com> writes:

> Hash MMU maps execute-only pages as readable at the PTE level, so reading
> from a PROT_EXEC-only mapping does not fault there. The exec_prot test
> currently treats that as a failure, while the rest of the permission
> checks are still valid.
>
> Use the existing using_hash_mmu() helper and skip only the read-on-
> execute-only subtest on Hash MMU. Keep the rest of the test unchanged so
> the fix stays local to the unsupported execute-only-read expectation.
>

Hi Chris,

Thanks for the patch. However the patch is not entirely correct.
Do you mind me asking - how did you find this problem? Did you run this
on an actual Power Hardware? Can you share the details of that please?

Also - from your .config can you share the following?

cat .config |grep -iE "_PPC_"


So what you described in the commit msg is correct but only when PKEY
support is disabled with Hash mmu. However when pkey is enabled, and
when the process does mprotect(PROT_EXEC), kernel assigns a execute only
pkey for that mapping. With that - we can still get a fault when we try
to load from that PROT_EXEC mapping and the test should work fine.

So, I think what we need here is:

diff --git a/tools/testing/selftests/powerpc/mm/exec_prot.c b/tools/testing/selftests/powerpc/mm/exec_prot.c
index db75b2225de1..51ac2f9c14a6 100644
--- a/tools/testing/selftests/powerpc/mm/exec_prot.c
+++ b/tools/testing/selftests/powerpc/mm/exec_prot.c
@@ -167,13 +167,17 @@ static int test(void)
         * Read an instruction word from the address when the page
         * is execute only. This should generate an access fault.
         */
-       fault_code = -1;
-       remaining_faults = 1;
-       printf("Testing read on --x, should fault...");
-       FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
-       i = *fault_addr;
-       FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
-       printf("ok!\n");
+       if (pkeys_supported) {
+               fault_code = -1;
+               remaining_faults = 1;
+               printf("Testing read on --x, should fault...");
+               FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
+               i = *fault_addr;
+               FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
+               printf("ok!\n");
+       } else {
+               printf("Testing read on --x, skipped on Hash MMU without pkeys\n");
+       }


w/o the above diff when PKEYS are disabled on Hash
(# CONFIG_PPC_MEM_KEYS is not set) we get the following error:

test: exec_prot
tags: git_version:v7.3-rc3-9-g704340f1cd0d
[SKIP] Test skipped on line 100
[FAIL] Test FAILED on line 175
Testing read on --x, should fault...failure: exec_prot

But with the above diff:

test: exec_prot
tags: git_version:v7.3-rc3-9-g704340f1cd0d-dirty
[SKIP] Test skipped on line 100
Testing read on --x, skipped on Hash MMU without pkeys
Testing write on --x, should fault...ok!
Testing exec on ---, should fault...ok!
Testing exec on r--, should fault...ok!
Testing exec on -w-, should fault...ok!
Testing exec on rw-, should fault...ok!
Testing exec on --x, should succeed...ok!
Testing exec on r-x, should succeed...ok!
Testing exec on -wx, should succeed...ok!
Testing exec on rwx, should succeed...ok!
success: exec_prot


Care to verify this from your end on your hardware and submit a v2 with
this change?

-ritesh


> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
> ---
>  .../testing/selftests/powerpc/mm/exec_prot.c  | 21 ++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/tools/testing/selftests/powerpc/mm/exec_prot.c b/tools/testing/selftests/powerpc/mm/exec_prot.c
> index db75b2225de1..bd44f49d8449 100644
> --- a/tools/testing/selftests/powerpc/mm/exec_prot.c
> +++ b/tools/testing/selftests/powerpc/mm/exec_prot.c
> @@ -108,11 +108,14 @@ static int check_exec_fault(int rights)
>  static int test(void)
>  {
>  	struct sigaction segv_act, trap_act;
> +	bool hash_mmu;
>  	int i;
>  
>  	/* Skip the test if the CPU doesn't support Radix */
>  	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_00));
>  
> +	FAIL_IF(using_hash_mmu(&hash_mmu));
> +
>  	/* Check if pkeys are supported */
>  	pkeys_supported = pkeys_unsupported() == 0;
>  
> @@ -167,13 +170,17 @@ static int test(void)
>  	 * Read an instruction word from the address when the page
>  	 * is execute only. This should generate an access fault.
>  	 */
> -	fault_code = -1;
> -	remaining_faults = 1;
> -	printf("Testing read on --x, should fault...");
> -	FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
> -	i = *fault_addr;
> -	FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
> -	printf("ok!\n");
> +	if (!hash_mmu) {
> +		fault_code = -1;
> +		remaining_faults = 1;
> +		printf("Testing read on --x, should fault...");
> +		FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
> +		i = *fault_addr;
> +		FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
> +		printf("ok!\n");
> +	} else {
> +		printf("Testing read on --x, skipped on Hash MMU\n");
> +	}
>  
>  	/*
>  	 * Write an instruction word to the address when the page
> -- 
> 2.43.0
