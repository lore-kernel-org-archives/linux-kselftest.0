From: shuah@kernel.org (shuah)
Date: Thu, 13 Dec 2018 16:56:54 -0700
Subject: [PATCH] selftests: Fix test errors related to lib.mk khdr target
In-Reply-To: <f4dddfa8-1493-5fd5-58a9-ea6ff2b25f9c@redhat.com>
References: <20181213200011.10779-1-shuah@kernel.org>
 <623cdf7b-fc3c-2a93-c61a-a043e3d7f75b@redhat.com>
 <25593aa4-a2a7-6567-11f2-b702b6e5563c@kernel.org>
 <f4dddfa8-1493-5fd5-58a9-ea6ff2b25f9c@redhat.com>
Message-ID: <b6ed53db-981e-9d9b-8838-fcd7773e7f42@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181213235654.LlS6Q1H_gHokLZsqt1Zo3pq77U9embsvaErhN0G1WDU@z>

On 12/13/18 4:40 PM, Paolo Bonzini wrote:
> On 13/12/18 23:50, shuah wrote:
>>>
>>> Looks good.  Could you please provide a topic branch so that we can
>>> avoid conflicts between our trees at the next merge window.
>>>
>>
>> Thanks. The topic branch is
>>
>> git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
>>
>> I will apply it in a day or two to get ready for the merge window.
> 
> There are already other patches in that branch; a topic branch only
> includes this one on top of Linus's tree, so that it is independent from
> other changes being made in both your and my tree.
> 
> You should create a new branch in linux-kselftest.git, pull it into
> next, and tell me the name so that I can pull the same branch into kvm.git.
> 

You can find just this patch on top of 4.20-rc6 in

git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git 
khdr_fix topic branch.

thanks,
-- Shuah
