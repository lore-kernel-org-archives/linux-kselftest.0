From: shuah at kernel.org (Shuah Khan)
Date: Wed, 1 Aug 2018 18:02:27 -0600
Subject: [PATCH] mm/selftest: Add MAP_POPULATE test
In-Reply-To: <20180801233636.29354-1-dima@arista.com>
References: <20180801233636.29354-1-dima@arista.com>
Message-ID: <84c3da30-f4fc-b82a-e8fc-49e365e4ac50@kernel.org>

Hi Dmitry,

Thanks for the test. A few comments below.

On 08/01/2018 05:36 PM, Dmitry Safonov wrote:
> As many other projects, we use some shmalloc allocator.
> At some point we need to make a part of allocated pages back private to
> process. And it should be populated straight away.
> Check that (MAP_PRIVATE | MAP_POPULATE) actually copies the private page.

It is not clear from this commit log what this test is doing? It would
be helpful to rephrase.

"MAP_POPULATE | MAP_PRIVATE memory maps should COW VMA pages. This test is
for verifying that it does" something along the lines??

> 
> Cc: Andrew Morton <akpm at linux-foundation.org>
> Cc: Dmitry Safonov <0x7f454c46 at gmail.com>
> Cc: Hua Zhong <hzhong at arista.com>
> Cc: Shuah Khan <shuah at kernel.org>
> Cc: Stuart Ritchie <sritchie at arista.com>
> Cc: linux-kselftest at vger.kernel.org
> Signed-off-by: Dmitry Safonov <dima at arista.com>
> ---
>  tools/testing/selftests/vm/.gitignore     |   1 +
>  tools/testing/selftests/vm/Makefile       |   1 +
>  tools/testing/selftests/vm/map_populate.c | 113 ++++++++++++++++++++++++++++++
>  tools/testing/selftests/vm/run_vmtests    |  11 +++
>  4 files changed, 126 insertions(+)
>  create mode 100644 tools/testing/selftests/vm/map_populate.c
> 
> diff --git a/tools/testing/selftests/vm/.gitignore b/tools/testing/selftests/vm/.gitignore
> index 342c7bc9dc8c..af5ff83f6d7f 100644
> --- a/tools/testing/selftests/vm/.gitignore
> +++ b/tools/testing/selftests/vm/.gitignore
> @@ -1,6 +1,7 @@
>  hugepage-mmap
>  hugepage-shm
>  map_hugetlb
> +map_populate
>  thuge-gen
>  compaction_test
>  mlock2-tests
> diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
> index fdefa2295ddc..9881876d2aa0 100644
> --- a/tools/testing/selftests/vm/Makefile
> +++ b/tools/testing/selftests/vm/Makefile
> @@ -12,6 +12,7 @@ TEST_GEN_FILES += gup_benchmark
>  TEST_GEN_FILES += hugepage-mmap
>  TEST_GEN_FILES += hugepage-shm
>  TEST_GEN_FILES += map_hugetlb
> +TEST_GEN_FILES += map_populate
>  TEST_GEN_FILES += mlock-random-test
>  TEST_GEN_FILES += mlock2-tests
>  TEST_GEN_FILES += on-fault-limit
> diff --git a/tools/testing/selftests/vm/map_populate.c b/tools/testing/selftests/vm/map_populate.c
> new file mode 100644
> index 000000000000..df3eacc8eecb
> --- /dev/null
> +++ b/tools/testing/selftests/vm/map_populate.c
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 Dmitry Safonov, Arista Networks
> + *
> + * MAP_POPULATE | MAP_PRIVATE should COW VMA pages.
> + */
> +
> +#define _GNU_SOURCE
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <sys/mman.h>
> +#include <sys/socket.h>
> +#include <sys/types.h>
> +#include <sys/wait.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#ifndef MMAP_SZ
> +#define MMAP_SZ		4096
> +#endif
> +
> +#define BUG_ON(condition, description)					\
> +	do {								\
> +		if (condition) {					\
> +			fprintf(stderr, "[FAIL]\t%s:%d\t%s:%s\n", __func__, \
> +				__LINE__, (description), strerror(errno)); \
> +			exit(1);					\
> +		}							\
> +	} while (0)
> +
> +static int parent_f(int sock, unsigned long *smap, int child)
> +{
> +	int status, ret;
> +
> +	ret = read(sock, &status, sizeof(int));
> +	BUG_ON(ret <= 0, "read(sock)");
> +
> +	*smap = 0x22222BAD;
> +	ret = msync(smap, MMAP_SZ, MS_SYNC);
> +	BUG_ON(ret, "msync()");
> +
> +	ret = write(sock, &status, sizeof(int));
> +	BUG_ON(ret <= 0, "write(sock)");
> +
> +	waitpid(child, &status, 0);
> +	BUG_ON(!WIFEXITED(status), "child hasn't suicide by own will");

What does this mean? Could you rephrase this please?

> +
> +	return WEXITSTATUS(status);
> +}
> +
> +static int child_f(int sock, unsigned long *smap, int fd)
> +{
> +	int ret, buf = 0;
> +
> +	smap = mmap(0, MMAP_SZ, PROT_READ | PROT_WRITE,
> +			MAP_PRIVATE | MAP_POPULATE, fd, 0);
> +	BUG_ON(smap == MAP_FAILED, "mmap()");
> +
> +	BUG_ON(*smap != 0xdeadbabe, "MAP_PRIVATE | MAP_POPULATE changed file");

What is expected here? What is expected?

> +
> +	ret = write(sock, &buf, sizeof(int));
> +	BUG_ON(ret <= 0, "write(sock)");
> +
> +	ret = read(sock, &buf, sizeof(int));
> +	BUG_ON(ret <= 0, "read(sock)");
> +
> +	BUG_ON(*smap == 0x22222BAD, "MAP_POPULATE didn't COW private page");
> +	BUG_ON(*smap != 0xdeadbabe, "mapping was corrupted");
> +
> +	return 0;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	int sock[2], child, ret;
> +	FILE *ftmp;
> +	unsigned long *smap;
> +
> +	ftmp = tmpfile();
> +	BUG_ON(ftmp == 0, "tmpfile()");
> +
> +	ret = ftruncate(fileno(ftmp), MMAP_SZ);
> +	BUG_ON(ret, "ftruncate()");
> +
> +	smap = mmap(0, MMAP_SZ, PROT_READ | PROT_WRITE,
> +			MAP_SHARED, fileno(ftmp), 0);
> +	BUG_ON(smap == MAP_FAILED, "mmap()");
> +
> +	*smap = 0xdeadbabe;
> +	/* Probably unnecessary, but let it be. */
> +	ret = msync(smap, MMAP_SZ, MS_SYNC);
> +	BUG_ON(ret, "msync()");
> +
> +	ret = socketpair(PF_LOCAL, SOCK_SEQPACKET, 0, sock);
> +	BUG_ON(ret, "socketpair()");
> +
> +	child = fork();
> +	BUG_ON(child == -1, "fork()");
> +
> +	if (child) {
> +		ret = close(sock[0]);
> +		BUG_ON(ret, "close()");
> +
> +		return parent_f(sock[1], smap, child);
> +	}
> +
> +	ret = close(sock[1]);
> +	BUG_ON(ret, "close()");
> +
> +	return child_f(sock[0], smap, fileno(ftmp));
> +}
> diff --git a/tools/testing/selftests/vm/run_vmtests b/tools/testing/selftests/vm/run_vmtests
> index 88cbe5575f0c..584a91ae4a8f 100755
> --- a/tools/testing/selftests/vm/run_vmtests
> +++ b/tools/testing/selftests/vm/run_vmtests
> @@ -168,6 +168,17 @@ else
>  fi
>  
>  echo "--------------------"
> +echo "running map_populate"
> +echo "--------------------"
> +./map_populate
> +if [ $? -ne 0 ]; then
> +	echo "[FAIL]"
> +	exitcode=1
> +else
> +	echo "[PASS]"
> +fi
> +
> +echo "--------------------"
>  echo "running mlock2-tests"
>  echo "--------------------"
>  ./mlock2-tests
> 

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
