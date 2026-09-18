Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260DA3191D6;
	Fri, 18 Sep 2026 22:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768979; cv=none; b=midb64BIHpBlyzJFS4IZ6HXwqwoj4DthqamXoP+IDlmc/QqrjvCFnqtVV4j/mXlDBKFnwwK/KrxTLOxX6iu4YkygJq2GX2DcoSgDMUV3+18HJY/pqOgx4+op7l+gdmMar0SGKaxTFWQ6076kaVMYxT+DS83m9uz1nQZ9TkI7Ro8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768979; c=relaxed/simple;
	bh=B7L8bgGir5x4X9DTMwDJE2hZZ5SkDP5XaC31sbGr/RE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ef7UFFdanfwKVm+RZ36Qv/ov7RUvdPcQ4AzRDkh/XF7qLIEwntqeF9o6+b4R/QfWqkOYBD8MZeW30F4xIRMAK7jyO8R0IacNy9FK/cOeTFDqXrGHnqCU2DOp0mS/cFqFbCP0Prk2Ls1Z8fUcMKPN37hd45b06Sktxw5dAHS6KlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzsIIySF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzsIIySF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9461F000FF;
	Fri, 18 Sep 2026 22:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789768977;
	bh=B7L8bgGir5x4X9DTMwDJE2hZZ5SkDP5XaC31sbGr/RE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QzsIIySFtHbPwMjNEo2FZvU5bdW5xdRYoerQgLE3nhIh7GQ5GsV5vY1mKSLnB/0Nl
	 0dP1yDa5v2DCqwbFB4v4vRlIV9Uleb3wVFxhyBmr7WTeOpXEE5n+1IUjJURc4YccPi
	 VzAt7vr0GShgCDNcC59kXfpxFqMAVNtDgP0QmlQ8suWPbssH8BRuWkpDupyi+Meqrd
	 yRdzTtjCg93XXJwYT0roiu5fcVHu4F0uUXvqsdGNSNA6n/gHPo7UK3s8H9bhkBL6xj
	 GVz8OxPTOlfybJfrJw4OCC8+OZEnMW7/ZVlpYsiyEIeJrTkrVrXrHD5txHxW3YQcl6
	 PdNaJEMiKxcrw==
Date: Fri, 18 Sep 2026 15:02:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gabriel Goller <g.goller@proxmox.com>
Cc: Andrea Mayer <andrea.mayer@uniroma2.it>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] selftests: seg6: check extack messages on
 SRv6 lwtunnel setup
Message-ID: <20260918150256.1a1ca82e@kernel.org>
In-Reply-To: <20260918153544.1178884-3-g.goller@proxmox.com>
References: <20260918153544.1178884-1-g.goller@proxmox.com>
	<20260918153544.1178884-3-g.goller@proxmox.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Sep 2026 17:35:16 +0200 Gabriel Goller wrote:
> Add a ksft/ynl test that shoves invalid RTA_ENCAP payloads to
> RTM_NEWROUTE and asserts both the errno and the extack message are
> correct.

Please be judicious when adding tests.
