Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2145E318EFF
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 05:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776229388; cv=pass; b=h9vCQcRCoC1RyxmHqq+iawbtTadkSNYZ2+m4/M7fWdkprrlPhe2MY+Jkp9dPMmApmBiSwAc/VShcL29i5seZeSXoOcn5pc0UuR8n48T5NjpMS1DE+AdaEePI781TafcvrjvyrufH3HWwHWO45EDOA0dXZJFYnTmfFnAHjQCAkaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776229388; c=relaxed/simple;
	bh=fGuuE8tUzF5eS1PAD+Ab0UOa4wxXcjrLg+nGVcrtBwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YP2A/txggiF5gkjYmkHbFpk08xwlNZu6QTdXpJ5PzhVfzqMXaBVI8sYhrmrVm3xrtmZTIibSREdLjCxxqGmrISH7PKEDfdBOsdpa7soQ2nkVo36LmfQyAWH4iz0Oggsj3iGeiUHKJlhQxoegjq374lhGu7ZQx2q9gQXONiGXQ0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FzydE54M; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FzydE54M"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c287eb77fso9965249c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 22:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776229386; cv=none;
        d=google.com; s=arc-20240605;
        b=VbKK6zEm9qTXtdeYMyHguTjta0x0yo+YQd7GaprTSj0beYXyVqdTHr4v6M3Vqm6Yl3
         3fKXCUzhFWfkStxgRtqvlfZ1+MC1i0wBvUOZEpK7xHiSxoAUbZBFAo8yLehfJyyfojSm
         vS4kERASqg0jjodUmx42sOhABmTNUfIlHw0zl7yvs1LUYScY0TPqGSedtUwYNvduPFis
         nYwbVidGNtTfY6OogkW+OYI/1nvgxcN7MB8fQgxagaKArVneMa2Rcc9Qco+JGfGXuLId
         RiDOJkkQuHR1qkJwpJ9pNOhN39CEbdDkYLl2WFJNOUPIh5BD90FHQF9/Nm1Y1QV9ifoO
         xlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uZC9Xmxwou/YeM1QDbSuaSicunUg5xqUIEJn3vfDI0E=;
        fh=xOGihPqeEYiS9QSEpPbNYEa47kdk973GrweSZOAo604=;
        b=XAaHUKXDSaZNrzJlhnDvXDyCdMIOMLFrae/ZB07+ilu5QG52+blFP4XXjDDmEJc0rt
         oTFeQavKw8Iwe5y8Q/1SJBeVWF/uF4VuOPlI6S4kzrBPfr2g+KaNTgEkiwno29K22vJM
         pscHecURgswwWoA55rqdMFbf7IIvjDeYYGZeyWrgL93qg2QE9fspvqbFulgVMDxawjW3
         P37ehi14MculwC/X7gghvf8CnXoZMgjPyc+KoJDWVYNPfeIsyw5+ZA2viT1QFH/X+297
         kWN7Rhd6AJVpdcEP1CJMHyduVhZ7YFQYUp4FEbN1Z8pr0B/6PXjMpfkJHzXuwlV0KQkD
         ysHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776229386; x=1776834186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZC9Xmxwou/YeM1QDbSuaSicunUg5xqUIEJn3vfDI0E=;
        b=FzydE54MCUpFwKefARAstG2UILU/+dVykGD6eTZm/Slstq6Sof5aWlljVGMkGNu4V6
         sx3ka9F0lYz08bWzSFN18xeLaLoF5HlHrOlX9Vm4tF1SVbN9w+7xPRKG15Ge4hLd2Nv5
         KDlhhu3B3YIaYnsH1VLcw8M0eftdCUcnILIhz0UJF+qmppTF9Xo+w1037NqQk6y2iBrG
         eLZtxODIDxAr4V0G522+pBplLL8c5P+0a4tMZYegBcnzAYqt6+Dq0A9K6WxNozZStsmf
         GEGbN/3StpTISrPNt9Ty2nwxGQTvfQ9cnbkfJcW/RM96wFSS7RYAgDkqKtR3e5Lp6ASb
         kLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776229386; x=1776834186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uZC9Xmxwou/YeM1QDbSuaSicunUg5xqUIEJn3vfDI0E=;
        b=Ntd/sA4sYGNiRhRQ5uNBdtKd3WxqS/hFp2+8jU+Ver69r2PPZb68ExSm7xVbfzMq43
         B/zdZPbYqcSVO/3XVcPjOkYk41q0G9/Xsw09cVHvDuHVXCf8H4ABshAEn8pAoj/AwVrR
         qvkBljNeMLzl9xuICu3cD7MlBxkS6g0Uy7azwijScc4lTSh32a9dwxMXfovsAmahJpeZ
         a6oRay5/5agpq7rkgDnLBI/0vqFBX35zK8YvFkFyBVqUo0C0Hm+II3I2XDqlM8sIR/yv
         hSlDKYNgMZn2sXybpohhH2t0zYWmVXGxo2fyjCfoPMcm+B2rk00vRl0gjhKb6NwxmX8v
         gxYg==
X-Forwarded-Encrypted: i=1; AFNElJ8W4mpTfgZ4wCUPRwU2CNNZz2Y9WaMEQp0YCwGOsFG/z2o4wytUWOXjypD9KadASSerOG3GodsYUB2HQJG1gRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxu04GXXZcmsgCDMCR7r7mgFfOPXFgeygcES762y5JI+eJZRVg
	y+EwXG7zcpoF8pFnV9o7GjdkecQNEX4uoNs+BOM+A+u47kFlooonBdlJYbjySsjNryoDX/N964O
	LpHpcahNBTbXAquLYzJYnDg29QqX6h78rEERgi7vx
X-Gm-Gg: AeBDieuslVX43HJc7U7jYbm/0rSnbjuQHuuRsJjvQVXi9EKL6MbzgJRdWOe7LMrgKwX
	9HkNVxkKfWTR4IVa0+1EEJTc4yQqSpOIsI/DYnJa2V072G28qp5qAHIlNXgYJut8ap62MtZ8vPq
	0GT/hODj12tPRzU5WH0Nc5KXfjKUQx5IMFGsORiidbToiqPNYkhm6+ZHCwK7EWb/jSz7a/eP72f
	tn7FbIhZLuPWKhjQrbfG6hHJh+SmUkN73/4/OW5v/d9eprlG+YieHkJwyyQMW5YVbzjhbApYCna
	aLyjyJB1hBNweW5MiKKatLLZFlIetGfB++7tsb4cBFSAk9zcehl6jTvk60BcsWMk+xOJ4421F9F
	iBuXluJaSPMemejMX1riJHtpevH/podBcTp2SqV9lbDvrZC3BX5fcSGR64qux5lv/5oXBnX6NDW
	BwFYF/Z2z1
X-Received: by 2002:a05:7022:faa:b0:127:3915:76b2 with SMTP id
 a92af1059eb24-12c34f07f1fmr11520144c88.27.1776229385519; Tue, 14 Apr 2026
 22:03:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414-unix-proto-update-null-ptr-deref-v4-0-2af6fe97918e@rbox.co>
 <20260414-unix-proto-update-null-ptr-deref-v4-5-2af6fe97918e@rbox.co>
In-Reply-To: <20260414-unix-proto-update-null-ptr-deref-v4-5-2af6fe97918e@rbox.co>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 14 Apr 2026 22:02:54 -0700
X-Gm-Features: AQROBzC61U2caASKHWRYjmp86WpWvwDPDOjBGrBWlvFKCfDox66DepDxhPOqVoc
Message-ID: <CAAVpQUBkq+wNSRiNLMKhpeY2AAZ48d9=hG9dWyGbf_MRS89-Mw@mail.gmail.com>
Subject: Re: [PATCH bpf v4 5/5] bpf, sockmap: Take state lock for af_unix iter
To: Michal Luczaj <mhal@rbox.co>
Cc: John Fastabend <john.fastabend@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Cong Wang <cong.wang@bytedance.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 7:13=E2=80=AFAM Michal Luczaj <mhal@rbox.co> wrote:
>
> When a BPF iterator program updates a sockmap, there is a race condition =
in
> unix_stream_bpf_update_proto() where the `peer` pointer can become stale[=
1]
> during a state transition TCP_ESTABLISHED -> TCP_CLOSE.
>
>         CPU0 bpf                          CPU1 close
>         --------                          ----------
> // unix_stream_bpf_update_proto()
> sk_pair =3D unix_peer(sk)
> if (unlikely(!sk_pair))
>    return -EINVAL;
>                                      // unix_release_sock()
>                                      skpair =3D unix_peer(sk);
>                                      unix_peer(sk) =3D NULL;
>                                      sock_put(skpair)
> sock_hold(sk_pair) // UaF
>
> More practically, this fix guarantees that the iterator program is
> consistently provided with a unix socket that remains stable during
> iterator execution.
>
> [1]:
> BUG: KASAN: slab-use-after-free in unix_stream_bpf_update_proto+0x155/0x4=
90
> Write of size 4 at addr ffff8881178c9a00 by task test_progs/2231
> Call Trace:
>  dump_stack_lvl+0x5d/0x80
>  print_report+0x170/0x4f3
>  kasan_report+0xe4/0x1c0
>  kasan_check_range+0x125/0x200
>  unix_stream_bpf_update_proto+0x155/0x490
>  sock_map_link+0x71c/0xec0
>  sock_map_update_common+0xbc/0x600
>  sock_map_update_elem+0x19a/0x1f0
>  bpf_prog_bbbf56096cdd4f01_selective_dump_unix+0x20c/0x217
>  bpf_iter_run_prog+0x21e/0xae0
>  bpf_iter_unix_seq_show+0x1e0/0x2a0
>  bpf_seq_read+0x42c/0x10d0
>  vfs_read+0x171/0xb20
>  ksys_read+0xff/0x200
>  do_syscall_64+0xf7/0x5e0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Allocated by task 2236:
>  kasan_save_stack+0x30/0x50
>  kasan_save_track+0x14/0x30
>  __kasan_slab_alloc+0x63/0x80
>  kmem_cache_alloc_noprof+0x1d5/0x680
>  sk_prot_alloc+0x59/0x210
>  sk_alloc+0x34/0x470
>  unix_create1+0x86/0x8a0
>  unix_stream_connect+0x318/0x15b0
>  __sys_connect+0xfd/0x130
>  __x64_sys_connect+0x72/0xd0
>  do_syscall_64+0xf7/0x5e0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Freed by task 2236:
>  kasan_save_stack+0x30/0x50
>  kasan_save_track+0x14/0x30
>  kasan_save_free_info+0x3b/0x70
>  __kasan_slab_free+0x47/0x70
>  kmem_cache_free+0x11c/0x590
>  __sk_destruct+0x432/0x6e0
>  unix_release_sock+0x9b3/0xf60
>  unix_release+0x8a/0xf0
>  __sock_release+0xb0/0x270
>  sock_close+0x18/0x20
>  __fput+0x36e/0xac0
>  fput_close_sync+0xe5/0x1a0
>  __x64_sys_close+0x7d/0xd0
>  do_syscall_64+0xf7/0x5e0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Fixes: 2c860a43dd77 ("bpf: af_unix: Implement BPF iterator for UNIX domai=
n socket.")
> Signed-off-by: Michal Luczaj <mhal@rbox.co>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks for the fixes, Michal !
