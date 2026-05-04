Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9E43DEADB
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777903517; cv=none; b=Qcw4IhLlNbPPcz7su+ip4LE/t1wINl+LvtMBmzs9EtqAaqiZ5I8GaMPuaXs0ZdUjhDW3hmxIs+Yj2AH/v4cvAXSr8goCUt3MQl5hwTtsK0HwRDusjjawTEt7F9C4cV8JfCiaITI59UZwM9/1HME8DugmIfOifIGMzyZA4Rt7MXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777903517; c=relaxed/simple;
	bh=pXz4oQgkx4G9mMv6vwbidmLfcUb8rv6BeQKuDKJGgGg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=m7yEWWJnNmMHMynV9agX087G6s2W2XhtYXVdzv5acmxMYuuHlQlf3NIPzCWAoZtjEWmtRQJnSLDb2IMBDmYzf3UgeOAWyHd7vf0uiNXkqrHuX+spDTFXsjvNVst0NrOf87WjO4LTc/i8CfScuOm/dzeKBe+kagFI5HRo5s3d2vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AwBPhp05; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AwBPhp05"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso2639137a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 07:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777903512; x=1778508312; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKrjnO573yeT71Xznme42qjXt1eFf7CZCN87a0J7YhM=;
        b=AwBPhp05kgs2uhzI5JC4OJ3fH+Ens+EmO0FGH40tglXGQkOpfMq0ODRz35BObXXNAU
         YygFgfpoH+ryfQT9Ap61KswlxyV8aVncU78s+bkqVNpTQsaxS8TILObUQ/FJSSy/qiZO
         ymPCnvL2wKLzWZfsMXZ4pVE2z4LYvKJrleakjuyrjudoMRGrS+Jzy1hhoGuqsYkcnWez
         sM2KqrCw5lihu47iPfidLRHZlv7x5joXnf//3fM0Ln9f7Djxc4L0p0ctMUdzXXUvznQK
         zRyEv2nTrszVUr1u1i3+C5YOSLe4aqwSk60c8fQtgNUCgNQfKvEImUKN1kPf4OKyt0UF
         xjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777903512; x=1778508312;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKrjnO573yeT71Xznme42qjXt1eFf7CZCN87a0J7YhM=;
        b=paImT20HTfMj2Y6I5/tNv6wQaZp7WcDQZ4ESmgByvs8Og9vG8J4vvhznUiQNq8MOt7
         KM5ekxOyMjYOCBWWTxTbdaeaBbS1ddjYO5Ykxa5MygywpXNDe/i5lH/cMOzMDrCELwnU
         jI7yjGzcBPHHITPtR6ufGvaeKhf+8G/xap9arv3jbhWu2DOfxdHn2IMKwvgGbqfHpmgg
         DmCb83uBZYyhvG+7es7XhrHUZ/x9ljNcXEQsrFwxWTyIGmyF0wwkSCmk1YKaWctGJZOz
         PF0Ls8EKeP+7NBuJjoUwfMjCnmyjSaIDxGKres/85sqK+wnHfHlQ8VTV+L0ilyhrZz2i
         3bLg==
X-Forwarded-Encrypted: i=1; AFNElJ+Jvrsvo2rwUkxAhaFifMkwfleKZ4J3nPBDxq5jHkHtvT06LyjTvliLC5cBhHSQpd9gUAmfSJrDWPQUWRl3R0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeLdpIp+H+kGUWlcpBKH31v/snw+3Du9DmySRZyZurJl5hd9Gi
	amaSXme8vbZwmyrlCl7cN2sJCgcQF8jk4ARdZgNYH+xDDdImorGgycX/Ez2gZXe5W/g=
X-Gm-Gg: AeBDievgLysQxVWny76FarAL9HgyG5QHDhvyoGjgk33H47diMvlYipScuk/x8pmF5/p
	OB0oLE6f3tIcEeGZJ5WNVhFoAPlvEtJ0pVuMcI0C5oDsu2nkaYM0694cG++TMapVA9hliflcr98
	OtEY8+YQv0ofrL8i39vCDn9j6nU9E/zZOvY+FrQf1UkzT1lVcnht9bt9ooGoJTU5pyrUW+jmxsg
	fmj73hXvbuWE1g71a+Xir7jvH+K2WmOVncPpVLJtKxGiug2TOKYktrUbaMFbfTQCvTbnLeqaCKM
	i8qxp6+T8V/qTY1AwuaOgwIMfnsDvHoP/vTgX0adJl+c8i3lWdWBLGaImAerPYXEf3Lsly3V2Eg
	pmiOpiXXf8/+wB+GsLYQj+JRhgb2zY1hxDvr5QzuIvsGroadwvSUr2SEzDX4oqMu0R5qC2B1+ts
	3lYW7YbT/Ui60Ii6oBh/+/Hg==
X-Received: by 2002:a17:906:c103:b0:bc1:2cdb:5d02 with SMTP id a640c23a62f3a-bc12cdb93e1mr311959166b.20.1777903512085;
        Mon, 04 May 2026 07:05:12 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:1294:2ecf:67ff:fe81:9da0])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0b63bb8sm5402191241.12.2026.05.04.07.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 11:05:08 -0300
Message-Id: <DI9Y70J84P8Z.1PJMMFS86NGEC@suse.com>
To: <bot+bpf-ci@kernel.org>, <rbm@suse.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <shuah@kernel.org>,
 <nathan@kernel.org>, <nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
 <justinstitt@google.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Subject: Re: [PATCH bpf-next v11 02/11] selftests/bpf: Fix test_kmods KDIR
 to honor O= and distro kernels
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <alan.maguire@oracle.com>, <martin.lau@kernel.org>, <clm@meta.com>,
 <ihor.solodrai@linux.dev>
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260430-selftests-bpf_misconfig-v11-2-e11f7a8c4fdc@suse.com>
 <f07336b357836aa0d9b5017f4bdf56969d6cb4044b8df5fd9dc67baf593b761e@mail.kernel.org>
In-Reply-To: <f07336b357836aa0d9b5017f4bdf56969d6cb4044b8df5fd9dc67baf593b761e@mail.kernel.org>

Addressed in https://lore.kernel.org/bpf/DI6JRYWASEYN.3I8Q81ZPUE1VE@suse.co=
m/

On Thu Apr 30, 2026 at 1:42 PM -03, bot+bpf-ci wrote:
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
> Will the automatic fallback to /lib/modules/$(uname -r)/build cause
> confusing build failures?
>
> Since bpf_testmod relies heavily on internal BPF structures, experimental
> macros, and kfuncs that change frequently between kernel releases, compil=
ing
> it against host distro headers on a system where the running kernel does =
not
> match the upstream source tree will likely fail.
>
> If the host headers are present, the permissive skip check further down i=
n
> the file will pass since the directory exists. However, because the
> compilation failure is not ignored by the parent bpf/Makefile, this would
> abort the entire BPF selftests build with confusing C compilation errors
> instead of silently skipping the unconfigured kernel tree.
>
> Should in-tree test modules avoid falling back to host distro headers to
> prevent these version mismatches?
>
> This concern was raised in v9 and v10 by bot+bpf-ci@kernel.org and
> sashiko-bot@kernel.org:
>
>   "Will falling back to the host kernel headers cause compilation errors
>   when building in-tree test modules like bpf_testmod? Since bpf_testmod
>   relies heavily on internal BPF structures, experimental macros, and
>   kfuncs that change frequently between kernel releases, compiling it
>   against /lib/modules/$(uname -r)/build on a system where the running
>   kernel does not exactly match the upstream source tree will likely fail=
.
>   If the host headers are present, the permissive skip check further down
>   in the file will pass since the directory exists. Because the compilati=
on
>   failure is not ignored by the parent bpf/Makefile, won't this abort the
>   entire BPF selftests build with confusing C compilation errors instead =
of
>   silently skipping the unconfigured kernel tree? Should in-tree test
>   modules avoid falling back to host distro headers to prevent these
>   version mismatches?"
>
> Reference: https://lore.kernel.org/bpf/d1297f1c857e5430af42dcb3e4d05c7dda=
ff08470a43893cac0fbcb83ec51666@mail.kernel.org/
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
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/251764=
31268

