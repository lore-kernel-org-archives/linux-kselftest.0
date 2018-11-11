From: luto at amacapital.net (Andy Lutomirski)
Date: Sun, 11 Nov 2018 07:14:33 -0800
Subject: [PATCH v3 resend 1/2] mm: Add an F_SEAL_FUTURE_WRITE seal to memfd
In-Reply-To: <CAKOZuethQ3eaV4uoEXiffVMc_S0hyk1FGPB3iQHHnv4NadW1UQ@mail.gmail.com>
References: <CAG48ez0kQ4d566bXTFOYANDgii-stL-Qj-oyaBzvfxdV=PU-7g@mail.gmail.com>
 <20181110032005.GA22238@google.com>
 <69CE06CC-E47C-4992-848A-66EB23EE6C74@amacapital.net>
 <20181110182405.GB242356@google.com>
 <CAKOZuesQXRtthJTEr86LByH3gPpAdT-PQM0d1jqr131=zZNRKw@mail.gmail.com>
 <CAKOZueum8MtNvJ5P=W7_pRw62TdQdCgyjCwwbG1wezNboC1cxQ@mail.gmail.com>
 <20181110220933.GB96924@google.com>
 <907D942E-E321-4BD7-BED7-ACD1D96A3643@amacapital.net>
 <20181111023808.GA174670@google.com>
 <543A5181-3A16-438E-B372-97BEC48A74F8@amacapital.net>
 <20181111080945.GA78191@google.com>
 <CAKOZuethQ3eaV4uoEXiffVMc_S0hyk1FGPB3iQHHnv4NadW1UQ@mail.gmail.com>
Message-ID: <91E8E1AA-859A-457A-8978-3EA39CBBF075@amacapital.net>




> On Nov 11, 2018, at 12:30 AM, Daniel Colascione <dancol at google.com> wrote:
> 
>> On Sun, Nov 11, 2018 at 12:09 AM, Joel Fernandes <joel at joelfernandes.org> wrote:
>> On Sat, Nov 10, 2018 at 07:40:10PM -0800, Andy Lutomirski wrote:
>> [...]
>>>>>>>>>> I see two reasonable solutions:
>>>>>>>>>> 
>>>>>>>>>> 1. Don’t fiddle with the struct file at all. Instead make the inode flag
>>>>>>>>>> work by itself.
>>>>>>>>> 
>>>>>>>>> Currently, the various VFS paths check only the struct file's f_mode to deny
>>>>>>>>> writes of already opened files. This would mean more checking in all those
>>>>>>>>> paths (and modification of all those paths).
>>>>>>>>> 
>>>>>>>>> Anyway going with that idea, we could
>>>>>>>>> 1. call deny_write_access(file) from the memfd's seal path which decrements
>>>>>>>>> the inode::i_writecount.
>>>>>>>>> 2. call get_write_access(inode) in the various VFS paths in addition to
>>>>>>>>> checking for FMODE_*WRITE and deny the write (incase i_writecount is negative)
>>>>>>>>> 
>>>>>>>>> That will prevent both reopens, and writes from succeeding. However I worry a
>>>>>>>>> bit about 2 not being too familiar with VFS internals, about what the
>>>>>>>>> consequences of doing that may be.
>>>>>>>> 
>>>>>>>> IMHO, modifying both the inode and the struct file separately is fine,
>>>>>>>> since they mean different things. In regular filesystems, it's fine to
>>>>>>>> have a read-write open file description for a file whose inode grants
>>>>>>>> write permission to nobody. Speaking of which: is fchmod enough to
>>>>>>>> prevent this attack?
>>>>>>> 
>>>>>>> Well, yes and no. fchmod does prevent reopening the file RW, but
>>>>>>> anyone with permissions (owner, CAP_FOWNER) can just fchmod it back. A
>>>>>>> seal is supposed to be irrevocable, so fchmod-as-inode-seal probably
>>>>>>> isn't sufficient by itself. While it might be good enough for Android
>>>>>>> (in the sense that it'll prevent RW-reopens from other security
>>>>>>> contexts to which we send an open memfd file), it's still conceptually
>>>>>>> ugly, IMHO. Let's go with the original approach of just tweaking the
>>>>>>> inode so that open-for-write is permanently blocked.
>>>>>> 
>>>>>> Agreed with the idea of modifying both file and inode flags. I was thinking
>>>>>> modifying i_mode may do the trick but as you pointed it probably could be
>>>>>> reverted by chmod or some other attribute setting calls.
>>>>>> 
>>>>>> OTOH, I don't think deny_write_access(file) can be reverted from any
>>>>>> user-facing path so we could do that from the seal to prevent the future
>>>>>> opens in write mode. I'll double check and test that out tomorrow.
>>>>>> 
>>>>>> 
>>>>> 
>>>>> This seems considerably more complicated and more fragile than needed. Just
>>>>> add a new F_SEAL_WRITE_FUTURE.  Grep for F_SEAL_WRITE and make the _FUTURE
>>>>> variant work exactly like it with two exceptions:
>>>>> 
>>>>> - shmem_mmap and maybe its hugetlbfs equivalent should check for it and act
>>>>> accordingly.
>>>> 
>>>> There's more to it than that, we also need to block future writes through
>>>> write syscall, so we have to hook into the write path too once the seal is
>>>> set, not just the mmap. That means we have to add code in mm/shmem.c to do
>>>> that in all those handlers, to check for the seal (and hope we didn't miss a
>>>> file_operations handler). Is that what you are proposing?
>>> 
>>> The existing code already does this. That’s why I suggested grepping :)
>>> 
>>>> 
>>>> Also, it means we have to keep CONFIG_TMPFS enabled so that the
>>>> shmem_file_operations write handlers like write_iter are hooked up. Currently
>>>> memfd works even with !CONFIG_TMPFS.
>>> 
>>> If so, that sounds like it may already be a bug.
> 
> Why shouldn't memfd work independently of CONFIG_TMPFS? In particular,
> write(2) on tmpfs FDs shouldn't work differently. If it does, that's a
> kernel implementation detail leaking out into userspace.
> 
>>>>> - add_seals won’t need the wait_for_pins and mapping_deny_write logic.
>>>>> 
>>>>> That really should be all that’s needed.
>>>> 
>>>> It seems a fair idea what you're saying. But I don't see how its less
>>>> complex.. IMO its far more simple to have VFS do the denial of the operations
>>>> based on the flags of its datastructures.. and if it works (which I will test
>>>> to be sure it will), then we should be good.
>>> 
>>> I agree it’s complicated, but the code is already written.  You should just
>>> need to adjust some masks.
>>> 
>> 
>> Its actually not that bad and a great idea, I did something like the
>> following and it works pretty well. I would say its cleaner than the old
>> approach for sure (and I also added a /proc/pid/fd/N reopen test to the
>> selftest and made sure that issue goes away).
>> 
>> Side note: One subtelty I discovered from the existing selftests is once the
>> F_SEAL_WRITE are active, an mmap of PROT_READ and MAP_SHARED region is
>> expected to fail. This is also evident from this code in mmap_region:
>>                if (vm_flags & VM_SHARED) {
>>                        error = mapping_map_writable(file->f_mapping);
>>                        if (error)
>>                                goto allow_write_and_free_vma;
>>                }
>> 
> 
> This behavior seems like a bug. Why should MAP_SHARED writes be denied
> here? There's no semantic incompatibility between shared mappings and
> the seal. And I think this change would represent an ABI break using
> memfd seals for ashmem, since ashmem currently allows MAP_SHARED
> mappings after changing prot_mask.

Hmm. I’m guessing the intent is that the mmap count should track writable mappings in addition to mappings that could be made writable using mprotect.  I think you could address this for SEAL_FUTURE in two ways:

1. In shmem_mmap, mask off VM_MAYWRITE if SEAL_FUTURE is set, or

2. Add a new vm operation that allows a vma to reject an mprotect attempt, like security_file_mprotect but per vma.  Then give it reasonable semantics for shmem.

(1) probably gives the semantics you want for SEAL_FUTURE: old maps can be mprotected, but new maps can’t.

> 
>> ---8<-----------------------
>> 
>> From: "Joel Fernandes (Google)" <joel at joelfernandes.org>
>> Subject: [PATCH] mm/memfd: implement future write seal using shmem ops
>> 
>> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
>> ---
>> fs/hugetlbfs/inode.c |  2 +-
>> mm/memfd.c           | 19 -------------------
>> mm/shmem.c           | 13 ++++++++++---
>> 3 files changed, 11 insertions(+), 23 deletions(-)
>> 
>> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
>> index 32920a10100e..1978581abfdf 100644
>> --- a/fs/hugetlbfs/inode.c
>> +++ b/fs/hugetlbfs/inode.c
>> @@ -530,7 +530,7 @@ static long hugetlbfs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
>>                inode_lock(inode);
>> 
>>                /* protected by i_mutex */
>> -               if (info->seals & F_SEAL_WRITE) {
>> +               if (info->seals & (F_SEAL_WRITE | F_SEAL_FUTURE_WRITE)) {
>>                        inode_unlock(inode);
>>                        return -EPERM;
>>                }
> 
> Maybe we can always set F_SEAL_FUTURE_WRITE when F_SEAL_WRITE so we
> can just test one bit except where the F_SEAL_WRITE behavior differs
> from F_SEAL_FUTURE_WRITE.

This could plausibly confuse existing users that read the seal mask.
