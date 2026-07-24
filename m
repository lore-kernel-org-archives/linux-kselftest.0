Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0753F4457AD;
	Fri, 24 Jul 2026 19:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784923100; cv=none; b=QWHXm1SockNfMdRl69ku7ooUqc9WpBwFg6U4QOvWq5yIn0i/i+Yyqfo2P+REz4Hu9AIxiHp1oqJQRQP/8uCHSY09+e5ao0uvctw962p9OYcus2ieUDJcQvbvMCYe/Cjq+Ym6GNyVY2eLAKOrbBcHYAXZKon7A003yAP22zo7Uck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784923100; c=relaxed/simple;
	bh=lb21E7z9s0CHmANg7LWCROj6X8cgow1MQGD44nrgy64=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OGJN5w7rjUdyZWbegM/vARGi+q0hKuO6lI+9OxgQ6rh0/ysNapMPD4thuhQERR1Vh+RhJld0uc8J7/7Gkjmb1NXP/m3iPKhiNTnF8la9GqCFlTcVhzAnBuh1kkBWJuqkWldONxLtk4EiSC8uIpzyVaDEanua3LQmIqN/Xqk9sgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQ14tj3O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQ14tj3O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E671F000E9;
	Fri, 24 Jul 2026 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784923098;
	bh=RKU7Aj5piD/+ksrcUPiv1/0J4gp+hns8k/kGpaKUr30=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=oQ14tj3OKxjOc/ecSsc+YLkOyNWgDivVDYGKl0G4yZbWiG7oHEMtMY1IQZK4WTt1c
	 HxJpvFqaR8vDeWMEmQLvpR2WUS4TdqviUs5f5v/qUpNC6L8nz46IwFYaeCk4m14b1N
	 8NQYfr1+BhXkLsIwJJzKf5NE0LFgNUSgZSraasar2HlKMEIcmxyv3rgKMW+hGJVN0/
	 4t4qKQKg2V2Lht7K7yvaA40+f8D3E5EALXMcBJ40N63IaEWgHY8KVR64sRHHGzFTP6
	 vt/DEe9VZYm/0v9sWWDf+QsKZAjOzMi/NA+wPXuujA/EP7/QkXjlyf+xviQD5vkisb
	 SUzmJqqHUcuKQ==
Date: Fri, 24 Jul 2026 12:58:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net,
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com,
 dw@davidwei.uk, Joe Damato <joe@dama.to>, Bobby Eshleman
 <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v5 1/3] net: devmem: allow rx-buf-size >
 PAGE_SIZE per dmabuf binding
Message-ID: <20260724125817.4495a7d4@kernel.org>
In-Reply-To: <amOVWgJ3BAJ8I/4+@devvm29614.prn0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
	<20260708-tcpdm-large-niovs-v5-1-34bf6fac941b@meta.com>
	<20260721110713.325d36ba@kernel.org>
	<amKqlqgfZipKjrii@devvm29614.prn0.facebook.com>
	<20260724072419.62778bbe@kernel.org>
	<amOVWgJ3BAJ8I/4+@devvm29614.prn0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2026 09:39:54 -0700 Bobby Eshleman wrote:
> > BTW did you add both min and max checks? Cause the only risk with using
> > a dummy value would be that the policy will be rendered inline, and
> > inline policy is u16 so 64k wouldn't fit. But your sample above has a
> > max of u32_max which forces the out-of-line policy, which is what we
> > want.  
> 
> Yep, u32_max:
> 
> +	 name: rx-page-size
> ...
> +        checks:
> +          min: page-size
> +          max: u32-max
> 
> Sorry, probably should have just sent the whole patch instead of
> replying hunk-by-hunk.

Ack, LG, just double checking.

> BTW, how expressive do we want these policies? For example, would
> absorbing the power_of_2 check into a policy be valid in the future? or
> is that too bespoke?

Power-of-2 could be useful (it's implicitly one bit set, which is also
potentially useful for validating one-hot flags). The trickiness is
combining power-of-2 and the min check :S We have one validation per
field. I was wondering if we would be better off defining the field
as a shift instead, then we only have to check min. But I thought
that it'd be a little unusual for uAPI and possibly maybe one day
we will want the non-power of 2? So I figured checking min using
the existing facilities and open coding power of two check is good
enough for now.
