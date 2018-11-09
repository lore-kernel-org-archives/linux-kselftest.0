From: gorcunov@gmail.com (Cyrill Gorcunov)
Date: Fri, 9 Nov 2018 14:41:23 +0300
Subject: [PATCH] proc: fix and merge proc-self-map-file tests
In-Reply-To: <20181109113036.21512-1-rafael.tinoco@linaro.org>
References: <20181108111105.GC13195@uranus.lan>
 <20181109113036.21512-1-rafael.tinoco@linaro.org>
Message-ID: <20181109114123.GK13195@uranus.lan>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181109114123.73fKrMU8VVeUWCEqtGiGsInkvDQ4_LB1Zmc0f2-d8jM@z>

On Fri, Nov 09, 2018@09:30:36AM -0200, Rafael David Tinoco wrote:
> Merge proc-self-map-files tests into one since this test should focus in
> testing readlink in /proc/self/map_files/* only, and not trying to test
> mapping virtual address 0.
> 
> Lowest virtual address for user space mapping in other architectures,
> like arm, is *at least* *(PAGE_SIZE * 2) and NULL hint does not
> guarantee that when MAP_FIXED flag, important to this test, is given.
> This patch also fixes this issue in remaining test.
> 
> Link: https://bugs.linaro.org/show_bug.cgi?id=3782
> Signed-off-by: Rafael David Tinoco <rafael.tinoco at linaro.org>

Wait, Rafael. But we will loose the test of mapping virtual address 0
then. I though you would move testing of virtual address 0 into
a separate testcase. I mean testing of first page was a positive
side effect of the former Alexey's patch, so we definitely should
keep it on x86 at least. Gimme some time I'll try to address it
today evening or tomorrow. I think this way everybody will be
happy: procfs get passed on arm32 and x86 will still have first
page testing.
