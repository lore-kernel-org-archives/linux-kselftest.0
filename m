Received: from mta1.migadu.com (out-91.mta1.migadu.com [95.215.58.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F963BFACA
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 06:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936329; cv=none; b=gm3s6KFf0b4hquREhQ/2tXgyh7ifA1bFxT52uHijfR9Yp+o0F2ehH9d32XAJA6hl2zCFhtBpZOjlW36Ngmj+Imo5Q3ICV7xj/iUMn5O20YfDuIJRloxKij3o2OGURQHwdjiswxgOiLRmLi7S+azk1W6CT5Lg0pGX+1QrVL9me0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936329; c=relaxed/simple;
	bh=oTBpNY7hw7Wf7aDEdyGbqp7ST1teTAUXIET1OkGaVu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXTJB1/sE2U7Nxu1+dPiizdwwoCIRTyCaPVaFUMnnMa9ns40MZ1SZcaHcO/F2Q6o0ZnDGCzdkN4UnXrWgWJoP9AbzciCOikmMUGmhTeoTgxhEFJDAj1G8erCif7kplyfXVk3JqHl5/Vb9U+1RMQaQBwikkc6EqCRO2eCjpGe65c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j3eVYzJR; arc=none smtp.client-ip=95.215.58.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j3eVYzJR"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oTBpNY7hw7Wf7aDEdyGbqp7ST1teTAUXIET1OkGaVu4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788936323; v=1; x=1789541123;
 b=j3eVYzJRDP4GuwDpk1yAzHJdHeOy9WgKtiCl6wojdnOYSSQYKj74Ze4IE8uZMBTffhl0yVEg
 0g76LWdQpAcp1yt1dkPOsXcAIBwRB6+Jj/p/QLt0UmKmLZdtwSgMtUR3G1lQ5vgQmgMbqfwYwcT
 GAu5tQEiBO8r9XugGs76VhSs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ed883708a2057349;
	Wed, 09 Sep 2026 06:45:19 +0000
X-Mizu-Trace-ID: ed883708a2057349
X-Migadu-Flow: FLOW_OUT
Message-ID: <7d47a955-eee3-4a93-bf8d-210eefa59f0a@linux.dev>
Date: Wed, 9 Sep 2026 14:45:15 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: fix ptrace PEEKDATA check in memfd_secret
 test
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 shuah@kernel.org, James.Bottomley@hansenpartnership.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>
References: <20260908025111.34562-1-hongfu.li@linux.dev>
 <ap_N7u5DbIk4FEeZ@gremlin>
From: Hongfu Li <hongfu.li@linux.dev>
In-Reply-To: <ap_N7u5DbIk4FEeZ@gremlin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/9/8 17:03, Lorenzo Stoakes (ARM) 写道:
> On Tue, Sep 08, 2026 at 10:51:11AM +0800, Hongfu Li wrote:
>> From: Hongfu Li <lihongfu@kylinos.cn>
>>
>> try_ptrace() treats PTRACE_PEEKDATA return value as a boolean
>> check. A successful read returns non-zero data (memory filled with
>> 0x55), causing the test to incorrectly report PASS when secret memory
>> protection is broken.
>>
>> Check the return value against -1 instead. The test should only pass
>> when PTRACE_PEEKDATA fails, which means secret memory protection works.
>>
>> Fixes: 76fe17ef588a ("secretmem: test: add basic selftest for memfd_secret(2)")
> Not sure if a fixes is warranted? But I also definitely don't think a backport
> is in any case in case :P
>
>> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> The change LGTM afaict. Though I think a comment should be added. With that
> addressed:
>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
>> ---
>>   tools/testing/selftests/mm/memfd_secret.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/mm/memfd_secret.c b/tools/testing/selftests/mm/memfd_secret.c
>> index c55d84c5e613..dd08a3a1ef14 100644
>> --- a/tools/testing/selftests/mm/memfd_secret.c
>> +++ b/tools/testing/selftests/mm/memfd_secret.c
>> @@ -145,7 +145,7 @@ static void try_ptrace(int fd, int pipefd[2])
>>   		exit(KSFT_FAIL);
>>   	}
>>
>> -	if (ptrace(PTRACE_PEEKDATA, ppid, mem, 0))
>> +	if (ptrace(PTRACE_PEEKDATA, ppid, mem, 0) == -1)
>>   		exit(KSFT_PASS);
>  From https://man7.org/linux/man-pages/man2/ptrace.2.html#RETURN_VALUE :
>
>         On success, the PTRACE_PEEK* operations return the requested data
>         (but see NOTES)...
>
>         On error, all operations return -1, ...
>
>         ...
>
>         PTRACE_PEEKTEXT
>         PTRACE_PEEKDATA
>                Read a word at the address addr in the tracee's memory,
>                returning the word as the result of the ptrace() call.
>                Linux does not have separate text and data address spaces,
>                so these two operations are currently equivalent.  (data is
>                ignored; but see NOTES.)
>
> OK so we expect this to fail as otherwise that'd be a violation of secretmem.
>
> Feels like maybe we should add a comment to that effect? :)

Thanks for the review, and agreed on the comment: the test only passes
when PEEKDATA fails, which is easy to misread, so I'll make that
explicit in v2:

--- a/tools/testing/selftests/mm/memfd_secret.c
+++ b/tools/testing/selftests/mm/memfd_secret.c
@@ -145,7 +145,8 @@ static void try_ptrace(int fd, int pipefd[2])
          exit(KSFT_FAIL);
      }

-    if (ptrace(PTRACE_PEEKDATA, ppid, mem, 0))
+    /* PEEKDATA on secret memory must fail, else protection is broken. */
+    if (ptrace(PTRACE_PEEKDATA, ppid, mem, 0) == -1)
          exit(KSFT_PASS);


I'll also drop the Fixes: tag in v2 since a backport is not intended.

>>   	exit(KSFT_FAIL);
>> --
>> 2.54.0
>>
>> --
>> Cheers, Lorenzo

-- 
Best regards,
Hongfu

