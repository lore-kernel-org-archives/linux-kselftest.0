Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E99B420889
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 16:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353848; cv=none; b=T8lpuKeuGgVu9IZJWxy0+faDjdBzXryDuupUl324d4ududqw0+aS3ZO1mtbdIYtmTmmYAmsgFF+allhf+qBgboJ6UCdAtQjSbE5kp64Y4vaHD4n4lKQ6xPtpckEUTXUnlgMu/q3WMrtTIMxKCirBCpCHWhCc7F01pgacKzQc+tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353848; c=relaxed/simple;
	bh=gOErEcGC2rddUTWqAroj+qxDUTEbmHwrlR+WdCfcYSk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=IB/rD0lMlweWYg4zo3wk7bHV4S0y/Ro2uWGPNrgOQuaF5C8azanX07ow+x05R2uPy1z9MIByu4ItQpZ7/Mrzq039vBwL1tpbvYchesNzAJ/MUN6xPR8DNOvkni3shRICQMZiy+Pd9bfA3hZ4RJxrBbXdhI+P2Hpyhikg4mxnwqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=EqKUImWp; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="EqKUImWp"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso17347225ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 09:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1783353847; x=1783958647; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0bU/6iPyibPDENzeGgAeBM6ROU1FMgoMSU+p7ppEeK0=;
        b=EqKUImWpd7qAWF/mGZhlbsJPGct2LoccAxxLsLU82TLFkVtDQPVlWgo4Awg0Yi3kie
         AkRmUECcgKlDS78losqUmvieffuZS3qTS7Gxv+3yCBYmA1IYnvaO5oDqrZsm+9w2FVnd
         xRRhSiGZbs8xHv3SmUy+5ENjaz2Uz8vMnUj/qwwuczZFwlKZanN0W6T77/0XSIXHgAQG
         7GEzYOMQoKNzcvmdW/eJDJaS5/6mgxq7mqC7vk7ZpGNNufStDhV1ZiIfb8tCLqaH1FLk
         TaXMlyIRzDudeDRv5jQmWErUzAMnHUbTrZGK+d/s9I+PhMhHPWof1aGHwAV0uRwn1Nof
         7XQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353847; x=1783958647;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bU/6iPyibPDENzeGgAeBM6ROU1FMgoMSU+p7ppEeK0=;
        b=oXBAr16ZsV6PK5TkT5H1OK34zHEi/ixvnabjH6E9tAfSoGDtzsoaSdHiFxcrrK41fw
         aKBqsD544UX+6D77Ec6cHnAjTW+Tprzj+78qHa64OU84JpXrTq+RExnF96D1dOXlGS5n
         vsXp7DtQnxa0sNdQR8fpjsmE292695opJLHBZLt5bCkX8lzULpdIWXZaIqU2H3arLwy0
         cD1wjWWlvXQ6thsP7lPbVMPGADb3kXEPbEezZnNGLIDUW2YhMiT1Sj675Ey4VwRi7sO2
         X57hlNiNlL6QX6jnJbkEfslX/xo7/4ZrTaJaQFGyMDgRNYg6cbeCG6ELgJ4Cxd4F/3J0
         3ycQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrmd30MAe2a7VuT9XLHMG5XALsw+X1fTlUiCHeO+1Bt5SZ1zIxMZ1qoo6pWoE2a800Sv+DvbznY8nHX9Ssek8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcRzgn5jUvSz/kGSoAbzoCuoLikyUOv2U2PdYh7KkgeUGJAB+p
	Oh3JTO44LRPRddLQn/o2EoM6xTMxuDcwNSvyeZB1DRZ7m1ysifAr6qqES/wREnLZ8XY=
X-Gm-Gg: AfdE7ckf8/Q74m2meL852CoPJlC8laCKyTQpjcmNS+eEYQSGUMWkqet4TpmOgmiL/Zs
	W9sEjY/OFUHeV6WX05lZ6mFbsER3xuAr4stoCukPhWz1k5rJxD9nvCc9FpWRamLsB8wiGZFADYN
	89MJLtA/Hm+kDPop4CCL/enwO56B/wE9FWkWpVzZXTpgfQeTcxJO6KmPmcv6FlVZ37q4NcKYlbM
	W8/QXjfMOM3KMHp2sebrgWWQizoAlSuYEo+1O3v0Xs+gOvvMX5aIZmNzBqnc97iWGPB2ZBMw/ss
	ZWKTLWW5bS2udHQtCiBeDJqiVtKovNMgr+twwTcBwmlZCzmTkqC0W8qSZaxhW/+vEil3TgKI6ks
	DCHzUfb2We5cbuLvjJRXe5XO0cRsFwbxWPmdIz+dJbR6dXQKDsIodtXckEQ8AndinvcyOj7FA8m
	uKg7HvUOI1aAF22w==
X-Received: by 2002:a17:903:19cf:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2ccbe611af8mr13889635ad.16.1783353846456;
        Mon, 06 Jul 2026 09:04:06 -0700 (PDT)
Received: from localhost ([2605:8d80:5c40:4f71:1131:e194:34df:ee9e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad77651c2sm53854365ad.49.2026.07.06.09.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 12:04:04 -0400
Message-Id: <DJRM6DY3TW3X.1OJSVM8VW21B4@etsalapatis.com>
To: "Malaya Kumar Rout" <malayarout91@gmail.com>, <andrii@kernel.org>,
 <daniel@iogearbox.net>, <martin.lau@linux.dev>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah
 Khan" <shuah@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] selftests/bpf: Fix memory leak in msg_alloc_iov
 error path
From: "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <7f3e0f9992a32264f6c7cf00f2ef3ce87a0a6fbd6703084aff3de68cda77dc9c@mail.kernel.org> <20260704122936.102394-1-malayarout91@gmail.com>
In-Reply-To: <20260704122936.102394-1-malayarout91@gmail.com>

On Sat Jul 4, 2026 at 8:29 AM EDT, Malaya Kumar Rout wrote:
> In msg_alloc_iov(), when calloc() fails for an individual iov_base
> allocation, the error path frees all previously allocated iov_base
> entries but fails to free the iov array itself that was allocated
> with calloc() at the beginning of the function. This results in a
> memory leak of the iov array.
>
> Add free(iov) in the unwind_iov error path to ensure proper cleanup
> of all allocated memory.
>
> Fixes: 753fb2ee0934 ("bpf: sockmap, add msg_peek tests to test_sockmap")
> Signed-off-by: Malaya Kumar Rout <malayarout91@gmail.com>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  tools/testing/selftests/bpf/test_sockmap.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/s=
elftests/bpf/test_sockmap.c
> index ac814eb63edb..3e6be455d158 100644
> --- a/tools/testing/selftests/bpf/test_sockmap.c
> +++ b/tools/testing/selftests/bpf/test_sockmap.c
> @@ -436,6 +436,7 @@ static int msg_alloc_iov(struct msghdr *msg,
>  unwind_iov:
>  	for (i--; i >=3D 0 ; i--)
>  		free(msg->msg_iov[i].iov_base);
> +	free(iov);
>  	return -ENOMEM;
>  }
> =20

