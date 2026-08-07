Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDFD2D73A1
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110455; cv=none; b=MxfhFj0jn2Y3diXan+03TDYbnqFD1tA8MrUjULZofm+yVKHhalsBIGVsnwUqzWIVvJ4VI5OqkE2hPIlrcNZlWx2K6RNyJqlOIex7NQmED8GQ1yEKCbJ2Md5LaMR4ypj+CfYbaK2l/r4b5oNCBNSoBee5XyeMk+cCVtuBjhvvJbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110455; c=relaxed/simple;
	bh=W1pupXnpTk7wwday+gD8a+srd3D8lzsCozznjLqwFnM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=GGLqRQIVXFqTYc/Yaaq9NIzMZyHQKhgEUnHnhxyIWFG1x+b5HMVFintgQxgmd8uG+ou+jIWV+v2xis3bMekpECSQJ7hg8iYZ0i63G03/pWdT/bcae1jmq7Jd8Knb9EkGoOhEmu5gBI7wCI9N8cm6FqWdQnlwPRKua9JZint0mbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=kzTcVXXo; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="kzTcVXXo"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-448b89f700fso3256403fac.2
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 06:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786110450; x=1786715250;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gDf2rV7D4XQoD7s9C50TNcZm9PbK5+MhVPF5fHM32yA=;
        b=g480aUvfepZIdvyiTLCSRv9toG86FuxVOyK5/2WKhlWU9T+N9vvoSqBvX8zPfnpYGb
         Acjy9v6rU4SYsem+ufjWBIysEmLpsz9z9an0n5RmBBZ4n4YKK0TbARwKoMV4Qf2Gl0/1
         cb8TaP2NWUYhh3vTeUUn/1LemmjV7QsYgDyKvJC7AEo8JxSfmJUmuI7zbQDjTxqytlaW
         1nEMxMONq1MGLJFyRQOS41JSiSJf89EHLsCMit1eXvhHGFWRH4O0kU88BBXRaXQJEfTE
         iuXvxmeq1YBUcL/uacV8bXwSU2jIlr4CoKiCZRBdPQ0W4LAcfw/3WabvDKmg/JOPJ5rg
         OaqA==
X-Gm-Message-State: AOJu0YyFqsD5wn4+qHLlaHIpw1Kcn+kUTJH2L/DOvJBxOMIjC+Sgb0Q8
	56DkzN66twlSlaSVM7tv0KdVq6TqeDo6f4ofaMhgiFET48WSgI3xxk5Y
X-Gm-Gg: AR+sD13ZXhWjC/FIJcDdmhhJ2pG1U0vvTFHhvDTDOfRbRzguLseeO7wbXyK54Sbtbm6
	M+swSRmJJg7vATZZNN1LDJIPK2Dv4vdxd3ypL+WvIRgxfwAz8c4lLv8yzQYPUMKy+ow/GUy+Q4q
	5qIPHQX0xhsE1YNLt9ue3QnGY31CzPqD/LbKJ+6gbYE4IW4tQlZ/qTU9rA8BA3V+8eqQrSbq3k8
	DVI27dpUziG20THVOajoTUCUjjLie05GCAiJiK5T6lCkUGCHqkFJYbiVVdoiJQyVA9rodithAni
	TqpSSjVktaGZj+139muGKI7fZTIMpDEwq8ZhZzGftBIkfWUF/ZWAShBM4a6dsC1Q0FeUoprkUFD
	0d8kV2S9HpAHm6Iwjkt7lS0jxM3vCMrC/U4jgYqIjJDUvT7lLpfHGsqY/DSy9NeXuib1nvnuLf3
	kaHy8e5J0DxF1EIMPFXWWPzwgJ60OUkUOz1WQ2l88jw690Hq9hK9teYjTFkozkX2YDgkcidlBGD
	rA5ZJDlN8JRWa3j4lPPt5J6yeZ3/1NI6GSJzlIr/TGk5rGuqI10R+/loKQKmVnVQg==
X-Received: by 2002:a05:6871:283:b0:448:6ba8:be6f with SMTP id 586e51a60fabf-4599f0de084mr11777349fac.19.1786110449969;
        Fri, 07 Aug 2026 06:47:29 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1d793c9sm2056268fac.9.2026.08.07.06.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:47:28 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBBE6609E3;
	Fri,  7 Aug 2026 13:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1786110446;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gDf2rV7D4XQoD7s9C50TNcZm9PbK5+MhVPF5fHM32yA=;
	b=kzTcVXXouI5Z3F8+7dm7BNfaOQ96R3U6AqWW62G0pXZM/nMFnTh+SmcJc+vxhE8kvkqKDK
	ZxB7VQzT7Bcsz8GddXZh70SqK2sj36x06bIsHH6pGhOgqtBdX9my/lhfI6hwJnztVNJyiS
	I9EHoVznkiBa+QBGq672Y3m87bg3M2u4Shzwy1vYbHa4Eny0yZCC2Svs34hYVDZeQ+0DMz
	lni7U//WgvGeBEmtMNw5MJKkeuqGWW7kfbfpCgMVHUII5E3zPyaB/6WApK2pzQHJqWTy9/
	X5m+jkQ5Ww7xiUUYo7dKA+VuJ7A2/eYOtyDT3YnoAGSRw9rky4Nr/Lw0yd8Kzg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 10:47:23 -0300
Message-Id: <DKIRB6BD87CX.1L2B26RCKU0LS@marliere.net>
To: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>,
 "Shuah Khan" <shuah@kernel.org>, <sashal@kernel.org>,
 <gregkh@linuxfoundation.org>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Martin KaFai
 Lau" <martin.lau@linux.dev>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "Jiri Olsa" <jolsa@kernel.org>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
Subject: Re: [PATCH] selftests/bpf: Fail unbound UDP on sockmap update
Cc: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Michal Luczaj" <mhal@rbox.co>, "Kuniyuki
 Iwashima" <kuniyu@google.com>, "Jakub Sitnicki" <jakub@cloudflare.com>
X-Mailer: aerc 0.21.0-146-g87073a0460e3-dirty
References: <20260807-selftests-bpf-sockmap-v1-1-8c4936fa03cd@marliere.net>
In-Reply-To: <20260807-selftests-bpf-sockmap-v1-1-8c4936fa03cd@marliere.net>
X-Last-TLS-Session-Version: TLSv1.3

Ugh, sorry this is meant for 7.1.y

On Fri Aug 7, 2026 at 10:45 AM -03, Ricardo B. Marli=C3=A8re (SUSE) wrote:
> From: Michal Luczaj <mhal@rbox.co>
>
> [ Upstream commit 203b06932777b9ad5085319389dea566f5c2ca63 ]
>
> sockmap now rejects unbound UDP sockets. Adjust test_maps. While at it,
> check socket()'s return value.
>
> This effectively reverts commit c39aa2159974 ("bpf, selftests: Fix
> test_maps now that sockmap supports UDP").
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
> Link: https://lore.kernel.org/bpf/20260707-sockmap-lookup-udp-leak-v4-4-f=
878346f27ab@rbox.co
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> ---
> Signed-off-by: Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net>
> ---
> Hi, backporting commit 66efd3368ae1 ("bpf, sockmap: Reject unhashed UDP
> sockets on sockmap update") without this one broke the selftest in openSU=
SE
> CI:
>
> https://openqa.opensuse.org/tests/6147940/logfile?filename=3Dtest_maps.ta=
p.txt
> ---
>  tools/testing/selftests/bpf/test_maps.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/test_maps.c b/tools/testing/self=
tests/bpf/test_maps.c
> index ccc5acd55ff9..d194b44ff8be 100644
> --- a/tools/testing/selftests/bpf/test_maps.c
> +++ b/tools/testing/selftests/bpf/test_maps.c
> @@ -748,16 +748,15 @@ static void test_sockmap(unsigned int tasks, void *=
data)
>  		goto out_sockmap;
>  	}
> =20
> -	/* Test update with unsupported UDP socket */
> +	/* Test update with unsupported unbound UDP socket */
>  	udp =3D socket(AF_INET, SOCK_DGRAM, 0);
> -	i =3D 0;
> -	err =3D bpf_map_update_elem(fd, &i, &udp, BPF_ANY);
> -	if (err) {
> -		printf("Failed socket update SOCK_DGRAM '%i:%i'\n",
> -		       i, udp);
> +	CHECK(udp < 0, "socket(AF_INET, SOCK_DGRAM)", "errno:%d\n", errno);
> +	err =3D bpf_map_update_elem(fd, &(int){0}, &udp, BPF_ANY);
> +	close(udp);
> +	if (!err) {
> +		printf("Unexpectedly succeeded unbound UDP update '0:%i'\n", udp);
>  		goto out_sockmap;
>  	}
> -	close(udp);
> =20
>  	/* Test update without programs */
>  	for (i =3D 0; i < 6; i++) {
>
> ---
> base-commit: 74b69060ba6e44e20c2e4dc1847eca21db6e4a7c
> change-id: 20260807-selftests-bpf-sockmap-781db29c4f94
>
> Best regards,
> -- =20
> Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net>


