Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F90E3BA225;
	Tue, 15 Sep 2026 16:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489094; cv=none; b=rQWpoLBqEIAMVdnpN1keD8TDCY6QA2TP1/OFSq4vONjCn+AaB3DNgHVwIBK1ycCChka0KdBFW0vyg/T6cYICujyv4+62uk6Q8SSlZjxbvxxaupARLcL4CL2WE4dDi59GImdMi25EowKPBMBOv02NbwtDY5+CaB+2iKFkgyVyD6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489094; c=relaxed/simple;
	bh=XgNoQpBfu/vGzNbyupmIlNasSAiO1h59FVX3ouligAo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RRnc1z6FSJHYlUC27N7aDhdpB41Ag2AplQawBYHx9Dw2NthSXcqBwE+gmGOWyuiBSU0G5XzGLJMx+++f3HKZGNK+MNN6XmoWa4upaUlnVBsE8ysDotpw9ybu8XbQo1xY+K3zXqNPBXPo1wKm3MMEUVU625njKtCreQmynl5JRzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXa3q/+F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXa3q/+F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487A81F00898;
	Tue, 15 Sep 2026 16:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789489092;
	bh=b6+95D28PlcHzggvDD2QmCct2dKOTM6Zi0doWX9cJOw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aXa3q/+FACl0gnw683fX76KoPv+LFqJKybHVPQ0ZVl56ZTSig2zsdslQKNe/kvRf2
	 jEgD0hy7rXGdhxq8HpL+5NQIKfwRCqWFtBOrP0q2U64+TjN1hVP6yu1DH0W8wYRsZQ
	 dzUwenn/xE2KcZ3W3WfB+EOy7JfPl9giTLL+hEuGOoIAFEhgf167uQag7HM2U8oP88
	 uJ0Iy+bSHwfTDGhOieq77AOZJwI1wMuqmVGekAwN8FnMLVXhIPRX0fvCb3hIGksHdw
	 js1J4/Z1K41VnsbL7jyBMeZvcoo+15layZ50HGvs1X8npKEQlz7KPNnbIa0MzaHpl5
	 Lryew7YKPmWGA==
Date: Tue, 15 Sep 2026 09:18:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 daniel.zahka@gmail.com, willemdebruijn.kernel@gmail.com,
 donald.hunter@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 4/6] psp: notify about a disassociation once it
 has happened
Message-ID: <20260915091811.4a0a15a6@kernel.org>
In-Reply-To: <178945226440.22033.5430499132880217307@kernel.org>
References: <20260912200426.121025-5-kuba@kernel.org>
	<178945226440.22033.5430499132880217307@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 06:04:24 +0000 netdev-bot+sashiko@kernel.org wrote:
> > +	cmd = PSP_CMD_DEV_DEL_NTF;
> > +	ntf = psp_nl_build_dev_ntf(psd, net, &cmd);
> > +	if (ntf)
> > +		genlmsg_multicast_netns(&psp_nl_family, net, ntf, 0,
> > +					PSP_NLGRP_MGMT, GFP_KERNEL);
> > +	put_net(net);
> > +}  
> 
> [Severity: Low]
> 
> This isn't a bug, but should the assoc side be made symmetric with this?
> 
> After this change, losing visibility of a PSP device in a netns produces
> PSP_CMD_DEV_DEL_NTF, while gaining visibility for the first time still
> produces only a change notification in psp_nl_dev_assoc_doit():
> 
> 	list_add_tail(&psp_assoc_dev->dev_list, &psd->assoc_dev_list);
> 	psd->assoc_dev_cnt++;
> 
> 	put_net(net);
> 
> 	psp_nl_notify_dev(psd, PSP_CMD_DEV_CHANGE_NTF);
> 
> For a netns where this is the first association, psp_dev_check_access(psd,
> net, false) would have returned -ENOENT just before the list_add_tail(),
> i.e. the device was not visible there at all, yet the netns is only told
> about it with a change notification.
> 
> Documentation/netlink/specs/psp.yaml describes dev-add-ntf as "Notification
> about device appearing" and dev-del-ntf as "Notification about device
> disappearing", and psp_dev_create()/psp_dev_unregister() use that add/del
> pair. A mgmt listener in an associated namespace would then get a change-ntf
> for an object it was never told about, followed later by a del-ntf for it.
> 
> Since notification semantics become uAPI once released, would it make sense
> to emit PSP_CMD_DEV_ADD_NTF to a namespace which becomes able to see the
> device for the first time?

Bunch of extra LoC, and it's fairly common in netlink for events not to
differentiate between "new" and "changed".
