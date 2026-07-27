Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AF8391507
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785166031; cv=none; b=SUVxE8Bicd+rr8+1ne/DQWohXuCV7V2UmJKvEECVwRo9dPvZjkH3vYzExhjp19jisVCFSBb3mv5LenjpYYOOa2Ejw3FFY3ci9dsjDo2BXwrJIJ5U2pWvvvSA3MIVOY6V5s+dx5qIEKX3A7+T9EerFb7pWGt02F0spguBE2NgZHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785166031; c=relaxed/simple;
	bh=EAMczv1nszBVR/9+wcOrhNsU81s3RFeSw/W6R5Gzuic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gv7/ZUtXKjevEk+kbjO5P7sZhmXcr660r08fXbAxpJoy7QNcKunWoTSmvtw+kYN81H7qdrRqgu/0HfStsErOLHiJ8FShs886g2ol7gCmehAwWInDM9G6G/ui2zNZZ7qW52agvD15tVfZGYZLWlcztLt9iENUWRu+N3kJghFLAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRBAiGBj; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRBAiGBj"
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2ccc2e84048so19050155ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785166029; x=1785770829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h00hPgP6noe9BC3UX09XkAurvdybwJjf2mx/x9ihkss=;
        b=LRBAiGBjMiCzpWxbGW+k5yOB1dzXB9uIOmxpDNvwTGYd7hg9gq1a3nt/+Fflpss0Wv
         yIwYOhpSedXjRsUvbYyLTW1aDnDxoGB6TujYu6Z3QX0fotdxffwvFXSe4lwmKiM90hJQ
         eB/avXO3H4ygIt6T/l3U9cOWPPf83q4LpK4xTXZrvZN9qBrVl7Bz5a8XeFfRS63lISlj
         s+Pmn/nYKlAmMy8mmNjzn2lzvESWIlPb8KKeFn/+61CYIe6D7FE25Ef3GC5UJDgFU/UZ
         TwGTlvt9R6I+LdQh641iDsxM1x8duh/Ii+iPggHXM4C5yNN9Erca+AuTzabQvOT/uIIF
         yiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785166029; x=1785770829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h00hPgP6noe9BC3UX09XkAurvdybwJjf2mx/x9ihkss=;
        b=sdDwofIcTi+uxqG4Xj7XLPMsQ99Os0K6xTK5dltZ6eZJt0FX49UsB4G2oShWoHJfIe
         ONpySiLWg6uPkBmsYOchKx/wf1oe4K2fmA4SOy+Ric643Qj4Qg9l62dWEDLgsU3j/gtx
         P+QqiC6jmfBXddaeWinbTbAA62lULG/7lHBwSyWDoxGNq6mew29xz3GNNM8Woj1RwKqM
         KPk5wRWRW0d6QPpGBGMiazuaa/ywBnJa6xeM5FCpYUlfvtxOr1vUgCFwga0ZE21QUO9i
         nMIHCu+nNGiuviU+C3XQmPklD8zrhUtLNxUZiiytpGvwmm+3M04jKeUSFR6k/k4dafAI
         2JWg==
X-Forwarded-Encrypted: i=1; AHgh+RrEiGWpjGBTzGuL3FDDhCzclHvYJPpc83NlESArtrQUJRIXjQr+yLpP3hkH6tT01WvQm9jKuWfKvAey6/660kc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6SGqSKnXTlshCTLbP8QEqeLog5HcLWGCTcDhr0knRJfM6CBQ6
	7J6g/SJWb9BJy2KFKcpUJW/0+pkE9fvmuTt5rHBphttIUfrRR+BTOBCP
X-Gm-Gg: AR+sD11iK6I+E7XcDYJMQZqqfXiCEzvSGs9nU/PoaelUhiOtoYD1xudncx8l3zGVwx1
	HOPF29LBDjVbyTyizYt7AxIgIFxmGawihFNqeExzNR+5yooXRt4vy+l9QA9z23grDFDjLT0OSVe
	gqLB4k/G5KBBEVdQbR7CpwkxcJjpgPHTIVr9ESi6O1Xn8hpeacpcSLNAM9TU4WMfmQxxCL2ZF34
	8RZvAYR0DwM6dbEoqFfDHMhqJ/ENhZqyMsSh8zmWcnV89er5vv4rvSFRUmv+RS5w/4xc+pSLbhY
	FgFO2K7Ip2SMDKt3p6U0y1MDaq6MAB2z3isaYozUFeJAnOf5bocEn3iPJTQLY+BRKchCR7H2G0t
	kYkJJiBAZBkQPUhTwJyeVP9yZRJ/fU9bu+Tz71FDDkTjGvHOindMlU4Bt5romWOScEke74s4=
X-Received: by 2002:a17:902:d2c9:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2cfde6877c3mr85353625ad.1.1785166029425;
        Mon, 27 Jul 2026 08:27:09 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:71::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2b44sm37239915ad.27.2026.07.27.08.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:27:09 -0700 (PDT)
Date: Mon, 27 Jul 2026 08:24:58 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: sdf@fomichev.me, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Remi Denis-Courmont <courmisch@gmail.com>, 
	=?utf-8?B?UsOpbWk=?= Denis-Courmont <remi.denis-courmont@nokia.com>, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wpan@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com, Joe Damato <joe@dama.to>
Subject: Re: [PATCH net-next v3 3/7] ieee802154: convert dgram getsockopt to
 sockopt_t
Message-ID: <amd4RLJJZbsZK4TO@devvm7509.cco0.facebook.com>
References: <20260727-getsockopt_phase4-v3-0-e89627544639@debian.org>
 <20260727-getsockopt_phase4-v3-3-e89627544639@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727-getsockopt_phase4-v3-3-e89627544639@debian.org>

On 07/27, Breno Leitao wrote:
> Continue converting the proto-layer getsockopt callbacks to the sockopt_t
> interface, splitting dgram_getsockopt() into a do_dgram_getsockopt() helper
> that takes a sockopt_t.
> 
> No functional change.
> 
> Reviewed-by: Joe Damato <joe@dama.to>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
