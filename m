Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FFB34FF78
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 05:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789189954; cv=none; b=Hc3VPV2rGpp62ULAvz2/0EBCqx7B9iGYMnM6rLkXXjc7PUOP7e4+BxpjH91nx7D1yCYQTymebh3En45fH0/eT1gEowm/g1IODe0SqWE1+sJ5vTdMm5eJaA4nyvszw8yloT8+0+1HdrKbxm0Af8wtt3ZERYd23uxjgZSnCmaLFzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789189954; c=relaxed/simple;
	bh=yTcdsUmAFIRyyngXw0gHQk3+2epJRbLgUj5S5C/JgPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V42R97ulB2SuVlvAlMv+L9JhkVFkWOiq74o0VuBSqlIbEc727h1dwsfBDr83Qttko5VnoWZ5PwV5LlUEmtg4oJ/2qksPFnsbO4e0gOuVw9Z6+Y/ZNrj2oXjUet41Aj3J6CBVzNRmudxcMSfqmHFJR200Mo7r0BVju7RVbvfscvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WosihMCC; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WosihMCC"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so376290a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 22:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789189953; x=1789794753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQ7SKUX4iPc/e2EMSLENev8czab9Asgciu1sDxNwcDo=;
        b=WosihMCCJ+ocKbug+KiEZQ9CgV7rq7wecLhZ7WYnm0iOGw4PfZi8e5tk7xNttoKurs
         A137NJgcQ4FGU9ugBzXRy+5m14dEENtZ2jAzFZlruKAKRsz2O7x0FJJfSdCq0Qlmvg8t
         nJJKIPCu8FPs5gkGmFfoLHLKaBKegL/hqZ7RCqw8Gz6K670oAjBIu1CmZZJAivIOivdW
         NV0rhd5v6R3J8M3eYM3Cm7zApRT6+XgcHYbrC8zwmel2eBiqkdXBQci/hQQ7NfshNoLB
         Ik5JSa+S1RWGkhnt2p6j4byXaUYQHuOf3KzEAO1DXQC+nWqozNgN7U6hjX1gIxQS/9BB
         65tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789189953; x=1789794753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQ7SKUX4iPc/e2EMSLENev8czab9Asgciu1sDxNwcDo=;
        b=hqFFuEk/sYo7O2wnZ5zEIcGMkEaoitCU3x3qMv69QDEELwlecixAoRGRUHMbpecpv8
         Kd8lL7uy8p7TRynjmlZJgadqURXvKdxqcKOSS/UpnIDWH1c7NX8ZklVLePRR8jEyrkwc
         CfKi8dBxIp6zRbp1SwqpLRxSkvjguhCJA4suG/NVrtVaiBFdP1Eiwe27dBYtVE7tZ+fX
         eUtJYFKzcU8vJzqqIqSsYeuJn5OwAnFWfozN2iouoArgTzJYVNngBXs27jATJag+uLSP
         Ix5Fw1XNvGI3Jbel8FjTPbuLtDodRK8mfRGWIEu62YaD4iQX3lGH5QudhUrdL1++MCex
         umIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFH7hbi45y6Kc4DG59GBuSCCVUTqIUvFT7sh4T0vNfFMe9p52YCPq+YSBWZrgufoQSK8giuUh+OdLCZsOhQFc=@vger.kernel.org
X-Gm-Message-State: AFuF++n350y1TNwmXmsExnSBBfflsgLUvl2y7nFOoBTraOTv3znC7OBh
	yETr9sGecoMqKrHcFrxQyiuWsZ+n4UWhcxRLXC2AVBHQEF7SPdtiLmx2
X-Gm-Gg: AYBFou2xU1MI7Fzb9KP0xGszditxl0Eiv4jvtRBgqWMQ1ppSMeVrB4mjp/eHFKlBwJ6
	6m5PLXMVhfrna1FOOMK73Bca62t+To5gKzFtkfSG0g2jPUHxHR9KqdaxS8UOr35jlkc5OQnHH82
	wPWChqp+GUBXYO1rYGEzPwXiNGVdel+ATlPnpzdtlztStTLjpWlEZbsweYLjyv61LqMbagvIl2r
	BgpLfJTiua7Uhr0y99vSM+t+HzYp/MgZxfPHmiQVxVZp5K3TNtptty4BWJ9HfB5hpZCHt2hzPf9
	ERe70fB3qSA+mSUAy89z7m14026yg7jhed4hjpc5i94OsWdIZyN7ShkRoVJHPfS0CwwVnNZxgj2
	mc84npCZRvI/ULERIsVkEw2RvvF6Uxwv0zWKW76rZVsx5zJhJePz7AWoht+DQj36m14JSorrOaE
	t3xAyYmkufcA6ZUnNK4OtT0vatfbHLRMI53Dl49KbRTruHG0eB3REGAbCAuqFmgO/BpLy5u5Q=
X-Received: by 2002:a17:90a:bd7:b0:39d:ba21:fd90 with SMTP id 98e67ed59e1d1-39dba220361mr2148619a91.16.1789189952954;
        Fri, 11 Sep 2026 22:12:32 -0700 (PDT)
Received: from gmail.com ([2a03:2880:7ff:57::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d1056sm8134940a91.7.2026.09.11.22.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 22:12:32 -0700 (PDT)
Date: Fri, 11 Sep 2026 22:11:29 -0700
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Narcisa Vasile <narcisav.kernel@gmail.com>, netdev@vger.kernel.org,
	daniel.zahka@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, shuah@kernel.org,
	horms@kernel.org, willemb@google.com, petrm@nvidia.com,
	anubhavsinggh@google.com, richardbgobert@gmail.com,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: add BIG TCP test cases
Message-ID: <aqTfAVkzWa3P09iZ@gmail.com>
References: <20260911050659.13367-1-narcisav.kernel@gmail.com>
 <20260911100101.2c34bdc5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911100101.2c34bdc5@kernel.org>

On Fri, Sep 11, 2026 at 10:01:01AM -0700, Jakub Kicinski wrote:
> On Thu, 10 Sep 2026 22:06:59 -0700 Narcisa Vasile wrote:
> > Add four new test cases that validate coalescing
> > under increased size limits (BIG TCP):
> 
> Looks like SW is struggling to aggregate enough. Do we need longer
> timeouts perhaps? Note that the debug kernel build includes 
> kernel/configs/debug.config
> 
> AI says:
> 
> Thanks for adding the BIG TCP coalescing coverage to gro_sw.py. CI is
> flagging the new subtests as failing on our debug-kernel executor
> (vmksft-net-drv-dbg, gro-sw-py):
> 
>   not ok gro_sw.test.ipv4_big_tcp_data_same
>   not ok gro_sw.test.ipv4_big_tcp_data_lrg_sml
>   not ok gro_sw.test.ipv4_big_tcp_tcp_seq
>   not ok gro_sw.test.ipv4_big_tcp_large_max
>   (and the ipv6 equivalents)
> 
> The rx side never fully coalesces the injected segments before the
> background receiver gives up and the test's retry loop (6 attempts) is
> exhausted, e.g.:
> 
>   Expected {68952 }, Total 1 packets
>   Received {20280 [!=68952]40560 [!=0]8112 [!=0]}, Total 3 packets.

I've run the tests in a loop on a slower system running a debug kernel using
10x the previous flush timeout and I still noticed retries every 10-20
iterations, so I've settled on 15x higher timeout to account for variability
across different systems.

1..4
ok 1 gro_sw.test.ipv4_big_tcp_data_same
ok 2 gro_sw.test.ipv4_big_tcp_data_lrg_sml
ok 3 gro_sw.test.ipv4_big_tcp_tcp_seq
ok 4 gro_sw.test.ipv4_big_tcp_large_max
# Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0

1..4
ok 1 gro_sw.test.ipv6_big_tcp_data_same
ok 2 gro_sw.test.ipv6_big_tcp_data_lrg_sml
ok 3 gro_sw.test.ipv6_big_tcp_tcp_seq
ok 4 gro_sw.test.ipv6_big_tcp_large_max
# Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
