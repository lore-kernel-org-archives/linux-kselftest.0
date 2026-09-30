Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F0D3B71D1;
	Wed, 30 Sep 2026 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759876; cv=none; b=pKsYMSYvYbUQv0uC9NScGWU/2iLT19naH8paepgKp9Sst6+iG9AfR0zZnabCoYKNgxWg1z7BgRteTh9QMdYHDq+P49dCwtIIqcsTAUPuSEaAvGEHWHlBrIa+dlkwvn5egwG4AUcfkvK6imnziJ1spZS0wyjXt7e2qgkt9AYomc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759876; c=relaxed/simple;
	bh=ftbkTwrG9CVQyXvF/1PpXRiixtFQvE4ouNvv6aSVwXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ux9nZB/kTPjZ70ngwvpZ9poKif9YRAXyEccN/iz7dLEduUy+9Km/nm3bF6eWxKO+uguw45MLP1uX+1NCW86frpfZfSKC4zGoa9Y/j16cyHNnm2W8FZ+VzDN7VssGMQzjmBYxxiQtuGT2C/cRXz3VSZlqgzuNOL3oHvQQuV1o/pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UauxHsxm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UauxHsxm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B151F000FF;
	Wed, 30 Sep 2026 09:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790759875;
	bh=Q1A+WlULujwTkG6nahgS6pUXERQ7Qa2I13iMuWs4TUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UauxHsxmJYoEhmXuIJJ/UPFeXejYxaiQKZPO7NyNDw8gm9kLo127Hkg6o/OuzYpak
	 neThc3i4svWHBeRIH+8LFrKnMz6R8dnr/d2qT3JvphBBimg4og/E96u78huJKXROKA
	 r7RLUXzeC5+a53CwSpr1klK6yaS9QJn0ib0rWiordGcQSAzioHQSCpVrqdA6yOr++L
	 RTeL41++Yywva4yIrj09NdzHIhH4TVag8EYtKFjD+ti37gHNU7RQIBm9Aq0/0s4gkp
	 qyE5TiqZaToB/wSCoy0IQ7RPqS7Hi3DFEnCIOrBBO3R7y+79tn66UGmQ60a1IZgQd3
	 4iKrX3a57sFnw==
Date: Wed, 30 Sep 2026 10:17:47 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: linux-mm@kvack.org, liam@infradead.org, rbm@suse.com, 
	akpm@linux-foundation.org, luto@amacapital.net, brendan.jackman@linux.dev, david@kernel.org, 
	liuhangbin@gmail.com, corbet@lwn.net, kees@kernel.org, broonie@kernel.org, 
	mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, surenb@google.com, 
	vbabka@kernel.org, wad@chromium.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, geert@linux-m68k.org, 
	daniel@thingy.jp
Subject: Re: [PATCH v4 1/2] selftests: run tests on nommu architecture
Message-ID: <arzTBqww5_1MH0B7@gremlin>
References: <20260929235711.2287931-1-thehajime@gmail.com>
 <20260929235711.2287931-2-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929235711.2287931-2-thehajime@gmail.com>

On Wed, Sep 30, 2026 at 08:57:10AM +0900, Hajime Tazaki wrote:
> Architectures lacking MMU don't support fork(2) syscall and only
> vfork(2) is available with limitations.  Thus, we cannot run kselftest
> on nommu architecture as is.
>
> This commit addresses this issue with the following changes:
>
> - on test run stage, avoid calling timeout command when NOMMU=1 variable
>   added to environmental variable, since timeout command uses fork
>   syscall which nommu platform doesn't support.
> - describe the difference of nommu tests in the document.
>
> So command line to build/execute tests for nommu should be like below:
>
>  $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=nommu
>  $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=nommu
>  $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p \
>    -c nommu
>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Andy Lutomirski <luto@amacapital.net>
> Cc: Will Drewry <wad@chromium.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Brendan Jackman <brendan.jackman@linux.dev>
> Cc: Hangbin Liu <liuhangbin@gmail.com>
> Cc: "Ricardo B. Marliere" <rbm@suse.com>
> Cc: linux-kselftest@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-mm@kvack.org
> Cc: linux-doc@vger.kernel.org

Not sure we need all the Cc's explicitly :) Andrew adds them in (I'm actually
not sure in general if they're really all that useful, some of my series sent to
hoards of people due to touching multiple bits scroll off the screen :P)

> Closes: https://sashiko.dev/#/patchset/20260813063401.1786548-1-thehajime%40gmail.com
> Signed-off-by: Hajime Tazaki <thehajime@gmail.com>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

--
Cheers, Lorenzo
