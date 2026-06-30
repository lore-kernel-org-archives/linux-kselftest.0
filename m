Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBB23E0749
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 18:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782844357; cv=none; b=X0sm4+o6SrbWGTPtLspZIdwucORMJHvZYl7+VVaGXcviJIg+X3eRK89vWYSDWK7t0jgOOOeBZKEEPZZ7+4orgSEOG/hhP1oxwHoPyOdMgNcMdAoBVkt7F1AG7jVyAi/xlCH/IERm+bBEEszMYiW4LSNoRKq8MFCH29uHGz7Cono=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782844357; c=relaxed/simple;
	bh=sM1wz5EArOoQdUNowIBU8vl6ByIPfqhEp+Lh4HvpLMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxPi459QAtyAOBx2ntHR8rW1SoluIBcfvNCTLSmbhe+seDfFnYy8iogTacPdO7NYIUEDh4AhOJAimPzN98pK9MA8XgpcNaT6Ms6PS/ZifBDsPCH/SziOq3N2N3uAYn9u721Yvq4Opl3u8BK1Gfln5eEsiSdVT8JkkvEkp1ZfF3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjShgunx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjShgunx"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47248615e4dso3179526f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 11:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782844353; x=1783449153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jwGaSJfvXwwi2gmvOZ6+HNHrcdSzXT1GIfb82HOsI6I=;
        b=FjShgunx0rnygnd8vY1QHIr8hMlq22Qo8pyuDUlGBGaExZJ+TMQROApZw641UlX+v5
         PWIIt9mlUeuxnbX9Q/QanKZtSL2Slv/nz0awTKbtO2e4o6aZ6v8dOfbkdwaBI/gKrBAo
         PGwhhQJMKh3AqywpFinQAye/yk7G13Ue61W7HUoyLe03jfyIMMnQGBiZSwAMjVRwXIem
         /URS/z/Khmb5o8/vEgCZGULAyMInXwqZDJS7FsKAEkur2aMhAzu4H3xDfeGed/35VUs/
         qdFL+7jLGVzmDO+xlnYlLNkiNebBPoSizpKq8L7ybFFq4VE92hzsKI4/Sy7YCGRs6hd9
         2Pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782844353; x=1783449153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwGaSJfvXwwi2gmvOZ6+HNHrcdSzXT1GIfb82HOsI6I=;
        b=j2SS11vhSVDO3JltjPL8ZDBt6KYlZPJI85lllfbN9+3BldkdyteHj0QjAy75eUGUL8
         mX+T9Yzi6bBXpMsMaKHHFyYoYxz4tV/ZO13mhrgfRnVhUMF+ihBpWymf0mUXY0Q3zbQb
         /kqgz5WRSI5qdhOIPKKH9sHj3VbXNN9f5D2iySABpCRFW9yE1Ls/ME/A7IObNfJ24v0U
         zybPw7qwNaqjtYrWb3n0fYO1cvb/ohm/ZvAoxCl1zIXeFftqpY4K4W8iZMGsaITZ4B+t
         HNR8tB+Euosf4JwuJCTRYibPFfd2scbvjbKmmM/0r6X9nBOTMRrYS8Idp/SfnluCGRG1
         9Lww==
X-Forwarded-Encrypted: i=1; AHgh+Rr7bTE+nWZ0i2Q2cSYUsXXiLCfyWpVGvQZemMoJglVeh0nQr0mt36OZs+RRO/JNvxHo5RK5E8aIf9iotvOgcHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YynogEat+Pvi5/CJOCwE39MYwDuok50DTXNDCLztG9VF1LfVB7y
	txPmgbICw5VG0hsVpQXpRAuKtrgDCZogFhii+XyJvzht1PySpV/ChSNt
X-Gm-Gg: AfdE7cm5CHQWngMQ2QTEwz2GuX+SfIAcNx4AUh4JwyhgOrdS5+JsqRWPsXPqvgiT7Q7
	5YlYyObA9S7+oYhHI2PVkqa73LxC8VyzF6jrtE53F4/5bGGY878hIORqJdEIshjaNKBNKbo/0tG
	4TICw9D+YlZWhpNPCDJOeeNnojTgx6EdoTGWG5qvhGOCwDjPNnW5OfZhOWeYIbnCuP8DeMPEajS
	3763HI94GvMAbxYs7kLFuYiRt4XN1wZ2aIYO6yyQpZ4fqbFWn3aEEY4uaKvkEuUU5H7H3nlY06A
	xU5nHkEhZ/BlPGbZjEl+fchX6W3QF5rkjm3H211RZFDi7eNXpaiONADFdvrEokMXc2MA4sxaXGU
	YSXwVapE6sW00ZccEx7hiP6wZLQfho16vHUbHIcx9ZmQ+GAr0Ctn97ta14ObA4W461NSf4aK1Z/
	y53PJG2TeTf2UoYonS9X7fLeo7KI+bhCyl
X-Received: by 2002:a05:6000:61e:b0:475:f0c2:75a3 with SMTP id ffacd0b85a97d-4765ac65bb6mr2639928f8f.52.1782844353412;
        Tue, 30 Jun 2026 11:32:33 -0700 (PDT)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567884770sm10323552f8f.33.2026.06.30.11.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 11:32:32 -0700 (PDT)
Date: Tue, 30 Jun 2026 18:42:35 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
Cc: bpf@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 1/2] bpf: Enforce gotox targets against
 subprog bounds
Message-ID: <akQOG9jAypDZCjHV@mail.gmail.com>
References: <20260628-f01-03-gotox-bpf-next-v3-0-b744432e1361@mails.tsinghua.edu.cn>
 <20260628-f01-03-gotox-bpf-next-v3-1-b744432e1361@mails.tsinghua.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-f01-03-gotox-bpf-next-v3-1-b744432e1361@mails.tsinghua.edu.cn>

On 26/06/28 09:59PM, Nuoqi Gui wrote:
> During CFG construction, the verifier records the modeled gotox target set
> in insn_aux_data->jt. Later, check_indirect_jump() follows targets from
> the runtime PTR_TO_INSN register's actual INSN_ARRAY map.
> 
> This lets one gotox instruction observe different INSN_ARRAY maps on
> different paths and accept a target outside the calling subprog. The
> observed x86 JIT case can then enter another subprog without a matching
> BPF call frame and crash when executed.
> 
> Reject every target copied from the actual PTR_TO_INSN map if it is
> outside the calling subprog.
> 
> Fixes: 493d9e0d6083 ("bpf, x86: add support for indirect jumps")
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---
>  kernel/bpf/verifier.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index eb46a81a8c51..05a996a5ecdd 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -17145,9 +17145,11 @@ static int indirect_jump_min_max_index(struct bpf_verifier_env *env,
>  static int check_indirect_jump(struct bpf_verifier_env *env, struct bpf_insn *insn)
>  {
>  	struct bpf_verifier_state *other_branch;
> +	struct bpf_subprog_info *subprog;
>  	struct bpf_reg_state *dst_reg;
>  	struct bpf_map *map;
>  	u32 min_index, max_index;
> +	int subprog_start, subprog_end;
>  	int err = 0;
>  	int n;
>  	int i;
> @@ -17188,6 +17190,23 @@ static int check_indirect_jump(struct bpf_verifier_env *env, struct bpf_insn *in
>  		return -EINVAL;
>  	}
>  
> +	subprog = bpf_find_containing_subprog(env, env->insn_idx);
> +	if (verifier_bug_if(!subprog, env,
> +			    "gotox insn %d is outside subprog bounds\n",
> +			    env->insn_idx))

Can this actually happen?

> +		return -EFAULT;
> +	subprog_start = subprog->start;
> +	subprog_end = (subprog + 1)->start;
> +
> +	for (i = 0; i < n; i++) {
> +		u32 target = env->gotox_tmp_buf->items[i];
> +
> +		if (target < subprog_start || target >= subprog_end) {
> +			verbose(env, "gotox target %u outside subprog\n", target);

In the previous patch there was more info printed (at least, subprog
boundaries looked ok, not 100% sure about map id).

> +			return -EINVAL;
> +		}
> +	}
> +
>  	for (i = 0; i < n - 1; i++) {
>  		mark_indirect_target(env, env->gotox_tmp_buf->items[i]);
>  		other_branch = push_stack(env, env->gotox_tmp_buf->items[i],
> 
> -- 
> 2.34.1
> 
