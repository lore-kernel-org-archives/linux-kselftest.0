Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357398;
	b=q0iZ0MQKypdwLPzvZyTuh5Ai9RUUvedG8xSs27A7EGT0M+ntBoriD3kRbacrbqEoFAB1
	 D9V9/FCTRyKBPUCxWhqVejeqrXx+nNrHfZ6iVVaXpwBeb/OgNKzZbSBsaBdlJ/xjFwXLi
	 qmURdxt48k/HGxDE3s8TsS430GmbdMC4+jMMp2Cf+HmgtgywfHqTISX+jK8sOOaSaqJHX
	 qjy89yUv1ruq6P/OSE9Symd0Kd7kCD3GTF/gCqT/9vZX1ndNJBtAPOZmIdL0W3YqT/8gq
	 MpTVxLT/wuTCt9zPzXH21pz8VpClfaJlYl15bZo+IfIkVapq+F71ocpcNfCd6nkIg8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357398;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5xNBziimzhOKJ75khsdW/qJptdIDAbTywmzzl7xoxlQ=;
	b=JUsHJPSeVH4j0Prim3ho0d9Ci9iVkjGkTGKnMV1ed/nVdNAdsyl/Aj9y6fIC/EJHhbKW
	 Mw7gT5ODVYz6CQOAyZLt7UybkA8KWCV759nHMB4FWLzyFsO96PpxnPf3a+AQIKQkx+Vo1
	 6Ah6FyzKrooQEBPx3gFbb1YEm5SDI9H6nrhStxxoKuTi+hory13KRkpvcNoS5dnYcjrKK
	 BrdcsMjvTx1Txa+N3jolDfDFGTDssEh3VU0PgXyS5pUAotTb93pMkjnYj2BaRLGIXbt8K
	 +3Xt9zbLndgPGgMW6dbz/Y1GTC9VFhJ/jwpsZwfm0lB9n9Loeos2OzA7Xv6pSL9NbXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PuXiNeJH;
	arc=none smtp.remote-ip=95.215.58.23
Received: from mta1.migadu.com (out-23.mta1.migadu.com [95.215.58.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5972A606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 00:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5972A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PuXiNeJH
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ryq0meCWDSCEkuV5UPQQfaSOwgmbjAwNt34VPkFyn8w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794357395; v=1; x=1794962195;
 b=PuXiNeJHCD7dwJbo62mzWZYiunHoHPFgBLij5Hnqq0AU69D01GnYrYwTSyE6jw/U+H8eVhzK
 FZwVQ8VsoslvvHUL+5KwBkkbrRr1Fuss58aJ0+AeGjUc3tkWJ7CGNubyhDeDD79vBiAOydkMKCj
 cCB/BkDp4bcq4COezpmIXv1I=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 60c021cf43740dcf;
	Wed, 11 Nov 2026 00:36:35 +0000
X-Mizu-Trace-ID: 60c021cf43740dcf
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 08:36:24 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Bjoern Doebel <doebel@amazon.de>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>,
	Liang Li <liali@redhat.com>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] selftests: bonding: feed link monitor to deflake
 prio_test
Message-ID: <avO4iNKpHoXMV9gp@fedora>
References: <auvnnIXQV2zufxtF@fedora>
 <20261110115354.2250237-1-doebel@amazon.de>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110115354.2250237-1-doebel@amazon.de>

On Tue, Nov 10, 2026 at 11:53:52AM +0000, Bjoern Doebel wrote:
> Hi Hangbin,
> 
> On Thu, Nov 05, 2026 at 10:19:08AM +0800, Hangbin Liu wrote:
> > If the kill fails for some reason, will we wait here forever and hang the
> > entire test?
> 
> No. bash keeps a terminated child's exit status until it is reaped, so if
> the ping already exited the kill fails but the wait returns immediately.
> Only a genuinely unkillable ping would block, independent of kill. The
> idiomatic form is kill_process() from net/lib.sh, which short-circuits
> the wait when the kill fails.

Yes, that's what I mean. We need to avoid that the kill failed and the
process still running.

Thanks
Hangbin
