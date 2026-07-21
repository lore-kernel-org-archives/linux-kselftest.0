Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1035F3C6A57;
	Tue, 21 Jul 2026 18:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657346; cv=none; b=QtIWFmOoENKzh5P6pRjUgsSEB6cdTRKchhhBkd7waFEuErlVKJlTkfotBNWoZs+SiVdmxcUJJn+AvuzbLOCqAfdGdGUR1kRnA/FCr/YdaOj75WCDn/KmEv19wf6ZUJfqxPFOKg6JlTRiKnqJiw5wlMdfVJ7dhHK9ibgl/XEXVFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657346; c=relaxed/simple;
	bh=WVdWU0fS1mUDSXxvLeOLSoCcooohMfXvQC8sSvZrlKE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X81yRXrIwylH6Ec2Vevff6VLqgRLcNw6KWphNKtjoP1/tXvX2ep1T/mJ+ocZETYRSRoHxZzg9Gf2MTiDNegM7W6+jLbPAqg8axYjnT8MXvJldSK6s0UQv6K5cfZOUAfKRnVd+YG6uZPIDUr15hFtWNBarSyHYATYgEQBpJaKPbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cnqsc/RL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cnqsc/RL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3101F00A3A;
	Tue, 21 Jul 2026 18:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784657344;
	bh=rsWQ4FGYd+ZuS4/k42e+/CB05xWi4uLVW1aD7Qpja3Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Cnqsc/RL4F4q2QzFf/7UI1vzYfWvbh90lrJ0Q5GXMq0+sQbCijqnYSvIgVh1ufGcs
	 0wabztTWFNX8cJLND1p5N5ICENFTx7qpW1rbTKAAxo9jw3sBRPB2+bWl395+1iWwxy
	 7nYeS1MKd53rnz8d7KoOEVDTr4j/28dQ+f0m/mEb8qJMin1vN+qrwsHhNnBo9GeWph
	 P/jc7ierl68Bar5rE7vFQa67loxPVIkmrDtSDsHDdM8/f33pklsJf3KIszh2Yny/7g
	 f0iUIoLsi6LV6PhGX1Jz8z/gsHTJw65u3ZLkmPfR9IWYXSM2M5obl4NGMga/By7qx3
	 5saKo15l8MgKA==
Date: Tue, 21 Jul 2026 11:09:03 -0700
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
Subject: Re: [PATCH net-next v5 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <20260721110903.34840531@kernel.org>
In-Reply-To: <20260708-tcpdm-large-niovs-v5-3-34bf6fac941b@meta.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
	<20260708-tcpdm-large-niovs-v5-3-34bf6fac941b@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 08 Jul 2026 15:55:06 -0700 Bobby Eshleman wrote:
> +@ksft_disruptive
> +def check_rx_large_niov(cfg) -> None:
> +    """Run the devmem RX test with rx-buf-size = 16 KiB."""
> +    run_rx_large_niov(cfg)

Any idea why the devmem tests sprinkle disruptive everywhere?
Disruptive means we take the link down, I don't think this test 
does that.
