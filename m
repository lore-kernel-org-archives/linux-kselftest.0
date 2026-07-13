Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCC626F29C
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783953560; cv=none; b=XenfE+c989qZq4lEv4d1aSqdiyCsj7SLRl60rWOwxu+laTsSrJ6Rh1KhdlaeUaQq83Zo9FMg/KfaWZzlKhDEn4eH1wF4c2S7mixf+E/GTTUAQg1hbwiGAS3gsjpuzNtQ1Kc9i8PIlFLaLRymSr+DVGFjIEHGQQBW85kFHO9S9WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783953560; c=relaxed/simple;
	bh=7SVwThqf5Y8uGT7Wl/bLXED8qdBAA+y2a5is8Se2K/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kj7IPljEeMmVP+2sDbzltuAElA94ZVnqHDH19/2D9+34SaKKz3W1R7Qr+c93IqFffuIXPc1OUsLyQboC95YbQUbCWXjt87k8pl/1ewx7peO2qc8d+ELlcOOIWzXd9stZYqW2yb5V5Y/yXzBNR4pMsbdNDZKxU8jXjVeDXfNx26s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-493f17dc838so11128085e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 07:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783953557; x=1784558357;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ewxn1tc8oBqL++u0cfoxvHt4MAjgPzVty+SbSTp042s=;
        b=a6hk+hdH+zqfK2ppPgDq4/u48DCtPs8zpEk48MivOGXDyGEyzW7kahTtQDdpnUklWy
         xQcATql05fqB7K2DhGhR2vQewOkZ/OiPCmYCXB43Xuf1Ks3wW24IZG+EFFUyvO7DdUXH
         9yTBjz4rfeGNLq0rCwd1LXoZtbfE+JTcMTG3RNpghpEg+L+FcLi0i42gjVjh7UNs8Ibv
         CtIbt87ww0/WPh3hRODYvgF1g/M+Yt3lKWv/IGYGu4Uni5d2N/x04LAgGTSLwoTNwGlw
         N+tqwVTVmaYt69WeTr7BzAB6439BPQv9Q2y4f2gKJSVMMRm5qUzOHfRvdF6rv8FonYJq
         TNPA==
X-Forwarded-Encrypted: i=1; AHgh+RrM4CHODimMdph0gY7sfASLZrRe18xsCR7BP0YyvTECCcsXrrMiSoMjQe1RFmX5EMi+3dS1tgo72QXrW8pIlkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQSlhvuOXP6+yRXPP8aQDTemTknM56EPmzN0ZnC7RuXRHRYtp3
	+zL7n7eFN5DGxQ6IDwCS8O6/5sIi2jsjCrrZwc0aDk0P2XEgvtkhvLiw
X-Gm-Gg: AfdE7cnYZwK5Q90ogtuBQmL7/nY8DwMaVnBu6G8Z2/N1OIPXRNJXgNG2Z0DVHMglRr1
	0bBfjVFmhN2YARrE7UYLdWIsMYiDhvQ0TqA80bubtfX9KdWXmlbWKJBLuoBVTSRipL/ebqkgYoY
	eAVpvWSjcICaqqiwmHXBfmLlMqAPpqwWo6lp7nvl6fDkYa7XjRiNeUYA32YYsTbYxZkE3Gq3ZRX
	DqnelkU9pG0JFv8f0RRBTGz9Ca7aeWALzs3R5wlEMWWBCw3slZiUrZu3hVmQVtxJwHs0U6UeNCX
	x6l6Ip8C4EIMRNrrfSXHZEYMmhEhtJlVxYYiFMOMGXhxfQoS3IpxOgK1QPYX6SS4XIuk0kJL/0j
	hlGoBZVpC9u6t+0bOEuBDMVBCySRFD9cOclkc5pUn5aIwdhdLCbZriVdG/Uwe9zKbh2ZlDJXOdA
	8AscPkuixmXLunLrG6xC9crDXDwfTc2aA5OdFNq1qP/Z2cBBg6dA==
X-Received: by 2002:a05:600c:4e46:b0:493:efcd:b809 with SMTP id 5b1f17b1804b1-49401d2d054mr40539925e9.6.1783953556854;
        Mon, 13 Jul 2026 07:39:16 -0700 (PDT)
Received: from [192.168.88.241] (78-80-108-129.customers.tmcz.cz. [78.80.108.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f86556acsm185096295e9.1.2026.07.13.07.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 07:39:16 -0700 (PDT)
Message-ID: <f92c4b8a-601a-4e22-822a-ba00705fe60c@ovn.org>
Date: Mon, 13 Jul 2026 16:39:14 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] selftests/net/openvswitch: add SCTP flow key
 test
To: Minxi Hou <houminxi@gmail.com>, netdev@vger.kernel.org
Cc: aconole@redhat.com, echaudro@redhat.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, dev@openvswitch.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, i.maximets@ovn.org
References: <20260707034718.2717982-1-houminxi@gmail.com>
Content-Language: en-US
From: Ilya Maximets <i.maximets@ovn.org>
Autocrypt: addr=i.maximets@ovn.org; keydata=
 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
In-Reply-To: <20260707034718.2717982-1-houminxi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/7/26 5:47 AM, Minxi Hou wrote:
> Register OVS_KEY_ATTR_SCTP in the flow key parser so that sctp()
> can be used in flow specifications. The ovs_key_sctp class already
> exists (with src/dst fields matching the TCP/UDP siblings) but was
> not wired into the parser, so the token was silently dropped and the
> kernel rejected the flow.
> 
> Add test_sctp_connect_v4 exercising the SCTP flow key with
> port-specific matching: sctp(dst=4443) for client-to-server and
> sctp(src=4443) for server-to-client.
> 
> Wait for ncat readiness with ovs_wait instead of a fixed sleep so
> the test does not race against ncat startup. Use grep -c on the
> listening message to distinguish between successive ncat instances
> that share the same stderr log. Kill the previous server before
> respawning to avoid EADDRINUSE on the SCTP port.
> 
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---
> v1 -> v2: replace sleep with ovs_wait on ncat listening output,
>           kill previous ncat server before respawning to avoid
>           port conflict (Aaron review feedback)
> 
>  .../selftests/net/openvswitch/openvswitch.sh  | 102 ++++++++++++++++++
>  .../selftests/net/openvswitch/ovs-dpctl.py    |   5 +
>  2 files changed, 107 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index 2954245129a2..9c364eeb2ec2 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> @@ -32,6 +32,7 @@ tests="
>  	dec_ttl					ttl: dec_ttl decrements IP TTL
>  	flow_set				flow-set: Flow modify
>  	action_set				set: SET action rewrites fields
> +	sctp_connect_v4				sctp: SCTP flow key matching
>  	psample					psample: Sampling packets with psample"
>  
>  info() {
> @@ -443,6 +444,107 @@ test_action_set() {
>  	return 0
>  }
>  
> +# sctp_connect_v4 test
> +# - sctp(dst=4443) matches client-to-server INIT
> +# - sctp(src=4443) matches server-to-client INIT-ACK
> +# - remove flows and verify connection fails, reinstall and recover
> +test_sctp_connect_v4() {
> +	local t="test_sctp_connect_v4"
> +
> +	which ncat >/dev/null 2>&1 || return $ksft_skip

Not a full review, but can we avoid ncat?  We already use nc in other
tests, using different implementations of the same thing in different
tests doesn't sound like a good idea.  On mnay systems nc and ncat
will be different implementations with different options and behavior.

Best regards, Ilya Maximets.
