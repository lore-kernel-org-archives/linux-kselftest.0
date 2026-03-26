Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC77186E58
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 08:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513887; cv=none; b=fzQhIOqvr9lgJELOcglC+a3+4UDoJf47efxorIrJS5j1IH6HuCdRhGkRJIMjE8aQFGt0CJBjPr7UlIb4lsRyiyP/xEi0zF6+BHqQhdCfwhT3k/+SlQib5XLHwvJlWBLd6ZhWzR/sGsohKyNjfWLuGtJcTympIrkeS7/pj5AOom4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513887; c=relaxed/simple;
	bh=HJ8lCiF59X0g1//sdZdXalOYoEGKz2/r4hNn4E6PKa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efduJIYF+jv9xbt9MnpcbGUmzXMpnA39drrmW2uZJFZVqUYU2tPnlX5QFg0fQvr8mGVpouUcy3+7rm56+DTUoy694ubDRtU7GycN3DCZd/dB2tw7Znqwlvrl/wGm05Xh5hXMisCGwAHYKReWuNb4xcDEEylIZrGlRbuHEhzu/VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bKoW2Y77; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rCOnQ1Uq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bKoW2Y77";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rCOnQ1Uq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774513885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/luC6el/mw99mrk3zRpM9ICUlTK3AqWpNegZ4N5alNo=;
	b=bKoW2Y77sCrIqiqJFCL/s9j/iCuFMIOtnyA2e0X022413bh301Y+XfVJ8Ydesz8QAMnhdN
	9yy/Y5C0639rs7Jc0iaMvTjeW7fI8mnoJcTWrwb1caDDUrunjZWgLK7I4X06sevSLgZ37L
	9UdAtj84zGtLT89WcFtv1J395aiJz4k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-qgO_m9ISN-i3AVL1E4aXxg-1; Thu, 26 Mar 2026 04:31:23 -0400
X-MC-Unique: qgO_m9ISN-i3AVL1E4aXxg-1
X-Mimecast-MFC-AGG-ID: qgO_m9ISN-i3AVL1E4aXxg_1774513882
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-439c794edd9so754332f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 01:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774513882; x=1775118682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/luC6el/mw99mrk3zRpM9ICUlTK3AqWpNegZ4N5alNo=;
        b=rCOnQ1UqD76M2yuXwxls54PouHtM706OhyPTkP2AAYHunvHJwVUqktjE24/JZUHsZk
         azwI72dzaqoHXd89LvN65vosxo3QfoDt4bDV+k5VqneGK2NjLDLP/IRr3yDYIVYA4Mix
         hWMh1+6yFkV1vGmHb6QEnOfzusM5Uv8wIiJE3Us8DBAewBhy7lCnGOnL6wM1htghYez3
         SHGDyNHPkqQc/6UJEd7blmy3gN7H4F99Y4uadqWhNQTwrz9ordwEabwV6LOdG88k5lPE
         wBj35kTkIL1NOHSZ3V0zGtU1Pd9pj9LEBOQV6RfY4MtG3nEr7A4+C6qyI/1L0Ptp7lap
         OEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513882; x=1775118682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/luC6el/mw99mrk3zRpM9ICUlTK3AqWpNegZ4N5alNo=;
        b=EkJx8Kt+8n+H5G05GSF6Unc9GygIhvtv4uvzCd9/6rk3MLZM2O7SZLKhxpebLY+y7E
         +XboGecW4vCsQyfvKuNyBqxJppj5gWq/x7B3RL78NJ8OZY+xvPhkTUZUzAYl3P7NMIDJ
         ohkZ3jhuFPEk4ckSDtgOpzwaeq/W/gNzcwHnON7KflC1SR/ntuWO4MBVFHNXqCKScwZs
         xktNG5rQiy58Gwo5vjs8h55LpgRDWHwZuyBsJ7863apQUl4lZ+FBEuV5vS6NFROfbRgX
         zLFGNRHYTiX4rGkwRXkYfCdBtBsZtsmSSYwX4V+jTObw+EK8TlbAomPn/68FRdRJ8uhn
         UCzw==
X-Forwarded-Encrypted: i=1; AJvYcCVk0sTwFJJO2K9wzv8STB4gPyzL8dj/StXJGxcdqmEyhxbC/WgcQytMlIYL53yJNJNRGjx0mFNFZNGN5OZiCYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBFMLkNH4M8t8Xi3kgcbmQxl8LbQECsTOvb/yyzTmvJc5uL4n3
	iF9eAjrFMk/vhCnzeUqwuczQqz+VtsOCZyyKmOKV9l0YrNDI7Rey0tXSUfMBPJJva84hSqbBQu4
	s9t78HlqhKNgHcgyvldM3h5UtBpeTlSWQ6iWoL3EZ3Atf1Yw59pWt9HHInmW/VNQblyabEA==
X-Gm-Gg: ATEYQzzI9ELFqx6ufaX7eZbUbG2PxAXXgZ9BXB3TOlyn8UKCrntfMXQb1AK86LEQide
	gzTSh71l2dq88FDL90yuWIGznokF/dpWU52BkZXC6qcwZOiKcwI5mZrghLnYzWwHFUCCUQTkjzF
	ubILsuezUMfcvJbShdumbcKL5vw5+97HaIeGJCRbzixniCi3c/PDNqret3L8guYzSYdxrB+xRp+
	BkUBgqh3Ii01go+vaPdphE6mHDH9s9/DlGF90NX12Gu+EBuRe3mekUrC3pqIvB8UpNZsGAnbvYJ
	m1BWwUjOJAe4kvMZh+tnFRb23qN0KiXldleDkremUOTkitlBOVdonRIL7UV/AfFp4gNVKNmXOou
	Tp8ss5EqFNjU2j0QnvdLUFsRZ1TRdy2Gbevlt/AtXQEec8rsXSb6KWPNh
X-Received: by 2002:adf:e84b:0:b0:43b:9416:1aeb with SMTP id ffacd0b85a97d-43b94161bb6mr2274266f8f.45.1774513882223;
        Thu, 26 Mar 2026 01:31:22 -0700 (PDT)
X-Received: by 2002:adf:e84b:0:b0:43b:9416:1aeb with SMTP id ffacd0b85a97d-43b94161bb6mr2274211f8f.45.1774513881704;
        Thu, 26 Mar 2026 01:31:21 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df6d4sm6006940f8f.25.2026.03.26.01.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:31:21 -0700 (PDT)
Message-ID: <1b02bbe0-cdc0-4f03-bae1-40cc5c9d6ee2@redhat.com>
Date: Thu, 26 Mar 2026 09:31:19 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: net: broadcast_pmtu: Fix false failure from
 incorrect ping exit code logic
To: fffsqian@163.com, davem@davemloft.net, edumazet@google.com
Cc: kuba@kernel.org, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Qingshuang Fu <fuqingshuang@kylinos.cn>
References: <20260326040645.2020782-1-fffsqian@163.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260326040645.2020782-1-fffsqian@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/26 5:06 AM, fffsqian@163.com wrote:
> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
> 
> The broadcast_pmtu.sh test verifies that broadcast route MTU is respected,
> but it uses an incorrect criteria for test success: it relies solely on
> the ping command's exit code, which leads to false failures.
> 
> When the kernel correctly blocks oversized broadcast packets due to the
> configured MTU limit (1500), ping fails to transmit any packets and returns
> exit code 1. The original script interprets this as a test failure, even
> though the kernel is properly enforcing the MTU (the core goal of the test).
> 
> Fix this by:
> 1. Checking ping's output for clear signs of MTU enforcement (instead of exit code)
>    - Match "0 packets transmitted" (no packets sent due to MTU limit)
>    - Match "message too long" (kernel rejects oversized packets)
> 2. Use an exit code variable to avoid early exit breaking the script flow
> 3. Maintain full compatibility with the original setup/cleanup logic
> 
> After this fix, the script returns 0 (success) when the kernel enforces the
> broadcast route MTU (packets blocked), and 1 (failure) only when the kernel
> fails to enforce the MTU (packets are transmitted but no response is received).
> 
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
> ---
>  tools/testing/selftests/net/broadcast_pmtu.sh | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/broadcast_pmtu.sh b/tools/testing/selftests/net/broadcast_pmtu.sh
> index 726eb5d25839..a8d2a205c51d 100755
> --- a/tools/testing/selftests/net/broadcast_pmtu.sh
> +++ b/tools/testing/selftests/net/broadcast_pmtu.sh
> @@ -41,7 +41,13 @@ trap cleanup EXIT
>  
>  setup &&
>  	echo "Testing for broadcast route MTU" &&
> -	ip net exec "${CLIENT_NS}" ping -f -M want -q -c 1 -s 8000 -w 1 -b "${CLIENT_BROADCAST_ADDRESS}" > /dev/null 2>&1
> -
> -exit $?
> +	ping_output=$(ip net exec "${CLIENT_NS}" ping -f -M want -c 1 -s 8000 -w 1 -b \
> +		"${CLIENT_BROADCAST_ADDRESS}" 2>&1) &&
> +	if echo "${ping_output}" | grep -q -E "0 packets transmitted|message too long"; then
> +		exit_code=0
> +	else
> +		exit_code=1
> +	fi
> +
> +exit ${exit_code}

Apparently now the CI test is consistently failing:

# selftests: net: broadcast_pmtu.sh
# 0.03 [+0.03] Testing for broadcast route MTU
not ok 1 selftests: net: broadcast_pmtu.sh # exit=1

/P

