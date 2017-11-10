From: leitao at debian.org (Breno Leitao)
Date: Fri, 10 Nov 2017 09:36:56 -0200
Subject: [Linux-kselftest-mirror] [PATCH v9 44/51] selftest/vm: powerpc
 implementation for generic abstraction
In-Reply-To: <20171109233745.GD5546@ram.oc3035372033.ibm.com>
References: <1509958663-18737-1-git-send-email-linuxram@us.ibm.com>
 <1509958663-18737-45-git-send-email-linuxram@us.ibm.com>
 <20171109184714.xs523k4cvmqghew3@gmail.com>
 <20171109233745.GD5546@ram.oc3035372033.ibm.com>
Message-ID: <20171110113655.hizq4xes5oy2fzim@gmail.com>

Hi Ram,

On Thu, Nov 09, 2017 at 03:37:46PM -0800, Ram Pai wrote:
> On Thu, Nov 09, 2017 at 04:47:15PM -0200, Breno Leitao wrote:
> > On Mon, Nov 06, 2017 at 12:57:36AM -0800, Ram Pai wrote:
> > > @@ -206,12 +209,14 @@ void signal_handler(int signum, siginfo_t *si, void *vucontext)
> > >  
> > >  	trapno = uctxt->uc_mcontext.gregs[REG_TRAPNO];
> > >  	ip = uctxt->uc_mcontext.gregs[REG_IP_IDX];
> > > -	fpregset = uctxt->uc_mcontext.fpregs;
> > > -	fpregs = (void *)fpregset;
> > 
> > Since you removed all references for fpregset now, you probably want to
> > remove the declaration of the variable above.
> 
> fpregs is still needed.

Right, fpregs is still needed, but not fpregset. Every reference for this
variable was removed with your patch.

Grepping this variable identifier on a tree with your patches, I see:

 $ grep fpregset protection_keys.c 
 fpregset_t fpregset;
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
