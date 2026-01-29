Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E307E2F618F
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702630; cv=none; b=Ih1kIUQrS5yXMvvCcNA2B0IlIR7Q7z94DroO5ac3RkdlrfMlWOYi9A6IUx4RaWQTHKV5NlqMQYp38ewuZHHMaAb7CIL/wLnEQEOxf05kD7J5uxS4gaDTR7no3OxEuXhMoEBI4haIRwjqn6SAGzYHB82F4mWn1T6+lsc/noCYk9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702630; c=relaxed/simple;
	bh=quYSss9v6f8I6LeTACJT69lZwqGMuQmT80vC5vK83CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfxXVaxmHw/M+qxboG6g1b+cDtll2haFlWxJB4WXrtCCjjRw7ipVfGp0VZu9a9ALOIGF5N0juRJ3JNR01hnwykD4rMLc87UUHjBsbkkqpKcjILTyec0dwtH2xBoBReRHJVcAhhUf9/7jDjoJnyn8zEje3hWsGx/dsTYi7RenXtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=c0FyZ67W; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="c0FyZ67W"
Message-ID: <9d845ebd-2d1f-4f98-9284-a1714676d33e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769702616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=quYSss9v6f8I6LeTACJT69lZwqGMuQmT80vC5vK83CU=;
	b=c0FyZ67Wjr+PcRvLU9ZvUe80W+7UEhsHSN/WVtZk36MfX+UYQDvjgSL1xd9ve9iAdOB1+y
	UX/vIwVW8IVfWUR92N4fUM08LTW6cQGByiaae+T4iyUBEWYFvMYRQk7C3b53W0Y/S718nP
	eoUagPk49n8MHML+17hoyxhHUT/DL2s=
Date: Thu, 29 Jan 2026 08:03:23 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] selftests/bpf: Return -1 from
 get_preempt_count() for unsupported architecture
Content-Language: en-GB
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
 andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 martin.lau@linux.dev, song@kernel.org, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org
References: <20260129050949.157410-1-skb99@linux.ibm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260129050949.157410-1-skb99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 1/28/26 9:09 PM, Saket Kumar Bhaskar wrote:
> Make get_preempt_count() to return -1 for unsupported
> architectures instead of 0, so callers can distinguish not supported
> from a valid preempt_count of 0.
>
> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>

LGTM.

Acked-by: Yonghong Song <yonghong.song@linux.dev>

