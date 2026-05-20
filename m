Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0C436F421;
	Wed, 20 May 2026 17:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779298045; cv=none; b=Tf/2fzsyJC0XoASIXfppjUs5yI6sWk3sRxjCOr2AhB7UxWPFmLJUsD0htq0cm/wkp3TL/gDOp8Ufhqq1sl7ccmOlqFGW0p5q+gKL43IcLMOS8x45XezY/wVFdJ0s3gyXgsjn05pIw8SFZydECLFdGlO0gZZq3uE7qMN8tMhGFj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779298045; c=relaxed/simple;
	bh=X0txdFwz2nSY7i3sfY0DqlglxtMhA/Cxtg/abAKCOAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIgqovrdXYAUMRf/fH6h4+VEmIMp5DBZ16OIc6ugLSmtxvFlI4T06st2uN/7tpWTawIzSxYDOFxwC2K/WluXnFjkM1wxeGmjRuFt8aJ++zcs6YFvOZPxHxnvwROVZbGAgjVbXJbQxhWspgv/Hm0QT/mDGDGwH+/3hzX4dY43X2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=CBIJabsi; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="CBIJabsi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ye4EgwQSw5kqIQb5WLTWB7hJ2bBb4HasauCnq34yJXA=; b=CBIJabsiTPY6sA3ESjOy9LxNKo
	sT9jNkexZOR4ZqVA0uk//TZRXhWWlOLQhX9MvQlP9BPW4Xj5m0oyDvnt3W4ziWiGEMNmUIOGzEb5p
	EBWN3M+AJkSc0lurihhu9MAxcS4zyv6k8OAzOK/XNAppezu+JTXjCGnOI/iHUy5CvgqCCm2kCDlN4
	AhUuE3JVdH8nJuAPN6xHyuoFR3qXpgKsTimoZOSPshlRs+rfFdpkPn4xSWTov6SB3Fqc87WfTSMtF
	3t85Po12709EI1tWHVMD5Muw0ngvRGOIiNb+u6Od1ZCbTKqedkPcyrSWUT5/5IQQdV4GjbtmhHhrN
	MkX3sIqg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wPkhL-003GVU-0z;
	Wed, 20 May 2026 17:27:11 +0000
Date: Wed, 20 May 2026 10:27:06 -0700
From: Breno Leitao <leitao@debian.org>
To: Simon Horman <horms@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, shuah@kernel.org, david+nfc@ixit.cz, sameo@linux.intel.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	oe-linux-nfc@lists.linux.dev, kernel-team@meta.com
Subject: Re: [PATCH net] nfc: llcp: avoid userspace overflow on invalid optlen
Message-ID: <ag3uNJZ8uyn5jPry@gmail.com>
References: <20260513-fix_llc-v1-1-33c76f931ff6@debian.org>
 <20260518091103.427351-2-horms@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518091103.427351-2-horms@kernel.org>
X-Debian-User: leitao

On Mon, May 18, 2026 at 10:11:04AM +0100, Simon Horman wrote:

> > @@ -319,6 +319,9 @@ static int nfc_llcp_getsockopt(struct socket *sock, int level, int optname,
> >  	if (get_user(len, optlen))
> >  		return -EFAULT;
> >  
> > +	if (len < sizeof(u32))
> > +		return -EINVAL;
> 
> Since len is a signed int and sizeof(u32) is an unsigned size_t, does C
> integer promotion cause negative lengths to bypass this check?

Good catch, you're right. `len` is `int` and might get promoted to unsigned in the
comparison, so optlen = -1 becomes a huge value and slips past the check, then
min_t(u32, ...) clamps it back to 4 and the overflow happens anyway.

I'll fix this in v2 by casting:

        if (len < (int)sizeof(u32))
                return -EINVAL;

