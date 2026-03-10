Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C79D2E65D
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 00:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773104355; cv=none; b=PVRvbW0P1/voA2QbvWoLfbONHJjoYqgKG3PaJksGcQ5vWLi4NDT3tuufEuPqm12ZYGxi4A7esOQ9T/vamQh5CejWgEjUpvub2x5oSUjvZK7W2riZYzrmyeCF+jA9vMebEzsUoCJI5JyDei2XswIstXHENo4+AbQBbHwMLBakIy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773104355; c=relaxed/simple;
	bh=acAgMLq2GoV1PYZFMmwQa1oS3NzSELcKigiu1mbKhvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GQT++1BepKlO90cQDlcFkGnPmiCcEkPYi3Zej/ta3I8T7IUQiTpyEHMB4kTrRZ5J80zkq7Klk+45aEItivIjGaobAenRWj+ERZ1XfEDAbHq9QPAkdcitZLEzfrXy9hE1emjor1maSCasx7D4f6FKS1KebA4EFHZilOoM1QPqD2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HKkIMrJJ; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HKkIMrJJ"
Message-ID: <879742b3-da96-44fd-9cbf-ba471b99f03c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773104352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4LB1WRHoRTnoRAaNtzpjIqZzqOf5EKjDkqzha8+8jEw=;
	b=HKkIMrJJBFUgZVFrCwdjtOkkYOND6c6eexcVe28Jj+SNm4n4W1xk+xcLgleJ9N2DtGm6z+
	eLhIUlsUFHz1QsauPyZBAwVo6YCnXzI0uT7CWFkpBsJmSTQJmu2i3Augyk2LC3Wc+MsPja
	hN4zy+EScf8tkOGzRbObdTudFAqD8ko=
Date: Mon, 9 Mar 2026 17:59:01 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/4] RDMA/rxe: Add net namespace support for IPv4/IPv6
 sockets
To: David Ahern <dsahern@kernel.org>, jgg@ziepe.ca, leon@kernel.org,
 zyjzyj2000@gmail.com, linux-rdma@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Zhu Yanjun <yanjun.zhu@linux.dev>
References: <20260308233540.13382-1-yanjun.zhu@linux.dev>
 <20260308233540.13382-3-yanjun.zhu@linux.dev>
 <f8315319-3dda-4ab2-97b1-7645c3995d3d@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "yanjun.zhu" <yanjun.zhu@linux.dev>
In-Reply-To: <f8315319-3dda-4ab2-97b1-7645c3995d3d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/9/26 11:54 AM, David Ahern wrote:
> On 3/8/26 5:35 PM, Zhu Yanjun wrote:
>> diff --git a/drivers/infiniband/sw/rxe/rxe_ns.c b/drivers/infiniband/sw/rxe/rxe_ns.c
>> new file mode 100644
>> index 000000000000..6fe056c81ef3
>> --- /dev/null
>> +++ b/drivers/infiniband/sw/rxe/rxe_ns.c
>> @@ -0,0 +1,136 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
>> +/*
>> + * Copyright (c) 2016 Mellanox Technologies Ltd. All rights reserved.
>> + * Copyright (c) 2015 System Fabric Works, Inc. All rights reserved.
> 
> neither of those copyrights are relevant here.
> 
> 
> 
>> +static void rxe_ns_exit(struct net *net)
>> +{
>> +	/* called when the network namespace is removed
>> +	 */
>> +	struct rxe_ns_sock *ns_sk = net_generic(net, rxe_pernet_id);
>> +	struct sock *sk;
>> +
>> +	sk = rcu_dereference(ns_sk->rxe_sk4);
> 
> [  323.527911] =============================
> [  323.527915] WARNING: suspicious RCU usage
> [  323.527918] 7.0.0-rc1-debug+ #3 Tainted: G        W
> [  323.527922] -----------------------------
> [  323.527925] drivers/infiniband/sw/rxe/rxe_ns.c:49 suspicious
> rcu_dereference_check() usage!
> [  323.527929]
> 
>> +	if (sk) {
>> +		rcu_assign_pointer(ns_sk->rxe_sk4, NULL);
>> +		udp_tunnel_sock_release(sk->sk_socket);
>> +	}
>> +
>> +#if IS_ENABLED(CONFIG_IPV6)
>> +	sk = rcu_dereference(ns_sk->rxe_sk6);
> 
> [  323.528243] =============================
> [  323.528245] WARNING: suspicious RCU usage
> [  323.528248] 7.0.0-rc1-debug+ #3 Tainted: G        W
> [  323.528251] -----------------------------
> [  323.528253] drivers/infiniband/sw/rxe/rxe_ns.c:56 suspicious
> rcu_dereference_check() usage!
> 
> 
> you should always run tests with a debug kernel that has kmemleak and
> lock debugging enabled.
> 
> 
>> +#else /* IPV6 */
>> +
>> +struct sock *rxe_ns_pernet_sk6(struct net *net)
>> +{
>> +	return NULL;
>> +}
>> +
>> +void rxe_ns_pernet_set_sk6(struct net *net, struct sock *sk)
>> +{
>> +}
> 
> This branch is typically done as an inline in the header file.
> 
> 

Got it. All the above problems are fixed in the latest commit.

Zhu Yanjun
