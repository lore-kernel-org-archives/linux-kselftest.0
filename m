Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001539;
	b=NHktv7HVHwsn4Ydxv0x40ooqhMO/5athEhZcnXB6YhnhrWI14FIMuaC7tm0366HtLzHM
	 B1GaZIpc2cMR8C2fCawOQdcSnZKX2jH+1GR4cOw4oGznTIme8t//3O0wIwslE8IivhpNi
	 earEFynJHMa3Io8I2h/B8kSK768Van8FkG+MQVYj03NP/EBnMyjtl5zSzs7i0MTSMruJN
	 IJeswtgQpa9uEi7RsmOsUwORW/vRr4Mt2hZg6ZHii/h4D/6dZrwXat7rxOcRdn3Dbw8oA
	 WYCE4OQ84fFXwerJb0ZgOg5yjSpDMsouqGPcePYn8/PKSQ+/3/8jXAhglYyt8ZFS6MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ENqpIp5OCMvGLbQfuRT56moz6XxyZs/DH9YB2R1VAX4=;
	b=wY22MFrvmLrjq7Y6unNV0wvi6phfUcrJL825Juog8B8I7GgTt3/xoePHojNVP+qUROYA
	 M24kfMXaeamZjOMV4dTl1gg8bHvB2FbYsZglp2aQszDUanEHQufm5Mj+oQTZLVimP0Gxb
	 Fp43QcXi+Hl/tBr93Ni28WAwhtxUzPfzR0/X6RqVNX7khp8UK/dYo3OD22HtHhmC849mN
	 BOc11XAD5dFOmbshGGykxGPtjL9O53ersnHoEbjC6JHTZJ/a+sC5m+YN+2eSXfhixIu6O
	 5ib4ZfECyxKWJTi9lFWz0ACy6UCzNXnuxwExXUv/bCNC/2DLrHoOCNfp/olW3TNithg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=YIkiyv88;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7D5606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 07:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF7D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=YIkiyv88
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so25185965e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 00:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1793001537; x=1793606337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENqpIp5OCMvGLbQfuRT56moz6XxyZs/DH9YB2R1VAX4=;
        b=YIkiyv88wEEaX9fcSbw7nvWAWwnKoGCpr68rh8SmVrnPxrMcW6i9lXw/gEkPqfFhM2
         Bi1bYj966tUFjI83HwGRD0kb1x4mwoQUdBo0tYT/3xHhIy0pancQ9TR5VXrmUoow3B8W
         RlUhVzzYnLVHUS8XO7S7GNahgM08iD/hnciCfwkxkqAQBRcXVZfX7DvM1JNTgaCtnHir
         fChs2UF2cPdCpY/nM39VMhXhDrQs6MSQRqKmhyLFukXx/c+rGEU13D2cXlwk4+aRI8Xt
         0ElwE487d5xkJZg3S62lGaXygv/SZlDeZIhe3CosQ0+blDs69NwWZ4ywEHW1WjamGOxR
         A37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793001537; x=1793606337;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ENqpIp5OCMvGLbQfuRT56moz6XxyZs/DH9YB2R1VAX4=;
        b=bxwXjQ64YZQgLP3Zc5iiPv5lAbKNJ5EeicYN/2WsB1gRtmR5TrCdW18PfWKZlqkDA3
         3rV8iYXm4E7nYBb53DFXuDk6AE/ORniF78CBzHZmVvbZ1/UccxT7VV2YHsSlr1GrlKKd
         zm0Q5VAePMQ4kDJZve/19Kbk6yW/hGSHhF5+k9F8hPd7xXKpLyHKA3A54WdwEIPVBt5f
         8J4l04kzX/ryMZLPG0Ta9wpbSISl6XmZYEl4MoG0sK3tDjVrxdSX9I6qqeEjuTY3eWKv
         8rZ/o+4Rk9i2K85aTxliRFJX/QTakj9mRgL6sPwpGmCAXPObxJtxeGhzx4BE1Wmm0mwg
         u1MA==
X-Forwarded-Encrypted: i=1; AKwUvBxrN2l8SJr6NhFP1Nqk3r2Tnq3sx1rSnXJ1acTrfkugmYKOywTovnivdpUJVPVrFvPcST4VRn21+jkd74TmzZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3r227ELKs/4wnwvU/mvO0zBoU1yx/Yh90SB17mFdLLvViws1+
	QyUMhn93GKAWk/MAmfpkU7tN57HK1wtR6U0VCD4Gny50w5XILgowFvb8P23VUcFLoNU=
X-Gm-Gg: AYBFou1XxPADgCKaEKNDFmVcWa5NtVA4HR422o3NgOgXLGAt+s1tLRJXGrGMy0MtORy
	a5d/MxvcOvhzSdpg3SvGgUEiozYfzyjyiXM7N9lTIHpX5/cOjeVOHl6qFrarXAyy6C/QN0J+Gro
	05uFirNQRlMu8Qpu9vHioqTKrjNVOTQloVJt37vLhdnhtXktKiWmn/G6kkFdNJ3PZrXVHJK/FjR
	iuW5UdJIo0UxLmqgdDtLlw6xNk2iBb5sn86omceccSRrrLynSub46KKBVZTm4vkutt+dEMK1492
	02UDup78G6mf/Ge9r2qstYsVJNDPqYADfe2QsbcXYlzQRAzecU0VeKH1oqjSM1mSAAI/Ye3Aq39
	+MG/L6kXIZT2C6qDYwgLyv2T/hpd7hp/RjGAcA7T38gKGs7WhwoI/rAypNDA75ZC92KENG9EMil
	5Gwl9Ablg1g6pMxIs2zf1UsxDjr/yt1OlxSZwEGUd48vzgcxxd6T6jqGaotSqFm6hZ6p5Q8QNLj
	xKEJIXwDiqvBgzccsqPyy09YIrNNfw2DeKQDQjbbBwy1tBWxWd6/MX00QoCyZvTWr0MwgjqEnly
	zV2rfrpneQ==
X-Received: by 2002:a05:600d:c:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4a373be2a9emr75329375e9.16.1793001537419;
        Mon, 26 Oct 2026 00:58:57 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5697a7sm170954675e9.7.2026.10.26.00.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 00:58:56 -0700 (PDT)
Message-ID: <c561b8e2-40f3-48d4-8f2f-85b46163466b@blackwall.org>
Date: Mon, 26 Oct 2026 09:58:55 +0200
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] selftests: forwarding: vxlan_reserved: add gbp
 changelink test
Content-Language: en-US, bg
To: Hannes Laimer <h.laimer@proxmox.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Ido Schimmel <idosch@nvidia.com>,
 Petr Machata <petrm@nvidia.com>, David Ahern <dsahern@kernel.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261023-b4-vxlan-changelink-gbp-v1-0-f0d13951c09b@proxmox.com>
 <20261023-b4-vxlan-changelink-gbp-v1-2-f0d13951c09b@proxmox.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261023-b4-vxlan-changelink-gbp-v1-2-f0d13951c09b@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 14:14, Hannes Laimer wrote:
> On a device created with gbp, run the reserved bit probes before and
> after an unrelated changelink. Check that what the device accepts has
> not changed.
> 
> Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>
> ---
>   tools/testing/selftests/net/forwarding/vxlan_reserved.sh | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/forwarding/vxlan_reserved.sh b/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
> index 709845123727..0ce264cc57f8 100755
> --- a/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
> +++ b/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
> @@ -40,6 +40,7 @@
>   	reserved_31_test
>   	reserved_56_test
>   	reserved_63_test
> +	gbp_changelink_test
>       "}
>   
>   NUM_NETIFS=4
> @@ -338,6 +339,20 @@ reserved_63_test()
>   	    reserved_test 63
>   }
>   
> +gbp_changelink_test_do()
> +{
> +	vxlan_device_add gbp
> +	__default_test_do 25 "gbp"
> +	ip link set dev vx1 type vxlan ageing 300
> +	__default_test_do 25 "gbp after changelink"
> +}
> +
> +gbp_changelink_test()
> +{
> +	in_defer_scope \
> +	    gbp_changelink_test_do
> +}
> +
>   trap cleanup EXIT
>   
>   setup_prepare
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

