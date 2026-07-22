Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2651A33D6F0
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 11:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719224; cv=none; b=KZTIUzgG2m9mBPra/6ggramIqk18514sBmiI5Nar2xkji0GRq0jDlAI7aJcjx8MMHsA1gfyXDgVTgcFMK+Vm3THU8E/9XQX7DiYjGHOQsojhTigFCVYU3uw4ut3FHGV7CjW9HQ9pOVVwni6ysYUXjgVc5XaCk2hMmbxAkC7XoQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719224; c=relaxed/simple;
	bh=DNfsK3Qc4wnPZsEh1/qi+3R4oMemw6sshSP1AuLudMY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMwdelR0JLweqKbcppp/SN82WQVQ+5sSxG7crtOqz09ipDESADbqGyHBYDJH+y7iE2ow3fJBPQY/c7msffIuQnzpNoXX1OYWQ9LYD74GyDiRAeCyIATG+QagZhnFsMI5lT+enA45BY4egUINc8YlYeVzDrJ6CFYaXi02A0dSYBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtQgnd2l; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtQgnd2l"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso22041785e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 04:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784719221; x=1785324021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RmjmwaU2oCm5qiT++FhifaZEeDp06wO3d7kV+FIvU1k=;
        b=HtQgnd2lzOxrH6bJXgwO6RyLgAcBS/oQ0sz+wNY1JOrmFTg4EctIX0d0oOiZI5g72+
         5Qh4fdmnxkhVrxVu0OOXCYKp9XkCTrmaA9XEk6Xc0mPoRHxKZ0Encouf7IGeY7TiNqxR
         +cSvgl29bJY1+cb4MvYtjxq0Pgz/lghvAqXM3FLx2es4pxxjK3WEdMWTiamwdWijA+Eo
         5jYTWb+hH2jm/F6ZASNasua0QLyxAFAwe+1/8WZ3LPec+gUOVgna07bbGlhCLiisg3rq
         yB4+0UGXzwuIf6gJK7lHJPLwqQ7LXm+BW4LoeDXhpaTgURe7gCjpLKiF9ZoBYO3NfbOI
         GfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719221; x=1785324021;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RmjmwaU2oCm5qiT++FhifaZEeDp06wO3d7kV+FIvU1k=;
        b=rX9DKEVdT0jMrFQORYRfgbv4t7WWgiSsWDxxaa0z3Qw4WoYB5ehLX5fZ7i9AAFyvDy
         YGlpa7yWJ3SJ6w5vANGnXvPt8L9dT0N583065vzNcnH2pKuHMc1Ke3RrZtd6LBNTFHtG
         PhBik9cZSc8UNkhhLRHkKrEZTfkO4hvD9a9A0187XZeSslfro4Wx7Qrm9j1OC7cgzpUz
         1s7xo9WJLEvfohctaEESoy4q97a6X5ArMabKo4KCTC8hPEpgfevDjxrCoL4nHrmRxDYl
         zRLWsH0nqlGoy4Gruw/Gz7xHTsvxmrTNPUr6n/90kFKVi8wKMWoDvhS5ceIxZR6bH9Dw
         ab7w==
X-Forwarded-Encrypted: i=1; AHgh+RostEt75PkIi9xrUiAna83ZBG+yDOH4CnXlTwcuDBhI2Ku2jNnUVVhFJjIrI4bbuVs5jcIKDw3UKeUHHy22VUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzorI0UoR2VWd7pVzHOTr+6p4r2+H0mh1wUJ2X6e79HZqJjGiLT
	txP6ZltceSCG6L+o5L95ksBy7+6RopIhaEKxeWzQd/lgLMd2jR71MtKQ
X-Gm-Gg: AR+sD11jg6asNzucJaSY75ZYgijt72bThthZ7Og2hFmxW9uUAtZ3vXzocREMi8yiKrC
	7F+ahqNutlbTAUmoKerXfrzHJz02MtToDztRh3d45UXsjd/u2Rk/BohUdvLknhHxBRz0bdW9R8c
	Hm01q7a2aFfRHikTCtWnljkxrYXV7KNbovPizHG8pNjLjba5d0QxzZ51hhBoy4KxjNH5ZNjf4oy
	etkxv6d2E6l5psiJP3hxwX7q3VMGyYpAAZ3NNgweUkoC+vBXX97lt6jL9H7+ph0nEKAXbC5vQmi
	DtFh9Wgv3cIC0htb2JeImur+Hf8BDNAJh9Ey5ULapj0LfC9Odee2q6ZjIug4aSlF5tKEPGEJ2ao
	uzc8wrHrHYZDOM5jzq/Q2GFFSWwrzRKY/icmlME5tjqFa7K+3a2s=
X-Received: by 2002:a05:600c:190b:b0:493:c77c:108a with SMTP id 5b1f17b1804b1-4954aa1a10amr243092245e9.36.1784719221270;
        Wed, 22 Jul 2026 04:20:21 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::86b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm5095686f8f.11.2026.07.22.04.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:20:20 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 22 Jul 2026 13:20:18 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>, Jingguo Tan <tanjingguo@huawei.com>,
	Pu Lehui <pulehui@huawei.com>, Lin Ma <malin89@huawei.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-patches-bot@fb.com
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Verify no warning when close
 fexit link
Message-ID: <amCncpSCkLLJfCvR@krava>
References: <20260721133036.49265-1-leon.hwang@linux.dev>
 <20260721133036.49265-3-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721133036.49265-3-leon.hwang@linux.dev>

On Tue, Jul 21, 2026 at 09:30:35PM +0800, Leon Hwang wrote:
> Add a test to verify that there's no WARNING when detaching fexit link by
> following the repro steps of previous commit.
> 
> Without the fix, the WARNING could be triggered by this test.
> 
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>

left 2 nits below

Acked-by: Jiri Olsa <jolsa@kernel.org>

jirka

> ---
>  .../selftests/bpf/prog_tests/tailcalls.c      | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/tailcalls.c b/tools/testing/selftests/bpf/prog_tests/tailcalls.c
> index c66037162da5..86d87d5817cf 100644
> --- a/tools/testing/selftests/bpf/prog_tests/tailcalls.c
> +++ b/tools/testing/selftests/bpf/prog_tests/tailcalls.c
> @@ -13,6 +13,8 @@
>  #include "tailcall_cgrp_storage.skel.h"
>  #include "tailcall_sleepable.skel.h"
>  #include "tailcall_callback.skel.h"
> +#include "tailcall_bpf2bpf2.skel.h"
> +#include "tailcall_bpf2bpf_fexit.skel.h"
>  
>  /* test_tailcall_1 checks basic functionality by patching multiple locations
>   * in a single program for a single tail call slot with nop->jmp, jmp->nop
> @@ -1907,6 +1909,53 @@ static void test_tailcall_callback(void)
>  	RUN_TESTS(tailcall_callback);
>  }
>  
> +static void test_tailcall_bpf2bpf_fexit_links(void)
> +{
> +	struct tailcall_bpf2bpf_fexit *skel1 = NULL, *skel2 = NULL;
> +	struct tailcall_bpf2bpf2 *skel_tc;
> +	struct bpf_link *link;
> +	int err, prog_fd;
> +
> +	skel_tc = tailcall_bpf2bpf2__open_and_load();
> +	if (!ASSERT_OK_PTR(skel_tc, "tailcall_bpf2bpf2__open_and_load"))
> +		return;
> +
> +	skel1 = tailcall_bpf2bpf_fexit__open();
> +	if (!ASSERT_OK_PTR(skel1, "tailcall_bpf2bpf_fexit__open"))
> +		goto out;
> +
> +	prog_fd = bpf_program__fd(skel_tc->progs.classifier_0);
> +	err = bpf_program__set_attach_target(skel1->progs.fexit, prog_fd, "subprog_tail");
> +	if (!ASSERT_OK(err, "bpf_program__set_attach_target"))
> +		goto out;
> +
> +	err = tailcall_bpf2bpf_fexit__load(skel1);
> +	if (!ASSERT_OK(err, "tailcall_bpf2bpf_fexit__load"))
> +		goto out;
> +
> +	link = bpf_program__attach_trace(skel1->progs.fexit);
> +	if (!ASSERT_OK_PTR(link, "bpf_program__attach_trace"))
> +		goto out;
> +	skel1->links.fexit = link;

nit, you could use skel1->links.fexit directly and remove link

> +
> +	skel2 = tailcall_bpf2bpf_fexit__open();
> +	if (!ASSERT_OK_PTR(skel2, "tailcall_bpf2bpf_fexit__open"))
> +		goto out;
> +
> +	err = bpf_program__set_attach_target(skel2->progs.fexit, prog_fd, "subprog_tail");
> +	if (!ASSERT_OK(err, "bpf_program__set_attach_target"))
> +		goto out;
> +
> +	err = tailcall_bpf2bpf_fexit__load(skel2);
> +	if (!ASSERT_OK(err, "tailcall_bpf2bpf_fexit__load"))
> +		goto out;

nit, no need to if/goto, just ASSERT_OK would be enough

> +
> +out:
> +	tailcall_bpf2bpf_fexit__destroy(skel1);
> +	tailcall_bpf2bpf_fexit__destroy(skel2);
> +	tailcall_bpf2bpf2__destroy(skel_tc);
> +}
> +
>  void test_tailcalls(void)
>  {
>  	if (test__start_subtest("tailcall_1"))
> @@ -1974,4 +2023,6 @@ void test_tailcalls(void)
>  	if (test__start_subtest("tailcall_cgrp_storage_no_storage_bridge"))
>  		test_tailcall_cgrp_storage_no_storage_bridge();
>  	test_tailcall_callback();
> +	if (test__start_subtest("tailcall_bpf2bpf_fexit_links"))
> +		test_tailcall_bpf2bpf_fexit_links();
>  }
> -- 
> 2.55.0
> 
