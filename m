From: catalin.marinas@arm.com (Catalin Marinas)
Date: Wed, 22 May 2019 15:16:12 +0100
Subject: [PATCH v15 17/17] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
In-Reply-To: <e31d9364eb0c2eba8ce246a558422e811d82d21b.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <e31d9364eb0c2eba8ce246a558422e811d82d21b.1557160186.git.andreyknvl@google.com>
Message-ID: <20190522141612.GA28122@arrakis.emea.arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190522141612.p9Rb9qJgapiMpVTTZhGvNpsqcKEHBmCqjHSavnWExN0@z>

On Mon, May 06, 2019@06:31:03PM +0200, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
> 
> This patch adds a simple test, that calls the uname syscall with a
> tagged user pointer as an argument. Without the kernel accepting tagged
> user pointers the test fails with EFAULT.

That's probably sufficient for a simple example. Something we could add
to Documentation maybe is a small library that can be LD_PRELOAD'ed so
that you can run a lot more tests like LTP.

We could add this to selftests but I think it's too glibc specific.

--------------------8<------------------------------------
#include <stdlib.h>

#define TAG_SHIFT	(56)
#define TAG_MASK	(0xffUL << TAG_SHIFT)

void *__libc_malloc(size_t size);
void __libc_free(void *ptr);
void *__libc_realloc(void *ptr, size_t size);
void *__libc_calloc(size_t nmemb, size_t size);

static void *tag_ptr(void *ptr)
{
	unsigned long tag = rand() & 0xff;
	if (!ptr)
		return ptr;
	return (void *)((unsigned long)ptr | (tag << TAG_SHIFT));
}

static void *untag_ptr(void *ptr)
{
	return (void *)((unsigned long)ptr & ~TAG_MASK);
}

void *malloc(size_t size)
{
	return tag_ptr(__libc_malloc(size));
}

void free(void *ptr)
{
	__libc_free(untag_ptr(ptr));
}

void *realloc(void *ptr, size_t size)
{
	return tag_ptr(__libc_realloc(untag_ptr(ptr), size));
}

void *calloc(size_t nmemb, size_t size)
{
	return tag_ptr(__libc_calloc(nmemb, size));
}
