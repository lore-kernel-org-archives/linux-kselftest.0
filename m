From: joel at joelfernandes.org (Joel Fernandes)
Date: Tue, 9 Oct 2018 15:34:11 -0700
Subject: [PATCH v2 2/2] selftests/memfd: Add tests for F_SEAL_FS_WRITE seal
In-Reply-To: <20181009222042.9781-2-joel@joelfernandes.org>
References: <20181009222042.9781-1-joel@joelfernandes.org>
 <20181009222042.9781-2-joel@joelfernandes.org>
Message-ID: <20181009223411.GA13848@joelaf.mtv.corp.google.com>

On Tue, Oct 09, 2018 at 03:20:42PM -0700, Joel Fernandes (Google) wrote:
> Add tests to verify sealing memfds with the F_SEAL_FS_WRITE works as
> expected.
> 
> Cc: dancol at google.com
> Cc: minchan at google.com
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> ---
>  tools/testing/selftests/memfd/memfd_test.c | 51 +++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
> index 10baa1652fc2..4bd2b6c87bb4 100644
> --- a/tools/testing/selftests/memfd/memfd_test.c
> +++ b/tools/testing/selftests/memfd/memfd_test.c
> @@ -27,7 +27,7 @@
>  
>  #define MFD_DEF_SIZE 8192
>  #define STACK_SIZE 65536
> -
> +#define F_SEAL_FS_WRITE         0x0010
>  /*
>   * Default is not to test hugetlbfs
>   */
> @@ -170,6 +170,24 @@ static void *mfd_assert_mmap_shared(int fd)
>  	return p;
>  }
>  
> +static void *mfd_fail_mmap_shared(int fd)
> +{
> +	void *p;
> +
> +	p = mmap(NULL,
> +		 mfd_def_size,
> +		 PROT_READ | PROT_WRITE,
> +		 MAP_SHARED,
> +		 fd,
> +		 0);
> +	if (p != MAP_FAILED) {
> +		printf("mmap() didn't fail as expected\n");
> +		abort();
> +	}
> +
> +	return p;
> +}
> +

Ah, this function is unused. I wrote it initially and used it but then
figured I didn't need it, and then forgot to remove it. It does not affect
the correctness of the patch. Anyway below is the updated patch.

thanks,

- Joel

------8<-----

From: "Joel Fernandes (Google)" <joel at joelfernandes.org>
Subject: [PATCH v2.1] selftests/memfd: Add tests for F_SEAL_FS_WRITE seal

Add tests to verify sealing memfds with the F_SEAL_FS_WRITE works as
expected.

Cc: dancol at google.com
Cc: minchan at kernel.org
Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 tools/testing/selftests/memfd/memfd_test.c | 33 +++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
index 10baa1652fc2..d074de568ba0 100644
--- a/tools/testing/selftests/memfd/memfd_test.c
+++ b/tools/testing/selftests/memfd/memfd_test.c
@@ -27,7 +27,7 @@
 
 #define MFD_DEF_SIZE 8192
 #define STACK_SIZE 65536
-
+#define F_SEAL_FS_WRITE         0x0010
 /*
  * Default is not to test hugetlbfs
  */
@@ -692,6 +692,36 @@ static void test_seal_write(void)
 	close(fd);
 }
 
+/*
+ * Test SEAL_WRITE
+ * Test whether SEAL_WRITE actually prevents modifications.
+ */
+static void test_seal_fs_write(void)
+{
+	int fd;
+	void *p;
+
+	printf("%s SEAL-FS-WRITE\n", memfd_str);
+
+	fd = mfd_assert_new("kern_memfd_seal_fs_write",
+			    mfd_def_size,
+			    MFD_CLOEXEC | MFD_ALLOW_SEALING);
+
+	p = mfd_assert_mmap_shared(fd);
+
+	/* FS_WRITE seal can be added even with existing
+	 * writeable mappings */
+	mfd_assert_has_seals(fd, 0);
+	mfd_assert_add_seals(fd, F_SEAL_FS_WRITE);
+	mfd_assert_has_seals(fd, F_SEAL_FS_WRITE);
+
+	mfd_assert_read(fd);
+	mfd_fail_write(fd);
+
+	munmap(p, mfd_def_size);
+	close(fd);
+}
+
 /*
  * Test SEAL_SHRINK
  * Test whether SEAL_SHRINK actually prevents shrinking
@@ -945,6 +975,7 @@ int main(int argc, char **argv)
 	test_basic();
 
 	test_seal_write();
+	test_seal_fs_write();
 	test_seal_shrink();
 	test_seal_grow();
 	test_seal_resize();
-- 
2.19.0.605.g01d371f741-goog
