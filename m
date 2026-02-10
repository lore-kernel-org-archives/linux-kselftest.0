Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DB715B0EC
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770721485; cv=none; b=u1y7mj6VtzlHaFe9GLVfwiADu/NXcNHSUK3CDVvZ2kursemJc3lvPawNcTi25axqGnnToeJoGUQfI/j8FsbNgg4AfXbM9aZSCb2YeJrrmqFE0WFjFamG60KLoFdgKaP11rfgWtPC+CgLRpqD11VxHvdWU3yTCh9Z0ZV1T2vWn1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770721485; c=relaxed/simple;
	bh=LG7YbVmhhGFwNk/Q0/CFSlgIHlx5jtDXvc+QsYLGRLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=epksTNZwbwnfh6ZpQyVFwHBQjo6c+u5Xs721/IzES8ycX70KMN2Q8vLEjRDBaL2huBNSVzO3cd/ZsRbnyZSmKvXIuaZKQPUA+2LVHxi6YD/2rT3xOeOdL5qZ5e5gVOuHQAN7s5fSUJnlDhRodmbNnbISunMh7yJfwmiiH8AwbX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nZKsnHJa; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nZKsnHJa"
Message-ID: <3f24a647-6133-4d45-b71e-6ede06bab02e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770721472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c+PiHpBIgKkKo8SVoWPoVfzBO73+OGk74HdhlYR3zR4=;
	b=nZKsnHJa/jwOE1X4NjbZkJ9+S/5xmk3vRtHKyVQwBe0u/jP6aIAniO+zW6NsR1uedtryzY
	giXgA5eWve391cDt+1/KdvzMErCQd/pGOLQe0IElFQSuei7a6xOWKBgLsa6On/B1hU0zfW
	476mgo+X/JJik21H6pCxmribiPml/Vg=
Date: Tue, 10 Feb 2026 19:03:37 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v9 1/1] smb/client: introduce KUnit test to check search
 result of smb2_error_map_table
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: bharathsm@microsoft.com, chenxiaosong@kylinos.cn, dhowells@redhat.com,
 linkinjeon@kernel.org, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-cifs@vger.kernel.org, pc@manguebit.org, ronniesahlberg@gmail.com,
 senozhatsky@chromium.org, smfrench@gmail.com, sprasad@microsoft.com,
 tom@talpey.com
References: <20260118091313.1988168-1-chenxiaosong.chenxiaosong@linux.dev>
 <20260210081040.4156383-1-geert@linux-m68k.org>
 <5c4bbbea-d68c-4089-b3aa-adb4b05696ba@linux.dev>
 <CAMuHMdXBBCzWK8HPQ8zQYJ1_Pxim3_ku4_2-CnWXm3M4ysnQ+w@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: ChenXiaoSong <chenxiaosong.chenxiaosong@linux.dev>
In-Reply-To: <CAMuHMdXBBCzWK8HPQ8zQYJ1_Pxim3_ku4_2-CnWXm3M4ysnQ+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Thanks for your suggestions, these are really helpful. I will make the 
changes as soon as possible.

Thanks,
ChenXiaoSong <chenxiaosong@kylinos.cn>

On 2/10/26 6:38 PM, Geert Uytterhoeven wrote:
> Hi ChenXiaoSong,
> 
> On Tue, 10 Feb 2026 at 10:53, ChenXiaoSong
> <chenxiaosong.chenxiaosong@linux.dev> wrote:
>> The KUnit test cases are only executed when the CONFIG_SMB_KUNIT_TESTS
>> is enabled.
> 
> ... which defaults to KUNIT_ALL_TESTS, so if KUNIT_ALL_TESTS is enabled,
> the test is enabled by default, too.
> 
>> Making it a separate test module would require exporting local variables
>> and functions so that the test code can access them. However, exporting
>> local variables and functions would likely make the code much uglier, as
>> it would require adding "#if" conditionals into the production code to
>> isolate the test code.
>>
>> Geert, please let me know if you have a better idea.
>>
>> I am also discussing this with the ext4 community, and we all hope to
>> find a way to make the tests a separate module.
> 
> There are ways to restrict exported symbols to test modules only,
> see EXPORT_SYMBOL_FOR_TESTS_ONLY(), EXPORT_SYMBOL_FOR_MODULES(),
> and EXPORT_SYMBOL_NS().
> 
> If it is really hard to convert the tests into a separate module,
> you can add a new kernel/module parameter, which needs to be specified
> explicitly to run the test. That would avoid running the tests when just
> (auto)loading cifs.ko.
> 
>> On 2/10/26 4:10 PM, Geert Uytterhoeven wrote:
>>> Thanks for your patch, which is now commit 480afcb19b61385d
>>> ("smb/client: introduce KUnit test to check search result of
>>> smb2_error_map_table") in linus/master
>>>
>>>> The KUnit test are executed when cifs.ko is loaded.
>>> This means the tests are_always_ executed when cifs.ko is loaded,
>>> which is different from how most other test modules work.
>>> Please make it a separate test module, so it can be loaded independently
>>> of the main cifs module.  That way people can enable all tests in
>>> production kernels, without affecting the system unless a test module
>>> is actually loaded.
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

