Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540932;
	b=MzsJQGCGsxtdiDIWoouUf7ZgkZM8Kl9WnP+v6QMhhlFxUoFx1mCSgstShTskx5wR89KR
	 a5BEx+V1rrupF+bW3qm16kGyVjUPvnD0Q0tC3g3alAlc7scyG0D5w1SGuazzXHZi0tcwp
	 gmU6vHIkPE5YJ/Jsiz9DZU4bl1KZy1UO4uzSdXAszpNdNG35ptzi5r6H0ptKCOcfbeixC
	 T15WMbI/Sc9AB32G0NmuP5fIZLI6aV5mIyxi3euj50Ip1swuzqrAZZ0YVmvD/rnFYLV1x
	 +HqgFoa2+ONOQ9RMNS3a2q7Tte3tCTfvBlpIGkgR4yFp9Z/8obct67/IXqLSJUu+7Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=0Sjn0SBxkFVS93olNVmryUIhxh3i95NSdeHhlcsU76k=;
	b=t09Mr1yBgXJ5EudZBr71yytINuZdj9Hvk5kiTbCE0V3CK/7PVG823GCxiAm2rL0N4gQK
	 YFAilBjQaa+rY7pt13B6yM9WD+8Cy9PFzopJs8Y9NGlkSHRocNSlXvr20K5hsSmU0Ismx
	 I9ZkFw9+zACFQMpc173xcIEoOU/U+lGPcu/n52mlLSjrZaVcmWU6eDj2hKw6LGa6CIYxc
	 sEbAQeJR2idpsW48kDWK3wSTd2hkdSWVFGATQdE4TF7rcAoaNc2KyeS+Kkiwitvc9LBuX
	 J5efUEG2G1HnZTvxBLxk3lyYW452Y8MJHnVhjGmgzhitl5ngLWWBPnkA8sTkc5tfAZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jx1UBEEX;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115A5606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 00:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 115A5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jx1UBEEX
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so97685a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 17:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792540931; x=1793145731; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Sjn0SBxkFVS93olNVmryUIhxh3i95NSdeHhlcsU76k=;
        b=Jx1UBEEXHx6Oxwwq3C+Ozk6aZBesuBt1JF9Acfs7Sqc85fhjRuuTPa0DI14ykGtP7u
         z6y7XjtyC65SxC60AjvrqvzpdzMLLSaNqp4cHP5cL1Z6kw/nS6JL4a3l7fhQYoMoPLuv
         k+h3yLDgjr3marUDfgTWNRXQOIwqnl3hOe19U5txNfWf9uKMsZld9oZmEmSgghSSDOkd
         k5hbdrtzZXwPFjNzjrHq+RdinmezTPRybN3V8LJGDMbuBo65rU9mbMlBz9zO53E6sI8x
         czAiQI1UnJzeshMQ91MrXryaPdKetz1ANCjYbdq40Wtl1PPtrixVbjyrn0hmOAiLbvAp
         krKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540931; x=1793145731;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Sjn0SBxkFVS93olNVmryUIhxh3i95NSdeHhlcsU76k=;
        b=1ur14UY/9/KU29ozQX1U5DPuGH5sNtZzkiCAagbr+69OJlbhLC2p1ok2V1OFDRw809
         0aRrxZAlTPINbGYPQjkWAOsSsIlZq4efxgyOAQTqJC4ArrSrRifoejUykRp0YxRDmWcp
         QQn9BcBEzV5mhvdqtARw1/ZEHeqjkULSvGNXopLuWZLhfQOPteky7ot2M6D4p8PXW/mK
         1KdXiIvpy1DUfZUGWVN2LsEKqYinXW5xDxtw64mR4CxFYg64SHD2shdcndZ9i+M/qUh0
         24VHxJ+cnBQann9yAfh2gVqAJIVglWcHUjSmfXSqzTbybvoX7cwuZOMBOxHwLQ4NCTNR
         CslQ==
X-Forwarded-Encrypted: i=1; AKwUvByxAVXH2P6j61uIDd/wPrJVq+G54U8BmfrKaQm7MFHcyg542tzZme/rDLIDx0w4q1EI5HG6KadmnBHKt6StZhM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvqVEYONMdt7zXeB864iwmtpGas5yvlat9HB/1/gjsJ+sfUleO
	5GJl8wAqtN1RAzxEQfHW8MV/C649wRDDOA7CfratkJXjDCOdw3+3UxJg
X-Gm-Gg: AYBFou0iJvAbWLn5vFRGDTaSpYyDfB2eCB0irUDzxbUZnPZAqJ53I/IbFtrjKcwsacs
	ca9A+bntEkg+yhT2coVWrIac1hohaR0wGgTEEQRJFyHN08bwlNPNLKyQ6zf9ecGZAGl753F72lR
	iehgE2eaKli0LQ2RZvGJ8kG0ZDg+K/Tt/0J250nRV4qkCdGxy/4vdF/HJeUCNeyhgH7fozUZncW
	ETd08xMXK/5DslCws0nRfV1pBJlXfaB3z10y8ZPP1KZPHRKtUI+Hsu3K6P71H0xk84WI3OFdDT+
	h/7qUD/2zyLjnQfS+6WOIQ84rRdFPc7Byyh/oGC6YYDWXLnX8z/8QSD9DOkxYv43xMMXLhNoMyK
	66sqRVOV4OV0+atrS/i2IqxGwVPclqnYePn/I6jUwEVRwYUQ3dWRwMg+YN/geBlcPwLUwPOJhgF
	sNpLtB+qNFOSNt9DxlOcwnPT1qGVMU/i1dxkf9wdgCCBiw24SA4069bhahFv2x8rv/mVTdBXWTe
	+mq7O2hXYwKDEZxkHpUk039RS+qa9F7IFjXSZFu6yb9C0ngm0K1ALgLMXR3TWUmcrP3dANqg7iz
	ni/kxtbucXBStjvM5QattQosvGnqrItadVxG8m9OZ0uqtBapVfeeCqRFiRC66Q==
X-Received: by 2002:a17:90b:164b:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3ad86c2e5e0mr406559a91.5.1792540931285;
        Tue, 20 Oct 2026 17:02:11 -0700 (PDT)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad802957d3sm1538729a91.8.2026.10.20.17.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 17:02:06 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:02:04 +0000
Message-Id: <DMA2Q4DGMWPS.33II3DPA4RW0L@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: Wait until the .data map of
 test_mmap is freed
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <20261009-selftests-bpf-mmap-wait-map-free-v1-1-96d066daea2d@gmail.com>
References: <20261009-selftests-bpf-mmap-wait-map-free-v1-1-96d066daea2d@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Oct 08, 2026 at 06:49 PM Qiliang Yuan <odys.yuan@gmail.com> wrote:
> The map goes away only when the program that uses it is freed, which
> happens in a work item after an RCU grace period. With other tests
> running in parallel, that can take longer than the polling, and the
> test still gets an FD for the map ID.

Pls include the output of the failed run, the number of workers
and whether it's a debug kernel.
It's not one GP. sys_enter is a faultable tracepoint.
bpf_link_free() does call_rcu_tasks_trace() and only then
bpf_link_dealloc() drops the prog.
Then call_rcu() in __bpf_prog_put_noref() and then the work.
Also test_mmap has no .data map. It's data_map.

> Poll until the map ID is gone. The watchdog of test_progs kills the
> test if the map is never freed.

It doesn't.
watchdog_timer_func() does pthread_kill(SIGSEGV) once.
The timer is not re-armed after that.
crash_handler() prints the backtrace and returns.
Nothing faulted, so the thread goes back to where it was.
That helps when a test is stuck in a syscall. It gets EINTR.
Here usleep() returns and the loop keeps going.
If the kernel leaks the map the test spins forever instead of
failing with get_map_by_id_after.

> -	for (i = 0; i < 10000; i++) {
> +	while (true) {

The get_map_by_id_after check below is dead code after this change.
Keep the loop bounded.
See wait_for_map_free() in tramp_prog_detach.c. It waits up to 10 sec.

pw-bot: cr
