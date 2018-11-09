From: rafael.tinoco at linaro.org (Rafael David Tinoco)
Date: Fri, 09 Nov 2018 10:01:13 -0200
Subject: [PATCH] proc: fix and merge proc-self-map-file tests
In-Reply-To: <20181109114850.GL13195@uranus.lan>
References: <20181108111105.GC13195@uranus.lan>
 <20181109113036.21512-1-rafael.tinoco@linaro.org>
 <20181109114123.GK13195@uranus.lan>
 <1541763936.3280758.1571224480.76F1EF1C@webmail.messagingengine.com>
 <20181109114850.GL13195@uranus.lan>
Message-ID: <1541764873.3286172.1571234624.727F6284@webmail.messagingengine.com>

On Fri, Nov 9, 2018, at 9:48 AM, Cyrill Gorcunov wrote:
> On Fri, Nov 09, 2018 at 09:45:36AM -0200, Rafael David Tinoco wrote:
> ...
> > > today evening or tomorrow. I think this way everybody will be
> > > happy: procfs get passed on arm32 and x86 will still have first
> > > page testing.
> > 
> > Ohh, my understanding was that this was going to be addressed in some other test,
> > like what you said.. I did not understand you wanted me to create a test for
> > it altogether, my bad. I can do it if you want, let me know, pls.
> 
> :-) I'll be able to create patch and test in about 10 hours, so
> feel free to beat me if you have time meanwhile.

Alright, I'm fixing membarrier_test before, so.. I guess we have a competition.. =o)
