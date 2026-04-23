Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4DC3876B8
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 10:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776941551; cv=none; b=HR4+YZWoBiA0UBP6Gm2HWJO6CTUsLt1D7+Eh31yE3pvhummfqBzWIaca3ZnItBLDr0h8KGghqvAtc4hJm96hMgQbWwIKJ1aqF2mTWfmOHA2UYlfcvJU4QhJLzP/EfCc8LS8Yktturg+CKg42UeC5Rl/fwWWehaz0CdrbjUtqiTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776941551; c=relaxed/simple;
	bh=wq1Cu8bZXdxkc1IEjaOXG3kJSBniOcazTJJjusnkaCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bz7XIGixFnK4vZl4YNWr72PiZkWpj0WAQYfWfcCMX7EUJBUm7fuaZx9+Vy8uU07WxIkj9hfojp/brlKqIdsjAQTVvpp1vfdufei1oe2SQtT5ss3S+DwHQwB5BmiCM5RH+wJKAiIyzDOnQWfubzfkaUIzykMwc6Cd/SS7bM8sIDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKZK9V5H; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKZK9V5H"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so3148670a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 03:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776941549; x=1777546349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OeNLLevQh3pBYAO6lXAZTdw0TrOMFI6h3YnGdTBUiYQ=;
        b=VKZK9V5Huo+WB4bmsS98C4hhHBTVcwFG6ZDszYozrLtqKuVfduLVPRd9ofWjILbXMr
         5U2PlE6wfxBwoAQaSEU/X2gXrYS9/sX+QzSD4F9vUBfyjrJl81Bg8OslOWBTGsgWT06X
         VOUK0MHzf7qmyAxGtVO4ybuuG30h2hwy5NdRh5mp8sGSCSkfeOABoEp4mubaQZSCCjJk
         GJYUNgs0ALTH3stfrB7iN6JRMjw6jRzkHiTHKits2ObZaM95KzukWxDzjvSA9ZDmjmMF
         wLAKlsVKb1QtUfsGgsalRjgGzW3ZMWPtGeTibqoFNsTz2Upl/WWsLTjLJ4FHXaQ/DSGn
         VgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776941549; x=1777546349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OeNLLevQh3pBYAO6lXAZTdw0TrOMFI6h3YnGdTBUiYQ=;
        b=tXvGfq6lCk2uyNTiJ/MhM241QW/cfhDV42bNzbYrRCW8kC2TESIkHWoXuTi1jXeshy
         xWzNXpQycVgtJgkQ3RjKHk1WSGWpaKuzCGX+eNmRTJa6rpHZeEOcEbbYetLcdnENYrac
         OWN+zSRGbOsyQjsZlPt/Fcv/189giLXXAy3Rzuw64on87rQtlOQ+C09i22RF9stj2nT6
         eYP+MVtKeJ+5yOKPrakg+n6ew9MUvbAhtzgJNaCVr3xyl0OC0zk68D2p/GC7gVH3/CEs
         Df/UsS1tIhmSZl0UyStp/jE831LboawMQZNXbdhsmA1NNBWxSbcnPrOb6vaATF+zrOzc
         sB4A==
X-Forwarded-Encrypted: i=1; AFNElJ8GOop6P0EP/ejvjEkSl7ZFZIiflsOPCvxmbWG8bOSKjzb1AIDEU+JJh/mGC0CqxqAcxs/bM5DqNBSRRyVRfIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMZ7xgoDMKT6JC2VApnQLajIh4BEaSc+6ZtX8t0mJuQa4bcK/W
	9neWjp1OKTd9up3gNEZWZmNB+12xo7rQ9US8MNlQ5S8csycABz631oK7
X-Gm-Gg: AeBDiessEsDK4Le/4YJucrJE8fxYSVYz00vRU7SQw1+i/34pjndco7QTAA8N0/XxYye
	RGxaBdZin+XWNJeSSeUVI2UzYoxUmjs0cT3Q0RkSj6eWO2gGeky1H3sJVpI/Y5P83I1YX3U9DAn
	xq4cwMNB707RlJK4xZWXbkvGhOBmhWyCpa3FYQi7KfkJsa27o3nOCXdV8XtZ4Xx1HfIVWf0GQdO
	urUEfe8oZ50wmJ92t42CNB44rNx56KF0Sgi00XehaIA0ETa3ad3K7Tok22pbl+I01JwFvAif/AB
	A5bURAnSfqVegtPDZx9/BE0xYZnv3gfNjW4H8zMDKUsZWn3ESaTJCPQ+tQvr80dN4iUsuzzVaQY
	AG/3N6XIcQRTugSIvLND7liABLe5G/xE79YknD4khyI1/MTddgAtrdDaZzO3Ju0SoBDu6Jkz2Cp
	qyRmcPzohwhcr+V6gOiTdQpvjkTOnsa2hWMwasu6yQy/qnpXGm/0QLfQV4YToLlBLb9N2jZYSEb
	O2/uoEwE1OvcQ89
X-Received: by 2002:a17:90b:5544:b0:356:22ef:57ba with SMTP id 98e67ed59e1d1-361403dfee7mr25650866a91.7.1776941549066;
        Thu, 23 Apr 2026 03:52:29 -0700 (PDT)
Received: from cchengyang.duckdns.org (36-225-83-234.dynamic-ip.hinet.net. [36.225.83.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614189343esm19666810a91.6.2026.04.23.03.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:52:28 -0700 (PDT)
Date: Thu, 23 Apr 2026 18:52:24 +0800
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Zhao Mengmeng <zhaomzhao@126.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, 
	Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, sched-ext@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Zhao Mengmeng <zhaomengmeng@kylinos.cn>, Ching-Chun Huang <jserv@ccns.ncku.edu.tw>, 
	Chia-Ping Tsai <chia7712@gmail.com>
Subject: Re: [PATCH] selftests/sched_ext: Include common.bpf.h to avoid build
 failure
Message-ID: <20260423184955.G2144@cchengyang.duckdns.org>
References: <20260423-b4-selftest-fix-v1-1-8c72287bde3d@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-b4-selftest-fix-v1-1-8c72287bde3d@kylinos.cn>

Hi Zhao,

On Thu, Apr 23, 2026 at 06:42:35PM +0800, Zhao Mengmeng wrote:
> From: Zhao Mengmeng <zhaomengmeng@kylinos.cn>
> 
> In scx-cid patchsets, sched_ext selftest failed to build with following
> error:
> 
> non_scx_kfunc_deny.bpf.c:17:6: error: conflicting types for 'scx_bpf_kick_cpu'
> 17 | void scx_bpf_kick_cpu(s32 cpu, u64 flags) __ksym;
> |      ^
> tools/testing/selftests/sched_ext/build/include/vmlinux.h:136300:13: note: previous declaration is here
> 136300 | extern void scx_bpf_kick_cpu(s32 cpu, u64 flags, const struct bpf_prog_aux *aux) __weak __ksym;
> |             ^
> non_scx_kfunc_deny.bpf.c:26:23: error: too few arguments to function call, expected 3, have 2
> 26 |         scx_bpf_kick_cpu(0, 0);
> |         ~~~~~~~~~~~~~~~~     ^
> tools/testing/selftests/sched_ext/build/include/vmlinux.h:136300:13: note: 'scx_bpf_kick_cpu' declared here
> 136300 | extern void scx_bpf_kick_cpu(s32 cpu, u64 flags, const struct bpf_prog_aux *aux) __weak __ksym;
> 
> The root cause is on scx core part, but we can avoid this by including
> common.bpf.h and remove scx_bpf_kick_cpu() to make it more robust, just
> like the usage in other xx.bpf.c.
> 
> Link: https://lore.kernel.org/sched-ext/20260421071945.3110084-1-tj@kernel.org/
> Signed-off-by: Zhao Mengmeng <zhaomengmeng@kylinos.cn>
> Tested-by: Cheng-Yang Chou <yphbchou0911@gmail.com>

Thanks for the fix, LGTM!

> ---
>  tools/testing/selftests/sched_ext/non_scx_kfunc_deny.bpf.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/sched_ext/non_scx_kfunc_deny.bpf.c b/tools/testing/selftests/sched_ext/non_scx_kfunc_deny.bpf.c
> index 9f16d39255e7..0d6fcc8e5eb6 100644
> --- a/tools/testing/selftests/sched_ext/non_scx_kfunc_deny.bpf.c
> +++ b/tools/testing/selftests/sched_ext/non_scx_kfunc_deny.bpf.c
> @@ -9,12 +9,7 @@
>   * Copyright (C) 2026 Cheng-Yang Chou <yphbchou0911@gmail.com>
>   */
>  
> -#include <vmlinux.h>
> -#include <bpf/bpf_helpers.h>
> -#include <bpf/bpf_tracing.h>
> -
> -/* SCX kfunc from scx_kfunc_ids_any set */
> -void scx_bpf_kick_cpu(s32 cpu, u64 flags) __ksym;
> +#include <scx/common.bpf.h>
>  
>  SEC("struct_ops/ssthresh")
>  __u32 BPF_PROG(tcp_ca_ssthresh, struct sock *sk)
> 
> ---
> base-commit: eff158514a85c1b81966667a880dd8bcd29bbbd1
> change-id: 20260423-b4-selftest-fix-d87cdda6185e
> 
> Best regards,
> --  
> Zhao Mengmeng <zhaomengmeng@kylinos.cn>
> 

-- 
Cheers,
Cheng-Yang
