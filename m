Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92D13E5A0C;
	Thu,  6 Aug 2026 20:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048477; cv=none; b=ffcp4ppfwRsDmxenhvFjgu5EyPU7EE2ObJs/XjbubhMZKctXvDueibIllpzvmGCsWrSIze91Yj/taVzmNRWmluUIepfJXnhqSPr8SByYBjBfHl2zCUwUoIWqRxfsy52UQhwVVrom5te6FiEhB1qH2uowcuDgIy+W3sob3kN6p+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048477; c=relaxed/simple;
	bh=VI4ATDwtqPcrSdiXUhO3moE8rQo7xcV++52yJlhnZgM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gj2fHfFzEjxCwxy/0qs5D+tITVtQ++jdh7T4PbV425rmmbiVnOIkRRMkZfRZhUFPtIg+AEmbnbxRVoojiQy9OsYPiUsHT8ose7n/OfE6OliZbRWzeLlNmokVm6AY1PmDIAWD2KaEyWZKevx+j8wxC2iVzlWHjo+UnfJO4iG/Ge0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNt8EABs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNt8EABs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFF41F000E9;
	Thu,  6 Aug 2026 20:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786048476;
	bh=yaEHoymnyFlCJ1/O4dVpG1O047FOhYwcrBZpz9qzpYs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cNt8EABsFUNh0Ul/KeeYR+ET6A7dV92rdyscj5XsI1dBm8u5g9C9IBC0R/yOQqj6B
	 YARmX/rk3NBeg0Oc2NUgeQvbgntmMYEaqveROXY+RqVte71OPyQXR1oRBs33ngWzCO
	 18yQa9rhvJLdZtq4kpxbf/eQIuSOOkgcGmJ+BLCgQm7bJF4CKcEY+36+Ie0Yy5hz6q
	 fgLlDNcx1/pZf47j1Tm1fzpf2STM3VOBpJ+jooGyNEWjPbwWAzcbYuEdry7R9SGHXn
	 md48skHegQFOdLWipj0AoRdw/vtuWoXoMsgMm2fAPyxJ9QmUDRdu+xM8QQcZAFdLCl
	 9xT26bsLc0vaw==
Date: Thu, 6 Aug 2026 13:34:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: devmem: fix 5-tuple
 flow steering
Message-ID: <20260806133435.38c34e31@kernel.org>
In-Reply-To: <CAHS8izP=mgsdxv3AtjJo9JY5OHC17zeX-VbPPH_gFF=Ndb_qjw@mail.gmail.com>
References: <20260803181852.491437-1-almasrymina@google.com>
	<20260806121631.13175f7e@kernel.org>
	<CAHS8izP=mgsdxv3AtjJo9JY5OHC17zeX-VbPPH_gFF=Ndb_qjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 6 Aug 2026 13:05:49 -0700 Mina Almasry wrote:
> Yes the test fails, but it gets past the flow steering configuration problem.
> 
> And in the code, the change looks correct to me. If flow_steer is
> False, then we don't pass the -c arg to ncdevmem. ncdevmem is written
> so that if -c is not set, 5-tuple flow steering is not possible (the
> client side port is random), so it falls back to 3-tuple flow
> steering, which doesn't work on GVE or any other driver that supports
> only 5-tuple flow steering.
> 
> run_rx (devmem.check_rx test case) doesn't have this problem because
> it does `flow_steer=not hasattr(cfg, 'netns')`, but run_rx_hds has
> this problem because it forgets to override flow_steer at all. This
> patch fixes that.
> 
> To be honest while looking at this there were a few weird things. Like
> I'm not sure why the python arg is named `flow_steer` (it likely
> should be 5_tuple_flow_steer), and why flow_steer setting is tied to
> hasattr(cfg, 'netns'), it should be a proprety of the driver you're
> runing on (unless all in-netns drivers will support 3-tuple flow
> steering).

Could we clean this up and add explicit test cases for inserting
specific rule types? We want the one-sided-tuple format at Meta,
falling back silently would be a loss of signal.
