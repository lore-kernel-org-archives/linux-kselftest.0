Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F1C318EC7
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 20:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927388; cv=none; b=oqqq1gtGdJOdsval/3FZIZwbMduGpa8QA4dV0hYEehcBnKs6ED3MhqIY+k+DYFsabKvgOSy9A5uoaeSilmdQbYRnt/izfbLlu8vUKZgHu//4QF/cij48caLByDSONftzKxV6eF6qkFi4wrh3FxBufzrxM/YwPuvWohUnSf7oalw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927388; c=relaxed/simple;
	bh=CKhvfoKac3yTExIwEaM4r+ibd0X1SM6qliORlp2yU1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwegv2+52IYa4QzjercA5amA3tdIkyU+ZjTXmLyX0cKmse/nRdqa5DfkfsWI+EJfnRcDcq7/KzB1mzOC9Wnu9t6Dbzf6hXVsZ4MJGOshgLabKFf/Fp1b3Lmqwp495/sE/kp637JS3Z3wKnWZE9Q4hLrn7ixncsJMPj6YVZr3lZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BXdURoxm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p4Olimqz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BXdURoxm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p4Olimqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777927386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1GHtRbgMeIDIxOFHs3hsqvzkUilb3wsgu1BamIkvJSs=;
	b=BXdURoxmg0gyDV0OBpOKpP0EJjRrBnedS7iI7b775/iECmQBb0FOUgrCGgZW7SZvIq1o7t
	7uJiImAiC0s+5h/hpNyaScx/wDYIJv0uKlwY1av7ssNmHCJo5w/jS3KFEvirj045FKRmkF
	1V6NT6laEW8QRveZrZYkHQxtB5cyCkE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-UySXDYwXOFC2SCJ6wg7Siw-1; Mon, 04 May 2026 16:43:05 -0400
X-MC-Unique: UySXDYwXOFC2SCJ6wg7Siw-1
X-Mimecast-MFC-AGG-ID: UySXDYwXOFC2SCJ6wg7Siw_1777927384
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so111667121cf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 13:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777927384; x=1778532184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1GHtRbgMeIDIxOFHs3hsqvzkUilb3wsgu1BamIkvJSs=;
        b=p4OlimqzRTQiwS0T2PiRI1LTIHiajbVreQlbF2c87HfZ2zTgyQzWJYAlveL+P9QcKT
         vdP0CDu2NPqvAbJHbKuUMmMkOYmDWWkESxnDZaPZalNRR5hfNJ65n/0YCF0DdSxMc60I
         RtHGFXLq9wqsl0n/F36RLdThmyjsCXhoxzXelEpsFby7Xv4LofydUcoJJzgkoGdcdCkt
         jgjQGqVvUJdXADU9txJUItH5CiiOXGsmTpCf7afIPziOVFeVmWifUVGrqVTAv2/qcM2t
         0SI5nj91l07XkkT2IEkjdW4GEWhG1uuz7uM77fH5ELamrHVhP2b6I34Odl2X/3Uv00AK
         Hh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777927384; x=1778532184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GHtRbgMeIDIxOFHs3hsqvzkUilb3wsgu1BamIkvJSs=;
        b=UdxI7EKw8oNN0kqTlHCiB7/ZAnZHCTGyKi/tJB20oFqyoEKshfCnUXSkaiWZNQuRAD
         YqsAhqsWRo11LqPqfENErwNcZE8BBq+hvh/tbmRqVwHcGSLAWEKMpoRbcMQracY3GgX1
         PXdnPCiq7DBbrCQ7SfrFkjmA/vMy3BYKzvXxim4u04FhjKFzVEAG3xRdHKGsGq6hDg9H
         KHFo7OiO3VjLDxF0NCmo1EttHi+K5PkxHqq5E040xpZbgLIkk8XN6NzcG+xWpEobM48s
         CXFrd65/wpnTQB39LgZn9gZbMzQNRb2VTkksahHPFzyr5+Brn+NVls2BRLQsn21VMNj1
         443Q==
X-Forwarded-Encrypted: i=1; AFNElJ86w9PkillgIc+85MbwmtRW5bZ6G5SOn1TNasVPQl6ckvxoL+O2CQKIMOa/YTzvautJU4flkqgAshKb/yD0DPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUaWr+1SwmV0wPxJL2YcuaWcAq0z1AsKdddNdQ9aXHV0RlcHyX
	lIZwLlLYhkzGx3SaywE18wPSB7qKl7vZUIqsuWC0ImW60JvuAO3Kf2u+K4QvJKe9vfI4e6IucVi
	/a9fDRjenAcV8W7FsMohK4ndsUVm0qMloE2FQ/ARg9oyEXj4xbsbNp1Uga6qTI2ML6uvNvw==
X-Gm-Gg: AeBDietOkFvcHp4tq5pD5mY2EcOn2g0E6VvM17bTJmd50Ep3eAAt04YwpPJHJ8xTxhv
	c88WEpLZzejyCjvtSV4o6/jqSTnhsY4kTjSRfLrqEajW/97swFHTThhAfjBtv7x9MG9BW8y3zBS
	UeOn/OH6HrhCbWvPsqAPy4AA3kqzBjWbur66RMuSE3H5FiVGHo69/JumuKJlN/0so1hF6pGaXHt
	CYRKqFW1pZIT2LLBRQyDhIttiEf2lVhRRhE4+ozm6zzmkRWwYlcdtWu91mpPsibQxn7b6tP4Akp
	sspSa+SRPRSX5BseN3oGuvJ4pu1jL5KESC7QpTOmZrFtnzZP+QScAhwTNJZFpquuh/a3BpDMRzw
	yO5H86PRIILjXiKIltMWYJIsDim+dB/4X+iONnCEC2V5PR7izQHbzcfaigJ+jCDDI5/i6zEJqTW
	u0vfNgPdlq1GiS
X-Received: by 2002:a05:620a:25d3:b0:8dc:eca0:35bd with SMTP id af79cd13be357-8fd158e5b7amr1588763685a.5.1777927384368;
        Mon, 04 May 2026 13:43:04 -0700 (PDT)
X-Received: by 2002:a05:620a:25d3:b0:8dc:eca0:35bd with SMTP id af79cd13be357-8fd158e5b7amr1588759585a.5.1777927383791;
        Mon, 04 May 2026 13:43:03 -0700 (PDT)
Received: from [192.168.1.26] (pool-68-160-160-85.bstnma.fios.verizon.net. [68.160.160.85])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc29a7f4dbsm1162742185a.16.2026.05.04.13.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 13:43:03 -0700 (PDT)
Message-ID: <08790b3f-6071-475c-b48f-b517349f2f57@redhat.com>
Date: Mon, 4 May 2026 16:43:02 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] kselftests: livepatch: Adapt tests to be executed
 on 4.12 kernels
To: Marcos Paulo de Souza <mpdesouza@suse.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, marcos@mpdesouza.com
References: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
Content-Language: en-US
From: Joe Lawrence <joe.lawrence@redhat.com>
Autocrypt: addr=joe.lawrence@redhat.com; keydata=
 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
 pNzsRQ==
In-Reply-To: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/4/26 2:34 PM, Marcos Paulo de Souza wrote:
> This is the fifth version of the patchset, which fixes the last Sashiko
> comment, about overwriting MOD_LIVEPATCH global variable and using a
> local variable to avoid module load clashing when an older kernel
> don't support some sysfs attributes.
> 
> Original cover-letter:
> These patches don't really change how the patches are run, just skip
> some tests on kernels that don't support a feature (like kprobe and
> livepatched living together) or when a livepatch sysfs attribute is
> missing.
> 
> These patches are based on printk/for-next branch.
> 
> Please review! Thanks!
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
> Changes in v5:
> - Edit the last three patches to avoid overwriting MOD_LIVEPATCH
>   variable, using a local variable. This fixed the last Sashiko report.
> - Link to v4: https://patch.msgid.link/20260429-lp-tests-old-fixes-v4-0-59b9741989d0@suse.com
> 
> Changes in v4:
> - Patch 5 was changed in order to address a comment made by Sashiko, where
>   subsequent tests rewrite the variables that contain the modules being loaded.
> - Link to v3: https://patch.msgid.link/20260427-lp-tests-old-fixes-v3-0-ccf3c90f744c@suse.com
> 
> Changes in v3:
> - Patch 1 was changed to reorganize the ifdeffery to handle multiple archs syscall wrapper (Miroslav)
> - Patch 3 was changed to rework the commit message and to address function naming (Joe)
> - Patches 4, 5 and 6 where had the commit messages to include the kernel version where
>   the given sysfs attributes were included (Petr Mladek)
> - Link to v2: https://patch.msgid.link/20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com
> 
> Changes in v2:
> - Patch descriptions were changed to remove "test-X", since it was polluting the commit subjects (Miroslav Benes)
> - Patch 8 was dropped since it was checking for a message from an out-of-tree patch. (Petr Mladek)
> - Patch 3 was dropped as should be treated as expected failure for older kernels. (Petr Mladek)
> - Patch 2 was changed to use y/n instead of 1/0, since it's more natural to use it.
> - Patch 1 was changed to handle ppc and loongson, and error out if dealing with a different architecture that sets
>   CONFIG_ARCH_HAS_SYSCALL_WRAPPER and haven't changed the test to include the proper wrapper prefix.
> - Patch 4 was changed to invert the return of the bash function to return 1 in failure, like
>   a normal bash function (Joe Lawrence)
> - Patches 5, 6 an 7 were changed to not split the tests, but to only run the tests
>   when the attribute were present (Miroslav Benes)
> - Link to v1: https://patch.msgid.link/20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com
> 
> ---
> Marcos Paulo de Souza (6):
>       selftests: livepatch: Check for ARCH_HAS_SYSCALL_WRAPPER config
>       selftests: livepatch: Replace true/false module parameter by y/n
>       selftests: livepatch: Introduce does_sysfs_exist function
>       selftests: livepatch: Check if patched sysfs attribute exists
>       selftests: livepatch: Check if replace sysfs attribute exists
>       selftests: livepatch: Check if stack_order sysfs attribute exists
> 
>  tools/testing/selftests/livepatch/functions.sh     |  10 +
>  tools/testing/selftests/livepatch/test-kprobe.sh   |   8 +-
>  tools/testing/selftests/livepatch/test-sysfs.sh    | 219 +++++++++++----------
>  .../livepatch/test_modules/test_klp_syscall.c      |  27 ++-
>  4 files changed, 153 insertions(+), 111 deletions(-)
> ---
> base-commit: 712c0756828becbfc629ff8d8b82deff5d1115e4
> change-id: 20260309-lp-tests-old-fixes-f955abc8ec27
> 

Acked-by: Joe Lawrence <joe.lawrence@redhat.com>

FWIW, I tried this out on 4.18.0-372.137.1.el8_6.x86_64, the oldest
kernel we're supporting for livepatching at the momement, and the modern
selftests + Marcos's patchset happily ran without any problems.

-- 
Joe

