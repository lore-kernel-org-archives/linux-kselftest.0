Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBB72253FC
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 07:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880655; cv=none; b=lEzh28LbDU5ww/W+E1VMhcJgpywvsfR4yxPF///3D3JJK1TtERZI4V7+z7dG5OC3E5utFJYuTmbMybtz1G2PJVDvTCH/Ia4MLR/8d2DHmry8ak8JRqki11p58D6x1iLRT+0ZSibKXqvEILUhFnqas+qtRsaShnzktvRDNrBb9IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880655; c=relaxed/simple;
	bh=WqTgDRyF7thxXL2tFuIlt/14bQOXqqiDNxfbMkQh+l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5vC6UZFwtdO3yby5WCOHOmzxOsRY8xJiTa8Fsfqr8GrYnX8bZVPLvhH2wN3cCKxm5rE/avtL+4wIG+RGQauWQZFYIo7IdE4U5fEjwVKHPlwLZzqKjYIZtMY9XCPFDHx5iKbxXNJriOpwzkPJO7AYSep17bzxvAJlEQCk36Ckm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=XFL9Is5g; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="XFL9Is5g"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-444826c16ffso3645837f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 00:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1777880653; x=1778485453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqVl4u47O1sLc62PW00yH8pyp8rHN1ZyUmrViFkDQUc=;
        b=XFL9Is5g1T1huGr0lGuFfsrGeJ43rtB7zVJRoKl9ccye2OYGNojfUWjor6vUUBtcRV
         /6l9h/9VXWOKiRb+SL5OKbwV3g9/De+7XsnULCXxwPA2FtiACr3jD5J8MRECk/lFX1EZ
         pYMt4A+6D6MXgb9p75q/lv4MnNnx5cy39KQFZeC5EIpycqoFHKQ66CVsi4FbQktCTngd
         hsxd2XZEF/6QxuO0pzRK2gnamBxHFL8OXdgdQSeeKvuq9CH43D/S7+vuER9//Jle2c09
         FPOd9jESw6CKA50O+7va40HqaTqPUrQqYY1BnFjaeo30tvGxBxfPf05EzU3wMdSWS+uJ
         cOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880653; x=1778485453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqVl4u47O1sLc62PW00yH8pyp8rHN1ZyUmrViFkDQUc=;
        b=GbV1YtsMQSp6rYcsYfYTlPp/WMHgc6FP67rf7eMHbKoWy4Ry8uv58Y2K/gU4PNhFDx
         tX7VM2UVl0O3iTYISb1jAO0dtwAss4OS384FWzpZgUCWK84PqLGNHiU5gMQ+a7jGEgnQ
         UqttB3Jf0rK9uQ3wh5hYf5winQiRJ1RZ9A+T54Y+M2AY8MSwWjg9UaPIiInY1udaKmlh
         eyW19Ev0aLorfiSJOo6KofkJbrcVyfI8dlToFxfbZgptp79WSBl0QsjHmtaMI58mXETs
         OMQZzkbRgFapj8bVyQIQECyH0DldIs54/msMWg0LcgPQiXmU/r4W3LEKPErOgmBkncdG
         wucQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fd73KBWcT40nBcYT6prjMHXdfZSFhW3+go8Em/xs4VEreeCSDMBJPC0Fg0aycstHs0ZFgmQlO/cPPGFtCHcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH/nsgRwSltDUgNm3Pcdgwy5FNTobqIMD+uOY/rQDNi18wJhSk
	GGUYwyPUuUsKeYEBbjrLB+Zkw9W4kRdBWlvDSVGjDbALxaJICCnWJ6MfJqVq0TPFg6U=
X-Gm-Gg: AeBDiesfij8ob8mBYA/+1jNGHsown3cnzuG+CJ4BZpGxREjUY8NcZoqWl/OpnzWL2wP
	0C74nioMY45/u0LdLXGmXl9IXOlk+FV398NntIFzXJGWINIdLMqF8YRcLEjNlJQjCDg90iBzycq
	I6R3dc49d3to7ghhjnjQ0muHgvtwfnikLyagBAwr+45h3Dh7w9UHzC4wJhFxt38LsGtQUd1GJJJ
	s7WlGjK7IFa4OOCbRKcxTs21NosVbT1rYDLwg/W0p7+mmJSkijDkj4adPyH4WT6cBsJ8MDn66mK
	h8LS3qPnUMOdD4qb53zQ3HO6dMY+oeuWTHamIzZYBJ5IMIOiQ5Yy5aJ+tNutI/lDLxtS2GIp/MK
	vFmmlPUPgGZt/IV1tQ7YZ2oWCI7MR21mv4bo8cL0hxiGMMuEqrhTiuWxkGt+92ntm5ZdPvA3H/h
	LY7kwD3nmEyJO2TXjC9goeivwvzn4/zig0fa3URN4mfUZIYq3VMeRK4C45NOTONKr7
X-Received: by 2002:a05:6000:2f83:b0:43f:e22e:e8da with SMTP id ffacd0b85a97d-44bb444393fmr14065131f8f.5.1777880652602;
        Mon, 04 May 2026 00:44:12 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981ded99sm24332121f8f.18.2026.05.04.00.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:44:12 -0700 (PDT)
Message-ID: <fbbc57a7-76c7-434d-af40-4f0e8c314aad@blackwall.org>
Date: Mon, 4 May 2026 10:44:10 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 6/6] selftests: net: Add tests for
 neigh_forward_grat option
Content-Language: en-US, bg
To: Danielle Ratson <danieller@nvidia.com>, netdev@vger.kernel.org
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, idosch@nvidia.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, ast@fiberby.net,
 liuhangbin@gmail.com, daniel@iogearbox.net, aroulin@nvidia.com,
 fmaurer@redhat.com, sdf.kernel@gmail.com, sd@queasysnail.net,
 kees@kernel.org, nickgarlis@gmail.com, amorenoz@redhat.com,
 alasdair@mcwilliam.dev, johannes.wiesboeck@aisec.fraunhofer.de,
 petrm@nvidia.com, linux-kernel@vger.kernel.org, bridge@lists.linux.dev,
 linux-kselftest@vger.kernel.org
References: <20260503073532.2138165-1-danieller@nvidia.com>
 <20260503073532.2138165-7-danieller@nvidia.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260503073532.2138165-7-danieller@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2026 10:35, Danielle Ratson wrote:
> Add tests to validate the neigh_forward_grat bridge option for selective
> forwarding of gratuitous neighbor announcements.
> 
> The tests verify per-port and per-VLAN control of gratuitous neighbor
> announcement forwarding for both IPv4 (gratuitous ARP) and IPv6
> (unsolicited NA):
> - When neigh_suppress is enabled with neigh_forward_grat off (default),
>    gratuitous announcements are suppressed
> - When neigh_forward_grat is enabled, gratuitous announcements are
>    forwarded while regular neighbor discovery remains suppressed
> 
> For IPv4, use arping to send gratuitous ARP packets. For IPv6, use
> mausezahn to craft unsolicited Neighbor Advertisement packets.
> 
> For the per-port tests, the IPv4 test exercises the ip link interface,
> while the IPv6 test exercises the bridge link interface.
> The per-VLAN tests use the bridge interface throughout, as per-VLAN
> attributes are only accessible via 'bridge vlan'.
> 
> Signed-off-by: Danielle Ratson <danieller@nvidia.com>
> ---
>   .../net/test_bridge_neigh_suppress.sh         | 298 +++++++++++++++++-
>   1 file changed, 296 insertions(+), 2 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

