From: fweimer at redhat.com (Florian Weimer)
Date: Tue, 21 May 2019 15:10:11 +0200
Subject: [PATCH 1/2] open: add close_range()
In-Reply-To: <20190521130438.q3u4wvve7p6md6cm@brauner.io> (Christian Brauner's
 message of "Tue, 21 May 2019 15:04:39 +0200")
References: <20190521113448.20654-1-christian@brauner.io>
 <87tvdoau12.fsf@oldenburg2.str.redhat.com>
 <20190521130438.q3u4wvve7p6md6cm@brauner.io>
Message-ID: <87h89o9cng.fsf@oldenburg2.str.redhat.com>

* Christian Brauner:

>> Solaris has an fdwalk function:
>> 
>>   <https://docs.oracle.com/cd/E88353_01/html/E37843/closefrom-3c.html>
>> 
>> So a different way to implement this would expose a nextfd system call
>
> Meh. If nextfd() then I would like it to be able to:
> - get the nextfd(fd) >= fd
> - get highest open fd e.g. nextfd(-1)

The highest open descriptor isn't istering for fdwalk because nextfd
would just fail.

> But then I wonder if nextfd() needs to be a syscall and isn't just
> either:
> fcntl(fd, F_GET_NEXT)?
> or
> prctl(PR_GET_NEXT)?

I think the fcntl route is a bit iffy because you might need it to get
the *first* valid descriptor.

>> to userspace, so that we can use that to implement both fdwalk and
>> closefrom.  But maybe fdwalk is just too obscure, given the existence of
>> /proc.
>
> Yeah we probably don't need fdwalk.

Agreed.  Just wanted to bring it up for completeness.  I certainly don't
want to derail the implementation of close_range.

Thanks,
Florian
