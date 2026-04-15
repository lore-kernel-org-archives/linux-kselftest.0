Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4B73148D9;
	Wed, 15 Apr 2026 16:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776269883; cv=none; b=OvIMGa2IbLosK00XVzPAo6zaY4FHeHzJU5jg207jMR//1VPqCvDrctEGuKT57yNpY/IwwcO6I26PsYS/SGgek8accv/BDkSDE1ogKBdWs7A9nS+iouAeyx3BX9phnXxu2lWRGrHADDri4QmHhU1skod6yXt00EtavrIa+1mol+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776269883; c=relaxed/simple;
	bh=3ws53r2J96HXdLAnlDw3rb6ZAdNe2W1UZpcLfLVfWyc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LU4SqLxFquJm2WYzFYtrmmkioW1XJNrT38grq8XAgm66HimVIlTKSrwm0SbmPMUW6c9uj1RLVP8lB8whl6TlBUdMfRheSU/Mjr/p9L5kfTDteWYEqSor1Uy6dbIqdwIPYMtdMBpf1niIHayKVUHWFVNWm31sqcbD0BeGp6AUkqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEzJjJUv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEzJjJUv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43ED4C19424;
	Wed, 15 Apr 2026 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776269883;
	bh=3ws53r2J96HXdLAnlDw3rb6ZAdNe2W1UZpcLfLVfWyc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WEzJjJUv8ocSJdZlMKQN/SjLu9Yvg9S1dTvODRgMVQdzMyOfLlTPrZtatCaFKC7+M
	 qrAQn5aqvUXwk2xtpaFrYE6IrGswDH4IJIxdTZWIElncDoWmpMI6OiY/nq3FNPbfOQ
	 FOfrXh5oFCmWAwBt81cAGdAJ7dzzTMlLXOc1kE4tXue10Oav8IbyHPujPWH7nTFITx
	 2QbYaux7nIxLgwLQ2cITZm7/jQNhJXYD9ijhRnez+qb7idwKgSSBjQI/p6r0/tMt3s
	 aaSts8510r4XFx2fqMiDY4go6XyWY9YkBkWxotWsXOAEVT/Vz7BZ/IGfrcwbjoH23C
	 bF2AL1HPeM+4g==
Date: Wed, 15 Apr 2026 09:18:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, netdev@vger.kernel.org,
 willemdebruijn.kernel@gmail.com, davem@davemloft.net, dsahern@kernel.org,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH net-next 2/2] selftests: net: add FOU multicast
 encapsulation resubmit test
Message-ID: <20260415091800.4ee4d744@kernel.org>
In-Reply-To: <ad9hkJXAnlv2ZUm6@gmail.com>
References: <ad7MsSJOuUU6EGwS@dau-home-pc>
	<ad7NhoxmrFJAsXe7@dau-home-pc>
	<ad9hkJXAnlv2ZUm6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Apr 2026 03:25:59 -0700 Breno Leitao wrote:
> On Wed, Apr 15, 2026 at 02:28:06AM +0300, Anton Danilov wrote:
> > +send_fou_gre_packets() {
> > +	local count=$1
> > +
> > +	ip netns exec "$NSENDER" python3 -c "  
> 
> Having Python code embedded directly in the shell function makes this
> difficult to review and maintain. Could you extract the Python script to
> a separate file? This would simplify the code to just:
> 
> 	ip netns exec "$NSENDER" python3 my_python_script.py

Or just rewrite the whole thing in Python (no preference)
