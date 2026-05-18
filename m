Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABAD48BD2F
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 16:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122634; cv=none; b=VS/wRtYnwRZlu/lchfgjWhkw9feCGIj/1+c5yIjwSnDOPqnDFGingg+HzdWmedhA0ixxoI+w6y7sfLYmzp7doGWU9cbaWHoYl8ChjfTBGP3HbkJe4AfRwkH9DxC8Gw3VkEuAVHsx4yb2THYXRqeNXgpQ3fyfyBt5jQsbKCyuThg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122634; c=relaxed/simple;
	bh=BpUI463qOnTFoISKFwnX5ZskGYYCjuOqBstCVOJYwzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlS+7WEYSq7VB/Pz7Do7RWFW017ijxSXnG8fzetgDSgwalL1HzN9SeBPyMNv5/zht0ij6Xf3U5Em4pxDN2G5ArQepQh7KVsQuX+WRCodr6is65ybYS8TrlAbhCA0aL1giYyuDZjsjVuKdWjo5Q7Pw3iIbke1YzJOh6XpvuxGvAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tL8Qus3F; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tL8Qus3F"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so27842365e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 09:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779122631; x=1779727431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nSt4x+poU4p8LXWInMRteFG4LHeESzIi5up8Mh8FuBw=;
        b=tL8Qus3F4zRUUEGV3qGi6geTpbWwiLc8IvlQAXmMSYPz2bJo67wbRasQux7hs12qIq
         ABmyKdA65WCX5fnURIFo2bBmWdmKcnH4m/o1DqnStNEh/kU6bNdLHuFJR/pOrFvABqwS
         i/2v1zd/Y0xEtRuFdjILbJmQ+Zc7n/TRjwhUKm1m2O+y3fu+WkOuUcnsVXci8LUUu0jM
         StcAG8kOznCaV3BS9GTEr27aCZMkfIppstjtBdEXyMHzMZFtSIDiQHKaF8oyWdTeVWrG
         t/M4uTSVTrlWA2D4CVy3s8t5lXat2kx1Dm+ddWDNcpHWRTC+gswyTYsYuQIOXKfzcARD
         boUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779122631; x=1779727431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSt4x+poU4p8LXWInMRteFG4LHeESzIi5up8Mh8FuBw=;
        b=IVaZmUFDC6t1Q4WolyUD86ElYCboVs2w6+kgC612G4Cl2OKmOZpygTGAIKlQ7D+x/6
         +P1M6Aq2cg5WjDFt6V70ubKmQdoC1ZfawxyXkbXqA6ghyxBQOps9vJJcGf4NpOhs6zmX
         n0rHaizrwOPvDrDXaxkcLxY1kwGQioptIVwsNNkV5EaTVFmGssqpawRDE0svNnSIFcCp
         j2lyHuT8+j62ONu9KAbP05P9Al/U3ih4aBrbk9+LknEK7/zW01xcA+weOjY3bdteTgNf
         prKsDGmDvN27Y3pa3vLYXN7It9yz11wyXF3zBBYDt06bLiDjJgPA34PXHJgMrBAv0WyG
         /OEA==
X-Forwarded-Encrypted: i=1; AFNElJ/tsFTO0qSpd2dpEDarbpG2RRGfBlkVo9uOMHyt1phw8etBwGg5Oig0OZx15gN+JRxpqUiLdHshL7cYrR+0YC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVT5kD7HvZAMSJOs9FFk542jnjc77PH3zz6/VodVXlAimMdKXA
	Vnj8CoUaSNEBk+axyvAenx+LRkOMvs8K/OcA1QaI7WOegYXU2ZzZQ/ZG
X-Gm-Gg: Acq92OFpBceXik98qeVBGcDMxYcMsaFexf6uHkqbS1F8z5p8/jbBxo2jQFLa+Li/p9G
	J9ofy92VTsEmmSz5x9n03hhhJPoQt6hfXrGLckPY9GhQ+2LZb7f2H5gxne2YLLrz8ia3BwgGA+b
	dK6BKYjY5t4imSvDDQ3pfALuKEa/5s8+wq6JqcxPJMIlhHWCtEsLfJNhhhRTFIaUZXaHh6Bx/8L
	1sXFVxH35h9eyAmhDYRlajEeWGiVevQcdtzDXdQkFauaoRMs1vYMTm3IFYVJrK97jUbO76nnfuP
	1RliBayYISQKBf0IBYX4Xl1Ug2R2tj4xdbdV8qKPBZOo/tgKNOGIDpQRO/U6rRTmrOwLP8/vRIX
	YLxg3xmC0b7DVbw24w/vx+MrFY7sb3PJIKwFIJ8uJlm8YN+jxncEqIrrdvKLAOgxTiEVb1HymxH
	UHuXq0AkDdQ65a4wL906B72xmGa81gXUK4eYtB5WDKApfcAoXzgTryh9G1D/gOaSFqBkF8Sk0=
X-Received: by 2002:a05:600c:8b0d:b0:48f:e230:2a26 with SMTP id 5b1f17b1804b1-48fe6631679mr255364615e9.33.1779122631321;
        Mon, 18 May 2026 09:43:51 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:1178:9251:cb12:6150? ([2620:10d:c092:500::5:5e25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm272950585e9.0.2026.05.18.09.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 09:43:50 -0700 (PDT)
Message-ID: <261a47f4-a92b-4a61-86ca-c1de362be105@gmail.com>
Date: Mon, 18 May 2026 17:43:50 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/5] bpf: Fix concurrent regression in
 map_create()
To: Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
References: <20260518145446.6794-1-leon.hwang@linux.dev>
 <20260518145446.6794-3-leon.hwang@linux.dev>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260518145446.6794-3-leon.hwang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/18/26 3:54 PM, Leon Hwang wrote:
> Because there is time gap between bpf_map_new_fd() and close_fd(), a
> concurrent thread is able to close the new fd and opens a new, unrelated
> file with the exact same fd number. Thereafter, this close_fd() might
> inadvertently close the unrelated file.
> 
> To avoid such regression, drop close_fd() and override err when failed to
> create map and failed to finalize the log.
> 
> In other word, when succeed in creating map but fail to finalize log,
> users will get the map fd instead of the finalization error.
> 
> Fixes: 49f9b2b2a18c ("bpf: Add syscall common attributes support for map_create")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  kernel/bpf/syscall.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 83de8fb9b9aa..322865a88b3a 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -1647,11 +1647,18 @@ static int map_create(union bpf_attr *attr, bpfptr_t uattr, struct bpf_common_at
>  
>  	/* preserve original error even if log finalization is successful */
>  	ret = bpf_log_attr_finalize(&attr_log, log);
> -	if (ret) {
> -		if (err >= 0)
> -			close_fd(err);
> +	if (ret && err < 0)
> +		/*
> +		 * Failed to finalize the log.
> +		 * Should not close_fd(err) here. Since the bpf_map_new_fd()

nit: you can't close_fd(err) here, because err < 0? The comment overall appears to
explain why we are making this change right now, rather than why this works this way.

If map_crate() failed with error code and then log finalization failed, do we really
want to override error code? It sounds like map_create error is more important.

> +		 * has published the map fd, if a concurrent thread closes the
> +		 * fd, then opens new, unrelated file that receives the exact
> +		 * same fd number, close_fd(err) might inadvertently close the
> +		 * unrelated file.
> +		 * As a trade-off, override the err only when failed to finalize
> +		 * the log and failed to create map.
> +		 */
>  		err = ret;
> -	}
>  
>  	kfree(log);
>  	return err;

