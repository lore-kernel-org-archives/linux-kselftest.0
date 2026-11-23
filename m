Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429396;
	b=iUsbQ/V3xGV/cXLFyAwPypQgfdEgvSBQqwmckiH49ZAb2Rwpl4/BGuywJY9Ot4XlJK72
	 TNb/PUJuTAppsWp1YCQVsrBgkwhnPbdji1cAQIjQt3eryS5Z/Y0hR+wIwBbEjq4AMHh6x
	 5TJ+D5rheGpDvd420thGrWAwn7xV8AS+iU/z1EN4AW6Zr72GsPEqu1s6wF0d0Domu2Mgj
	 731Tz+dXsc/UivbAtWFIOGIE+4SKx6KRlcW4dzd30cjnIfixgSGfpCPsq2RHcBnx9cn+7
	 jve0gHzh7+cssE1VATwuNbjGI9/IFOz85ssmwvCajsqWUk6n6SUiUgXQ9dpNrvirx9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7NOkncDiU72MUe5hxrWsyOKUGF/TU53c+ikwwmhNSAc=;
	b=LBF90rD1+es4N793jtV3+8zPMqh9mOjDDmMmL9dKvNUR40fJV2ZsKHMdPkm4packdZ9D
	 P5UtwZoTgd7eDMedUcOFgkFwIYHG0VspqTPiVcfIxxtiJ5MyrXGLIC0Fg0uwFE5rXY+c9
	 vwLg0H8eCbqN1Vq3PX5h5pTb5HuDdp4CiL1cPCkNUqQJPTHcjpWpkvEpi/mUArPiHzUgE
	 My6bCaWCkhh7/SrA872Y+DtqSKuulMhxUIf4yPSUWDmsxbrhHIMpnlFfJy6vIkovUDuxz
	 2rky5VdlbabuHr5upQQFlt9VLcnJTHBSy3AcFSMnKpDpNDg0qFU2ZM1EiEJ7bp564dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ug+D0yS2;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AFF606A337
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 10:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2AFF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ug+D0yS2
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso37338685e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 02:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795429394; x=1796034194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7NOkncDiU72MUe5hxrWsyOKUGF/TU53c+ikwwmhNSAc=;
        b=Ug+D0yS2qNQ2sYwj0HwakxRh7IdRVNW16ol8ZAuyq6aEHP6yqqk41CKTOVixP3Oid2
         I6lPY2yx6kuw78ejRps1a4py1MUeYD6znmyE6d3aAgmKvT6YUTQoiuk7I1TEPfyXkYOG
         EUnLi4Md1/5+qnk1uj5cU9TcJJy7xqZXaOwkQabn1/UiK6/c81jWqHt17qHYfa8690gB
         GA/po/g72RaJKYECf2lRcnSY3lslk8RE/GKsfBJ3LU7lVr9/EtyDJ13IxoLvpISOj4OA
         NEztltUa7HCryRbcM+7dePQOmZ1jpVWwEHGwNLZigabBGijtdWQXdY/6Z1bzAb8wL6zs
         q+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429394; x=1796034194;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NOkncDiU72MUe5hxrWsyOKUGF/TU53c+ikwwmhNSAc=;
        b=yvnaJIw9D9ZEzKizChkazn85kpkyvTXOcDi4pBEMeMDfEwJjbFNm22osDQP6bFm+CE
         MJiRnh+pWBleaIPTzS0nj4yEqdxeJUnVWl/pLZLpiZZGJw64/fjYMTM4lHyVHLIx23Rd
         aF1gNUyCFqJk2MRMnQ4wxWUUt3MXM7BHUzGEJ5zqhMWqmXdtChaaO/dius7LF8A99PVt
         SMwzb3LC1Q0QpiHRNJTJzWaqhuGrz5sfsf/zOz3rLt3Dm5aDspJnq5cKex7pwkuh0jm7
         rLkcqrE0pt4B/OJ47PNxarIZG2ya386An7SkivbqW8jyj6ryITSG/KPeKZjksJy+i95Y
         5UrA==
X-Forwarded-Encrypted: i=1; AL+hErFWSxABm495xdN+ukxJUfVQZtAdOXkdunRkn7h2JO/nBE4yMGPmlHRRXNeJo0WZy+TEIRUsZ+KI9UiIX6YL8Yg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XcwJ9PDRc/e5oWKuX1WEI5azDN7p1I1pkG9wQezPlF6M+hN7N
	mkHBJvgOetRYiJJJYPaEZ14b1NoF4XNR9H+TYOxuHY2MFgGNVDXu3CIOxBZjssSb81I=
X-Gm-Gg: AZFdTZfSiKLMEsKNlWxpNu5dD1rul5vIH7ZaA76YBAoM8yeqc5BaUg0tQx3Arm+8CfE
	Wd9MuJONp9yvQEKuYfA0ZSlcEsNB2kyfWZ2r5kVQOYz6A05No4toUhZ4181CgyK59FMg5q5da9F
	vlMa9Bx49qK45LFRhuIoZ1k0lHuyX1E2yGuD9Mh3EMXPNmkAOZCP2gTC4v3FKlra0hOIo3qis6f
	otR7QgDEpx2UvLTAOrLA7Ym1CftYV3yK5LSm4AtvkM7i0Kha9b96kBiRptF+gYgAouw2PllozF0
	ENihmO8XRSLSWgyCnnrA6RRUqZEuBA9MRrxtStyuSwCa1mJI+iwUu/J9nO79hgVseX8LwCJaP/3
	OSyWtID/raNmU3qr4NrRkPTHW26PFs8OmGywcjtDNWzQTInLmvVKeN5Iz5dbt/xN64gWAwFdojR
	1J5CrNDbOa6NbcCIvAfAz5lARl3VIVZNC37NpN6pT+p5q4NVqRwiG/HNYuVOy00cIvplkXZBAlq
	CNp1Aq4OV+bhrg6RN2JNYq1Reov8zxBYMxY70qLPYWSquz4wTQx4YOZ6TXGcZp2WZKKrkWZ+KzV
	IY6SAgEIn3UFIWqe
X-Received: by 2002:a05:600c:3555:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb8881da76mr222583975e9.34.1795429394115;
        Mon, 23 Nov 2026 02:23:14 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm382108625e9.12.2026.11.23.02.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:23:13 -0800 (PST)
Date: Mon, 23 Nov 2026 11:23:11 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] selftests/livepatch: clean the test modules
 without a kernel build directory
Message-ID: <awQUD16CDFpCTxaQ@pathway.suse.cz>
References: <20261110161050.2451750-1-sashal@kernel.org>
 <20261110161050.2451750-3-sashal@kernel.org>
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
In-Reply-To: <20261110161050.2451750-3-sashal@kernel.org>

On Tue 2026-11-10 11:10:48, Sasha Levin wrote:
> "make clean" removes the test modules only when KDIR exists, and KDIR
> defaults to the build directory of the running kernel. Modules built
> for another kernel are therefore left in the source tree by a plain
> "make clean" on a machine without the running kernel's devel files,
> for example after building them as KernelCI does:
> 
>   make -C tools/testing/selftests O=<kernel> KDIR=<kernel> TARGETS=livepatch

The two parameters "O=<kernel> KDIR=<kernel>" do not make much sense
to me. The command starts compiling other selftests. I get:

$> make -C tools/testing/selftests  O=<kernel> KDIR=<kernel> TARGETS=livepatch
Makefile:4: *** Package alsa not found, please install alsa development package or add directory containing `alsa.pc` in PKG_CONFIG_PATH.  Stop.
test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    4 | #include <cap-ng.h>
      |          ^~~~~~~~~~
compilation terminated.
make[1]: *** [../lib.mk:226: /prace/ai/kernel/linux-livepatching/tools/testing/selftests/capabilities/test_execve] Error 1
/usr/bin/ld.bfd: cannot find -lcap: No such file or directory
collect2: error: ld returned 1 exit status

It works well when I omit the two parameters:

$> make -C tools/testing/selftests TARGETS=livepatch
make: Entering directory '/prace/ai/kernel/linux-livepatching/tools/testing/selftests'
  CC       test_klp-call_getpid
env -u KBUILD_OUTPUT make -C /prace/ai/kernel/linux-livepatching modules KBUILD_EXTMOD=/prace/ai/kernel/linux-livepatching/tools/testing/selftests/livepatch/test_modules
  CC [M]  test_klp_atomic_replace.o
  CC [M]  test_klp_callbacks_busy.o

Are these parameters really used by the KernelCI?
Could you please provide link to a build log?

>   make -C tools/testing/selftests TARGETS=livepatch clean
> 
> Removing external modules does not need a configured kernel. Clean
> them through the kernel source tree that contains the selftests, and
> do not pass on O= or KBUILD_OUTPUT, which the kernel Makefile would
> take as its build directory.

> --- a/tools/testing/selftests/livepatch/test_modules/Makefile
> +++ b/tools/testing/selftests/livepatch/test_modules/Makefile
> @@ -32,8 +32,11 @@ ifdef BUILD_TEST_MODS
>  	$(Q)$(MAKE) -C $(KDIR) modules KBUILD_EXTMOD=$(TESTMODS_DIR)
>  endif
>  
> -# Ensure that KDIR exists, otherwise skip the clean target
> +# Cleaning external modules needs no configured kernel, so clean them
> +# through the kernel source tree that contains this directory. The kernel
> +# Makefile would take an O= or KBUILD_OUTPUT passed on from the selftests
> +# build as its build directory, so drop them.
> +clean: MAKEOVERRIDES := $(filter-out O=% KBUILD_OUTPUT=%,$(MAKEOVERRIDES))
>  clean:
> -ifneq ("$(wildcard $(KDIR))", "")
> -	$(Q)$(MAKE) -C $(KDIR) clean KBUILD_EXTMOD=$(TESTMODS_DIR)
> -endif
> +	$(Q)env -u KBUILD_OUTPUT $(MAKE) -C $(TESTMODS_DIR)/../../../../.. \
> +		clean KBUILD_EXTMOD=$(TESTMODS_DIR)

Otherwise, the change seems to do the job.
So, maybe just the sample command in the commit message is wrong.

Best Regards,
Petr
