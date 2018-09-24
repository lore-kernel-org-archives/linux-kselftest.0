From: jerry.hoemann at hpe.com (Jerry Hoemann)
Date: Sun, 23 Sep 2018 19:47:50 -0600
Subject: [PATCH] selftests: watchdog: Add gettimeout and get|set pretimeout
In-Reply-To: <0c6376ec-a3f4-7798-8f30-829480c41f79@kernel.org>
References: <1537570526-65241-1-git-send-email-jerry.hoemann@hpe.com>
 <0c6376ec-a3f4-7798-8f30-829480c41f79@kernel.org>
Message-ID: <20180924014750.GA22296@anatevka.americas.hpqcorp.net>

On Fri, Sep 21, 2018 at 05:42:00PM -0600, Shuah Khan wrote:
> Hi Jerry,
> 
> Thanks for the patch. A few comments below:

  Replies inline.

> 
> On 09/21/2018 04:55 PM, Jerry Hoemann wrote:
> > Add command line arguments to call ioctl WDIOC_GETTIMEOUT,
> > WDIOC_GETPRETIMEOUT and WDIOC_SETPRETIMEOUT.
> > 
> > Signed-off-by: Jerry Hoemann <jerry.hoemann at hpe.com>
> > ---
> >  tools/testing/selftests/watchdog/watchdog-test.c | 30 +++++++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
> > index 6e29087..4861e2c 100644
> > --- a/tools/testing/selftests/watchdog/watchdog-test.c
> > +++ b/tools/testing/selftests/watchdog/watchdog-test.c
> > @@ -19,7 +19,7 @@
> >  
> >  int fd;
> >  const char v = 'V';
> > -static const char sopts[] = "bdehp:t:";
> > +static const char sopts[] = "bdehp:t:Tn:N";
> >  static const struct option lopts[] = {
> >  	{"bootstatus",          no_argument, NULL, 'b'},
> >  	{"disable",             no_argument, NULL, 'd'},
> > @@ -27,6 +27,9 @@
> >  	{"help",                no_argument, NULL, 'h'},
> >  	{"pingrate",      required_argument, NULL, 'p'},
> >  	{"timeout",       required_argument, NULL, 't'},
> > +	{"gettimeout",          no_argument, NULL, 'T'},
> > +	{"pretimeout",    required_argument, NULL, 'n'},
> > +	{"getpretimeout",       no_argument, NULL, 'N'},
> >  	{NULL,                  no_argument, NULL, 0x0}
> >  };
> >  
> > @@ -71,6 +74,9 @@ static void usage(char *progname)
> >  	printf(" -h, --help          Print the help message\n");
> >  	printf(" -p, --pingrate=P    Set ping rate to P seconds (default %d)\n", DEFAULT_PING_RATE);
> >  	printf(" -t, --timeout=T     Set timeout to T seconds\n");
> > +	printf(" -T, --gettimeout    Get the timeout\n");
> > +	printf(" -n, --pretimeout    Set the pretimeout to T seconds\n");
> > +	printf(" -N, --getpretimeout Get the pretimeout\n");
> 
> How are the new arguments used?

I forgot the param.  Should be:

    +	printf(" -n, --pretimeout=T  Set the pretimeout to T seconds\n");


I'll update in v2.

Is this what you mean?  Or did I misunderstand?


> 
> >  	printf("\n");
> >  	printf("Parameters are parsed left-to-right in real-time.\n");
> >  	printf("Example: %s -d -t 10 -p 5 -e\n", progname);
> 
> Please add an example usage for each of these new arguments.

Will do.

> 
> > @@ -135,6 +141,28 @@ int main(int argc, char *argv[])
> >  			else
> >  				printf("WDIOC_SETTIMEOUT errno '%s'\n", strerror(errno));
> >  			break;
> > +		case 'T':
> > +			ret = ioctl(fd, WDIOC_GETTIMEOUT, &flags);
> > +			if (!ret)
> > +				printf("Watchdog timeout set to %u seconds.\n", flags);
> 
> It would good to make this message different from the WDIOC_SETTIMEOUT message.
> Please update it to reflect that this is the result of a WDIOC_GETTIMEOUT.

Will update message to make distinct.

> 
> What would user intend to do with this GETTIMEOUT? Shouldn't this be the case that it
> prints the current value and exits instead of the same logic as SETTIMEOUT option?

Are you suggesting setting the "oneshot" flag so the test app doesn't actually
go into the while(1) keep_alive loop?

Watchdog drivers may adjust the requested value to match hardware constraints.
Callers of set timeout (and set pretimeout) should call get timeout to see what
value was actually set.

B/c of above, I just got into the habit of specifying both flags: first set,
then get to make sure value set was what I intended.

But I can make the "Get" a one shot.  Just let me know if this is your preference.


> 
> > +			else
> > +				printf("WDIOC_GETTIMEOUT errno '%s'\n", strerror(errno))
> 
> Shouldn't this error be an exit condition?

Hmmm, I don't see this error path much different than the error path for the
other failing ioctl.  Am I missing something?


But, If we make the "GET" a one shot, then we wouldn't really need to
special case the failure case as we wouldn't go into the keep_alive
loop in either case.



> 
> > +			break;
> > +		case 'n':
> > +			flags = strtoul(optarg, NULL, 0);
> > +			ret = ioctl(fd, WDIOC_SETPRETIMEOUT, &flags);
> > +			if (!ret)
> > +				printf("Watchdog pretimeout set to %u seconds.\n", flags);
> > +			else
> > +				printf("WDIOC_SETPRETIMEOUT errno '%s'\n", strerror(errno));
> > +			break;
> > +		case 'N':
> > +			ret = ioctl(fd, WDIOC_GETPRETIMEOUT, &flags);
> > +			if (!ret)
> > +				printf("Watchdog pretimeout set to %u seconds.\n", flags);
> 
> It would good to make this message different from the WDIOC_GETPRETIMEOUT message.
> Please update it to reflect that this is the result of a WDIOC_GETPRETIMEOUT

will do.

> 
> What would user intend to do with this GETTIMEOUT? Shouldn't this be the case that it
> prints the current value and exits instead of the same logic as WDIOC_SETPRETIMEOUT?

I think you're just asking me to set the "oneshot" flag on this,
which I can certainly do.

But, some background on pretimeout that (I think) is interesting:

The underling HW for the watchdog on proliants allows for the pre-timeout to
be enabled or disabled.  But if the pretimeout is enabled, the value of
the pretimeout is hard coded by HW (9 seconds.)

The hpwdt driver allows for setting pretimeout by passing in a value
	0 < pretimeout < timeout
to enable a pretimeout.  The user then needs to call get pretimeout to
determine the actual value.

Failure to take into account the pretimeout when pinging the WD can lead to
unexpected system crashes.

I've handled the following issue multiple times:

A user wants to set the timeout to value T and ping the WD every T/2 seconds.
He fails to take into account the pretimeout value of P.  The system crashes
with the pretimeout NMI when (T/2) < P.

The basic misunderstanding is that to prevent the WD from acting, the WD
only needs to be pinged at least once every T seconds, when in actuality the
WD needs to be pinged at least once every (T-P) seconds.

Specifically for Proliants, I've seen people set the timeout to 10 seconds
thinking they had plenty of time to ping the WD only to be surprised when
the pretimeout NMI takes the system down 1 second later.

Note: a WD doesn't need to support the pretimeout feature.

> 
> > +			else
> > +				printf("WDIOC_GETPRETIMEOUT errno '%s'\n", strerror(errno));
> 
> Shouldn't this error be an exit condition?

Similar to above.  I can make GETPRETIMEOUT a "oneshot" to handle both the
success/failing case of the ioctl call.

> 
> > +			break;
> >  		default:
> >  			usage(argv[0]);
> >  			goto end;
> > 
> 
> Also can you run this test as normal user?

No.  Must be run as root to open /dev/watchdog.  When /dev/watchdog is opened, the
WD is started and if not updated properly, the system will crash.

"cat /dev/watchdog" is one of my favorite ways to crash a system.  :)  :)

> 
> thanks,
> -- Shuah

-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------
