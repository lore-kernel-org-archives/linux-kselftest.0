Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294156;
	b=TgbeU1gyNy1Y7To0jRoTIpu4i1fzKSrL7Nf3QZDiw+5Z9isvyDUSSd+6ZogD0lXz/lZd
	 2ODPxcitWx4T2sRxoa/Ck9gevXm5wS4Yw+MYPLRzeZ5phzV/V1zgqKJy1nM39f7KOfeA/
	 pqb0PcYWkdMnu984Pf2aN3a7HsbmmOKVZKRETUrJO/mxixA8/VKC07wLWX6fc+nMVCw8P
	 WYvbAavYMuBztFT8RWaYN/FRgKzW04/l0saLZW/gSNnureDKLL+u3vECt6F3lcfSgbpAb
	 luFNsjTHdOMBrxXFA6VW6NqdITEBXY+vbvPPJmssTbC4e4JGQBbUfAdSa/YYDHgMfkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=4AC+76/KQ+QerS0vbEfd85krwo5e3I+GiqoZ0yXri7Q=;
	b=OFP4v6JxHUprowUNfth2QQ1PvLwbgzdJLK3PnXrgML9pl43+YTCapW4I7NGKUWnVk1eK
	 9V7ZqBsW5o/CVrjtrcQypbyoiT0OTiASsWyKmP54xjit/eZjq6qlFOWLn54L8YF62Ee3l
	 QX+F7cA8xHVQrQLKlvOPqrTSws7NRM0rrQStv4f3nmIgFV3bXhFkPi48pcL2UprSBo5+W
	 wk16iN1TJbtIrqW+pAs0hATVYXlXUwNejbDD2Om288EH7f86+xfo7KdRXUR5ya9ZGOpPr
	 tGtWVNJuMLGKfjgOO2mZOcSVjeDuEcnVtW0OIMiX2lxIvmhG56V0W4FFCVPuz59Niow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=dT11O6tJ;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0112606A31F
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 17:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0112606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=dT11O6tJ
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso1519964a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 10:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793294155; x=1793898955; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4AC+76/KQ+QerS0vbEfd85krwo5e3I+GiqoZ0yXri7Q=;
        b=dT11O6tJyExylRrs1nXl3/kAWbLocR/Q3wbKp6eWfFGOl5xbvupjbb7NLG1DxBS4kR
         7CZlnnngeHVGtjQ+MGsUgPRdXjy4FoMlT92COUAEAu0lBmC13ZRVYTaNNHG8pHSklvMv
         oGPPeTCk1PYZuV7eUY1ZVoqclYUFxAJ2al2s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294155; x=1793898955;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AC+76/KQ+QerS0vbEfd85krwo5e3I+GiqoZ0yXri7Q=;
        b=an3arUmNw+jNazlSYyc03IbDRJ9PVOONmTdGwjKxIrf8deDMMgOQb1AcSywQDgzLtB
         4+oX7f8UM4F2YqB6uoadzWMiic9q87WCgKn42xZz6jQzP+KJa4rvQxrOc7U41PuhiyJC
         kcnB3aPtkaLVwmHu4d87pWG2ue2xEVEu4Ut23QYaIaeh5hbmrODjNAdpnEae/90jPhKt
         XdiQdCKfUdSNQR94R1KGHZgxusCiipxZlkPA2XmCO8GLvznX7wfKzoV3hSOHVO2R61Jo
         FRq3osfFoS2MgJjUzJggagNCwSGNObncRmGb9nClHgejH1HcFT4Orvy8WQTd7cQCb9T5
         sBbg==
X-Forwarded-Encrypted: i=1; AKwUvBwt4FDA82gDpZGe/SXy5Awu3MjTn0TDxAiV56QeTvm0mcg4oopzJmysRpIeNEeFs4G6bonLXaXXXACOFKyp0tU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFKxp8Z1A1M8tJaMh9v7BZYBJ7HJyH6BhsOxhbhmh2mNTHBkQ7
	zo94EKJkENlPs1ajPYxR8JCYP9vBHdFvLCAZzy9IfWp4uKox4PG81STZfENPCDXbDd4=
X-Gm-Gg: AYBFou0lI1+ZtReKXJk60lb66F1yjGyzhlxWCnyLaoaR78hevAb+WjhsuNEYqp+tOWS
	G0mGRXrEuJApCqf0iQEQWumcsyLfBjtU35ojewNwKSEgM1eRUpYKQV/gVIVRfpxWGqB8EL1itdA
	uVI4QoOnR2wkpTV697+GfL4IuTsdcKlCxF8seP7keEjMenFCptHyMgnTWC7AriZGMtnUQofHdH1
	xUyuOKz3PkmT6ktrwstvoI3XxYHbZS3Slghfb8+Cc0Oge5IoCKAD1toXZYPzlaWK6oLGvr66XB2
	s35z9by3tqMSGgamfTGkkPDgXp/yqgoZvfM6fnj9arg9fbbz+2nl3qxD5ONTkhicqO98FayFNyP
	Sw73OfM0bDRVHdGs9cY/ylP021YegrHScCXjJUxTtbxNiQNpl2HAO16F6+sUY53sOdNJJFYIY8K
	MiZJgFvCD0s1gNJ1frkyGaW54jaJ/iAWHtgIBCVUVmaxhQ3fVSduK0RxeQJWt/KQnoAZPBAEfeJ
	YHEe/ggPzd2PkxDpQ9Q6sohtJHGX3hz5RpxKzLs+5oBNne3b1HyY+DGF9UqCce8AQglWL1/rsW7
	arRwOIv3eTULgt15wfuS5bc3nrSZKoVudAaY6W8CcCOh84BoDa3pkN9dbcj1Ruzv2fIqsOa5EuM
	qjEhXMMav4862gFI/YDvQKVo98w3rP9p09uZq111yrHTlG2DrR+frqQ4JqaDSeUPhNG4ysgfi
X-Received: by 2002:a17:90b:3c43:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3ae57f95afcmr4290753a91.16.1793294155121;
        Thu, 29 Oct 2026 10:15:55 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85e567ecsm64167a91.3.2026.10.29.10.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:15:54 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:15:51 +0800
From: Chris Down <chris@chrisdown.name>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Mykyta Yatsenko <yatsenko@meta.com>, Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf 0/2] bpf: Gate dynptr probe-read kfuncs like helpers
Message-ID: <auN_R9gCBqNwEkKV@chrisdown.name>
References: <20260615-f01-07-dynptr-probe-read-cap-v1-0-e626cd61a381@mails.tsinghua.edu.cn>
 <DJ9QOWVIXFHR.1S8UL5H0USVCB@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJ9QOWVIXFHR.1S8UL5H0USVCB@gmail.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hey Alexei,

Alexei Starovoitov writes:
> It's fine as-is. Won't fix.

Could you expand a bit on the lockdown side of this? I ran into the same 
discrepancy independently and was preparing fixes until I found this thread 
while looking for prior discussion.

The CAP_PERFMON side is now covered by 81c975aae375 ("bpf: Require CAP_PERFMON 
for kfuncs reading memory"), but the probe_read_kernel helpers still check 
LOCKDOWN_BPF_READ_KERNEL while the matching dynptr kfuncs don't. Is that 
intentional?

I also checked bpf_rdonly_cast() plus typed loads, which can still read kernel 
memory in that mode, so I can see why just gating the two dynptr kfuncs 
wouldn't give us a consistent boundary. I'm less clear on whether that's the 
reason for leaving them alone or there's some other reason.

Thanks,

Chris
