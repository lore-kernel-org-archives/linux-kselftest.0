Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776261;
	b=wnBNl+fcm04tYR6es6jp3WiTltDIKj7xdM0JYjdO/9B5Rds46gBByjriPY1jwEAL3FKS
	 /G3ZZxhmFpg2oTHIwwEik2OlbZk5gWzMNBhfc+QFk8z3P2vf7xz2rZoiWPf8imQDR1o1u
	 1ETDQe/YDM0WrrqYwNhBxTDbnPHWehL8h5u57T9dVTdXi/GQJQltO3met3SGD6dDpCMrT
	 ObCS/X9F6iazZi2fYzojbu8WqkYFh9fgrqT760nDOnXMenWgPKbKkHfX8Plm4PubEOmgE
	 83T2yY4AHFxpdOsizvOdicZ6t5MC1JiotnbcOSBPPnd8d0xxgD90UK12ztkdgocdcRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776261;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=C+vbzFKGTlVpkBIKBwPEdUJ4AufpMTAgx2he1ofb6TE=;
	b=DKGIBYUzxqNp4aPpiK2+JmCk1EryAYVBV+oxv8/dEBkoK1nqegDkmvYQU1qFfQxsXCzm
	 mOqwc9D66AT1hNZC2AHbwyBMu9MCu516zf8M+RslK+6Y0oO/O7WioJ06+GQwq+JPLkV5K
	 XZb34NxpWfyzF1vLIiz/t/IljEFsG+c+fhN77xJBX1TDbDZcK9H8+gHf872XfDPepnbmb
	 WxmXSPoR7OJnm7jJMlBfyCO5x74M0AwbGu6EafFigisfON8ZoLT4bkOQNI9EigEuEEqSW
	 zX4kuDmfxYBJHX2HUq57NMXvyyTmqznWSCHc9KeGBBvVUy/zrom9DcYrfpztByKrp0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UeWnKH0N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AB1606A31B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 07:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UeWnKH0N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2061F00919;
	Wed,  4 Nov 2026 07:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776261;
	bh=C+vbzFKGTlVpkBIKBwPEdUJ4AufpMTAgx2he1ofb6TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UeWnKH0NAlErZjgteXpfFKD65QFnELfVSPr7Cvnz4Vng9W4py33DZAbrrhVt4kvPq
	 eNekfLO+s4jM+N+UJuoo2jb1P7Xx22SpOdZnodmRbhn+/fcc/PyaaAjCoZSgHCtDrP
	 7S3ewLV3ZOTmzLB7PyH+1YTuUtd6IZUCHBWp9to210VcnfHMYCMV4XGTb7DxLeGSR5
	 bgSIF6AbKjuWfq5Av9SDHUQBWuptGceLlWV7zwJefuiaRh7R/cSMb1AwQsX2B0/th0
	 SIwjjGztHz4GmZF1PeEiCEjKAfDo2SVGdSrurnGfKObkGOlFe4Ckx6GtDS/imo1ARM
	 YwLcNG0qX7c6w==
Date: Wed, 4 Nov 2026 08:10:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>
Subject: Re: [PATCH] kunit: free the resource when adding it fails
Message-ID: <20261104-rustling-spirited-basilisk-e2fe7c@quoll>
References: <20261104025340.1527390-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104025340.1527390-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:53:40 +0000, Wentao Liang wrote:
> kunit_alloc_resource() and kunit_alloc_and_get_resource() allocate a
> struct kunit_resource before handing it to __kunit_add_resource(). That
> helper returns an error without linking the resource into the test's
> resource list when the user supplied init callback fails, so nobody owns
> the allocation and it is leaked.
> 
> Free the resource on that error path in both helpers. The init callback
> is expected to unwind its own partial state, so only the resource object
> itself needs to be released.
> 
> Fixes: ad69172ec930 ("kunit: Rework kunit_resource allocation policy")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  include/kunit/resource.h | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof




