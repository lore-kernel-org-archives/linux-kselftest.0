From: ahmedsoliman@mena.vt.edu (Ahmed Soliman)
Date: Thu, 15 Nov 2018 15:36:44 +0200
Subject: KVM selftests are failing
In-Reply-To: <20181115090203.5z25gwa2yznj6mmu@kamzik.brq.redhat.com>
References: <CANBxJ=EQOt1t=PkLsMvtfB2SbiLMPeGvFxB7SJXf7m3OkcionQ@mail.gmail.com>
 <20181114180807.6crs7awhvo26ldbr@hawk.localdomain>
 <CADYN=9Jh10guVNFfhS8XH+RwZAouLJQu7Svg4+Tz3rQDexzDkg@mail.gmail.com>
 <CANBxJ=G4xdF8ZOR4zyoX1edNa=jYxk1xrzoi+7Xgcqt9qDoM2w@mail.gmail.com>
 <CANBxJ=EB8izWM8iLd49Uvd1z1O-gLvkGmiKNHjfHifFohj2xbg@mail.gmail.com>
 <20181115090203.5z25gwa2yznj6mmu@kamzik.brq.redhat.com>
Message-ID:
 <CANBxJ=EHkuxKFoQw=K21o=9_FMhi_=on=Poq+ZF37eieoKV4zg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181115133644.2v7vFIBVAI1BquSx0iymwclbDTgFFc1ZKPUPxzJINMg@z>

Hello,

On Thu, Nov 15, 2018@11:02 AM Andrew Jones <drjones@redhat.com> wrote:
> I think you should be able to pre-compile the selftests and save them,
> and then bisect the kernel further back than their introduction. Actually
> you may want to simplify the test case to just a mmap/madvise pair and
> see if that reproduces, since kvm selftests doesn't do much more than
> that. (Other than all the /dev/kvm ioctls - you have the right perms
> on /dev/kvm, or are running as root, right?)
yes I have /dev/kvm permissions, but it shouldn't matter at the moment.

well I stripped the kvm self tests from most stuff and ended up with
simpler code
(sorry for spaces, I am using web interface to send this email)


#include <stdio.h>
#include <sys/mman.h>
#include <string.h>
#include <errno.h>
static void *align(void *x, size_t size)
{
       size_t mask = size - 1;
       return (void *) (((size_t) x + mask) & ~mask);
}

int main(){

       int ret;
       void *mmap_start;
       void *host_mem;
       size_t length = 6291456;

       mmap_start = mmap(NULL, length, PROT_READ | PROT_WRITE,
                       MAP_PRIVATE | MAP_ANONYMOUS | 0, -1, 0);
       host_mem = align(mmap_start, 1);
       ret = madvise(host_mem, length, MADV_NOHUGEPAGE);
       printf("madvise returned: %d\nerrno: %d %s\n", ret, errno,
strerror(errno));
}

Now I couldn't find a single commit to bisect from, I checked 4.20,
4.19, 4.16, 4.10, 4.4 back to v3.18 tag
and None of the builds I attempted did work. All of the kernels returned:

madvise returned: -1
errno: 22 Invalid argument

and the strace logs looks like this:

mmap(NULL, 6291456, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x7f46ea2a1000
madvise(0x7f46ea2a1000, 6291456, MADV_NOHUGEPAGE) = -1 EINVAL (Invalid argument)

For comprehension, this is done on intel core i7-4500U CPU @ 1.80GHz

As for now I will comment the madvise line and the assert when writing
my own kvm self test. I think it wouldn't cause any trouble?, If it is
not the case, please let me know.

Thanks,

-- 
Ahmed
Junior Researcher, IoT and Cyber Security lab, SmartCI, Alexandria
University, & CIS @  VMI
