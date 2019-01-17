From: shuah@kernel.org (shuah)
Date: Thu, 17 Jan 2019 10:53:22 -0700
Subject: Linux 5.0-rc2 seccomp_bpf user_notification_basic test hangs
In-Reply-To: <20190117164531.GD17449@cisco>
References: <7cd7d5bc-1d69-57f5-4a98-81b036f81682@kernel.org>
 <CAGXu5jLGqXstRCmM1_fxUxn4djs1YLUun2Fc8ExcaN4-CKyELQ@mail.gmail.com>
 <20190117004416.GA17449@cisco>
 <f665bb74-293b-d627-2605-5b8de7671743@kernel.org>
 <CAGXu5jJ0VK4UiOeKTqv_TZSn5aZAVsXjUZgiXD=KFbZ-Ng_+KQ@mail.gmail.com>
 <20190117162703.GC17449@cisco>
 <CAGXu5jJOGO1UWdYdGmnnUEZOm-DaMUqR3UVSi+gnSc7q3KE8xA@mail.gmail.com>
 <20190117164531.GD17449@cisco>
Message-ID: <bc944bc9-65aa-d00e-a2b5-ec6d769dae9a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190117175322.r-giJh9yKnFQtztLbn9PPh8DNMLqxRwsjvRkqEuAlyA@z>

On 1/17/19 9:45 AM, Tycho Andersen wrote:
> On Thu, Jan 17, 2019@08:41:59AM -0800, Kees Cook wrote:
>> On Thu, Jan 17, 2019@8:27 AM Tycho Andersen <tycho@tycho.ws> wrote:
>>>
>>> On Thu, Jan 17, 2019@08:12:50AM -0800, Kees Cook wrote:
>>>> On Wed, Jan 16, 2019@5:26 PM shuah <shuah@kernel.org> wrote:
>>>>> I am running Linux 5.0-rc2 and not an older kernel.
>>>>
>>>> Weird. I couldn't reproduce this on 5.0-rc2, but I did see it on a
>>>> kernel without seccomp user_notif. Does the patch I sent fix it for
>>>> you? (And if so, can you take it in your tree?)
>>>
>>> I can reproduce it; you have to run it as non-root. I think your patch
>>> is necessary to get it to at least fail. The question is: what should
>>> we do about these tests that require real root? Skip them if we're not
>>> real-root, I guess?
>>
>> Hm, maybe use the XFAIL() bit of the harness?
>>
>> Perhaps it's time to make it a root-only test and do internal
>> priv-dropping to test the nnp-requiring parts? I'll add it to the TODO
>> list...
> 

Yup that is a good way to handle it. Please skip the test with ksft skip
code for non-root runs.

> Ok, I'll try to send a couple of patches soon to fix some of this up.
> But at least yours should should stop things from hanging for now.
> 

I am going to take Kees's patch to prevent hangs right away.

thanks,
-- Shuah
