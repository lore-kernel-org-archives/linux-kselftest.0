Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2EE418A3C;
	Wed,  5 Aug 2026 09:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785923816; cv=none; b=lTPvBBqB4wDwDevUdb3vbtW94Ec9mmLe/AjHBEnryZ7CW27PGD2GFEcJQIqpbnZ81+ZICE3VmHGMm8it/1dSqiQ5gkUkckm/evZL6TEGm03NyH6ofXxaZtv2EwHR+t3MJlXC37rcex9APRNRxaN4s1sF13UvAs0ooK4aRTGni6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785923816; c=relaxed/simple;
	bh=xuH3gpgJFAGYO7rG8J+JcNb7SQ3cW3MFenm8IkyXAt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDBvCm+eh+bnbvQ0UmxkO8zJDp1m5V/6n0xA8i7uv71ceepWnWW3HMvX5Ox9pLpO+mWP7G0Op5oOparO7F0tBmCGPaXJupmqFJrZl/UCsh8lutRzp+EjLJtkG0kopiP8VOVF8atS5W4Guqt873ueK/HBiE8vh7EbB8LEXAbpM4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=oOMpvFOl; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="oOMpvFOl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vU82h41VzbqOPFwNUo1mFYWL1ePw+xHIJXcLdUBuRgg=; b=oOMpvFOlvVgbjBjW1Q0GdXKLba
	4cZiDdQDjM9suKS0j5POtbauzQ1B0+UxGxo8WXGJ8CN9pTgawsnshqR41YoCPuy+BgcfCPxQq7O0a
	bsKgIPrO+X+7sH97wSpRJs6AqOtCar5uXJQaxOVKLt+ihSMhUsSjK0sN5H+A+XME8g6ecrQCHgQx0
	0/Xyq3mTO4FX4bnYvja2z7tT3SF1gl194oEW+XWW/rkZJcIUvkFPitwgR3r43OxqZiDux/RpHLRx8
	7ZtElOxVbjbgS/ptX1kBCLQBAaoqRNYVd7L+u4kxdwSCE6YSA27do0TLP6jHhpf/Y8+lpcXmpilUf
	BVMv7GYA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wrYMW-00DpjT-0p;
	Wed, 05 Aug 2026 09:56:36 +0000
Date: Wed, 5 Aug 2026 02:56:30 -0700
From: Breno Leitao <leitao@debian.org>
To: Gustavo Luiz Duarte <gustavold@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	asantostc@gmail.com, kernel-team@meta.com
Subject: Re: [PATCH net-next 1/2] netconsole: publish the userdata payload
 with RCU
Message-ID: <anMInvnYk9fafp_Y@gmail.com>
References: <20260803-netcons-userdata-rcu-v1-0-1e5e6b62b75d@debian.org>
 <20260803-netcons-userdata-rcu-v1-1-1e5e6b62b75d@debian.org>
 <CAGSyskVKAwf8nb_3uFDbYUugR+dtO-cwSef8C9nSEgKZt_K=CQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGSyskVKAwf8nb_3uFDbYUugR+dtO-cwSef8C9nSEgKZt_K=CQ@mail.gmail.com>
X-Debian-User: leitao

On Tue, Aug 04, 2026 at 06:09:44PM +0100, Gustavo Luiz Duarte wrote:
> > @@ -176,8 +190,7 @@ struct netconsole_target {
> >  #ifdef CONFIG_NETCONSOLE_DYNAMIC
> >         struct config_group     group;
> >         struct config_group     userdata_group;
> > -       char                    *userdata;
> > -       size_t                  userdata_length;
> > +       struct netcons_userdata __rcu *userdata;
> 
> With userdata now annotated with __rcu, it should be freed with
> kfree(rcu_access_pointer(nt->userdata)) to avoid a sparse warning:

Good catch, thanks. I will fix in v2 in both netconsole_target_release()
and free_param_target().

I willthe plain kfree() instead of kfree_rcu(): both callers free nt
itself on the next line, and the target is already unlinked from
target_list at that point, so the payload cannot outlive the target.

Thanks for the review,
--breno
