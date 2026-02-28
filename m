Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0414227E1DC
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 21:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772314265; cv=none; b=JPZN1HoCz/MG5k7i4o8W17UtPOudfQ/62xwdJqnSE4hHnLbusWH6BSzdkPBFqYErVykFWdIA7silORV4GZb0KtK6wZQqqxbW97gG82CoiAxHReixUMh1gvv7VSMR9oCXsLRBUpFsd+S//2LPfPIAsaJ12Urq/QYlSNrSWppfd34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772314265; c=relaxed/simple;
	bh=MNqlDapXdiHzTEmeLLtwBromOwc12WuSih/Ud7CnCsU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ufqAalOP6aK+/lTUbH9Vc17jIXq8VdjhUWEgrv5qzPmzdQwM+7AkneD4b10tyeIF2dN6iP6sMU+q7GWyQb2f8w0UOOWrZkq0hXFO8rkJRs7h3+7lZ9AsZelc/6GrM2S13Nz07Ni8zvGN6yOSpdRzaZm0ZELci+/XC0iTHOq3PiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b=QJbhO3iJ; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b="QJbhO3iJ"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899d6b7b073so21466106d6.2
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 13:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20230601.gappssmtp.com; s=20230601; t=1772314263; x=1772919063; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XswkprWZKrLKuM/yjjoFLV+zgozxncFY35B5DZOsTz8=;
        b=QJbhO3iJva31rsYTY9kWFwenQh8gK0Jhl0SOG5Nt24HB2HuT2mOjSfu5syrVthdqbt
         VfIeHtxxij2AjEd9+QUdvd4KGdupv2hwEkc7QLw9OkV/X2QCQTDP6dQmaazpYcI+cJkA
         lC9i2uP0Usl99lODQD4xu5MoRbgxlSiSojVfX6hRnY82B/9a4YDBLaEVXLQJhCGiTssa
         Wv1lTMboHWw3uTsrfs+KmpdFr5k1RgxkcVgVwXyalK7NqV0hqLItT7nAXhgmTB0vguuH
         1Emps6NAOo8ae80vbQk/HBoYtKEJ9CTs6lnVVvDztj6CGAx938z/D2qsvDNSz1G/g7+b
         NsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772314263; x=1772919063;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XswkprWZKrLKuM/yjjoFLV+zgozxncFY35B5DZOsTz8=;
        b=ljYFoXmkXWiP29dC9Ujkst68ppZaanB72zFMgIjg6HmA7aRIo/LUNFAZFnMf7EZpbF
         wpgP7dIXmWDpDzeLsnnm9XaytyB+id1Nesnf+2Lbj4FmkpT2JG3djkBajNYimqpG9hFm
         iaS7iqeuKgIp+II5DecsT+GPVQ0QrXO4zOTfFO4faXKrawOuC4639uHKPgktZxYhlznE
         a1mEd6Oh30usikOVqPXyyQJUsxwEsQlBNMWyWiFqsWlTcCTEc1aN1PHd6Fxfy79Bt1WJ
         N0yvbClF5IjePdElN2lgS1nMlskEcQS4co9ddMj++X4MFlbCLZK74V3tzXEP5CZuhvuN
         nnuw==
X-Forwarded-Encrypted: i=1; AJvYcCX55uyPUw2PqA0daOqkfni4CmkS7ksmvpl4YXe6mIJWHJkubpc31JExN+C2zwIlJtrEgauFIN1lb99fMT/cwaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDha4OXs5PxHenzBB6GutePzYc1Qa8V6DSajlrHQJlWUv2yhDi
	rs+ax4+awPanDv6XA7kEUlFwqzGsVw37VnsV50dQUi0Or5GRUDJ+VFQ2AIkgyt4BfBQ=
X-Gm-Gg: ATEYQzwFBHony5PAWNaV934Ks6PztK9U7QH+yu+tJNEx4Z021waRv2kDyW1Sn6yiwx/
	5+U/85CR9ExX794WMLW9BjX6oecTm7mj40h23nQukK7eXVtvMqrKdLjbYWkD8KBFyPQvWVnbg/p
	cyQmH1wPntm/UhbQ2e1tFmJVFLxX4NeTegWkOMkCnZCzd3K4riE3iWIDt8F8A7kmZpDlbR8pdzy
	Kkh4jvjYMPU/FmII6ebdD3lu0VeAJxX5l3G4MBZKvAozWvZJOtjFmpuQS//Kwr7Qu9I3GsLpwv4
	CRes/kB6EK7X2d3fTiV8sBy8YVu6Y0DqDYAho0VJvJcjIoOfcoZqFc8QISSp4gYAj6Bx0KULzho
	ZYHG2PnGfjssWB816EXv6NLfUfMTpsnpXxB4ldL/iRDKZN4InY8P1KeCJ4zOvU1BQpZagfivKTO
	wil/jdr4etOrft2mI+DnRAS00=
X-Received: by 2002:a05:6214:ccc:b0:880:5bff:74b6 with SMTP id 6a1803df08f44-899d1d6ca5fmr106612076d6.7.1772314262776;
        Sat, 28 Feb 2026 13:31:02 -0800 (PST)
Received: from localhost ([140.174.219.137])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7158db9sm73834406d6.3.2026.02.28.13.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 13:31:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 16:31:00 -0500
Message-Id: <DGQWYZE6I292.1BN9TAIIVRK7T@etsalapatis.com>
Cc: "Hui Zhu" <zhuhui@kylinos.cn>
Subject: Re: [PATCH bpf-next v3 2/3] bpf: Use bpf_core_enum_value for stats
 in cgroup_iter_memcg
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Hui Zhu" <hui.zhu@linux.dev>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "John Fastabend"
 <john.fastabend@gmail.com>, "KP Singh" <kpsingh@kernel.org>, "Stanislav
 Fomichev" <sdf@fomichev.me>, "Hao Luo" <haoluo@google.com>, "Jiri Olsa"
 <jolsa@kernel.org>, "Shuah Khan" <shuah@kernel.org>, "JP Kobryn"
 <inwardvessel@gmail.com>, "Roman Gushchin" <roman.gushchin@linux.dev>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <cover.1772261955.git.zhuhui@kylinos.cn>
 <3a788ec239e9f9590897b43d21995e3a3532d916.1772261955.git.zhuhui@kylinos.cn>
In-Reply-To: <3a788ec239e9f9590897b43d21995e3a3532d916.1772261955.git.zhuhui@kylinos.cn>

On Sat Feb 28, 2026 at 2:11 AM EST, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> Replace hardcoded enum values with bpf_core_enum_value() calls in
> cgroup_iter_memcg test to improve portability across different
> kernel versions.
>
> The change adds runtime enum value resolution for:
> - node_stat_item: NR_ANON_MAPPED, NR_SHMEM, NR_FILE_PAGES,
>   NR_FILE_MAPPED
> - memcg_stat_item: MEMCG_KMEM
> - vm_event_item: PGFAULT
>
> This ensures the BPF program can adapt to enum value changes
> between kernel versions.
>
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>

Bot's comments aside:

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  .../selftests/bpf/progs/cgroup_iter_memcg.c     | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/progs/cgroup_iter_memcg.c b/tool=
s/testing/selftests/bpf/progs/cgroup_iter_memcg.c
> index 12f79a44133e..06a385c9d85b 100644
> --- a/tools/testing/selftests/bpf/progs/cgroup_iter_memcg.c
> +++ b/tools/testing/selftests/bpf/progs/cgroup_iter_memcg.c
> @@ -26,11 +26,18 @@ int cgroup_memcg_query(struct bpf_iter__cgroup *ctx)
> =20
>  	bpf_mem_cgroup_flush_stats(memcg);
> =20
> -	memcg_query.nr_anon_mapped =3D bpf_mem_cgroup_page_state(memcg, NR_ANON=
_MAPPED);
> -	memcg_query.nr_shmem =3D bpf_mem_cgroup_page_state(memcg, NR_SHMEM);
> -	memcg_query.nr_file_pages =3D bpf_mem_cgroup_page_state(memcg, NR_FILE_=
PAGES);
> -	memcg_query.nr_file_mapped =3D bpf_mem_cgroup_page_state(memcg, NR_FILE=
_MAPPED);
> -	memcg_query.pgfault =3D bpf_mem_cgroup_vm_events(memcg, PGFAULT);
> +	memcg_query.nr_anon_mapped =3D bpf_mem_cgroup_page_state(
> +		memcg,
> +		bpf_core_enum_value(enum node_stat_item, NR_ANON_MAPPED));
> +	memcg_query.nr_shmem =3D bpf_mem_cgroup_page_state(
> +		memcg, bpf_core_enum_value(enum node_stat_item, NR_SHMEM));
> +	memcg_query.nr_file_pages =3D bpf_mem_cgroup_page_state(
> +		memcg, bpf_core_enum_value(enum node_stat_item, NR_FILE_PAGES));
> +	memcg_query.nr_file_mapped =3D bpf_mem_cgroup_page_state(
> +		memcg,
> +		bpf_core_enum_value(enum node_stat_item, NR_FILE_MAPPED));
> +	memcg_query.pgfault =3D bpf_mem_cgroup_vm_events(
> +		memcg, bpf_core_enum_value(enum vm_event_item, PGFAULT));
> =20
>  	bpf_put_mem_cgroup(memcg);
> =20

