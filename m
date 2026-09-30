Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEDF4D0CFD
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773493; cv=none; b=I7bIHrt5yxDkUJQtDvj+G/hTzCI2xsk5/kJTKtycgM9pce37gikI1NknBy81zxom8+1ncJECBF1abDz1AAkzsLi6QiAGuHE4qgQ8eIdi1pgOX4w+v4Aw8FyH2DAMW+vW4UmkUg5/9DLeLO/ds+Ft7coJCsJV5ZJmpHhG53aArcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773493; c=relaxed/simple;
	bh=oxZiTuR2Id+eSkbVoP8hkGx6rui7jsikVu42ZGlSRFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/iEQz7vHVGj/4d6mqSvw3JK85pAzKR3dwfrIc/JcefLceGh3A+NVVGKlPgatjRITK4xR7DQMw/9883+UFFx6BosIBGKcJpSsHmrdmAwgV5loRlLxHrzOgCMS5vyh2q9gCj0rWLqdLseVFmf+Je2ED0YzunCo7Htc0mQ64Gn/44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=AwFW2UVF; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="AwFW2UVF"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b55da8so549065f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 06:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1790773482; x=1791378282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cdMdvjWVLIDEVS1UUHPgTOR23ut4C2R+qU5zRynN6ZE=;
        b=AwFW2UVFDut0KXcQby5r755V4y+wkBed/xWk8s+Cmq1sIBMuJ88qlBDia90lktIt4m
         Cb5Lno14zl2pcc9//aY1+Q0sBoBrXTOIlSG/qVHo6NUyzR604zuemIJz8XjrqogvmHLf
         zV/gcQdpRTiGj6BnfzdWIps4wFphkDBQzMAL5aVAOsfuDJYGx8P4/cwypOsL2oY3vAL2
         qTkPcibOojxkncb0cSphmUSFLyeFAfarGwUcQnN0z3vcUsh3ntILlgS5bzQFBszq6ZLp
         3dJsCbggGUzDgqAkJ2PM8NIdt09mexIQuCzPGg9CJALW5QrvP5ypLuw18MWczKxiAM96
         PdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773482; x=1791378282;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cdMdvjWVLIDEVS1UUHPgTOR23ut4C2R+qU5zRynN6ZE=;
        b=HTgIr58U1B6bVFm+3R3qYXS+u+G8ojORg4xP2+xO/b50XAS+N8DfZaEGVdRoNKiLdS
         c43N7nUBghWeK+6zjbvkTATxYDQq8NZCImtR1KDnQEYhXxObgDdmryQcsNHWJQMsNS3Q
         c7cP1+yeC5tzlM+SI+/dKJX6jxBbKsJAmGIsZr1BFL5TNgrFTBZZ/DkIeM6XWjZ5ELrP
         vATGZoydHFnIraUrzoBmYLtm01i6EHda+1aukU5IUdQLBKiKQ/9LM68QuBgVHQss49EB
         3PrHj4qaWB8NLMb5gyBuUM60ZSpT7vmVndux96KDLu1i0p5Av80afmrtGGMswzADBS5C
         MpfA==
X-Forwarded-Encrypted: i=1; AKwUvByoLPrSKX9FwDGLJza2KdjXto3ZNRPnzexxMQY1eRXg74fQhGxNtbedO+d7UIz6BlHQQHItFK8OGbIzM91DU+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBxXGvP/UGHIT5DSh4ferUx33ao3xBwPtHhLe/2RlhIJz7fms5
	0uid1LBE/hFPAN3UHk4Qw++FmW1nc+xohF0GPpxR2Y/ZHlHdEVEP+/7TTSxuIdKzlqY=
X-Gm-Gg: AYBFou0BFLW2r9+5depIo6+C3b+JaMGzByT8Q2/LNJ4l0qHSBCrIN8y+lNVHXpbAtXv
	iUFR8Ouq+UO/5UjK0BfG14TjFE0SrqrAQ3jCJKzvGYimOMAHfQAe4U0n6jtj5fQTPNtBpVyLYOL
	0cCvncIsmWAv8oDfzmCWz446U8Iq/mvqAuzC+2SwEAhhi1+9sITpkUI+r8s3WMxzQjpuYZPF0Hf
	CxLVcKf4Jyf5ttzIr+oMBGGOj3PTtiIpKpvC489B8tFwpzxWdz4w9gKTqPbSJ4rA9nHKSwRMTKC
	jo57aTc2tWhGcHm2rqUt01OvE4uxYvvjJlGxp9p35l3SwTQdzHqcfgIJ8OqY79nmPeFQF60yXUJ
	dY5JU2Iv1PB6cqxGXJQ9kayohlXkQFMfeT9NtiOSQlPaNp6jjd01ADSqyccyf8LVZ37/o/RSw4+
	0T+ne8DpyySXoyfgb/ndh7qx+v70Mm4t5w5wTpwdo0/wHq8mE2UTHy1eMDMsAUjUp5Uea+DvgDA
	xgPD1otCd2VxQjCRnInPbNVKxZugEEDNwmetVlwWSBmAsKdf2g=
X-Received: by 2002:a5d:5d85:0:b0:487:8ba:8b4c with SMTP id ffacd0b85a97d-48b024297b0mr3902212f8f.1.1790773482052;
        Wed, 30 Sep 2026 06:04:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029be7cesm3805401f8f.8.2026.09.30.06.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:04:41 -0700 (PDT)
Message-ID: <3019f327-1ea1-42f6-b133-597ca1cc524a@6wind.com>
Date: Wed, 30 Sep 2026 15:04:40 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v9 3/6] net: add a generation counter for dev->mc
 changes
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Kees Cook <kees@kernel.org>, Kory Maincent <kory.maincent@bootlin.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
 <20260930112842.21323-4-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260930112842.21323-4-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 30/09/2026 à 13:28, Yuyang Huang a écrit :
> A multi-part RTM_GETMULTICAST dump of dev->mc resumes by position, so
> entries added or removed between two dump rounds can be skipped or
> repeated. The IPv4 and IPv6 dumps report that with NLM_F_DUMP_INTR by
> stamping cb->seq from a per netns generation counter combined with
> dev_base_seq, see inet_base_seq().
> 
> Add the equivalent for the device multicast lists: a per netns counter
> bumped whenever an entry is added to or removed from any dev->mc. The
> list helpers do not know which device a list belongs to, so give
> netdev_hw_addr_list an owner, set for the lists of a device and NULL
> for snapshots and other standalone lists, and bump the counter of
> dev_net(owner) from the count helpers when the list is dev->mc. That
> covers the dev_mc_* helpers, both lists of a sync, the hardware sync
> helpers drivers call from their rx mode callbacks or their own workers
> and the reconciliation after an asynchronous rx mode update. It is
> atomic since the writers only hold the address lock of their own
> device.
> 
> Used by the following patch for the AF_PACKET multicast dump.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
