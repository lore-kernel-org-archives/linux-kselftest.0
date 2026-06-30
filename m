Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EBA3E0223
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782843085; cv=none; b=eTAROrOujJGYrJ8A2mVtFt3u9KByox+46DiKDYZukwRSKa0JYKPwglyGV3OQbmpNvUkhgDwWgB8Ws5JZu5fAnVgnu3nfL6zGo5iwoajNAxKQwPOT1CWHk6VysM5bHbs0LC5RPVfLXXSXB4odXWbHFTztQdyakg609ssz+HIbcMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782843085; c=relaxed/simple;
	bh=GmiSEyyNB7x0aLtv4lpKAHOSN/63+9+ZgW63VVm+7/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9Qyxzs9Fa2lNYatJrkjULCY6+iAg8KZ9wUCZvMnWOTQ6ASw0L8en8pmDePtwAws0X49HgX/t8iQveiKlQqWvnodtgQO9R2lXstmFPGTVxotMCXd32CECLGLKzOY/E0IXiuJMjf8km/18ZvSjLeaU6cd5EWyUULo3ji2pVa/1oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBHuX4I/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBHuX4I/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493be1b9682so2245225e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 11:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782843083; x=1783447883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tkvmyfnD6mRHr9hwmtmQjGJkaKe6zFgifbRb8CeRxNc=;
        b=CBHuX4I/Y6/XEbcw2lE8Utt+ncjgKRcBEpOkTbNHApttQiimI73cUQ5E8s+FMGTnam
         0QNo+u5CGinuvmEBOGyNHmNvdEKHrfkJsRNhYilTAEtwEMrXzKd7aak+p8xvGlGFzfT2
         aEJ/tqBMtJZrwEOq2nCUgZQz6dWpEIKK0m89cx/5SgYJ1beHV/XWM/vIQU+7+bM+rnD0
         4+cPwU9Ptduh+uvIiMf8LbKj/p2DVY/dP/hX2inG0cw59CYLq8Bhri6Awyg5beHgHh5U
         fJZyJHlLU6s1S1Ogs/fsgghh4AF37+dys1yCNxWjSG8qsZ5UFBP6B10M6jQhXMQ5zJxZ
         glww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782843083; x=1783447883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkvmyfnD6mRHr9hwmtmQjGJkaKe6zFgifbRb8CeRxNc=;
        b=B0vVFt1lSu5sUu8kmik/uzRB1xi046ERNfsm5ZSbmUjnMeJ+7wLiUk4bsYaH/m4m6/
         1655ucCenH6ZkTXcspLu/lFyfdGFOtzaxCJXFTYsBieyGQUm2BctDOeWwGkvDNbMtWHY
         4oWuwY55T98gtBbtDlpt70ra2Ydsk7I9RUPrWWSoTVrNFkACg0F0mL8ReiOrnQA1HOF1
         /wF1BsKKcbChV81IGOTzgYaoT8Dlnv+j46XYexiOJLxY/Y7pOy9O8ijs5zK4RytGLdAy
         5QQzqnKOGlKD3ckV4rUf2dctkEJaLQSG+uDk9hLpdFjKrjB/93FKH0sxc2BxZRXUjrtK
         U7oQ==
X-Forwarded-Encrypted: i=1; AFNElJ+I3ay+SJYLDRgwcIHvINGYGgqWh0JDF/NHQjws9jLSPE7BD0xc9ZTcd2kaknUDYAV5mL4DFGupqvHgy6E4pg8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkk9psgmbYHpcEt1jBUDjb3r8rpjN6HukY6YwaELFZlRsV+p86
	DG4MU0yeG9VtJ2BBIiwPqvJySNwVHottemkjqVD5oXkII/gr/Bx0KZgD
X-Gm-Gg: AfdE7cmstQpBRWtF4iejMkaHCjTTmFh1yCfZQdOXIeOGhVvFHRv4iti8bNbj3aLRYuM
	mQ9xaAMSvnvExRXn4bHDnm8pe9sGb0oBESGELV/lD7XAYtIAyEua/X5TQDFCyk4C+LgJ+mpsmLY
	0sW1E05iLKaQr9l6bUJf6ejXVJ5xYy37HZR3jo4vss7B77enbi/UWlwC4eELnG2MLjgXHjUaXga
	pVtQLCmsvxBNJSsvdpUDtlSDWesIpe8l5gGUUWhW0aYuX3qsii3dIaTYLwmHPyJTal8Rvjmq5nA
	RGhHNohEuh2aB8giM2q0nw3JeU/jNbDoPoLqYakOb0up9bA7K7SsSW+cvnTUlMcVC3hpK5+22vn
	KvAOqfO3lr5gNs9MtyFLUjSYLX61T5HaDu7TsbAwiZCMm2RJsSyqGKrnKb68xJ+0eJywOkWlfhb
	kuqpMUDS0bU3Q9wBGNqRvYcN6TM6mZb4i4
X-Received: by 2002:a05:600c:6994:b0:493:bb6b:5bda with SMTP id 5b1f17b1804b1-493bb6b6372mr47286425e9.29.1782843082488;
        Tue, 30 Jun 2026 11:11:22 -0700 (PDT)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef248b7sm2760925e9.2.2026.06.30.11.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 11:11:21 -0700 (PDT)
Date: Tue, 30 Jun 2026 18:21:22 +0000
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
Subject: Re: [PATCH bpf-next v3 0/2] bpf: Enforce gotox targets against
 subprog bounds
Message-ID: <akQJIsYbSx/8ZpE1@mail.gmail.com>
References: <20260628-f01-03-gotox-bpf-next-v3-0-b744432e1361@mails.tsinghua.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-f01-03-gotox-bpf-next-v3-0-b744432e1361@mails.tsinghua.edu.cn>

On 26/06/28 09:59PM, Nuoqi Gui wrote:
> For gotox, CFG construction models the indirect-jump target set in
> insn_aux_data->jt, while do_check() later follows targets from the runtime
> PTR_TO_INSN register's own INSN_ARRAY map. If the same gotox can be
> reached with PTR_TO_INSN values from different maps, do_check() can accept
> a target outside the calling subprog.

Can we use some human-readable description here? Please just explain that maps
considered during the config stage must be a super-set of maps checked runtime.

> The observed x86 JIT case can then enter another subprog without a matching
> BPF call frame and crash when the program is run.

Sorry, but why the x86 is still here?

> 
> Fix this by rejecting gotox map targets outside the current gotox subprog.
> Add a regression test covering the two-map cross-subprog case.
> 
> v1 -> v2:
>   - Validate gotox runtime targets against the current subprog bounds instead
>     of scanning the CFG jump table.
>   - Fix the selftest expected error from -EACCES to -EINVAL.
> 
> v2 -> v3:
>   - Drop the Validation section from the cover letter.
>   - Clarify that the crash was observed through the x86 JIT path while the
>     verifier invariant is generic.
>   - Simplify the cover letter and commit message.
>   - Remove the unused skel argument from the raw-insn selftest.
>   - Move the raw-insn selftest to the end of test_bpf_gotox().
> 
> v1:
>   https://lore.kernel.org/bpf/20260609-f01-03-gotox-bpf-next-v1-0-b441d63a1559@mails.tsinghua.edu.cn/
> 
> v2:
>   https://lore.kernel.org/bpf/20260613-f01-03-gotox-bpf-next-v2-send-v2-0-7c883b43f3c3@mails.tsinghua.edu.cn/
> 
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---
> Nuoqi Gui (2):
>       bpf: Enforce gotox targets against subprog bounds
>       selftests/bpf: Add cross-subprog gotox target coverage
> 
>  kernel/bpf/verifier.c                              | 19 ++++++
>  tools/testing/selftests/bpf/prog_tests/bpf_gotox.c | 73 ++++++++++++++++++++++
>  2 files changed, 92 insertions(+)
> ---
> base-commit: 7bfb93e3475be9de894f1cecd3a727d3e1649b03
> change-id: 20260628-f01-03-gotox-bpf-next-1a7af91d2c82
> 
> Best regards,
> --  
> Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> 
