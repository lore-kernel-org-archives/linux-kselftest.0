Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882902;
	b=mj5ZRetN9sL4mTxu9t/tONKOJczoRoVxa8rrpMh3TAUX0/h+owhOhH+8MiYetKDn6xOs
	 b+i6YojsrdNtCP3kaktEQKe29WA7ccaXDu1Wr07tEw9vaDB5lEOjpz5bqweWeKBr8qhdG
	 jCQYpF5Ve5P0//4yi4k0A4J3zE2/URC47G0Ze1a5zZHZ8dCuiTF28QCgud1dXhNgPC38A
	 1Nc6axO43vm0Xidqm5ewU9Il2oBhLEI0GSiQI+xaA+GwkoBRA3hTKgCUGrN3mUpDj8aRM
	 C/4XAuDqHVq7QF6VCm93+5NkATpeqmS4W4D6Dub4/vc2xbLTDU69xhItHWlJF5tJawA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882902;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QY8lCwmkmind44M0So4KIeiIQuRudzX0HtJ/2Z9V0Ew=;
	b=joYZpnxEXxBeOt5mc2jmhEzruGPDY0/7tkCGEorRLB6iVVChtapfcXVRheUx/v76UXMN
	 xKs1Nmh+DXmX7HM1ws089JiHJuiMXghZm71vgK2n5TBbRHXnB2J1AOEu6DWFpjTB5OVvE
	 yxExU4Mn5Cvg02OGKOFPYiuqwYKmhTFqTVSOJNiSMOGzNfqaC3G0apMs0Sf0Q6NgQ3/RI
	 uq0MieG2yUFkyuZqE+bNCgjdLE+emvvllUnMAOckfyrN81Hz43J+OvZ5hZLsJlj8VtVJP
	 Jxgakzty/myisq4LTgrfPPR28pc98d4kdCWgdIWvLqGVH53JDFkag/w7IIJYvbndW2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ASExXGBv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C11606A326;
	Thu,  5 Nov 2026 12:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ASExXGBv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F911F00A21;
	Thu,  5 Nov 2026 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793882902;
	bh=QY8lCwmkmind44M0So4KIeiIQuRudzX0HtJ/2Z9V0Ew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ASExXGBvEOYAz2bb/LUlqbCHgdW/CLfiA4bmdMGdDzOvFZwqheIdS65o8NFSROpgR
	 4hzxoYHIzaPWHwoxv8j96U4JRBUbwWg+l/ROA17/euuErxG1CbzC8kt81izsXGgsBl
	 eSB0XZIo8H+PmIKumciFK7rcAnEAf1+NwfsvEGy2Gfm3uu6Oy2dQMDmcYXdVkk9VXb
	 fqd7N8WJT1XYSaRD+UWEOYrSa4h37BVM3/8y3AcIh+vrkuRV4m5mswTbuLOXBHsxy9
	 cCLScHsxa3vC0Aq4HyHM5Wv902zFZXT8VV4zJ4aDr7lm00QAGywUrm0aprBoq5vDft
	 JTGal4r2g72oQ==
From: Sasha Levin <sashal@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: net: tcp_ao: don't shift a size_t by 32
Date: Thu,  5 Nov 2026 07:48:19 -0500
Message-ID: <20261105124819.1532111-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105110856.2dc9f08c@pumpkin>
References: <20261103163921.641347-1-sashal@kernel.org> <20261105110856.2dc9f08c@pumpkin>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Nov 05, 2026 at 11:08:56AM +0000, David Laight wrote:
>On Tue,  3 Nov 2026 11:39:21 -0500
>Sasha Levin <sashal@kernel.org> wrote:
>
>>  #ifdef IPV6_TEST
>> -	ret.a6.s6_addr32[3] = htonl(n & (BIT(32) - 1));
>> -	ret.a6.s6_addr32[2] = htonl((n >> 32) & (BIT(32) - 1));
>> +	ret.a6.s6_addr32[3] = htonl((uint64_t)n & 0xffffffff);
>
>You don't need a cast or mask there.
>
>> +	ret.a6.s6_addr32[2] = htonl((uint64_t)n >> 32);
>
>That can also be n >> 16 >> 16
>
>Also see upper_32_bits() and lower_32_bits() in wordpart.h
>which might not be available for selftests?

They aren't, tools/include has no copy of wordpart.h.

It works as is, but you're right, htonl(n) and htonl(n >> 16 >> 16) are enough.
Happy to respin with those if the maintainers prefer.

-- 
Thanks,
Sasha
