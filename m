From: luto@amacapital.net (Andy Lutomirski)
Date: Fri, 9 Nov 2018 15:14:02 -0800
Subject: [PATCH v3 resend 1/2] mm: Add an F_SEAL_FUTURE_WRITE seal to memfd
In-Reply-To: <CAKOZuetZrL10zWwn4Jzzg0QL2nd3Fm0JxGtzC79SZAfOK525Ag@mail.gmail.com>
References: <20181108041537.39694-1-joel@joelfernandes.org>
 <CAG48ez1h=v-JYnDw81HaYJzOfrNhwYksxmc2r=cJvdQVgYM+NA@mail.gmail.com>
 <CAKOZuesw1wG-YynWL7bVb+4BWtYp0Ei62vweWF+mqF1Ln-_2Tg@mail.gmail.com>
 <BB64C995-F374-49EB-8469-4820231D8152@amacapital.net>
 <CAKOZuetZrL10zWwn4Jzzg0QL2nd3Fm0JxGtzC79SZAfOK525Ag@mail.gmail.com>
Message-ID: <F8A6A5DC-3BA0-43BD-B7EC-EDE199B33A02@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181109231402.d4YbSK64qeSmFbQClCBBjPJwV3vSu1oxEhDo5h9nVKA@z>



> On Nov 9, 2018,@2:42 PM, Daniel Colascione <dancol@google.com> wrote:
> 
> On Fri, Nov 9, 2018@2:37 PM, Andy Lutomirski <luto@amacapital.net> wrote:
>>> Another, more general fix might be to prevent /proc/pid/fd/N opens
>>> from "upgrading" access modes. But that'd be a bigger ABI break.
>> 
>> I think we should fix that, too.  I consider it a bug fix, not an ABI break, personally.
> 
> Someone, somewhere is probably relying on it though, and that means
> that we probably can't change it unless it's actually causing
> problems.
> 
> <mumble>spacebar heating</mumble>

I think it has caused problems in the past. It’s certainly extremely surprising behavior.  I’d say it should be fixed and, if needed, a sysctl to unfix it might be okay.

> 
>>>> That aside: I wonder whether a better API would be something that
>>>> allows you to create a new readonly file descriptor, instead of
>>>> fiddling with the writability of an existing fd.
>>> 
>>> That doesn't work, unfortunately. The ashmem API we're replacing with
>>> memfd requires file descriptor continuity. I also looked into opening
>>> a new FD and dup2(2)ing atop the old one, but this approach doesn't
>>> work in the case that the old FD has already leaked to some other
>>> context (e.g., another dup, SCM_RIGHTS). See
>>> https://developer.android.com/ndk/reference/group/memory. We can't
>>> break ASharedMemory_setProt.
>> 
>> 
>> Hmm.  If we fix the general reopen bug, a way to drop write access from an existing struct file would do what Android needs, right?  I don’t know if there are general VFS issues with that.
> 
> I also proposed that. :-) Maybe it'd work best as a special case of
> the perennial revoke(2) that people keep proposing. You'd be able to
> selectively revoke all access or just write access.

Sounds good to me, modulo possible races, but that shouldn’t be too hard to deal with.
