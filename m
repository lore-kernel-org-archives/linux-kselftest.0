Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBF73469F6
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 13:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727638; cv=none; b=MksZ+Ce0IFg9KyjP9hNHzf8AARVfckdQepWdpRwDXhYlo7xfjzrdW/lZhp8aUlxRqaIzjocHliPq1U49fWSBTW0ZkvmH08DAIwWv0FXHLvTL0FX/bj+1fttCV+tFtt2aw+/grbI6nsjU/EttXlwjRB5tB1ZB6jPXquLnkwvZ7sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727638; c=relaxed/simple;
	bh=gui0VHTSLLwEHTPJ7tc1ugqJNcqEWciy6Fvv6kb8FpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhnRLEKey/UFxE6qCZ6RnEvPt2BLdTJK0CzfJyrmvYqhUJA9Qzfe8dvKKCmqBjoBrQgI0gpLpZvgyZ8IiqB/bJRGoYS4tY0+JxLlo2VDvgVFB5NAJf9upaEFEYLXfkZIQbPnHyz/MXWEGwxbhDtoNgeVNYj9WraegppfiSfci/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=ftS+fLD0; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="ftS+fLD0"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dcbade417so10844718a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 06:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784727636; x=1785332436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9feiKeFcTEnJsnOt+AVgxkROZ++OwVZ0S00dQJw9vl8=;
        b=ftS+fLD0qv/usuDVM+ESN4XKOBsoTKL2Df1skMTcrKJpPs/FYnGILEECIUyN4Y0dmJ
         hSAdny02ZivrrvoI1DRt+zq4G7RKhWYAC+zQsHGBJI5RJ7cCeKv+djO/MItHWvbRloR4
         T7y8A8oxGiY4z7xW/njiWXG+OekQH2kFNYnUWVNcZOrJvCiP0ik4dUPJVl+7l/ReGaLh
         cJ6axA5npjVn5KXrA7GtBVQsRiol13yVhAWEMoQb/hyTN52XgiHHre96VwRBSBU7IMwB
         oVul2VZqDOWUDGAEG96NPQseqNkl5C/+LNvt4iCPVmJ5vwVAJE9IxyPoPJ3W4wXpNxBx
         oG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727636; x=1785332436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9feiKeFcTEnJsnOt+AVgxkROZ++OwVZ0S00dQJw9vl8=;
        b=aVqy8UJR1Xr/lDQMc8nc/Sesi8D5dASzCyH75Z6F79Gz+8Gqf4/gCzkKm3UxTvGi5w
         TBdH60Xxn3qaXP7jFrgOvZsD60EoDji3zjMvG3n0yDfTY4yPmHZnFyTIhktJ1DiYlDmm
         nw7yiOWh2Hnvr4pV+7Tell1gXlYoasSyx8TMMRFdpY9XZJq2ZpaSYiQ6gQmV6RBGzMJH
         umCcvKgx12/jv/FyxrdJG+oJgqu5N6x/K0LuNAW98+V0ertDvGM82f+LRr6TEUzk671Y
         LRZLIQ8GycL7p1/ZhX42ER4mjFa6lEHPi/Mn/LUn67Bh0UEMSLwuKzHx46aXnOGJIVKo
         kvKA==
X-Forwarded-Encrypted: i=1; AHgh+RrzZqlhGxBZDI1G7SXLiYcZKMhffE3046gTN2TIx5QgZb66WJNmOl2Zl46pHe5oaSfPbnhwDx7GqFWsbsBjwE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwalNncNkCXRVDoQmS4sQ2sv3PtnaZH9y8FNVjpqI7tQmP3sB3H
	qYHs7s/GBSnVUEqTIHJO2biR7ZJTFOTeWbKyaDgY7vc4sqKeIGCSzGN1p2W6yqHgkkI=
X-Gm-Gg: AR+sD11ADjv9fFe5s29Y4f4cuBUDOQiFnJNhQdt3e9UE4gHnSIxvBJsFlolhIPxR1h2
	XWfNnza87Vwbv1AxM8hbtRDA1v0iCEFUbZ28t9Kvly5DPyWIJhdKh7ZUWqaS1taOjX7p7BeVbu0
	FpI4EZRp/lpOWv/E2QL4459jvALJWhJkt60Q9F6i5dYM4TLsvMossNTUm1LR7egCaAPVCJUqH85
	CKS7sy7g+LDuwQFeZDXpzZmZVcBKEJhKd08e98kbCJUOzeLb0qHAqa8+1ajEU87oYqBBCKXg+dL
	VZPyxTX5zSUlTz8NETnpf4B8agnPN9N9Cw6NuE+12UWyyUIwf29wvoY/EK6yITuPB7gB+krUh+y
	vszx6cXgPjvRzsAyl6QLHy4EwRzIiqLQt7+oaNFJL6TyPKjKaXcMT+NGsjbssDFFDlVm4ow==
X-Received: by 2002:a17:90b:3dce:b0:38e:7f1b:f01 with SMTP id 98e67ed59e1d1-38e7f1b144cmr11954633a91.36.1784727635713;
        Wed, 22 Jul 2026 06:40:35 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:44::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea7aa8c97sm1110409a91.9.2026.07.22.06.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:40:35 -0700 (PDT)
Date: Wed, 22 Jul 2026 06:40:34 -0700
From: Joe Damato <joe@dama.to>
To: Breno Leitao <leitao@debian.org>
Cc: sdf@fomichev.me, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Remi Denis-Courmont <courmisch@gmail.com>,
	=?iso-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis-courmont@nokia.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-wpan@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH net-next v2 3/7] ieee802154: convert dgram getsockopt to
 sockopt_t
Message-ID: <amDIUv4Sa/i7MfEq@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Breno Leitao <leitao@debian.org>, sdf@fomichev.me,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Remi Denis-Courmont <courmisch@gmail.com>,
	=?iso-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis-courmont@nokia.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-wpan@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
References: <20260720-getsockopt_phase4-v2-0-8a08fcfa0d72@debian.org>
 <20260720-getsockopt_phase4-v2-3-8a08fcfa0d72@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-getsockopt_phase4-v2-3-8a08fcfa0d72@debian.org>

On Mon, Jul 20, 2026 at 09:17:44AM -0700, Breno Leitao wrote:
> Continue converting the proto-layer getsockopt callbacks to the sockopt_t
> interface, splitting dgram_getsockopt() into a do_dgram_getsockopt() helper
> that takes a sockopt_t.
> 
> No functional change.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  net/ieee802154/socket.c | 38 ++++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/net/ieee802154/socket.c b/net/ieee802154/socket.c
> index 85dce296d7513..763f63e48afe4 100644
> --- a/net/ieee802154/socket.c
> +++ b/net/ieee802154/socket.c
> @@ -831,20 +831,12 @@ static int ieee802154_dgram_deliver(struct net_device *dev, struct sk_buff *skb)
>  	return ret;
>  }
>  
> -static int dgram_getsockopt(struct sock *sk, int level, int optname,
> -			    char __user *optval, int __user *optlen)
> +static int do_dgram_getsockopt(struct sock *sk, int optname, sockopt_t *opt)
>  {
>  	struct dgram_sock *ro = dgram_sk(sk);
> -
>  	int val, len;
>  
> -	if (level != SOL_IEEE802154)
> -		return -EOPNOTSUPP;
> -
> -	if (get_user(len, optlen))
> -		return -EFAULT;
> -
> -	len = min_t(unsigned int, len, sizeof(int));
> +	len = min_t(unsigned int, opt->optlen, sizeof(int));

Does the same min() feedback David gave on the last revision apply here as
well?
