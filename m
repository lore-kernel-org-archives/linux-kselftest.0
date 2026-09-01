Received: from mta1.migadu.com (out-235.mta1.migadu.com [95.215.58.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2D54756AE
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253088; cv=none; b=HhUeu3f0hXCsMSB33l+agUdjPMCUsCpUMpps9GyCMQ5Cnp+RUuQX9+hE1TlKfDb12Hqet/KNQF9R9al+CrEOj64zewsq+t4PnXcI3JF4OJa2hbUilqDJfbz0GHVZ3MoOdzZSM9Zvu6SlJnxTrc589VF4elN7Btl7+Zd9b7yE1nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253088; c=relaxed/simple;
	bh=ZIso4ptPNJGZpWJKew4ZgsGdgqmT/6zdPCg7vUXSiE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDxz/fuyfQjXowd01cUbaOB6VvFjj0cSs+KN1YfmMMcWlb30xgYm5rVu12jAuD7OxSxOb/KP6c0/bYhCnPBThbM7EE7P9xJeS91CzsykjAi8lOgl2+fMHiDdepBgpUFi43TLKAJz3zl6IXQ48gvOJuRNLirIomeEocKJIBpPc9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eF56NYny; arc=none smtp.client-ip=95.215.58.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eF56NYny"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZIso4ptPNJGZpWJKew4ZgsGdgqmT/6zdPCg7vUXSiE4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788253083; v=1; x=1788857883;
 b=eF56NYnyHMor6wFUfG+fSaVZRaqdoPjXT2s+LdZawzq86hAV+G2LIJe2C573DDNHEJJ8CX1d
 Afb2ZYF+LroSRIll/knFWk0UDiZxmULVUKlJtKCg9dMQYKEgyusc9Iona+0XLHT3W01/Yf3kv5s
 7/i7h6wIrJtPiqkvCP0J6ZWA=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 682b157fd764c229;
	Tue, 01 Sep 2026 08:58:03 +0000
X-Mizu-Trace-ID: 682b157fd764c229
X-Migadu-Flow: FLOW_OUT
Date: Tue, 1 Sep 2026 16:57:52 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: net: ipmr: Avoid memcpy() from NULL in
 nl_add_rtattr()
Message-ID: <apaTkG5SLsnbbcAR@fedora>
References: <20260901071353.3302900-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901071353.3302900-1-nagachaithanya9911@gmail.com>

On Tue, Sep 01, 2026 at 07:13:53AM +0000, Chaithanya Lagisetty wrote:
> nl_add_rtattr() unconditionally does memcpy(RTA_DATA(rta), data, len).
> For zero-length attributes the callers pass data == NULL and len == 0,
> for example the RTA_PREFSRC attribute added for proxy MFC entries:
> 
> 	if (mfc_attr->proxy)
> 		rta = nl_add_rtattr(nlmsg, rta, RTA_PREFSRC, NULL, 0);
> 
> Passing a NULL pointer to memcpy() is undefined behaviour even when the
> length is zero, because its source parameter is marked
> __attribute__((nonnull)); it is flagged by fortify/-Wnonnull.
> 
> Only call memcpy() when len is non-zero.
> 
> Fixes: 05068eaa67b2 ("selftest: net: Add basic functionality tests for ipmr.")
> Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
> ---
>  tools/testing/selftests/net/forwarding/ipmr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/forwarding/ipmr.c b/tools/testing/selftests/net/forwarding/ipmr.c
> index 9cd9f70de132..d3e26341821c 100644
> --- a/tools/testing/selftests/net/forwarding/ipmr.c
> +++ b/tools/testing/selftests/net/forwarding/ipmr.c
> @@ -120,7 +120,8 @@ static struct rtattr *nl_add_rtattr(struct nlmsghdr *nlmsg, struct rtattr *rta,
>  
>  	rta->rta_type = type;
>  	rta->rta_len = RTA_LENGTH(len);
> -	memcpy(RTA_DATA(rta), data, len);
> +	if (len)
> +		memcpy(RTA_DATA(rta), data, len);
>  
>  	nlmsg->nlmsg_len += NLMSG_ALIGN(rta->rta_len);
>  
> -- 
> 2.43.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
