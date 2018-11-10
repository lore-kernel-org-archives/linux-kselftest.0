From: luto@amacapital.net (Andy Lutomirski)
Date: Fri, 9 Nov 2018 22:05:14 -0800
Subject: [PATCH v3 resend 1/2] mm: Add an F_SEAL_FUTURE_WRITE seal to memfd
In-Reply-To: <20181110032005.GA22238@google.com>
References: <20181108041537.39694-1-joel@joelfernandes.org>
 <CAG48ez1h=v-JYnDw81HaYJzOfrNhwYksxmc2r=cJvdQVgYM+NA@mail.gmail.com>
 <CAG48ez0kQ4d566bXTFOYANDgii-stL-Qj-oyaBzvfxdV=PU-7g@mail.gmail.com>
 <20181110032005.GA22238@google.com>
Message-ID: <69CE06CC-E47C-4992-848A-66EB23EE6C74@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181110060514.rBl0k7QN_Oh0ksNOm0g5s3XBdYVwgLMtRHa7wJE5jOk@z>



> On Nov 9, 2018,@7:20 PM, Joel Fernandes <joel@joelfernandes.org> wrote:
> 
>> On Fri, Nov 09, 2018@10:19:03PM +0100, Jann Horn wrote:
>>> On Fri, Nov 9, 2018@10:06 PM Jann Horn <jannh@google.com> wrote:
>>> On Fri, Nov 9, 2018 at 9:46 PM Joel Fernandes (Google)
>>> <joel@joelfernandes.org> wrote:
>>>> Android uses ashmem for sharing memory regions. We are looking forward
>>>> to migrating all usecases of ashmem to memfd so that we can possibly
>>>> remove the ashmem driver in the future from staging while also
>>>> benefiting from using memfd and contributing to it. Note staging drivers
>>>> are also not ABI and generally can be removed at anytime.
>>>> 
>>>> One of the main usecases Android has is the ability to create a region
>>>> and mmap it as writeable, then add protection against making any
>>>> "future" writes while keeping the existing already mmap'ed
>>>> writeable-region active.  This allows us to implement a usecase where
>>>> receivers of the shared memory buffer can get a read-only view, while
>>>> the sender continues to write to the buffer.
>>>> See CursorWindow documentation in Android for more details:
>>>> https://developer.android.com/reference/android/database/CursorWindow
>>>> 
>>>> This usecase cannot be implemented with the existing F_SEAL_WRITE seal.
>>>> To support the usecase, this patch adds a new F_SEAL_FUTURE_WRITE seal
>>>> which prevents any future mmap and write syscalls from succeeding while
>>>> keeping the existing mmap active.
>>> 
>>> Please CC linux-api@ on patches like this. If you had done that, I
>>> might have criticized your v1 patch instead of your v3 patch...
>>> 
>>>> The following program shows the seal
>>>> working in action:
>>> [...]
>>>> Cc: jreck at google.com
>>>> Cc: john.stultz at linaro.org
>>>> Cc: tkjos at google.com
>>>> Cc: gregkh at linuxfoundation.org
>>>> Cc: hch at infradead.org
>>>> Reviewed-by: John Stultz <john.stultz at linaro.org>
>>>> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
>>>> ---
>>> [...]
>>>> diff --git a/mm/memfd.c b/mm/memfd.c
>>>> index 2bb5e257080e..5ba9804e9515 100644
>>>> --- a/mm/memfd.c
>>>> +++ b/mm/memfd.c
>>> [...]
>>>> @@ -219,6 +220,25 @@ static int memfd_add_seals(struct file *file, unsigned int seals)
>>>>                }
>>>>        }
>>>> 
>>>> +       if ((seals & F_SEAL_FUTURE_WRITE) &&
>>>> +           !(*file_seals & F_SEAL_FUTURE_WRITE)) {
>>>> +               /*
>>>> +                * The FUTURE_WRITE seal also prevents growing and shrinking
>>>> +                * so we need them to be already set, or requested now.
>>>> +                */
>>>> +               int test_seals = (seals | *file_seals) &
>>>> +                                (F_SEAL_GROW | F_SEAL_SHRINK);
>>>> +
>>>> +               if (test_seals != (F_SEAL_GROW | F_SEAL_SHRINK)) {
>>>> +                       error = -EINVAL;
>>>> +                       goto unlock;
>>>> +               }
>>>> +
>>>> +               spin_lock(&file->f_lock);
>>>> +               file->f_mode &= ~(FMODE_WRITE | FMODE_PWRITE);
>>>> +               spin_unlock(&file->f_lock);
>>>> +       }
>>> 
>>> So you're fiddling around with the file, but not the inode? How are
>>> you preventing code like the following from re-opening the file as
>>> writable?
>>> 
>>> $ cat memfd.c
>>> #define _GNU_SOURCE
>>> #include <unistd.h>
>>> #include <sys/syscall.h>
>>> #include <printf.h>
>>> #include <fcntl.h>
>>> #include <err.h>
>>> #include <stdio.h>
>>> 
>>> int main(void) {
>>>  int fd = syscall(__NR_memfd_create, "testfd", 0);
>>>  if (fd == -1) err(1, "memfd");
>>>  char path[100];
>>>  sprintf(path, "/proc/self/fd/%d", fd);
>>>  int fd2 = open(path, O_RDWR);
>>>  if (fd2 == -1) err(1, "reopen");
>>>  printf("reopen successful: %d\n", fd2);
>>> }
>>> $ gcc -o memfd memfd.c
>>> $ ./memfd
>>> reopen successful: 4
>>> $
>>> 
>>> That aside: I wonder whether a better API would be something that
>>> allows you to create a new readonly file descriptor, instead of
>>> fiddling with the writability of an existing fd.
>> 
>> My favorite approach would be to forbid open() on memfds, hope that
>> nobody notices the tiny API break, and then add an ioctl for "reopen
>> this memfd with reduced permissions" - but that's just my personal
>> opinion.
> 
> I did something along these lines and it fixes the issue, but I forbid open
> of memfd only when the F_SEAL_FUTURE_WRITE seal is in place. So then its not
> an ABI break because this is a brand new seal. That seems the least intrusive
> solution and it works. Do you mind testing it and I'll add your and Tested-by
> to the new fix? The patch is based on top of this series.
> 
> ---8<-----------
> From: "Joel Fernandes (Google)" <joel at joelfernandes.org>
> Subject: [PATCH] mm/memfd: Fix possible promotion to writeable of sealed memfd
> 
> Jann Horn found that reopening an F_SEAL_FUTURE_WRITE sealed memfd
> through /proc/self/fd/N symlink as writeable succeeds. The simplest fix
> without causing ABI breakages and ugly VFS hacks is to simply deny all
> opens on F_SEAL_FUTURE_WRITE sealed fds.
> 
> Reported-by: Jann Horn <jannh at google.com>
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> ---
> mm/shmem.c | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 446942677cd4..5b378c486b8f 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -3611,7 +3611,25 @@ static const struct address_space_operations shmem_aops = {
>    .error_remove_page = generic_error_remove_page,
> };
> 
> +/* Could arrive here for memfds opened through /proc/ */
> +int shmem_open(struct inode *inode, struct file *file)
> +{
> +    struct shmem_inode_info *info = SHMEM_I(inode);
> +
> +    /*
> +     * memfds for which future writes have been prevented
> +     * should not be reopened, say, through /proc/pid/fd/N
> +     * symlinks otherwise it can cause a sealed memfd to be
> +     * promoted to writable.
> +     */
> +    if (info->seals & F_SEAL_FUTURE_WRITE)
> +        return -EACCES;
> +
> +    return 0;
> +}

The result of this series is very warty. We have a concept of seals, and they all work similarly, except the new future write seal. That one:

- causes a probably-observable effect in the file mode in F_GETFL.

- causes reopen to fail.

- does *not* affect other struct files that may already exist on the same inode.

- mysteriously malfunctions if you try to set it again on another struct file that already exists

- probably is insecure when used on hugetlbfs.

I see two reasonable solutions:

1. Don’t fiddle with the struct file at all. Instead make the inode flag work by itself.

2. Don’t call it a “seal”.  Instead fix the /proc hole and add an API to drop write access on an existing struct file.

I personally prefer #2.

> +
> static const struct file_operations shmem_file_operations = {
> +    .open        = shmem_open,
>    .mmap        = shmem_mmap,
>    .get_unmapped_area = shmem_get_unmapped_area,
> #ifdef CONFIG_TMPFS
> -- 
> 2.19.1.930.g4563a0d9d0-goog
> 
