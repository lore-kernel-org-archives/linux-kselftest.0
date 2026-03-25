Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EB9346AF1
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774423713; cv=none; b=FeEvAoA+Z+9K3JkZm0Dj+7WRay+A6VjZ3j5WNBOI3MDRQEQwbriV7u5bH4KWe54u913JHpzp8M9PyODlrTgFDwuImf2u7OCeCHpcGpiX+UJuk/9qBBfH/qgzcR6N3x9a9BGfAQSJmvIiPM3BxOkdXPBxmigE5qe2lJ6DlLvwbwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774423713; c=relaxed/simple;
	bh=S/BaYDdPcQXTkL2SnY6Z59AFoydNh1oEXzUXxXeESmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPcpXT2tOne3+5JF+P9YYtbP/23XVDON2ssv5vYx06QYzNXc6brudZq5AkdTHK3Cq+RtuilAHGhUeBQPfo07W5Ni1EAGDG2VO7tKvY3iPBzkm9xv8PISO8+uBLBkhbEU2QSD4F8Ot9PGJOV5ZAortLpodNRI1MAFS1LP1i0vmjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8Pfbuyn; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8Pfbuyn"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9358bc9c50so323520066b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 00:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774423711; x=1775028511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xXcLoA3AOm8JsZyBFRvvn/2aLGbl2SRuVxCEIFV1m/A=;
        b=R8Pfbuynzy68urWZLJkASnZ3+9kYqcCyt/sSj3Ubahjjffw0/05utO4gY5/m8JhhCi
         t6wzAew/HBmrScLgU9X519rEOBW7kSP6Rt8hXWGCKRTdgj8tOjvyNPTtcAaMN8NYvLUY
         3M3NVD27n1r8tf/eGAiiLEh8xkEoIyeEQ3vOnBJfE9EGnlCn+F+2nxgBEbS4sVIxJ1XN
         1fZHjbVQYzAOijX2P4G6BRK1hBUnpkhJ3bIz1xwcgQqPSSQgYge79AX9meLht2uh03zu
         k/pl3n8IfJE2w9lc21mkNL1qApCqMiK78c//Kgz13gdIbRjuw+QNLTm3ELxR17emZBOK
         jUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774423711; x=1775028511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXcLoA3AOm8JsZyBFRvvn/2aLGbl2SRuVxCEIFV1m/A=;
        b=ItQZgbavKj/+2UO5v7xK0DLt0Dfv44cH6CT4Jm0WbgpExQ43X9TP0v3MXYzYxjaQtf
         +REYni5phGkJpp2NpXk//d1lZqmnklg819blFdyLoljxde3GCd72XOtJQ8/o9Tw0YYVR
         RdP0MgfsX4Z877CfOr6Nyf5ApdO+1WG33hIcHIXmHeF/JycR7paCHOJVCQfBjatTibTa
         fPVr2qCuVPQEjbz8AwVpOBV+yoWfw7g8CR9Oxa6DMH6qLDcFmgTomtav1nbf46dK1SHf
         JsSdaJBA2ZfdWZdh657NOIWkj14nnSdYEd8dg/IjVoZZQFuZ1fYLu11CfGq9Bh0Xn17F
         f3FA==
X-Forwarded-Encrypted: i=1; AJvYcCXv0teOirH+lMlxCO5k3U6IafRw1ADHhNGaEW0wi7uIWG091fHPP9VuXKC/YCu4agoH6T/fwTDXx1BrQ/gBx5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOJwoirlkHBOp4n7JhhfycCaRszqkIZxse9yo/TL//YkboylpV
	3lDQQqhxaV3wCInKvZJUU6O3V1YJHzYRNC5bOts68ep8e/TnHhcrfIAq
X-Gm-Gg: ATEYQzxolmxghGESL4LzsLrasDXfTqelwH4Dl2+5LtiJptxO1HRYB+ExHNOJS/qNDoC
	h2AUOK63rYP1xJZFyA4BT1A3E28Pt9hrZ/6GUa8Bn2qeJFWwYWOmaZbbdWwei2dBixR8jKnCyno
	YNJyDWehc9OOIulUdoISafMhMK07bGZcPYe1qvYEealJ1y+c38eFjWPR2uVb/dbYSQKBLaC2bWk
	of/lIpQWrJgMJjdvB+H12pZ5j2VZLNQNRpwxIBlNOhMRaVt4MJXBu5sVdDMk1kEK7iDij0bp9sA
	7jqyc6/U2sURUY+hon7svZ+wmWQss+qtorOw9rWldO+0iOPD8SXmrhLBId2+iuFDcendgJ8bom9
	UmfDMVh20AH59jtW8Qt+Jp9LOUm2Rrx8K+8EmxcwYdCDHJGnDOZE0VQIOP7jlCFtNadmgY3SNZ4
	8Njr97t6z2xvVMkbf+aYsGvLy3bCgrExcpyMygv9AgwTTEGgyMGMOJTCQjJvQDkKGeD3dFEiVrA
	fbnHzbxLrmc
X-Received: by 2002:a17:907:d1c:b0:b98:6c41:a77f with SMTP id a640c23a62f3a-b9a3f1a815dmr138126866b.20.1774423710456;
        Wed, 25 Mar 2026 00:28:30 -0700 (PDT)
Received: from [192.168.0.2] (dslb-002-205-018-238.002.205.pools.vodafone-ip.de. [2.205.18.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b984b056f3bsm573597266b.26.2026.03.25.00.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 00:28:29 -0700 (PDT)
Message-ID: <abb8a10c-571e-44f2-a15e-1d5da288963d@gmail.com>
Date: Wed, 25 Mar 2026 08:28:28 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/3] net: bridge: add stp_mode attribute for STP
 mode selection
To: Andy Roulin <aroulin@nvidia.com>, netdev@vger.kernel.org
Cc: bridge@lists.linux.dev, Nikolay Aleksandrov <razor@blackwall.org>,
 Ido Schimmel <idosch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 Petr Machata <petrm@nvidia.com>, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260324184942.2828691-1-aroulin@nvidia.com>
Content-Language: en-US
From: Jonas Gorski <jonas.gorski@gmail.com>
In-Reply-To: <20260324184942.2828691-1-aroulin@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2026 19:49, Andy Roulin wrote:
> The bridge-stp usermode helper is currently restricted to the initial
> network namespace, preventing userspace STP daemons like mstpd from
> operating on bridges in other namespaces. Since commit ff62198553e4
> ("bridge: Only call /sbin/bridge-stp for the initial network
> namespace"), bridges in non-init namespaces silently fall back to
> kernel STP with no way to request userspace STP.
> 
> This series adds a new IFLA_BR_STP_MODE bridge attribute that allows
> explicit per-bridge control over STP mode selection. Three modes are
> supported:
> 
>   - auto (default): existing behavior, try /sbin/bridge-stp in
>     init_net, fall back to kernel STP otherwise
>   - user: directly enable BR_USER_STP without invoking the helper,
>     works in any network namespace
>   - kernel: directly enable BR_KERNEL_STP without invoking the helper

I like that very much! This will also allow selftests for
switchdev/dsa drivers for correct (mst) STP state (change) handling.

> The user and kernel modes bypass call_usermodehelper() entirely,
> addressing the security concerns discussed at [1]. The caller is
> responsible for managing the userspace STP daemon directly, rather
> than relying on the kernel to invoke /sbin/bridge-stp.

Should the caller directly manage the STP daemon, or could the STP
daemon also just automatically manage bridges with
IFLA_BR_STP_STATE=BR_STP_MODE_KERNEL (and IFLA_BR_STP_STATE != 0)?

The latter would require less changes for network managers, as they
wouldn't need to be aware of (individual) STP daemon
implementations.

But I guess either is fine, as long as the latter behavior
configurable.

Best regards,
Jonas
