Received: from cygnus.enyo.de (cygnus.enyo.de [79.140.189.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5AD1E49F;
	Sat,  9 May 2026 12:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.140.189.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778330152; cv=none; b=ug/V3p/S76Lk8S0lCc1EuYehGuoWKetiB5qz9NZFF6MpPc9iaFZaN6qEtVuGUgF8+/32NGhbwT2A8ZEE+tI4MG9X2Ab+ZQTc7R/HRALiyr4N084sHahL5nS4vemQQ7LUsd1/qRaOMZFJDtw2525ddh71kSTH8MyagNnRajcuVqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778330152; c=relaxed/simple;
	bh=dA8qeLx7sAMr3sfR0A9AuZoQc5FZDHMi9PENj+xCDtw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ecGlmuCp5wPjTBHmcFm0sdnDeqUIOw8ybfEuF8ugR0hR3Scj1lGlRDTsdvbequTu8esKpm4tUJr32HPguMpe8Uy7bVSGC4SFTqrWk8kF8jNoil8fmS4XdvpO5FrRngzHffehT0KKYWUHHaw5ONHKdJCHzyn0sekIYT7LHrUEC8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deneb.enyo.de; spf=pass smtp.mailfrom=deneb.enyo.de; arc=none smtp.client-ip=79.140.189.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deneb.enyo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deneb.enyo.de
Received: from [172.17.203.2] (port=48887 helo=deneb.enyo.de)
	by albireo.enyo.de ([172.17.140.2]) with esmtps (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	id 1wLgO0-0000000060f-3vFM;
	Sat, 09 May 2026 12:02:24 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.98.2)
	(envelope-from <fw@deneb.enyo.de>)
	id 1wLgO0-00000000KvJ-37ts;
	Sat, 09 May 2026 14:02:24 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net,  akpm@linux-foundation.org,  skhan@linuxfoundation.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] killswitch: add per-function short-circuit
 mitigation primitive
In-Reply-To: <20260508195749.1885522-1-sashal@kernel.org> (Sasha Levin's
	message of "Fri, 8 May 2026 15:57:48 -0400")
References: <20260508195749.1885522-1-sashal@kernel.org>
Date: Sat, 09 May 2026 14:02:24 +0200
Message-ID: <87ecjku6y7.fsf@mid.deneb.enyo.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

* Sasha Levin:

> When a kernel (security) issue goes public, fleets stay exposed until a patched
> kernel is built, distributed, and rebooted into.
>
> For many such issues the simplest mitigation is to stop calling the buggy
> function. Killswitch provides that. An admin writes:
>
>     echo "engage af_alg_sendmsg -1" \
>         > /sys/kernel/security/killswitch/control
>
> After this, af_alg_sendmsg() returns -EPERM on every call without
> running its body. The mitigation takes effect immediately, and is dropped on
> the next reboot -- by which point a patched kernel is hopefully in place.

Do you expect this to be safe to enable in kernel lockdown mode (i.e.,
with typical Secure Boot configurations in distributions)?
