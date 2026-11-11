Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.75.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388843;
	b=oYWXBVO26+ygLIZsQH48uCN5JpATpFmQeGTJJU0WU8ryAq5mDHNgaij2O30O+dqpIM0l
	 9gkMBZwxD8VEayfanEUAVOubtpH04xDIpB0E9IfyzK3CzBv6ShitwJxxCOxsSPIrgwAKc
	 CZdLy65xHhImYOwFciJsdLB0KVFfbwUa88Jh1Qfcie7vsTH9iEeKIOsyfAiPb3kV1Ka9I
	 efNCLWXICymu0yrPyiGqVsS/D3b6VGWJ0doatZ3iUmL/qU/5yAuijS7MUAAF6r5/DuOdh
	 WJ3sJhRJSH0oRTBEPqK6PLLN1iea5EJa7dQDY8fjWZrqLKXxU5YoWTAG0CRAmzA7Y9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388843;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Info-Out:X-JNJ;
	bh=emiE0LSrob/0Gy6mQd2xuosVJeZv2KMBCzBELLcokfE=;
	b=4dRvL3lfadqpIoEuFwNoyOs6Zqri+INKO6fnPF8xlgIGPATgvYxNhUx+uWTubXwcFYED
	 larNNoLjG+GRBq+E71CSCo9S6rVCllohcAHtcgVobZrRrsrvgvfnLdTqe/2CBr/tONon+
	 JeLxpw4J+sa7yOTBSNjTJYD6pyallUeGDdqExEePqkgEw171MeGkOa3zGA3pIO/AR6T9A
	 2JA02ddyL7os9WtG9r6dbZch9kPT0Xs799u8AxjLMg5umoPyTm0I+r+grdI9a5TNqGAU6
	 NxCO5EdAPqAhRl7MeTPmXT7UhyePU8kyDdhQtp0xvFOu0zKR0/4hp4kuHm0GYw65yvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=F+TwZV5z;
	arc=none smtp.remote-ip=57.103.75.103
Received: from outbound.ms.icloud.com (ms-2006j-snip4-11.eps.apple.com [57.103.75.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49705606A324
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 09:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49705606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=F+TwZV5z
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-11 (Postfix) with ESMTPS id 7017C1800397;
	Wed, 11 Nov 2026 09:20:40 +0000 (UTC)
X-ICL-RepId: 01a1c9e8-cf36-79a0-82d8-9c5452a9ca2b
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1794388841; x=1825924841; bh=emiE0LSrob/0Gy6mQd2xuosVJeZv2KMBCzBELLcokfE=; h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:x-icloud-hme; b=F+TwZV5zNY9bpkpdE6uQUlkIcMRl0u4xew5tOeREKen1rG5ADQ4LBDC+Cd4Mzir7gry/v+ihFFRXNVEISRdeRZUDpYepglGFrxv1BGdqVlcFgI9o9PDJf6hxSBkGkinjtBLqqH8IoL6vYLJ4fD+OOBodnToRwUOsbAFQcxQF/Va0C6mMFzbBjrNy0VfNxM4J6ubLM10OkNs7sgtHHj6GiJ6ev6VhwTpZ+Dj8NwHDEXJ8bNjaKBYAjszFGh/aVO3wwz6tGLYkw/FNysURAY5CIcBAQrlkSuxiRzt53e6PO7Y/VpOlxD22tKHFma7MM7tUabvG5cyrJxAwNPfyPDiBHw==
mail-alias-created-date: 1621344842221
Received: from localhost (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-11 (Postfix) with ESMTPSA id 658D1180011B;
	Wed, 11 Nov 2026 09:20:37 +0000 (UTC)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 12:20:34 +0300
Message-Id: <DMS9R6RG6OKW.15NILH6RW6578@verdict.gg>
Cc: "David Ahern" <dsahern@kernel.org>, "Ido Schimmel" <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v2 0/3] ipv4/ipv6: Cache pmtu on all paths of a
 multipath route
From: "Vladimir Vdovin" <deliran@verdict.gg>
To: <netdev-bot+sinfo@kernel.org>, "Vladimir Vdovin" <deliran@verdict.gg>
X-Mailer: aerc 0.22.0
References: <20261110095903.84813-1-deliran@verdict.gg>
 <179430520494.488859.8396860489135491042@kernel.org>
In-Reply-To: <179430520494.488859.8396860489135491042@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNyBTYWx0ZWRfX9XAf6MsiQ2dB
 oQiR6mWlSiHpvOPZsX/S/TDT1oCsipu/wWhOdidgIcgq1f94wFO+5ymo3+AaoSB6AS4Eg351Cih
 kPvGXn0lXZmnEB3KYC0Z2p0q7+N1woZMjjt13QHNqbBwqt0xzKaW+YrEC4KVt2FHyM34Bwk5Q5s
 H2gkjkShiuUX/fTmpO7sOijD7I+MPE23FgquDCBFDjybnLINyIlzcNIrevcihNPCzHgIwpR3Jue
 bQtyrkO7C6wftrDptlVXNgL9uCXMUShxX/lQXDUxli3xYH/64ExwyJbJsqMdFJvGvxWkXUwXqOf
 i+w8qemp/KuUJs0GSl85AOvnfYLSXOB5FOnK5DD+Z86v42WR0gZ2kODLPS+1o8=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNyBTYWx0ZWRfX4prJEIYIvlJI
 90w/x+gyjFtlqXAQGHWPONIVeEvB27GLuQKgcC7a1JRccu7eGNKedGKjS1ZO71bHDt1yni6h+95
 EBmRLWic11xjY91P9X3obLY5aJXkQyg=
X-Proofpoint-GUID: 1gpICloqEuvM2jL9llB7HfrG0NqYtiPg
X-Proofpoint-ORIG-GUID: 1gpICloqEuvM2jL9llB7HfrG0NqYtiPg
X-Authority-Info-Out: v=2.4 cv=W7qtxhWk c=1 sm=1 tr=0 ts=6af43369
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Lz8lNifEoAKVmCoaIBl5:22 a=nt9yOg7Ld-NCdoK0S7LV:22
 a=VwQbUJbxAAAA:8 a=slS2ziH7K9J5olFhi2UA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAAB1zj+NsaxmxfPI77N0QmgMnZta+6UzS2tAB+wCuqrmJjmSn+VokQoxYC5Zycux8
 hLUVNtLDUoif5Wo0JN7UJX3ATlXdTImnJtaFU5gFDaetqrmcamqVtT7bFVQYUn8WFcbZFP
 3KMf5sviVUFn2T1ABRPn7LsQ/FHXb6wtH81FSr9UsfFMRrU1jqE9KlupXfQOSUr2VWGmox
 x3caz6SPF/N12ORrx5l+V5akPmfyNUSfjjbpYxWqNDO4XusDsmS40FZGVsaoRXoo2WMFwO
 A5CxaBoVSXwoTZGfCUXTc4cjG9al90iDyq3FVrtFYl/gIZ6n2Z0tRgZH2Ygo4CSJHf4twc
 GmOZtNNDFEvFRgqtmk9V/CLeVJypVlAd2oiQQpwsUW2MOn8nKslEZVyn6uKVDk6pP7ktAc
 g8Wt6zMuVOrLFNcsSh71HA0gEBmBacmnjcRUx6G8arxjQl1gsYKT0MILul0YbOfVrJVPo/
 uV9KFhfSty5RLErGwoonCzbDoHgHTyW1P2Z0wRz52Qi+LG0j7SZr7hQgVTYwoLwW6LTHnA
 RFqf1Z58D2GAf8rOW3u3JdUcV67T/qMTemfdnzsdCcCgwCEihYVxNhGfaD4zHothGYY/1h
 n4OKjNl2DURITXoz7b7hcHieWXT55xpSsxVICX6tciT7rfqh/7z7H4SM0UGCkKwn23yav5
 1J7Kgqfy9A1PuFnxDXSt3io0iZiiw78KmXk+6rvAxDNZeOPopJpLwJXkTViS2QRjSJb5xP
 InJ7wx0GIJM0TbEAbqv+9i5PU84Hbj8n4ApQNeaHjFiL37dCmrqC3cL4uSRfTDARt+LEiR
 7mCXPAW+5s5Nx4J5cFbLURBvA60N/Z//tjYcwuR8GvRv9x3b1Nu3aolc2n8UlZeYpWltDM
 zQe6ZHPcJtWPid2VDQnJMvwEP8zxKPJb6VqOzRAOxoyOTSiPcNtD8tRcFF7Iup5oNcDKwt
 PAL3uCCcdqt4aCMH/B5b1jQtkpN1VOkfHWhsYtJ+VkE3fc+iFTV6Ej8iJHJZ8jahG17NRE
 cM8ulYcKAVpgvSOl99nGTz6s9gC0oX7jXJQm6G3TMkhWEGUCmsXWFLem+SKxC1WS5QKCiN
 tvwRGWZDpQTUPn9m4jrqIJGIFGCiJDCFwj3NNxwxkL1/boQEMGAiClsl4V6yJjdUE8/hjz
 advbX8lbo/d6pneh5HwRThQ2yJZz0G+tFNiGZvvlFWjRCpNcfnAC5k2dbB9JI9sF85r8e/
 wIFOY3ADFpvPUnpPPKryq1vmUOEMkiAlrbcZ3eMNfQYa+PblIVSvVGAce/1wVT7igm2GUN
 Uopeod2UpiDFgf71I43j1nx04mdgxIsLb5R/z5ljrrV/tPhZCVhfklv+nwHdK1x0Hw+7hw
 5ZBqbqGayLnVxg7g1QnRBSvQ

On Tue, Nov 10, 2026 at 10:06:44AM +0000, netdev-bot+sinfo wrote:
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Patch 2 (ipv6) is the counterpart of the IPv4 issue fixed in commit
7d3f3b4367f3 ("net: ipv4: Cache pmtu for all packet paths if multipath
enabled") [1]: a host with two ECMP uplinks and a smaller MTU further
down the path had flows blackholing after a Packet Too Big. The IPv6
side was deferred back then at David's request [2]. The new pmtu.sh
tests in patch 3 reproduce it and fail without patch 2.

Patch 1 (ipv4) was found by code inspection while reworking v1 after
the Sashiko (LLM) review of it [3]: the same "replace the exception"
step that review flagged in the IPv6 code is in the IPv4 fan-out from
7d3f3b4367f3 as well.

[1] https://lore.kernel.org/netdev/20241108093427.317942-1-deliran@verdict.=
gg/
[2] https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@ker=
nel.org/
[3] https://lore.kernel.org/netdev/179236119085.3135.2701233313088371263@ke=
rnel.org/
