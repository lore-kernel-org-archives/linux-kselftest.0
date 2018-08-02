From: akpm@linux-foundation.org (Andrew Morton)
Date: Wed, 1 Aug 2018 17:12:24 -0700
Subject: [PATCH] mm/selftest: Add MAP_POPULATE test
In-Reply-To: <20180801233636.29354-1-dima@arista.com>
References: <20180801233636.29354-1-dima@arista.com>
Message-ID: <20180801171224.562aa07efc6b1612d6d6b23f@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180802001224.ArBOz5qdpjAzXhj_Pe8d29JML8dT7FKJ9VzIkL-0vbg@z>

On Thu,  2 Aug 2018 00:36:36 +0100 Dmitry Safonov <dima@arista.com> wrote:

> As many other projects, we use some shmalloc allocator.
> At some point we need to make a part of allocated pages back private to
> process. And it should be populated straight away.
> Check that (MAP_PRIVATE | MAP_POPULATE) actually copies the private page.
> 
> ...
>
> --- /dev/null
> +++ b/tools/testing/selftests/vm/map_populate.c
>
> ...
>
> +#define BUG_ON(condition, description)					\
> +	do {								\
> +		if (condition) {					\
> +			fprintf(stderr, "[FAIL]\t%s:%d\t%s:%s\n", __func__, \
> +				__LINE__, (description), strerror(errno)); \
> +			exit(1);					\
> +		}							\
> +	} while (0)

This is userspace.   Why not use assert()?

>
> ...
>
> +int main(int argc, char **argv)
> +{
> +	int sock[2], child, ret;
> +	FILE *ftmp;
> +	unsigned long *smap;
> +
> +	ftmp = tmpfile();

Seems odd to putz around with stdio when you just want the fd. 
mkstemp(), maybe?

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
>
> ...
>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
