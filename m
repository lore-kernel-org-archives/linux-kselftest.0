From: rafael.tinoco@linaro.org (Rafael David Tinoco)
Date: Fri, 09 Nov 2018 09:45:36 -0200
Subject: [PATCH] proc: fix and merge proc-self-map-file tests
In-Reply-To: <20181109114123.GK13195@uranus.lan>
References: <20181108111105.GC13195@uranus.lan>
 <20181109113036.21512-1-rafael.tinoco@linaro.org>
 <20181109114123.GK13195@uranus.lan>
Message-ID:
 <1541763936.3280758.1571224480.76F1EF1C@webmail.messagingengine.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181109114536.bO2smg182nRlAOd2B3wFZKw1yYNUDKjngbr4dtOY-0c@z>

On Fri, Nov 9, 2018,@9:41 AM, Cyrill Gorcunov wrote:
> On Fri, Nov 09, 2018@09:30:36AM -0200, Rafael David Tinoco wrote:
> > Merge proc-self-map-files tests into one since this test should focus in
> > testing readlink in /proc/self/map_files/* only, and not trying to test
> > mapping virtual address 0.
> > 
> > Lowest virtual address for user space mapping in other architectures,
> > like arm, is *at least* *(PAGE_SIZE * 2) and NULL hint does not
> > guarantee that when MAP_FIXED flag, important to this test, is given.
> > This patch also fixes this issue in remaining test.
> > 
> > Link: https://bugs.linaro.org/show_bug.cgi?id=3782
> > Signed-off-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
> 
> Wait, Rafael. But we will loose the test of mapping virtual address 0
> then. I though you would move testing of virtual address 0 into
> a separate testcase. I mean testing of first page was a positive
> side effect of the former Alexey's patch, so we definitely should
> keep it on x86 at least. Gimme some time I'll try to address it
> today evening or tomorrow. I think this way everybody will be
> happy: procfs get passed on arm32 and x86 will still have first
> page testing.

Ohh, my understanding was that this was going to be addressed in some other test, like what you said.. I did not understand you wanted me to create a test for it altogether, my bad. I can do it if you want, let me know, pls.

Thanks!
