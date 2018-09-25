From: jerry.hoemann@hpe.com (Jerry Hoemann)
Date: Tue, 25 Sep 2018 10:09:42 -0600
Subject: [PATCH] selftests: watchdog: Add gettimeout and get|set pretimeout
In-Reply-To: <f8616e56-004a-e296-0f84-8ebd019ad027@kernel.org>
References: <1537570526-65241-1-git-send-email-jerry.hoemann@hpe.com>
 <0c6376ec-a3f4-7798-8f30-829480c41f79@kernel.org>
 <20180924014750.GA22296@anatevka.americas.hpqcorp.net>
 <1c4e6b40-dc4e-5706-0a31-1741ba19ca09@kernel.org>
 <f8616e56-004a-e296-0f84-8ebd019ad027@kernel.org>
Message-ID: <20180925160942.GA25620@anatevka.americas.hpqcorp.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180925160942.CvbMgCCl9hIn3Uj5hPtApnyJF99m0UDA3MNW3MmZqic@z>

On Tue, Sep 25, 2018@09:50:18AM -0600, Shuah Khan wrote:
> >>> Also can you run this test as normal user?
> >>
> >> No.  Must be run as root to open /dev/watchdog.  When /dev/watchdog is opened, the
> >> WD is started and if not updated properly, the system will crash.
> > 
> > Hmm. I don't understand why the system would panic if non-root user can't open the
> > device, at least in the context of this test. 
> > 
> >         fd = open("/dev/watchdog", O_WRONLY);
> > 
> >         if (fd == -1) {
> >                 printf("Watchdog device not enabled.\n");
> >                 exit(-1);
> >         }
> > 
> > 
> > Shouldn't it just exit based on the code above?
> > 
> >>
> > 
> >> "cat /dev/watchdog" is one of my favorite ways to crash a system.  :)  :)
> > 
> > That doesn't sound great, if a non-root user can bring the system down!!
> >  
> 
> This got me concerned enough that I tried this with softdog. It behaved just
> the way I expected it.
> 
> cat /dev/watchdog
> cat: /dev/watchdog: Permission denied
> 
> Running the test as non-root does the following as per the current logic.
> 
> watchdog-test -b
> Watchdog device not enabled.
> 
> I think this logic could be improved to detect that a non-root user is running
> the test and print appropriate message.
> 
> However, I am not seeing the behavior you are describing that "cat /dev/watchdog"
> panics the syste. Did you mean running a root which is expected unless you terminate
> before the timeout? If you are seeing this as non-root user on you system, the
> watchdog driver could be suspect.
> 
> thanks,
> -- Shuah

Sorry, for misunderstanding.  Let me rephrase:

When you asked if the test can be run as a normal user::

No.  The test must be run as root to open /dev/watchdog as the permission
on /dev/watchdog allow only root to open it.  The reason that we only
allow root to open /dev/watchdog is that it is trivial to crash
the system.  Just open /dev/watchdog and don't update the watchdog.

One of my favorite ways to crash the system is to
as root "cat /dev/watchdog."




-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------
