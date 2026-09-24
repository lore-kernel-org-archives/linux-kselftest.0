Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1573EDE60;
	Thu, 24 Sep 2026 10:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247432; cv=none; b=HHkn8P+WDUxZYQunFMLpmf+/GohtHMq1GxQhhLlqLa4onXbvloYoFlLuMni3aNML9YS5CxUAeQ5TYoX7F+CHqAQF5TaF1zrwoeFpTQgyhHGOVbXGAmXbt+MMNHWLVBSYOXiztx32QK3ZzDnsv0ohlXsJMXc9c+nxa8HyAfh2ysk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247432; c=relaxed/simple;
	bh=m0aO0fGkkWz1N/O2gSuqRquq65tZ+MKWr80p9mSF2l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uT0nlLb3aXIawzqvoyxyBI9zGOGAYAm14sV6ZsMtJVCwVKyNxITvRL7yJBk4EXQ73IAWPKr68/HnjaMvaQw9bMmaVBMS3+dNSqPrCEEI+lmpvMjFV/crqRdhACvqmWvnHfAU522Mj9MCecgjXDM+TkNh5NfxsEqDddqNfL7fnPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=CWzkPeOz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QIgt1jnX; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="CWzkPeOz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QIgt1jnX"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 49E967A013A;
	Thu, 24 Sep 2026 06:57:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 24 Sep 2026 06:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1790247429; x=
	1790333829; bh=F/wv8rlVvhXlNpAodROvwX1rTgpBcpHfGOH8x4asVFw=; b=C
	WzkPeOzB4u7z+o/GDN/kiYvIiOFu9KHBi7n5KNgavPAtt9sYpwxHNumY6dLxehsV
	tt9sauHMzTVnUy3bR0rjR1MVpcso0YVHwful9+GBjGPWOlnaVxf2L9iC0CfnHjX4
	lrAlQmKTfPO23ZMxCidNx59mOoFDruJpZBUqYDRGh5+sIRdVOmyflU18TLPFiXNa
	dSquSwVoAUJ3+IFh42jgvbp4VnTcF7NgKrFlTT5tIYMAUiP4X6YbhuOxZkXKvLJp
	/zQ2FZyagssVR5C05KH98SnpROV6y8bTUgG3NrMHpj260M01jeX7ohxwq7PQQ6bf
	O/ydnUEMQnrQTqr7fGL5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790247429; x=1790333829; bh=F/wv8rlVvhXlNpAodROvwX1rTgpBcpHfGOH
	8x4asVFw=; b=QIgt1jnXMDhwTClLc7LSSSyxwqVyrzf+Qlx2sVyhvfzwhXNd5hB
	QfRzjVMzvlOv3RU3oXEGBrGNUgxKhVkcYp26VV8Wwpp708nsF9I7AL/Q7y8G3mfF
	aQPI8xbbCMmxQsvfZQFUo9iYRsOEp7ZDco33E5bHZZXlnWrLR0/GEuP4HAiwLq3t
	abKeP4FT81o96QA9cR1nCKwNmVfg6PEoxD7AliwDxHF4tSt7Bl8+B+sDgJKt/jdU
	7CUWI3fyeZRkW+ue7RUF+pEkg6fw/2/BDsttTOnjN8qK8/12qb2hNNWLqJTdviZt
	HmR0ihAMtqbIeg6LnkmQmIVVFceetyC0ZBw==
X-ME-Sender: <xms:BAK1ahKyJsTBVTs0PzQ3tL0vBRzAo17PAoBABFS3BTs9SEN78MsHyw>
    <xme:BAK1ahG9xKjgICE_uPLNZGiQcBQjHzU5wQVAnLIKaDL71AAl2tHdYf6kTrdeZ9OUm
    VwMchlIMb_Jhvx8gCEY_PfU7-vYm6YDt2FxmANYtkgnoGmjIuyiwg3l>
X-ME-Received: <xmr:BAK1auR8RKv8MzsXoiAQONAo8A8qgQTDezF1SBafdaIH6Z0NnPowao2tXIfI>
X-ME-Proxy-Cause: dmFkZTFwrd1kfiEN7ECeGw3OT9gcWrgsjA49dB13G33AsgODJR3JiyYKur7uUr0X1nn3Nn
    kNJP34HYMDHxbV5dSs1fzsez71JzR5MCy6eVQXLJP05ouSb96qUjzEcXSvD2H1Kw/U9PqW
    sYHpl0ICLHG0wRIBi2As4hBwig7M9Elx/N54vreI0LLeffzqcsod+f30BFGJ4/DPuh7Q/9
    umPklK+9+izRBGb18Yf2ywZ1WtRLpA0MfT6kGq17R5fFXtzMWfT/nR9rHARSBqadiOe2rY
    g0fJHKr/lTXc6PS6XC+IVk0JQJK1rdTePBXdGk4KAXae7TF/vFZj6oiRYpkKv/v7/GllQT
    SKGS2XQopMx13GRm32NrZDFAiXboSmaR9TbmNr9kDYKH04WC7tsyikyjfv/CsJ9hQ2QBFk
    igEluFPaoADgmb9RccqX1HeEfBFikJ+UWXs7fYA7t/4aVslIGht/CJtH8SGHJ4mCel0M8w
    ywvdUKSO31WPcJcIdxpmVhWMf2boANHRLzMAst4VHvGFYX67MDR6mfXRQSDR6oElT5pLdp
    DllJKKuK9GXzNjjve9H76ngjP6UFpfvJVgVK5z05KN/cc5hPpPVCguxlOKVskzTAq1O6dA
    fh703rr5cdiBaBzyzZFusjAze9s3/waPfYRUrzPmvBSyc9MLiC1AQieOQxLA
X-ME-Proxy: <xmx:BAK1aqUONGT-INsdvb5qpJvXrvIZroJFrRa3lMFpgLlEHjNp7saHeg>
    <xmx:BAK1atjXURo9zmVh243MrhWmzEdreAXogQkN46JDhcbWEyp-Jun_Hw>
    <xmx:BAK1ajdJ1Lm4alGEgH0HjiZ33fWwEpz0_0DqbzJFUlLRL8s_vZ0u-Q>
    <xmx:BAK1aofOlC7Vds3WrIyGgrLjFd6M1cDUNBiLaYfCFYOQw64HqYNWJQ>
    <xmx:BQK1aumE0ZvnPhoX5vLCcJGiiPobU3o7mbf3huqQeNAhGKs-P4L8xVdR>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Sep 2026 06:57:08 -0400 (EDT)
Date: Thu, 24 Sep 2026 12:57:05 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Antony Antony <antony.antony@secunet.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
	Jamal Hadi Salim <hadi@cyberus.ca>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, Yan Yan <evitayan@google.com>,
	Tobias Brunner <tobias@strongswan.org>,
	Florian Westphal <fw@strlen.de>, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH ipsec v3 0/6] xfrm: state: exact mark/mask match for
 control-plane SA lookups
Message-ID: <arUCAefkfEw-Jl_z@krikkit>
References: <migrate-state-fixes-v3-0-836125bb53dd@secunet.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <migrate-state-fixes-v3-0-836125bb53dd@secunet.com>

2026-09-21, 22:43:59 +0200, Antony Antony wrote:
> While looking into a XFRM_MSG_MIGRATE_STATE issue reported by Sashiko,
> we found the underlying problem generalizes: xfrm allows multiple SAs
> to coexist for the same (SPI, daddr, proto) differing only in mark,
> and every netlink method that resolves "which SA" - xfrm get_sa(),
> del_sa(), update, get_ae, new_ae, expire, migrate - uses the same
> wildcard mark match the data path needs. A broader-mask SA can
> silently shadow a more specific one:
> 
>   # ip xfrm state add ... spi 0x1000 mark 1 mask 1 (SA_target)
>   # ip xfrm state add ... spi 0x1000 mark 0 mask 0
>     (SA_decoy, catch-all, added after -> bucket head)
>   # ip xfrm state delete dst ... proto esp spi 0x1000 mark 1 mask 1
>     -> deletes SA_decoy; SA_target survives, untouched
> 
> xfrm policy had the same bug, fixed in commit 4f47e8ab6ab7
> ("xfrm: policy: match with both mark and mask on user interfaces").
> 
> Netlink lookups use an exact mark/mask match except for UPDSA; the
> wildcard match stays for the data path and state_add only.
> This series applies that fix across every affected method,
> not just XFRM_MSG_MIGRATE_STATE.
> 
> This series is not fixing likely isusses PF_KEY. As it
> is no more receiving non critical fixes.

The series looks good, but why did you remove the selftests you had in v1?
https://lore.kernel.org/all/migrate-state-fixes-v0-3-a69e8637ba3b@secunet.com/

-- 
Sabrina
