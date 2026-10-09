Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AACF3CF210
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 09:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539458; cv=none; b=t/Lfn5LQ+4MztPe22GonGQI7O/ZWKY8JrSyakiAriyx3wMbw96E5/oTIVbhZIiKUAg+q9jciWYCWymmTpOIx4ActqtdqZc8+TDswpzK5EC0VyAnE3esM1Fj4VIsRCG0GzQMVz3+Kd7FRf9QodYSEW5AUi+be1awpwymrhArc3nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539458; c=relaxed/simple;
	bh=Yz6wuPAWR3FnxaZD/Hsy6uS1+1e7lH+YUjWeAZdItXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+6tEa7i/LjpzMI+Zqbmm4c3cIllpA3AMyShsV5WaUqU+Zsj5JST4Vc91MsMS1r+xo3di90yDddIsQyjfBbpAbfOtntuaVabxGk4g4lvMV2PABewDRS477T3U91nUxgxsJjI3bcdguK/H36ibTSN3DtiZPx0GfTKBbqmYlo0A3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=HJOGT9n/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="HJOGT9n/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d04e4a943so1775875e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 02:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1791539455; x=1792144255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mkuIOGDPXPuT/7Tp+eZvAIWGyivfRf31PISNCWLWipU=;
        b=HJOGT9n/exi7W6Ub/a7/97Ih7XhdRTGSAzdhav22oypY2OoixR7XQGTM58UD6zaq4+
         QrUneJt1T2XlDLlvNl4oMavkpIkcdQBK4atg47nGl1y5xl17xKxJUf0ITs6t8AP2YODh
         9emns+a+2aRnOQgamI4y/qh001sX0OMmtGYuokvfFh+ZHPY/122jQo6Qnh0BL2h8WFOb
         D5a9OX/de3ZP6u0nd0ZLF0H9dOCTQQQtGMc/D5mfVBUhi6R2onzjhKHQIokNHEcoZkTO
         69neR0pTzLXIXqNWuSKgX4vkeRCeUJb7zkLvZkMOR8eIbqhlM4D9qoWYonx36r8d3VSe
         B0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539455; x=1792144255;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mkuIOGDPXPuT/7Tp+eZvAIWGyivfRf31PISNCWLWipU=;
        b=LWbgPBKqhHRSt465BXBqbzqIu8phTeBHmOPxQSQFa33o0vOSTlmeBPsWYwvXiam5Vg
         Cd+oa7Gbts34CeACHhQfU44ugaRraeHqIYfHabdX4UakkjAkdkgOL7+g9WGf8VvDFzS8
         Q6N9ilfqLAk8AaXeVXk3kQ3dHmEDC6gY6PK/wG0hk0hM6WlE7tXEMzpf0dkK2+cqFr+t
         qe9Fsmp3bcgJALogazoeMZbpNT+PlNj6UvuapmLJw+JjsW9wmWm/XNFDmL/VhkwPH55I
         zau5EqKlNM/UtL6VUMGpQaILtvdwGrk337J7UyR5c3aGmqxy2gS+Kkb6B3KteHxek5IL
         zIYg==
X-Forwarded-Encrypted: i=1; AKwUvBzIg2FllA5G4z2noO6hosBa3gYhx9E8x16OGV12maS8YBUJ74mTT/9CDCK+ceNd31Baa+jRlRAe6ttebiOpsRk=@vger.kernel.org
X-Gm-Message-State: AFuF++nwR5+zVcFsINC/dEdaSEiQB5nX/pFBm+hZ7i2u+rvWO5d4QfoH
	bbtPKDKKiTK4B5hJ4lrws5syu2hd2AzCLL0fuNb/w9onHjuOk0m6QNqNe7zZhlUgJPA=
X-Gm-Gg: AYBFou1qmX5grR3xPAa1SUv3PLlCuDesThqiosb3TG/UqjVyHUgO66CLFAWX/b4Ipmd
	i3dVXPG3efFTqDwyfEzlJwn8woRvR2gA5D54mIlXw7NuKv02g/gqZ4N4JQyFFSUVq6ZIqSW49dt
	/yGyqKTzPIKu/ASwQB10d989Z6xSlgzKhyv/B7ds10w32BG0pWtvPyVSCmPbkx+Gj/AlcT8JRcU
	cTlFw4fBt7nB7QCF10dD1K4iDm26KvLyqme3L70a1ia2O5s9jd3OlBwDMHARtj7k6PQGH3pkQ+r
	WmEcf62B5X5SXMmRZED6HfZmD+OjdSXW7KdFcWc6qkTDPW947pBGhLtIa2kRuvjkFGpJ2r+vs/T
	iF/p/ZKzN/w5z/3uvGTQTVGmufJXTC720vhVJcQH6Cc5jsYWm5jSglmTT0FCqe3Acup+oPMMuKu
	zObN0mSmK+Wv5J+nQHXczHkhkT/Ca0KAjyoYcVn8oHwmCuD76MtRj184yDjPbzvi81JPbk/Zj8G
	qFQE3qqAcp1+6HIhZ0/KvVY9uYcO+TqosOrwImUA3xKmw0QJ40=
X-Received: by 2002:a05:600c:4e45:b0:4a0:13d8:cd0c with SMTP id 5b1f17b1804b1-4a18e47e330mr25254745e9.2.1791539455518;
        Fri, 09 Oct 2026 02:50:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea1021sm44280795e9.10.2026.10.09.02.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:50:55 -0700 (PDT)
Message-ID: <5d0a21f2-0a7c-4c66-a3c8-e4290dfc0e13@6wind.com>
Date: Fri, 9 Oct 2026 11:50:54 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v10 3/6] net: add a generation counter for
 dev->mc changes
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
References: <20261007115821.11332-1-sigefriedhyy@gmail.com>
 <20261007115821.11332-4-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261007115821.11332-4-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 07/10/2026 à 13:58, Yuyang Huang a écrit :
> A multi-part RTM_GETMULTICAST dump of dev->mc resumes by position, so
> entries added or removed between two dump rounds can be skipped or
> repeated. The IPv4 and IPv6 dumps report that with NLM_F_DUMP_INTR by
> stamping cb->seq from a per netns generation counter combined with
> dev_base_seq, see inet_base_seq().
> 
> Add the equivalent for the device multicast lists: a per netns counter
> bumped whenever an entry is added to or removed from any dev->mc. The
> list helpers do not know which device a list belongs to, so give
> netdev_hw_addr_list an mc_dev pointer, set for dev->mc only, and bump
> the counter of dev_net(mc_dev) from the count helpers. That covers the
> dev_mc_* helpers, both lists of a sync, the hardware sync helpers
> drivers call from their rx mode callbacks or their own workers and the
> reconciliation after an asynchronous rx mode update. It is atomic
> since the writers only hold the address lock of their own device.
> 
> Used by the following patch for the AF_PACKET multicast dump.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
