Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD24318EE7;
	Wed, 22 Apr 2026 14:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776869713; cv=none; b=fLLfx77Org7SLX59TyaMj0jp9vVigJdLXlkdC24Ql0RcGy0N6fufFUI/gpsiuv7if7+hCJlB4BA3TV0gMrM93lhQHdzp6TWc8a3pYIJvsXao9JRrA3E3xCWqfZH/ULp/CMdKs3U2Nc+egmdxOKCkli3327cWUKezZMW74/VqG0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776869713; c=relaxed/simple;
	bh=wJB1LFrB+6P6GUuEZG1cJk09ntt3ZtX4VBvKoiziV80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2SBg6te0d2ZDjEKW/XyUkGSINb4yi7AX9rM/qPDGkUciRK1xIyIxMLDt6qeBkIdTpMvxblpjRz4M4B53THbYDR60YXleSL9PzWbXCZC55/5rdoJQqYTJ7nCSdLt8iNUxeI2zvbY+BWfDRhsZS9qfLNrKSwMFhd2eavP3/ibgDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JBVyTXly; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JBVyTXly"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BBC21FC4;
	Wed, 22 Apr 2026 07:55:04 -0700 (PDT)
Received: from [10.57.63.98] (unknown [10.57.63.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11BF33FE87;
	Wed, 22 Apr 2026 07:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776869709; bh=wJB1LFrB+6P6GUuEZG1cJk09ntt3ZtX4VBvKoiziV80=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JBVyTXlyA0MOQUTKYlz3n9cWumPLYHdJa0eN95ySt03/esN0IUlkcZNndcqtI2ku+
	 awm6imBU+4GxwbUdan20Skrc47sQU8i80ATkV+PddD32eQXbbScdBWgf93zO7McgMl
	 o4+GqLtTo3xcIMglkkN6+XCpFmpAdQcsimhtCsgA=
Message-ID: <693f4d7c-46f4-409b-8944-a8c9e4b5e073@arm.com>
Date: Wed, 22 Apr 2026 16:55:05 +0200
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
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <aei87MmXaEdg8YOf@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/04/2026 14:19, Will Deacon wrote:
>> @@ -74,8 +76,12 @@ struct rt_sigframe_user_layout {
>>   * This state needs to be carefully managed to ensure that it doesn't cause
>>   * uaccess to fail when setting up the signal frame, and the signal handler
>>   * itself also expects a well-defined state when entered.
>> + *
>> + * The valid_fields member is a bitfield (see UA_STATE_HAS_*), specifying which
>> + * of the remaining fields is valid (has been set to a value).
>>   */
>>  struct user_access_state {
>> +	unsigned int valid_fields;
>>  	u64 por_el0;
>>  };
> Do you think it would be worth adding some accessors to make it easier
> to keep the flags in sync? For example:
>
> /* Stores por_el0 into uas->por_el0 and sets UA_STATE_HAS_POR_EL0 */
> void set_ua_state_por_el0(struct user_access_state *uas, u64 por_el0);
>
> /*
>  * If UA_STATE_HAS_POR_EL0, *por_el0 = uas->por_el0 and return 0.
>  * Otherwise, return -ENOENT.
>  */
> int get_ua_state_por_el0(struct user_access_state *uas, u64 *por_el0);
>
> WDYT?

I did get a feeling having helpers would be a good idea. I wonder if
getters/setters aren't a bit overkill though, as they make accesses to
the struct more cumbersome and we'd need a pair for every member (unless
we use some macro magic). Maybe it would be sufficient to have say
ua_state_has_field(POR_EL0) to check if the bit is set, and
ua_state_set_field_valid(POR_EL0) to set the bit?

>> @@ -1095,7 +1104,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
>>  {
>>  	struct pt_regs *regs = current_pt_regs();
>>  	struct rt_sigframe __user *frame;
>> -	struct user_access_state ua_state;
>> +	struct user_access_state ua_state = {0};
> nit: {} should do (no need for the '0'). Same in setup_rt_frame().

Will change it, I have some vague recollection that GCC and Clang
disagreed about the meaning of {}... but that's probably fixed nowadays.

Thanks for the review!

- Kevin
