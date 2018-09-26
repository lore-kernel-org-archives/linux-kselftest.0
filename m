From: jerry.hoemann@hpe.com (Jerry Hoemann)
Date: Wed, 26 Sep 2018 10:29:20 -0600
Subject: [V2 PATCH] selftests: watchdog: Add gettimeout and get|set
 pretimeout
In-Reply-To: <16941ebb-85ca-ad4c-de7b-c26f193ca611@kernel.org>
References: <1537817767-78918-1-git-send-email-jerry.hoemann@hpe.com>
 <1537817767-78918-2-git-send-email-jerry.hoemann@hpe.com>
 <16941ebb-85ca-ad4c-de7b-c26f193ca611@kernel.org>
Message-ID: <20180926162920.GB3948@anatevka.americas.hpqcorp.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180926162920.PnjxR-bdvblrZoGprfvIiXpxFx_EwRaNjCyxn9MVvvo@z>

On Tue, Sep 25, 2018@02:51:15PM -0600, Shuah Khan wrote:
> Hi Jerry,
> 
> On 09/24/2018 01:36 PM, Jerry Hoemann wrote:
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
> > @@ -71,9 +74,13 @@ static void usage(char *progname)
> >  	printf(" -h, --help          Print the help message\n");
> >  	printf(" -p, --pingrate=P    Set ping rate to P seconds (default %d)\n", DEFAULT_PING_RATE);
> >  	printf(" -t, --timeout=T     Set timeout to T seconds\n");
> > +	printf(" -T, --gettimeout    Get the timeout\n");
> > +	printf(" -n, --pretimeout=T  Set the pretimeout to T seconds\n");
> > +	printf(" -N, --getpretimeout Get the pretimeout\n");
> >  	printf("\n");
> >  	printf("Parameters are parsed left-to-right in real-time.\n");
> >  	printf("Example: %s -d -t 10 -p 5 -e\n", progname);
> > +	printf("Example: %s -t 12 -T -n 7 -N\n", progname);
> 
> Would this work the way you want it though, since -N now is oneshot?
> Should this be just "printf("Example: %s -t 12 -T -n 7\n", progname); ??


Example shows how to set/query the timers to make sure value set was what
was intended.

Note: "oneshot" is a bit of a misnomer as it causes clean exit before
going into the keep alive loop, but one can still specify multiple
options.


> 
> The rest looks good to me.
> 
> >  }
> >  
> >  int main(int argc, char *argv[])
> > @@ -135,6 +142,30 @@ int main(int argc, char *argv[])
> >  			else
> >  				printf("WDIOC_SETTIMEOUT errno '%s'\n", strerror(errno));
> >  			break;
> > +		case 'T':
> > +			oneshot = 1;
> > +			ret = ioctl(fd, WDIOC_GETTIMEOUT, &flags);
> > +			if (!ret)
> > +				printf("WDIOC_GETTIMEOUT returns %u seconds.\n", flags);
> > +			else
> > +				printf("WDIOC_GETTIMEOUT errno '%s'\n", strerror(errno));
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
> > +			oneshot = 1;
> > +			ret = ioctl(fd, WDIOC_GETPRETIMEOUT, &flags);
> > +			if (!ret)
> > +				printf("WDIOC_GETPRETIMEOUT returns %u seconds.\n", flags);
> > +			else
> > +				printf("WDIOC_GETPRETIMEOUT errno '%s'\n", strerror(errno));
> > +			break;
> >  		default:
> >  			usage(argv[0]);
> >  			goto end;
> > 
> 
> thanks,
> -- Shuah

-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------
