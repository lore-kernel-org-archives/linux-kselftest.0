Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949FA2D2382
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459454; cv=none; b=U2q9dC7NzJKdF18teBAw7bnvZWtyOE3sdK/Bmhznw8c1MyI/8xD/AFEu2L47UHT+Hyc/onm291wmXWihrs+Ky10pr0p3CcBOtTDt6pcu+OYm/xSMUf/prvkFlN/MV2Z86ixwLpa1cpKYAD61IEVvvU79RcQDPZPzadpftALy4Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459454; c=relaxed/simple;
	bh=GPKtH/OWWOMpvaRAq0q/oZ/4JxZxKopos6ivVhFrOqA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=bLKxEOS5ORr7GR7F7IFnW3AeNeywo5ClWKC5g7MHuHRnK9sWOixzCkalgMQjDoc+3feavcNBuBu619eF6Lgt+kcwQxaUsCaJV/D3BKrY5A+5dDZifI6GyVMDWC4TwDvT+lXzbHYmsXnttmMnmsnczmtg53BsCU+qV5PPU/z1sQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKXqTuVB; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKXqTuVB"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b1afdf98dfso2906442eaf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 01:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459451; x=1790064251; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=skIHTRCMg076kDWG2pdx8YKlOQsvXC/Hd109poRNzB4=;
        b=VKXqTuVB6bwRAuMvauNyTgI4yvTz9pBgt1AZzEQpWW9VBlDLo26GDcuY7FxjFNYuZJ
         n0xRMcBU+VW9zgtsn6lqVSfvVhmv9Rg/cLCTbRR16Lcs5stul8I24BunrSmwV4Y+abgM
         OeZTUHHRBj33nnf3RD/U0tuofHjlXxFIbRrDh2BsIKxIPvmR2Lfrk2yaCF2Mejs855/n
         GbUAaZI1w57gRTI/fO2nnxtaTy8/+V+k6ErKKlfFeCxa7Mxkwj3UCLwFLSIVKGTnnihR
         4A2lTlb6leSrkRIK2sCZd27DVQRtL1vZ0YqDP7BSuso0Ia84Vivj8eq5UeDtqC1I4TT7
         gTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459451; x=1790064251;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skIHTRCMg076kDWG2pdx8YKlOQsvXC/Hd109poRNzB4=;
        b=UKz+SIzkRRR91sn87nuq3/rCnETBR+XWYQ59fL8/7aVHHQBEc6kYQ9fag3xmIzQDMY
         QkbH7BI7BnuTGKmUwt/ZDdwPSTq5vSdZaXpjb58cCd5HYcY7rfrxn4psvleNMQ/geTS+
         fVsCnUnAeCBM4OOh88Dxpt+mJrIGIjxGw5SBDu0XZcPvKRXcHUsgGGDEjtfDHSuI3FD/
         WYu9PHJ+m5uCMgfGHRVCje3xys2WeVwfd4aIN/S3pRouPiO2GS8pJzAYUgyTAH5+vTfk
         UDIDXXMVR5P2uK2QhA+J6vikIGXCIeodkyoV61o7FWk8J8QLadV3y3KvyP2zRO9FiKVh
         Y0VA==
X-Forwarded-Encrypted: i=1; AKwUvBySaVMaQ3y20A41vEm1GpPWJZ81Hz9cn8v4RyJXaCcj9kp4Tgth2YU+WiyRwMKTNkUbUYQpDMnrHAcElKjOaAc=@vger.kernel.org
X-Gm-Message-State: AFuF++ne0XgJ79uWhWciFM7JIbL7JyI5YzcxNw31hWR3xxh0TqGfOK/q
	c6yDmLwMC85+ildCNcp+5fvMiaOmdxJlChFpnYhKP8QMDJTy8mKRpX7m
X-Gm-Gg: AYBFou3ZdcZHSmU+WCbqFK5wmHTwomXnGnnPtgMi5CAim60XcxWCvKw/MBAnHaBBcup
	9rtt8TtiZDEdZ68cfV/ucC0+Oh8FvVIEt2IbKRDMy8zCKgJ2+TJp4NJUm+yP5JGE1QTGYn5UtU8
	bV4SlA/D82IAygrqnGiONHMGWTHdL/ruvaGoZ7twkM89wsVo8LRNHLmWQbnU/Phm5e0Yc2dJOpe
	CBNFeCpZCp5XlzRdYY9wxP+HeJ/+7VnrpDOBxdpzzHCsajwM6kdG+5DwErCmv6CZ4T7Hn0/mtCl
	7iKstF1QGFJhtODUFJQ5w+oNYmhJ2Pwf29wNpeX9SNyJrj9zFNXcChpiOqSYoCXZPtgFp+tFSB1
	u2HpYhyJb7Dir2fiUXvcXtuusPqOUMx4V4vI2ynon7cJ7nZMepnnWRzb7olZhdX/aNP4x4KYVGp
	/qPVjxBHFrjF3xFGbj5yuGIA7MLZ09jBLf/dYpRloox9wj6X6LTS6C7dwjKk5cTSSeoMX9liqkw
	aKr9m1sBPLPNyXfoLbYuUvGknyEQoPP2iiSbxzTtps8IYMuZxCdFRY=
X-Received: by 2002:a05:6820:1628:b0:6b8:ef7d:e181 with SMTP id 006d021491bc7-6c544daaf8cmr3999047eaf.54.1789459451326;
        Tue, 15 Sep 2026 01:04:11 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm57642954c88.12.2026.09.15.01.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:04:10 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Chris Chiu <chris.chiu@canonical.com>, maddy@linux.ibm.com, shuah@kernel.org
Cc: sshegde@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Chiu <chris.chiu@canonical.com>
Subject: Re: [PATCH] selftests/powerpc: Fix exec_prot test failure on Hash MMU
In-Reply-To: <wlsnyvt2.ritesh.list@gmail.com>
Date: Tue, 15 Sep 2026 13:32:02 +0530
Message-ID: <v787ymbp.ritesh.list@gmail.com>
References: <20260909050919.3344699-1-chris.chiu@canonical.com> <wlsnyvt2.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

> So, I think what we need here is:
>
> diff --git a/tools/testing/selftests/powerpc/mm/exec_prot.c b/tools/testing/selftests/powerpc/mm/exec_prot.c
> index db75b2225de1..51ac2f9c14a6 100644
> --- a/tools/testing/selftests/powerpc/mm/exec_prot.c
> +++ b/tools/testing/selftests/powerpc/mm/exec_prot.c
> @@ -167,13 +167,17 @@ static int test(void)
>          * Read an instruction word from the address when the page
>          * is execute only. This should generate an access fault.
>          */
> -       fault_code = -1;
> -       remaining_faults = 1;
> -       printf("Testing read on --x, should fault...");
> -       FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
> -       i = *fault_addr;
> -       FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
> -       printf("ok!\n");
> +       if (pkeys_supported) {
One quick correction - I think this should be
            if (!hash_mmu || pkeys_supported)

> +               fault_code = -1;
> +               remaining_faults = 1;
> +               printf("Testing read on --x, should fault...");
> +               FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
> +               i = *fault_addr;
> +               FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
> +               printf("ok!\n");
> +       } else {
> +               printf("Testing read on --x, skipped on Hash MMU without pkeys\n");
> +       }
>
>

-ritesh
