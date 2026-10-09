Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8563D953A;
	Fri,  9 Oct 2026 05:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523027; cv=none; b=RfYvMIsjllxSk+XPVnhMXEWzWDEl4HR1ZgBH/VhwhUVEbFugHnbLzBedFwTieOjsJ9/f+Ktu4d44nJEWs3hpPKPJRI0e1gLHNZlJHLHS0P2s5BrG2cupynR5wdoEBC2ubEIYr7VFtPwszFTR+v5MJ9rmymdkD+Bi83NMxe6504s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523027; c=relaxed/simple;
	bh=GoaoFDCjtgPq5kGR7uK1nDvJ4v8gZ15Od56/qm3XMpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZL1go8jt4MGaH3AHs0RCpy51LWhtcslEyTgyvRfqWYE8bMN+AIhbuKRbfHntyrhexRpD+PmcLO4i0N3E04DXFrdKmmeTL+2Kf3MxkRX/h80+msgDMf0236HuDoZQvrw0IhhfNCTcrUJ8jVLJBLymbzl3C4nUcDO/vRXVlgBtVgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6QSNnrn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6QSNnrn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239411F000FF;
	Fri,  9 Oct 2026 05:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791523026;
	bh=zlQzHhNYHeezv0CHWq/KQXNtURr4uK8Q/GGVJb8f6/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=C6QSNnrnRQPaL1PGcClrBVcgDeBuRZvhh3NOT9UVUzpeXaJDgszbB+TITVrmSvc+B
	 +ow72nsJaYTphs3y2ikhQplokjr7hBSBblEbjEuRbjwHTlz6NgdwqXo0Euwy6dnWp3
	 TG7A4+hLYmMgygQE0M6yc22ICKZIbPSd8mT748KYMv8u56JesZyWTVn85RKOk6XiYc
	 s8HVp2NCn/3oATR/z4ev6t/A1PQCtYMi6jPTJMvuwzhKh59DN/RMeCYDdUj1tXr71d
	 lnY6EnNjlmL97HfiOlY+q27mMQveQHuWuNnrI+mSPUQ3irIOwj0rfc70/GS9KoTyRa
	 csasvCQdS/Xeg==
Message-ID: <5ce181b5-af31-48c4-9199-feadf24af27a@kernel.org>
Date: Fri, 9 Oct 2026 07:17:00 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/3] selftests: net: packetdrill: test RACK after
 partial undo
To: nramaswamy@openai.com, netdev@vger.kernel.org
Cc: Neal Cardwell <ncardwell@google.com>,
 Neal Cardwell <ncardwell.sw@gmail.com>, Kuniyuki Iwashima
 <kuniyu@google.com>, Yuchung Cheng <ycheng@google.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1791506907.git.nramaswamy@openai.com>
 <d0c538a03fb1cabd090927cb30a3b78fb485ba72.1791506907.git.nramaswamy@openai.com>
Content-Language: en-US
From: Eric Dumazet <edumazet@kernel.org>
In-Reply-To: <d0c538a03fb1cabd090927cb30a3b78fb485ba72.1791506907.git.nramaswamy@openai.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/9/26 07:00, nramaswamy@openai.com wrote:
> From: Neil Ramaswamy <nramaswamy@openai.com>
> 
> Reproduces a partial undo bug where a segment is unmarked as lost but is
> never returned to RACK's timestamp sorted list, which makes it ineligible
> for future fast retransmission.
> 
> Signed-off-by: Neil Ramaswamy <nramaswamy@openai.com>
> Assisted-by: LLM sparse
> ---

Was this test changed since last time?

I thought I already reviewed it.

https://lore.kernel.org/netdev/7a977ccc-b6e5-4430-8ffa-fbde5ed9f4f9@kernel.org/

You are supposed to carry the reviews from Vx to Vy if no significant 
change happened.

Please do whatever it takes to reduce our huge load.

Thanks.

