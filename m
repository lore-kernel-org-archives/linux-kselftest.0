Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795092419;
	b=3+1C3wM2V6hF1bbDBxHrvyrws/jQ3FHAeUheHQ5jkf2P/ZC5LfCj/Aa4kzE3yol4Nkxv
	 xJvasubAM8yCQAdjAmeUPyOUmEGz99CiDVPBvU4QDTg/cJ4PFPuwYt9ENxLu501qJdn8n
	 AWHOeCiuvt2qp/+ALDPNwndTDKrTatMPeFnvQIC19SRsH7WJY+CCZkySMkj0pl3KVvDh2
	 H6HSkJH1RvehYphHoLLVk0Q5fcjKCPoxOc6TAYfsM8SodQLrBr1B+KM0cx9t8ho9Dggxn
	 YL743d6PRiy20gKaOxorQ/uCnUFoyKfdKGW+jFX3cR6DyXDiV+gYtHItwZzvQueMHkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:X-Original-From:From:Mime-Version:User-Agent:
	 Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
	b=n3ywG9Vrihrc8oIf9p/r+kCuMb4dzJMNwZfkD/ND0wcK7qc+EfulrXhfKmNgo+QpPH7g
	 efruqUlZFXghbASuxSyxcT/kOrgzdS+fXx0il1f56aD2TnLcPWqfId8T1StlvExzay8YW
	 D7fmDctTRuc6+gTbZtZJPXHZr5VQXFh80cyO2Pt9brjyesoXxSQLAeMmvzg1MpqcUVhZF
	 Ih76K5NMM6nBaR9r5yUnFWMcZpsHgrnf/V9YK4Sra7SFDqJLz1L3B2BMt6LlNTU44paDG
	 p3nSiqWE6JoVz12T74ieHyKZ3HLLS8APfAES6UbVchGUzlmUaslRY/B5yt3Vi8bwRRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PVBcFpas;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6A2606A320
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 12:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF6A2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PVBcFpas
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67db5e13b0cso2050901d50.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 04:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795092418; cv=none;
        d=google.com; s=arc-20260327;
        b=nWNhtmRfRF9lhUKmCuhr/W+E0ei/xX2puglhzrYGnT17HNuErKQizSN98YanU6iWh2
         D8U1j1ZY7XaN7M/nrS9QgSZLVDaVEIKe8U9xBmQWwLBNI2PTlZhLXPLkH2tEYPcFsTOZ
         LfeI/PAI+VQ7jvpcyT4MOBnlvqIKjZ5f3Ai9gv3EC8SANyU8YRNSnwEse7YtH8xzUkQD
         gVpEeRSGoJmqh5b8ZJGbPBMT0t4PMXtdT9wnzQh1h1LZMfNleBPrW7JBtaQPe48QS+nD
         AJuhTaix3m2ofx6gbZ3GjIiaaGO3Gj9aaBVr69mjtVRZCfjaXPAi7/gxTykYQOWTCJ6U
         5oSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:mime-version:from
         :references:in-reply-to:dkim-signature;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        fh=DwMmrmIs5UaXYqYn5bfW2NFHoqjIWdV9MPjjJlE4nMw=;
        b=mK87oko+pTqmc/X3jixR2Qkj8LMn2QipMj7n2X1r4kUMM9Zmr7zHlIFRk8WVEEju7l
         nCM9QRwv9MN3MK1nFMHACzxiF1BxK9ncdu5LmW/MuTQbc2fIT8LwfOnAe5IAt7A5ECOC
         RDfaaqJTSP5XKIogPcC6PlBLA4S64+pHpHLjm0aebi/9QUDj5rdJakW0MzVA9+65avCJ
         r8tr1u4AP2bAPLRZHl6hD8D2d0+graq6qjyp8zclAe+QoEwi45RzEYxBvMeRfo++fQ47
         Ay7Z1lyRVWGzTa50Dn6N7gkHF2OMxRgc8ykZRilq34eLy0ENaUnWrdQ2Abr+ShF3Nro1
         OrKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795092418; x=1795697218; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        b=PVBcFpas1O8smDHU+vAfrzG+rYFHrAQDcyNbr5hyCzToAVKVsl0IlJXf1fAxNIbcMS
         fFaMWPOIOO67Ge+lHCBqORfslCkWcgsu2TU0CDhp0qWnbg6+8wd7eFEzAt8d9VaDLdM2
         pIjVG+zDtEvZo9sQ2wU79yJo/+foxmdaxtCiOxYBKT/lgB6jYwTQteAv7sk54loaJZia
         mX5J+YP3UglKO1N9wQZ9BdscQDjZ++aBfNEbhKM2S5kXHY6gfg9HbHNxGiT/9zxGPwAu
         Yem+qoolbm7IdPNK2zTIsK6XZBZs0XnAfsi3gMxB3mjZAeIml7J0XqLZc4D9Hma1qGqM
         px/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092418; x=1795697218;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        b=uizpQzbihUKdiUf9msIr8/BTPIZIQk6KfOvhPgleRU/Puat/eJmwRjkQ/tFZSM9Rl/
         Br8T4od9/oJIIRxS6be4JD1DDO+iPinkFjHw16JorJ2/v68hNqQORDe1YJdoOEkthoqS
         V+Mq9cDmJ0wxpTJmbvigUjQg+Nr8w/77f+5NfYyz3HojyinavQugHgM/lNMB11YF8/EV
         tFCixXobic1NwZnhiIuKIfWA38eTbaquYKhu6+a5jrRxaIxt3hXKkrDhA49OUPAeYEhS
         jNIum5xnPnNvclWKv3Zv2o+SkYrEctEiGDzx5hgeOPb71lzNIxbgkLcpKVqBq3JDHVxX
         vC7A==
X-Forwarded-Encrypted: i=1; AL+hErHpTC+OhVgNNQ7QT93yaHvb9wmj6o9TtKYtCXfu3EjCjqmi3UlwiFCCuH1n7dOMPFOvCcer6aZoP2Juxtn/VoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J6CP3Q3CLyLnW01xrDB5xXFEKNenZ7GwH5WSlX2x9fnxNogpx
	3Iw3OJE1MEH2TrBv5q8qW7rCTTckXLRSiW5DnZs8kZiQBLHzBxXwiioEzxaU5ihNjFxpeXSNLmZ
	CK8sTsag64+xPgnawi+zRpV0NagG2hc29jxl6RPb07A==
X-Gm-Gg: AZFdTZexc0flRNfrElUzLxADNI1YycCEZn6NocMfIhocv7OnnvtOrVyrNK3s1VZ/RUZ
	IHuwyTrppmZXsrU5GAPK8H5n0meaqkCyxSPtQNFqbUyw+gnDnZLbAcwXZGuON8ehnwi7u046teK
	BmXY1FP+HZLzfDMl0i2R4tjdd4b5DMi7VZNPToWfP3aJc3/e6+uDZUigWfYPvaWEjtuISsocfMZ
	E+MDq5lbAW7bDWcBlEfndzUfnHOF/NNu/5lW5jMAUqk2i1d7a547AledQqoP0zihKKJVMoiqaIS
	Ly17ZL7XWkPXb4wkpkCxpfZ21FoyvHKv/LUcybQA+QNp27AuGaLXWVaZcDhjZ1j0ZeDTraIX2is
	2T6rSuOcH+tPxz7BATU0SCG1cF3SkGU3hryJw+w==
X-Received: by 2002:a05:690c:7405:b0:8b3:3fe5:f6ab with SMTP id
 00721157ae682-8b4fecfa349mr19565437b3.24.1795092417770; Thu, 19 Nov 2026
 04:46:57 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 19 Nov 2026 04:46:57 -0800
In-Reply-To: <29e631f0-c135-bea4-0a3b-81dd715cef54@kernel.org>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com> <29e631f0-c135-bea4-0a3b-81dd715cef54@kernel.org>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Date: Thu, 19 Nov 2026 04:46:57 -0800
X-Gm-Features: AclHuK_VCp2Kj6TuYw_2lEwgIiu0LS1C49sX3AV2M1eYDrqr2PQ_yG1as_cK4Hg
Message-ID: <CACnXVne49x1JEPZhCaQzofGDuZa65F6cRpE5Pzj=3s0rzpHUcg@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] riscv: add SBI Supervisor Software Events support
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, 
	Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Yuanzhu <yuanzhu@bytedance.com>, Yicong Yang <yang.yicong@picoheart.com>, 
	Susheng Yang <yang.susheng@zte.com.cn>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On 10/6/26 6:21 PM, Paul Walmsley wrote:
> Hi Zhanpeng Zhang,
>
> On Fri, 11 Sep 2026, Zhanpeng Zhang wrote:
>
>> [...]
>
> Thanks for taking this series forward.  Could you please rebase this
> series against the current riscv/for-next branch and repost?  I tried
> pulling the series in, but it needs quite a few updates since we've
> queued up quite a few patches that touch SBI.
>

I've posted v13 [1], rebased onto riscv/for-next at 642fb67393c1. Could
you pick it up for the next merge window?

I'll address the crash-kernel kexec restriction in a separate follow-up.

Thanks,
Zhanpeng

[1]
https://lore.kernel.org/r/20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com/

> thanks,
>
>
> - Paul
