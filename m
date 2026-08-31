Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F373B6366;
	Mon, 31 Aug 2026 11:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176744; cv=none; b=eLcHn6U+er+6kQXcubn4VXXH19ycXEi3KqUx0Xqap3j+b5uxmA6GGASudXJbNId3/qg46WdEtjhDdCxE8K9xzpkqmtU+ijqBk9uiUzytW81DBfvBJrS8LCKFah4Ymtga2CMmf0KJXy4MG6YugWEYGfn0qs3WmraE82FQquqnW+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176744; c=relaxed/simple;
	bh=aD2I6hRAIkKKRiLhJCMWDF9AgppkULVbICs8o805ONk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type:Content-Disposition; b=Qlz4ayhJ/Cshnp0fxVGTqop3hvpQwEFEtxBCF1NsxhKzdbGX9FTRoRXTd8K9z0xVr8q7nbcC+sU8H+UUGrIGqWmbPL2plqck4bjl4ZKHGKPI/Ku1gHt9MPw2drnc6Kql7KlOkSKf0AljeSVR53Lw/wt+Pi4WfAGw5WLQsfN5jKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQBkfrBY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQBkfrBY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D0F1F00A3F;
	Mon, 31 Aug 2026 11:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788176742;
	bh=bC0M3u1C79l9mZxmj5fz1xjpZ2H2du7CqTBNxjYUL6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PQBkfrBYrPDy7GY4tMT2xbCMVrCB1YoW5+2t7lkCi+/PXWgBjBK8dFy2a+Bl8heRL
	 V3n48mZs5qlAlSs6IE4bAbYHKzwNa3blY1OW+muOXgy41yX504QKdN5Xq2chOn0m59
	 Q9lPufYgEiULi+Qgpu5BKc8LNnlTQMcErbdKWdaDjRr0HQJfpbxccxTlMbUiyxLjRv
	 WeYxNgQ+58kQkUM8rvaOlDsrhpjVj7RL3fN92lrUxuI8K4VWGKNyWf/kDaE6Xry3S4
	 fXxRciCiSAj8NVxGBNZ+wfBunJtWbOg4wxt2MWrgNFUmNEUjVtoQc9bIwCrCWXrteX
	 EbZ/D9y/zgqVA==
Date: Mon, 31 Aug 2026 14:45:40 +0300
From: Konstantin Sinyuk <ksinyuk@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
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
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/12] drm/fabric: vendor-neutral topology
 infrastructure for scale-up accelerator interconnects
Message-ID: <fabric-leon-reply2.1788176465.ksinyuk@kernel.org>
References: <cover.1787552412.git.ksinyuk@kernel.org>
 <20260826093222.GC42790@unreal>
 <fabric-leon-reply.1787844400.ksinyuk@kernel.org>
 <20260827170911.GG42790@unreal>
In-Reply-To: <20260827170911.GG42790@unreal>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Thu, Aug 27, 2026 at 08:09:11PM +0300, Leon Romanovsky wrote:
> The wording alone is not sufficient. Your proposal should be backed by
> real devices representing different architectures from different
> vendors.

Agreed that discussion and simulation are not substitutes for hardware
implementations. This RFC is meant to shape the model early, while it
can still change, and to ask whether the objects hold for other scale-up
protocols, including NVLink and SUE/ESUN, not only xGMI and UALink. It
is not a merge proposal.

> The amdgpu xGMI implementation already exposes the required UAPI through
> sysfs and would need very strong incentives to abandon its "legacy"
> users in favor of this new netlink interface.

Nothing has to be abandoned. An amdgpu provider could publish topology
through the common in-kernel API while the existing xGMI sysfs stays as
it is.

I agree that xGMI alone gives AMD little incentive to add another
interface. The stronger motivation is UALink: it is a new cross-vendor
ecosystem, and accelerator and switch components may be owned by
different vendors and subsystems. Common userspace should not have to
assemble one fabric from incompatible vendor interfaces.

The cost of waiting until every vendor has a shipped interface is that
the common model then has to preserve all of them. That is the position
xGMI is already in today.

> The last new subsystem I am aware of was introduced with implementations
> from three different vendors to demonstrate its robustness. You should
> probably aim for a similar level of coverage here.

That is a reasonable robustness target, and I cannot claim it today.
The next revision remains a design RFC. The object model and subsystem
boundary still need review against different hardware architectures.

The LPC BoF is the next step:

  https://lpc.events/event/20/contributions/2412/

Thanks,
Konstantin
