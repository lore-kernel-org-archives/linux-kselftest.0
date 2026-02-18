Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EC5341678;
	Wed, 18 Feb 2026 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771429503; cv=none; b=tk1eNAw2ndBjzSSdps6meYylL2cp1EyvOt2jWjYKX0bd9PAqg0hBlyu0t4u8YocHTZytiR2BnnG8SYmtUG4nXt3Yott2lkFOSTQczSYqtkBFEqpDfcuwkOyJREG1fhlgI3wJ/r7R/pRBVceVWLNsbHmJ1pkG3oXN2+kTH6hRhZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771429503; c=relaxed/simple;
	bh=HVEgd0ELpvlA3DqcQDwhdVRz5K9yA2T49thN+12lITg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lFgLvjP5E2zY8YBXgIrNPCe07yHJ1WOcf/R7aJxf6sFrWMZZaYftgr6F7jKNeaHwpiOOerL/es3MjyXSlmcrtcceftoiCMwFluAO+ylf0StTtZWIMnCL7Izpy0g9yO3XVNZSFqO/s2ysgiqWwvOW+phIpoQqdlaNKeHXAlj8Zf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dj4+oAJC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dj4+oAJC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAE4C116D0;
	Wed, 18 Feb 2026 15:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771429503;
	bh=HVEgd0ELpvlA3DqcQDwhdVRz5K9yA2T49thN+12lITg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dj4+oAJCcqW6Kh/O48Xkzim6NrmsuX7V706hJp9GQCg3P9NwgYtlSE0RzLnBx/4e1
	 vwsTEWp7jR5hn/+GpLSDCR4/G51Y0F0tIwQb2jz/+uLWSdDe9fg1WORewylRmsMtDF
	 Yy+/C4ExwYZ1g53krQd6dAevJ6szikJl9MldAfPayxhAqEu5g4I8Mg0H50tb3wNJN7
	 J3mSODWYd6UcBjHJmlv0Ccxf2gveds1jeo7coYxvekWYRxPazHOqTLqbrcTMIZAxgU
	 60uPid/q24tH7Jkw3xD9uuUFm0UOP3UvSqcl83pZl+oJhVBnRU8TUDj7TkKDqD9Dqn
	 o/V6dFulKc2kw==
Date: Wed, 18 Feb 2026 07:45:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Tariq Toukan <ttoukan.linux@gmail.com>
Cc: Yael Chemla <ychemla@nvidia.com>, davem@davemloft.net,
 netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, Willem de Bruijn
 <willemb@google.com>, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 Tariq Toukan <tariqt@nvidia.com>, Gal Pressman <gal@nvidia.com>,
 noren@nvidia.com
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: rss: validate min
 RSS table size
Message-ID: <20260218074501.7245718b@kernel.org>
In-Reply-To: <d56f8f9a-7377-4892-8b29-d5be53eed08e@gmail.com>
References: <20260131225454.1225151-1-kuba@kernel.org>
	<9f535014-80eb-4f57-b047-3638579bde9a@nvidia.com>
	<20260211134319.39710c1d@kernel.org>
	<dbbe9690-996f-4a63-90a0-baec52c27236@gmail.com>
	<20260212172215.0a3295a0@kernel.org>
	<ba1885cc-57e7-488b-946b-d08c1644dcaa@gmail.com>
	<20260217135727.292acc4e@kernel.org>
	<d56f8f9a-7377-4892-8b29-d5be53eed08e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Feb 2026 10:02:01 +0200 Tariq Toukan wrote:
> > The minimum
> >    SHOULD be at least 4 times the number of supported receive queues.
> > 
> > so I guess the 4x isn't exactly a new recommendation.  
> 
> My position is as follows:
> Provide the appropriate factor *if possible* (currently it is 2x, and we 
> will likely increase it to 4x).
> However, do not limit the maximum nch if the factor cannot be satisfied 
> - even if that results in the selftest failing.

Yes, that's definitely fair. We can adjust the comment in the test
to make that clear. The user may want to use the queues in a different
RSS context / zero-copy so limiting queue count would be the wrong
direction. The test, is only signaling practicality of using all queues
in the main context.
