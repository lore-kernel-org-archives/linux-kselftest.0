From: changbin.du@intel.com (Du, Changbin)
Date: Wed, 28 Mar 2018 09:45:25 +0800
Subject: [PATCH v2 1/4] selftests/Makefile: append a slash to env
 variable OUTPUT
In-Reply-To: <b473e652-0953-63ec-c4bf-5c9306dc4f67@kernel.org>
References: <1522120294-24926-1-git-send-email-changbin.du@intel.com>
 <1522120294-24926-2-git-send-email-changbin.du@intel.com>
 <b473e652-0953-63ec-c4bf-5c9306dc4f67@kernel.org>
Message-ID: <20180328014525.bl3iih4xvo74wedb@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180328014525.KFZ6EB07gprJg1-RaFVDFcxVVRZ-yQBJrwroxWyH1QA@z>

On Tue, Mar 27, 2018@03:19:26PM -0600, Shuah Khan wrote:
> On 03/26/2018 09:11 PM, changbin.du@intel.com wrote:
> > From: Changbin Du <changbin.du at intel.com>
> > 
> > The tools/build/Makefile.build use 'OUTPUT' variable as below example:
> > objprefix    := $(subst ./,,$(OUTPUT)$(dir)/)
> > 
> > So it requires the 'OUTPUT' already has a slash at the end.
> > 
> > This patch can kill below odd paths:
> > make[3]: Entering directory '/home/changbin/work/linux/tools/gpio'
> >   CC       /home/changbin/work/linux/tools/testing/selftests/gpiolsgpio.o
> >   CC       /home/changbin/work/linux/tools/testing/selftests/gpiogpio-utils.o
> >   LD       /home/changbin/work/linux/tools/testing/selftests/gpiolsgpio-in.o
> > 
> > A correct path should be:
> > /home/changbin/work/linux/tools/testing/selftests/gpio/lsgpio.o
> > 
> > Signed-off-by: Changbin Du <changbin.du at intel.com>
> 
> Are you seeing this when you run "make kselftest" - if gpio is the
> only test compile that fails, it should be fixed in gpio/Makefile,
> not is the common Makefile.
>
I only saw error in gpio, but I also saw some kselftest Makefiles having string concatenation
as '$(OUTPUT)$(dir)'. So the rule is not aligned all over. They just didn't produce any errors
so far.

By the way, is there a basic test for kselftest infrastructure? It seems it was always
reporting error when building it :(

> thanks,
> -- Shuah

-- 
Thanks,
Changbin Du
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
