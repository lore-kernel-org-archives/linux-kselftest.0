From: shuah@kernel.org (Shuah Khan)
Date: Fri, 21 Sep 2018 17:42:00 -0600
Subject: [PATCH] selftests: watchdog: Add gettimeout and get|set pretimeout
In-Reply-To: <1537570526-65241-1-git-send-email-jerry.hoemann@hpe.com>
References: <1537570526-65241-1-git-send-email-jerry.hoemann@hpe.com>
Message-ID: <0c6376ec-a3f4-7798-8f30-829480c41f79@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180921234200.HcVq-_3ool9h8oIyWwJY69tMWHaNLxmSl3KcXt7SkUc@z>

Hi Jerry,

Thanks for the patch. A few comments below:

On 09/21/2018 04:55 PM, Jerry Hoemann wrote:
> Add command line arguments to call ioctl WDIOC_GETTIMEOUT,
> WDIOC_GETPRETIMEOUT and WDIOC_SETPRETIMEOUT.
> 
> Signed-off-by: Jerry Hoemann <jerry.hoemann at hpe.com>
> ---
>  tools/testing/selftests/watchdog/watchdog-test.c | 30 +++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
> index 6e29087..4861e2c 100644
> --- a/tools/testing/selftests/watchdog/watchdog-test.c
> +++ b/tools/testing/selftests/watchdog/watchdog-test.c
> @@ -19,7 +19,7 @@
>  
>  int fd;
>  const char v = 'V';
> -static const char sopts[] = "bdehp:t:";
> +static const char sopts[] = "bdehp:t:Tn:N";
>  static const struct option lopts[] = {
>  	{"bootstatus",          no_argument, NULL, 'b'},
>  	{"disable",             no_argument, NULL, 'd'},
> @@ -27,6 +27,9 @@
>  	{"help",                no_argument, NULL, 'h'},
>  	{"pingrate",      required_argument, NULL, 'p'},
>  	{"timeout",       required_argument, NULL, 't'},
> +	{"gettimeout",          no_argument, NULL, 'T'},
> +	{"pretimeout",    required_argument, NULL, 'n'},
> +	{"getpretimeout",       no_argument, NULL, 'N'},
>  	{NULL,                  no_argument, NULL, 0x0}
>  };
>  
> @@ -71,6 +74,9 @@ static void usage(char *progname)
>  	printf(" -h, --help          Print the help message\n");
>  	printf(" -p, --pingrate=P    Set ping rate to P seconds (default %d)\n", DEFAULT_PING_RATE);
>  	printf(" -t, --timeout=T     Set timeout to T seconds\n");
> +	printf(" -T, --gettimeout    Get the timeout\n");
> +	printf(" -n, --pretimeout    Set the pretimeout to T seconds\n");
> +	printf(" -N, --getpretimeout Get the pretimeout\n");

How are the new arguments used?

>  	printf("\n");
>  	printf("Parameters are parsed left-to-right in real-time.\n");
>  	printf("Example: %s -d -t 10 -p 5 -e\n", progname);

Please add an example usage for each of these new arguments.

> @@ -135,6 +141,28 @@ int main(int argc, char *argv[])
>  			else
>  				printf("WDIOC_SETTIMEOUT errno '%s'\n", strerror(errno));
>  			break;
> +		case 'T':
> +			ret = ioctl(fd, WDIOC_GETTIMEOUT, &flags);
> +			if (!ret)
> +				printf("Watchdog timeout set to %u seconds.\n", flags);

It would good to make this message different from the WDIOC_SETTIMEOUT message.
Please update it to reflect that this is the result of a WDIOC_GETTIMEOUT.

What would user intend to do with this GETTIMEOUT? Shouldn't this be the case that it
prints the current value and exits instead of the same logic as SETTIMEOUT option?

> +			else
> +				printf("WDIOC_GETTIMEOUT errno '%s'\n", strerror(errno))

Shouldn't this error be an exit condition?

> +			break;
> +		case 'n':
> +			flags = strtoul(optarg, NULL, 0);
> +			ret = ioctl(fd, WDIOC_SETPRETIMEOUT, &flags);
> +			if (!ret)
> +				printf("Watchdog pretimeout set to %u seconds.\n", flags);
> +			else
> +				printf("WDIOC_SETPRETIMEOUT errno '%s'\n", strerror(errno));
> +			break;
> +		case 'N':
> +			ret = ioctl(fd, WDIOC_GETPRETIMEOUT, &flags);
> +			if (!ret)
> +				printf("Watchdog pretimeout set to %u seconds.\n", flags);

It would good to make this message different from the WDIOC_GETPRETIMEOUT message.
Please update it to reflect that this is the result of a WDIOC_GETPRETIMEOUT

What would user intend to do with this GETTIMEOUT? Shouldn't this be the case that it
prints the current value and exits instead of the same logic as WDIOC_SETPRETIMEOUT?

> +			else
> +				printf("WDIOC_GETPRETIMEOUT errno '%s'\n", strerror(errno));

Shouldn't this error be an exit condition?

> +			break;
>  		default:
>  			usage(argv[0]);
>  			goto end;
> 

Also can you run this test as normal user?

thanks,
-- Shuah
