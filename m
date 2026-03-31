Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047391A9F91
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 00:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774916996; cv=none; b=CwA8ZIQvrPcD47eftqjJ0lwDBxqFqBAfNPc4vuRXWu5coIhJA7aZGdiswGp1fG6u1UtaMbFXCiFuuvxIoZIR+4BtfCN/z4WdoabEpMMr33NkcCuCAv66/bCvXS+5+qD2BBBCfP/OZtB9z4AGOMY4sQMjnbn8NuLZfwHZ6lJzNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774916996; c=relaxed/simple;
	bh=IGExde06qVF10qxh8DiBZsjvIIDhZt/JqkJu5UjWtog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQNY9RJNKJ1zyQRNWYHLsys+5fT7bH3TWmBN75rqElgQIsj2Qe3ZG4JFxCiL4IMtrzf8iKJ5Q/7VAZYGJS4fjxZNzk5a7dFSEBJtITp+hRIJBJ9FiQTTOraCm1vBvsFtdv/qFaPjlH0Mb45YygfPAXEehOfOhVPdcFSC/WcTPPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fnB/PLAU; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fnB/PLAU"
Message-ID: <2ab2a379-8166-43b9-a26f-324295069dec@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774916993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MqJ2TyHriLW4kqacC8FHtakgb5SkSoHTUa2vGoSe/j4=;
	b=fnB/PLAUWrS9UFBAIcuImH+89EZq2XkoWDaAwIjI6UYb9wXmigPL12gIrBkckCZaMPDahJ
	oIjoyKrsyzp5Zxn/zB1PzbIzzrxXfsc7SgEy9G2RssEqTSmlwf3RQG82YmbGSdxBA/tfJ8
	CekDTExNfnThhOBjugFPi9rAjjZK8cc=
Date: Mon, 30 Mar 2026 17:29:36 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: test that dst is cleared
 on same-protocol encap
To: Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
 horms@kernel.org, andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org,
 song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
References: <20260329180428.2657785-1-kuba@kernel.org>
 <20260329180428.2657785-2-kuba@kernel.org>
 <3532664e-1f62-412c-9819-b048f62da010@iogearbox.net>
 <20260330162908.7413feb1@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <20260330162908.7413feb1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/30/26 4:29 PM, Jakub Kicinski wrote:
> On Mon, 30 Mar 2026 10:03:46 +0200 Daniel Borkmann wrote:
>> On 3/29/26 8:04 PM, Jakub Kicinski wrote:
>>> Verify that bpf_skb_adjust_room() clears the routing dst even when
>>> the encap L3 protocol matches the original packet (e.g. IPIP).
>>> The dst selected for the inner packet is not valid for the
>>> encapsulated result; a stale dst could lead to misrouting.
>>>
>>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>>
>> Acked-by: Daniel Borkmann <daniel@iogearbox.net>
>>
>> For new tests we should ideally only be using tcx links and not the old
>> qdisc approach unless there is specifc reason to. Any objections if I
>> fold this in while applying?
> 
> Sorry for a late reply, of course don't mind, thanks for handling it!

I have folded Daniel's changes to the selftest. Applied. Thanks.
