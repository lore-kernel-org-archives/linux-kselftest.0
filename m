Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BA8395DAC
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 22:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773269523; cv=none; b=lMa3OgTkDYbaXkoNhiFI6CZ69Xb6h5uM1Nyz9u72lVeeWS7BNtTsvD9XAd/VpJTW+Vqdd/AQMWMMnHILyiOVeMsd8lyTir7a4S7kv5T+2lRPSQZ5tvAf6LRy9KfEuZnD523A73Xpo5oLtcH+eshxGbbW+OFaBfjbTQDtQXuyP0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773269523; c=relaxed/simple;
	bh=BNgPwPNdRfG7AAZSM7vrwFEPrTaHE8eG6nOZX8dy+pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6Aw/2KVSytWQmzQmNCpb1TooFlxRmQ5CmWFpwj+hRY/XvqGNry5QlERW7oAC6mI7MjPRx8LaNLIqizr0DzssY3mLnldErc5AYVZO0XTZSOGsF4aXfedAJOE7c/tLWOq2x0VauLqFrtuJXpxQcNhNWBSz7yk5dVb3ZzUfq+TvVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PRTaHnKE; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PRTaHnKE"
Message-ID: <fd4b639f-be69-4b5a-bb05-e8302da8c87a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773269520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XF0zY5nxeMwHSaorzU3I/GigfgLaCZBP1WnpmhBNilM=;
	b=PRTaHnKEGQ4RBcMFvHgeZj58EHaduYeuRL5Fjg5HRt+vWS5lmJ/QifLrCOF/z0c4Pe6PPT
	Rl4C1rYUwvd1WXAQ6bUltQS/A7hyGLtHnRN7qIoVKWSKRwv40rRQHUTaogMhcSOgZ0XFu6
	h13Hmg1KqdESUZ6y/jdbR7RM5Gi4pv4=
Date: Wed, 11 Mar 2026 15:51:52 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 4/4] RDMA/rxe: Add testcase for net namespace rxe
To: Leon Romanovsky <leon@kernel.org>, Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: jgg@ziepe.ca, zyjzyj2000@gmail.com, shuah@kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org,
 dsahern@kernel.org
References: <20260310020519.101415-1-yanjun.zhu@linux.dev>
 <20260310020519.101415-5-yanjun.zhu@linux.dev>
 <20260310185308.GJ12611@unreal>
 <93c8c159-90f0-41f7-81d7-0f10fa7cf373@linux.dev>
 <20260311085108.GV12611@unreal>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
In-Reply-To: <20260311085108.GV12611@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 3/11/26 1:51 AM, Leon Romanovsky wrote:
> On Tue, Mar 10, 2026 at 02:01:03PM -0700, Yanjun.Zhu wrote:
>> On 3/10/26 11:53 AM, Leon Romanovsky wrote:
>>> On Tue, Mar 10, 2026 at 03:05:18AM +0100, Zhu Yanjun wrote:
>>>> Add 4 testcases for rxe with net namespace.
>>>>
>>>> Signed-off-by: Zhu Yanjun <yanjun.zhu@linux.dev>
>>>> ---
>>>>    MAINTAINERS                                   |  1 +
>>>>    tools/testing/selftests/Makefile              |  1 +
>>>>    tools/testing/selftests/rdma/Makefile         |  7 ++
>>>>    tools/testing/selftests/rdma/config           |  3 +
>>>>    tools/testing/selftests/rdma/rxe_ipv6.sh      | 63 ++++++++++++++
>>>>    .../selftests/rdma/rxe_rping_between_netns.sh | 85 +++++++++++++++++++
>>>>    .../selftests/rdma/rxe_socket_with_netns.sh   | 76 +++++++++++++++++
>>>>    .../rdma/rxe_test_NETDEV_UNREGISTER.sh        | 63 ++++++++++++++
>>>>    8 files changed, 299 insertions(+)
>>>>    create mode 100644 tools/testing/selftests/rdma/Makefile
>>>>    create mode 100644 tools/testing/selftests/rdma/config
>>>>    create mode 100755 tools/testing/selftests/rdma/rxe_ipv6.sh
>>>>    create mode 100755 tools/testing/selftests/rdma/rxe_rping_between_netns.sh
>>>>    create mode 100755 tools/testing/selftests/rdma/rxe_socket_with_netns.sh
>>>>    create mode 100755 tools/testing/selftests/rdma/rxe_test_NETDEV_UNREGISTER.sh
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 77fdfcb55f06..bd33edf79150 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -24492,6 +24492,7 @@ L:	linux-rdma@vger.kernel.org
>>>>    S:	Supported
>>>>    F:	drivers/infiniband/sw/rxe/
>>>>    F:	include/uapi/rdma/rdma_user_rxe.h
>>>> +F:	tools/testing/selftests/rdma/
>>> This is wrong place in MAINTAINERS file.
>>> You need to add that line to "INFINIBAND SUBSYSTEM" and under RXE to add
>>> tools/testing/selftests/rdma/rxe* entry.
>> Hi, Leon
>>
>> "
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>>
>> index 77fdfcb55f06..3c6bc0e05fc0 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -24492,6 +24492,7 @@ L:      linux-rdma@vger.kernel.org
>>   S:     Supported
>>   F:     drivers/infiniband/sw/rxe/
>>   F:     include/uapi/rdma/rdma_user_rxe.h
>> +F:     tools/testing/selftests/rdma/rxe*
>>
>> "
>>
>> Is it OK?
> It is not sufficient. We also need to be CCed on changes to
> tools/testing/selftests/rdma/Makefile. For that reason, you should place
> tools/testing/selftests/rdma/ under the "INFINIBAND SUBSYSTEM" as well.

Got it. If I get you correctly, the final diff should be as below. If 
you agree, I will send out the latest commits out very soon.


"

diff --git a/MAINTAINERS b/MAINTAINERS
index 77fdfcb55f06..2aba0bf49053 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12551,6 +12551,7 @@ F:      include/uapi/linux/if_infiniband.h
  F:     include/uapi/rdma/
  F:     samples/bpf/ibumad_kern.c
  F:     samples/bpf/ibumad_user.c
+F:     tools/testing/selftests/rdma/

  INGENIC JZ4780 NAND DRIVER
  M:     Harvey Hunt <harveyhuntnexus@gmail.com>
@@ -24492,6 +24493,7 @@ L:      linux-rdma@vger.kernel.org
  S:     Supported
  F:     drivers/infiniband/sw/rxe/
  F:     include/uapi/rdma/rdma_user_rxe.h
+F:     tools/testing/selftests/rdma/rxe*

  SOFTLOGIC 6x10 MPEG CODEC
  M:     Bluecherry Maintainers <maintainers@bluecherrydvr.com>

"

Zhu Yanjun

>
> Thanks
>
>> Zhu Yanjun
>>
>>> Thanks
