Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F389249E122;
	Thu, 10 Sep 2026 23:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083734; cv=none; b=mrw0NmBhxR0E5fYoA2GfAinmOZlQFAGSS9aTnSE6vxguKmiXxFkItVn3sJnAacb3r6EDsEZEalAZBWueKA41wvOJLy/GylfnR8UjhsYSYq8rBwTnbPHekhTUjrDKtObt5g8J1oidAqCgaeURmzSfBQdqQDFPJzwnaWk+lQwHxzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083734; c=relaxed/simple;
	bh=r23Peo7U0H3eEmRcPzuoWwqNpbVh6+emhgaXYXfc5Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mk5Tknj8C9Lx3Xf6VVUo7X/fsmkFph1v0OUuqLNJ8UoNCBiz3Fc4s/kPjfyFwZaQnOF/mlJFil4Y5guK5FE0VJpVIyLYewbtjKAAc1GxpORfFToYUymfcmWR8CuF9eehxyILHPvoH5NnAoC/GDOUHgakzPdNNMFaknWzsbb5fPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UP21ZgXC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UP21ZgXC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249E61F000FF;
	Thu, 10 Sep 2026 23:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789083732;
	bh=1KAo6kp4oi9EVWg8WoSVq7Fc1201WX9RfL0Wj3WvyIE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UP21ZgXChI4dXgLUNLhnSKTZDyX6MZNkUa8kBr7stQTzhMFEJOXHgXShTdpbNaGEP
	 FjEabvVUtUMaJhIWJiaWZQ1DNbdHLYUx+gTQnlD4YNXcf3qr1cjDJkdGG1hVG/lnn0
	 rH5WzactI14KMYaLRlzorBVYkwKq/cu7MPa31wVxEMI9CUexEsEh6DD2FIoWhOSnXg
	 d0czVaiu3C/vRZYtrksDalEv2UFhIp7xf90VWo+3eRS7n7cx04UWCiHNjnuTn+z708
	 VHicRNYCXltuAQvBmqi2e4D7nXb063EqAXLpUjoVVoBm6/V7wzBAZCSrVJVb0R7on1
	 S0RB2Fhg/5ErQ==
Date: Thu, 10 Sep 2026 16:42:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, recv.jo@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org,
 joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v4 6/7] selftests: drv-net: Move _set_ethtool_feat()
 into lib
Message-ID: <20260910164211.666ad484@kernel.org>
In-Reply-To: <20260908164309.59282-7-ovidiu.panait.rb@renesas.com>
References: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
	<20260908164309.59282-7-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  8 Sep 2026 16:43:08 +0000 Ovidiu Panait wrote:
> +from lib.py import KsftXfailEx, defer, ethtool, ksft_pr

tools/testing/selftests/drivers/net/lib/py/feat.py:9:0: E0401: Unable to import 'lib.py' (import-error)

do:

from . import KsftXfailEx, defer, ethtool, ksft_pr

?
