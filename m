Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652DF2D836D;
	Fri, 24 Apr 2026 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022681; cv=none; b=jUxNQgmeMqSGCz2G0adIKZLVZVv/MKI8vX6PSRGcLa+B3kKoTg8G36AP7yIrjPErk9uI99G5JpE3tOYNr03xSLuQgJ9kFh6pdsSVNenIv+ADQmlx8Rd7fLagUfp0VfMIGDwerr7uU43UN8ZlFvpMamB1IlTOmCSNN2JZId6V3kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022681; c=relaxed/simple;
	bh=LgeQDUtw5awG1hk00vwUt2oakv15VSwrc2cQLxVardQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkJwlqa7cSw03TPg/q9pI+N3l6Ynu0TYJN3wuoM/aH/wldpEu3JI9ADlnK0AvlCIJ3OnjhZwdcyDRyEn2pxQrsINynQINz2Qxutbp/rtJPlUN3hdpEwxbg8aLxUpc58v07z180M3XbWiV2fbWZXTibjYijVsPEg1B7Un36I7K+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ARqDpBz1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ARqDpBz1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CBA71BC0;
	Fri, 24 Apr 2026 02:24:33 -0700 (PDT)
Received: from [10.57.33.60] (unknown [10.57.33.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAC9A3F23F;
	Fri, 24 Apr 2026 02:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777022678; bh=LgeQDUtw5awG1hk00vwUt2oakv15VSwrc2cQLxVardQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ARqDpBz19IP4LhyYurQOBbnl/oFWHTP3i3w96mTQP4+iHySWxpjUVbEtmU5mAnW+a
	 NtOc2fZwKBBw12rkf6PTRut/K/TelXRELxijnfSxntb91AFbzyTu6Hv1aTP3UxkcTe
	 6ELkNwtRQSUBIbnLUu1BloTzsnFb5QK+6nfATO0I=
Message-ID: <d13c9d8c-09c2-467d-bc35-a924e96f2f53@arm.com>
Date: Fri, 24 Apr 2026 11:24:33 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: signal: Preserve POR_EL0 if poe_context is
 missing
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>,
 Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
 <20260421144252.1440365-2-kevin.brodsky@arm.com>
 <aei87MmXaEdg8YOf@willie-the-truck>
 <693f4d7c-46f4-409b-8944-a8c9e4b5e073@arm.com>
 <aeoTX_6nK6oHw5OE@willie-the-truck>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <aeoTX_6nK6oHw5OE@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/04/2026 14:41, Will Deacon wrote:
> On Wed, Apr 22, 2026 at 04:55:05PM +0200, Kevin Brodsky wrote:
>> On 22/04/2026 14:19, Will Deacon wrote:
>>>> @@ -74,8 +76,12 @@ struct rt_sigframe_user_layout {
>>>>   * This state needs to be carefully managed to ensure that it doesn't cause
>>>>   * uaccess to fail when setting up the signal frame, and the signal handler
>>>>   * itself also expects a well-defined state when entered.
>>>> + *
>>>> + * The valid_fields member is a bitfield (see UA_STATE_HAS_*), specifying which
>>>> + * of the remaining fields is valid (has been set to a value).
>>>>   */
>>>>  struct user_access_state {
>>>> +	unsigned int valid_fields;
>>>>  	u64 por_el0;
>>>>  };
>>> Do you think it would be worth adding some accessors to make it easier
>>> to keep the flags in sync? For example:
>>>
>>> /* Stores por_el0 into uas->por_el0 and sets UA_STATE_HAS_POR_EL0 */
>>> void set_ua_state_por_el0(struct user_access_state *uas, u64 por_el0);
>>>
>>> /*
>>>  * If UA_STATE_HAS_POR_EL0, *por_el0 = uas->por_el0 and return 0.
>>>  * Otherwise, return -ENOENT.
>>>  */
>>> int get_ua_state_por_el0(struct user_access_state *uas, u64 *por_el0);
>>>
>>> WDYT?
>> I did get a feeling having helpers would be a good idea. I wonder if
>> getters/setters aren't a bit overkill though, as they make accesses to
>> the struct more cumbersome and we'd need a pair for every member (unless
>> we use some macro magic).
> We only have one struct member, so it's probably fine for now, and we
> could group related members together in sub-structures to help in future.
> But it's up to you -- I don't feel strongly about it, but requiring the
> caller to update the flag manually is going to be a bug magnet.
>
>> Maybe it would be sufficient to have say
>> ua_state_has_field(POR_EL0) to check if the bit is set, and
>> ua_state_set_field_valid(POR_EL0) to set the bit?
> I don't think that really helps with my concern. I'd like to avoid callers
> having to remember to deal with the flags when they update the data.

Got it. I can't think of a better way to do this so I'll just go ahead
with your suggestion, and prefix all members of the struct with __ to
make it clear they shouldn't be accessed directly. The macro magic can
wait until we have more than one struct member ;)

I've also reconsidered setup_sigframe() and realised using valid_fields
there is not a great idea, because the record is allocated in
setup_sigframe_layout() based on system_supports_poe(), and leaving a
record uninitialised would be bad™. I'll remove that change and I'll
have preserve_poe_context() fail with a WARN_ON() if
get_ua_state_por_el0() somehow returns an error.

- Kevin
