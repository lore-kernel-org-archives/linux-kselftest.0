From: dima@arista.com (Dmitry Safonov)
Date: Thu, 02 Aug 2018 01:29:06 +0100
Subject: [PATCH] mm/selftest: Add MAP_POPULATE test
In-Reply-To: <20180801171224.562aa07efc6b1612d6d6b23f@linux-foundation.org>
References: <20180801233636.29354-1-dima@arista.com>
 <20180801171224.562aa07efc6b1612d6d6b23f@linux-foundation.org>
Message-ID: <1533169746.2679.130.camel@arista.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180802002906.QkVm56my1yqMf7sAhndqrfxAQMOsmjYOKUuKywOcc6Q@z>

On Wed, 2018-08-01@17:12 -0700, Andrew Morton wrote:
> On Thu,  2 Aug 2018 00:36:36 +0100 Dmitry Safonov <dima at arista.com>
> wrote:
> 
> > As many other projects, we use some shmalloc allocator.
> > At some point we need to make a part of allocated pages back
> > private to
> > process. And it should be populated straight away.
> > Check that (MAP_PRIVATE | MAP_POPULATE) actually copies the private
> > page.
> > 
> > ...
> > 
> > --- /dev/null
> > +++ b/tools/testing/selftests/vm/map_populate.c
> > 
> > ...
> > 
> > +#define BUG_ON(condition, description)				
> > 	\
> > +	do {							
> > 	\
> > +		if (condition) {					
> > \
> > +			fprintf(stderr, "[FAIL]\t%s:%d\t%s:%s\n",
> > __func__, \
> > +				__LINE__, (description),
> > strerror(errno)); \
> > +			exit(1);					
> > \
> > +		}							
> > \
> > +	} while (0)
> 
> This is userspace.   Why not use assert()?

I wanted to print errno too. Of cause it's possible to get it from
coredump - but I think it's easier if you get buildbot reply to see
what the error is from the log.

> 
> > 
> > ...
> > 
> > +int main(int argc, char **argv)
> > +{
> > +	int sock[2], child, ret;
> > +	FILE *ftmp;
> > +	unsigned long *smap;
> > +
> > +	ftmp = tmpfile();
> 
> Seems odd to putz around with stdio when you just want the fd. 
> mkstemp(), maybe?

It needs a template and unlink() call.. I can do it.
I initially thought about memfd_create(), can change it that way.
The only downside is that it will be syscall(NR_memfd_create,...)

> 
> > +	BUG_ON(ftmp == 0, "tmpfile()");
> > +
> > +	ret = ftruncate(fileno(ftmp), MMAP_SZ);
> > +	BUG_ON(ret, "ftruncate()");
> > +
> > +	smap = mmap(0, MMAP_SZ, PROT_READ | PROT_WRITE,
> > +			MAP_SHARED, fileno(ftmp), 0);
> > +	BUG_ON(smap == MAP_FAILED, "mmap()");
> > +
> > +	*smap = 0xdeadbabe;
> > +	/* Probably unnecessary, but let it be. */
> > +	ret = msync(smap, MMAP_SZ, MS_SYNC);
> > +	BUG_ON(ret, "msync()");
> > +
> > +	ret = socketpair(PF_LOCAL, SOCK_SEQPACKET, 0, sock);
> > +	BUG_ON(ret, "socketpair()");
> > +
> > +	child = fork();
> > +	BUG_ON(child == -1, "fork()");
> > +
> > +	if (child) {
> > +		ret = close(sock[0]);
> > +		BUG_ON(ret, "close()");
> > +
> > +		return parent_f(sock[1], smap, child);
> > +	}
> > +
> > +	ret = close(sock[1]);
> > +	BUG_ON(ret, "close()");
> > +
> > +	return child_f(sock[0], smap, fileno(ftmp));
> > +}
> > 
> > ...
> > 
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
