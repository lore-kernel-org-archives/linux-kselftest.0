From: luto@amacapital.net (Andy Lutomirski)
Date: Tue, 20 Nov 2018 14:02:49 -0700
Subject: [PATCH -next 1/2] mm/memfd: make F_SEAL_FUTURE_WRITE seal more
 robust
In-Reply-To: <20181120204710.GB22801@google.com>
References: <20181120052137.74317-1-joel@joelfernandes.org>
 <CALCETrXgBENat=5=7EuU-ttQ-YSXT+ifjLGc=hpJ=unRgSsndw@mail.gmail.com>
 <20181120183926.GA124387@google.com>
 <20181121070658.011d576d@canb.auug.org.au>
 <469B80CB-D982-4802-A81D-95AC493D7E87@amacapital.net>
 <20181120204710.GB22801@google.com>
Message-ID: <F8E28229-C99E-4711-982B-5B5DE0F70F16@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181120210249.2NqeNwA5Hr1PGtQqcMjTztNOMQgD7IxcoGlmQH7xRDk@z>


> On Nov 20, 2018,@1:47 PM, Joel Fernandes <joel@joelfernandes.org> wrote:
> 
>> On Tue, Nov 20, 2018@01:33:18PM -0700, Andy Lutomirski wrote:
>> 
>>> On Nov 20, 2018,@1:07 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> 
>>> Hi Joel,
>>> 
>>>>> On Tue, 20 Nov 2018 10:39:26 -0800 Joel Fernandes <joel@joelfernandes.org> wrote:
>>>>> 
>>>>> On Tue, Nov 20, 2018@07:13:17AM -0800, Andy Lutomirski wrote:
>>>>> On Mon, Nov 19, 2018 at 9:21 PM Joel Fernandes (Google)
>>>>> <joel at joelfernandes.org> wrote:  
>>>>>> 
>>>>>> A better way to do F_SEAL_FUTURE_WRITE seal was discussed [1] last week
>>>>>> where we don't need to modify core VFS structures to get the same
>>>>>> behavior of the seal. This solves several side-effects pointed out by
>>>>>> Andy [2].
>>>>>> 
>>>>>> [1] https://lore.kernel.org/lkml/20181111173650.GA256781 at google.com/
>>>>>> [2] https://lore.kernel.org/lkml/69CE06CC-E47C-4992-848A-66EB23EE6C74 at amacapital.net/
>>>>>> 
>>>>>> Suggested-by: Andy Lutomirski <luto at kernel.org>
>>>>>> Fixes: 5e653c2923fd ("mm: Add an F_SEAL_FUTURE_WRITE seal to memfd")  
>>>>> 
>>>>> What tree is that commit in?  Can we not just fold this in?  
>>>> 
>>>> It is in linux-next. Could we keep both commits so we have the history?
>>> 
>>> Well, its in Andrew's mmotm, so its up to him.
>>> 
>>> 
>> 
>> Unless mmotm is more magical than I think, the commit hash in your fixed
>> tag is already nonsense. mmotm gets rebased all the time, and is only
>> barely a git tree.
> 
> I wouldn't go so far to call it nonsense. It was a working patch, it just did
> things differently. Your help with improving the patch is much appreciated.

I’m not saying the patch is nonsense — I’m saying the *hash* may be nonsense. akpm uses a bunch of .patch files and all kinds of crazy scripts, and the mmotm.git tree is not stable at all.

> 
> I am Ok with whatever Andrew wants to do, if it is better to squash it with
> the original, then I can do that and send another patch.
> 
> 


From experience, Andrew will food in fixups on request :)
