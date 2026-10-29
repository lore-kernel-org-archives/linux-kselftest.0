Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269909;
	b=HRk9vPjZ6M+dZ77eqJX4RGB73O/JWPnrMGNw0hdrIT01Dd6bDT+o76b5bfsZBGNKqqew
	 1YgAXn0s88CBQ+LoW2noPoyq4rZMk/cFMVMELwq69K8z+oR9MUffPCZ4GI7F5z9m9Zaaz
	 y1ktBfguR1rfskOH9P11W1EgQYipqYd0LvNki54pqcI7lBm/9YbmkN7421kDWCTqmHWWd
	 hNxDvqKigB3uLCTosEW7o5kFjJrDXq/OwJUvf9NqAIJUD5th4rJgu0uZl/8eGPRP2Dv5N
	 OIp7zTg00BqvM6wmVMQg/PIqGxKVtKVfgWNM/QQMuSVnyz5iZ8oJDn5ynDKHOUAeqrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269909;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mLFZ+u8l7Eri5WPSJSqe9fz8wKmk1PQzwwX61Xl/bQo=;
	b=ENoL85g+KTQ45U3GNrHkI7HWsJoO4LAP+p0ulVLIcCaGNmZ+hKQV8titg69jD18pKFiC
	 d5nz17oqa0GSu+VtHJ1z3oJI68+OC8QOvvWuAzSO2/2NWB411XM5BmU2Un0k5/bA4IrC2
	 m7ArkWmqAzTY3SNv4OtJMja9C0xwEaasMaHTHO3mvWdQMmdHLL5gBiF31MuwCOnH4sZtU
	 3wOP+cxK8HS0XzxY3C0oYfFGBz9cOs78lgVUD8qKVwsatAW5jVB6Euau44gqS1iG2O4ch
	 1331fyh93affAtHOWRCeCmv3qqn9IjgoQ1JVa0sJPmkLU9cgNYTPTN2f1ue3GhN1l4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RdwL51U8;
	arc=none smtp.remote-ip=91.218.175.44
Received: from mta0.migadu.com (out-44.mta0.migadu.com [91.218.175.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF5A606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 10:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EF5A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RdwL51U8
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Om9Am+J4+0DDvLnms/qpKuDS8xUS8M7eIZtxz9T8uWw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793269906; v=1; x=1793874706;
 b=RdwL51U8e46cWyYi24EFJGB8T6DhuT1LTml+FR4gi9BJMjlJY24SkGZdaF21sbmcyviZ+YLf
 MHy91lCZWYmFMP/q8M8cbY7UKdl4oYXPtR3GPqU4KL7QjsXfdwrC4xaAEXx94eu7Crha4HdMvKW
 djJEBWQygmhV4NA00wmYmiFA=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4ba3fd5e8dd1c890;
	Thu, 29 Oct 2026 10:31:46 +0000
X-Mizu-Trace-ID: 4ba3fd5e8dd1c890
X-Migadu-Flow: FLOW_OUT
Message-ID: <7004a360-ac39-4a2b-8727-972414e006c6@linux.dev>
Date: Thu, 29 Oct 2026 18:31:36 +0800
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
Cc: cui.tao@linux.dev, josef@toxicopanda.com, axboe@kernel.dk,
 cgroups@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, andrii@kernel.org,
 eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 linux-kselftest@vger.kernel.org, cuitao@kylinos.cn, ameryhung@gmail.com,
 alexei.starovoitov@gmail.com
Subject: Re: [PATCH 4/5] blk-iocost: add iocost_ioc_tick tracepoint for
 per-period device summary
To: Tejun Heo <tj@kernel.org>
References: <20261028143534.135968-1-cui.tao@linux.dev>
 <20261028143534.135968-5-cui.tao@linux.dev>
 <75384a99148fbd477e003453718b1717@kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <75384a99148fbd477e003453718b1717@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Tejun,

在 2026/10/29 04:09, Tejun Heo 写道:
> Hello, Tao.
> 
> On Wed, Oct 28, 2026 at 10:35:33PM +0800, Tao Cui wrote:
>>  		u64 vdone, vtime, usage_us;
>>  		u32 hw_active, hw_inuse;
>>
>> +		nr_active++;
> 
> nr_active is counted even when the tracepoint is disabled.
> 
Right. I'll only count nr_active when trace_iocost_ioc_tick_enabled()
is true.

>> +	/*
>> +	 * Everything the tick reports is final here: busy_level was just
>> +	 * computed, cur_period hasn't changed, nr_active and usage_us_sum are
>> +	 * complete, and vrate and period_us still hold the values this period
>> +	 * ran in. usage is wall time over wall time, summed over iocgs, and is
> 
> An io.cost.qos write in the middle of a period changes both period_us
> and vrate.
> 
Right. I'll update the comment and the commit message to say that the
emission point has busy_level, cur_period, nr_active and
usage_us_sum complete, while vrate and period_us may already reflect a
later io.cost.qos update.

Thanks,
Tao

> Thanks.
> 
> --
> tejun

