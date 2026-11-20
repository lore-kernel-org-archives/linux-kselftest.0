Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186254;
	b=Fs958Xe8rbERJD1C3Aoy3f/qAUqVsu9hv+fg7F4KgTUwJ9OBSqajwJ49HNVwwetH67Va
	 kYQ1ocABXvICyDBtjEnuaTb9Ow6odarTxzMzfapOvgFN019AwZjK/tJE/3KmRsHr/CpML
	 VJ/kBf4d3f1xhRWBYhfz2QwCQiQhtwg6aucBmqYJVY5GsfDTp7kru8/xsDtLd1rVd4GUP
	 ISW2VJ4hF7yjI54ns3upv8Xxn+WhuopcCPDarTHU51NCmmxY+QDiUJL18gZUnRq+OKMM5
	 vEgAfCdbWv6Q2+6OyEleKborH2siAAXT7fSTwGry5AgTvxmRwyYZEArc/mKrXnI5oCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186254;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xq95c6hIWcCI3WqchLYfnMuxNwOv/S9CL+ROrCSXBhM=;
	b=HBsZtT5TTviof3q5h4X5E3EWz6nAmCRbt/qZtT1qWVa02v0tJVbZF4neeJosuyW+p6Q8
	 rEG2tZyBakIIHk8lZ+nPyAl2UIkKdAYZmqoLCp53/O1UXOtElkg3ZXYeSIv0KwX8zumSC
	 ijjnH1H7kqoNqxtBAjmeyct4ichTVGf31yDZnVxiANvqMNVcmWY6s7YZZ3QDQAL9Bq+gR
	 VqnSIcskxmsPQiYuoFaB/J0+S44J+sJpqNlExyFKXvltmeJjGJqg/5DJjjzhfN4SV94A0
	 5KMyVm/P6bZ4t/SgzPThFxIdKbUYjaGpTXJlQjDGdulHtnaxCmhDxfOTS3n/xxsY+6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UDJERDe8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC960A2602;
	Fri, 20 Nov 2026 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UDJERDe8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA28C1F000C4;
	Fri, 20 Nov 2026 14:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186254;
	bh=xq95c6hIWcCI3WqchLYfnMuxNwOv/S9CL+ROrCSXBhM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UDJERDe8PnZB1vOH24dOpCbmainn8Hh0UD2lEFg/YrTup19QRCBPDL/nCUh/y3eyE
	 ddVze9nrfVeMYdqTJMKCQ/tQqNvYZF/lw9zgCNDAWw42uN0za3Xgfdaxs7piMesz9q
	 L+q7zo9uRfCL1wiw8DpfJCDDafB/W5MWhF4c6DZS4sf1KY4M2YjiVE3PWP/6NC/Au+
	 Ao1QBDJ2O7twRSqcPxaOenXtuz80qVMoI5EnyjWsmItikCYDxcL+YJC1LeDTJz5aC9
	 7TafH6IpaYo974AB3F3RenjehzX6ViQB8Me6uzTYS1p2uzeRpVsH5t5sJYfCtrwQ26
	 7pcMaI0ksFWPw==
Message-ID: <be78bd95-cb61-4e50-9452-93e567d174a8@kernel.org>
Date: Fri, 20 Nov 2026 15:50:48 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net 2/2] selftests: net: check UDP tunnel GRO virtio
 offsets
Content-Language: fr
To: Bryon Fryer <bryon@fryer.io>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 horms@kernel.org, jasowangio@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 pabeni@redhat.com, shuah@kernel.org
References: <20261112030708.1915665-1-bryon@fryer.io>
 <20261112030708.1915665-3-bryon@fryer.io>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20261112030708.1915665-3-bryon@fryer.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 12/11/2026 04:07, Bryon Fryer wrote:
> Feed ordinary Geneve/TCP packets through a NAPI TAP and bridge into a
> virtio-header TAP. Require a multi-segment GRO aggregate and compare its
> exported transport and checksum offsets with parsed wire headers. Include
> a GRO-off packet-integrity control. No output or no merge is not a pass.

I *think* this series is causing the veth.sh selftest to flake:


https://netdev.bots.linux.dev/contest.html?executor=vmksft-net-dbg&test=veth-sh

Logs:


https://netdev-ctrl.bots.linux.dev/logs/vmksft/net/results/918887/55-veth-sh/

https://netdev-ctrl.bots.linux.dev/logs/vmksft/net/results/918887/55-veth-sh-retry/

Maybe because the new tun_vnet_gro test leaves a tunnel socket behind?

Could you please check the whole net selftests on your side? (or your
new test, then veth.sh)

I suggest dropping the series for the moment to see if it improves the
situation on the CI side, there are some comments on the patches anyway.

pw-bot: cr

Cheers,
Matt
