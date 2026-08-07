Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2825223D2B1;
	Fri,  7 Aug 2026 21:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786139687; cv=none; b=CCFNltJvBRWlDoLSJrF8b1DysQ5D2oDAQZRG8CzzZl6LUnV7KQ/1IojItl1KYxc0Y71NH6feD7yCqF8CfY+KCinn7KJUyJbRu4xyimM2iNOsTlYuVSfEcSE4YmqLLhZbbtsQdvDREzkt3QQCzj4TBaKYySRkj6KAtEs8gKGXi8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786139687; c=relaxed/simple;
	bh=CW/D3A6feVoiXMrUsW5YxojFXidwi3nLhrCTQV+ctzI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gWifDQJ7q+cVACiNZSkQmpZFQqqBBsEG3Gfe6BYxXHxzC0u6o2mQynkGRiLqidWpENbuWA0L3PlVqjw8mclxwhcBfy4mU2/qzJ3AoYk292KnMt24CX+7kp5M9JDspfB3s0WB948M+f7jp1A4xMcrPTcodAXt96WtfsGUL7bKZG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWa1jOCi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWa1jOCi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3CC1F000E9;
	Fri,  7 Aug 2026 21:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786139685;
	bh=+4zVICWMmrDS2+Wmays7GbkkK6qBZHHVjqYyAW3HDyY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VWa1jOCi3lHsECcDjb433/m9l33qrdRgMfAw38ISwU1JaoN5P1S6DyQcDKj2O+Xj4
	 yGHpeQ6pPUeHPypBi8ptkbX1V/W8k6VgL7hZmhzN/hzigddhCKenFWjtlsQEeiLGKn
	 mN+rbqUWcnvbB5PdyrloG3uwqgGu16b11FCYZah6/LI2NoZZQ5n0R7jERztGF/af2A
	 f8KDSoLDFphmq6QtIzO8D/DpiV1O5kwa5LUkC3XQJvPjOteft7RQj11ezBrWni4hmx
	 FKTHg5LB74epQMc15DZg0LQIbbjb6eKFiAoJFe3thPUkjvhR5zM0aB8xbaabfRI7N0
	 5npsVF94OgC/Q==
Date: Fri, 7 Aug 2026 14:54:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: devmem: fix 5-tuple
 flow steering
Message-ID: <20260807145444.6acf9c08@kernel.org>
In-Reply-To: <CAHS8izOU2pxfQH0Wo1DrqajOb54wv3Y1rMryGpwjNnoUsEufew@mail.gmail.com>
References: <20260803181852.491437-1-almasrymina@google.com>
	<20260806121631.13175f7e@kernel.org>
	<CAHS8izP=mgsdxv3AtjJo9JY5OHC17zeX-VbPPH_gFF=Ndb_qjw@mail.gmail.com>
	<20260806133435.38c34e31@kernel.org>
	<CAHS8izOU2pxfQH0Wo1DrqajOb54wv3Y1rMryGpwjNnoUsEufew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 6 Aug 2026 13:59:53 -0700 Mina Almasry wrote:
> Do you mean forking all the test cases so that we have
> check_rx_3_tuple and check_rx_5_tuple, etc? Won't that be annoying in
> the future if every test case needs to be duplicated twice? And
> potentially again if there is another deviation in driver config
> support specifics?

No no, I just meant a trivial test that installs the rule and maybe
sends a packet to check via getsockopt(NAPI_ID) that it arrived on 
the right queue.

You can probably extend ntuple.py instead. I was thinking yesterday
that it's nice to have all zcrx stuff in one place. But in reality
we already have a bunch of scripts testing zcrx so ntuple.py is
probably better.
