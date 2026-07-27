Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C25027BF79
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 04:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785124846; cv=pass; b=iDCsJhRObBTWZ3aX7so37KGqGQimfRECLIE6Q5w8Y4ElvulwpEbqwaQGxpWqcyMz9nxCbkg9vFxBQ8gsw6hFL3DAMIdo0pjg0EK9iXhmePoLeFOCdrvWPczeaA01gVEvtLFABq1doko1j3txH9Mr8hh84hq7fVyWvFHXU7l+7u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785124846; c=relaxed/simple;
	bh=jP7ZYlIVgJ80vLRFwlkcQMyjVn9RFAqIf9ZF2g9O3Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLUM7i3MHU++KVOywJGw8vMrnpp/iXyyYQV7I8gMKFa7nYrPUJPHx0pLZOri/IJwRs2h4GGxYhGpRPrtF/jOKiAUpTFkwZ7TddjCAcwwW/cvf9SSecYuMJ4r1CBBcmSKcX6LzMcuN5neQjugP03hDUVdJiTb7sWnTuKNnSdaIjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z05koU3k; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z05koU3k"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-44856d185bcso1920453fac.3
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 21:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785124844; cv=none;
        d=google.com; s=arc-20260327;
        b=JYbfOHd8PvS79rSh8vyanLQcq4GW5fcWovDMcQZi3dha1j80FT+I1oGP8Z4woDNbhJ
         HO7dUwFIl7TNGBGwgt/3cXeJBKG9ZYC7vwOv77//0kYLQQY0pXnDOVCbv0csbLeHEqRX
         7mGwgySjDFdHIF7wGN+xWUvvPuQNJnk4HhS9Glbi4MxE0Vll6X1HXZ7Oab5w0r0evIWw
         91ILdWwyaTlUc8wLUePFyvacVuBDMLAoLb16v9k4MvWB7sEcCpAcdEB2/hNE894gbnsj
         cXs2L+fRf424qFz1SqARMaUmmJdqIdbsBPq2uedIl6usewyC52691kQzBpwdeASF/HAp
         w97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5G7pWsivX/qlKJsYxp4np8Z21sOvRYdOzSosNcT2Zb8=;
        fh=bCfvWYp6mCeEuEgAMv0oAaWtESkK51jwSv990AAWF5g=;
        b=JMnNZsrgKZJalzytg/i96NnYYUfb3p+yY4aIgVsNK4GthsnGbX12gFwk+RvQDAddoc
         8pPh/1oj3DdXr3P4SL1Hm59uprls4rIHWw0dr00Bm022MPSA68dC4KUkb1vaSeN0tTny
         fAHpUGqk7Fr4pNakZr/CnqxIKXuLTvHbVVnnDl9MmNiVpByU2PQ10xgMFL7P63IkMaSD
         yBfiDkAHd/PSpLIR/O0a+17pGHl0E7iAItLrCy8Js6JvzmvFBr8EJcV7j1tIL9uhaszz
         hlkBk3CD1E4RvYLg3HAbW6iPaIaarp+Pe+b/3w/SoJQNn/UY8s9Y38J6FOdoporEBtRQ
         jS6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785124844; x=1785729644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5G7pWsivX/qlKJsYxp4np8Z21sOvRYdOzSosNcT2Zb8=;
        b=Z05koU3k2c81ip+Vh1pyJ5Jcqft5ebQtKyUlMu3HEpPoBfaWUScipkSZKo/KjUty/E
         zxaury0Wd2eFZiQSKonn3pS9VoREWkUll/2PrikVFe+iYZnUPe2ylYjlhpG0Qmt63uC4
         x6Qb2khqTHFO6pjU50T4b08P7FXtdQaJviBOU/rc3Afk7i+vdb6t166UtgkgOLKGYBA9
         2AmXg23HuDTD9JgX0T1xXF3TStCk7BqqLCWIJf4Qduok5eB0tvU4s9Xn+cVO59vSx8ZE
         J7IFYiQSaE0IEZCHFIpKKHuJPtI6JaaXSgBGf+m4IXhpg90yRsoVBDtseJgl5M2WF8xe
         7tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785124844; x=1785729644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5G7pWsivX/qlKJsYxp4np8Z21sOvRYdOzSosNcT2Zb8=;
        b=ei21VwTo8qWjlNdctob7YDSw5RFO1cnz5nob7ptVYGWTO1gHlnNwQt2wdQthKcPfvW
         Qjj3aIus5DmoQWZFe5zl6XrOKPCa08uau6Y8jdAK7thazA2mXwJeGz33LINPsAiDFm7P
         MA2kcineQJYaBWXbTIJEMNEz3Q8zAck4XGZqaWFq4md7EZ6bkhEF8bkHm1OhEjVna2Xc
         YIru2Cn0mMRb8INcMiw1eLMtEE00m2PbreHflVF8rzmGoSs78Ki3HzMXHwOl/aE18QfS
         nY7o/ImueZQBshi50kM2QQhd8EXxpYDzd6o/7PsHp51l/2zLOAqWIzp+1AubPrJcvIkH
         pSEA==
X-Forwarded-Encrypted: i=1; AHgh+RpYYj7kdjwfc49JfH9mlqhFEYXWWXM+2mPlE0+iieGmkfTpOCHrNZKwjTPzNiqDpfDC+l2poYx5q7ItEIvZAFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDumXtKATvSTALQGVbqbgbEfLnehr2snDhXlxbZGbEFXbUGz+G
	fB6LbONbt3OUVpOQ3FPhhh1WgPdYzuS9QpXgibTxI7DgHuCMrf4pxLQv9HaRPU3fFYGm23ACbhW
	Rx9V0dpv4UEJqw6zJ6Er4ll1zaQDk+y8=
X-Gm-Gg: AR+sD11SdJ5z4dYIAsxeU8b05CdKrYRa6wq7hzqlXBbP9wxWTy7gvdZx26EpzucTQ2r
	Is3B83COOc+9DH6n98cA20Xn//UiKCDXJA9GBPkM/MUFIeeY5dLVQCdjwHooSnkJfoGYp2xZMGM
	jETwLMQeDIOeYlKL97K2TXiEULheMulwzqdOHYa8LXMg8uGJP2ywhJM28KEVozyAFQtFfeGarEs
	V0dZ52U3y0dXQAIXv3rqR+YSryhyKN+HP3FbESz9IMivZ9NxE/F5LEybGX9VsE=
X-Received: by 2002:a05:6871:411:b0:456:b6b3:605b with SMTP id
 586e51a60fabf-457f247a181mr5774137fac.16.1785124844261; Sun, 26 Jul 2026
 21:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622071234.1410830-1-zhaochenguang@kylinos.cn>
In-Reply-To: <20260622071234.1410830-1-zhaochenguang@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 27 Jul 2026 12:00:33 +0800
X-Gm-Features: AUfX_mxKqB9XACgz1TxIXvRnSyNtJ4IGNei07VNWDuXv_cK7wY1OAxWx3rTreEs
Message-ID: <CAEyhmHQ=h3p=xsSBBeVAKD3BPfYyP_vkuOgsHQRcSM_bWEJuNg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] LoongArch bpf kptr xchg inline support
To: Chenguang Zhao <zhaochenguang@kylinos.cn>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, yangtiezhu@loongson.cn, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, shuah@kernel.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 3:18=E2=80=AFPM Chenguang Zhao <zhaochenguang@kylin=
os.cn> wrote:
>
> This series enables the BPF verifier to inline bpf_kptr_xchg() into BPF_X=
CHG
> on LoongArch64, and fixes the underlying JIT atomic ordering that makes s=
uch
> inlining safe.
> The BPF verifier can lower bpf_kptr_xchg() to a single BPF_XCHG atomic wh=
en
> the JIT advertises ptr xchg support via bpf_jit_supports_ptr_xchg(). This
> removes helper-call overhead from the kptr exchange fast path. Inlining i=
s
> only correct when the JITed exchange provides the same sequentially consi=
stent
> ordering as the bpf_kptr_xchg() helper.
> Patch 1 fixes memory ordering for all value-returning BPF atomic RMW oper=
ations
> emitted by the LoongArch bpf JIT. Per LKMM, value-returning atomic RMW mu=
st
> provide sequentially consistent ordering. Plain AMO instructions and bare
> ll/sc loops on LoongArch do not satisfy this by themselves:
>  - BPF_FETCH (ADD/AND/OR/XOR): switch to am*_db.{b,h,w,d}
>  - BPF_XCHG: switch to amswap_db.{b,h,w,d}
>  - BPF_CMPXCHG: emit dbar 0x700 after the ll/sc loop, matching
>    __WEAK_LLSC_MB in cmpxchg.h
> Non-value-returning RMW ops (plain BPF_ADD, BPF_AND, etc.) remain weakly
> ordered, consistent with LKMM. This fix is independent of kptr inlining a=
nd
> benefits all BPF programs using value-returning atomics on LoongArch.
> Patch 2 implements bpf_jit_supports_ptr_xchg() so the verifier may inline
> bpf_kptr_xchg() on LoongArch64.
> Patches 3 and 4 extend bpf selftests: functional coverage via kptr_xchg_i=
nline,
> and an optional kptr-xchg benchmark to compare helper vs inlined paths.
>
> Chenguang Zhao (4):
>   LoongArch: bpf: Fix memory ordering for value-returning atomics
>   LoongArch: bpf: Advertise JIT support for kptr xchg inline
>   selftests/bpf: Enable kptr_xchg_inline test on LoongArch
>   selftests/bpf: Add kptr-xchg benchmark
>

Hello, sorry for the long delay. Please rebase and resend this series. Than=
ks.

>  arch/loongarch/include/asm/inst.h             | 18 ++++
>  arch/loongarch/net/bpf_jit.c                  | 37 ++++---
>  tools/testing/selftests/bpf/Makefile          |  2 +
>  tools/testing/selftests/bpf/bench.c           |  2 +
>  .../selftests/bpf/benchs/bench_kptr_xchg.c    | 96 +++++++++++++++++++
>  .../bpf/prog_tests/kptr_xchg_inline.c         |  3 +-
>  .../selftests/bpf/progs/kptr_xchg_bench.c     | 49 ++++++++++
>  7 files changed, 192 insertions(+), 15 deletions(-)
>  create mode 100644 tools/testing/selftests/bpf/benchs/bench_kptr_xchg.c
>  create mode 100644 tools/testing/selftests/bpf/progs/kptr_xchg_bench.c
>
> ---
> v3:
>  - Expand the JIT ordering fix beyond BPF_XCHG w/d to all value-returning
>    atomic RMW ops (BPF_FETCH, BPF_XCHG, BPF_CMPXCHG), using barrier-carry=
ing
>    AMO variants and dbar after ll/sc as required by LKMM.
>  - Add __btf_root() in the benchmark BPF program so bpf_obj_drop() remain=
s
>    visible to libbpf's kfunc linker when bpf_kptr_xchg() is inlined.
>
> v2:
>  - https://lore.kernel.org/all/20260603100438.2177817-1-zhaochenguang@kyl=
inos.cn/
>
> v1:
>  - https://lore.kernel.org/all/20260602021515.214560-1-zhaochenguang@kyli=
nos.cn/
>
> --
> 2.25.1
>
>
