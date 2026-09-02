Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1179CA6F;
	Wed,  2 Sep 2026 20:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381000; cv=none; b=MKVCDwZqBMZi3S6FjWg0I14ZG/W1cJXcirsTbATTG/2oPMPbJnu6jfRyGtjDDDFEBr8mpmYaLHXP0A3hrl74X1N/h8RdDTx9owqpyCnSRZESsfDTNWeAhRUTirlY/b04PHKKmhIhmTtdvNA3v6U9O7yxLmqomns1oHRhXeTgXEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381000; c=relaxed/simple;
	bh=5GZBvCsMOFsFK+rU7KztXj9UD8tznxkCHHiAEsivmks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PZu/Zy3O4eBjQbR/SOK4zIrz9ClfMz2H57gOnRkRzaZACNR55/IGndVACi7RakmO4scgyyUqH1uj2a97iSORJT6zKzRdPtyZpgk7D2lBppQWO8q959w7FAgPp6ixZyi8WXgZ1rOhPYI0eXuIe4MLSZ1z7kRK1efp8caOxDa8IoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjMU7p5Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjMU7p5Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17ADC1F000E9;
	Wed,  2 Sep 2026 20:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788380998;
	bh=cGdkDE7sit6AxArVGexqh3DzsX9Gs9/f7klByuNA0IA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EjMU7p5Q1RdK3l4wX8IbzKHsEaVHCiB4xywxTYeHXUYGqG7quVvPk2uchitIv64yD
	 j8blse4qdSB9ggwcNwTHDvi3MU78BmVG3Z/yyc+SOfHjMXisWhp+yfpjQPOCtqEilG
	 NwVQLJI6aohDk686p1OD5RaUDk6a9m4ZjqG03sMpIIgVxFzhKmIulOQOKTRFCXDPyn
	 gUSVKMBgRkk6lkqRjDH2i6Lr9PQpZAJEQYUWnfbD8dRuM1iHVdVSgpaJPP1sg42UQg
	 q3vdKLHNiQyt4bQPoV+V/LAHR7aDCGq/jA/ZdLuQNLp4juvvzb8f1apCMfcM8pTc8r
	 b+zpI5zg+fzxw==
Message-ID: <fc45c17c-84f7-45c7-a411-ba9070d1dcd7@kernel.org>
Date: Wed, 2 Sep 2026 14:29:57 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] selftests/net: Fix icmp.sh race between ping and
 tcpdump startup
Content-Language: en-US
To: =?UTF-8?B?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260901-selftests-net-icmp_race-v1-1-0b2a27e91a0c@marliere.net>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20260901-selftests-net-icmp_race-v1-1-0b2a27e91a0c@marliere.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/1/26 8:09 AM, Ricardo B. Marlière (SUSE) wrote:
> @@ -53,11 +54,21 @@ ip -netns $NS2 route add $RT2 via inet6 $H1_IP6
>  # Make sure ns2 will respond with ICMP unreachable
>  ip netns exec $NS2 sysctl -qw net.ipv4.icmp_ratelimit=0 net.ipv4.ip_forward=1
>  
> -# Run the test - a ping runs in the background, and we capture ICMP responses
> -# with tcpdump; -c 1 means it should exit on the first ping, but add a timeout
> -# in case something goes wrong
> +# Run the test - start tcpdump and wait for it to be capturing before
> +# sending any traffic. -c 1 means it should exit on the first ping, but add
> +# a timeout in case something goes wrong
> +ip netns exec $NS1 timeout 10 tcpdump -tpni veth0 -c 1 \
> +    'icmp and icmp[icmptype] != icmp-echo' > $TMPFILE 2>$TCPDUMP_ERR &

Why keep the 'timeout 10'?

> +TCPDUMP_PID=$!

You have the pid. You can always kill it after the ping command if it
does not terminate on its own after the 1 packet is received.

> +if ! slowwait 3 grep -qs "listening" "$TCPDUMP_ERR"; then
> +    echo "FAIL - tcpdump did not start listening"
> +    cat "$TCPDUMP_ERR"
> +    exit 1
> +fi
> +
>  ip netns exec $NS1 ping -w 3 -i 0.5 $PINGADDR >/dev/null &
> -ip netns exec $NS1 timeout 10 tcpdump -tpni veth0 -c 1 'icmp and icmp[icmptype] != icmp-echo' > $TMPFILE 2>/dev/null
> +
> +wait $TCPDUMP_PID
>  


