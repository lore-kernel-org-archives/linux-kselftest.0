Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DA939184B;
	Mon, 31 Aug 2026 11:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176719; cv=none; b=lwMTAkpbf5nWVNIp5q1aBXaxLoSAYMF7Jz7Yz0kAIDT26KRu70RxgpDCnMjEvgQdL72YObIhqC0kScZOu9CZ5cV+QTH/qzJnExYSlYv+ojNUCviSJ1kY8BMVhK11iBZKzmNxDKi9NXwNZ1bxElNQKeeGuDp/vU0Q56Ddt17pwVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176719; c=relaxed/simple;
	bh=4hvTHiztlQOiP907maCPpn5aQhR1xGnaZSzYHabZFhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type:Content-Disposition; b=epQA/TvUAJWJt2ADyGRdUgtk5Icwuc0mva5Hx02lLuA2fPLSoeZCexOU4x15d9dkvFSWxJb/c4n5EhDz5CfN+6n00C7gTiAWqTXrsuR/qsWlsgrKxGgHWUQsCFRzv+F5WWkJTil6p0xMGJ+jLSM0Te49+IdheJKflaa5Z2k/Sho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cclrgie1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cclrgie1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182301F000E9;
	Mon, 31 Aug 2026 11:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788176718;
	bh=MGM5UjBFTBl6z/Tmn5z2Mz6KhaOwI7O+2FjYZ4TU9vE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cclrgie1c/zQ/qUNz+5jQ5Fyp7rGqXNHQK5CMuKXGOOIxvQ0yx4Ajp0BYXaDLfUy8
	 8x6RAvO/F9bNR+6EU1FYnrO9CKRvQu/drwaKCFBDDHoBLPmGyj7hVpcFrf0rKqa4o3
	 l+kZfTXifyTJv+44ACiLmE5CQ4H/CUaTdUNymPY4OrpI8dV6uFFhAHCzu1/UQJ1Xne
	 6ud2nJGT6O7MZn7un0z5IRBF9IlmTEzQ8rZukQ7YJwCKedf0JMTRb57L4mwHUJMeAe
	 7hVzmQzxUPW53Ez/2VeMEVMOa6wC2bIQRLEyLdlw2T084Y/4Prh5IySZ51GJT7GjOL
	 iddabrOKiaOlg==
Date: Mon, 31 Aug 2026 14:45:15 +0300
From: Konstantin Sinyuk <ksinyuk@kernel.org>
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Francois Dugast <francois.dugast@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Ilia Levi <ilia.levi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, jhs@mojatatu.com, jgg@nvidia.com
Subject: Re: [RFC PATCH 0/12] drm/fabric: vendor-neutral topology
 infrastructure for scale-up accelerator interconnects
Message-ID: <fabric-jiri-reply.1788176464.ksinyuk@kernel.org>
References: <cover.1787552412.git.ksinyuk@kernel.org>
 <apAsfOowcG0cTvT8@FV6GYCPJ69>
In-Reply-To: <apAsfOowcG0cTvT8@FV6GYCPJ69>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Thu, Aug 27, 2026 at 02:35:16PM +0200, Jiri Pirko wrote:
> Using generic netlink instead of sysfs for this makes a lot of sense,
> but it may be a bit odd to use it outside the networking area.
> I've been struggling with the same in another non-networking use-case
> as well.

Agreed, and the series shows the friction. The namespace handling is
nominal, and CAP_NET_ADMIN as the mutation gate is another borrowed
part of the model. I went into that in more detail in the reply to
Jason.

> - One character device per registered instance, not one global family.
>   Access control is the file: udev rules, ACLs, an fd passed into
>   a container.

The fd-based access and event model addresses real problems with one
global family and one multicast group.

The main question is what the CTLV instance would represent. A fabric
can span multiple devices and has its own lifetime. An endpoint can also
be detached from a fabric with fabric-id 0 and continue to exist. A
character device per accelerator would not provide the same global view
as the current family.

Can a CTLV instance represent a multi-device fabric or the global
fabric registry rather than one physical device?

> Would this make sense to use for you?

In principle, yes. I cannot base this series on an out-of-tree pre-RFC,
but the fabric, endpoint, port and peer model is separate from the
current serialization.

Changing transports would be more than regeneration, so I will read the
draft before saying more.

Thanks,
Konstantin
