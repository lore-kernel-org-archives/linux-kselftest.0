From: joel at joelfernandes.org (Joel Fernandes (Google))
Date: Tue,  9 Oct 2018 15:20:41 -0700
Subject: [PATCH v2 1/2] mm: Add an F_SEAL_FS_WRITE seal to memfd
Message-ID: <20181009222042.9781-1-joel@joelfernandes.org>

Android uses ashmem for sharing memory regions. We are looking forward
to migrating all usecases of ashmem to memfd so that we can possibly
remove the ashmem driver in the future from staging while also
benefiting from using memfd and contributing to it. Note staging drivers
are also not ABI and generally can be removed at anytime.

One of the main usecases Android has is the ability to create a region
and mmap it as writeable, then drop its protection for "future" writes
while keeping the existing already mmap'ed writeable-region active.
This allows us to implement a usecase where receivers of the shared
memory buffer can get a read-only view, while the sender continues to
write to the buffer. See CursorWindow in Android for more details:
https://developer.android.com/reference/android/database/CursorWindow

This usecase cannot be implemented with the existing F_SEAL_WRITE seal.
To support the usecase, this patch adds a new F_SEAL_FS_WRITE seal which
prevents any future mmap and write syscalls from succeeding while
keeping the existing mmap active. The following program shows the seal
working in action:

int main() {
    int ret, fd;
    void *addr, *addr2, *addr3, *addr1;
    ret = memfd_create_region("test_region", REGION_SIZE);
    printf("ret=%d\n", ret);
    fd = ret;

    // Create map
    addr = mmap(0, REGION_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
    if (addr == MAP_FAILED)
	    printf("map 0 failed\n");
    else
	    printf("map 0 passed\n");

    if ((ret = write(fd, "test", 4)) != 4)
	    printf("write failed even though no fs-write seal "
		   "(ret=%d errno =%d)\n", ret, errno);
    else
	    printf("write passed\n");

    addr1 = mmap(0, REGION_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
    if (addr1 == MAP_FAILED)
	    perror("map 1 prot-write failed even though no seal\n");
    else
	    printf("map 1 prot-write passed as expected\n");

    ret = fcntl(fd, F_ADD_SEALS, F_SEAL_FS_WRITE);
    if (ret == -1)
	    printf("fcntl failed, errno: %d\n", errno);
    else
	    printf("fs-write seal now active\n");

    if ((ret = write(fd, "test", 4)) != 4)
	    printf("write failed as expected due to fs-write seal\n");
    else
	    printf("write passed (unexpected)\n");

    addr2 = mmap(0, REGION_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
    if (addr2 == MAP_FAILED)
	    perror("map 2 prot-write failed as expected due to seal\n");
    else
	    printf("map 2 passed\n");

    addr3 = mmap(0, REGION_SIZE, PROT_READ, MAP_SHARED, fd, 0);
    if (addr3 == MAP_FAILED)
	    perror("map 3 failed\n");
    else
	    printf("map 3 prot-read passed as expected\n");
}

The output of running this program is as follows:
ret=3
map 0 passed
write passed
map 1 prot-write passed as expected
fs-write seal now active
write failed as expected due to fs-write seal
map 2 prot-write failed as expected due to seal
: Permission denied
map 3 prot-read passed as expected

Note: This seal will also prevent growing and shrinking of the memfd.
This is not something we do in Android so it does not affect us, however
I have mentioned this behavior of the seal in the manpage.

Cc: jreck at google.com
Cc: john.stultz at linaro.org
Cc: tkjos at google.com
Cc: gregkh at linuxfoundation.org
Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
v1->v2: No change, just added selftests to the series. manpages are
ready and I'll submit them once the patches are accepted.

 include/uapi/linux/fcntl.h | 1 +
 mm/memfd.c                 | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
index c98312fa78a5..fe44a2035edf 100644
--- a/include/uapi/linux/fcntl.h
+++ b/include/uapi/linux/fcntl.h
@@ -41,6 +41,7 @@
 #define F_SEAL_SHRINK	0x0002	/* prevent file from shrinking */
 #define F_SEAL_GROW	0x0004	/* prevent file from growing */
 #define F_SEAL_WRITE	0x0008	/* prevent writes */
+#define F_SEAL_FS_WRITE	0x0010  /* prevent all write-related syscalls */
 /* (1U << 31) is reserved for signed error codes */
 
 /*
diff --git a/mm/memfd.c b/mm/memfd.c
index 27069518e3c5..9b8855b80de9 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -150,7 +150,8 @@ static unsigned int *memfd_file_seals_ptr(struct file *file)
 #define F_ALL_SEALS (F_SEAL_SEAL | \
 		     F_SEAL_SHRINK | \
 		     F_SEAL_GROW | \
-		     F_SEAL_WRITE)
+		     F_SEAL_WRITE | \
+		     F_SEAL_FS_WRITE)
 
 static int memfd_add_seals(struct file *file, unsigned int seals)
 {
@@ -219,6 +220,9 @@ static int memfd_add_seals(struct file *file, unsigned int seals)
 		}
 	}
 
+	if ((seals & F_SEAL_FS_WRITE) && !(*file_seals & F_SEAL_FS_WRITE))
+		file->f_mode &= ~(FMODE_WRITE | FMODE_PWRITE);
+
 	*file_seals |= seals;
 	error = 0;
 
-- 
2.19.0.605.g01d371f741-goog
