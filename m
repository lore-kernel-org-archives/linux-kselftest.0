Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4ED2D8771
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 10:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775730041; cv=none; b=C2QaUofR//lod8GgCl1WvfxuscH8criinqQAxo4wXKe3ddeI+koYsTyICpQDqQwKjQx19Lxynv0ESVq7x9rPzajTVkgmwSldXA5AlpWUK/GQDC6UrWawyQ3W+qN2kncJZo4urBcpIomkyvnYTGA5b/Y8Jba7jHHz2gssO4Jmqhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775730041; c=relaxed/simple;
	bh=0c0PQsJdNcOmI2FhdBKzTMX/zQ7RVd5vdDiZaKVwo9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IONwPToKLZX6Om4BVU5L4zHKSK3ctZkO/3KRd+i+Sh9wh30lWjFJYHEpGitEDOIQc3x39tx1UqXcv9rcgROits2Z/TIvBqvrb8RbK+BUOL47PxfCD5FO6Sdmxptbch1ZBoMKcuc7jpeSN4/Uj48Cmwz9znIS9pAHY1zcpA4nyJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IswKzoCI; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IswKzoCI"
Message-ID: <7967c952-3922-4b49-953b-530b80850aa8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775730027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+i0GpBq9saj+JeIlFazz0t2Q1VA7JT5SrQeKRubDaM=;
	b=IswKzoCILV1fwr+qS2zv8IVQrbnIK2KcNaEY/b/dLDG7B2VVU57vgg0jXStZ0ZbrvLks6q
	1uyR5Z9jd8A6SzlAwIKpC5QXEB48xECR4U39FrcVxhQZsLRDBv00JUf/R9z8dw3tzykYDn
	4CUmg5hg/fUYfrJpVTpcPecq6RRvJws=
Date: Thu, 9 Apr 2026 18:20:11 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] selftests/bpf: fix const qualifier in fexit_bpf2bpf test
To: Woojin Ji <random6.xyz@gmail.com>, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, shuah@kernel.org
References: <20260409091101.364091-1-random6.xyz@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20260409091101.364091-1-random6.xyz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 4/9/26 5:11 PM, Woojin Ji wrote:
> prog_name is an array of const char * strings, so strstr() returns a
> pointer into const data.
>
> Store the result in a const char * to avoid discarding the const
> qualifier.
>
> With GCC 15 this triggers -Werror=discarded-qualifiers and breaks
> the build of tools/testing/selftests/bpf.
>
> Signed-off-by: Woojin Ji <random6.xyz@gmail.com>
> ---
>   tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c b/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
> index f29fc789c14b..d8225da4c1af 100644
> --- a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
> +++ b/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
> @@ -111,7 +111,7 @@ static void test_fexit_bpf2bpf_common(const char *obj_file,
>   		struct bpf_link_info link_info;
>   		struct bpf_program *pos;
>   		const char *pos_sec_name;
> -		char *tgt_name;
> +		const char *tgt_name;
>   		__s32 btf_id;
>   
>   		tgt_name = strstr(prog_name[i], "/");

Already exist.

https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c?id=ca0f39a369c5f927c3d004e63a5a778b08a9df94

