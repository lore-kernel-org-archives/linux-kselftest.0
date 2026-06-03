Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F213793BC
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 05:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780464972; cv=none; b=ncfE6Jl0j312lF+NgRgb69BgIyXyBRx9IuSLSDT26ekBtQBah4pCjWOlHVK+oyz7Pf3LH/PMN25DBDsTYheKpqF4UfP7qZJofXIzGRypmJYoW6CAqy7F5QWZAnMGK9g1/WWjyq8Pzb02KOWHyu3IulBJBIaYB/QJMfW0y0SZgSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780464972; c=relaxed/simple;
	bh=QZdWL8TW93hBVmRCbf+wTaax3/MrgBmqC4IKbOxsDW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BcTiLMJcYfFWj6mM3+ZdU3i3o07GcK7PFbbqrCEZ7ztimJ7/oZ6tvo+Pn0X/C9GT9m+zoiQ0DhVHP36asoJf5Isi6TcF+m7jG/PKriKKVYV9OEcaTf5J/tnR6HgTTALO08Svjj6esT1SZnmV9nEmF3ONzki5d0god2Ac5I4yTFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pKT1gyCR; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pKT1gyCR"
Message-ID: <752224bd-bada-4729-846a-c5684de38101@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780464954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a7v3/xj0c3pZJZawiq+jPLnhvqm6ys3j0ue/XKbnFgQ=;
	b=pKT1gyCR+Ei4hlApb7vqQMC2wJtAwBBWeZ+eO+LXf/dK4zrC14XL0hmcapFQpyJsCc97hI
	9+g7Vkg6nFJfLDKTDvj4kDweb0q/0/TpZ/+3ri3hgGz8mGbgQnle8QRwO6XrfsQ4AB28fy
	eEgwzMEboRadZZTekCcd76QPabN/paQ=
Date: Wed, 3 Jun 2026 13:35:43 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2] selftests: net: add socat syslog for PPPoL2TP
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260529021146.5739-1-qingfang.deng@linux.dev>
 <f4a18ecf-4810-45a9-bf2a-1add45623248@kernel.org>
 <8233aae4-42d4-4fac-90aa-240fadd9a39b@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <8233aae4-42d4-4fac-90aa-240fadd9a39b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2026/6/3 12:04, Matthieu Baerts wrote:
> Hi Qingfang,
> It looks like the issue happened once since this patch is being tested:
>
> https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-extra/results/668501/11-pppol2tp-sh/stdout
>
> Is it enough for you to understand what's wrong and how to fix it?

Yes. Both pppd instances detected a false loopback, possibly because 
they happened to use the same PRNG seed to generate the magic number. 
I'll send a patch to disable this detection.

Regards,

Qingfang

