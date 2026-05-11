Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972C232ED39;
	Mon, 11 May 2026 23:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778540731; cv=none; b=HZyfx6mqg1YdkmoKT0LbL/9eD6i795gunhU1DSDF78nfeqtFnSF8rq4Qzeqv++zZdfrdwNJsx/KkO//GKNDKldcF0u0JUeJ3DRJwLfC2D0GTyIMmMs5pop0vybL5S55iiHd2ePWsWQIevxB7WqjXjORCPiQ0DeIjy8xZEMfuCcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778540731; c=relaxed/simple;
	bh=+l510pdwI65ZDgx4CQXjs9UT5TqtHgZZI0OYYCMKkrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nj/iEtfz7QU9w9jXO6/6xDuj70P2VASgv9wWi11HDp4tgY4DV90X9KerfJinQXTlnDOodNwzELYBiBJ6/fEBACZsQgBFkfH9CWvhV56vbb5iyYXwlkoeMgOiYfQbBuvwdwafxf768nYa3RQWZ+NiMwKjrMWv4hCkFKetTKXNyzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouORcNyp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouORcNyp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CCBC2BCB0;
	Mon, 11 May 2026 23:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778540731;
	bh=+l510pdwI65ZDgx4CQXjs9UT5TqtHgZZI0OYYCMKkrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ouORcNypVstVyxpqipW8XXcIZWcPpHDLCv5XkMYblogIEBgcjqTvbHWIXFMdmuDIN
	 cJHnUeBvvLJgr80O1X5X044ZHCZY8jAntZy9CeeNhp/Zj0YKclxtPeLka003PlzRMe
	 2qUX6UlORlk0dgPXHnFvvd5wQnxd+dBNizBAtlht9HVg7bGhSp4EQ2JJqBJPZe3nal
	 c5YVFCkG1EtjEDzbeNh5cEZWE61qxVl+Rjrbr6eooIiX5X68fh+3kdEuOMNbxAeqRC
	 FBI+wr94iSwPhAXVFvG6Q33wxGrSv+y0zhAngEdtZ8UTyg7dHqNyD8HX70EkhAH/Td
	 c4dC8Cu5oUy3Q==
Date: Mon, 11 May 2026 19:05:29 -0400
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>,
	corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agJguTdMd95_rNGp@laps>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
 <af5Z2IvtS5pVorSl@laps>
 <agG_PZ3qcl6TwLnL@gmail.com>
 <agHUp8ulaWJ75WU5@tiehlicka>
 <20260511153158.bad58633e2c8d247322ebb4b@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511153158.bad58633e2c8d247322ebb4b@linux-foundation.org>

On Mon, May 11, 2026 at 03:31:58PM -0700, Andrew Morton wrote:
>On Mon, 11 May 2026 15:07:51 +0200 Michal Hocko <mhocko@suse.com> wrote:
>
>> > 2) It's common to run hundreds of different kernel versions across a
>> >    fleet. Since livepatch is kernel-specific, a single CVE suddenly
>> >    requires building and deploying hundreds of individual livepatches—
>> >    far less practical than a simple sysfs write.
>>
>> LP is certainly a more laborous solution.
>
><another please-educate-akpm email>
>
>Does a livepatch *have* to be distributed as a ready-to-load kernel
>module?
>
>Is it not possible to distribute a "livepatch" to the fleet as a single
>string?  Send out "make function some_bad_function() return -EINVAL"
>and let scripting on each machine figure out how to locally write,
>build, sign and install such a livepatch?
>
>That would require that each machine locally contains enough data for
>it to be able to build a kernel for the currently-running kernel, and
>that each machine contains a build environment.

So we'll need to have a kernel build env, the sources for the current kernel,
debug info, and some sort of a semantic patch (.cocci?) to make the
transformation. I think we could even script all of that per-distro, yes.

>I *think* this is feasible on distro-based machines?  But perhaps not
>on stripped-down hyperscalar boxen?

Few concerns:

1. Tiny/embedded machines that will have a really hard time building a kernel
either because of storage, CPU power, etc... Consider something like your home
router running OpenWRT.

Actually, this is a good example for a killswitch too I think. I went digging
for issues that would affect OpenWRT routers, and
https://www.cve.org/CVERecord?id=CVE-2024-1086 is a good example: OpenWRT
supports user namespaces to allow containers to run on the router, so any
container could then compromise the router.

There's no way to build kernel modules on the router - no toolchain nor storage.

With killswitch, you could simply do something like:

   echo "engage nft_verdict_init -1" > /sys/kernel/security/killswitch/control

Which, if I understand the code correctly, would disable us from adding any new
netfilter rules, but existing rules would keep working (and on most routers the
rules are fairly static).

2. Having to install a build env is not only wasteful but also not secure. For
example, a certain hyperscaler we both know does not allow compilers on
production machines. It's probably a good practice for regular distro based
machines too.

3. With secure boot a user can't load their own unsigned modules, so the user
will need to spin their own kernel and enroll their keys. Having to turn off
secure boot is a really bad solution too.

4. Nightmare as far as reproducibility goes: think of all the odd
compiler/toolchain/etc combos you'll encounter. No way to track what went
wrong, where, and how.

-- 
Thanks,
Sasha
