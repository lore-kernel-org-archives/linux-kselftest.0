Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37C736215A
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 16:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777478619; cv=none; b=aUadqWLsy+KPfC2vfDWUL8X1BlRSF8MBRdtHi4QhKzPvViGpf7xNQEdkupiH/EDPYfWVD7L4xNOO18e5u9pP77d8Pv4Ezmok5TNciJBi8+v/66pNUcrbVnbgxMy6QE3MhSjPxZ3tw2WlJ/DRhvfAsPYZPIWCmSpMay0OQVvYgWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777478619; c=relaxed/simple;
	bh=4otVRaVKmDVV4/O4BE0KFa2jpoEw58ZmDu7MeQsTvB4=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version:
	 References:In-Reply-To; b=bvUStasJJEJB3TJYdabCRMRiMJwhBv/Tkpr+mLz7YtcEyLRWhpz6E2pBIBaz8u9wI8Rxv78W2daV2glb/becZkVfD6wZuOuj42oUCLqOX70j/8ZdTcE8Tsh8Bg+ubnJk8gqg8ysFKRfNd95iwfTsimSTTpzyQvwnqQo/WPdkb3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SlN8Cwdw; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SlN8Cwdw"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bb3c4d8cc29so596168566b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 09:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777478616; x=1778083416; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :to:cc:subject:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQoksUSIcSzVndlrAhch8qM9tnBx+HVtwROp5qwoxAY=;
        b=SlN8CwdwQJYRV24B6Eh8KJE2B7PjiiOdha7mV834fBzIKiOWvvAihncfqpHZQsmZ1h
         S2TIc0R20wHK3DyxG7x2weEgzc78v/EstxtLn0LeeXOvAfv7REX+EkntkSAJv/xcXmE7
         iXOLNaS5Ojl+7QGw6IuyDvmG4tRR1Uls2e4kpZoFCX5AvnuToK3FKHRN5YzBuJznZ1gl
         bLakseYRGR0Y078aS7IAj0ufapNppsmRxLTfv9IFYP7K4mW3maxTpRaTEVfD2zC2BJYo
         s4vgEZSemQp71e6JqrCAZfY85V7hegSXMutkJhIAEweKGckA7zMWIVLs6h5MgdiSYJus
         Imbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777478616; x=1778083416;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :to:cc:subject:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQoksUSIcSzVndlrAhch8qM9tnBx+HVtwROp5qwoxAY=;
        b=shJY9sFpjXZaa2u0yClEY+ffZCbx1dus5lYoQBN/8Lq+OWk5A8jQiM8VWxR0Dky0+4
         nwYBpKrgxqiZ49aTL2cnMCumM4tqmi78JFrwQog5CBxgUefZNAkRf2VpQ44p0QGxizAy
         EdvqKYFUHhoChO8bt/FCRHRraIZlvmS3eosW3cnc3kW1qQkqDjXOLwCc7mm2WMpC5Pxe
         xG9g8ZFPaUYlOPShgpC6D3ZxHYn1eOk0gUiQ2rAeRNecueL6BqcRH+DxNpbiccsfWC1T
         DjDT+avDSS6SYJs/+Guuos68qSy27lLqEa/3yzcbx6WhLBjcgKXWvXkKvjl+L04FtM2c
         nZyA==
X-Forwarded-Encrypted: i=1; AFNElJ+akgGoEdU+3m0MoGAahddk3Y5pw+gHZI1c0y6i0rg/k5yLwqu/OiS+S/8YvCJp6r/ug07k63zEjb3S8ArM5Mk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi03sX3J5QkgatX8+6bsiA28dreYqJt2t7/IsXlVGDJwto2Pc/
	EgEQbiiQLXnDpigSobRHoDqbv8Bbafj1CYZp1B3tsPCTUwKf/FuUp/NaLwV4tgSZRrk=
X-Gm-Gg: AeBDiet74XPZ2Gjwd0yeKdnatjB3WS02anIsWmYwUs7Jy7MDIaT/6JtfXsi+YubxOJC
	W2uwbTKqwzJ7f8XFNVgqfxOupqpzHfv4ahRzoEWM4xfQGq5B2I9SrVVbPOILOebAfkKcZDNSI0Z
	qi7uHVySji1TXuNjTJMeap8xjmX8Pw6Uz7Xgn/evPC56DkdelIPhPC2421iCylQXljL3PmfZGap
	3Ogulqh/nl4es+kKdP5hcIMxp9HlUVZbKi7RJZNPLitrQM1fS9r4Fb7c8Ln9VaWM+BxRRgWxxvi
	K97n29ZRii8W/2Zs95LXnfLZASvQr1dFBuMlPRYGI/maDaHs7sss82pRghQ9eGS5IPx8Fk/ps4Q
	DYyyEqRkrOCIXlGNe9jJAz7hE4tsdRdNSj+cLLI4OdKN+xquz2vmRMM2MPtpOOwndfd3ZYllhdu
	gR8boiFSPKHWRByFi0f8Cf+SQ=
X-Received: by 2002:a17:907:2da0:b0:bb9:374e:f96b with SMTP id a640c23a62f3a-bb9374efc9dmr285870866b.12.1777478616083;
        Wed, 29 Apr 2026 09:03:36 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:2ecf:67ff:fe81:9da0])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6298433531bsm1276228137.9.2026.04.29.09.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:03:35 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 13:03:33 -0300
Message-Id: <DI5RKYBPGRCQ.1O50VPXB7QXQX@suse.com>
Subject: Re: [PATCH bpf-next v9 01/11] selftests/bpf: Add BPF_STRICT_BUILD
 toggle
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
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260429-selftests-bpf_misconfig-v9-1-c311f06b4791@suse.com>
 <e020f5f82d86e5da292d0ba7b1d707d5ce47f741fd77019d209853b8b7582816@mail.kernel.org>
In-Reply-To: <e020f5f82d86e5da292d0ba7b1d707d5ce47f741fd77019d209853b8b7582816@mail.kernel.org>

On Wed Apr 29, 2026 at 12:13 PM -03, bot+bpf-ci wrote:
>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selfte=
sts/bpf/Makefile
>> index 97ee61f2ade5..6094fe99b5f6 100644
>> --- a/tools/testing/selftests/bpf/Makefile
>> +++ b/tools/testing/selftests/bpf/Makefile
>> @@ -44,6 +44,12 @@ SKIP_LLVM	?=3D
>>  SKIP_LIBBFD	?=3D
>>  SKIP_CRYPTO	?=3D
>>
>> +# When BPF_STRICT_BUILD is 1, any BPF object, skeleton, test object, or
>> +# benchmark compilation failure is fatal. Set to 0 to tolerate failures
>> +# and continue building the remaining tests.
>> +BPF_STRICT_BUILD ?=3D 1
>> +PERMISSIVE :=3D $(filter 0,$(BPF_STRICT_BUILD))
>> +
>>  ifeq ($(srctree),)
>>  srctree :=3D $(patsubst %/,%,$(dir $(CURDIR)))
>>  srctree :=3D $(patsubst %/,%,$(dir $(srctree)))
>
> Multiple reviewers (Sashiko AI and bot+bpf-ci@kernel.org) raised a concer=
n
> in v5 that when permissive mode skips building .ko files, the
> $(TRUNNER_BINARY)-extras rsync target will fail fatally during out-of-tre=
e
> builds (when O=3D is set) because TEST_KMOD_TARGETS are included in
> TRUNNER_EXTRA_FILES but the .ko files were never created.
>
> The rsync command lacks --ignore-missing-args flag to handle missing file=
s:
>
> tools/testing/selftests/bpf/Makefile:$(TRUNNER_BINARY)-extras {
>     $(call msg,EXT-COPY,$(TRUNNER_BINARY),$(TRUNNER_EXTRA_FILES))
>     $(Q)rsync -aq $$^ $(TRUNNER_OUTPUT)/
> }
>
> According to the v6 changelog, this was addressed by adding
> --ignore-missing-args to the -extras rsync, but this fix does not appear
> in the current commit. Does the rsync command need --ignore-missing-args
> to prevent 'No such file or directory' errors when .ko files are missing
> in permissive mode during out-of-tree builds?

This patch only adds BPF_STRICT_BUILD/PERMISSIVE variables. The rsync
fix comes next in "[PATCH bpf-next v9 02/11] selftests/bpf: Fix
test_kmods KDIR to honor O=3D and distro kernels".

>
> Reference:
> https://lore.kernel.org/bpf/20260415211828.BFAFFC19424@smtp.kernel.org/
> Reviewer: Sashiko AI
> Date: Wed, 15 Apr 2026 21:18:28 +0000
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/251156=
89001

