Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D253F345EB9
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 22:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787525615; cv=none; b=YpPiDXvAAPLCXr1PK9BrLl82oHu6KPTLB9hywoY2828M/u4G4w6bHZQeOE2/WILR7sJyn4yDYOo5jgaN33vMLniW4opEhUZD+yzGao/44diSKXfIAuDE1VfDCV1aflEJJ8HfUZFQn0qRd1OQOnb83vmz+xsEOuIxw7AQWCBG8go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787525615; c=relaxed/simple;
	bh=kSc2iWBq6NNFWCVJsOq0qcpmoH/0G7aeMHl9SbJuoQQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tFCGSFErOqJL0tnKz3qhxIap8wQOu9E+PeYfR2o0tJBUxUN+Ia5QV1mZPZQrIvvNb5rZGzkYtnSEso5NmBwfy7Zkef1kWthyHOKsidBG+PRvWEaVMgjd4SoyMl8/EQS8A50JIbNnPFD0qCFmsiA3gZSG/udNz9g/CNsYyAK7FWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiKOSA36; arc=none smtp.client-ip=74.125.228.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiKOSA36"
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c15dc93e168so182234166b.1
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 15:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787525612; x=1788130412; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=shh+4G7Ad2A5MDdLtMta4NRTKb/yZL2mSIcG26UgKdw=;
        b=BiKOSA36uHmTwTIK0QLJqh1jdsaqB1O8oPw4fKuggUp2t1eWQB7+ZmVO3Jf+cLvWuU
         hFAKGdLHvrYMmwQLR905S1xZceCuzO4CxJGFHeOdbLgGSpOd0IW72YhYyT1dyA8qDUOX
         OdaVvvZcnCA505MeQyUvqUq08l33q0b09xak+7NnRs3RDH3uiXyzJsHzDPdVFS2hHK1z
         LpdRXlwjN3IcV1nmVhY436PzneD5f+VS8Fmzr4oR3NUCE04eI8w2YggXKatsrADFT0eA
         OL+dWWN/farVIEFy7nLljIy0yuH2cfRipHKhxcTSOcLuFu1vAOHPh0YgIgMJg71QF/yQ
         p1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787525612; x=1788130412;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shh+4G7Ad2A5MDdLtMta4NRTKb/yZL2mSIcG26UgKdw=;
        b=TjJao+LZ6KJuMib8oyD4xaH+XskVdKUmTf2t8d41J7BMe4ShaXj3rptrCbdccPbmoW
         4F83rLMKbLZzWVxxIdRL3OlVaaKTZPr0V3PL5enwr0LDN1AFHy+qLQJZ/fbHIF5DhOgi
         v3eM0JM33Qu/1uNEbcEYjRKPyUO7SUB1Fu0FhmT3U13N52z9YRsBVTyKGgd64loxYaj4
         5gZgi2Xsnhw2euq9SJY78ps8dDO8JA5kLvMiEGnTpaE9bhqNV+JYA8MfUf8exLw57Tji
         4q/nZwbhj9uLlo6rAAONoJZffV2rFHK6vJpefDasZzHccVKtKypdscgCd/XS1RyakieX
         ii0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqQR/D/pnnDUKfcMyFiwYLqXxLhgKItX58vl9+VCDU6lbjN4yBkuW/IP9D1HjemW1p5eeHajLUjyruv2Ll+2rg=@vger.kernel.org
X-Gm-Message-State: AFuF++niI/1mmUp/5D1nD1l6cRwofICIU0QSWHk6xyN3DTDtgTV7m7T9
	zQhTc7gqGYuHh2MdFev6XIwukYjfiXb0EqhG8siH613HQTFBJJ1xMb2X
X-Gm-Gg: AR+sD11tGaWp7m8jFbPkuPMRyzK5AL71WLgoQK5Vj+vfYdc/+wur5ynQsN8lu4RRcLh
	vJlD0pbemvt+J0w0mu+3abZtX85jr0IgIhdDf4/7O2ak2c2PiM11QLmm7V/qqk4IpaftTYsCrHF
	u5124eXznUAxIuKd64Vy3JFISE53KTEySMJy0GXFZSoDA483BKEsnqKCdE6b0PjF/vYGy/25lsc
	uV0dlykeib6ipDJFMg3gWktPzrWJkPGTNlTeLfI3PR43tVg0D5Lc/h81ZLafh3MM1MvXEnuFyk/
	msaLSnrhSqE2Ge5BVc5STbtFwLRdt/PqTDywPItX0Hhhk4vxDDsmFPkK/z+fy3sa0JC+V22fBFX
	LJZa37gnBPlxi7/EGTJ/8E8d1oeb9mXjub7iZ45YvozeZffn7etMuCyYOwnxZgyWsT+Ckwi4m1A
	AngKqOCKIG13gDG/qdKsnHmktdcvr4WgXAJ3DAiN3NJRP+11jahZEmYUymAuC1X7G85SwcmZoSk
	PfLlFO2/U5oZq7loPU7O/mbbHiz7iygeJkpC2vV9h6Of/hNGWqAHWuqaF+o/idmx9WiqQFxUOm3
	a29A1faIK732xFNtgh82AnmPucM=
X-Received: by 2002:a05:6402:24a1:b0:69c:76c6:9bef with SMTP id 4fb4d7f45d1cf-6a582b6278emr15539422a12.10.1787525611877;
        Sun, 23 Aug 2026 15:53:31 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e19a05bsm7223288a12.17.2026.08.23.15.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 15:53:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 00:53:30 +0200
Message-Id: <DKWOY12R4ZJJ.A8KDS1DU1PHS@gmail.com>
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v7 0/9] bpf: add support for KASAN checks in
 JITed programs
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "Jiri Olsa" <jolsa@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Andrey Konovalov" <andreyknvl@gmail.com>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Yafang Shao" <laoar.shao@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260822-kasan-v7-0-99afee6ef7fd@bootlin.com>
In-Reply-To: <20260822-kasan-v7-0-99afee6ef7fd@bootlin.com>

On Sat Aug 22, 2026 at 12:39 AM CEST, Alexis Lothor=C3=A9 (eBPF Foundation)=
 wrote:
> Hello,
> this is v7 of the series aiming to bring basic support for KASAN checks
> to BPF JITed programs. This new revision just makes the series rebased
> on top of current bpf-next_base.
>
> Please note that with the recent kernel splat detector introduced in
> kernel-patches/vmtest through commit 8109e5928cd0 ("ci: own the kernel
> splat matching (#509)"), CI runs on this series will fail with the
> following error.
>
>    Error: kernel splat detected: [  100.689549] BUG: KASAN: \
>    slab-use-after-free in \
>    bpf_prog_eba69524d1d949b1_st_not_on_stack+0x12f/0x17a \
>
> which is pretty normal, as the new selftests introduced by this series
> are expected to trigger KASAN splats (the test_progs part will pass,
> only the kernel_splats part will trigger errors). The right fix may be
> to just put a list of regex matching all the kasan subtests progs in the
> relevant SPLAT_ALLOWLIST file; something like:
>
> BUG: KASAN: slab-(out-of-bounds|use-after-free) in bpf_prog_([a-f0-9]){16=
}_(st|ld)(x)?(_not)?_on_stack\+
> BUG: KASAN: slab-(out-of-bounds|use-after-free) in bpf_prog_([a-f0-9]){16=
}_simple_atomic(_fetch)?(_not)_on_stack\+
> BUG: KASAN: slab-(out-of-bounds|use-after-free) in bpf_prog_([a-f0-9]){16=
}_ldx_patched(_not)?_on_stack\+
> BUG: KASAN: slab-(out-of-bounds|use-after-free) in bpf_prog_([a-f0-9]){16=
}_verifier_paths_stack_and_non_stack\+
> BUG: KASAN: slab-(out-of-bounds|use-after-free) in bpf_prog_([a-f0-9]){16=
}_ldx_oob\+
> BUG: KASAN: slab-(out-of-bounds|use-after-free) in bpf_prog_([a-f0-9]){16=
}_st_blinded\+
> BUG: KASAN: slab-(out-of-bounds|use-after-free) in bpf_prog_([a-f0-9]){16=
}_(load_acquire|store_release)(_not)?_on_stack\+
>
> I can take care of opening the relevant PR in kernel-patches/vmtest with
> this if it ends up being the correct solution, but it will make sense to
> do so only once the selftests list is validated (but before merging the
> series).

We need to resolve this before landing the set. To me it looks inevitable, =
esp.
if we exercise the support and produce such warnings. That said I'll let Ih=
or
respond and provide guidance for this. We should probably land the vmtest P=
R
before v8 is posted, so that v8 can go through CI and be processed without
failures.

> [...]
