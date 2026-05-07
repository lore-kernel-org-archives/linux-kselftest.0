Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E839D6D4;
	Thu,  7 May 2026 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167292; cv=none; b=iSWbQnX1hGj/u4L+GWXDhaYJBvDN3+V8HhahT+nj+GISYAS8bvfpb7H8CyyM7m68GO9KxRqUEbFM14qV4COUrBzJ8VL8Cqyutk2OJCisb22W73gs6p1Goae43h2k7V7H3iVAHkABgzdEsiBv1hg52Q45vW/o1bc0Q7naDITuLtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167292; c=relaxed/simple;
	bh=tgQiX65MaDTd0e0pppV5eTZfP9m73Ez7zUWY/PyEnyQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=W6E/WIlBDj1IDnY8GFjWVJA5ky/UE42lD/opFCZasEDQLyeiPmkA3VwyZ74ZHQNY3DyTU9A3TtNKKGicNVClZ9AU9TAqXj4DbWSyKhmGhPjZlSus6CyDIy/nTYp3tmuF4LCnF89Z2AjTiD1vtl5nMg9lR8TX5hiAhBj+mtWfons=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LYKwtqFg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LYKwtqFg"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 586124108F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778167284; bh=DEzm1tZe4DktoqZvyeXcW1Sgc7YEkjL6yYSQZXCykhg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LYKwtqFgf566PtxHtp2WVCo/srD52ANWYiOoQAh2eAnn+lLwAljR5LenO6ZNeUHPZ
	 U/OOspwmkY0mXc+9DPQ2Kikfn1fX9yyqidl5Q9y8CoCn7pi5UNvhLBaqhA4DYAI7oB
	 S7yCCO9CXGBnvGRVQ+bRl1+Vfl9Ic19ZS4/2UvvSvnAtpcNlTe1JJQHJxR0CHrtLFj
	 po/EQ8WnKz3Z2VuZayB4yFoRmisExpyrQJcExSuDgT6Fwas27YSSQDps6Ju3kYjV0m
	 YPoGwR1Crqz8fJsqQw46PmpwjA6lO45J5O+/NP0bcNFmAp5zePqAFSHY2v9UGzIyAU
	 qGR4ZOpMNc7aQ==
Received: from localhost (unknown [205.220.129.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 586124108F;
	Thu,  7 May 2026 15:21:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sasha Levin <sashal@kernel.org>, akpm@linux-foundation.org
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 gregkh@linuxfoundation.org, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
In-Reply-To: <20260507070547.2268452-1-sashal@kernel.org>
References: <20260507070547.2268452-1-sashal@kernel.org>
Date: Thu, 07 May 2026 09:21:15 -0600
Message-ID: <87v7cz8cus.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sasha Levin <sashal@kernel.org> writes:

> When a (security) issue goes public, fleets stay exposed until a patched kernel
> is built, distributed, and rebooted into.
>
> For many such issues the simplest mitigation is to stop calling the buggy
> function. Killswitch provides that. An admin writes:
>
>     echo "engage af_alg_sendmsg -1" \
>         > /sys/kernel/security/killswitch/control
>
> After this, af_alg_sendmsg() returns -EPERM on every call without
> running its body. The mitigation takes effect immediately, and is dropped on
> the next reboot.

A quick look suggests that you're not checking lockdown status.  I don't
doubt for a second that this thing could be used to bypass lockdown - by
shorting out security_locked_down() if nothing else.  I'm guessing that
might not prove entirely popular.

jon
