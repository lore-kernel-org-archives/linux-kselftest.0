Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343010;
	b=A0tKELNAxsJjwXEnkicrYFW0mzicd2xWYId3Oz0d8qDH7j8jy3g3MPIdYgRANvrL4UQx
	 F1uvCpPuIZxmACw0lJ64HTn16Zs7NF7QKV2T/A7w8CknDv6MifPrBA5wbzH/FaI+gbz0u
	 5sbKRAiNQNCr3OLqnsq/+HrOm98bzpTgNBCjeD5Tye6YQ/R6USSJJe1r2m3snvionD/0q
	 vb/TRe6YOkRksfRdHfADSWtRym58zpx3t0Kp26sFjl1L2khUhcnfVyOlOHVG+x6eBC0BY
	 D9lOY2UZfj3pNWi02Dt8F7OrmkeDm8Ma6jZACHj+Y4KjHj4NDnSQSbJpfsN/oOdqLqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DS50kc0yp+XKmRK7kU59nKs7lLs5n+2L5Ptw9GISEyg=;
	b=pAG70nTyKSbONLYwT7tZCoGSsCzeTxiNpKnEoqoNz3W/SXW4Zccb0wWhzJfOjtDQHvy2
	 84c3wghcnXK44Z6KfHmGu+RRcTLhh1YGRzlSCJ+uFd5W2zV4gAg0yfyl2zES++xbq2Jn8
	 H/tRjUKjau8AiLAgebAvwF+wf8YiXDQyBfwpFC9M2ybnmhiC3IJZw9prUHibZwETMj5sf
	 zhLgEnPldu/Hmbi4WFC/smo7wbpHflh/wIg4u7mI/Mi9wrSN4lGOCJVjDg9pGocWKFJVg
	 iC7WSpnH5+yqcVL3zj3SoP+LFEIzELhapbQri7eFjMVzpqdwN3C7wfHJ2F3peGQcfRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=GqgcbTlK;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC13606A32C
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 10:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBC13606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=GqgcbTlK
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1188451f8f.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 02:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795343008; x=1795947808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DS50kc0yp+XKmRK7kU59nKs7lLs5n+2L5Ptw9GISEyg=;
        b=GqgcbTlKvhpVEdUHeAMatFpKIA/KSipQ62eUBmYCa1HlHWCsdzKAIuUzKhnNCrf8mE
         8fQdsYR7Y4gflNAIsEkkfCTjAWfuw03vPALHREgkd/qRQ6w/rRUIUJd91kGzAhdxFbyE
         Xw3/QtaT1HM/hVLb0j3DF3dU/o6V6EU95rRd8nd7z5snYesZ3kzyjsipCiBU3j9O9q/h
         osjwBD6tXgWtSlYL3hqYPweMQHu6+iZ4tQL6t7YaA5tckbAFc8RTe04D7n52RUAqH667
         WhTSE6omeCBCcK2kublsmKM1oc3EGzjtlraVXau6bMvagWU7belt6twZDqaZ5ef4gliE
         PJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343008; x=1795947808;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DS50kc0yp+XKmRK7kU59nKs7lLs5n+2L5Ptw9GISEyg=;
        b=cDvmuFbwYVeH+r/LBOptbUYkkXQwCXfGEdzkN/0dvzuZbGQ0s5FKsguoNbT/Ybx2wo
         4iQ/Brt1JyEy2vYoiAk7u5czpWQmGdQ4oB1TrmWJUaz4bUU/NOEm4Bk02oOnYedVM+pn
         DPOsTKBqb23gDgGE3BvWAUIr7kATXl/Pv0EkGy0hfneQ34+e7Qo6WkGDhUGELjQ+7AjO
         b3S9ex93fMF8bp2E7kYfZIEmcZbd605TofBfNKhDLUteETByl3MQ7nzyAUOMzxOmLT86
         9Tn6QZ1k/NPZluZcPSWf7c00pB5ZD0GE0GeTpCaZhovD3t/xN6rIgNU4u+X0YurF61rl
         wzmg==
X-Forwarded-Encrypted: i=1; AL+hErHuJoyU3ocfsWSngFs0hMVza/LxR/ISEC2Se9Q+A2O4GTacx39LmBfJJ1pucrSQe2bVO/nZpo0qWJ9iXxNiZUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wERqpyp6p/FZM1BHpKB7IngrEnfkqNLOf1j6OS7O9QHb9t1Ch
	JHV2gOTwar9RwV3Z3aF9pZU3ZC2bQ3ONX0+oQZL0nZN4fXNTWokLJIUyUTAkMr/TAtw=
X-Gm-Gg: AZFdTZc48Kxb+j1m2NvIM8GrBvuF2hXWWuysz029exdoNzCnw1vt4JXtC9iCXsH666M
	CnMAu1KdP54f8qTzrYUlFUzXQcBHQmXZjqNqPpjYndJT8rZlcpUrSet3k1ZXCKCk+sDz074SROA
	uCAitkZwsDLFQEcLhBcPhPqUkCO8iIfSK9X/t/lei+D7g6c4rqwaD3iASeCwgAvL19ukKEX3Hfc
	jDGp4roq47vgQlrrNEAiad5otQmamuEm+jhIGrGtJ+Zk+Z9FQhr3PfFqE9qKobSnPw9oOBP4FOT
	hyVW01VG9fglM5ofRQjQ+CixZaRRaFaGfyx+UNtaSJxZcZSIZBFmEuwYzPBqo+P2a8vWQ9UngLU
	wtIFN7DkoAaVcCJhoFZpGEX9aY37QQZXf3onkg9OHUNs3T+nQOxcq144Md+FXTiphLWzOnOlUjm
	VvPLOuBM864TrDvD9F26gzz4FhFFdw/HJzq/y7Kv90zRWnlejiPHJiRA/gB+ajbqCufJ/fhLo8E
	DvcOhIWp8NBNvbZAGntKaMzM3rSzpuLRLVvilrwW5DmcKc+EQ8PGeztNjUZPPpjwjAgK5x4rNai
	+fHs3RaE/AUUOwlWMxrPzvDe603ShqAbqLkvEiNMj7mVz/5sXb7ffCiTIx8=
X-Received: by 2002:a5d:5887:0:b0:4ac:84c:70df with SMTP id ffacd0b85a97d-4ac085bb48dmr15752832f8f.45.1795343007899;
        Sun, 22 Nov 2026 02:23:27 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm14830205f8f.25.2026.11.22.02.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 02:23:26 -0800 (PST)
Message-ID: <44b34f5f-742f-42eb-be7f-0cd731ff565c@blackwall.org>
Date: Sun, 22 Nov 2026 12:23:25 +0200
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] bridge: mcast: Fix source list rollback on
 failure
Content-Language: en-US, bg
To: Ido Schimmel <idosch@nvidia.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, willemb@google.com, horms@kernel.org,
 dsahern@kernel.org, shuah@kernel.org, bridge@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kyuwoncho18@gmail.com,
 stable@vger.kernel.org
References: <20261122072504.2623702-1-idosch@nvidia.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261122072504.2623702-1-idosch@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 09:25, Ido Schimmel wrote:
> When the bridge fails to add or replace an MDB entry with a source list,
> br_mdb_add_group_srcs() rolls back the operation by looking up and
> deleting the source entries of all the sources that were already
> processed. This is wrong for two reasons.
> 
> First, with NLM_F_REPLACE, a source can appear more than once in the
> source list. Its source entry is deleted when rolling back one
> occurrence and the lookup fails for the other, triggering a
> WARN_ON_ONCE() [1].
> 
> Second, when replacing an existing entry fails, sources from the new
> source list that already existed before the replace are deleted together
> with their (S, G) entries instead of being kept.
> 
> Fix by marking source entries that were created by the current operation
> and only deleting them on failure.
> 
> [1]
> WARNING: net/bridge/br_mdb.c:901 at br_mdb_add_group_srcs+0x310/0x440, CPU#10: repro/304
> [...]
> RIP: 0010:br_mdb_add_group_srcs (net/bridge/br_mdb.c:901 (discriminator 2) net/bridge/br_mdb.c:924 (discriminator 2))
> [...]
> Call Trace:
>   <TASK>
>   br_mdb_add_group_star_g (net/bridge/br_mdb.c:1021)
>   br_mdb_add_group (net/bridge/br_mdb.c:1082)
>   br_mdb_add (net/bridge/br_mdb.c:1097 net/bridge/br_mdb.c:1360)
>   rtnl_mdb_add (net/core/rtnetlink.c:6925)
>   rtnetlink_rcv_msg (net/core/rtnetlink.c:7178)
>   [...]
> 
> Fixes: 61f2183512a7 ("bridge: mcast: Support replacement of MDB port group entries")
> Cc: stable@vger.kernel.org
> Reported-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> Closes: https://lore.kernel.org/netdev/179489219555.3099318.10297266282803881244@gmail.com/
> Signed-off-by: Ido Schimmel <idosch@nvidia.com>
> ---
>   net/bridge/br_mdb.c     | 29 ++++++++++++++---------------
>   net/bridge/br_private.h |  1 +
>   2 files changed, 15 insertions(+), 15 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

