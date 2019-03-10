From: zohar at linux.ibm.com (Mimi Zohar)
Date: Sun, 10 Mar 2019 13:48:33 -0400
Subject: [PATCH v2 5/5] selftests/ima: loading kernel modules
In-Reply-To: <20190228223255.GE20335@dell5510>
References: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
 <1551223620-11586-6-git-send-email-zohar@linux.ibm.com>
 <20190228223255.GE20335@dell5510>
Message-ID: <1552240113.5062.11.camel@linux.ibm.com>

On Thu, 2019-02-28 at 23:32 +0100, Petr Vorel wrote:
> Hi Mimi,
> 
> > While the appended kernel module signature can be verified, when loading
> > a kernel module via either the init_module or the finit_module syscall,
> > verifying the IMA signature requires access to the file descriptor,
> > which is only available via the finit_module syscall.  As "modprobe"
> > does not provide a flag allowing the syscall - init_module or
> > finit_module - to be specified, this patch does not load a kernel
> > module.
> 
> > This test simply verifies that on secure boot enabled systems with
> > "CONFIG_IMA_ARCH_POLICY" configured, that at least an appended kernel
> > module signature or an IMA signature is required based on the Kconfig
> > and the runtime IMA policy.
> 
> > Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
> Reviewed-by: Petr Vorel <pvorel at suse.cz>
> 
> ...
> > diff --git a/tools/testing/selftests/ima/test_kernel_module.sh b/tools/testing/selftests/ima/test_kernel_module.sh
> ...
> > +# Are appended signatures required?
> > +if [ -e /sys/module/module/parameters/sig_enforce ]; then
> > +	sig_enforce=$(cat /sys/module/module/parameters/sig_enforce)
> > +	if [ $sig_enforce = "Y" ]; then
> > +		log_pass "appended kernel module signature required"
> > +	fi
> > +fi
> Another possible helper [1]:
> is_enabled() # or sysfs_enabled
> {
> 	[ -f "$1" ] && [ "$(cat $1)" = "Y" -o "$(cat $1)" = "1" ]
> }
> 
> is_enabled /sys/module/module/parameters/sig_enforce && 
> 	log_pass "appended kernel module signature required"
> 

Agreed.  As this is being used only here in the IMA selftests,
deferring making this change until there is a generic common library.

Mimi
