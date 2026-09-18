Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF91E3A9623
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737899; cv=none; b=sRorZCKbeT4WFn6Izs2zj+sMQde7DPyCZqcfESWQ3+BrhIwDhvAnODN7c8AajZfwHhLpa3bt/QvV5pqko3RGQedsEwVxXJjTgfxQNG6Q0jJS94zGEfhPOc69ZOOjtwDX5Oaf8U9avd9IY9zZ5OAOVZF8L7g7gp3aiL5di7evJ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737899; c=relaxed/simple;
	bh=j08kLBr3xPzFQpY9Bk6dEOdcrNQAdaJGEtq6MIlmTlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TPxw3EV3825xNeca9EFPyWCNyzKa2FxGPuWeNFbAncwTW4uCXIQO157Hs2PNIfhZi5gvd5KUiANpMnXx5BJCfYl54Ge7W40oL4Apa4q/Zg6lbYJTdTqTAeCTekpzYibqOTP3lPIEbs3ZGWwwVVIGsXbqFNpGkzQmLrJ0yshnq44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1WclP6f; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1WclP6f"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so5485685e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 06:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737896; x=1790342696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kf+10HssNT87nsY4bKZ9lpCEYsQF18ZFvlEmQbVyKw=;
        b=n1WclP6fgkEwf886GX4hbs6TkqSg/P/3zu5gzYSdDe5cO5V6t49QITBlTVw1qZBBcH
         q84ljTHhknmLZUhZEoAVoYw4M6SSpuW3XXOBv6vZySYQMo8dzTobCBmw8sfLClS4QmIh
         NbRUA9hdeygNILJwjAFtXrh0FF9tMuCMKNac71/Q/U9115vvdJcP5/piktPsjhx6g/hB
         KYNDAqXrNR961sMlaaUNiD1JPer4oFPjL04z9df4tsLfB6ExK9qkq1azK8LNJx/ct9bM
         W5vsqA3XSJ52gaHwh0JE3GzcLjuRJ+8ldAcwGzsaqL4F6OUB4JjpieAW6PtdEt1BI9WJ
         opzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737896; x=1790342696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9kf+10HssNT87nsY4bKZ9lpCEYsQF18ZFvlEmQbVyKw=;
        b=BnY+A8/leF1oMz1s77UrKZfWWhiu6ztvwfTc+lD7FT3uLMpgCk/3unLu2tK1yZ0Q2x
         qncMkEV4TZaroyUZSVKdthM+1F/7ZHvLQWxlmGytByYKIwA+A/8snKLEn9ntFDD+T+8u
         5jBOuF9kRl2aDMiws1abyFbY0cUDch6st1KkiD0KfOEr/VIgjY+tyHL7Dn/EtetTFdhV
         0vOjIP9MCoaBWiQEYCuMvoK/0XYQ36WW04+crMgoBm4SO7VPIdgX+BqZmKnSndFeIK4T
         MKNLgfjwrN7Swa1IOW8JJpZxjydabFmH+HxJbNuhL2qw8Q8YHXkD5MGzBnNnIcTjKw7K
         NVlA==
X-Forwarded-Encrypted: i=1; AKwUvByor8CbdIuyhX6+pz7pxHoNtVUEwUTe2Iq+NiIxaRgtYgbsNGOPMzPq7Hwzp0+u8mFBNtmB7R3j0udvlm5Hj+g=@vger.kernel.org
X-Gm-Message-State: AFuF++kGvs2SqMTGCirzWrGQXcy+c6zUB4B17R79P+NsTJd7wBlHkPz+
	/SLJWz+rvolZUhLkvMCZ0x/bFw46WM6MY1CIocYfUUJKGMKx6zt9cvCs
X-Gm-Gg: AYBFou2DvTJKsve+snEcZ1p588TufFqGpQDJvxSpHuNF+//jRLzBCV92LdS0h/mUrJV
	4UwnNN1VAimXOcNg1DAo9fNQWbHXwDaBdOqOUI0TrTbxVbIZD1wKAqNLTbWje+T6nNXNqdA1s2d
	rouBPSwjv8HkroWDXF0iwALKu6ljFxsZCFz5g1qs+pUml8qMJODVY6yElGBdl+uF7L5uNPSaNCg
	4uSzJj9DWGRP0tvnIaPSGYHpFucFR6r8K8oWs2yjOe/7ll79GBlHFooghgf+UmQGWMm4Kirv4UZ
	vT/rjpRAOy/YLwWJfSQPA97bwA/SQd1vvnZdUIfPOEn1En1jSoVmuCThH15yTiF2VGsYg7h39OI
	IF7GGZ8ZVgFSv13u3kDCbyu83iAk4+7gkfjT1XCL+8MlV82rkRKZXEYOmxxO4OlHcp7rQNiGzbk
	Tsy/3ODaEWj8Nb+fu6FBmUHaju6YKuHqMM4kN3NykAIIvwiTmE/hFnWGMeSkhGu2rEeaMNAFtL6
	bv8U4xUuzMDJaYaTUHixxWIT2Pal3W76xJA
X-Received: by 2002:a05:600c:1f8f:b0:49e:8354:26fb with SMTP id 5b1f17b1804b1-49fc574c729mr35243835e9.32.1789737895611;
        Fri, 18 Sep 2026 06:24:55 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:a888:e521:9904:1dbd? ([2620:10d:c092:500::6:24b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd204d89sm183969415e9.3.2026.09.18.06.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:24:55 -0700 (PDT)
Message-ID: <9c134c8d-6d50-451c-8336-4c7077b2cf44@gmail.com>
Date: Fri, 18 Sep 2026 14:24:54 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next] selftests/bpf: Clean up child when
 task_work__open() fails
To: Yun Lu <luyun_611@163.com>, andrii@kernel.org, eddyz87@gmail.com,
 ihor.solodrai@linux.dev, ast@kernel.org, daniel@iogearbox.net,
 memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260918024300.18321-1-luyun_611@163.com>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260918024300.18321-1-luyun_611@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/18/26 3:43 AM, Yun Lu wrote:
> From: Yun Lu <luyun@kylinos.cn>
> 
> task_work_run() forks a child that blocks reading a pipe until the
> parent wakes it. If task_work__open() fails afterwards, the parent
> returns without closing either pipe fd or waiting for the child.
> Because the parent retains the write end, the child remains blocked in
> read() until test_progs exits.
> 
> Route this failure through the common cleanup path. At this point
> cleanup is safe: pe_fd is -1, link is NULL, task_work__destroy() accepts
> NULL, and the pid > 0 branch closes the read end, wakes the child,
> closes the write end and waits for it.
> 
> This is the last early return after a successful fork. The fork failure
> path already closes both pipe fds after commit 5730dacb3f17
> ("selftests/bpf: Task_work selftest cleanup fixes").
> 
> Fixes: 39fd74dfd5d2 ("selftests/bpf: BPF task work scheduling tests")
> Signed-off-by: Yun Lu <luyun@kylinos.cn>
> 
> ---

Looks correct, thanks for the patch.
Acked-by: Mykyta Yatsenko <yatsenko@meta.com>

> Resent as a standalone patch against bpf-next as requested during
> review; the content is unchanged from patch 2/2 of the previous
> series.
> 
>  tools/testing/selftests/bpf/prog_tests/test_task_work.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/test_task_work.c b/tools/testing/selftests/bpf/prog_tests/test_task_work.c
> index 774b31a5f6ca..fe0cb1702eaa 100644
> --- a/tools/testing/selftests/bpf/prog_tests/test_task_work.c
> +++ b/tools/testing/selftests/bpf/prog_tests/test_task_work.c
> @@ -85,7 +85,7 @@ static void task_work_run(const char *prog_name, const char *map_name)
>  
>  	skel = task_work__open();
>  	if (!ASSERT_OK_PTR(skel, "task_work__open"))
> -		return;
> +		goto cleanup;
>  
>  	bpf_object__for_each_program(prog, skel->obj) {
>  		bpf_program__set_autoload(prog, false);

