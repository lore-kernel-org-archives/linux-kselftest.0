Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856BE16A956
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 02:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416141; cv=none; b=aUx4b++i5m5aiXy+VT/+bWfrvyq2lvZYjR9MZJsIQX6UNMWTgLsr707gJ7pV7NzoWDwf/8TKzH5+qmQixNGdYP7vYvPuMYIqWaW7B1ODY7+/nSs1spdim8ofTA2/iyzoq14EtpJqPmpZgiDhEg/pkUWt57Ok5GArWr3dxmDBWN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416141; c=relaxed/simple;
	bh=fVER6ZeXBuKT1ycM4JdAgghqvGVZ+f8q3woknWLvfMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZcYBu1BScCYSCcjX2cBM7hUDRRx1ZmDMoLvwP98wIWVoj79DjrSFwj52pC7t/KVBKQ31AYe1BHNjXbxEVOlJLLln90xNNAsINEyKdgRdvmbXFSMCnUBsGPNBm4oxFfkn3932rpyrpfSpE7gqXR6/8DHp3VEkYK07LocIr58Yi+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KsSDRojK; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KsSDRojK"
Message-ID: <9ac27ab1-1891-4734-9029-156a64e24c03@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779416128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fVER6ZeXBuKT1ycM4JdAgghqvGVZ+f8q3woknWLvfMQ=;
	b=KsSDRojKwiLs48+EBILo/SbPnmb9OxdTxgAFTBYwVePjqKvc1mSD84YPqqhgDfbhIlGfwm
	U4xHtoc1as21G5+9AB1O41hGCSHskiDmus1wb4eidePCNwpdr8ZqK5MJ8x1lhYfbcVaMPi
	4L6PgBxx011XvvX094PNhL/JXM4t3v0=
Date: Fri, 22 May 2026 10:15:00 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2] selftests: net: add tests for PPPoL2TP
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Felix Maurer <fmaurer@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Petr Machata <petrm@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260514015743.37869-1-qingfang.deng@linux.dev>
 <92da057f-7e97-405c-877f-ad6a64e3553e@kernel.org>
 <0e6fa578-15b2-43c5-b5f5-a6e0a34c103b@linux.dev>
 <357a49a0-0742-47a6-bba9-6c406dbd6888@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <357a49a0-0742-47a6-bba9-6c406dbd6888@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2026/5/22 9:43, Matthieu Baerts wrote:
> Hi Qingfang,
>
> On 21/05/2026 17:18, Qingfang Deng wrote:
>> Looks like pppd exited unexpectedly, but I could not locally reproduce
>> this issue.
>>
>> You can start a socat instance to listen on syslog (as done in pppoe.sh
>> test) to see what's going on.
> If it is already done in another test, and if this is not creating more
> troubles, it might be more interesting if this debug mode is always
> enabled. I would then recommend sending a patch doing that, than
> applying temp modifications only in NIPA, with a risk of causing other
> troubles. WDYT?
Sure thing.
