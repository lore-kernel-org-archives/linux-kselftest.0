From: luto at amacapital.net (Andy Lutomirski)
Date: Sat, 29 Sep 2018 10:25:17 -0700
Subject: [PATCH 2/3] namei: implement AT_THIS_ROOT chroot-like path
 resolution
In-Reply-To: <CAG48ez30WJhbsro2HOc_DR7V91M+hNFzBP5ogRMZaxbAORvqzg@mail.gmail.com>
References: <20180929103453.12025-1-cyphar@cyphar.com>
 <20180929131534.24472-1-cyphar@cyphar.com>
 <CAG48ez30WJhbsro2HOc_DR7V91M+hNFzBP5ogRMZaxbAORvqzg@mail.gmail.com>
Message-ID: <F0E08B90-F10B-4897-913D-CA18E99A987D@amacapital.net>



> On Sep 29, 2018, at 9:35 AM, Jann Horn <jannh at google.com> wrote:
> 
> +cc linux-api; please keep them in CC for future versions of the patch
> 
>> On Sat, Sep 29, 2018 at 4:29 PM Aleksa Sarai <cyphar at cyphar.com> wrote:
>> The primary motivation for the need for this flag is container runtimes
>> which have to interact with malicious root filesystems in the host
>> namespaces. One of the first requirements for a container runtime to be
>> secure against a malicious rootfs is that they correctly scope symlinks
>> (that is, they should be scoped as though they are chroot(2)ed into the
>> container's rootfs) and ".."-style paths. The already-existing AT_XDEV
>> and AT_NO_PROCLINKS help defend against other potential attacks in a
>> malicious rootfs scenario.
> 
> So, I really like the concept for patch 1 of this series (but haven't
> read the code yet); but I dislike this patch because of its footgun
> potential.
> 

The code could do it differently: do the path walk and then, before accepting the result, walk back up and make sure the result is under the starting point.

This is *not* a full solution, though, since a walk above the root gas side effects on timing, various caches, and possibly network traffic, so it’s open to Spectre-like attacks in which a malicious container could use a runtime-initiated AT_THIS_ROOT to infer the existence of directories outside the container.

But what’s the container usecase?  Any sane container is based on pivot_root or similar, so the runtime can just do the walk in the container context. IOW I’m a bit confused as to the exact intended use of the whole series. Can you elaborate?
