Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF539443AB1;
	Tue, 25 Aug 2026 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787669624; cv=none; b=dDEpTsWAF6n/YHSJ5i64gkVlH2REBlXusUjZnaHPZX9fq2duoOHlsZ99joAR0x+cmSCwON1Rz8CbKfOY8uJM/UgjIg+hcDImy4Mgbpn0t0UmhiLCIP4/T9uFfwj5lAVQ/e420bkGB7l7sb86+OVZcJba0wJ8ZjTHczdXvCBUTus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787669624; c=relaxed/simple;
	bh=3QIsQ5eZqQnioGIToeXXGGZTZ+yEs/DQ2YG7s+mb23k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INErE3R/VuxoeF/OqE/MYqM0AF8s1VYd/O569qmTyGbCuW627HAihv5jRFtyz5atsZFCpkWGxvcPVoc/1gl4my/WpljXYep90aJA6wWIbtJHQHG0ellOTENCllsZAZ7MZO8PRIgL8QXc5jWQ5QSgbk5tSXqwH8N4C6dSH/U96dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PoeVvY7G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PoeVvY7G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F561F000E9;
	Tue, 25 Aug 2026 14:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787669612;
	bh=8ID+n5mSv/6J4izi4tkAEQBrN5TDuETaoYqtBV59JEs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PoeVvY7GLYyxKUaclBtC8oy9Ps22NUBXQrE/m8gwRBRaLdpTHfmX0OMiCxxxNxTHk
	 qLvy4hL/CAH7VNRPm1hON4oWzMZh5nJR024ricVkCXuZHIiJG7C/3V+BVtHaytVB08
	 jsItdcp79VcCgXlu9X1lVOXM99sYeedApBNlOMt40m1guW8BxsUpBOw1jZvc/4uKVX
	 ijvDshMk4A5/wu/XQ4QJbbLgmN8gqJ0I8/uOI/pGsoPr1iR89twBLBTMWGfPWygFbM
	 jrhvqbr+tJX0Eet+x5Aq1SSZ09yhfc9c3u5oumc28o7KHm6of9qY7RY7V4E8rap01M
	 X1EQo8IxDiPRA==
Message-ID: <90a3231f-663b-4d24-b08a-28ea87a2c148@kernel.org>
Date: Tue, 25 Aug 2026 16:53:25 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net v2 0/4] Improve stability of big_tcp_tunnels.sh
 selftest
Content-Language: fr
To: Paolo Abeni <pabeni@redhat.com>,
 Alice Mikityanska <alice.kernel@fastmail.im>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Alice Mikityanska <alice@isovalent.com>
References: <20260822120308.1165200-1-alice.kernel@fastmail.im>
 <2fe7208a-7bc9-4004-907b-75f283360ec9@redhat.com>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <2fe7208a-7bc9-4004-907b-75f283360ec9@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paolo,

On 25/08/2026 15:21, Paolo Abeni wrote:
> On 8/22/26 2:03 PM, Alice Mikityanska wrote:
>> From: Alice Mikityanska <alice@isovalent.com>
>>
>> This series addresses flakiness of big_tcp_tunnels.sh discussed at:
>>
>> https://lore.kernel.org/netdev/349c582c-73e3-468c-91cd-ad6cc3562700@app.fastmail.com/
>>
>> Lower the thresholds to avoid failures like this (number of packets
>> below the threshold):
>>
>> https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net-dbg/results/754376/28-big-tcp-tunnels-sh/stdout
>>
>> Tweak tcp_min_tso_segs and initcwnd to avoid failures like this (BIG TCP
>> doesn't kick in in slow configurations):
>>
>> https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net-dbg/results/751124/21-big-tcp-tunnels-sh/stdout
>>
>> v2 changes: Use $KSFT_MACHINE_SLOW instead of probing kernel config.
>>
>> v1: https://lore.kernel.org/netdev/20260814194124.3102581-1-alice.kernel@fastmail.im/
> Any special reason for moving the target tree to 'net'? Selftests
> stability improvements should go via the net-next tree (without the
> fixes tag).

Sorry, I suggested to switch the target tree now that the selftest being
fixed here has landed there. TBH, I think it is unclear what to do in
this case: I agree that these modifications are not critical fixes, but
they do help other people validating changes, plus they don't introduce
regressions in the kernel code. If they go to net-next, that means other
CIs (and developers) will potentially see false positives for ~2 months.

Personnaly, I think such fixes should go to net, but that's fine if the
stable team don't backport them.

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

