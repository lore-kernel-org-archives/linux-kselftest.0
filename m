Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25813BA225;
	Tue, 15 Sep 2026 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489024; cv=none; b=biHNm4/guu1kiR58Gh7oKHvkz7pNNYYaFmy4QfIPbdqtN7tP/ttEHfgRM49/kpCdRUe/YIbbq634uPjBqtjRToMnlDaO9WwG8Gqm7RBv/TqcbF97BquYZTSqYeEXZ5zfMY65PhdGULGzNNi0JY9coYjvQsnMocJVBX2cznkf/0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489024; c=relaxed/simple;
	bh=KjI/QkW5w9yeJhJUjG+iovinwsjZwK1uAheqFrEoMd8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bILkdTis7FAYHLmMWKQD0uLGoxUvg/KRwp8Tcqi7Q3uHS1QAFbb6rO4hLnn3ipWMd2VqPjG/yCrsq+m4vo1hUxoriCTlU2DeveWFXlMphKoKdtzQIo6wHZb3Ale7QrARL8zS/Z63gAwcTE0yOUxZmv0Ppt4LTEBLh1HhvyXJ1/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fULvTSyd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fULvTSyd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3C61F000FF;
	Tue, 15 Sep 2026 16:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789489023;
	bh=VhqPFt+0/CWZe0/eVqPhdC8diBrbeVfP1ZK9+n4fJEQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fULvTSydqyk6aSwmM5ArjHIObUxokqgm+NIA4PcZQ7CwvSjkpLxyW+BR/sQtlhc09
	 58kYA59QJD7IpHL21eBqbiOhOtcjXENmTla6UWv3vG4j4TIS0tEu6u6RIuWjIiyPEg
	 MtLBdrxEiNbDE8xXx5vJjTKc99STLeYJsrvpzm7hIsxtbg3MmxMJHfEUS10RC5V2XO
	 r6dljZw9hu68GP78P3MQk1NBp0+5iuoKhHfDiz4UlZLmRxGhX1/g6MEsFlaaXhOoPG
	 F2yx7Fpxp0o7gz1HtkhpKfFXu0+Tt6vqlpW7NXPrdVXvDLujUH9Hl/voM1v6z0sNI7
	 gctxPA+cha1bg==
Date: Tue, 15 Sep 2026 09:17:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 daniel.zahka@gmail.com, willemdebruijn.kernel@gmail.com,
 donald.hunter@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 2/6] psp: don't report the main netdevice's
 ifindex to associated namespaces
Message-ID: <20260915091702.57264919@kernel.org>
In-Reply-To: <178945226311.22033.17255405958222817792@kernel.org>
References: <20260912200426.121025-3-kuba@kernel.org>
	<178945226311.22033.17255405958222817792@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 06:04:23 +0000 netdev-bot+sashiko@kernel.org wrote:
> >  	if (nla_put_u32(rsp, PSP_A_DEV_ID, psd->id) ||
> > -	    nla_put_u32(rsp, PSP_A_DEV_IFINDEX, psd->main_netdev->ifindex) ||
> >  	    nla_put_u32(rsp, PSP_A_DEV_PSP_VERSIONS_CAP, psd->caps->versions) ||
> >  	    nla_put_u32(rsp, PSP_A_DEV_PSP_VERSIONS_ENA, psd->config.versions))
> >  		goto err_cancel_msg;
> >  
> >  	if (cur_net == dev_net(psd->main_netdev)) {
> > -		/* Primary device - dump assoc list */
> > +		/* Primary device - report the netdev, dump assoc list. */
> > +		if (nla_put_u32(rsp, PSP_A_DEV_IFINDEX,
> > +				psd->main_netdev->ifindex))
> > +			goto err_cancel_msg;
> > +  
> 
> [Severity: Medium]
> Should this carry a Fixes: tag?
> 
> The unconditional PSP_A_DEV_IFINDEX in psp_nl_dev_fill() has been in the
> dev-get reply, the dump entries and the dev add/change/del notifications
> since 06c2dce2d0f69 ("psp: add new netlink cmd for dev-assoc and
> dev-disassoc"), which was based on v7.1-rc7 and therefore shipped in the
> released v7.2.  The tree here is v7.3.0-rc2.

Since user space won't be able to depend on it 100% of the time 
and has to explicitly ignore the main ifindex from containers - 
my conclusion was that there's not much gain from treating it as a fix.
