From: shuah at kernel.org (Shuah Khan)
Date: Tue, 27 Mar 2018 15:19:26 -0600
Subject: [PATCH v2 1/4] selftests/Makefile: append a slash to env variable
 OUTPUT
In-Reply-To: <1522120294-24926-2-git-send-email-changbin.du@intel.com>
References: <1522120294-24926-1-git-send-email-changbin.du@intel.com>
 <1522120294-24926-2-git-send-email-changbin.du@intel.com>
Message-ID: <b473e652-0953-63ec-c4bf-5c9306dc4f67@kernel.org>

On 03/26/2018 09:11 PM, changbin.du at intel.com wrote:
> From: Changbin Du <changbin.du at intel.com>
> 
> The tools/build/Makefile.build use 'OUTPUT' variable as below example:
> objprefix    := $(subst ./,,$(OUTPUT)$(dir)/)
> 
> So it requires the 'OUTPUT' already has a slash at the end.
> 
> This patch can kill below odd paths:
> make[3]: Entering directory '/home/changbin/work/linux/tools/gpio'
>   CC       /home/changbin/work/linux/tools/testing/selftests/gpiolsgpio.o
>   CC       /home/changbin/work/linux/tools/testing/selftests/gpiogpio-utils.o
>   LD       /home/changbin/work/linux/tools/testing/selftests/gpiolsgpio-in.o
> 
> A correct path should be:
> /home/changbin/work/linux/tools/testing/selftests/gpio/lsgpio.o
> 
> Signed-off-by: Changbin Du <changbin.du at intel.com>

Are you seeing this when you run "make kselftest" - if gpio is the
only test compile that fails, it should be fixed in gpio/Makefile,
not is the common Makefile.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
