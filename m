Received: from mta0.migadu.com (out-119.mta0.migadu.com [91.218.175.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B2C388E7A
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 06:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245904; cv=none; b=AjXt84X9ar4ip/Qn2bTM7MWOArBM5hsBSziU7QyZ0IYYAtrP60UO+21qCYtgCcBBdKTeSbWq/R8hdUPqbGVeayUkCUghgk9KEWW7iGBavsf+sr0Z4h74BRpDSL2NjkfWiH5RZZPnifsx8zL10xSCABGyuz9EDJ1EDKFSavdgtPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245904; c=relaxed/simple;
	bh=amvD2KT70UCxTU5QR/Qs4sT4tQAd0JRZ8JFIGs2eMxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPPYJ+wbqUMJHmAVjTBKxalkNldXEpCYFxcfgIc0LGBsfzFg63hiupxz/Jnx3Ryw1JwzilFpwfgp0BYdmzuhGrvb1R+H/CeM7vLrq2QoY0EMBDz9Wb9J5Kdg+SmgCdx5PO6y0qUgbZMfSXe4rEV3saFjxBUCbor2lVIxY5pHth4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QBAqgrEn; arc=none smtp.client-ip=91.218.175.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QBAqgrEn"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=amvD2KT70UCxTU5QR/Qs4sT4tQAd0JRZ8JFIGs2eMxI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788245897; v=1; x=1788850697;
 b=QBAqgrEnEjvGiQFLRtx86vbu83paGoa/ikXEyP86VS/slfx2tRaIm+Fbg0XC5mvF0czn/72U
 jfXC8FOqdWE6jNSjgCrl7Qtw2OSjdC6iMKm6XMjnCCpDf0NX1zExiorbXhuggraEVSKI8CAwnPk
 cy/IqRXddza6H8alQ1F7gg+U=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a00feb9a4dbcf499;
	Tue, 01 Sep 2026 06:58:17 +0000
X-Mizu-Trace-ID: a00feb9a4dbcf499
X-Migadu-Flow: FLOW_OUT
Date: Tue, 1 Sep 2026 14:58:07 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 1/2] netdevsim: add link speed support
Message-ID: <apZ3f3vm5sUrcyrZ@fedora>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
 <20260831-nsim_speed-v1-1-7a651ee65738@kylinos.cn>
 <20260831150818.660de896@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831150818.660de896@kernel.org>

On Mon, Aug 31, 2026 at 03:08:18PM -0700, Jakub Kicinski wrote:
> On Mon, 31 Aug 2026 11:28:10 +0800 Hangbin Liu wrote:
> > Add ethtool get/set_link_ksettings callbacks to netdevsim so the simulated
> > link speed and duplex can be queried and configured from userspace.
> > 
> > Move NSIM_LINK_SPEED_MAX and NSIM_LINK_SPEED_UNIT from dev.c to netdevsim.h
> > so they are available to both the devlink rate path and the new ethtool
> > code. The set callback rejects speeds exceeding NSIM_LINK_SPEED_MAX.
> > 
> > The default link speed is set to SPEED_5000 with DUPLEX_FULL, matching the
> > existing NSIM_LINK_SPEED_MAX definition.
> 
> This breaks TDC which uses netdevsim for taprio testing.

Sigh, I really didn't expect a speed feature could break the tc qdisc
testing... I will check the reason.

> You posted 2 series for net-next and both broke tests.
> Please try harder to test stuff locally.

Sorry for the extra work this caused you. You know I did not mean for this
to happen.

Every time I prepare a patch, I build it locally, run the relevant selftests,
and get an AI review before posting.

The selftest lib patch touches too many files. The fib_test failed locally
without producing any useful error output: it returns 1, but I cannot spot
the it by human viewing. The netdevsim test failed during tc testing, which
I did not expect at all.

> Matt added support for Docker to NIPA so you should be able
> to repro all ksfts locally. If something doesn't work please 
> report back.

I will give this a try. NIPA could help capture this return‑1 failure.

Regarding the tc‑related failures: do you run the full set of network
selftests for every single patch, or are there rules to select tests based
on the changes? As you know, not all companies have testing resources
comparable to RedHat. I have to run all these tests on my personal laptop.

Thanks
Hangbin
