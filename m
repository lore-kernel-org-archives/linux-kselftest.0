From: adobriyan@gmail.com (Alexey Dobriyan)
Date: Sat, 10 Nov 2018 20:47:27 +0300
Subject: [PATCH] proc: fix and merge proc-self-map-file tests
In-Reply-To: <20181109113036.21512-1-rafael.tinoco@linaro.org>
References: <20181108111105.GC13195@uranus.lan>
 <20181109113036.21512-1-rafael.tinoco@linaro.org>
Message-ID: <20181110174727.GA26417@avx2>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181110174727.3JqsUQeQ_mRxu0lBf-_3n1PVDB_8K1I-juAU5BhDBmU@z>

On Fri, Nov 09, 2018@09:30:36AM -0200, Rafael David Tinoco wrote:
> Merge proc-self-map-files tests into one since this test should focus in
> testing readlink in /proc/self/map_files/* only, and not trying to test
> mapping virtual address 0.
> 
> Lowest virtual address for user space mapping in other architectures,
> like arm, is *at least* *(PAGE_SIZE * 2) and NULL hint does not
> guarantee that when MAP_FIXED flag, important to this test, is given.
> This patch also fixes this issue in remaining test.

> -	p = mmap(NULL, PAGE_SIZE, PROT_NONE, MAP_PRIVATE|MAP_FILE, fd, 0);
> +	p = mmap((void *) (2 * PAGE_SIZE), PAGE_SIZE, PROT_NONE,

I don't know ARM. Is this 2 page limitation a limitation of hardware or
kernel's?
