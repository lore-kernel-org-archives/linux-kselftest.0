Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FD82F0C45;
	Mon, 11 May 2026 13:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506775; cv=none; b=QDtMeCjxALdqa47cnuU9draF+fieRPNF7iIUuDvqDsez8XOzj9rrWMQ+OGH4/3xjliU55xPtIVDVTnb6nF2lBwmVK+Gpl/hlvYO/f20Cn4xOd3PO1TLueveHoHOzOdU4FcInp02jdgV3viLpzRF6X2C6gpeUFFBZOQduRdHaI00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506775; c=relaxed/simple;
	bh=0YDoda5xBJ99O7ber1zwH7VzziHTUhV7z6JtjcjZ4ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irvDgV5qT807VKG2Y7cXZSmXEJoFTtoA5YMYBNrQY62Nn3NWQxtnbdLTrBJSxVyy0Wde52Nh0BbYTLhWdSqt5qQ/zCXiK6rroT9BdCa849ntRFn7/w1KqFCmj3jwZo/KsuP5QbouZ1TW1Mtr8dIfTuKzbCqOEh9faOkE29XaMvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOR2xEr4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOR2xEr4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805CFC2BCB0;
	Mon, 11 May 2026 13:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778506774;
	bh=0YDoda5xBJ99O7ber1zwH7VzziHTUhV7z6JtjcjZ4ZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOR2xEr4xLIIIdBMqP0Nm7ImHunIMTowtUqxVkgZYReNzNXns70gavsHE/jG9MkO+
	 2TZJKd1N7Sd9GEBXrhyXcWbpq4dMNaKfx+6Nqr+yq6vZt2sVMXYnl4NB4NzHvf4mS+
	 l3QSMzQ5GikjSLTAOT4hSixS+yWuVfyBSYk7JTQlRQ/RArS/lgKpBe7Tv8nJa9/NIR
	 Rvndg7tPx8USRc+8QBI6hNIYm3ozMvcfHL6zWcs0+9cj0hT4Bh2ttp4nYrQJRQ0R4h
	 t6rWZ+JrCBtHmk1dwK9P0kB/J0ZaXUL9AtjXz1WbBZjAqUWDmrgj+NzBaMb09LfJuo
	 oOCdnvuUZsO/g==
Date: Mon, 11 May 2026 09:39:32 -0400
From: Sasha Levin <sashal@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Breno Leitao <leitao@debian.org>,
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agHcFCRVSn5ra5Kc@laps>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
 <af5Z2IvtS5pVorSl@laps>
 <agG_PZ3qcl6TwLnL@gmail.com>
 <agHUp8ulaWJ75WU5@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agHUp8ulaWJ75WU5@tiehlicka>

On Mon, May 11, 2026 at 03:07:51PM +0200, Michal Hocko wrote:
>On Mon 11-05-26 04:41:38, Breno Leitao wrote:
>> On Fri, May 08, 2026 at 05:47:04PM -0400, Sasha Levin wrote:
>> > On Fri, May 08, 2026 at 01:56:30PM -0700, Andrew Morton wrote:
>> > > On Thu,  7 May 2026 03:05:45 -0400 Sasha Levin <sashal@kernel.org> wrote:
>> > >
>> > > > When a (security) issue goes public, fleets stay exposed until a patched kernel
>> > > > is built, distributed, and rebooted into.
>> > > >
>> > > > For many such issues the simplest mitigation is to stop calling the buggy
>> > > > function. Killswitch provides that. An admin writes:
>> > > >
>> > > >     echo "engage af_alg_sendmsg -1" \
>> > > >         > /sys/kernel/security/killswitch/control
>> > >
>> > > It certainly sounds useful, but what would I know.  How do we hunt down
>> > > suitable operations people (aka "target audience") to find out how
>> > > useful this is to them?
>> >
>> > I'm not entierly sure here... If folks have suggestions on folks to loop in,
>> > that'll be great!
>>
>> I work with these issues at Meta, and this approach would address a real
>> need we have.

Thanks for the feedback!

>> While livepatch could theoretically solve this problem, it's less suited
>> for rapid mitigation for a couple of reasons:
>>
>> 1) Livepatch rollout is inherently slower due to the blast radius if a
>>    bug exists in the livepatch mechanism itself.
>>
>> 2) It's common to run hundreds of different kernel versions across a
>>    fleet. Since livepatch is kernel-specific, a single CVE suddenly
>>    requires building and deploying hundreds of individual livepatches—
>>    far less practical than a simple sysfs write.
>
>LP is certainly a more laborous solution. I guess this is quite clear.
>It is also much safer option as it deals with all implementation details
>like consistency. All that is not done for fun. I am really wondering
>how admins are expected to a) know which kernel functions are ok/safe to
>disable and b) when it is safe to do so without introducing unsafe
>kernel state or introduce an outright bug that way.

In a similar way to how they would know if a given livepatch is safe to apply -
ideally it would be communicated by the vendor/distro/kernel team.

"On Debian XX.YY, use the following command to mitigate CVE-AAAA-BBBB:

  echo "engage woops -1" > /sys/kernel/security/killswitch/control"

>Thiking about this I can see how waiting for an official LP can be time
>consuming and sometimes creating those is far from trivial. But would it
>make sense to have automated LP creation tooling available that would
>allow to return early from a function and relly on the existing
>infrastructure to do the right thing?

This would definitely help (and in light of how the last couple of weeks played
out, the case for livepatches definitely increased), but not all
vendors/distros provide livepatches.

My personal usecase is simple: I use debian, with their kernel. I'm not going
to get livepatches from debian, and it would take a few days/weeks for a kernel
update to land. I want a simple solution that'll let me disable functionality I
don't care about.

So I can't use livepatching/fault injection/etc easily.

-- 
Thanks,
Sasha
