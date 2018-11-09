From: rafael.tinoco at linaro.org (Rafael David Tinoco)
Date: Fri, 09 Nov 2018 16:48:49 -0200
Subject: [PATCH] proc: fix and merge proc-self-map-file tests
In-Reply-To: <20181109180407.GO13195@uranus.lan>
References: <20181108111105.GC13195@uranus.lan>
 <20181109113036.21512-1-rafael.tinoco@linaro.org>
 <20181109114123.GK13195@uranus.lan>
 <1541763936.3280758.1571224480.76F1EF1C@webmail.messagingengine.com>
 <20181109114850.GL13195@uranus.lan>
 <1541764873.3286172.1571234624.727F6284@webmail.messagingengine.com>
 <20181109180407.GO13195@uranus.lan>
Message-ID: <1541789329.305173.1571657968.7229F301@webmail.messagingengine.com>

On Fri, Nov 9, 2018, at 4:04 PM, Cyrill Gorcunov wrote:
> On Fri, Nov 09, 2018 at 10:01:13AM -0200, Rafael David Tinoco wrote:
> > 
> > Alright, I'm fixing membarrier_test before, so.. I guess we have a competition.. =o)
> 
> Rafael, Alexey, what about simply wrap the test code with x86 and extend later
> with all archs which support zero address mapping?
> ---
>  tools/testing/selftests/proc/proc-self-map-files-002.c |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> Index: linux-ml.git/tools/testing/selftests/proc/proc-self-map-files-002.c
> ===================================================================
> --- linux-ml.git.orig/tools/testing/selftests/proc/proc-self-map-files-002.c
> +++ linux-ml.git/tools/testing/selftests/proc/proc-self-map-files-002.c
> @@ -23,6 +23,11 @@
>  #include <sys/mman.h>
>  #include <stdlib.h>
>  
> +/*
> + * Should run on archs which support zero address mapping.
> + */
> +#if defined(__i386) || defined(__x86_64)
> +
>  static void pass(const char *fmt, unsigned long a, unsigned long b)
>  {
>  	char name[64];
> @@ -83,3 +88,12 @@ int main(void)
>  
>  	return 0;
>  }
> +
> +#else
> +
> +int main(void)
> +{
> +	return 0;
> +}
> +
> +#endif

let me see if I got this right.. the premise for this test is to have *at least*
2 vmas, so we can check if the symlink for the mem range, describing the mapped
area, is correct in procfs files, correct ? if yes, then why to have a totally
duplicated test... just to check if mmap(0, ... MAP_FIXED ...) would work ?

Wouldn't exist a better place to have such test ? like in
tools/testing/selftests/vm/mmap-null.c or something like it ?  genuine
curiosity.. thinking i'm missing something about this test...
