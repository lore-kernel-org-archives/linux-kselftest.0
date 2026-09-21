Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A48142E435;
	Mon, 21 Sep 2026 20:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790021954; cv=none; b=jbFDfCR+ehScMG0o7xYJudwo+Hvp2Yr+IZnEPE7vF2eeO02i/6CG/gNJBE7sBCOcz1dnxoaatHjE79G9J3PRGBu2CgZrDkvJ1cOcl23Tm/OZf+e4HYWaWada2SNnO14lvLMBcFPFh/QzTNe4cPvpF+UiQvCgyY+ZFuOi9oImS2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790021954; c=relaxed/simple;
	bh=Y96/BXlhark1Z+9l1d8uyQvtzAw2CoHis/DRZZSti9s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EfIBhZ1KcevGQCghWHWpENrcp6sZZxIi9PSa66T3AMhqbTPIupFtl8TThL5hV8oqiFEkaLtpfwgOwv8BbEk5YGji26yMISsAbMPJuJPyb16z/ONPEeDU9vEphBu8LHicl1ZNgDOPstbxRVSMd/NtwkO8By7RiZ9FyULlZJ5s3tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inC0rgbH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inC0rgbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1441F000FF;
	Mon, 21 Sep 2026 20:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790021952;
	bh=cNXdQdZRudtnqxBAb72I5voOVN5GsT81p76+NrhRJ8A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=inC0rgbHTlZZta0tfzysd01IRrwJwj5OkkqxF0M0hGhwHyA4PGIpZGE1KOwrVCpiB
	 ahUbYtbqX1skiTPo+4ZkqlRo13tWiM15c2b0+MVteEMkR1X9QWHhp0ua/L/KM85sdR
	 bZ3WVQyMCPZuTehc2sILYmIVoFQ4QRx4/YhIDeiAqjyb3HkpYPk8HCkQg5LAVuHQ0/
	 22SXASh6J102RtipKDPpKNjuNOZgZOKPS6E+hG40t+1PosEZbmX/PXjT2HWWXANDm/
	 Ph8tjWrMPz3BNP9YKqymMZ3E4KBe+gijjHxPk5soihlW/i/gmDr08IAGt4AdiH8x0O
	 453iV1rHDIgbg==
Date: Mon, 21 Sep 2026 13:19:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Konstantin Sinyuk <ksinyuk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Francois Dugast
 <francois.dugast@intel.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Ilia Levi <ilia.levi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/12] drm/fabric: vendor-neutral topology
 infrastructure for scale-up accelerator interconnects
Message-ID: <20260921131911.532d81f4@kernel.org>
In-Reply-To: <cover.1787552412.git.ksinyuk@kernel.org>
References: <cover.1787552412.git.ksinyuk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Aug 2026 11:09:28 +0300 Konstantin Sinyuk wrote:
>   2. Are the Generic Netlink semantics, including dump consistency,
>      notifications and optional port statistics, aligned with YNL
>      expectations?

> 39 files changed, 13189 insertions(+)

Networking is absolutely flooded with AI generated patches.
Including long term contributors excreting huge unreviewed
code dumps :/ We have absolutely no time to help other subsystems.
Please do not use Netlink going forward, sorry.
