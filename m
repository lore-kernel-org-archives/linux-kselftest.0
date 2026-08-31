Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D962C0294;
	Mon, 31 Aug 2026 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176710; cv=none; b=IMwQjRM2Zdu0ZxW5jiZHr/pzFWQWi0l7SX6RR7Ca6nJb38vJtQ4y6LVdyBQ1hMvxY2ZbZXxgq+FuWlugkzcagSjhlQW0JdLMz3db+HcUSVKH43kp6EeWkeRyV+onq06A/b1aC/6Fu84a6VnEFbRY3S9w/fZjmfZVmiR63lqnapk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176710; c=relaxed/simple;
	bh=Pk2HuTXvrj04yvZHTloga/AzYqMYWnPBZNra2rviZCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type:Content-Disposition; b=FtcKl0P4kULUPiX8jsXPOJy5JVD0B6a9GixWBVRYWcQi2EXQO5ZyUU4/ZvnJDaQj1xaIY2uRTXf2IGb+Kzo16ayHiyCcwNn1jA5BKgE/ycqejJ45FFvGn6tAivw3qHYvvk73uakEeTc9AS6YPqyxsOf9tyLjRkPYWhBbXo027SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdUsfKde; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdUsfKde"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196E71F000E9;
	Mon, 31 Aug 2026 11:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788176708;
	bh=wGdIvMQDIWqxcyQAeKHe8ucGu5TZhv2BRT1ivpeEVSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KdUsfKdewDSrrbHIxK3Dnxh1M5Y0JSMeTR7RaY42i0KCGoye7ktLqLHrO3SDqrF7z
	 LVtu2OqTlRSk5UPoflgkTV4el+A0DFPR4uwHENHf3wsXCg3kmJMBQ/h4/DIZHeD5CT
	 ilxoQ5bbmf3XrnN6JV1tG+4EP0DETlsslwFyLaFfutB/tiJjRVLMgWgPlsQ8yISWwv
	 BjT04QENHaW+yBCysjSx8Rm2hKvmq5pdIRKRQDZGVa9oKgkIjFki92RytPJskZC3+p
	 nZu7mDZWoIlqvT/8flz3bX2akFWmg5YZ+KGsc6wLrxOaTN2lRfoWRfezo5W+KZw2hj
	 JzDIK7W5MgPKg==
Date: Mon, 31 Aug 2026 14:45:05 +0300
From: Konstantin Sinyuk <ksinyuk@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	dri-devel@lists.freedesktop.org,
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
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	jhs@mojatatu.com
Subject: Re: [RFC PATCH 0/12] drm/fabric: vendor-neutral topology
 infrastructure for scale-up accelerator interconnects
Message-ID: <fabric-jason-reply.1788176463.ksinyuk@kernel.org>
References: <cover.1787552412.git.ksinyuk@kernel.org>
 <apAsfOowcG0cTvT8@FV6GYCPJ69>
 <apG3Gsk1TeMD-oCc@intel.com>
 <20260828170301.GA4157646@nvidia.com>
In-Reply-To: <20260828170301.GA4157646@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Fri, Aug 28, 2026 at 02:03:01PM -0300, Jason Gunthorpe wrote:
> For something complex like this, if you can't concretetly tie the HW
> to a net namespace, and follow the net namespace rules for visibility,
> then it is going to be a painful choice. I speak from alot of rdma
> experiance where net namespaces have been consistently challenging.

Agreed. The series does not provide meaningful namespace semantics; it
is host-global and confined to init_net. I would rather make that scope
explicit than invent per-netns fabric semantics that the hardware does
not have.

Generic Netlink was a practical starting point, and drm_ras established
the pattern in DRM, but that is a simpler problem and does not settle
the choice here. A device-fd model like Jiri's may fit visibility and
access control better, since a global family has no descriptor to check
against. I would not switch transports based on an early pre-RFC, but I
no longer consider the transport choice settled.

> net/ is mainly focused on IP networking, it is where you should be
> putting the ethernet layer at the bottom of the ua link over ethernet,
> SUE, or whatever.

Agreed. Ethernet PHY, MAC, packet processing and switch routing belong
in the networking stack, not in DRM or an accelerator driver.

Scale-up can reuse those layers where they fit. What differs is the
accelerator-facing semantics, even when the underlying transport reuses
Ethernet. From the accelerator side, a scale-up endpoint behaves more
like another core in a tightly coupled system than an ordinary NIC.

This series does not duplicate the networking layers. It models
endpoints, ports, direct adjacency, membership and local state: no
netdev, packet processing, Ethernet PHY management, route computation
or switch forwarding.

> There are so many variations of these "scale up" fabrics now, it would
> probably be appropriate to have one subsystem that aims to work with
> all of them. It is almost rdma but different enough it probably
> wouldn't fit well.

Worth testing. I would rather approach that through the minimum common
object model than start by defining a complete subsystem.

DRM is the current location because the initial providers are DRM and
accel drivers, not because DRM should own the transport or must be the
final home. The objects do not depend on GEM, scheduling, display or DRM
memory semantics.

Switches are the difficult case. A UALink switch is not a DRM device,
and complete Pod topology may involve information owned by the Pod
Controller and switch-management plane, not only accelerator drivers.
If that information has to be represented as first-class objects, DRM
may not be the right final home.

There is no established common Linux answer for this class of fabric
yet. I would rather start with the minimum topology objects, test them
against direct-link and switched implementations, and review the model
with multiple vendors before deciding its final scope and home.

The LPC BoF is where I want the accelerator, networking and RDMA sides
in the same room:

  https://lpc.events/event/20/contributions/2412/

Thanks,
Konstantin
