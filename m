Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00E632AADC
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699537; cv=none; b=Sghv4wXmNcNozAa+LEJ5Rz9Mz6Kmlw1+3mhrTHrK1WAE0bVsO49RsUht2TMeFuS/wheS7qeKKp1RwDYYfwLqcKQeSln/blP3IdHub7bhDa2BrG1QJ2ToUpm9ERPxmvlk0Bu0Ial5BdC0XjDHz/l9YtB7jXynSC6FpS7aadShZGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699537; c=relaxed/simple;
	bh=055uktPBT992k6H9Q5EGRoMPFsBuV5dAn5Qh19VwmXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0VWyb5DUZBeA9A0yIlIo23tdhszAS8+BqjV49BUyOpKHGrKjZ0wfa7sayxuKFSGsxSDtJkGpC/WPvzSvVkHjjB5AcvYg0GGci0qUBfdMUchxzD4gFXxyiWFww2QOP3qHvu60ipWG1+OTvZUoE4do0tx3YOhp0kd6Z4Hy6fH+sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kpj5+/6m; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kpj5+/6m"
Message-ID: <32f95b96-c711-4155-bd81-19b413eebae6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776699524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ip0QzwUEFbOglucOicZThEws9BYZk3TUrfkEAPdWX5s=;
	b=kpj5+/6mD49/yH+eZtL944+H03Yb1qyhj6axJEFvNRfIGcnBl8rjEzPqFZy0eU5JZtodBY
	hlo3tfAZT8fPPxiuboBbq9iyiNDhTgsQUnnywGqTWZ9lUdRYYZ5cpA/eYNvO7+c767Xvb4
	jDQfyPULabJGsxoySzo01QkwAZgQ51U=
Date: Mon, 20 Apr 2026 23:38:22 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net 0/2] tcp: symmetric challenge ACK for SEG.ACK >
 SND.NXT
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260420025428.101192-1-jiayuan.chen@linux.dev>
 <20260420082454.1b85cd94@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20260420082454.1b85cd94@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 4/20/26 11:24 PM, Jakub Kicinski wrote:
> AI says:
>
> Your patch "tcp: send a challenge ACK on SEG.ACK > SND.NXT" breaks an
> existing packetdrill selftest:
>
>    selftests/net/packetdrill/tcp_ts_recent_invalid_ack.pkt
>
> Test output:
>    tcp_ts_recent_invalid_ack.pkt:25: error handling packet:
>    live packet field tcp_ack_seq: expected: 1001 (0x3e9) vs actual: 1 (0x1)
>    script packet:  0.200125 . 1:1(0) ack 1001 <nop,nop,TS val 200 ecr 201>
>    actual packet:  0.200119 . 1:1(0) ack 1 win 65535 <nop,nop,TS val 200 ecr 200>
>    not ok 1 ipv4
>    not ok 2 ipv6
>    not ok 3 ipv4-mapped-ipv6
>
> Root cause:
>
> The test `tcp_ts_recent_invalid_ack.pkt` sends a FIN+ACK with ACK=9999
> (which exceeds SND.NXT=1) to verify that the kernel does not update ts_recent
> from an invalid packet.  Before your patch, this packet was silently dropped.
> After your patch, the kernel now emits a challenge ACK (SEQ=1, ACK=1) in
> response to the ACK=9999 segment.
>
> The test script does not expect this challenge ACK, so when it subsequently
> tries to match the expected "ack 1001" response to the following data segment,
> it instead sees the challenge ACK "ack 1", causing a mismatch on all three
> address families (ipv4, ipv6, ipv4-mapped-ipv6).
>
> Fix: update `tcp_ts_recent_invalid_ack.pkt` to consume the new challenge ACK
> before checking the response to the subsequent data segment.  For example,
> add after the bad FIN+ACK line:
>
>    +0 > . 1:1(0) ack 1
>
> so that the challenge ACK is explicitly expected and the rest of the script
> proceeds as before.


Thanks Jakub, you're right.

Will fold the tcp_ts_recent_invalid_ack.pkt update into the kernel fix in v2

to keep bisect clean and makes the backport self-contained.

