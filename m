Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343023;
	b=l5/rm4ZwUHW3M6UlrmYBkm4YIFk/21E0UJCRjOkpOUAuRDY3MQueXcYt/erGapQ6Io+4
	 y+HjDdgMcZExwgOqjlfM//pOIwFof44VkSAdPRVhMj6lFVELwonvORss/js8TGJ43Qgb2
	 mIKCisd4J2tp4MNwlfEQEcjpwLAxClMkBCqnJ9Q3HEuKHnbPXH+DXl2WhReHEsT5sPTuD
	 8Itwl0u6A/9m8yMXKRKKJilgIFRrLfYkZwbx1zqPVB+SSbE5giKU/RUSl1JAQLbqcUdlD
	 2VTafJ6kX+pqGMiQgOUmUTF6PN9KKEFGiOXLaDEX93iRUxQvvGJ4JUmYi/Lk2qmTf6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z5ElRnK1KcmWQzg796qjdcPFsrWyUv4vErbWyV6jKEg=;
	b=LkbNduD6E7yEvi/z6O28ibJzlLMzQfnQt3z3XZThPhXjl01UPG7I3zYgR2E6R6OqkWHA
	 qI3LDTjLxp4U9/p0rARON/+VPmZntvqqyYa2zmuwZmCCAT/veYDS+bgeu4gPf6X4Bcgck
	 WYYJaeU7B+A9LFp/3bk0PsoQJmdzyNhunKm+cgAwLCI+DubUh/JjggybPG1DmsxMTyuHt
	 lVm46W3LrxYqRLZVRTfKVZ3FnYh9Bwd296jjgz+qC4loflMwgXyJoqjxneBsdEE7k17yt
	 PhRXwpXF2CY46OqW/9UvA/HGiwFyk9CF0gYI30xxBttmbVQGEqaItxGzWtzjhKiznYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=YnhbfU8q;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F09606A32C
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 10:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F09606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=YnhbfU8q
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so21985725e9.2
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 02:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795343021; x=1795947821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5ElRnK1KcmWQzg796qjdcPFsrWyUv4vErbWyV6jKEg=;
        b=YnhbfU8qYUZS02WO6s4axbDVc9h5DJFfk9I29JCcMD+styoAIUcakV4qcy+Z8bdNdg
         Cd0WZIClm9yvpavsH0GTft0p7+xkTq18m3kLioc9gaqX+3RhvEkZ9XHI1M42q7TcxGMJ
         ncAHuEQQQVAzdH+EG2Mm6oTLQJWqzzpnsQ0M04e8H9OnCZJX0bbKnHi7L3PzEAPuQ2vx
         BQxa7dTyf91S1zFPTzyLrGIERlKTpYLDNNDGht9imCbXSXvQlos0uD0uhbJiW1rEPG1/
         6kKbEG7As9IiyUtzO49ePN6W9jrjHmz4ZKvGhC7i+Ge7oc+Xm8oSEiLdpnZa4hWohYr+
         tC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343021; x=1795947821;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5ElRnK1KcmWQzg796qjdcPFsrWyUv4vErbWyV6jKEg=;
        b=WU79qtMiKc0ZlIdfph4S1j8WR572Qx2oOKEmqy7sKse4/YH3hYkPe3UjN+HaJYQwqA
         cSAOw1ZLdzIgznuRAHjkgQ9R6nWuzSw0Po6+Ek5ATeammH3mXyEGJl0JvKyLTPSxC45a
         cy0pyqiRbZp143DJFV5qd2O0lMuh1rAG3JihFns14oK+O8hDsEUQWrvUDhQm9FP3C7xz
         B+xwg2hkUulNfR8TRccWIAERfn8oziuz17/u8GF+UypCgoPBCdrs9PJlA+1+I3eklUSU
         3k8c3Iu1NrAuVcqStRxAGVMCKMKi19F/hOz2cLb737RgBQnNTN2aUS59s0PWlo0sQi1P
         n2Mw==
X-Forwarded-Encrypted: i=1; AL+hErFQg+rdGn7QSov9M8s5gTacIvf5Fr7Sfja2xfPCFRvBgSB1kWU8JO2ElywVGp5ydmOLbbDdJP1lENywx85vLys=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MTqnWtKnWy88fGbTSRtsdg+1OLidfem5kErk+pQz4vQLCoNrT
	sdxTDrVFrgFxcfGWb5H/MAIZVHYqMDa6noYAYSdU83wew8aniKuiNnnf2z1CwSHGlWA=
X-Gm-Gg: AZFdTZcSwjr4cSMnf0IhYlWapWD3i4w304M7rqSjOBAkINoxlrQsknjp/LN4kI4Dkbx
	Grr9tz0SBJnHW56LWIymJ3GRBeSwqwEivQldsHru9bOVmUVhjGSDRHladjQduZcfd4Iempwhfte
	9Pute7kZXkVyrgXtY1i569sCdmibkbLUcABswy9TbFLT5XAsOLjqTdhBwTgk2VUz5M9H97dfRRL
	cEulw+cMkGzensjIfhnkpiyBZ3t+gn0n7U/KO98MLTAVbUxipqfKsCimWgwWe5Z8SxRpitu4jc2
	z7Efxt98uPPcyyt4ceG6XJhqZiJlBWp4uzmJ7qYr3Tb4LebHC3fu+WfdpzAJtBJFkPaF/LY4aB1
	RgeYfxZ/AoQHPn05W3LNkIYlsnyoLO7TwMJa4oogwglUZRXsdeo/c5xQn8Doqx7BhTI5gUYwtqr
	kPPYLGvfzs85SkWN/chnNYuk6fdiTGp8Q5dLJOkN7MiYN7ovZjVWwYuy4DRz7eM0tXE3VJrCWDz
	X343xP0wi8bb69OPELxZaiAhtZM7bp8RztTttFTGt2jPPHGSSuY2ZUT/KQytxFqLyc3EQZ3XGfr
	GCLfHONq/sHOciYlEemdz81PImWBKu5wS0PszbGjrLZIU6WFUoUMQOkZDzo=
X-Received: by 2002:a05:600c:37c9:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4bb887fe7f7mr158409615e9.5.1795343021420;
        Sun, 22 Nov 2026 02:23:41 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm163162455e9.2.2026.11.22.02.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 02:23:40 -0800 (PST)
Message-ID: <60766188-3c81-4d05-b684-811136c26f91@blackwall.org>
Date: Sun, 22 Nov 2026 12:23:39 +0200
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
Subject: Re: [PATCH net 2/2] selftests: bridge_mdb: Test failed source list
 replace
Content-Language: en-US, bg
To: Ido Schimmel <idosch@nvidia.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, willemb@google.com, horms@kernel.org,
 dsahern@kernel.org, shuah@kernel.org, bridge@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kyuwoncho18@gmail.com
References: <20261122072504.2623702-1-idosch@nvidia.com>
 <20261122072504.2623702-2-idosch@nvidia.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261122072504.2623702-2-idosch@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 09:25, Ido Schimmel wrote:
> Add a test case for the issues that were fixed in "bridge: mcast: Fix
> source list rollback on failure". Check that a failed replace of a
> (*, G) entry does not change its source list, with one of the existing
> sources specified twice and a new source.
> 
> Output without the fix:
> 
>   # ./bridge_mdb.sh
>   [...]
>   TEST: IPv4 (*, G) port group entries configuration tests            [FAIL]
>           (S, G) entry for source 192.0.2.1 deleted after failed replace
>   TEST: IPv6 (*, G) port group entries configuration tests            [FAIL]
>           (S, G) entry for source 2001:db8:1::1 deleted after failed replace
>   [...]
> 
> Output with the fix:
> 
>   # ./bridge_mdb.sh
>   [...]
>   TEST: IPv4 (*, G) port group entries configuration tests            [ OK ]
>   TEST: IPv6 (*, G) port group entries configuration tests            [ OK ]
>   [...]
> 
> Signed-off-by: Ido Schimmel <idosch@nvidia.com>
> ---
>   .../selftests/net/forwarding/bridge_mdb.sh    | 23 +++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

