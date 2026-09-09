Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F8243E49A;
	Wed,  9 Sep 2026 20:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986297; cv=none; b=FU09kHAZFMBO+gadYM+xawDMxcuZiIJUxR8+S2cIWWsuEZe25Ux4RjFeIqYE2Cf/CB9+64S11hnJsS3fiQURP242wAtbgjjnenAtSYwcNKlLyG4erlPLDpmaCTOv8guN77kXuDXNK+YCgw/YFQE0rnWjUke+T4QpBiyNhytWeMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986297; c=relaxed/simple;
	bh=q9f5h17IVTvnt8Qr9X1jGRCKqomFuzU5hBwtlft3VWI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qkAdZ//X4awnyqBYAXJy33y8QTYczUO7qIh8JJeRoHxioEy/Pv0f76f+Nc6k7O9Eod5Da4bZSeUsn+HB/3cETiz8zKl6jXsa2A8bq5HXkHh124ZXf18Ykds/tDbhAkOCYMjIm9Dsjc6m5bXtSppk9CjcgYnTamkNHkkDWB5MXEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HyGoZ4hX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HyGoZ4hX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3B51F000FF;
	Wed,  9 Sep 2026 20:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788986288;
	bh=2J4UCbtw9hG485C8lPwxB5e+jR7AqMtinQP1e8SLYN4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HyGoZ4hXQv3m6l2xp7EuQpqyd9+IptlT8I7/T0CSdN/47Kw9R4HWYmDV/PX5Bv0HL
	 khBG6gZ121a75cQchCaQLHjUZlE+8c4qIwXtPzktursIpIYHv6avKDrB9AaLPKV/MR
	 thD5Ub6T0YH18mU/ucytoDbynjttYQ0TBhYg6lAcyiFS6p+33WwVBBaywHSvdTSG9Q
	 0g2t3XS7pm+b5Lo54IkwKt3Expl9xnbu0fbcnsILbFZmEvsINR5moBp2sOsH1wJRsZ
	 lfj0GCTrgKUUGA73t9Z006MrvNmVcnYygRooR6KmNhWagOW9dwNd/LMVrJKS18rZ1b
	 frhuwOHZJQTaw==
Date: Wed, 9 Sep 2026 13:38:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrei Gherzan <andrei.gherzan@canonical.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Kleber Sacilotto de Souza
 <kleber.souza@canonical.com>, Hangbin Liu <liuhangbin@gmail.com>
Subject: Re: [PATCH net 0/2] netdevsim: fix IPsec debugfs byte order
Message-ID: <20260909133807.299bfc5c@kernel.org>
In-Reply-To: <aqFhJbNp5qqlehD0@sprawlopolis>
References: <20260908140325.13367-1-andrei.gherzan@canonical.com>
	<aqFhJbNp5qqlehD0@sprawlopolis>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Sep 2026 14:37:41 +0100 Andrei Gherzan wrote:
> I forgot to add Cc: stable@vger.kernel.org to these patches. 

We don't generally send documentation and test fixes to stable in netdev
Especially now that stable is busy enough with all the AI-found bugs
In fact I'm stripping the Fixes tags, too.

> Should I send a v2 for that, given patch 2/2 only makes sense
> together with patch 1/2 (applying just one regresses the test on one
> endianness or the other)?

No need.

Thanks for the changes!
