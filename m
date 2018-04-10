From: jpoimboe at redhat.com (Josh Poimboeuf)
Date: Tue, 10 Apr 2018 16:33:54 -0500
Subject: [PATCH v2] selftests/livepatch: introduce tests
In-Reply-To: <daac17e1-6e32-fce9-51b0-24ec25bda69f@redhat.com>
References: <1523373354-10801-1-git-send-email-joe.lawrence@redhat.com>
 <1523373354-10801-2-git-send-email-joe.lawrence@redhat.com>
 <20180410200059.loy3hw6tcwdi4m5z@treble>
 <daac17e1-6e32-fce9-51b0-24ec25bda69f@redhat.com>
Message-ID: <20180410213354.ma5wfe3jc23pzmw4@treble>

On Tue, Apr 10, 2018 at 04:50:51PM -0400, Joe Lawrence wrote:
> On 04/10/2018 04:00 PM, Josh Poimboeuf wrote:
> > On Tue, Apr 10, 2018 at 11:15:54AM -0400, Joe Lawrence wrote:
> >> +static void test_klp_shadow_vars_exit(void)
> >> +{
> >> +}
> >> +
> >> +module_init(test_klp_shadow_vars_init);
> >> +module_init(test_klp_shadow_vars_exit);
> > 
> > For this last line, s/module_init/module_exit/, though I think the exit
> > function can just be removed altogether?
> 
> D'oh workspace / git user error, I posted an older version :(
> 
> But the exit function seems to be required if an init function is
> provided.  Here I omitted the exit function:
> 
>   % modprobe test_klp_shadow_vars
>   % lsmod | grep test_klp_shadow_vars
>   test_klp_shadow_vars    16384  0
>   % rmmod test_klp_shadow_vars
>   rmmod: ERROR: could not remove 'test_klp_shadow_vars': Device or
>     resource busy
>   rmmod: ERROR: could not remove module test_klp_shadow_vars: Device or
>     resource busy
> 
> and from kernel/module.c
> 
> SYSCALL_DEFINE2(delete_module, const char __user *, name_user,
>                 unsigned int, flags)
> ...
>         /* If it has an init func, it must have an exit func to unload*/
>         if (mod->init && !mod->exit) {
>                 forced = try_force_unload(flags);
>                 if (!forced) {
>                         /* This module can't be removed */
>                         ret = -EBUSY;
>                         goto out;
>                 }
>         }
> ...

Hm, ok, though that seems like a weird limitation...

> I missed Petr's commit msg note "that the constructor is called under
> klp_shadow_lock."  I'll convert the test to use GFP_ATOMIC for this
> allocation.
> 
> I'll also add CONFIG_PM_SLEEP_DEBUG=y to my test VM kernel .config.  Any
> other debug option suggestions?

I think CONFIG_LOCKDEP is always a good idea.  Otherwise, I dunno...
Here's my .config:

  https://paste.fedoraproject.org/paste/cnM-J18uVWJrxz2DAdSchg

-- 
Josh
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
