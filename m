Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E448428461
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 14:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558163; cv=none; b=ghnhQlb8CUh9f/RbDvluWOGX9N/sqRSxqmtd0j9xSR/49q/KaSMF3gqXhfI9RjoQKiDze391AeKtqUT3nHp62S1RiWFWWX//AtCNI54AIYpWKnRBSc++2oEAoHmsUcgH4FL02M7AnnzdmIXerEmGgh5v5vV5IT6ryKyfRt3D8ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558163; c=relaxed/simple;
	bh=1qjZmmrF3I85CBh0a1JI7hHwk45mME8Vo8LYhHDlh9E=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Tpn6mvKPqiMYnPrf6G5SuIBzYdE6Vnd7Lpl7SEchv4ITanZ9sKdhPHJ30nU7O/MRleqXJftiL9cXGSZNIRGhJwW/YwEojk/RzvAe4N/+SxR1TPlc2E3f2GYdtHJ454GVq2VbqU5PR3Aa8lrcaLAZQoECWl6gCy0vQX3z88DWXUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UXyVrVnn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UXyVrVnn"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso10047695e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 07:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777558159; x=1778162959; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9EL5be0hYDO4pBoXs2Ff2eHS7rc0zYolDGqpnGuRlY=;
        b=UXyVrVnncE8QNLzp9VL/vLZwsewI6gKBwFRNrow35ZaxLdtajYxZ1f8CYLX6ut+YDR
         2YuzJBOofJfhSM9AbhJp6ovkdFnN7dA51YS5Ig/3cLC2Pi3j3PJq6VTsTSfXD+ZDkK/R
         vD8d1eO/zeHvUh7wLjYfgJl1uP/XU1+Qe/06vI3lPgH0q4UNk7R5925V32wHz8ea/tkq
         6gRY/4e4uL6MnUph2VzXS3+j/ACQe8AMPSCuNTKEElyr1gizBAh5Vb2DgKLw/FjCzn2c
         QV0syrnlFJI2dFx1onRKapzQ+UVL6mz2ksh5Fut3bsplzBo9674Jqp4A0rrbSLUtaUrS
         rHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777558159; x=1778162959;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z9EL5be0hYDO4pBoXs2Ff2eHS7rc0zYolDGqpnGuRlY=;
        b=KGM4ThtcthkhDai4pmQM2deZIvh9Elhkf9Eqay2TiboTD9c8gk+rC75Wqy/6zbnBcU
         Vx7IBSizPL4Rs5KcvXsUeBcYTyA1qo5K/ry0M6PNsWJpSvbksIKevx9rx7LXLMhjcOeB
         t98//YRJ2F/s3aVrOTiEKD3x/pqJ/RwjWWK8s1KhTC82zr86soau8nK0FEkXzXDJQzdQ
         pHxvyOrXnAbGdPrkBEPYIjS379d7kKFf0ie+Ze27QxT4Co+b/t/IivWONcsbX1yaCTg+
         cTvn/9ZiiKFhnqRAcPaFOq+m2JTq8QEOGMuU2+0nddHfGmkjG9zUXfNSgNgq+dPQNbuX
         CveA==
X-Forwarded-Encrypted: i=1; AFNElJ8Z60WrY0KAQ0PaMADWZWzKAUqctANjX/ttPsGnQ3wNCB8qFLUnndQ73KKnKcBUbDcbgIBxWQxKPVVrVh3jVoI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9wq+cbHYqFH7/5t0/oatAft2oBrOqRh/h8zamdgd0d71Uz8m4
	rJkgq6dbESxDKXHA6RLeji+UCSUFixBvKKF5gEFOmyS5ZVCDuHVIEHbETSN/czcilyU=
X-Gm-Gg: AeBDievg5aGv4tJ+PpJ6ve+TUPmVNZWw4wG6MfSDbXSJr9eLFM8Edgpkkd0QePKBBpv
	OGBAzQH7JCb1janSffrOCB3vt4tNkCi6YAR8LI/uJ8SMsP2gIax39XiEBz+UiYGGIfPJ0bSIkiU
	Wh2sYXAKm1VZJJv4tgSSP2nZN+VVFelroBkGl8OorpbmVQHK+gpcdGB7yM9jN11f1Kq0fwzDDNQ
	A4MyqkY7h9Zen3b+6aj5F97jmrBRgFsRqTEMEd6sxpCKGwza+NM0ibfBtiGPSbJng3A4t6t5S7y
	IzpSVmj22KVWNrXIvexeQ53gURFKXO+brsLALxMth1yiNm6AI7EI41Dd1I3vs6bhnwJMkOq6CN3
	oTJgPcBUeONngxvFoCEED16eDaGBWIZQ+R7KWxRummERX8dIs8WKa/4+HDe1aLpM3s/1GXThfMU
	NZr2CIn7cr78EA17rW6+EvrOs=
X-Received: by 2002:a05:600c:8b22:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-48a844582c3mr54963025e9.23.1777558158451;
        Thu, 30 Apr 2026 07:09:18 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:2ecf:67ff:fe81:9da0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de31ab65fsm7755291c88.0.2026.04.30.07.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 07:09:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 11:09:14 -0300
Message-Id: <DI6JRYWASEYN.3I8Q81ZPUE1VE@suse.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Subject: Re: [PATCH bpf-next v10 02/11] selftests/bpf: Fix test_kmods KDIR
 to honor O= and distro kernels
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <alan.maguire@oracle.com>, <martin.lau@kernel.org>, <clm@meta.com>,
 <ihor.solodrai@linux.dev>
To: <bot+bpf-ci@kernel.org>, <rbm@suse.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <shuah@kernel.org>,
 <nathan@kernel.org>, <nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
 <justinstitt@google.com>
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260430-selftests-bpf_misconfig-v10-2-cd302a31af16@suse.com>
 <d1297f1c857e5430af42dcb3e4d05c7ddaff08470a43893cac0fbcb83ec51666@mail.kernel.org>
In-Reply-To: <d1297f1c857e5430af42dcb3e4d05c7ddaff08470a43893cac0fbcb83ec51666@mail.kernel.org>

On Thu Apr 30, 2026 at 10:30 AM -03, bot+bpf-ci wrote:
>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selfte=
sts/bpf/Makefile
>> index 6094fe99b5f6..cc6ee7a2df93 100644
>> --- a/tools/testing/selftests/bpf/Makefile
>> +++ b/tools/testing/selftests/bpf/Makefile
>
> [ ... ]
>
>> diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/tes=
ting/selftests/bpf/test_kmods/Makefile
>> index 63c4d3f6a12f..031c7454ce65 100644
>> --- a/tools/testing/selftests/bpf/test_kmods/Makefile
>> +++ b/tools/testing/selftests/bpf/test_kmods/Makefile
>> @@ -1,5 +1,16 @@
>>  TEST_KMOD_DIR :=3D $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIS=
T)))))
>> -KDIR ?=3D $(abspath $(TEST_KMOD_DIR)/../../../../..)
>> +SRCTREE_KDIR :=3D $(abspath $(TEST_KMOD_DIR)/../../../../..)
>> +# Honor O=3D/KBUILD_OUTPUT only if they point at a prepared kernel buil=
d
>> +# directory (one containing Module.symvers); otherwise treat the value =
as a
>> +# selftests-only output directory and fall back to in-tree or distro he=
aders.
>> +# The parent bpf/Makefile resolves O=3D/KBUILD_OUTPUT to absolute paths=
 before
>> +# invoking this sub-make so relative paths still anchor to the user's
>> +# invocation directory.
>> +KMOD_O :=3D $(or $(O),$(KBUILD_OUTPUT))
>> +KMOD_O_VALID :=3D $(if $(KMOD_O),$(if $(wildcard $(KMOD_O)/Module.symve=
rs),$(KMOD_O)))
>> +KDIR ?=3D $(if $(KMOD_O_VALID),$(SRCTREE_KDIR), \
>> +	    $(if $(wildcard $(SRCTREE_KDIR)/Module.symvers),$(SRCTREE_KDIR), \
>> +		/lib/modules/$(shell uname -r)/build))
>
> Will falling back to the host kernel headers cause compilation errors
> when building in-tree test modules like bpf_testmod?
>
> Since bpf_testmod relies heavily on internal BPF structures,
> experimental macros, and kfuncs that change frequently between kernel
> releases, compiling it against /lib/modules/$(uname -r)/build on a
> system where the running kernel does not exactly match the upstream
> source tree will likely fail.

This is only the fallback case (inspired by livepatch collection which uses
this KDIR as default), the targeted invocation for this series is
something like:

  make -C /lib/modules/$(uname -r)/source/tools/testing/selftests \
       O=3D/lib/modules/$(uname -r)/build SKIP_TARGETS=3D TARGETS=3Dbpf \
       BPF_STRICT_BUILD=3D0

The usual in-tree way of building vmlinux and then the selftests strictly
would keep the same current behavior.

>
> If the host headers are present, the permissive skip check further down
> in the file will pass since the directory exists. Because the
> compilation failure is not ignored by the parent bpf/Makefile, won't
> this abort the entire BPF selftests build with confusing C compilation
> errors instead of silently skipping the unconfigured kernel tree?
>
> Should in-tree test modules avoid falling back to host distro headers to
> prevent these version mismatches?

Without the fallback, a user running from a tree matched to their installed
kernel but without a prior in-tree build would lose bpf_testmod. Small
niche, but the workaround (O=3D/lib/modules/$(uname -r)/build) might not be
obvious. The fallback covers them at zero cost to everyone else, so I think
it should stay.

>
> This was raised by Sashiko AI reviewer in v9:
>
>     https://lore.kernel.org/bpf/20260429194107.806B7C19425@smtp.kernel.or=
g/
>
> The issue was acknowledged in v9 but has not been addressed in v10.
>
> [ ... ]
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/251670=
06036
