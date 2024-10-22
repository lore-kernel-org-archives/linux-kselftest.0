Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A0F196DA2
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Oct 2024 12:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729600457; cv=none; b=jj0gBtp/Dy33GCaMkbR3sXIRvIrLTwiCo2GCKFoCZ+zjTxhlLMmYTsVhVbWi+mIb1BgXYBVheDaeLypfC72dRdF16KKYOlfEPHofHVQIUh895wFgX6k6b6RvZ/R9a1yYZHZ+MINpCguKsgGatMBKvdEYCg7UarJ39+CH/GosZE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729600457; c=relaxed/simple;
	bh=/2F4yJCj0L92MREys6bmvI9WZu1EIorOBPsQNU0+nvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQg+kAo0ssuUK94FNXexZlBPyiRG0G6FHQ2dQF3LPfdLGGb1AI3RA/C8zkyp0qPd2VfI+Q+Ch5jvtANdHM+fu7eLfBbXL6Z2IBInpzmv+gX/IH/QTBUXMOuXmx5ZbTi2dZjeySeuDz5miHGbkcu/y2+95cxmNGoTUcVKTVz4Log=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9D51497;
	Tue, 22 Oct 2024 05:34:44 -0700 (PDT)
Received: from [10.57.66.29] (unknown [10.57.66.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B211E3F71E;
	Tue, 22 Oct 2024 05:34:11 -0700 (PDT)
Message-ID: <12041781-6be0-4492-b352-a8d153de3415@arm.com>
Date: Tue, 22 Oct 2024 14:34:09 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: signal: Improve POR_EL0 handling to avoid
 uaccess failures
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
 anshuman.khandual@arm.com, aruna.ramakrishna@oracle.com, broonie@kernel.org,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com, jeffxu@chromium.org,
 joey.gouly@arm.com, shuah@kernel.org, will@kernel.org,
 linux-kselftest@vger.kernel.org, x86@kernel.org
References: <20241017133909.3837547-1-kevin.brodsky@arm.com>
 <20241017133909.3837547-4-kevin.brodsky@arm.com>
 <ZxEzAzmlIG66ZPVn@e133380.arm.com>
 <cf75979b-b94f-46cf-a8d0-37e5843a0d29@arm.com>
 <ZxZaaOEIVpSEv7C/@e133380.arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <ZxZaaOEIVpSEv7C/@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/10/2024 15:43, Dave Martin wrote:
> On Mon, Oct 21, 2024 at 12:06:07PM +0200, Kevin Brodsky wrote:
>> On 17/10/2024 17:53, Dave Martin wrote:
>>> [...]
>>>> +/*
>>>> + * Save the unpriv access state into ua_state and reset it to disable any
>>>> + * restrictions.
>>>> + */
>>>> +static void save_reset_unpriv_access_state(struct unpriv_access_state *ua_state)
>>> Would _user_ be more consistent naming than _unpriv_ ?
>> I did ponder on the naming. I considered user_access/uaccess instead of
>> unpriv_access, but my concern is that it might imply that only uaccess
>> is concerned, while in reality loads/stores that userspace itself
>> executes are impacted too. I thought using the "unpriv" terminology from
>> the Arm ARM (used for stage 1 permissions) might avoid such
>> misunderstanding. I'm interested to hear opinions on this, maybe
>> accuracy sacrifices readability.
> "user_access" seemed natural to me: it parses equally as "[user
> access]" (i.e., uaccess) and "[user] access" (i.e., access by, to, or
> on behalf of user(space)).
>
> Introducing an architectural term when there is already a generic OS
> and Linux kernel term that means the right thing seemed not to improve
> readability, but I guess it's a matter of opinion.

Both good points. "user_access" seems to strike the right balance, plus
it's slightly shorter. Will switch to that naming in v2.

Kevin
