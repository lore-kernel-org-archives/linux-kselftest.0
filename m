Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793033612;
	b=JbPlw0wHV2njeQpp1nxjZlYNlTW5KTEfNrLoRzljUf8AzQdKGZMCWNaLs5zre/UaFbA7
	 S7PAAUi4KkR3yj2a4gEDEkqVwwfhv2q5L3Kcf2n6ZCGMdeUYdCNHZiv/1Sy7oVzYeBu+p
	 nLLLZz5P4+tGSVor51qFUP4LhapZbpVF0Ic6Bkx8d8B+bdrug1Hf53fIE/OGED7tADDXM
	 r7AI+xBdMmM/IDCs8OtwELQj6/zbU+oSwfdQ/cUNB91pjKTtk6737EASRQfArYpnrNxEM
	 ujFVhymzfDQR9s0GYuRWsamG8rN+LUiAUlNAobXggvWabPeFal1mm4JomrSdNZjS0xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033612;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=npiwoGlUI3XgozENEsH36EsRteGrJOb6/rz8ZfwuW80=;
	b=uTpZGEz7em9ojoPNuGF47J3gigmReL9Ev98BGF/xSnysIlTmWTZoCO8ToS3LemoAOcyh
	 w6hMUiZkEA8YPDdYHK+IsLIl9HFh0dQpzXr9Dfbr5e9plHOoh1ujkJbTtoMv7depkGBrq
	 d7UpXgm83xs26fb7V3Nb3ybB6MtFqEoHN/aNx2TJvKcZ/JweeiLRskOTohatqNUU6eTbN
	 T39VnTw580tXAbw9wBNcDowOhUtDSXioOeS9Nh9OmNaULmXBaJTxEQ4sxXcpt+fVJoqFa
	 XrIjnRpErX2KyJZK9siF7EgIswoCBUnfpmc5TCpPcudUsADm6OlCJNrtvs1LDdUJIjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hey+lG0T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E804606A31A;
	Mon, 26 Oct 2026 16:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hey+lG0T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F04E1F01825;
	Mon, 26 Oct 2026 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793033611;
	bh=npiwoGlUI3XgozENEsH36EsRteGrJOb6/rz8ZfwuW80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hey+lG0TAhUsAJP0mNh8EOzWe+NQI+eYyrS5mauLlWjYSoD0BsWVw7acM+48vYlUc
	 JT7k9tmBuJialMzYNk3QW6DGWvwaNy2/QNoNN/HE5Tpg3+8moOZUm4mL3zJXOMBXlx
	 QV/ePAj+fryNgmE/fNL6rnl36RpH70GAy0O43wo8Whx4JRdEGTT8XghmIvRlULbIMJ
	 fH1S1qzn3DTaE/mKpNPiYuGiZnbRQk6xDrrakFVc8Enpvr68y4LaBkR5q4yXJ8NfVU
	 2c78K2TKEv8zbl58xTvHKL2JqO9KDudqlLRI943zqI7ow7yp/7fAXlIVxgMNaDt5R7
	 3Dg8itv4BBJfg==
Date: Mon, 26 Oct 2026 16:53:27 +0000
From: Simon Horman <horms@kernel.org>
To: Alexandre Cassen <acassen@corp.free.fr>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Ido Schimmel <idosch@nvidia.com>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/2] net/sched: act_api: inherit filter offload flags
 only on new actions
Message-ID: <20261026165327.GD257209@horms.kernel.org>
References: <20261021193222.1318333-1-acassen@corp.free.fr>
 <20261021193222.1318333-2-acassen@corp.free.fr>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021193222.1318333-2-acassen@corp.free.fr>

On Wed, Oct 21, 2026 at 09:32:18PM +0200, Alexandre Cassen wrote:
> tcf_action_init() gives the skip_sw and skip_hw flags of a filter to the
> actions it binds. An action that another filter created gets them too,
> they then apply to every filter that uses this action. When a
> skip_sw filter reuses the action of a software filter, the software
> filter silently stops running it. This happens even when the filter add
> fails on a later action. A skip_hw filter likewise prevents a later
> filter without flags from reusing the action.
> 
> Give the flags only to the actions that the filter creates. The mismatch
> check still rejects a filter that reuses an action with a flag that the
> filter does not have.
> 
> Discovered by manual code inspection after the Sashiko AI review [1] of
> a tunnel_key patch questioned how actions get the filter flags.
> Reproduced on netdevsim without kernel changes. The egress filter below
> runs in software only, since netdevsim offloads only ingress filters.
> Once the skip_sw filter reuses its drop action, the last command shows
> skip_sw on this action and the egress filter stops dropping packets:
> 
>   ethtool -K eth0 hw-tc-offload on
>   tc qdisc add dev eth0 clsact
>   tc filter add dev eth0 egress protocol ip flower dst_ip 192.0.2.1 \
>      action gact drop index 1
>   tc filter add dev eth0 ingress protocol ip flower skip_sw \
>      dst_ip 192.0.2.2 action gact drop index 1
>   tc actions get action gact index 1
> 
> Tested with the reproducer and the tc-testing action, matchall and
> flower tests.
> 
> Fixes: 34d35b4edbbe ("net/sched: act_api: deny mismatched skip_sw/skip_hw flags for actions created by classifiers")
> Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009051930.3619697-1-acassen%40corp.free.fr [1]
> Signed-off-by: Alexandre Cassen <acassen@corp.free.fr>

Reviewed-by: Simon Horman <horms@kernel.org>

