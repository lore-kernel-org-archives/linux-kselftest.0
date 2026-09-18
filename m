Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7092947534C
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754378; cv=none; b=MNjbv7XG3cu1ICXMOzZoc/fv3z7a0Pd9uKeoAmdtzqnEElKE3ZfVSc+GqwD54mg1kBsjitcbBwzMMjlaXLpZ3e8mYh7WUBfWR920j72zicORrYkp5ozeh7qnSM0AQEkgloxQV5xgnbaeBK//NGlX+So+H4skbbHLaB1/gKVNYtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754378; c=relaxed/simple;
	bh=H2ewWyZoTUuSMbvTqm7kRdUUeaX6ArFU5bbm3PW2ePc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=FEInRXTDSASvgAyVR1IChI+cZgdr3rrwptBGylmNly5YgXHnVbKo5H2R7hIYG8uKbWhuv88zd+HwjcrOzu2nq6wDre6r+930Pnp9LkBNChj2Ykc0OM4jx+SqOLaRLl3oCthVwa3r8sq2WOZpj1Kwf4vHPb6ywYpZJL4yqU6D4Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+TYcg/m; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+TYcg/m"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86b90133ae8so826299b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 10:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754377; x=1790359177; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5pI5RH2G6KIV3wXGdA0IQ/j93krFOJLQpi1nXbIewQs=;
        b=O+TYcg/mNMrepe2+sZmrVbzWLLxQ03tSO8PErWeZXE4oVMv6r/gkklc5754FvU6BdH
         RD21sbLIqNyh8p9M8pyYOFbjhiaVypkDd0B93cNBZP4NvmlYxYgRrl+1u6X/wgntsVLq
         5JLDU6dXsn6jowB7KcVax9sfA3+1arFn2nVMhJQYgld8Zc3Lhy/VJeTT7f+B+Hr87qsg
         t+PL4Z86xN5v/7zR3JwbIPNxWYsaPqvfy6A863tVpCB85bFlCah0chCMxh/TWsg0VSDZ
         QjxvLd3dwy8qkCLx2aOFolZVN9J4SxAGvstiE0/hjgxm0ewFZxtz+0SiXttMTRUvVcvA
         1W2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754377; x=1790359177;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pI5RH2G6KIV3wXGdA0IQ/j93krFOJLQpi1nXbIewQs=;
        b=BDnJGgKz481MjyRISYhQBkhDDg44LuugyP5Sz9NFCPdmS6qssog/sJfJdokSdLN8oL
         zQK2oxyRqP/enn2TVxejwYd5SzMjXIkfdmQm6NH61hy+Ka8gdesYSH9jfv4biu8DOe2u
         2MFIYrEe++uoT/EVT/CwcqXZ9bfojRxgYNH1bsz6jVRtvC3x7b4FjRoQJ3ujsTCVleHn
         UfQrt44QKlW43VBCrpV/VhxDRrLlqQYG2oKKM41PY+4xhTEk8iAV2sbB+4GMGWl55Pm3
         FOa25HzfQtPRUirxhOzLJev18nA11jvUYDjREF4Yh/KywlFcAQof65oaCHMT/Sd5yi3j
         tUuw==
X-Forwarded-Encrypted: i=1; AKwUvByKzn7wh6FI3LxSYE7U9X3wP8Pbr2VCYErYg0ROmW9wO4qQj8Oiv/T/ZpcJtBsxI+TajDbOO6B8r3XcbVoi4m8=@vger.kernel.org
X-Gm-Message-State: AFuF++lvBTyV8coRrrfJJ/iebKEtP0H3cOplrys601BcqwK9arFaXo6v
	fVNC9AMMoJidREacutjwMjLB8hk2I9p56dyAYmIJaOiTc/o7tzWPwhPF
X-Gm-Gg: AYBFou2clELfj9BqY0pz26UIuZfOrwtVcFa4TjwU4JUAMpNvHn9YlB8t8/NdDg3WcP/
	UlkYHsACsc9A8i1HSIWenHL3kSt1myfSJJw+Kzt6icoZ9aNZf6LVUVDiSzyFzyYIOyUIugUVsrS
	vB0BVG6zHzSk8e9urmrLd/hzOS1Dq3DadfBGXr/FvHuKvJM8buS1VuGwDSTLrXBnb3GN2jJ1V33
	Tq1CVacRXIFxj3NOChliRswWcQnOrOQjq/p7C3mKm7HqsBBQTJREWAfZsHTZVG1In/lH7ZmkMxk
	MriwwjTRmmSD0YzbOSGjwA65nqm1wZrfd7O2R8hZS1rl2GTrzcG6NDngsvQ/2rQMbuN7O7H13oY
	eWbY00o2X9e350bXu5cv8+ZPhttpzgRcaaqvpniCJ+RWe1pD5wT4smLvJH+hii3LMpv3E9wJmJ6
	nWzx43/EHAwbsKzmDyNBoigWI/DfLIWAT9HTVp3XMTfUPSxw5qbkb2IBqCQy/D+ld9jUqOubDqd
	MmA4dE2ZkjbrkOVmndBfgreTxMQ78X1/6jejnAXnsI7+tq2F1UTaJZXRC0Xc7Yr218Nq2mPuX2S
	k/Xb
X-Received: by 2002:a05:6a20:3d06:b0:3dd:85a8:cacd with SMTP id adf61e73a8af0-3dd8c47dd66mr7132147637.36.1789754376511;
        Fri, 18 Sep 2026 10:59:36 -0700 (PDT)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50b0c93sm1410710a12.14.2026.09.18.10.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:59:36 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 17:59:35 +0000
Message-Id: <DLIMZ5I345V6.2VWICG8UTQD4D@gmail.com>
Cc: "Emil Tsalapatis" <emil@etsalapatis.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Shuah Khan"
 <shuah@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v8 1/3] bpf: arena: allocate the fault-in page
 outside the lock
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <20260918084123.39477-2-jiayuan.chen@linux.dev>
References: <20260918084123.39477-1-jiayuan.chen@linux.dev> <20260918084123.39477-2-jiayuan.chen@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 04:40 PM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
> @@ -489,59 +490,108 @@ static vm_fault_t arena_vm_fault(struct vm_fault *vmf)
>  	kbase = bpf_arena_get_kern_vm_start(arena);
>  	kaddr = kbase + (u32)(vmf->address);
>
> -	if (raw_res_spin_lock_irqsave(&arena->spinlock, flags))
> +	page = vmalloc_to_page((void *)kaddr);
> +	if (!page && !(arena->map.map_flags & BPF_F_SEGV_ON_FAULT)) {
> +		/*
> +		 * Preallocate outside the lock so the allocation can sleep and
> +		 * reclaim, which the non-blocking allocator under
> +		 * arena->spinlock cannot. __GFP_RETRY_MAYFAIL: reclaim, but
> +		 * never OOM-kill in the map's memcg, which need not be the
> +		 * faulting task's. On failure, fallthrough: the locked
> +		 * recheck below picks up a page a concurrent allocator may
> +		 * have installed meanwhile, and otherwise the non-blocking
> +		 * fallback fails and we return VM_FAULT_SIGBUS. Not
> +		 * VM_FAULT_OOM: nothing ran the OOM killer, an
d the fault path
> +		 * would just retry it forever.
> +		 */

I asked for one line comment. This block and the one in !new_page
branch below repeat the commit log. Trim both to a sentence or two.

pw-bot: cr
