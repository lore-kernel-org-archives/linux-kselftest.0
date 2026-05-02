Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38846298CA3
	for <linux-kselftest@vger.kernel.org>; Sat,  2 May 2026 06:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777701816; cv=none; b=KljOam6sxvF1F0h5SWHSo9RrFLqC+ZTx/RVl7qZrzO8ITRgNicZ5Tn/kP6o2I5pxYpDNeQ5KAoPHZ/BP43y0Kv9KYCi/a04tJzuUbTwUnPXTauNbpaTi+Bkuv4e7akuHL3YK0byo3m80kZvffCT6WZuPRHt45R6Vo+BUchD6JnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777701816; c=relaxed/simple;
	bh=S7Lb+q3oEv3NVM0NPPBYU6eUyq6N8yTsNyIwBajUKE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbDJ+bJznKASXDrDPcRXngpuTf8K3esvu/fnB9GsRx1b5zxGL7O534qcrKJWc5PxIdsfmTZCqBu8fyqWGMDHJJ8HvGry+jeXA0u6kOtctWQ9yUggDfqzs3nu2EcY2wXrG43ekgeYX2HEvoRTRoSqdTtHUg2lmLMUhyX0Nv+r8ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=P//+BWXz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="P//+BWXz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso16967285e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 23:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1777701814; x=1778306614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZREXi6KS9s2NVYeEPr0xKFupND9na8xQrKsYAgQ4Cc=;
        b=P//+BWXz7ZP9o+BvGp8jKVHG4AfZwRgsVPatQpCuJY2QiFkDW11orO9/bIUt2VGN9s
         Q37Z7pUIY8cBu/GZ6eiGk7gVD58NEGFzsxhVEbJ7Bb4oph9RH28nr6FpMMv12A+t/t/p
         jQTUinTDanSdC71tD9/BtGHoYiewTKjwWLFJK4y82EJdKu7QNKFcHgL5aBJkkUVutsbL
         WE8Ns2q/YlHU5SZPVuM0lr/Neaqgd/kYAas2MK6sYDsKdtLqQikQh5E9W8yDxKGU6P9P
         u2Eaxc4yU/ZPhMFe/OIl0jDZrSAyfrTLLDn8LVea0zCB8stBZhC0dQAMNRKJjoh2zTBo
         oxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777701814; x=1778306614;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZREXi6KS9s2NVYeEPr0xKFupND9na8xQrKsYAgQ4Cc=;
        b=ipEDWL/itncCHIOjnmDUhj9N5NoS4IvjfHperZaFNmU7aqjGUafiq983I4qqFKx7O7
         Hm0vs8pdszqkN2nydS+s67xKF7y7/CkWIMxatTVf8ksQf4HixEzGTqfRS7zO1tURA1+Y
         h0AjCA/azcMnTPgLdLZzT/3Bnn0SSBqzwgIr7k/wjX2y+rNhWwAwO6azGJvgBkg4f1KV
         XgRq5wOfFPypM7PDjXW3wwuP3uu9czDVuf+OYmV8RqN0WM7jCKOgQssnkSI7BU0mqsut
         LUbQOHdZKPl0iHdAyAjR4kCnJ9galOsVUEYJlKM14lRPe0Vb+en4jQFDNmbivk8ik2yx
         fz1A==
X-Forwarded-Encrypted: i=1; AFNElJ9vlqTLZVhmy7M8Ok30fqjG3w2fjU04mBpxoA2xajBMw1T8p8iq35znOabY2egRYhZFmaPNHXoEJYLn25eAgdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIunLm76dxKudUdHHjZhPy8gYgTpxVhlO8PSZGoSLiApMkpBXV
	NoYfu/HYdd7tF6qh1fA4p/CImGlM2WFtLl6wDtrNXn3sGpkdi9rWQpcYmir6liy+PdU=
X-Gm-Gg: AeBDietI6yizzuZ2FshdEp6F8JoDYcMRpMdNefF2izCSEmU4pTeGGgEKw80HPmXzBzs
	KuoDK/Uwurxf9t3sn7hU3dKoP90pitfiUqyOzJgFA7k7ycWVim8h4RMu3b+snswWKpk6P0KcpzR
	pVpDZYNoNjX+gS7JVk3l2v/qvEk7lEgDjCQ/2Z6S4oDUyzOBj1PbQFpQ35WXW+RMpdvE/or8ALV
	cdei8pdvdgFdp1Ale8PSGJNQWF0kDo9kkbByM2nEzaVVMAsExPl6iLExmyNoqT8xFoyVtnQh7SP
	63PDWDyyGeYpEqKu0O9p7InRJeQ5cU8GZBlJHMYiAyGsxZo1ugsrefp/xgoPzJ6qxcGagdk3s11
	sYEuh/T2hmuAKRLPnSwsVcAOA67NjUN5Dmc+Yv5RGIsN3V+WWOZqtfHRERXIY+bws9ipWjqmPHh
	QPF3LHf321aew050qNbO8Lg+ju7LiYQssQNHFdGFJw8tnzCIaPMClkxyYUcHgDKGv/
X-Received: by 2002:a05:600d:8453:b0:48a:5339:ef0e with SMTP id 5b1f17b1804b1-48a9852f5e7mr19973775e9.3.1777701813598;
        Fri, 01 May 2026 23:03:33 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fee4d60sm27091805e9.19.2026.05.01.23.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 23:03:33 -0700 (PDT)
Message-ID: <82343bf4-18ab-4482-9241-2f235f6f1449@blackwall.org>
Date: Sat, 2 May 2026 09:03:31 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 2/5] ipv6: mld: rename mldv2_mrc() and add
 mldv2_qqi()
Content-Language: en-US, bg
To: Ujjal Roy <royujjal@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, David Ahern <dsahern@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andy Roulin <aroulin@nvidia.com>,
 Yong Wang <yongwang@nvidia.com>, Petr Machata <petrm@nvidia.com>
Cc: Ujjal Roy <ujjal@alumnux.com>, bridge@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260501173130.3486-1-royujjal@gmail.com>
 <20260501173130.3486-3-royujjal@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260501173130.3486-3-royujjal@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2026 20:31, Ujjal Roy wrote:
> Rename mldv2_mrc() to mldv2_mrd() as it is used to calculate
> the Maximum Response Delay from the Maximum Response Code.
> 
> Introduce a new API mldv2_qqi() to define the existing
> calculation logic of QQI from QQIC. This also organizes
> the existing mld_update_qi() API.
> 
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Ujjal Roy <royujjal@gmail.com>
> ---
>   include/net/mld.h         | 66 +++++++++++++++++++++++++++++++++------
>   net/bridge/br_multicast.c |  2 +-
>   net/ipv6/mcast.c          | 19 ++---------
>   3 files changed, 61 insertions(+), 26 deletions(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

