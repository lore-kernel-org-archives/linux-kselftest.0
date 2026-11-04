Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822981;
	b=JP3qdXPogBdVwMYCEgVdOy21Ie9JZt5ZKaOmQ0oQSrAc6GqP39PLNRMjSBMA7FgdmAlI
	 hYBf0q87CbHjeTbHvG0yGIi1XKa73h7WPHDNHtUGbgU2JTnlwYnzna8bqpa+sNZ6N2Nt8
	 ZT+OjaHFrZ+G214lDl40vKptcTXOoFD7MZbmm2g734BQtnJSDjhQLUTwlN0rI7DiF5rYH
	 Mil1Mx2hptSGfUz8qtuAMTUSntoHU6MPkVeCb7ilV4Jx9AOHQeZKv2soVMO2vBDOR85cK
	 lx+RvtslvFlLfy8XrzCPmXHoaDaUMBoZwy/+7a7bNSQf95hvSBm+c9F3J0dSxl2Aihw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822981;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	b=P4jHuBp8VyfDTrOvvFBPt9jfpHbkxoAv/NUZz2hCCdQEleh5gC2/6ggMuWkgB+hPwsyD
	 HBVn0Qkj31V8V/ZleTlq/W9s90B8zFyDluzFQAsb+1tcbsbOYdfGgRYUzPz3hOVRI9bjH
	 RJz7mwlxrV6Zc7umEfFM4dSZ9Q8E5uUfzyfI+tDxNly4J3POMEjK9Pl/6qZ8h6O1I9K3o
	 dRIP8W4pgbk7U5/T4s9S8GsVGxutXsQ1dQsmZOqnsPTMClrrnFvlMpfsBFqNKXq5H3j6m
	 unQax4uA1C3kPOaEf3QXEm1aV3TaDQOBBrZrECXaKyu5EP2BYljlkurp0nGdyLkVwPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C2jRx00R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C334606A32F;
	Wed,  4 Nov 2026 20:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C2jRx00R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A171F00A02;
	Wed,  4 Nov 2026 20:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793822980;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C2jRx00RbII0lUfk3++N0e0hAeJEoFhhzZxzEmtTHNofiFMIW+1QUhPRiuhg708nh
	 3gvAililScHrF1pBwr2c+fssZ4KhRWS9eGw2tEtMP5rkBwVl4JBejw3a3HvhRhCwjp
	 QLY2deXdY9O/EHKS1FmKuVcVlSYjUM1/faHHECnOvFmmgt2Lt+y4BIcXcjigqTjNhS
	 OfEKG4/bu0sXWx2bJeNzehusPzovtWGAyC3Oe1Gcn01kfaYN9URO9UNjNaqmksrGaQ
	 yA8dsHNOphm308tUuWPR4rvFkGW80IPbH6Y8zJvj1m1cOMzZaESd0AR4sB2ZQtkQL0
	 o656nW5d32Fqw==
From: netdev-bot+sinfo@kernel.org
To: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, weiwan@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] ipv6: ignore link state in gateway check
Date: Wed, 04 Nov 2026 20:09:39 +0000
Message-ID: <179382297954.488859.3602368021505509802@kernel.org>
In-Reply-To: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
References: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
