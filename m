From: linuxram at us.ibm.com (Ram Pai)
Date: Tue, 30 Jan 2018 08:28:34 -0800
Subject: [Linux-kselftest-mirror] [PATCH v10 27/27] mm: display pkey in
 smaps if arch_pkeys_enabled() is true
In-Reply-To: <20180130121611.GC26445@dhcp22.suse.cz>
References: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
 <1516326648-22775-28-git-send-email-linuxram@us.ibm.com>
 <20180130121611.GC26445@dhcp22.suse.cz>
Message-ID: <20180130162834.GB5411@ram.oc3035372033.ibm.com>

On Tue, Jan 30, 2018 at 01:16:11PM +0100, Michal Hocko wrote:
> On Thu 18-01-18 17:50:48, Ram Pai wrote:
> [...]
> > @@ -851,9 +848,13 @@ static int show_smap(struct seq_file *m, void *v, int is_pid)
> >  			   (unsigned long)(mss->pss >> (10 + PSS_SHIFT)));
> >  
> >  	if (!rollup_mode) {
> > -		arch_show_smap(m, vma);
> > +#ifdef CONFIG_ARCH_HAS_PKEYS
> > +		if (arch_pkeys_enabled())
> > +			seq_printf(m, "ProtectionKey:  %8u\n", vma_pkey(vma));
> > +#endif
> >  		show_smap_vma_flags(m, vma);
> >  	}
> > +
> 
> Why do you need to add ifdef here? The previous patch should make
> arch_pkeys_enabled == F when CONFIG_ARCH_HAS_PKEYS=n.

You are right. it need not be wrapped in CONFIG_ARCH_HAS_PKEYS.  I had to do it
because vma_pkey(vma)  is not defined in some architectures.

I will provide a generic vma_pkey() definition for architectures that do 
not support PKEYS.



> Btw. could you
> merge those two patches into one. It is usually much easier to review a
> new helper function if it is added along with a user.


ok.

Thanks,
RP

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
