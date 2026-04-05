Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9A61AB6F1
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 23:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775432996; cv=none; b=BM2GyHRZsjJRi13eglCIf2jheKfMlKVa3ZTayuBWu+Nt8tnyJ96IjvSHGfjTx+zNcMj7oDb7u8k4//sBhLsg7oQwmqW4USZ1anksLY+0k0D+osMCkPl1s9CwUwJD01Ug8SMhkuWXZGFeLwWzrsi+6u41gpX2wIfxB26MwsL8A2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775432996; c=relaxed/simple;
	bh=UuxRCYBnHXVCIUC2lYpysNUxFrS3xTL1sRQnQsBThTI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dhb8a3KZmB2FFfkA9Q5aw335qd53MtKBh91oJUlUbLnWBxOjgLPS0bjtZwV9HPfOaTdYz4gh3Nii06JpJqeg13G7V7rQOYRloEpoqzHA5Z8qwXz+co4ZxRnYvN9UD/HsMtzh3F95f02iWyWYoT3t4pTsHGW0GhBNJI0PSv7b/iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=G2kMGy6p; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="G2kMGy6p"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-35d965648a2so2604879a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 16:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1775432993; x=1776037793; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUZVBN2VN4vnEw4Br5X4PEYZMIf8IsAQPOGK1gD3tCE=;
        b=G2kMGy6pTcYp0CwkVO8L3CE0hricXF/suYcSyykCS+BPxGgSDM+3c8h0KqccPejTe8
         ++gKJUAF9thas8dat8Mz//iUeIJUTMuCJn43PpPDo/OGVwWine0I617zjj79E3fwCp7O
         /G7ZnRimr+1+cjxcIyAriRA+OUnYk1DQVlEBmG9dVn3ldNmVDzBH6oJpCCIwvR4p/Xvb
         eGtzJO2o5T1Z8C42QhLWyrEu7A+JPL71qp2k6DL43/MxCfccVit1PWiad5yckV0+Zxy7
         7jrO6+dy72lPkS53TNDcQ3qJSZy+9I8W0VdQ9qXSsrOLTC4q0gTtYHHzEwguCL7cmxjG
         TDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775432993; x=1776037793;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XUZVBN2VN4vnEw4Br5X4PEYZMIf8IsAQPOGK1gD3tCE=;
        b=Ck8lR/G+BXoR/PCmp0Ab+ba/YP5AYlU+lLx0k5Cx3W/d6AQ8Ub8vXEw6mbsZYjh+Eh
         Uu/OXLXrIpRUvyPwBNU+Y+Vs+33divvBMfpTi0PW3jNvtnWsr3DyEw9cKvzbgP/De1+Z
         qtPm1Gz4q+i9UyxwvE7SgskGyUsv57R2oVeu4s7Gf0J3v+cGEn3YLNIP7LFwmX4i+NDC
         Y3e9QcC7jxAbb2SPizJ+HmT8Dj9uyFDBbyGezpf1zpUW0zCPNHKRQUGkuNMBzeMGnt7s
         hQ1j5FwNocFYiPwA6zfvmSDolRNk60MU/9sfs7IASjPjj7hQdncrpdF/1pAvJ8mEwxnI
         +bUw==
X-Forwarded-Encrypted: i=1; AJvYcCVN0XrOqMMvTTXebbQTljK+CzUikSIBKl6F3epndTi2WjGgQfw4Nhql32zg32cZKMy52lpSQliLcKrgy6aBxV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz495/ASGjNBmpckuiwj7EuK8tOqWBxvMCQbGOLEsDQ+2tZP+2
	LSbk25Nfrpm6bCb2KhpMwvREzDhtSdJg20OFG1M5UV+MDhhmYSaaEn5MflEqinxYZZA=
X-Gm-Gg: AeBDievkFzutiUhi1tDiB9oB0vF29vomTkP24vWC9bqgS+mH2Mjo3lj0IesXrioqvVy
	MJazxIK88rw5oQZWDXYoL07fSq8Bo+BxtBa19PY3ZVUmX5h4WZzWce5cje/F8MIc1tejdJxaFWb
	WjAhrT0q4rIfIXjr9peXFKTPyUaxecSE/YDUxM8zCUfzOhJenTMHq/S0P2HLnQYKekyB+Gm8O46
	TfPvQsT6/fsoLGCpE+s8tT6jGgedIerZrunRt6/HpZeH212viU4hEb7WUO0KGUlCNYFE/YxeGfE
	w1a1dzUQ0LD1K4IkNHQ19RZw7Ir1gA6Dzf9uANqdOuGeKX9V5d1TBD9WfBCOCrsFPoE4dk5o3PF
	F9FHvxiQxocx1Xa2e8iNa9NWv72UDOIKsw8q3fZVq/6eIY1h12aLTu3B53L83tHaJ/QEG+MxvC+
	+9UuhHiMI=
X-Received: by 2002:a17:90a:d403:b0:359:3426:c60a with SMTP id 98e67ed59e1d1-35de67da841mr9588504a91.4.1775432993231;
        Sun, 05 Apr 2026 16:49:53 -0700 (PDT)
Received: from localhost ([2604:3d08:487d:cd00::5517])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9377b7sm21338044a91.10.2026.04.05.16.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 16:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Apr 2026 19:49:51 -0400
Message-Id: <DHLMGWNKBI4K.3LM87NOU4XB3O@etsalapatis.com>
Cc: "Quan Sun" <2022090917019@std.uestc.edu.cn>, "Yinhao Hu"
 <dddddd@hust.edu.cn>, "Kaiyan Mei" <M202472210@hust.edu.cn>, "Dongliang Mu"
 <dzm91@hust.edu.cn>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Stanislav Fomichev" <sdf@fomichev.me>, "Alexei
 Starovoitov" <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf v1 1/2] bpf: Fix SOCK_OPS_GET_SK same-register OOB
 read in sock_ops
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260404141010.247536-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260404141010.247536-1-jiayuan.chen@linux.dev>

On Sat Apr 4, 2026 at 10:09 AM EDT, Jiayuan Chen wrote:
> When a BPF sock_ops program reads ctx->sk with dst_reg =3D=3D src_reg
> (e.g., r1 =3D *(u64 *)(r1 + offsetof(sk))), the SOCK_OPS_GET_SK() macro
> fails to zero the destination register in the is_fullsock =3D=3D 0 path.
>
> The macro saves/restores a temporary register and checks is_fullsock.
> When is_fullsock =3D=3D 0 (e.g., TCP_NEW_SYN_RECV state with a request_so=
ck),
> it should set dst_reg =3D 0 (NULL) so the verifier's PTR_TO_SOCKET_OR_NUL=
L
> type is correct at runtime. Instead, dst_reg retains the original ctx
> pointer, which passes subsequent NULL checks and can be used as a bogus
> socket pointer, leading to stack-out-of-bounds access in helpers like
> bpf_skc_to_tcp6_sock().
>
> Fix by:
>  - Changing JMP_A(1) to JMP_A(2) in the fullsock path to skip the
>    added instruction.
>  - Adding BPF_MOV64_IMM(si->dst_reg, 0) after the temp register
>    restore in the !fullsock path, placed after the restore because
>    dst_reg =3D=3D src_reg means we need src_reg intact to read ctx->temp.
>
> Fixes: 84f44df664e9 ("bpf: sock_ops sk access may stomp registers when ds=
t_reg =3D src_reg")
> Reported-by: Quan Sun <2022090917019@std.uestc.edu.cn>
> Reported-by: Yinhao Hu <dddddd@hust.edu.cn>
> Reported-by: Kaiyan Mei <M202472210@hust.edu.cn>
> Reported-by: Dongliang Mu <dzm91@hust.edu.cn>
> Closes: https://lore.kernel.org/bpf/6fe1243e-149b-4d3b-99c7-fcc9e2f75787@=
std.uestc.edu.cn/T/#u
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

This patch only seems to fix the problem when dst_reg =3D=3D src_reg.
Why is this not an issue when is_fullsock =3D=3D 0, but dst_reg !=3D src_re=
g?
In that case the dst_reg is unmodified by the whole macro but is still
marked as PTR_TO_SOCKET_OR_NULL. Isn't that a problem? Can you add
a test case for is_fullsock =3D=3D 0 but dst_reg !=3D src_reg in patch 2?

> ---
> Apologies for the Easter timing!
> ---
>  net/core/filter.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 78b548158fb05..8fee00e6adef4 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -10618,10 +10618,11 @@ static u32 sock_ops_convert_ctx_access(enum bpf=
_access_type type,
>  				      si->dst_reg, si->src_reg,		      \
>  				      offsetof(struct bpf_sock_ops_kern, sk));\
>  		if (si->dst_reg =3D=3D si->src_reg)	{			      \
> -			*insn++ =3D BPF_JMP_A(1);				      \
> +			*insn++ =3D BPF_JMP_A(2);				      \
>  			*insn++ =3D BPF_LDX_MEM(BPF_DW, reg, si->src_reg,	      \
>  				      offsetof(struct bpf_sock_ops_kern,      \
>  				      temp));				      \
> +			*insn++ =3D BPF_MOV64_IMM(si->dst_reg, 0);	      \
>  		}							      \
>  	} while (0)
> =20

