Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B602D1F44;
	Tue, 30 Jun 2026 23:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782860758; cv=none; b=nkmYuJzWZgEoU2s5o4U7enGRVFDOhdT7mMuOKDxzRWdBefLSmHrXFZYsHuObADAt2e2HQ2dszluFEbSYBn9YgPDaq6zEHoo73scNU3Qie2PGIzWNl5eNGhbW6/Z7fCUv3/3t7xUyRzBlFSYNGtUxhv4Wxofi7EkYckWRvGLZ730=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782860758; c=relaxed/simple;
	bh=as2AH+swBCP/OHIkj3mwvYyZ71kqHokbMzPrMnDz4UM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sz6yPj9ZwIt0kySbCv9vnKE+6BoGhCEFjn9zZza6eJHFrxPZzClV9lvK3UdCoYn+8c1cdWWZalE8WeJhzUVYeTuSJcYywIipmAsQ92p9bc6Q4CnCZ2MRBWAsZU3RCS9MwdByGMvqIBxnEsuH/t/CiuMKfUxg6ZtJqBfTe9yJAlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sp3Rh6QS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sp3Rh6QS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADFC1F000E9;
	Tue, 30 Jun 2026 23:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782860757;
	bh=7cQ+oNW/YJFawXWPCbHUU3zJTsMASw9/tH0G0Srn6mU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Sp3Rh6QSCQC/Cb6fL7AjuWd5aEVLvkPoqNr75rDTgsnKxR+79xQZjylzgYSGoLbPk
	 zPmUMnh1JHUsKI4hPZ8p5jxskDqfTTOxBmuvtduKbA1TiC4Kj0g/sFuZyDFe/WqtTn
	 zGpK7L58Avwi031LILnOER1EnXQpYS1SfOi54PMKM24Sy462NnOzPpIdXiGWXDiNeg
	 ZpG7+rtKhmvGZs+P2rT7/vVNQgJqyllwo43ksaPtBS63EMGeE3tZiqqZov8ZX9YUj0
	 Fid8jisDVQjg9kKmPHU1tH54tGEuCNHM5K8wsH4uGJhUoHFKdWODcGPqAJEchOIICh
	 9WvT8bQGsFn/Q==
Date: Tue, 30 Jun 2026 16:05:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: Harshitha Ramamurthy <hramamurthy@google.com>, Jordan Rhee
 <jordanrhee@google.com>, Shuhao Tan <tanshuhao@google.com>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, Samiullah Khawaja
 <skhawaja@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v1 0/2] Reuse threaded NAPI kthread across
 napi_del()/napi_add().
Message-ID: <20260630160555.3736f900@kernel.org>
In-Reply-To: <CAHS8izNeoJiLyoyiPgzmX5CGcyivYqBpVxOcFnoxeOX_zzFd4Q@mail.gmail.com>
References: <20260629192029.4013794-1-tanshuhao@google.com>
	<20260629162619.55297244@kernel.org>
	<CAABY+HEcNnh+ATyA_JMg4LnVpP=egprTTi4UXxV9CfW2+71z+g@mail.gmail.com>
	<20260629181955.00e63b61@kernel.org>
	<CAHS8izNeoJiLyoyiPgzmX5CGcyivYqBpVxOcFnoxeOX_zzFd4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Jun 2026 10:38:01 -0700 Mina Almasry wrote:
> > > It feels surprising that the userspace needs to reconfigure thread
> > > properties when changing NIC configurations unrelated to threading.
> > > Another downside is that when userspace configures NIC configurations
> > > in quick succession, re-application becomes messy because a previous
> > > re-application might still be in progress when the thread is gone.  
> >
> > Can you explain more about your deployment and system configuration
> > flow? We may be adding micro optimizations when the problem is that
> > we recreate the NAPIs in the first place.  
> 
> We have an AF_XDP application with extremely low latency and jitter
> requirements running on our servers. Sami developed busypolling
> threaded napi for them. Since it's an AF_XDP application, they attach
> their umem to specific RX queues, and then configure threaded NAPI
> busypolling to achieve low latency. That involves using the Netlink
> API to set the threaded/busypolling property, grabbing the kthread
> PID, and setting some properties on the kthread.

What I don't understand is how you have an "application with extremely
low latency and jitter requirements" and at the same time "user runs 
an unrelated ethtool command" reallocating NAPIs and disrupting that
application.

Honestly, the last two times y'all were touching NAPI it was a major
effort to get the code into acceptable shape. I don't have the cycles
right now to help another unknown-upstream (intern?) get their patches
into shape.

Can y'all not open a pidfs fd for the NAPI thread? You'll get a
notification when the existing kthread dies?
