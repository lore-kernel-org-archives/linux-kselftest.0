Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22532B13A
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 02:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786327340; cv=none; b=oQFIDdcblOEeFJ1+Cp2Gcra3PhnJaIUOhFEmAe9ZYZkyehCNa8R3q8Hmk4i6Zcqmr0X9L3V/yssLhjz13PgO+dPA804krn0JLgwN1B6puUNmXoItsYG0L/heJB3eyDY6cqbd3GK/Lw/9QZ4U9Rawf9ZlicRqXxRduX6OM7h9rGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786327340; c=relaxed/simple;
	bh=xGVbTqcbmXKJDuCBlsOgJcwXwqXfOP2u9fxjxnzVUh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eY551cLtoLv+lEc2RSNCQln0vbKpzwURSuX/1m6Rxzf3FWUILug2ZdCrn2ctRgk5OCM7HRGt8xvvZyfCsnoiBXNr5YpNjROuNwpw+Wn9ygsWNyZdR2dMUeNgSADPl366NHYR7MGFS7RDVjg5D+E1hvi8rhTyPc/aYgZuZjA6mlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3ieLwwh; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3ieLwwh"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3811f512167so1932351a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 09 Aug 2026 19:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786327337; x=1786932137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6bMsTpWX3mOf0fEaABifWS6yDxE6k9F3K84LoGarf68=;
        b=O3ieLwwhciqa/vy+ySo9fbIAeNEcaeio2oOtDvkUu8oCG32W+M6YSXxXPM5k2wZzWu
         lLihcBJBb4Fiya9s7hL19D4Hh2XDtPYTo2PNHEmOAAaDiaHzmm431d3iCKRC+rI9e9Vz
         0gi+kVUioRmKgvlKim5Q7Q+tOxK4sg5CWfDppnCzCp4UYn/uzCvZb/5Up7qQo6QRiHYu
         K0RWgQWetx58+yjMHfFKyHOWXtEcc+DBeyK5dDZbxMpBI+ou3RnBuLum1v8vhk0iwH0n
         wf8zlytrYNtGU3XEQA/em4B0hlcEBBTe+VMV9wvEWZyefP0UVcyFThEPcmZC4AnzvjO4
         1ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786327337; x=1786932137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bMsTpWX3mOf0fEaABifWS6yDxE6k9F3K84LoGarf68=;
        b=h3gpfXAP06g+gYeb+bYfXaDa9Y+HZLqyzEeDEk2BVPhpVScvO/xV/GEH4IaC0QAV/N
         de9X8gj2oC2FZ8XnSj8vr/3euqfCckB9lRkaJgfhlPvwO+bvvYlxm5NXsUYxyncovx+5
         MLoaWCZV8nbl4yNdFTSspiDGOGEKnADpqCySGEl3E9ZROlt8VoxfW0Q0PHiiFKDJyE7Q
         /XewqcOFteJKnE71L2zMp4Phay6CilHLGL5z/sv0OdCY8Cyq9fIbGxkWrvmcRcAa1Lmb
         q0p8+Q/j2Ec3/l5EbhWHfU9J7JE7UcpN27NzAenihiQWHTL+udCswxDYHWFlsBdq84Y/
         2knQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7HDwNvnUbBI4JXH6rjgXuOaeujEUK0+otXJp272sM7rwvRC8JQ+6PUTEAY0FT3sY6dAj15UZ2Fymjai/m52Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeSGnB4K8uzD9x0jzfwsmgQEnN5v/rswYyx/8HoHo2C9jBX6AS
	Hf/uGr43nsrpC8x1bLEEuJQkyZu/xZdj9HHGb0UpLp0jAkEe8kyQeNEs
X-Gm-Gg: AR+sD11jORxrETAslx8iBpN2dR7SnqXeTbTRVv5fud+mJkY0CgN/KP0/8O0+0g+cq3q
	6s29fVFqDRMNLcYMBfIXkEBjsu9UTXGg66psp4tFd8txZhPWEAZnfWH2oqxvEzAkuHuSKCwE5Yo
	OrRkXReKGMieNAEPoczmhglEqTjukomdlEMPczZ92IvRYcXk7gU64/4tGrucBRaK+Nbx6s+dsBI
	0gbeEsv/EKNpI6enaOwenx0RVQGOtC/ONaCOkpHOGOrj7+WZVLUQ+Hpo5UtCYa08epo9YnBMWw7
	mYfo7zUQ+bWcRfY1XX+bd7/XmrWhUujLdhkPjx/KHuOOj/d+dpYfyz81Aphvy3tpv02hA2n+Vy/
	i3Ktb0dF++fRIthn+ir6Cj2T2gWFCSRIv3XBVoXBM42L4BUpU1GQMSphLDnBmtIiVyCK3skf1Az
	15wnwQJN0ca5SEGZTBn9XCp9OKtqA3as9sZXkqjtcpZ8CSEQSnt029iHI=
X-Received: by 2002:a17:90b:224e:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-3903c5b353bmr33888345a91.12.1786327337076;
        Sun, 09 Aug 2026 19:02:17 -0700 (PDT)
Received: from fedora ([203.175.12.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b370b145sm5025301a91.2.2026.08.09.19.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 19:02:16 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:02:10 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	jv@jvosburgh.net, shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: bonding: disable DAD for IPv6
 addresses
Message-ID: <ankxIiVLu3qY5jw5@fedora>
References: <20260808162345.2442594-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808162345.2442594-1-kuba@kernel.org>

On Sat, Aug 08, 2026 at 09:23:45AM -0700, Jakub Kicinski wrote:
> bond_reset() waits up to 2 seconds for IPv6 connectivity.
> With default settings DAD itself may take almost 2 seconds,
> causing flakes on debug builds. It used to flake once or
> twice a week, recently it started failing once a day.
> Probably some downstream changes to scheduler, or our machines
> go busier.
> 
> A lot of selftests already use nodad, let's use nodad in bonding, too.
> I don't see an obvious reason why DAD would be important to the test.

In this case, how about add nodad to all IPv6 address setting on bonding
tests, e.g. bond_options.sh, bond_macvlan_ipvlan.sh.

After that, we may event remove the sleep time in bond_macvlan_ipvlan.sh.
In my local testing all the macvlan/ipvlan test passed with nodad set.

Thanks
Hangbin
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: liuhangbin@gmail.com
> CC: jv@jvosburgh.net
> CC: shuah@kernel.org
> CC: linux-kselftest@vger.kernel.org
> ---
>  .../selftests/drivers/net/bonding/bond_topo_2d1c.sh    | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/bonding/bond_topo_2d1c.sh b/tools/testing/selftests/drivers/net/bonding/bond_topo_2d1c.sh
> index 167aa4a4a12a..903c7a6c7287 100644
> --- a/tools/testing/selftests/drivers/net/bonding/bond_topo_2d1c.sh
> +++ b/tools/testing/selftests/drivers/net/bonding/bond_topo_2d1c.sh
> @@ -48,7 +48,7 @@ gateway_create()
>  	ip -n ${g_ns} link add br0 type bridge
>  	ip -n ${g_ns} link set br0 up
>  	ip -n ${g_ns} addr add ${g_ip4}/24 dev br0
> -	ip -n ${g_ns} addr add ${g_ip6}/24 dev br0
> +	ip -n ${g_ns} addr add ${g_ip6}/24 dev br0 nodad
>  }
>  
>  gateway_destroy()
> @@ -75,7 +75,7 @@ server_create()
>  
>  	ip -n ${s_ns} link set bond0 up
>  	ip -n ${s_ns} addr add ${s_ip4}/24 dev bond0
> -	ip -n ${s_ns} addr add ${s_ip6}/24 dev bond0
> +	ip -n ${s_ns} addr add ${s_ip6}/24 dev bond0 nodad
>  }
>  
>  # Reset bond with new mode and options
> @@ -97,9 +97,7 @@ bond_reset()
>  
>  	ip -n ${s_ns} link set bond0 up
>  	ip -n ${s_ns} addr add ${s_ip4}/24 dev bond0
> -	ip -n ${s_ns} addr add ${s_ip6}/24 dev bond0
> -	# Wait for IPv6 address ready as it needs DAD
> -	slowwait 2 ip netns exec ${s_ns} ping6 ${c_ip6} -c 1 -W 0.1 &> /dev/null
> +	ip -n ${s_ns} addr add ${s_ip6}/24 dev bond0 nodad
>  }
>  
>  server_destroy()
> @@ -124,7 +122,7 @@ client_create()
>  
>  	ip -n ${c_ns} link set eth0 up
>  	ip -n ${c_ns} addr add ${c_ip4}/24 dev eth0
> -	ip -n ${c_ns} addr add ${c_ip6}/24 dev eth0
> +	ip -n ${c_ns} addr add ${c_ip6}/24 dev eth0 nodad
>  }
>  
>  client_destroy()
> -- 
> 2.55.0
> 
