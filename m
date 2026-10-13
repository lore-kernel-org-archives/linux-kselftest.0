Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105BC36F8E6;
	Tue, 13 Oct 2026 00:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791851356; cv=none; b=LOA06xuZGz8cnTLtYkGBKj5SqOb6x/8zqrdaoM5DVbnasKIAXQ3plhpqndLg0fwv07zCJ8wT8+7s3nwRz7FToxxvV2dtCsRd9Lfa5WJ4FUdiqeSF4P1WgPqvt7HlSqZpWtKpOQmxf18cr3P5gQt0OK1DxmGSOxpvxZOIAO6lQNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791851356; c=relaxed/simple;
	bh=x8GQ9TqAFu5driuvo38kqzYt3n324pebOlaNmEELI+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fyge7oU1bu63scjyGjkMRAm/sTFQRsWNpAlIHOiaD5qlqKiSd71Di9rmfY9a0gEtq3yag7wiv4RxltyKBHuINsGgUL/f12hTJ/xx3O+tt2y8X3Ior3ezaxpTSkEyDTBFi4b7T5zZSxwY7LpRnO5Ch910bQ+ogu+CJAgh3PClTmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxhSsIhO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxhSsIhO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16991F008A1;
	Tue, 13 Oct 2026 00:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791851354;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WxhSsIhOLwN1HJdeLm2enKnmDsoyJ947TnzLEGGY29du3fi4RmIxWy/Ks85FoknCC
	 HNg7A/VJ9u9v0uhVUmMSeNeMajXg5ihSWegA7pppTGKDU6VkGAyxtrnlS6bb0U2feP
	 lznW9Dr68gGDFlxO9o5swtL0KP9iSpnd8KunmfMOP53XeWbS0W1R6QKudiRMIGsxJo
	 kG0FK/XHBjEAq/6O1S8+8Fygl6jrbVKHz18ys++1eDhZsQRE31GP7qletZ2WK2+b6r
	 s+J/fjihHI//8yFKqVGQYVHhi18Ssxu8nlDYR16CqHGrRh/oo33bCbj/TJ+fwoQLnY
	 cSeSbTYVz/jZA==
From: netdev-bot+sinfo@kernel.org
To: Rishikesh Jethwani <rjethwani@purestorage.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 John Fastabend <john.fastabend@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] tls: refuse RX records after record-number exhaustion
Date: Tue, 13 Oct 2026 00:29:13 +0000
Message-ID: <179185135345.2527009.11260948821652033775@kernel.org>
In-Reply-To: <20261013002701.1957686-1-rjethwani@purestorage.com>
References: <20261013002701.1957686-1-rjethwani@purestorage.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
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
