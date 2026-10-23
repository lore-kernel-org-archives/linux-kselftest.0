Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790360;
	b=ljmVGp3VYWn5FGJkBIxqJTLWuX5yMG1hfvYEt5bPtteN+ZDRy7FifxMsdSHDhXPzUXKY
	 YUpnwkImHPd4Db3UEeYAhvqnYNniAeynxrroDoI1cD1mWmJ1R/DaLdZtA/+Qbub18lL4A
	 dJI+CJriD8b4c5KMVbeZlho9yeKDtrzBkUfI6VnoKN1fu07YcP4tGfIdYL8m6h1Way2PK
	 QZ9ZLTYi0kj4NMcV2mUK7H9sjdTs+mK0TfYVEn3y5QPYDuWglcOwx7QcQlNCirsd10FfN
	 72ilJ/WIanHIuCL2tCfpq2dn7+MviqBK63CIAua8Y1HPw5/RND0EeowIciULp/BXwPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yWBgUBsU5SQrIvRUDccicrPkew6SUfYKjLfxdDf2bJ4=;
	b=v3a7ylvPZvYTa+doejLcECXi+4q0OCdAjrB39tsMVummCxDP6Bj50XAV+FOi0WEObMWP
	 PBUJaNEtkv3/EjDWuSZ3XLcPJVZ7frcjLLSCrzu8snpGdjX5HNvxRzu6Xz7W0PtyiXje/
	 awLm9ZK4h9OFJ/0KJc3Citdw+m+MCIEIUwyhdKWaL/NDALzrQQ6nGnM8DNGZF2/CJpoL7
	 QDfi0H85XvV0vpmZTsTNXE+kG7O7maoYZ1FUe8rF9fCcCZPfWXduSulJgOjYdoWcxz/eM
	 FJAp9YMZLb3/GS2iznfn/2DegYA50O9DBxGS4+TZz34cpd6H+VPm2caZtvsD77D279w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SasZ5Rd6;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A190606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 21:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A190606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SasZ5Rd6
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a17ce1dc00so2283765e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 14:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790358; x=1793395158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWBgUBsU5SQrIvRUDccicrPkew6SUfYKjLfxdDf2bJ4=;
        b=SasZ5Rd6omPxJpClpD2xhcTFeNqYpEQa5xFpdVTm/zXOZX4H65cMP2+GvD3b8eyqzF
         ROwYglTGitbsz1emPdVWtXWzEGYxqhwYDWZB5AbvNHW0FVdRb3K5jhxKeqWoikHcVoZ+
         l1dDgjWWs7+l5PGVICnK/t4x87q05JUqbeLCht5/MsrjyKxdjOiRdGLxXCrvDQb8ffBp
         2pOPmDk+arT6GaldK1FLxGJpoiYbCQxLzMV8nxRfwMydPRy1u+5FiakQnhTOWw0Aw9hx
         9QVIB6/vkE0O2CGXjepExCm3zm1NFqjpQUoAg0FI4T5TWyVxHyNQds7T3A+fCndihNtY
         ul+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790358; x=1793395158;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWBgUBsU5SQrIvRUDccicrPkew6SUfYKjLfxdDf2bJ4=;
        b=RLmTcG+0F+ruFKfs9ev+5qGmDAtf/hGuok44wXtwZl/r4/L4WhNAHDwhp9lYVsy7B3
         34W7/Q9/Zm9SAzW1ySf4/FGXsnMKKiOHe/I6Je0y5smGWrfYI9S7a9+TNy2ur3oUV/IS
         KvnsriX8jhvfGTPJ0x2bbY0rN2unTRC+UirBsh3KrCzCwuipQhBUJlRY8g5wNtQhEJwX
         z8Dla+G2jtC2t31EgNYIWBZDBeCt3ybCK5M6qQbAB5pSw8lkiGyvC7fTUmhthIyFFjX5
         siAcaWTHZZzqvBQKpTFKuxmJTGc5CWnJa88v2UDMs4ZFqPCM2vQzQcUZWu+CTguMetHn
         5acg==
X-Forwarded-Encrypted: i=1; AKwUvBzKjkaUaA4htflmqQ6IJ4Q7U8rVFc/CDWUvL1Ejcn5bNC0iq3SRcMztndSWaEuK68W6g8hnx9+6GDSSN2HY/lY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1SnF0T/mvBryfc9FGNR23K/biPtnG7qNInr7WPR8kPoz1OHHP
	PhVS0dcyC9uLmq9xq/j82yPQBGSf47FdhnvPWcPS4DyVWPa1AMrrpxDM
X-Gm-Gg: AYBFou3UszwfgRxd8o7r7QBHKxPUho8ScZIAFczpltdP/YGqOnDZcSKV3zxhbKWpFfN
	jdL9jZgK0yAuGU/9rAFc/wTFneK++Q198ljduhluy5VEQ5X88QIbkRl+0CESDpyXolHbZK6HrV/
	D5z6Octfna1VkfdTP2VYxsV5CMOMSGdkHnuPzczMt0a3REB3CEo4gQb28BLorEleGhBAuZuWfI1
	q/ZN0+vmdlHOpt62/PBvWxazFJ/cPA0IKZr/WuvWiJf+1Heq3j5+X1wRssQJIhpS3iCAjFx38ME
	rlewW7B1br99Nig9TY/hhSIbprm7PkF8blrA9xFf0UW5yKEORtK+to4LjSAa9/ZbJR6k6fu7PjW
	/PeFVQuvQ0E3pQXf88tf+KKDIYDAH0fLnmde372MBxXtgc7XR89X+xnVWDSkJg1OxONxmJZjHWy
	QkPuj75JxC9XBjOpy/efxXImgIMgoIvz6ESo3s+VvQdR7YfEtIirXUMyL4E1TllOgKDL2xYW6yX
	ezdTVW+6FWpUNi3Mztle4Yk/N45f/P7xA0eJaaz4Yt8XWqKedzsxCD5lExNgd4n7EHYppIYVZCp
	bqfqVtWpSGC1L0I3FACLMryMMOPN3vSJHgbIQiPeZFUc9x7XGB4982Qv2Zsi4zrS3OMG7jbQHcI
	GMQu3UcPYDReFpYvrdso3b66foOJ4dTcTR6REB3S1IBR/QW8pm86TjX2/dePb5F6LanhLTwfaMI
	tG4A==
X-Received: by 2002:a05:600c:6088:b0:4a0:1e9f:64f6 with SMTP id 5b1f17b1804b1-4a35aae2effmr2768265e9.0.1792790358291;
        Fri, 23 Oct 2026 14:19:18 -0700 (PDT)
Received: from ?IPV6:2a02:3100:61f5:8ffc:adb9:5590:e497:7cd5? (dynamic-2a02-3100-61f5-8ffc-adb9-5590-e497-7cd5.310.pool.telefonica.de. [2a02:3100:61f5:8ffc:adb9:5590:e497:7cd5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm407437f8f.39.2026.10.23.14.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 14:19:17 -0700 (PDT)
Message-ID: <2f153755-11f2-4d0b-8d56-101e2dd01923@gmail.com>
Date: Fri, 23 Oct 2026 23:19:16 +0200
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
Subject: Re: [PATCH net v7 2/4] net: hsr: preserve submission order without a
 forwarding lock
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, liuhangbin@gmail.com
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, shuah@kernel.org, kees@kernel.org,
 petr.wozniak@gmail.com, qingfang.deng@linux.dev, fmaurer@redhat.com,
 luka.gejak@linux.dev, xiaoliang.yang_1@nxp.com, skhawaja@google.com,
 stable@vger.kernel.org, sdf.kernel@gmail.com,
 syzbot+fbf74291c3b7e753b481@syzkaller.appspotmail.com
References: <20261009201324.17-1-xiexinet@gmail.com>
 <20261009201324.17-3-xiexinet@gmail.com>
 <20261014134718.YGcKmfB9@linutronix.de>
 <003d3e2a-3568-44f6-a9cc-3202de60da58@gmail.com>
 <20261014151838.6RyMIRVM@linutronix.de>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 xsDNBGpiHugBDADJ5KuJaOYfUx7TGbRw0UE1km4dLnJomCSNtgq2T9BqgZ6TRPEy37soAmW3
 XxCPvhfL6CPLldzy6O6EkUD7/8zlbQP1DM6gUIQUyKxxkb8uR+oCogDKjsxt0QPycP/dR9fk
 SL4qKReprnkOOcGeLahLHzofVdn46mc5igCBsAA/PPSpo1GqsfGk+zYV97rSVa8zhnSXsqZ/
 9DbUfQynZKVqYN4tm1B30JE5SEWDCko95Qw9fAORX2W356MOQJGr05z9qMSy7CkF7bAUkziG
 d6ZSPsGEsel5jYByP8ZvwQ2A8kdKpRy8+zQCaC+vEotTH7Fs7SIzE/Z5mEVIi1xQqEzN1rqG
 BW7KgzRDWjw8lKsoBbxv20nfhUzuZLan2HzUJ+LxZ18Os4zkWg9sxHgMi+AGqn/+0ppbDcOH
 9Jm072/xA7O1MCXLgr4FOP+4PJH1vcqU+0EZVz7KCjrwkdz+l5Ojso2FLXq2MGoqWGShIsDV
 bF1JYpgm4spdPbnISkidUC0AEQEAAc0cWGluIFhpZSA8eGlleGluZXRAZ21haWwuY29tPsLB
 DQQTAQgANxYhBAHOahKZFnMu2n/CxrTrSufyPi3LBQJqYh7oBQkFo5qAAhsDBAsJCAcFFQgJ
 CgsFFgIDAQAACgkQtOtK5/I+LctmngwAlmrGPWnWxDW6PSJeR9SM0faqwuY33TWAE35nshm/
 EEkBgpVVhG4z4Cdy7L+6TG6NHVDnvl+IHLyyOZlL3LQPQIpiKVgo6jHmm9TF6mK+Vo3nsXAA
 uSJYu9iY9Aywmy2JVQ15ttQ0NfcoZ0sV14bT7pSr9zXB6D8p3XA4AQI6IBeLvj993Z1+tPyC
 6BJ+2aWWLBx7xGpFo3X8dhjS/Lm8QoietKbI+ACefKKCDNiM2KG53P76wdXJp52u4dqP6eFc
 +Qv35QefnALoPkOGQEdd1qvUycyZhuaCj8h0AxDu7bL3G/IM8G2K8qsbSJuui8zCSZ9b/QZf
 H7u1nevPOgxyWC1Pep/TbRZ62ktn8lrmWA8PZjuaJJQGjahuK1GgTQZNG+7DB7NwjLr6aXIm
 JirtT4FeR+IUovvL/ll+VHzpGpFbgXz4GTsWsikQkT1huFSB8MRLlWMXdAKblL96L754j8Z5
 p/YV26YTppXI56uJ3XyOwZSrfrK1pfqNIp2Yr9vUzsDNBGpiHukBDACePM1YZ1FvAiFay/2v
 KVDNpuazmpVb1CBFy+rqM9HcuHe+5CuxLd4RI4hb0qmjlm5Vi5M8+AuNB/wi/f8oDuhJwlMn
 v9L0lfgpRRdShnB26hnt2wWwWFgOU3BwymSruxhEYq+eIjjxCAo6yW7Qm+ArZ+riETMI67sy
 ZyLx6o4yRiWxOrh1nhwV/f6PIOl+Iv4yLAG3eFXpU7/EZpim610bKMwcXEpiRkf3NjiflIha
 adoKHV0LCiVNrU7r8TICjjnugpl1tXAR2RlaRcSxmvOzrXY2O/xBLpwPr5erbdk8RCaxUzS0
 kK0hw+/On3Sr4Z4gtLl2xtDkjRh3KQ9ZqMPrFD/5XOs842ueNivwIyAf2kQJjKfJGWc771EM
 0ZWo1r1AthbuM+IeN5QM74rMJxaf5WyDX3ZeqBA55fCJGJ3zrp7Tqeoq8DYufiNkppE9S71z
 Cvxva2f8mUWTlTUf8s33sRD7C87XpT0whKpn1I9/nJB9Kb0dKyRCdcsT4o1ynxUAEQEAAcLA
 /AQYAQgAJhYhBAHOahKZFnMu2n/CxrTrSufyPi3LBQJqYh7pBQkFo5qAAhsMAAoJELTrSufy
 Pi3L/iwL/3aoCeq19Pog3fqisRyEZeX8pXw2GYlrJWYoM0mQ1USaTpdsMwCXaoFMoSBqid0F
 VPrqlH4bSIEEAzVmFPX0NjGhREDMrQ9eR5S9yqSpBvX+hz+xgpt4NOPhbVQmV+9f4lX9TJT7
 GOO3EX2eeokg6ZAISycCAx7srXuc8oyRTJtnUQziH9GXrEeon88LHf1QHg0Z0sL/c7DfDqvW
 9924M4ngQAZ8RgCBGZocoWuXCemSPkfQVLt5DzycSgSQODhbNSEmr+jb1V9Svf9D9k0CQfEY
 cB3uwOHWb6Z/yaEARbGZPSPn89YjXBncQTpgSvUM578b5x3pKi6PjZB/hwtUsRgrWGWoIwRi
 +ZmcHnCzsuo6uuNYX8VvmWqYsVajykjnpjdCGmU89QUsVmrtnDPBrfr8VVJcZPnCJhE595Pk
 LO29Oj0au9kr7kMW5Q+fBeHj5zz6VggAaRRU74/sgtwLODBWESPZ9LqUUdB5L/XbrSq2VDlD
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20261014151838.6RyMIRVM@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2026 17:18, Sebastian Andrzej Siewior wrote:
> Okay. In that case, could you please teach HSR to reject bridge ports at
> the very least?
>
> Given that HSR is a ring and PRP faces two networks, I don't think a
> bridge setup would make sense here. So rejecting this should be any easy
> fix.

Yes. The same chain also exists with a bond or team device as the port,
and with a macvlan or ipvlan whose lower device is an HSR master. So I
will make the check "a port must not have lower devices", for slave A/B
and for the interlink. A physical NIC or a veth passes; bridge, bond,
team, macvlan and ipvlan are refused. The only real setup this excludes
is a bridge used directly as the interlink; a veth into that bridge
still works.

> Or (c) tell HSR to reject bridge ports. This should avoid the case and
> the problem.

Nobody else has commented in the meantime, so I will go with your
suggestion. In v8 the lock stays as it is today, and patch 2 becomes
the port check with the syzbot Reported-by. Narrowing the lock can be a
separate change later, outside this fix series. Patch 3 then segments
before taking seqnr_lock and numbers each segment under it.

Hangbin, you dropped your patch in August because this series covered
the same place. With this the syzbot report is closed by the port
check, and narrowing seqnr_lock becomes a separate change. If you want
to pick your patch up again for that, I have no objection; the stable
prerequisite tag Simon suggested and the per-CPU TX counters would then
belong there.

One case the check cannot see is a tunnel device used as a port whose
route goes over the HSR master itself. I would leave that alone unless
you want the re-entry guard from (a) as well.


-- 
Xin
