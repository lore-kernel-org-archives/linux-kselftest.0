Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27D93F39DF
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434363; cv=none; b=Mvjm0kNucvSC+vZc6wbRoBmEybCrdaDqmDCH09XfKETgLtsFm4T5Zh6q9BVhs5BlADFJNoDBhoPoxA1/iDP2HW54vc7hVpgSPWclHlaRT2S1gNl4nB6XLfr0D7qLq2lQ6AakVoDGWm+i8fqxUvZVm5YCjbkr0pjY4V6nOUzUZqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434363; c=relaxed/simple;
	bh=xGf+twjfwFTEdiC1e/+J+01uu+OuSW6e7ZPWRm+BAG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MtBGht0lIz9jeIeaQoLCnMYgj/l02fWRK99RFtkVpMkrBJYDMJazYO80dOvYUDo4AkmGnGdpP1Tt28qYV2rH3C5wpn6S25ST4x75CJsY1gvesfNqb0ZpGdlmIRq4xE+I4hy2W/mRVSjzn0y5qFxvFtXc3XSUuHlXUlUVv2tjqOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxm5kR8G; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxm5kR8G"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cca24023edso30934045ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 07:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783434360; x=1784039160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0Xej5JFnQ1aHA2JgsyhmNNKCDzVPH/sjRZ+7VR4tcg=;
        b=bxm5kR8GItLnMBss/rV+9Q3amL7Zx+1l3EaEHjFqsdZsHHPoOgM/9YXKU26bW+Ixvu
         vxIJQ+zFSvkN6PQupcgh8QkiWZ2iwVQkvYD8+vYTiG3/N0OZJw2dTgLPP4oNSc2OEllI
         QtsTGxZqMiJ6lNSNf6cHkJefhD97YTKBXvDMXeB/daw5tuG2GM0NPWtzIOaRcy5zB1g8
         PhqKlwNV4N6JBCgtYT9UiQfvAjz9952xspuHVQbvhe2GE00A1Bj+FCCDzhVTaLgRoynB
         r9xrose5QUgsECELUjhJH8kyJG33vFZLDF6VlF9qAvJu8HnkzUnjJndc+uvzDVGsmiL2
         MekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783434360; x=1784039160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0Xej5JFnQ1aHA2JgsyhmNNKCDzVPH/sjRZ+7VR4tcg=;
        b=TQfwIF6rsJYlv9Hjf8TxIRDUAsmCIM5sg+svyNiXrFN+tUYdte0wqpVNtF1rn0E9la
         ZXjUhLp2TZSP2evIX6zsc9DNXc8bN3P/HGUq5/ce8Pj1cgQNsYbLOObagSTr4VP257nb
         M/+qocJtUZiaIdZXdca4Njzl3gzl5fx2cGCc8ZL1FHlPjsFTebUnzSiV510bz6NV5hoK
         2CeNvM0fsEJD+CJ22inEZ/bY8alnQWFgr/QbcrQz3KsqOYoSCrkqIE4XL+JQw8hBN6+q
         1KaKwnDsZouiEoR+nDSUhnyElgvRf1+xuZQ8paSw92wMJT9FzB5IYjBBEnCcPK9wgvWc
         GwUg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7l38xKMFlcCWoxSfJ49BASkyxWcbeg/plcqSHaxqyfWnxb6wNhn4gINZXOD58ar/KapJCYBEXzXMoiJu5mh8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2fVBDp9vFAk9ZyOCr729TjZuQ5MKkDncJPc2FXCBfM4Sve70a
	O/j7YpOtYoQSsDzTAGeOog0z6LsWe3zZFMpcVt+OerKH3MuLQcUhtMb5
X-Gm-Gg: AfdE7cntEZXo5IpTbr2fpqfzly0e1t6Pcu1c17fxm08seXWaA90D8kf+g8FSB4Z6+eZ
	7GYELzHvgLR1VVAhcDiIcJZtxOaD2YayWETKQxMVwLUZd2jE1ko2kawaEi9lWBRhCgHtLI39Gvv
	jmd/dUujHRMmcSD9rRPqOeSEodXAIqZxz3HWXaXtpTTbaBqnKJemYmxAmODxnFJaPdxbHp34t22
	+dQoJAP3tPB4Joh8r9EhGhp4ei/W+XwzyANyCcVpYoLgTbMfVeM7FfOULG7hbvvcYPRULwk5Pga
	JQhsLGg5eay0cHxujjPajR7FnfYmmnGv3xAai649pI7qCyXaW4W37lRn5KoZKyux7NREB4TruI0
	x1JsbnIBztg4piLLIpg0GxM9EIkbe86iAYFQ+UEJFFRuVLnJWOw9scaUozgC7iKJyEXD+vt90nV
	qzDQlOuqeVeA==
X-Received: by 2002:a17:902:d58a:b0:2c9:d55d:2d3 with SMTP id d9443c01a7336-2ccbe615a18mr54950605ad.15.1783434359661;
        Tue, 07 Jul 2026 07:25:59 -0700 (PDT)
Received: from john-p8 ([98.97.43.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9a3sm13105655ad.13.2026.07.07.07.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:25:58 -0700 (PDT)
Date: Tue, 7 Jul 2026 07:25:56 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: Feng Yang <yangfeng59949@163.com>
Cc: andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org, 
	daniel@iogearbox.net, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix memory leak in msg_alloc_iov
Message-ID: <ak0MRJD7nsf9BaWM@john-p8>
References: <20260707081434.539327-1-yangfeng59949@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260707081434.539327-1-yangfeng59949@163.com>

On Tue, Jul 07, 2026 at 04:14:34PM +0800, Feng Yang wrote:
>From: Feng Yang <yangfeng@kylinos.cn>
>
>In the msg_alloc_iov function, the iov pointer is only assigned to
>msg->msg_iov after all memory allocations complete successfully.
>Therefore, when a calloc failure triggers the unwind_iov cleanup branch,
>we should use the local variable iov instead of msg->msg_iov.
>
>Fixes: 753fb2ee0934 ("bpf: sockmap, add msg_peek tests to test_sockmap")
>Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
>---
> tools/testing/selftests/bpf/test_sockmap.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/selftests/bpf/test_sockmap.c
>index 3e6be455d158..aaf2050e8845 100644
>--- a/tools/testing/selftests/bpf/test_sockmap.c
>+++ b/tools/testing/selftests/bpf/test_sockmap.c
>@@ -435,7 +435,7 @@ static int msg_alloc_iov(struct msghdr *msg,
> 	return 0;
> unwind_iov:
> 	for (i--; i >= 0 ; i--)
>-		free(msg->msg_iov[i].iov_base);
>+		free(iov[i].iov_base);
> 	free(iov);
> 	return -ENOMEM;

Thanks,

Reviewed-by: John Fastabend <john.fastabend@gmail.com>
