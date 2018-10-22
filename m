From: joel at joelfernandes.org (Joel Fernandes)
Date: Mon, 22 Oct 2018 16:49:06 -0700
Subject: [PATCH v3 1/2] mm: Add an F_SEAL_FUTURE_WRITE seal to memfd
In-Reply-To: <20181018065908.254389-1-joel@joelfernandes.org>
References: <20181018065908.254389-1-joel@joelfernandes.org>
Message-ID: <20181022234906.GA22110@joelaf.mtv.corp.google.com>

On Wed, Oct 17, 2018 at 11:59:07PM -0700, Joel Fernandes (Google) wrote:
> Android uses ashmem for sharing memory regions. We are looking forward
> to migrating all usecases of ashmem to memfd so that we can possibly
> remove the ashmem driver in the future from staging while also
> benefiting from using memfd and contributing to it. Note staging drivers
> are also not ABI and generally can be removed at anytime.
> 
> One of the main usecases Android has is the ability to create a region
> and mmap it as writeable, then add protection against making any
> "future" writes while keeping the existing already mmap'ed
> writeable-region active.  This allows us to implement a usecase where
> receivers of the shared memory buffer can get a read-only view, while
> the sender continues to write to the buffer.
> See CursorWindow documentation in Android for more details:
> https://developer.android.com/reference/android/database/CursorWindow
> 
> This usecase cannot be implemented with the existing F_SEAL_WRITE seal.
> To support the usecase, this patch adds a new F_SEAL_FUTURE_WRITE seal
> which prevents any future mmap and write syscalls from succeeding while
> keeping the existing mmap active. The following program shows the seal
> working in action:
> 
>  #include <stdio.h>
>  #include <errno.h>
>  #include <sys/mman.h>
>  #include <linux/memfd.h>
>  #include <linux/fcntl.h>
>  #include <asm/unistd.h>
>  #include <unistd.h>
>  #define F_SEAL_FUTURE_WRITE 0x0010
>  #define REGION_SIZE (5 * 1024 * 1024)
> 
> int memfd_create_region(const char *name, size_t size)
> {
>     int ret;
>     int fd = syscall(__NR_memfd_create, name, MFD_ALLOW_SEALING);
>     if (fd < 0) return fd;
>     ret = ftruncate(fd, size);
>     if (ret < 0) { close(fd); return ret; }
>     return fd;
> }
> 
> int main() {
>     int ret, fd;
>     void *addr, *addr2, *addr3, *addr1;
>     ret = memfd_create_region("test_region", REGION_SIZE);
>     printf("ret=%d\n", ret);
>     fd = ret;
> 
>     // Create map
>     addr = mmap(0, REGION_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
>     if (addr == MAP_FAILED)
> 	    printf("map 0 failed\n");
>     else
> 	    printf("map 0 passed\n");
> 
>     if ((ret = write(fd, "test", 4)) != 4)
> 	    printf("write failed even though no future-write seal "
> 		   "(ret=%d errno =%d)\n", ret, errno);
>     else
> 	    printf("write passed\n");
> 
>     addr1 = mmap(0, REGION_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
>     if (addr1 == MAP_FAILED)
> 	    perror("map 1 prot-write failed even though no seal\n");
>     else
> 	    printf("map 1 prot-write passed as expected\n");
> 
>     ret = fcntl(fd, F_ADD_SEALS, F_SEAL_FUTURE_WRITE |
> 				 F_SEAL_GROW |
> 				 F_SEAL_SHRINK);
>     if (ret == -1)
> 	    printf("fcntl failed, errno: %d\n", errno);
>     else
> 	    printf("future-write seal now active\n");
> 
>     if ((ret = write(fd, "test", 4)) != 4)
> 	    printf("write failed as expected due to future-write seal\n");
>     else
> 	    printf("write passed (unexpected)\n");
> 
>     addr2 = mmap(0, REGION_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
>     if (addr2 == MAP_FAILED)
> 	    perror("map 2 prot-write failed as expected due to seal\n");
>     else
> 	    printf("map 2 passed\n");
> 
>     addr3 = mmap(0, REGION_SIZE, PROT_READ, MAP_SHARED, fd, 0);
>     if (addr3 == MAP_FAILED)
> 	    perror("map 3 failed\n");
>     else
> 	    printf("map 3 prot-read passed as expected\n");
> }
> 
> The output of running this program is as follows:
> ret=3
> map 0 passed
> write passed
> map 1 prot-write passed as expected
> future-write seal now active
> write failed as expected due to future-write seal
> map 2 prot-write failed as expected due to seal
> : Permission denied
> map 3 prot-read passed as expected
> 
> Cc: jreck at google.com
> Cc: john.stultz at linaro.org
> Cc: tkjos at google.com
> Cc: gregkh at linuxfoundation.org
> Cc: hch at infradead.org
> Reviewed-by: John Stultz <john.stultz at linaro.org>
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>

Apologies for the follow-up. Now that merge window has opened, just checking
if this patch (which IMO has been beaten to death) can make it for 4.20?  Its
pretty much completed and is well tested at this point (tests are in 2/2).
Then I can move onto other memfd enhancements I'm planning.

thanks,

 - Joel
