Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB4236606E
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 20:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784923686; cv=none; b=oZHGedUIhUhRrHSqqf0Ow05FxIQP/1HlXoJu0QJxzd5Kf6psiPM7RIYEoVLeeBnF+h/0yjl0KZCO+j+hPEeMiodPp6GLUL6BUz4jgzyERwmUJs95GnoF4kj+r/XGtsh/6LGL24QHUcaXPTvmIoaQKhNbfLA4ars4sQgRQfCGxGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784923686; c=relaxed/simple;
	bh=wX4I6Dfzp93lSyZAYfoSIleT1I4i+PipdvLdjOkhJ/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ur/R2xr7rDyATmaIMS7sknBPzaMeVbBTxt0XTf6vxjAKSMYgw7rS14Udzdqc3qlmHujRatKQELLueEsuaIUChy3wj/kCOAcKrEUuRlSz3EIlWsHJhnO9YRsaXEAzqsaFRarnPTro+YEgl1YzcFhFWthjcpgPI7+aUrHWqHHeXtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pu7n96sn; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pu7n96sn"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caed617615so10421875ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 13:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784923684; x=1785528484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dngUR+OUc51gH6Pdf9Yi2Pvl5lH9bjGurLfcThPdqgU=;
        b=Pu7n96snZOMg4BaizPvl9h5JmRGYfXRbRavGrTJc/+SSWWn0WeIXO+LvkABai4vDSy
         O3mMWALXaUO3ivbwJNty7vK+E5SUh21JC0ojOhTkBSFH9a2YGnQWoeCdMsXQT6NpGrba
         8BSm30HKxZgrXx+cp3M+NiDpvIVynB1YWB0pXRNXGGcxCapuMl3tRTPJVOiYlEFuANC7
         CByRgHPzL8V62edJrp4yJDOZ1N0kP24fkJxN3U5t8oW6XBCXNp9/V1dZwdnszKOrc0K/
         h1OEaXNesHkvvej5eEJkrcuwSh8v5oGJPASAswMfsGRfS3Uc5SaWctb30eQ3/1p7+00U
         VMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784923684; x=1785528484;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dngUR+OUc51gH6Pdf9Yi2Pvl5lH9bjGurLfcThPdqgU=;
        b=Oep8ulWLkwkpU9i4HA41uOU1DqVd8/xo2qwqRwP+l5egC85XK+qrXHBvMHQpXfFk7y
         LiDOPwn0riTpEqSeO2gEjXoDUg5we3tElB5MMBTbk2nJWpM7RxcKQ91TSLXqr1xk2rhF
         uNEnm9B9aV/PRCQI6PcIK9cjRIPWt/HcVsAqvznmPyLa6wAX9iSnCSOn7i9YUNRXR1fB
         btKvC9Kn2K5IClYveljQIOE8beOP/8nVoBOhbAQpU6yHfrHOOK/9O0/Agsd75mgwAqB0
         9e0zzopQSWCfQjnYACXiU2/o2A0/jOlSyAYvqBH+TIaorUi29rjvzH0/bImzNsM7+l2A
         VO0Q==
X-Forwarded-Encrypted: i=1; AHgh+RoRIURMuqsq1FH+dNy7kL6V8hFmPm5bGOeQQhGr1ibBVFgoZSoP8F6jgmWtYfghoKeyPKLXUBkSrpOTRd9n8mA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhtQuhHtcJhkUn4eeWiIbnRagV2l836rteGE0NIO5GZrhTw2SO
	OMFHEOl2BM5y2fMAQeo9COl9MuAYHt96981/8kef9sLB3iBNWdU9dMuG
X-Gm-Gg: AR+sD10wFw2uehqpSC6cXqKHnj6gtwwiO6jCEKVMEoAHeQ+Q1Vxdr7rIbDBEZDq5r21
	EsnuEpk4p+VpBWIz6J7ni+ZGNb4ogicaoqqq2AAlCcTI9AQor2kajO8stl+5I08XfNjhSweHCjg
	bzXM99q3QY6AEuHoyQCtahMq97V6gzLXbiUnTpbb7qfssOqIRGIoIb0aumpqpaQ+wg9f8GVU5mr
	rxguxCy1gKVE8y/5BIMJlTbUr/1zWWI02OFg/wm2xOiBt+dfOcULZgkaXjuajUd9HAQnQnaBG/u
	0Y9gOqrDyjJYGt3FKLNcoFWbGGLapUSOtZ3xZo2uBKW4HH9FMMmRUZ73tea1LNiXnEoRD4/P+CQ
	rpGEfS7Hv8iQOviCv/pr4e9ojzq79AK6xWe2fOaV55MmxureXjKTFcAqIj+gjPR7rB3ZtZqg/Af
	ZNU0GMKEIFiBmMkf/Vo7xYH3W9OIJuprMwNkDbet2hb+s1NUBKAftqJQ==
X-Received: by 2002:a05:6a20:43a7:b0:3c3:7cfe:b337 with SMTP id adf61e73a8af0-3c44b063445mr8875586637.30.1784923684144;
        Fri, 24 Jul 2026 13:08:04 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1151:15:c56:221b:35d5:85f? ([2620:10d:c090:500::6:6d67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5cb670sm2895912eec.31.2026.07.24.13.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 13:08:03 -0700 (PDT)
Message-ID: <01440106-92f0-4a4e-aef2-da2520820126@gmail.com>
Date: Fri, 24 Jul 2026 13:08:03 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next V3] selftests: drv-net: Test queue stall upon
 reconfig
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260723234857.2880270-1-mohsin.bashr@gmail.com>
 <20260724063744.7d0478da@kernel.org>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <20260724063744.7d0478da@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/24/26 6:37 AM, Jakub Kicinski wrote:
> On Thu, 23 Jul 2026 16:48:55 -0700 Mohsin Bashir wrote:
>> Add a reconfig_tx_stall test that detects the possibility of a TX stall
>> after ring reconfiguration. The key observation is that drivers using
>> netif_tx_start_all_queues() are prone to experiencing a stall when
>> reconfiguration completes compared to drivers using
>> netif_tx_wake_all_queues(). start_all_queues only clears DRV_XOFF, while
>> wake_all_queues also calls __netif_schedule() to kick the qdisc. Without
>> the kick, qdisc backlog present at reconfig time can stay stuck until a
>> new trigger is issued.
> 
> AI CI says:
> 
> The new `reconfig_tx_stall` test introduced by this patch is failing in
> the NIPA CI on the netdevsim-based test environment (both regular and
> debug kernels):
> 
>    not ok 3 ring_reconfig.reconfig_tx_stall
> 
>    Exception|   File ".../ring_reconfig.py", line 331, in reconfig_tx_stall
>    Exception|     raise KsftFailEx("failed to build qdisc backlog")
> 
> The failure is a precondition failure — the test sends three bursts of
> 128 SO_TXTIME packets at +100ms, +200ms, and +500ms delays and after each
> burst checks whether a qdisc backlog has formed on the target TX queue.
> No backlog appears after any of the three attempts.
> 
> The test never reaches the actual ring-reconfig assertion; it fails
> because the required qdisc backlog cannot be built on netdevsim under CI
> conditions. This is likely because netdevsim drains its TX rings
> (and/or releases SO_TXTIME packets) fast enough that no backlog
> accumulates within the allotted windows, even with napi_defer_hard_irqs
> set to 100 and the ring capped at 64 entries.
> 
> The other two sub-tests (ring_reconfig.channels and
> ring_reconfig.ringparam) continue to pass.
> 
> Could you look into why the backlog-building phase does not work on
> netdevsim? Possible approaches:
>   - Add a check/xfail if the backlog cannot be built after N attempts,
>     converting it from a hard failure to a xfail on virtual drivers
>     (prefer xfail over skip)

Yeah, looks like netdevsim is not providing back-pressure on the TX 
path. I will change the fail to xfail in V4.

>   - Adjust the parameters (ring size, packet count, delay) so the
>     condition is more reliably triggered
>   - Mark the test as requiring a real NIC (nsim_test=False) if the
>     technique fundamentally doesn't work on virtual devices
>     and move it to the hw/ directory
> 
> https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net-drv/results/747522/8-ring-reconfig-py/stdout
