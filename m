Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E582DECD3;
	Wed, 26 Aug 2026 09:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787736748; cv=none; b=HjHJgiUGFgxGnKF+HZE6uWbDzBcqojpin+SL8+XtTXWcEhx9yKYsSiCQPcK4BRKXfzEI2nOKeHXUqMcJ0oTtSm/VRtLOjBzw9PkCPvIUNialyy2tslrKO2vMHKYfGH+M2uC0mjsOmLuGEQAGIr2Y/YUPVPEJj8bamg4rGMB+3aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787736748; c=relaxed/simple;
	bh=2PHccR8xyLrnPaFs3pmGnj/EtIQOtajP2CR1wKuYah0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDpv1w02eUhRbKCHft2wi70equeL9KntPQ8wBCMlSOEp3CneYXUrRuizh5lzlfijvwBCLZGLb/XTDGgCBW3j5WphmaT2JG6YY99kkQHbpYFGkwGjdabZM2VtMN+as7FvOGbR8wCYtehHFXJXkj5JvR2KXWVqKOf8nD7HhirC1Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmU5UCZu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmU5UCZu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C58D1F000E9;
	Wed, 26 Aug 2026 09:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787736746;
	bh=2PHccR8xyLrnPaFs3pmGnj/EtIQOtajP2CR1wKuYah0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cmU5UCZuSb7me/V2S3DfVzH7U9aH4L6RsZOy2YhwofeGMdeBaoMf/quLEmPJ+urTF
	 We3rCO4fPP8qRTmsH1oAJ70JXjBkNGHqBrtscRFoqm9rD8FomT7Dl5JiDVF3sKELJo
	 IKfiGesxOyxBU7Y/W77pZ3+yavy7OR8Z6f98nxrNY+Q+IosEuckgSjCO2ALk5/oVxf
	 1ow62XN1JC/P5nF8cUn52lZEH6/RJmAgSlyu2u7FMpScnXQ/kbNWjDe44LMOlHfYCq
	 rukqHgRrOOUBrg3F7UJABiezj4u6gt+akQDgmrMsRHEev/J/x0hYAyqETiaJWWWaYf
	 Lx0JaJfXA0ecA==
Date: Wed, 26 Aug 2026 12:32:22 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Konstantin Sinyuk <ksinyuk@kernel.org>
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
Message-ID: <20260826093222.GC42790@unreal>
References: <cover.1787552412.git.ksinyuk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1787552412.git.ksinyuk@kernel.org>

On Mon, Aug 24, 2026 at 11:09:28AM +0300, Konstantin Sinyuk wrote:
> Modern GPUs and AI accelerators are increasingly connected through scale-up
> fabrics such as AMD xGMI today and emerging UALink systems [4]. Linux lacks
> common, vendor-neutral infrastructure for reporting which accelerators are
> directly connected, through which ports, and in what state.

<...>

> No production provider is included. Shipping only the synthetic provider is
> deliberate, allowing the object model and uAPI to be reviewed before being
> tied to hardware.

Tell your AI that this is not how things work in the real world. The chances
of multiple hardware implementations fitting a software model designed
without considering the actual hardware are effectively zero. This is why
successful subsystems have emerged from consolidating support for multiple
existing hardware implementations.

Thanks
