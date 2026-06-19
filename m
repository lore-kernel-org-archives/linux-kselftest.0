Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F5E33D511
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 19:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781897411; cv=none; b=B1Xb3jGP6D5hRZIsGfvUsSJPGvR3FDkiKL5ZLeFwII1dtiJRbGYV/KAUjMoUsdSQrv8C3woTY3o+GrvqFLqWpEslLq9cOXlO4CMBH8ohCwYoShJswlkkY6+Xoqoq92x215TDo/qODAnYrNwZE4I2eGAeHn2HaVHDpfHwrq+sWUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781897411; c=relaxed/simple;
	bh=Oh2ybLLGC9jnpxFv2cvrWqY59mjTNtmLCVMVU0nxLTA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WRNXtO8ie1EdwAx5dbphdegtyqFeW/xSdpjiaZS1DDOtvL8DtXJyIBuN/fghf7jIuG9LOva+5x5uqwo/5CNSSvgu2FmgF103IpJg6fYauLida8AdVlkP73Egd9alIa68FSodixbU7xOIow+lVBaFg9W0W81WP2FiEEF3dKWATTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IF5Oom64; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IF5Oom64"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so2412652a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 12:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781897409; x=1782502209; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7uOIAj81pDb7DXTvtaboe/dWyr0Wn96ZBecKWdg1P6Q=;
        b=IF5Oom6449vLnhIMgVWPw4Sr5Oh81jM7a9PwpYu6wYYunqkVz9heUGHhcr0VWahYtJ
         tzx5IPAKjMKnGkVssX3/4FDQbK7g3txsFEENFeZubKiNKnhpcwRVw0/PPEUec9khuwWi
         i6Da77lAVwHBTwfASrJ21I1T2OVcZMp8f3wnb+JUGP6KHOjrWY2nSowv/YRt2Vs/V6E9
         y49McxBlxBZmuBc2N2EWb5jNzFXIbYMifVd3ER9PzgQUJEpkE6VNUdK7TzVshWBtLb8p
         4rDsdyqOiZcQ+O+fKwM9SuqwRJZ6NDlPuC8ZJy6PTVtCI9+AlM4Fm4Yu2OKOq1othuqy
         pERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781897409; x=1782502209;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7uOIAj81pDb7DXTvtaboe/dWyr0Wn96ZBecKWdg1P6Q=;
        b=MlzypebI9EeBL6sKeFeo3zRRyUhwDBWL6BoHjc3A3EwidPD/+LQNF4Ww2QYTJMLDSa
         3KPJKfMP0O/x/c06QHyDmDd141HFWQy8A5anK+gjUh2PyOkx6V2MxJ/JVYhxV1Euh2Q9
         PzVsJH/UmrF8Baf6rVUI1NIw68xP20vs1Wf8L68jItb22Tt8LJ/2V+FgY4yfkAIyWtoQ
         FKvpn/dGACjA2+2vCpfHXhAD2Ev3i+nBhOf/M8fJsbxISezBPooPw8tzzA49GOo1w/xP
         eZ/2VpZm5V0aoNl/Adm2L0ggUW59S+G3dTyqiay9E0hIEwBYYnpi440KCa8OBOQV8FQ9
         zapQ==
X-Forwarded-Encrypted: i=1; AFNElJ864b8pMKhFJIQgLgEuH8h3F6IQ/ATYiDeJ2Z7h1tCXe56HdZbmFUNciyitryE0lvllXlde1noHLpKVCbnXg1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUGhTWlWfYAyLPL5eAk1VLavj6W/IuW5UVZ5HzvGeSD+UNB27R
	WDYI+F3K+vJEWR5PsJcgoJkfct+psMxIz+K2Ffkn6pCfwJPmHTNqHCsi
X-Gm-Gg: AfdE7clEdzCGenc3dRlf37KpkSQphlHxarcO0XS5qetH9tXVg+sEBHRWtO4h0X6SKIR
	iG9pSmF0pbgeiekUjfxoqHJN4cW1tbjFY6Cfciqxw/BRieewwiDlSzsBNU3y9dZhU+GK2obp4i0
	z9xgo0HfDB5xsB3Mkx4mweUKjBH0JJknwtb5qkrXxPbFgoWqvXQ7hifFJ7nap+5JGQU69RA3u0E
	i5UYEJklEIt8ucZMGVFW/jJeqIx+x5PeKSW8+GVvdb94JuiOUpIo527w9p9IBclrVujKtxj7w9R
	O3bGGAcJpHj09DZ3NxgPF5f3wMklvHbs5j+N6bfJxSj7gXogz0o3mO8GD7fX6GbaT0kFOev3hDK
	RXxJGE1iq2NPfebp9mydP1V07f9479iXy6U3gGC3CnePIz7djEz7+OEQ7x1hYCy3MpULVtRX2Cf
	U2ybONn90n3I4sX3fe4scZmW5PWuIkzFuHNzjsX5YakQ==
X-Received: by 2002:a17:90b:2709:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-37d15e51976mr5755105a91.12.1781897409221;
        Fri, 19 Jun 2026 12:30:09 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1558c6cfsm3705447a91.8.2026.06.19.12.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 12:30:08 -0700 (PDT)
Message-ID: <a180a5f633b3555630d9a9d2bef2573852918112.camel@gmail.com>
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Cover refcount acquire node
 offsets
From: Eduard Zingerman <eddyz87@gmail.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, Alexei Starovoitov
	 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	 <andrii@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, Viktor Malik	
 <vmalik@redhat.com>, Leon Hwang <leon.hwang@linux.dev>, Dave Marchevsky	
 <davemarchevsky@fb.com>, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2026 12:30:05 -0700
In-Reply-To: <264dd4a10d3abdd037e01ccc6da44e5a5758dee2.1781852308.git.chenyy23@mails.tsinghua.edu.cn>
References: <cover.1781852308.git.chenyy23@mails.tsinghua.edu.cn>
	 <264dd4a10d3abdd037e01ccc6da44e5a5758dee2.1781852308.git.chenyy23@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-06-19 at 07:59 +0000, Yiyang Chen wrote:

[...]

> diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr.c b/tools/=
testing/selftests/bpf/progs/refcounted_kptr.c
> index 61906f480..7955a9973 100644
> --- a/tools/testing/selftests/bpf/progs/refcounted_kptr.c
> +++ b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
> @@ -741,6 +741,39 @@ int list_push_back_uninit_head(void *ctx)
>  	return ret;
>  }
> =20
> +SEC("tc")
> +__description("refcount_acquire_list_pop_container: acquire normalized l=
ist pop")
> +__success __retval(0)
> +int refcount_acquire_list_pop_container(void *ctx)
> +{
> +	struct node_data *node, *base, *ref;
> +	struct bpf_list_node *list_node;
> +	long err;
> +
> +	node =3D bpf_obj_new(typeof(*node));
> +	if (!node)
> +		return -1;
> +
> +	bpf_spin_lock(&lock);
> +	err =3D bpf_list_push_front(&head, &node->l);
> +	if (err) {
> +		bpf_spin_unlock(&lock);
> +		bpf_obj_drop(node);
> +		return -2;
> +	}
> +
> +	list_node =3D bpf_list_pop_front(&head);
> +	bpf_spin_unlock(&lock);
> +	if (!list_node)
> +		return -3;
> +
> +	base =3D container_of(list_node, struct node_data, l);
> +	ref =3D bpf_refcount_acquire(base);
> +	bpf_obj_drop(ref);
> +	bpf_obj_drop(base);
> +	return 0;
> +}
> +

Why do you think the positive test case is necessary?

[...]
