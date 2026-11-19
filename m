Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077095;
	b=YY6Hl8x8caMbnLilF8u6nOPyy/CuBp6kmcId3pvRbl6JyNAg3UFa6TTY/TKVNtp2H62k
	 K+bSRqG266OQIgbUivuDng8aJ/Mkk+odSpAQ0Bj5H8lFS+nrc3I4juO1CT/I9NIPqhZLo
	 OKAFZhfs+jeQOnVfA66pFf02GgpRcMWUrZXLNEAxK1GRvowx0ktJ741u6MjXYHTIxJpEl
	 4zIIMUzhRsbtmca96ksdDeox7g3qmiIiCNEa6LLGMHNHEO0KooyyZRYaqiXH/dOfwdJuh
	 fkx8ZuL3Vc07KTgpWTD06KPkmkbOrAg0cZ28EBgJlPzLNPHbesMGTFj6lcBZHaRLoYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077095;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vaPFVpL/9If37STR/jB8Rs5zzcu3i/Qfukaxf8Ff5Jg=;
	b=0iMAyUNVrCUoXYkZmPQT/IqpgYMB84EOhtsyF+SbkpcQNWQk6+1tga2aTSG9LvohXtJC
	 Kw1AmS372DBgaTc8EYYMa5shNiKcx8oye/+PhYtCqlNAR2TOk46pXeivKbyvBwakC5/pK
	 n8U7OjFflUD4d2xMIfsd+XPgtEHwPP6mYYj/F0uKy9V/Jgs6Jv7g2uRqv3QOuOt6WDFGk
	 c8NV1G8Ke0yuuz1LGZrTAJ6Q9TD2u+O1Mjkn5GTo7bg7SF0s8bEEJn7K3/SjyjK3Xeucs
	 iT9KHxltTZ4r3nol2W2M6Nk4uGx7qb9BUG02HZJVhSIBdDVKWYY1Vj6KtZi1rjsdTwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GIx7CChS;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H71ilNIZ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE78606A325
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 08:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE78606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GIx7CChS;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H71ilNIZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795077093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vaPFVpL/9If37STR/jB8Rs5zzcu3i/Qfukaxf8Ff5Jg=;
	b=GIx7CChSRqmu7r4lIxiZkCphn8R/HMoGfQLPQIbCv0rn/linnVGwDAA/6jbPJu/Nmv3904
	8SShlM2233GN1JHIMnKL7XnToeexZWP7ZsdN0cTd+PNNolfh/qUTvdDPyTIRnwJwJkzBmJ
	Blc08t93zkhTr7mK9j1eg3SqnXuamF0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-wR7mSpltN0ywQw9M9pkGgg-1; Thu, 19 Nov 2026 03:31:32 -0500
X-MC-Unique: wR7mSpltN0ywQw9M9pkGgg-1
X-Mimecast-MFC-AGG-ID: wR7mSpltN0ywQw9M9pkGgg_1795077091
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-490c1867460so1150609f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 00:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795077091; x=1795681891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vaPFVpL/9If37STR/jB8Rs5zzcu3i/Qfukaxf8Ff5Jg=;
        b=H71ilNIZiYQSYWQFSHTAVFLdeR/zdYUxy/I6kF+095WIJaeAaVRgVXliryYM7KlTCO
         1ICPmhQ50M5KQw5cbXIT9IzsuncvdQhwon8eMBuJpZMHh5k9i3+GFEq2nkYNrPgCe670
         kFMRCbzoiahF0K5nAJKsgG+Gt70brBR18AqRf3l1JX8fbLQPnBmXcrh7Rbsw4SK6F+Is
         CO+pGiVuo7flmq9gamNZ2d4RyVtx9lv/LwHryf3c4eNh8/tqgJ1RhaqpC2Exg9l3pPSZ
         4KV4rKmRN+vqhoGP4VTW5qdLd/7wKZVvgdmcZ6+t/zppFy8ptYho+iNeiQW9kRLat5Mp
         shuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795077091; x=1795681891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vaPFVpL/9If37STR/jB8Rs5zzcu3i/Qfukaxf8Ff5Jg=;
        b=YmbV5lu6+58VvjmC/SyHb0ipnvP1BuWtEAE9Y+enzn9h7XOeoATRkKc42NULMrLUe8
         bt/cWgEO56i+zQuKjk3awmALAYeZg2NH/vo7xCpFYOMMJRt0Xjxum8JL30k9Bo2pEfRQ
         jApasIRToxI59dbCHkNtIq6GMhkMZmpVv5HFp5lSb3dqfVIj/cvBC4gs36fmKUrc4sVL
         u6eOQjoZjVhcJHjh4ivqBrD4kmk74Drr/obPu0syz0i7nlcZF3plyjY/1Ntq+/RCOVHE
         v11qZFhotcTGq6vn+dKxuCR7H/OHGPPk5rs4HZB4mLNeJyY9+NR2v6+/heM6sc2GoYy5
         OiyQ==
X-Forwarded-Encrypted: i=1; AL+hErFQk7o74vZfpBp5grMa+X4ajaQhwOZfsxtTXdDQqMNSyPMZaNb42rup3FbEd6y0QXLwaV/3eGptznd+CcV2g/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yhvFvfQgddqUQfvIz6PJi1cn9psFc87zT11xi7HTLvbMq0peo
	fYitfX03sWPao5rWHs8Vs+FbqdBauO1Tp996DMng+FjZfVpwOB3BRk5IqomhCyQQ5l2gLLiamfr
	PhC/Xnf127PddOZEPV25ngyoCtpefLr682YMaTc9UkdLm8zqvcH6CI5s1rrKuVRdmC6c+sg==
X-Gm-Gg: AZFdTZcZXsV9XKYi1mUVIlpDcb7p/eFE5s3oyBO7fLszzAnTfCI8ca1rwiYTtsq0gpF
	A3xDO5vhh4+94Y4tu5dnSnurrOqCsbdKXX56NiiREKWfETkOr1SkRb/ewyokGO/FvfVa1OSTt4Q
	kCwsweRJKZw+JwQp/Eb2nWb3uSUsyBmn5igjA6j+euLDfBUIC+y0632OODVqDyCRMUqCFTDLVSE
	nPlwMOLB0iPCMMKoMH4YImvXG6U9+LBef4U3B7WrF/JlXs7HbqnD5+c2CZ6tb/k8ezFgpkyKIDB
	4Aat3p+Dr+VO+zrOLUBcyR7T5N9pIwLgmaz+meeXsjVEAsbECgquD09VCpRXuHNZuBV24p6LvMB
	Gj19reIJJxf0cFXEIKRwx/orJYifrr47WpVQUH2YCyt2W5xAntRgsIvjMjyk6cLp0JPqz33G8i9
	Zn5t39L6gULC3Obosi415WvkYWcGje+AVVY7uQI5HSg+zu
X-Received: by 2002:a05:6000:430b:b0:4a7:790c:4a34 with SMTP id ffacd0b85a97d-4a7790c4b13mr8112473f8f.20.1795077090553;
        Thu, 19 Nov 2026 00:31:30 -0800 (PST)
X-Received: by 2002:a05:6000:430b:b0:4a7:790c:4a34 with SMTP id ffacd0b85a97d-4a7790c4b13mr8112361f8f.20.1795077089781;
        Thu, 19 Nov 2026 00:31:29 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm9141506f8f.18.2026.11.19.00.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 00:31:29 -0800 (PST)
Message-ID: <d0caebc6-07c0-4372-aaee-017cf22ef00a@redhat.com>
Date: Thu, 19 Nov 2026 09:31:25 +0100
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
Subject: Re: [PATCH net-next v2 11/11] selftests: net: tx_extra_headroom: test
 the veth attribute
To: Tianyi Gao <tianyi@cloudflare.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 David Keogh <dkeogh@amazon.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, David Woodhouse
 <dwmw2@infradead.org>, Dragos Tatulea <dtatulea@nvidia.com>,
 Nimrod Oren <noren@nvidia.com>, Alasdair McWilliam <alasdair@mcwilliam.dev>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Magnus Karlsson <magnus.karlsson@intel.com>, David Ahern
 <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Alexei Starovoitov <ast@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Donald Hunter <donald.hunter@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Breno Leitao <leitao@debian.org>,
 =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>,
 Danielle Ratson <danieller@nvidia.com>, Kuniyuki Iwashima
 <kuniyu@google.com>, bpf@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com,
 nh-open-source@amazon.com, Stephen Hemminger <stephen@networkplumber.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Remy D. Farley" <one-d-wide@protonmail.com>,
 Amery Hung <ameryhung@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Andy Roulin <aroulin@nvidia.com>,
 Anil Kaushik <anilkaushikwireless@gmail.com>,
 Demos Ra <demosthenes.ra@gmail.com>, Eduard Zingerman <eddyz87@gmail.com>,
 Emil Tsalapatis <emil@etsalapatis.com>, Hangbin Liu <hangbin.liu@linux.dev>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 Jiayuan Chen <jiayuan.chen@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Joe Damato <joe@dama.to>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Li RongQing <lirongqing@baidu.com>, Louis Scalbert
 <louis.scalbert@6wind.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Martin Karsten <mkarsten@uwaterloo.ca>,
 Matt Bobrowski <mattbobrowski@google.com>,
 Michael Bommarito <michael.bommarito@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>, Runyu Xiao
 <runyu.xiao@seu.edu.cn>, Song Liu <song@kernel.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Wang Zhan <wang.zhan@smartx.com>,
 Yonghong Song <yonghong.song@linux.dev>, Zhou Qiuyue <n0ps1edzz@gmail.com>,
 Tianyi Gao <tianyi.gao@linux.dev>
References: <20261119013830.36935-1-tianyi@cloudflare.com>
 <20261119013830.36935-12-tianyi@cloudflare.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119013830.36935-12-tianyi@cloudflare.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 02:38, Tianyi Gao wrote:
> Create a veth pair with VETH_INFO_TX_EXTRA_HEADROOM set to 64 bytes
> through YNL and move the peer to another netns. Check that both ends
> report 64, and that tx_extra_headroom of the sending end is 64. With XDP
> on the peer it is 64 + 256, because the two values are added. Also check
> that a value above 512 is rejected.
> 
> The helpers leave the RtnlFamily socket to garbage collection, as
> link_netns.py does.
> 
> Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
Self-tests are failing:

# selftests: net: tx_extra_headroom.py
# 0.06 [+0.06] TAP version 13
# 0.06 [+0.00] 1..20
# 0.15 [+0.09] # Exception| Traceback (most recent call last):
# 0.16 [+0.00] # Exception|   File "/srv/vmksft/testing/wt-1/tools/testing/selftests/net/lib/py/ksft.py", line 440, in ksft_run
# 0.17 [+0.01] # Exception|     func(*args)
# 0.17 [+0.00] # Exception|     ~~~~^^^^^^^
# 0.17 [+0.00] # Exception|   File "/srv/vmksft/testing/wt-1/tools/testing/selftests/net/./tx_extra_headroom.py", line 195, in test_peer_xdp
# 0.18 [+0.01] # Exception|     map_id = _load_progs()
# 0.18 [+0.00] # Exception|   File "/srv/vmksft/testing/wt-1/tools/testing/selftests/net/./tx_extra_headroom.py", line 83, in _load_progs
# 0.19 [+0.01] # Exception|     bpftool(f"prog loadall {BPF_OBJ} {PIN_DIR}")
# 0.20 [+0.00] # Exception|     ~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# 0.20 [+0.00] # Exception|   File "/srv/vmksft/testing/wt-1/tools/testing/selftests/net/lib/py/utils.py", line 259, in bpftool
# 0.21 [+0.01] # Exception|     return tool('bpftool', args, json=json, ns=ns, host=host)
# 0.22 [+0.01] # Exception|   File "/srv/vmksft/testing/wt-1/tools/testing/selftests/net/lib/py/utils.py", line 252, in tool
# 0.23 [+0.01] # Exception|     cmd_obj = cmd(cmd_str, ns=ns, host=host)
# 0.23 [+0.00] # Exception|   File "/srv/vmksft/testing/wt-1/tools/testing/selftests/net/lib/py/utils.py", line 101, in __init__
# 0.24 [+0.01] # Exception|     self.process(terminate=False, fail=fail, expect_fail=expect_fail,
# 0.25 [+0.01] # Exception|     ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# 0.25 [+0.01] # Exception|                  timeout=timeout)
# 0.26 [+0.00] # Exception|                  ^^^^^^^^^^^^^^^^
# 0.26 [+0.00] # Exception|   File "/srv/vmksft/testing/wt-1/tools/testing/selftests/net/lib/py/utils.py", line 134, in process
# 0.27 [+0.01] # Exception|     raise CmdExitFailure("Command failed", self)
# 0.27 [+0.00] # Exception| lib.py.utils.CmdExitFailure: Command failed
# 0.28 [+0.00] # Exception| CMD: bpftool prog loadall /srv/vmksft/testing/wt-1/tools/testing/selftests/net/tx_extra_headroom.bpf.o /sys/fs/bpf/tx_extra_headroom
# 0.29 [+0.01] # Exception|   EXIT: 255
# 0.29 [+0.00] # Exception|   STDERR: Error: failed to create dir '/sys/fs/bpf/tx_extra_headroom': No such file or directory
# 0.30 [+0.01] # Exception|

full log here:

https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net/results/917806/169-tx-extra-headroom-py/stdout

I'm dropping the series from PW, please wait for AI review feedback before resubmit.

/P

