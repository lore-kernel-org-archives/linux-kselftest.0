Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213D2352027;
	Thu, 17 Sep 2026 01:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789609752; cv=none; b=qr+rzePyfYjn47RzWKM1JWRj+HHWLnjag22HHZxPRG/L4sagi/Ln5b8Oa/psKCXrrinFZLJ+trzleiKwrAh8ZL5sNcCZT4cXWijH+uAIFXPvV4bAPJOKjRX/zKFQ3o7UHo6BcAPnB+t8H82HJHYffCf0lwvd55jb2EdcJNMZxnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789609752; c=relaxed/simple;
	bh=seFp9/4w6+uRbQy/hAlNyYnke7cvYcSqwU0TQARht4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q6chTQxWviB1v1jOxkG6+GKH70/202GkW+iGgvfc3g3wIzT/8JsDjGGMgbGvtLYSfDJUUAf1JJ2usXtennvNoEUQsC5MT/vpM8symPs4870pRAW5e7wQJX7fKEXwjnDs0aM5Sqf2CwdRDvMTSg7Gfvo8ljlRdxL+6q0FW4wLLoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C25jFbQl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C25jFbQl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457631F000FF;
	Thu, 17 Sep 2026 01:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789609750;
	bh=1CSXGcm+PypUwinw5y5vuixv9SgSHgM4HutpfQUzQ4k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=C25jFbQlB3pqiRgOnAwLl6DBOJXkRS1TtDBI+WBeOnz0oApE/HANKnj1n5wn//DD3
	 CQ219NsILHHO2UetIvlD5dlUIZv01pRsyhjuOKnV2MNQGKD8k1J9NQmNO+jpGVb6l8
	 G+xDDpZIPFQVQirJPiREjoSUnr0eaaDYlz+2Cyn/aoJVUeUM8NoVLTb+D32dGF2Wxt
	 3kAm03bBb20+oF6o1gzcaOb7m75xuvSf9ed6rJmh8mt/HBKML2xpfLRVbhw2Ilj8fc
	 JqDL82AQcwFoX18aAb09YTKu/KKIDxOwADi7nTU/oTa/E36qO/qpeCDiwhuN/M+eFl
	 t4WzQ2HCeKJyA==
Date: Wed, 16 Sep 2026 18:49:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Donald Hunter
 <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, Ido Schimmel
 <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, Kuniyuki
 Iwashima <kuniyu@google.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon
 Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/4] rtnetlink: add AF_PACKET multicast
 dumps
Message-ID: <20260916184909.279f5cac@kernel.org>
In-Reply-To: <20260914014539.5015-3-sigefriedhyy@gmail.com>
References: <20260914014539.5015-1-sigefriedhyy@gmail.com>
	<20260914014539.5015-3-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 10:45:37 +0900 Yuyang Huang wrote:
>  net/core/rtnetlink.c         | 174 +++++++++++++++++++++++++++++++++++
>  2 files changed, 175 insertions(+)

I don't think we need another 200 LoC in rtnetlink.c ?
Especially if we make a precedent for AF_PACKET and someone decides 
to even add more code later.
The AI report about consistency check is probably good to act on as
well?
