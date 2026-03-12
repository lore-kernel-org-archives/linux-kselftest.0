Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B231E2798EA;
	Thu, 12 Mar 2026 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773304358; cv=none; b=WMEtX+buNZOZwOnoG2rfYABAnlG7EZjKP3ZmESsQqwubdjT+mclGoV2H58M46aKYmkQS9eH5X6Lt37PMIwFQhXR+Vem7UE/H8pWvv9YqgMlx8Dysc4vptVKZueBKREOmMjn+OB5uW/1y7YSe/4vl0BuCWd3B6ihsG693fvD4F6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773304358; c=relaxed/simple;
	bh=5AYs6BroVkxtKJhCWyhPPa9+11YmMxWFhSfvifCztJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6rt69tQLROH3rhq9RWbBiolu2lRy71f9YN+WQT3SOcHiYWhoZQlB9RMRec0Gs6PRrvbxnXkAqwWZHppJCZXbpWyoljzZjDxxnTc9b77XUV3WIWejby8xuDh/SxC+LpwhxO2J+Ae51YwKBNlzTo75VeuoSDFEqrh0XTPLZ5n+c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIEyu1dv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIEyu1dv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E244DC4CEF7;
	Thu, 12 Mar 2026 08:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773304358;
	bh=5AYs6BroVkxtKJhCWyhPPa9+11YmMxWFhSfvifCztJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jIEyu1dv/G4tXeoiWpSNi4nEf3g58BTBHj2mu/oATMIOixTT41BqLjCQxdgDqOlMR
	 dWo1Irhc9Rda6uMgaylO7vhng4jYYp2ncOAl0bMG9Z9Wscn47ydAYWqszHgk8kkwvm
	 jIIeE2kA2LmeaerQl6GOhhAy00f+21223GH6HUC15vORxdsEiCRKFYCWW5i0G9bczv
	 E5aqD6XXBCTyhp4zy8LNf+7lQsDqsk4VhKoxq2mYxVoOAz5iP9ArCF0i3h0FnIQmAJ
	 QktSsW6qGCUJ7X7h8eklysemTHCLn9XpED5QjOdDJWp+TtyksQHMOgjl0o9Bi9QGYd
	 CTikNaGY7gqYA==
Message-ID: <2c069fb1-fd23-4e7b-92de-7f4a4eaa4f67@kernel.org>
Date: Thu, 12 Mar 2026 09:32:32 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: prevent droppable mappings from being locked
To: anthony.yznaga@oracle.com, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
 Jason@zx2c4.com, shuah@kernel.org
References: <20260310155821.17869-1-anthony.yznaga@oracle.com>
 <269b1a31-20d1-4451-b4ba-f55a67f27d96@lucifer.local>
 <de35525c-4522-4117-b6cb-01d48325c4f1@oracle.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <de35525c-4522-4117-b6cb-01d48325c4f1@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/12/26 03:16, anthony.yznaga@oracle.com wrote:
> 
> On 3/11/26 3:36 AM, Lorenzo Stoakes (Oracle) wrote:
>> On Tue, Mar 10, 2026 at 08:58:20AM -0700, Anthony Yznaga wrote:
>>> Droppable mappings must not be lockable. There is a check for VMAs with
>>> VM_DROPPABLE set in mlock_fixup() along with checks for other types of
>>> unlockable VMAs which ensures this when calling mlock()/mlock2().
>>>
>>> For mlockall(MCL_FUTURE), the check for unlockable VMAs is different.
>>> In apply_mlockall_flags(), if the flags parameter has MCL_FUTURE set,
>>> the
>>> current task's mm's default VMA flag field mm->def_flags has VM_LOCKED
>>> applied to it. VM_LOCKONFAULT is also applied if MCL_ONFAULT is also
>>> set.
>>> When these flags are set as default in this manner they are cleared in
>>> __mmap_complete() for new mappings that do not support mlock. A check
>>> for
>>> VM_DROPPABLE in __mmap_complete() is missing resulting in droppable
>>> mappings created with VM_LOCKED set. To fix this and reduce that
>>> chance of
>>> similar bugs in the future, introduce and use vma_supports_mlock().
>>>
>>> Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always
>>> lazily freeable mappings")
>> We should definitely cc: stable I think.
>>
>> It might result in some backport pain since it'll probably pre-date the
>> __mmap_region() stuff :)) sorry.
> 
> I could add a patch at the beginning that does the cheap fix followed by
> this patch.

Any backport conflicts should be easy and fast too resolve (if any). No
need to uglify our mainline patches :)

-- 
Cheers,

David
