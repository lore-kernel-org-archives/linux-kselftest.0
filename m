Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7C113776B;
	Thu, 17 Sep 2026 02:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611965; cv=none; b=bLaXzP1NgOYJTKKC9UwHTBaSgBKh2boOlcbD8U01eoTrTCXH2tfM8UntMzmE4cunQlUIE7mlpI7dhTOusljc1mcAtRv96sPr1IgdBMaVM6JOcZxyO1SGjidX6q4QAn4/PWAye/4rH/tyz++pmNdKpNJL+X0o4IOnZGnlHL2M+9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611965; c=relaxed/simple;
	bh=UeFfFnvZcuhyCykwabSQ07AeIlNc2U9+wB0sc88VGs8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ahtv5hnuqAz7HFP6xR3cGV/U7Ih9nEm0OnQbxdiIQRjDpygj3r379RZmibtuiRLZRyqJnCZwiO4XfOVOI8IGMXQfvLEcVPEbfg1qwTXO7NQss86x5M6cYQ41vQ2ZN5v/rNSobdeR6cRBeDyKDuCA3dhYBnM6VSifQEuGNqxhEiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBq02MSt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBq02MSt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE06B1F00893;
	Thu, 17 Sep 2026 02:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789611964;
	bh=UeFfFnvZcuhyCykwabSQ07AeIlNc2U9+wB0sc88VGs8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TBq02MStJuouRJHgZj5IN/w+K2JkwSbPgnVQVZny3OIulVEbX/4Jik94uACrxmpCw
	 kocwOal59EduGQU1fRLfWv49yw7uXCPUAd+q7QFHXt5WAKVJrc1NGbz2XY+2dmiYHu
	 zFwZA+nhX21HlJYrkzZYydl2iHycJSaiEsUTl2shH48KN7AgfjIQEK1fVGf9jmDmw3
	 sN77Is1j0MwDqiCrx2HXv+9GEk1pY7DYW5ZnIdGySJAMQTmPHYAXHKxcNzSSBMeLD6
	 U/AL3soDctumszwzqhak5SQDaaVuJYGnIydjsRZpQi2UY66WGhIjOJh+Gdz6YS9n2x
	 ikFdUXbwqNH1g==
Date: Wed, 16 Sep 2026 19:26:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] selftests: drv-net: Add VLAN test
Message-ID: <20260916192603.09415e57@kernel.org>
In-Reply-To: <20260913143926.77366-1-ovidiu.panait.rb@renesas.com>
References: <20260913143926.77366-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 13 Sep 2026 14:39:24 +0000 Ovidiu Panait wrote:
> This series adds a selftest that pings over 802.1q, 802.1ad and
> QinQ VLAN interfaces with RX VLAN stripping offloads enabled
> and disabled.

Thanks for posting.
Nicolai's suggestion make sense, please make sure you fetch net-next
and rebase because the gro test has changed.
