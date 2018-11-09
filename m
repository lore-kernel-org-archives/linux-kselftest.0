From: gorcunov@gmail.com (Cyrill Gorcunov)
Date: Fri, 9 Nov 2018 22:39:36 +0300
Subject: [PATCH] proc: fix and merge proc-self-map-file tests
In-Reply-To: <1541789329.305173.1571657968.7229F301@webmail.messagingengine.com>
References: <20181108111105.GC13195@uranus.lan>
 <20181109113036.21512-1-rafael.tinoco@linaro.org>
 <20181109114123.GK13195@uranus.lan>
 <1541763936.3280758.1571224480.76F1EF1C@webmail.messagingengine.com>
 <20181109114850.GL13195@uranus.lan>
 <1541764873.3286172.1571234624.727F6284@webmail.messagingengine.com>
 <20181109180407.GO13195@uranus.lan>
 <1541789329.305173.1571657968.7229F301@webmail.messagingengine.com>
Message-ID: <20181109193936.GP13195@uranus.lan>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181109193936.0UcqpWshEyvftPe68aVJXu8Ivk92er9_7lcZNzTERCo@z>

On Fri, Nov 09, 2018@04:48:49PM -0200, Rafael David Tinoco wrote:
> 
> let me see if I got this right.. the premise for this test is to have *at least*
> 2 vmas, so we can check if the symlink for the mem range, describing the mapped
> area, is correct in procfs files, correct ? if yes, then why to have a totally
> duplicated test... just to check if mmap(0, ... MAP_FIXED ...) would work ?
> 
> Wouldn't exist a better place to have such test ? like in
> tools/testing/selftests/vm/mmap-null.c or something like it ?  genuine
> curiosity.. thinking i'm missing something about this test...

Ah, I happen to miss that they are identical except nil address. Then
true, vm/ looks like more suitable place for that. Do you happen to
know which exactly archs reserve first page (together with x86)?
