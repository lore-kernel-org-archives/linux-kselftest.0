Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CDC3F44DB
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781530774; cv=none; b=kFE6LKpzKPBKnfz0gXWVflYHPq6A1km88LJsAwVeoRCPL5pIyQ4c/+ksjcQy1k+tC2gK8MnLlh9Mu1M+fb2FRDz3DUvmpM/ZCrSEYpKmGb2MZ7ajbk+N+w71nTTYEHiuJ/qSWt6154yaXrNGZfG1oZNHGp75fjkNlIeDqZgEajY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781530774; c=relaxed/simple;
	bh=Uken4tM4LxzRAW3DPWFxQEaIbrL9f7E0s+GyqkDZQbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyVDFayI6PsCqgCx6XcmXaIYjdpM0YDl8Ygg+91k0RlSA1Jc0C58irWPEQ70BxIISBlBGasmMYxp7aLKaVszX1BC+s8ncPFQzq4TyLj1YrX02aX3CpA7hLEqfn3KfXtxeyDzOZ3UD8Z1J1cwEQV0Dt52+XAAo0SRtjI1rjcFMkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bdt3nHF5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bdt3nHF5"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45eedc94d37so1868005f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781530771; x=1782135571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=crU/YWEeXaonCN7cJRF0MeFCZ4XnzfssYJGTp4fDCnc=;
        b=Bdt3nHF5hGSg8d0r7B0cj2jqsYQBSlO+7FeZSaKD4H0o3EaOuzFqDclquYq18IBYbY
         VUoAE+YdasM9jcPJTvIDc5Iy5VWYV2nMeNR7FjQfqDHnruNZBr2Ya48ojvyBgX9s124a
         BgHIGRQjgc8ZwVkQ7+j7Hfmb6cD5aCaenutKjBOXigMVdpwoyzrgMsBE2NV5lHCcIzki
         1/H7d1u2WBGx7UomjC/6hKaH/cCJ33Avsg0sIWcyqyd6KhuOShJJijcv9f+eUoU+x9VI
         eNlAqLHFaoPwsyOXb4JQgqrmPB1Kxia38QoNreaep5IK3JptMrdroDJqJQorkyIxk97h
         vzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781530771; x=1782135571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crU/YWEeXaonCN7cJRF0MeFCZ4XnzfssYJGTp4fDCnc=;
        b=pZe9kdyPrr9Jm+qczqXEb9Fpe9wjsiJBHrZOSykv7zK7c0V+uMdsGys6ZV9EvMZYV8
         TysWY8yuZLvowkzqtZNpPVA+NCEuuzbn/ZvtSBDR9zmeTaxvefHkcHi3iLUjRve7HuO/
         6uNs5xmupwUcrbBcLZfpNv3HOsynff7Y2HoZLW2ALZN4zDIPiu9tUHcMrIk55pM5MCVO
         Jcnrk+itM0n77iWk99Ydt+Us2DcrIxFnjleceyaBloWadSPXkGf3sOIZjzO7SxmlBHnz
         TlmgHVWPvn2MLwEF7cHgkL71CQxJ0x62RBvxoDlmi3ihWuVSZUoA31GGZ5kv0ZnVJINJ
         f6vg==
X-Forwarded-Encrypted: i=1; AFNElJ+isTdul6Sn0t8Kuj/+keQk+b7bqdHLz3OV6NOWos4KiZnW6/v3YSIzdFlUFl+8cG9cdAcxhNuLwb5N5AXqleY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBFkw4WQfV5CFMCOFOMzVYwhALFP17zb6FDb+Cw28weq3I26pP
	NeU2C88D2dhUOEr41JTDKvAdgkpspQppimPJuU9UhPf7Kzt2KGyJKIWE
X-Gm-Gg: Acq92OHTBsJP4TDMU5NacowLD4QBsjERemPgtdYNxZJ5b4HWKqR4noOXr0qfDTgWA/K
	ANEU7BT4W4wIvTTZoNKXaKVtDCVWnrynWk752wwddKUIFhS5HnL9pBLREJxfl7SvPPP7GzIE64K
	+RYCe2H0rafaWEowKd10lCjwO776lmJS0rvqKvK3AsjMPxiV7IZWt7o2bIzX9rVn7rwRWmMy5oI
	ZO7XIOANp06rvY53R1g7LuOH+Fh6zIdOE37n8B/K0x1cQ6dF5aTZ/Sa47R1fkcEjk1uCtZaVKBC
	Sv0YYyNXazfLo1yDU6WNM0SbSlg3em4COQwtapLrmvvB1sUx/XaWoh2AOvW4yUEZWZQ0kk3pzGE
	LD/zSxpqi/y6Joa+IMAk4Opax57Y3nJCSDvdtjM5HbHR5wyVvp0jKuTwEuC6/YeYZrB9umS/1Pc
	rA+akIckGBA76Cue0D53pKxk+Hoer5h6ZoRsF+1qHw7pkHFzIqKEdTV1znseypCHiQVbJ75RGvT
	zdK+3gVbjgIEmRUm34OBRjdKbX6zYOCLswSpnWY6hrF4bQNOV8rVU8+F7Zs/7dWDpe0zEnZp5lb
	DFMs/1Yq/hC0hlFDQIWErpOF6NPcQVfMkqm0yvkXQBc=
X-Received: by 2002:a5d:5d81:0:b0:460:1f34:cf80 with SMTP id ffacd0b85a97d-4606da622ffmr21403888f8f.18.1781530771203;
        Mon, 15 Jun 2026 06:39:31 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e009a0d3db09e2f2ffb.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:9a0d:3db0:9e2f:2ffb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263945sm35148433f8f.8.2026.06.15.06.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 06:39:30 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:39:28 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
	shuah@kernel.org
Subject: Re: [PATCH bpf 1/2] bpf: Fix partial copy of non-linear skb test_run
 output
Message-ID: <ajAAkIv0R3ztfc5g@mail.gmail.com>
References: <20260615073856.152479-1-sun.jian.kdev@gmail.com>
 <20260615073856.152479-2-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615073856.152479-2-sun.jian.kdev@gmail.com>

On Mon, Jun 15, 2026 at 03:38:55PM +0800, Sun Jian wrote:
> For non-linear skbs, bpf_test_finish() derives the linear head copy
> length from copy_size - frag_size. This only matches the skb head length
> when copy_size is the full packet size.
> 
> When userspace provides a short data_out buffer, copy_size is clamped to
> that buffer size. If copy_size is smaller than frag_size, the computed
> length becomes negative and bpf_test_finish() returns -ENOSPC before
> copying the packet prefix or updating data_size_out.

Thanks for fixing this!

> 
> Compute the linear head length from the skb layout instead, and clamp the
> head copy length to copy_size. This preserves the expected partial-copy
> semantics: return -ENOSPC, copy the packet prefix that fits in data_out,
> and report the full packet length through data_size_out.
> 
> Fixes: 838baa351cee ("bpf: Craft non-linear skbs in BPF_PROG_TEST_RUN")

Wouldn't this bug actually go back to 7855e0db150ad ("bpf: test_run:
add xdp_shared_info pointer in bpf_test_finish signature") and also
affect the XDP bpf_prog_test_run_xdp()? If so, could you also add a
selftest that covers it for XDP?

> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  net/bpf/test_run.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
> index 2bc04feadfab..976e8fa31bc9 100644
> --- a/net/bpf/test_run.c
> +++ b/net/bpf/test_run.c
> @@ -453,19 +453,16 @@ static int bpf_test_finish(const union bpf_attr *kattr,
>  	}
>  
>  	if (data_out) {
> -		int len = sinfo ? copy_size - frag_size : copy_size;
> -
> -		if (len < 0) {
> -			err = -ENOSPC;
> -			goto out;
> -		}
> +		u32 head_len = size - frag_size;
> +		u32 len = min(copy_size, head_len);
>  
>  		if (copy_to_user(data_out, data, len))
>  			goto out;
>  
>  		if (sinfo) {
> -			int i, offset = len;
> +			u32 offset = len;
>  			u32 data_len;
> +			int i;
>  
>  			for (i = 0; i < sinfo->nr_frags; i++) {
>  				skb_frag_t *frag = &sinfo->frags[i];
> -- 
> 2.43.0
> 
