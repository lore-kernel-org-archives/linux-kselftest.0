Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749C43672A8;
	Tue, 30 Jun 2026 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782782407; cv=none; b=n8CgFQuycNfzcbZXKUA9amVrwsuJJZkkVSA/PxFfkgp11BUwh9RyHh610gAjA4Z380naTa1kBKK5MfxyRDoe7EEStKsPX15FmF4byu2DrCTkAqXiDUTVWKpSmHt860qB2ZVDIuZ3WRV+37O0Kvl6TEojCX7YPj+c2EDGEiXBUjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782782407; c=relaxed/simple;
	bh=oH5ItFAvN/YMLQYllKayVXDZv3ry0Opqia1ypco3vAI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sICxAVN+ZXRyWdXw3j3DlhESTAjCLMQkq9SkOXFlKvrQMu7xNrmXQq6426501UnLml5WbC5WuYcEKxF/VtSgGDXHt2WMOURDWdiSQ/YESQjYdx+TA137VRIgH0IvZZOmc8w2Lk3jOcrAyztTlEn3Eh4Mrfafe1YS9xS5jfHTQUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2EPnaK9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2EPnaK9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B231F00A3A;
	Tue, 30 Jun 2026 01:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782782396;
	bh=Bq8NFMfE4HjHcqzwatm2Ix6EPEm2ZoNA8UKzYfMwQOY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=H2EPnaK9FVhIiNcuAzpwN/oda82waz2IGKL0NWiTj3kZ7pKmgXAb6ZMJj3aQHa8PL
	 wOxU1aMvBS1GBfQpf7gT4k1Qw/TdTvg+uIewmsNvRZrVVa7t8nqsGrqqSNfEsVr3mk
	 jOGZ+LZtp8/XvX1y/q+3vspb6rvsq9a2ZO7gKwFSWq4TUhEUPfxg+m1zmS73oZA672
	 iYIM0O6XajuI5+gHgHG367ZM8iw1vcAujCpwRZ4WOIoSPXNYD+GN2rdJb7LN4DZj3x
	 y4HujHFpD3QjLYGYi+GrHeTra2pfHLTQxEJ9wX4mua02RqT3W30WclWdOhaRXXXE3K
	 5l1uywcjDbz2g==
Date: Mon, 29 Jun 2026 18:19:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shuhao Tan <tanshuhao@google.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan
 <shuah@kernel.org>, Mina Almasry <almasrymina@google.com>, Samiullah
 Khawaja <skhawaja@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v1 0/2] Reuse threaded NAPI kthread across
 napi_del()/napi_add().
Message-ID: <20260629181955.00e63b61@kernel.org>
In-Reply-To: <CAABY+HEcNnh+ATyA_JMg4LnVpP=egprTTi4UXxV9CfW2+71z+g@mail.gmail.com>
References: <20260629192029.4013794-1-tanshuhao@google.com>
	<20260629162619.55297244@kernel.org>
	<CAABY+HEcNnh+ATyA_JMg4LnVpP=egprTTi4UXxV9CfW2+71z+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Jun 2026 17:47:03 -0700 Shuhao Tan wrote:
> > Send a netdev Netlink notification when NAPI is re-created and
> > let the userspace re-apply the settings?  
> 
> It feels surprising that the userspace needs to reconfigure thread
> properties when changing NIC configurations unrelated to threading.
> Another downside is that when userspace configures NIC configurations
> in quick succession, re-application becomes messy because a previous
> re-application might still be in progress when the thread is gone.

Can you explain more about your deployment and system configuration
flow? We may be adding micro optimizations when the problem is that
we recreate the NAPIs in the first place.
