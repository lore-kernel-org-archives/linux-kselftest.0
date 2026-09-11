Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18FC4963A5
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141490; cv=none; b=d3N2XWkGrt7mBA+EM4sAUPSYa58Oqn1gE/+KZeSWPZnxeLzRv1YyQBi/FNj9GMpB9ofWJ9Lo67cgxyk4OsMr3liSHmaX9grcCo/x4I4H6srrXr0F5K+2Q4xOy+yhJb8G9jAMi7v5V+sE2PMLMzb1KEVD34t8Sp0IjA3njwOGwWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141490; c=relaxed/simple;
	bh=77LXYXgJoDGNgKFujHE3OW2GeMjh6O/I1WWs4eD3Qlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLMTMVNxD20ucfbQXrbPIjKZ04ebqSGb0TGWI4QMY4EC5bRq4cEFbfJRqm4o6N7nuKqZ9TTzOkRKyHFFfE0hU9Q8Hk8f7CZItvN/81eULwGOUXApOsIIP0TkYtYVPRv+5Habgif5Aufj87EFjWc5lsA6E4WXlfQW+bwkC/O2kI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=NXoiy4eb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="NXoiy4eb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b4ba7fe26so35215e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 08:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1789141486; x=1789746286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qMq+XvZCJh1BRiDCee0lFcd5HC93x9tlqE/S4GTE3zc=;
        b=NXoiy4ebCtjh4lLSsxJDBqyQ4uODvTzkLqHI3g4kf14U8AGKGMACcSWJ/DXjHfROXU
         BAhhFC2MxHfvS23SW4QcQ8BS64t4i/oVI3JhFJkXq4O4YjFWTmrMgIHMEFgflEFzXLU5
         keY346oxUZ4YtSfxdKMGezfVO+Y77FbEOrFKq/ml7xU9hFJ70MXfmFBFHxeweBa7sDLA
         ug0x7AA/7WUCwTmHdQazD29dOtDQuvoLQlR2owzGmJgc7Gicvq0SgEUI1PjXXdZAVcXc
         hSb2kdut/Y/fiIlEcliTtaTfn6rhAXORKHCE+VxKpvjwzdkvvjdHDNQk+q+nmuYvmDac
         xOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141486; x=1789746286;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qMq+XvZCJh1BRiDCee0lFcd5HC93x9tlqE/S4GTE3zc=;
        b=cxjHKy27vInlAAir8lefR3HxWGA5uD3+NKnKpQSHmDlKZ+IYZOxc3gz1MWsX03xi11
         qqkml4JIsyf8AMFsZJDtsew/Ueq+bLbnN/1MXWXo93kkjYazehsWSrW4eh3yh29MqMr5
         DGzXrnax/D9Nnr0ZokzlnBwuNx/bXbou/0hvX8R1XXq77O/vKVsCx62v2DEY1YQHGk5o
         jbN9YABbtWTKF6dFXYLSCkBR2+qgWdHQvueLPKXMraTks1duKentIdeH+wFzDgIn/h4n
         dq0xraPUe2joq5V1lxVescrBIGOL2xOKuJc+JRmRrfDn5nJrFyV6Jlc0hqN2tln4MKln
         0lBw==
X-Forwarded-Encrypted: i=1; AKwUvBxZQKulbT48zQaf5GMNoEsDSwnRuMjeWcQew1Wa7LrUJ6248gojh0Zov/WFQM/BQxDlIxAGpGMyZ/JMc0OnaS8=@vger.kernel.org
X-Gm-Message-State: AFuF++mMjxlyhj5EAKZ5UAlfQKWZpp5b4bg93oAvWi3ZNL8xkR5hY3PN
	BX8jpZJRMrEbKWes8a36XUQ+02VV5khjKBSO0d+Cqv1sYnK6iRc1SCCUqL/f40exP1Y=
X-Gm-Gg: AYBFou3nONuIE5FM63r2YvjGlOHNWxkSKYee4d/tpQGbxg27aWMSW9idj5Vwj8e/vvE
	DZGFCSPa0g2HG5UdqL+yGfd29qTXpK9hCB6aG8KOPSBPhafMHidQUAG5fQ4dr9ruwhvZ/gE3wgG
	3xJ4WlXAfnBpamSZ5o03ie43lZSCyOVIDpeWnZ4xYEpqHupkB6Zu+mnpR8o1CH0uvi3Qm5VcIQk
	Brwr/OLs0NOXwU8RX2ndQveyHAvVueLqolApd8c5G8AlOFtPZUjAMmmy4rem+i578yHhRbjhkmE
	/Vhwfb6+AHITO8Nbjd+Qamv6Jt3raVSDe7gIR0srC0+3Kd9wXnWRPBUsyKN1MdQ8uqqAJ4KPrjL
	h+wk2zuxS1KxFSKUoLyPKAq8nkl4QiA+fdMGLJN7GU4QPPAbcPRQMHoY67+QlfsLtXI1u/rqeBm
	iVHrSH6zKqD1YO1esevTMC6WNAO4Oid3pYoScBsf7DF4kkZF0aiWBVSv23rAfZmqduoDguTKGiJ
	Joc+yLa2Cjm9Uk0szoV3yMp/gTpGAFrDrkpvti88zQBt8m5G8ot
X-Received: by 2002:a05:600c:b99:b0:49d:1da4:511b with SMTP id 5b1f17b1804b1-49e619a8962mr53370715e9.1.1789141485841;
        Fri, 11 Sep 2026 08:44:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26b7332asm161865175e9.0.2026.09.11.08.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:44:45 -0700 (PDT)
Message-ID: <3a7bd165-cba9-42f4-a761-61a9031a05d0@6wind.com>
Date: Fri, 11 Sep 2026 17:44:44 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v4 1/4] netlink: specs: rt-addr: fix the type of
 target-netnsid
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260911105103.7771-1-sigefriedhyy@gmail.com>
 <20260911105103.7771-2-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260911105103.7771-2-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Le 11/09/2026 à 12:51, Yuyang Huang a écrit :
> The kernel parses IFA_TARGET_NETNSID as NLA_S32 and rt-link.yaml
> declares its target-netnsid as s32, but rt-addr.yaml has it as binary.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
