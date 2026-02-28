Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80178317158
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 21:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772315421; cv=none; b=hBMPFSfRNqZM3Hjv7Z3PVwbLA74ky4cebiiRyq4htbglT4p7XyfgILWvhMQZq6ELS6+wHLL86bQUdfv55v/i+SMkQ1vYCxvd2Q0c1N+DBBUQ106MMFNsTMr6Y+vdwvQa0CqnV4IRC5xb2ry4o1Qs3T3l/UQvUORF6Y3Ds1+0K3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772315421; c=relaxed/simple;
	bh=jmfwJKfAR1jtQZJ+9zA6M6A9IQhwuA9QpgAiwX12Wu8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=EIdnvCw1t20JWJYz5UQAt7nqpITYDCX93fWEZLTsG6WoP/wxmbVMK8d7obLL4FRhWQjJsn5KfGfvwQS8e4HNB7XzPFbGuBFyuY79AQQvAXUQs7DtYaTKXvFwiIdaLKWx4zmw+QllIy4wbKeh7PN1n/Lgao/Z9ZsXhkr1QXA+6Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b=LM+oo9rT; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b="LM+oo9rT"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-506a67282a0so33295961cf.0
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 13:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20230601.gappssmtp.com; s=20230601; t=1772315419; x=1772920219; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+f8XonCm5/3C5EterxMhivO6MSQ1rxOv28So/EOBLI=;
        b=LM+oo9rTgYwhOb46TcQS6IEmiF4HjyjrIeBK/6apJedTXFWNZlbdAGF7RIwt22Ic/p
         5HHEfnGLRuiEZXjmnS7+Qg4DloYzh+KzDRiM97yW1yRbuGrbb6Mc/JDfUIsPW10MwzAg
         WbqVz0lB8FqzYVhXbMC3ddgX3xhG/WZhJlZFx0dYM8SJHBVYdvnyoo7FaOHkT116+ooP
         PS4ujBnJMG+8eOFYQYTJJ12v8s8KYgL5Z7yVqDIuFdqT7YVJkvEx+XR+21Dy+idPiqJ4
         e1fR/vlviuJYXbfjeJL1N+VktYZ3joUfrZx4LQlBOpnFV88Dntme63dqQ+NEVUAtRY86
         hsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772315419; x=1772920219;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+f8XonCm5/3C5EterxMhivO6MSQ1rxOv28So/EOBLI=;
        b=pK5JF2fJC/ARe4JKhUT1rfLF2il7F2c2qUdfBokMPeUu78Z/6l+0mDWB5WT1lQ8tql
         zSkBm3Y8/mPPVKYZpwGMeEDyUABruWH+b1MRYNTNPNnIX4LLZrfSJYm42nv7ZP3wzUAB
         Y+z+jOWc7QGEZ7oP7H+pA6eTEiDf/oVDkdibeVSORpQLQMCCMGQ+CW3HMBX9NbX0E0k+
         BQfEz+E1Hh0athXXDVby/HEO5KB6WzAy40cFWg/bjgB90sEcCV1wRThIezuhWlSQ0qNG
         RF0T/e4Lf35wm9mJNOlbBB64FQry9baFgc9XUMbhIbEPYTE5H4KV/I1kNM0RP7tF/Qdz
         AcaA==
X-Forwarded-Encrypted: i=1; AJvYcCW9TZb4VZdSqMGKOWVUl2V5OUf+5TZtAPWEDfsbCvQ71XTnGROfow87KKzDk1KkfrPezw3o5sTsW+etI6VUcCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlPYxxgobpEpV4HbJ3YWfz/RQ6KEPs1s8Ovw2ZA+hVJaRY19ly
	+Fmpk+HJaem/muPvoCJ7Q3RiLFyhBLQftXgVISeFE8ktokGMF0Og5HY2fU9FScdJUYE=
X-Gm-Gg: ATEYQzwir5iAhZNMFSViW7nd7BThaiqy6QL/wEsaAeyW2eZ3lOzhAJKQPZr5ebCTu0J
	FimNIXuEnMGq3WVoDmyd3wlttCkaN4F8KX4hyMDGfJvKgj+9P02AvCsjrwMqJ2Wb1uFuTWDifEF
	U6h0kUrNLJNyVTGEBIAJxcWWsdYa/RuZutV91AfpIKMAKTKRMLPUTrd4e9Eyk/FyfzcUvNsY6IN
	FxNgOSZi+5MppE/zcr+NCHnP59WqDTjr1xstp7Pqy9W/UvSr479new2Z1T2WBMnJrOUQKJLUYBp
	tvr61Z97g9nJiMY3kAT9isOWMNZ/iNp+hM4wfi4RZt30wjp/VJB4Ir8csAbZX3HPiQjUgq4DzDq
	jwSI3/rbIzlSI61SVan4XCHjEMp8w9O4/WB1omewI57Fqe+qh38uWZrqOP3F5bR3z6JyS68v2Ge
	q7nHM9f3A3iPt0OVKtJtOTk2U=
X-Received: by 2002:a05:622a:213:b0:4ee:17e9:999d with SMTP id d75a77b69052e-5075291190dmr102299771cf.34.1772315419311;
        Sat, 28 Feb 2026 13:50:19 -0800 (PST)
Received: from localhost ([140.174.219.137])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507451cda0asm81287321cf.24.2026.02.28.13.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 13:50:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 16:50:14 -0500
Message-Id: <DGQXDPH0QC4V.1LVX4WKVY8DWV@etsalapatis.com>
Subject: Re: [PATCH bpf-next v3 3/3] selftests/bpf: Check
 bpf_mem_cgroup_page_state return value
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
Cc: "Hui Zhu" <zhuhui@kylinos.cn>
X-Mailer: aerc 0.20.1
References: <cover.1772261955.git.zhuhui@kylinos.cn>
 <fac266012001b88e2bd6e33578090627b919fd70.1772261955.git.zhuhui@kylinos.cn>
In-Reply-To: <fac266012001b88e2bd6e33578090627b919fd70.1772261955.git.zhuhui@kylinos.cn>

On Sat Feb 28, 2026 at 2:11 AM EST, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> When back-porting test_progs to different kernel versions, I encountered
> an issue where the test_cgroup_iter_memcg test would falsely pass even
> when bpf_mem_cgroup_page_state() failed.
>
> This patch adds explicit checks to ensure bpf_mem_cgroup_page_state()
> doesn't return -1 before validating the actual statistics values.
>
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>

I'm a bit confused, what is the exact scenario where we read -1 for
these stats? AFAICT bpf_mem_cgroup_page_state has to return -1 for them,
and it turn this is possible if the idx we're passing is not valid - but
the ones we do always should be.=20

> ---
>  .../selftests/bpf/prog_tests/cgroup_iter_memcg.c       | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_iter_memcg.c b=
/tools/testing/selftests/bpf/prog_tests/cgroup_iter_memcg.c
> index 88fc3e83d2b7..9eadfbd3fdb9 100644
> --- a/tools/testing/selftests/bpf/prog_tests/cgroup_iter_memcg.c
> +++ b/tools/testing/selftests/bpf/prog_tests/cgroup_iter_memcg.c
> @@ -53,6 +53,8 @@ static void test_anon(struct bpf_link *link, struct mem=
cg_query *memcg_query)
>  	if (!ASSERT_OK(read_stats(link), "read stats"))
>  		goto cleanup;
> =20
> +	ASSERT_NEQ(memcg_query->nr_anon_mapped, (unsigned long)-1,
> +		  "bpf_mem_cgroup_page_state NR_ANON_MAPPED");
>  	ASSERT_GT(memcg_query->nr_anon_mapped, 0, "final anon mapped val");
> =20
>  cleanup:
> @@ -88,6 +90,10 @@ static void test_file(struct bpf_link *link, struct me=
mcg_query *memcg_query)
>  	if (!ASSERT_OK(read_stats(link), "read stats"))
>  		goto cleanup_map;
> =20
> +	ASSERT_NEQ(memcg_query->nr_file_pages, (unsigned long)-1,
> +		  "bpf_mem_cgroup_page_state NR_FILE_PAGES");
> +	ASSERT_NEQ(memcg_query->nr_file_mapped, (unsigned long)-1,
> +		  "bpf_mem_cgroup_page_state NR_FILE_MAPPED");
>  	ASSERT_GT(memcg_query->nr_file_pages, 0, "final file value");
>  	ASSERT_GT(memcg_query->nr_file_mapped, 0, "final file mapped value");
> =20
> @@ -119,6 +125,8 @@ static void test_shmem(struct bpf_link *link, struct =
memcg_query *memcg_query)
>  	if (!ASSERT_OK(read_stats(link), "read stats"))
>  		goto cleanup;
> =20
> +	ASSERT_NEQ(memcg_query->nr_shmem, (unsigned long)-1,
> +		  "bpf_mem_cgroup_page_state NR_SHMEM");
>  	ASSERT_GT(memcg_query->nr_shmem, 0, "final shmem value");
> =20
>  cleanup:
> @@ -144,6 +152,8 @@ static void test_pgfault(struct bpf_link *link, struc=
t memcg_query *memcg_query)
>  	if (!ASSERT_OK(read_stats(link), "read stats"))
>  		goto cleanup;
> =20
> +	ASSERT_NEQ(memcg_query->pgfault, (unsigned long)-1,
> +		  "bpf_mem_cgroup_vm_events PGFAULT");
>  	ASSERT_GT(memcg_query->pgfault, 0, "final pgfault val");
> =20
>  cleanup:

