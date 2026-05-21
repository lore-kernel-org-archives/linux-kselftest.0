Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6370E342CBA
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 07:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779347971; cv=none; b=fI9TZ1f/XTKBecbCuNSM8OEan83WGMYV4pIuS2O/BMetDUL5lr3PYswFvbJQ2PJzb5yJW3x31Obb02dov6KzFI1E1aomCekrpiJR1++9rgs79XFTHfdqWdiLcke1Akq+xgfdMWeFgVb6PNuGw9TC4UytVGFMwA7Mx8wRUXtK0Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779347971; c=relaxed/simple;
	bh=FMVVGLHw/7AwnWgP71qQkYBp+odBo+vxIvPr29w2bec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9PZIiLmjMYdC2WO9d4DQWzigYh3yK0F6w2GHUBgU3HE3aEgvq7BFsUR/TQmo/AINiAewBS0SpyocNUJjC1udp4nvsb3MI2kJ+YlROtFbE4LjSedY5QjTMsKHlpl41y9MDrfXhNwr6LLkAyMpkoDzhjKbt/S67jSZFVN76LIkfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l3vdo4Gv; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l3vdo4Gv"
Message-ID: <0e6fa578-15b2-43c5-b5f5-a6e0a34c103b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779347958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z8k65NgcvE3tFcimhbZRamCjGFis6203SgZTsSSdYZg=;
	b=l3vdo4GvGtcSCeZDb8HLt2govCmlgjfqBGXCI81e07jXvejthoIcT87uJ/Oz5hVEF5cnEK
	DvomknICaJcxvJDqZqZUurXF3fkHS5tpypvuNaKmJGcOKZcoTleFm2MqySpPQ1kEQ4Umto
	G3P8R7lcXkwKwAE7Mt8GHvGK7PSvbNE=
Date: Thu, 21 May 2026 15:18:51 +0800
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
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <92da057f-7e97-405c-877f-ad6a64e3553e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 2026/5/21 10:24, Matthieu Baerts wrote:
> Hi Qingfang,
>
> On 14/05/2026 11:57, Qingfang Deng wrote:
>> Add ping, iperf3, and recursion tests for PPPoL2TP.
> Thank you for the new test!
>
> I recently modified NIPA to be able to execute this test by adding
> xl2tpd 1.3.20, but it looks like this test is flaky:
>
>    https://netdev.bots.linux.dev/contest.html?skip=0&test=pppol2tp-sh
>
> The results are now ignored.
>
> Do you mind fixing that, please?


Looks like pppd exited unexpectedly, but I could not locally reproduce 
this issue.

You can start a socat instance to listen on syslog (as done in pppoe.sh 
test) to see what's going on.

Regards,

Qingfang

