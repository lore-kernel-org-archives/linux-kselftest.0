Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5852C21D9;
	Wed, 26 Aug 2026 15:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787758750; cv=none; b=bJ9z612uh++wRnBSDFS5R0MaAjjgY7z8h+dW2NZDWEZDLju/i7Pe+55hRA0wgDYlbsUXPwJ4RJcHQMMyPj6ArD6USUcU2TairTg8MHOwoFEysLxYwzT6G4zcGxS4AMsDTIl0GYnCcgM3TWt6a6cDNl3FdJ8ypLLFgq0nWJfXAjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787758750; c=relaxed/simple;
	bh=PcufB80+r0hfnaaaft6SSnvoAUt8Fpms4kJHZhTB/E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type:Content-Disposition; b=KvgFdEfXQ1qE8csA9I0b1n8X+Z2pgOJfNVJj31yBCaEUFhi7v3tldedI695WT8U1R9478Xd7JsrB2iu6WFJmrSS8YwASCmRzp3DdCLd67OcQalbVZyoK/IFWbGGXvYG7Nx5nlmmwSwuRcnPZFN08DRU/UpZi9UelEMVtdBKagkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYiMeGj1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYiMeGj1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F811F000E9;
	Wed, 26 Aug 2026 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787758741;
	bh=PcufB80+r0hfnaaaft6SSnvoAUt8Fpms4kJHZhTB/E0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LYiMeGj1J08r+tqq+QKmSVROhE6t7j13NRjjyEGSAmItELjutpsGAAtYTcvDPpHH8
	 rAiDRVTgnE17Upg6aVosDTEjdi+KhV2eetQ29xW4HOCRrlhxA0AVErz/dJF5FuLPH6
	 8dnZkHTr3MhWFj2zrrvLK7AK8bN7epsgUk0kNJofuW1zfvJi7L1a9x4CV9fOjo0JIN
	 lKM/x6hZKBiV9X0P2FuWwPsrwZb0ChXj/Wi3uDAsM0v3OBDsJ7BhRyQoeOTcbWl4fJ
	 RE+Cbr8t1dNQKk30KJBmjG5a2UrHGPrn41S6BDN6bgmSKTHWgpp4RMT0z6I9X+LHuS
	 qfh326u2VXerw==
Date: Wed, 26 Aug 2026 18:38:58 +0300
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
Message-ID: <fabric-leon-reply.1787844400.ksinyuk@kernel.org>
References: <cover.1787552412.git.ksinyuk@kernel.org>
 <20260826093222.GC42790@unreal>
In-Reply-To: <20260826093222.GC42790@unreal>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2026 at 12:32:22PM +0300, Leon Romanovsky wrote:
> Tell your AI that this is not how things work in the real world. The chances
> of multiple hardware implementations fitting a software model designed
> without considering the actual hardware are effectively zero. This is why
> successful subsystems have emerged from consolidating support for multiple
> existing hardware implementations.

Fair point. The simulator validates the implementation, not whether the
abstraction fits real hardware.

The model was shaped by the public amdgpu xGMI implementation, and the
cover letter asks AMD whether it covers their requirements. It still
needs validation against production implementations, and the read-only
milestone will not be proposed for merge without a production provider.
I will fix the wording in the next revision.

Thanks,
 Konstantin.
