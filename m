Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820032EB5CD
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 07:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880635; cv=none; b=Ik/S7IptdfK0/UQ8geOvDWy50DXehF5lWS1dENdr3hfW9nA+7ea93QTJ/X2Zn/k7GMEQBpSwIgsCllv3BoLxy/l4KAxReWbTBjwkTZeRIS0lPDNhfmV50ImOlh6+av9/Nx/tvn3yjoCssVTgpo7RTDpGRCuoJUrtHQ2/pgSP9HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880635; c=relaxed/simple;
	bh=boGwKw02j+YN2/NIEQgBpXs69EV5KI3+mVKmW0Vhc30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8O6hE1AUmCMN4pQr+MfQlzPd7fxEsyyjpCm5FT7eJMNLD4Xlp6KCmP8cgMD4y+323BAS8Wylpeo+7M6ezS21HVY8xl3LynkRH8h4YIGHGu2btABCTdKtL8rZt/ZR+xvJE7FEgBmL/vnRGzZuUPyY7LHTv1rhBZwPhUra7oR3eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=D7WP5BEi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="D7WP5BEi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so35733915e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 00:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1777880633; x=1778485433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VyNdEo2zQTUk85Np/ZYvwEJkoha6O3/ZtIdB/pJF5MU=;
        b=D7WP5BEiB6zf+NnOkiTUWSsBttOjGnxnz7KjwaqJR1BCL78lrksqQ9bg7VzqdTSaJH
         EE0ryx1CVwpFeHfOgl76nh9rvGmB6Vs+Qj+oTNtR8q1nL6GWWErF1eDpDZEfq1bq8WR/
         TzLTf2fY9NO4tANLqVrVSKQR8Ij2IeZPLrDi5NyI70Em/ibdUFGQ1sC12giSg1wF6nkQ
         G7eGTgJKxojtQz+N264J9mbYHqBcP9Ryf4QJU9e7D0j20o/ItW1uc/u8uVp6GwEp9O6N
         S9x/54g1MWTxZaRQOZupW0m/j21u1crXkU125fOAAsmMcezb5uNiqvwh606ub9Vu8Rhw
         UV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880633; x=1778485433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyNdEo2zQTUk85Np/ZYvwEJkoha6O3/ZtIdB/pJF5MU=;
        b=sXvu8aGtJsDol6fpO/bm6jngOErZpW++gLZdymclmK8pip4srQH5S9WTzTyYQ/MKWn
         YrTMUkhvfhSMJy6KpGHBQBipX9t+nS6Pkc0WOSzoJdk50KYfCBjl3Gqlfz9WFrV7lQ/6
         xukW4cvhqIEa1zRtpNAspyMWrteOMF/4zpL+aD395eDak/Y5WI+MQNlLMcXOo8zxjKLG
         r/meAmE56phvdMqbwLzpvNNm1qbZaBhroK3v/2+1iQVQR0qjJg3H3ZS7kT8SwP3kEQ1E
         smiXTgqQT2SCnyjVI3epu4jg+3h9uRJrVkp1SUY4pz9ECrLx3Ec0a4aMtCCY5wCE6fWI
         9OHw==
X-Forwarded-Encrypted: i=1; AFNElJ//QPhyYCpZW4KC5DTLKUIzaRIYmT1T8AuCXYwLPRK6hRb65rw9FeJPYPc1RBpSUkbhx0ggqWo0Gq1JxuAh5qk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyao3cddyaQegmePPRlGTHpwtMoZrs5AFUZFus11Zwjl6iiI8EF
	mdlkYD69wAq2mRUUD5mrdbyaM8ORi//wRyiQd9GuQSMmaYtkjnQDG80pLwZyMDUCE3E=
X-Gm-Gg: AeBDies8z7f+9TrHvu8SRkiP/3pAFOT7AMOZuvZd3s2XMTFkSRFUq+wVgrJVa9yGmcu
	g3s7fndA6/ufPqZNWcs2Q+OMgl1J43Qi2/tR4yXJqU9EmPMoN5zAz5l0/p4zltPswQdo+aCHknQ
	XMtvXyrRFhRXS64RimKAMosd1t7BHg42SFG3tPjAbPAbcd+Y8RP5S7ngBSeRCZwLX8do0BGyhra
	4imQz032TpmlcSw377Sk9gDLnAUkWWBBLcxyKVKENFlecq1VThBIH73+5yi8SxibIftsvV9QmtS
	Iikycn5j0BgdWJW+7pBosumJS3p+nTXJgRWGi/dJiGDLm+W/oTBf8DH/AXhPveKcUNGLaEkX+ic
	Dt9xbFVmYwFJtHl1Cfbf4uxyXp46HRXmCCI/cmOjF5h9yJiABmfADZMerjxzmSGhdLbwppXLxUk
	llzRknXY/cNXVpWwsXH47gVGU1gy729FCHj9Q71kQi9/ORmmCBTSCrOAOUODR1TDq6
X-Received: by 2002:a05:600c:1604:b0:48a:66a8:9981 with SMTP id 5b1f17b1804b1-48d0562f7efmr35523185e9.27.1777880632919;
        Mon, 04 May 2026 00:43:52 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm306862325e9.1.2026.05.04.00.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:43:52 -0700 (PDT)
Message-ID: <f3a36ed5-52b2-481b-aee6-c2080cf5f14e@blackwall.org>
Date: Mon, 4 May 2026 10:43:49 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/6] bridge: Add per-VLAN netlink handling for
 neigh_forward_grat
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
 <20260503073532.2138165-6-danieller@nvidia.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260503073532.2138165-6-danieller@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2026 10:35, Danielle Ratson wrote:
> Add netlink handlers for the per-VLAN neigh_forward_grat option via
> BRIDGE_VLANDB_ENTRY_NEIGH_FORWARD_GRAT attribute.
> 
> The per-VLAN option provides fine-grained control, allowing different
> VLANs on the same port to have different gratuitous ARP/unsolicited NA
> forwarding behavior.
> 
> This enables control via 'bridge' commands:
>   # bridge vlan set dev eth0 vid 10 neigh_suppress on
>   # bridge vlan set dev eth0 vid 10 neigh_forward_grat on
> 
> Signed-off-by: Danielle Ratson <danieller@nvidia.com>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> Reviewed-by: Petr Machata <petrm@nvidia.com>
> ---
>   net/bridge/br_vlan.c         |  1 +
>   net/bridge/br_vlan_options.c | 24 ++++++++++++++++++++++--
>   2 files changed, 23 insertions(+), 2 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>



