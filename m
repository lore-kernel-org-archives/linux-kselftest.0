Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9E83D301E;
	Mon, 11 May 2026 15:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514943; cv=none; b=d7xUpHcaBJPe9g2mNckwa+AsMM0TGFKA9LSqefEa5IqoY64iflbx961B+TZVULLY69kRijVjbCSlbbVslmBrNhh4iYJeEUzyi9pXFTdhf8s4dp+/uHO4XceyGLb9JKs80CQ6gsSd1y7ocCGNEoIZ5ABPns9CH4dravhz8me/B/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514943; c=relaxed/simple;
	bh=DBzhcWS+YV3R7DJRnFQWCIy8FCSnzFmUp88NIfkuR8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dE9KOYc1imsYQwKWc5MNWMFUhuGoyAbk5G0IwfsOf3yAqYvsqcZn2EjsuPvqu5AyQwYtHsUiGWo7S96ZD0J8PfxsE7BlizyjpbZOZa7J7/5bYyyadtmgCwS5tNbZeXdkWBhJrceeP81EhfMYnAhSDj36Mg8WlRYG6X+4wgngvSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSlj7wfN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSlj7wfN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5069EC2BCB0;
	Mon, 11 May 2026 15:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778514943;
	bh=DBzhcWS+YV3R7DJRnFQWCIy8FCSnzFmUp88NIfkuR8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GSlj7wfNIHegFlWmRXA4HnCJzWdcrd64G74J7FB9sH1DqIsGuoxgIUZRiOBUjuE7b
	 7bpRiT82Cv9UT6CmP71TfHN49XIs3uZDOf64uImjIkR2VPRRjp2yDuZ7OwE0C7ObKJ
	 EUW0CAwzrL27Z9QAQeN54PZlWVTbYLaflozEUKR9f85wWx/i+ARJ264vxy1ElhD8NZ
	 xOzRRTsTTBJkqpTJmU1C6Bt+1KDQVlUyytBpNYISLG2q1r9kaXCnNINNQllCwXXj+E
	 cRUmyuKtRQcHN6Qgh4RIqGA+IbaGvn6HMku1RSyyY4z3f4fvwl1ibolbHWpUCl0DOZ
	 5oDGCFpI5rJZw==
Date: Mon, 11 May 2026 11:55:41 -0400
From: Sasha Levin <sashal@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Breno Leitao <leitao@debian.org>,
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agH7_QBPLWKTZucB@laps>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
 <af5Z2IvtS5pVorSl@laps>
 <agG_PZ3qcl6TwLnL@gmail.com>
 <agHUp8ulaWJ75WU5@tiehlicka>
 <agHcFCRVSn5ra5Kc@laps>
 <agHeZPA3eHhJHIsQ@tiehlicka>
 <agHgDgwu8H9Opzpl@laps>
 <agHm9Vj7bPPCRS1g@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agHm9Vj7bPPCRS1g@tiehlicka>

On Mon, May 11, 2026 at 04:25:57PM +0200, Michal Hocko wrote:
>On Mon 11-05-26 09:56:30, Sasha Levin wrote:
>> On Mon, May 11, 2026 at 03:49:24PM +0200, Michal Hocko wrote:
>> > On Mon 11-05-26 09:39:32, Sasha Levin wrote:
>> > > On Mon, May 11, 2026 at 03:07:51PM +0200, Michal Hocko wrote:
>> > > > On Mon 11-05-26 04:41:38, Breno Leitao wrote:
>> > > > > On Fri, May 08, 2026 at 05:47:04PM -0400, Sasha Levin wrote:
>> > > > > > On Fri, May 08, 2026 at 01:56:30PM -0700, Andrew Morton wrote:
>> > > > > > > On Thu,  7 May 2026 03:05:45 -0400 Sasha Levin <sashal@kernel.org> wrote:
>> > > > > > >
>> > > > > > > > When a (security) issue goes public, fleets stay exposed until a patched kernel
>> > > > > > > > is built, distributed, and rebooted into.
>> > > > > > > >
>> > > > > > > > For many such issues the simplest mitigation is to stop calling the buggy
>> > > > > > > > function. Killswitch provides that. An admin writes:
>> > > > > > > >
>> > > > > > > >     echo "engage af_alg_sendmsg -1" \
>> > > > > > > >         > /sys/kernel/security/killswitch/control
>> > > > > > >
>> > > > > > > It certainly sounds useful, but what would I know.  How do we hunt down
>> > > > > > > suitable operations people (aka "target audience") to find out how
>> > > > > > > useful this is to them?
>> > > > > >
>> > > > > > I'm not entierly sure here... If folks have suggestions on folks to loop in,
>> > > > > > that'll be great!
>> > > > >
>> > > > > I work with these issues at Meta, and this approach would address a real
>> > > > > need we have.
>> > >
>> > > Thanks for the feedback!
>> > >
>> > > > > While livepatch could theoretically solve this problem, it's less suited
>> > > > > for rapid mitigation for a couple of reasons:
>> > > > >
>> > > > > 1) Livepatch rollout is inherently slower due to the blast radius if a
>> > > > >    bug exists in the livepatch mechanism itself.
>> > > > >
>> > > > > 2) It's common to run hundreds of different kernel versions across a
>> > > > >    fleet. Since livepatch is kernel-specific, a single CVE suddenly
>> > > > >    requires building and deploying hundreds of individual livepatches—
>> > > > >    far less practical than a simple sysfs write.
>> > > >
>> > > > LP is certainly a more laborous solution. I guess this is quite clear.
>> > > > It is also much safer option as it deals with all implementation details
>> > > > like consistency. All that is not done for fun. I am really wondering
>> > > > how admins are expected to a) know which kernel functions are ok/safe to
>> > > > disable and b) when it is safe to do so without introducing unsafe
>> > > > kernel state or introduce an outright bug that way.
>> > >
>> > > In a similar way to how they would know if a given livepatch is safe to apply -
>> > > ideally it would be communicated by the vendor/distro/kernel team.
>> >
>> > You have missed my point. KLP takes an extra steps to make sure patching
>> > a particular function is safe to modify or to put the change into the
>> > effect.
>>
>> Safety checks like making sure the patched function is on the stack, or did you
>> mean something else?
>
>Yes, exactly what LP infrastructure already provides.

But do we actually need it here?

For threads already inside the body when killswitch is engaged: they just keep
executing the body to completion.

For threads at entry after the kprobe arms: pre-handler fires, they exit with
the override retval, never enter the body.

For threads arriving while the kprobe is being armed: kprobes-on-ftrace uses
ftrace's text_poke for atomic arm, so there's no "half-armed" window.

>> > > "On Debian XX.YY, use the following command to mitigate CVE-AAAA-BBBB:
>> > >
>> > >  echo "engage woops -1" > /sys/kernel/security/killswitch/control"
>> > >
>> > > > Thiking about this I can see how waiting for an official LP can be time
>> > > > consuming and sometimes creating those is far from trivial. But would it
>> > > > make sense to have automated LP creation tooling available that would
>> > > > allow to return early from a function and relly on the existing
>> > > > infrastructure to do the right thing?
>> > >
>> > > This would definitely help (and in light of how the last couple of weeks played
>> > > out, the case for livepatches definitely increased), but not all
>> > > vendors/distros provide livepatches.
>> >
>> > The point I've tried to make is that you (as an admin) shouldn't depend
>> > on your vendor to provide you with an official LP just to disable a
>> > certain function(ality). That is/should be a trivial case where the LP
>> > should be ideally generated automagically if you have a tooling
>> > available. I might be wrong and overlook some complexity here.
>>
>> Module signing is what stops that approach for me.
>
>OK, so the actual constrain here is that you cannot load your own
>modules. That was not really clear from your description. I assume you
>cannot enroll your own key and sign?

It's one of them, yes. I don't want to build my own kernel (and assume that
most distro users don't build their own kernel), so I can't enroll my own keys.

Outside of that, you would still need to have a patch-per-version (or at least,
per group of versions where the patch applies without conflicts).

-- 
Thanks,
Sasha
