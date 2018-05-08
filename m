From: naveen.n.rao@linux.vnet.ibm.com (Naveen N. Rao)
Date: Tue, 08 May 2018 15:41:11 +0530
Subject: [PATCH v7 00/16] tracing: probeevent: Improve fetcharg features
In-Reply-To: <20180507235317.fa04131c603dbe59ef78a829@kernel.org>
References: <152465856498.26224.16969986455942749517.stgit@devbox>
 <20180503181137.6d82d897@gandalf.local.home>
 <20180505004828.9b75b6802472f09b0d2de5b8@kernel.org>
 <20180504120642.354cdd1f@gandalf.local.home>
 <20180505113803.45700179a93091b114ec6984@kernel.org>
 <1525506231.y43xvmd3yw.naveen@linux.ibm.com>
 <20180505233211.ecad929b13461f1e5f6427d2@kernel.org>
 <1525680222.8nou0tzkkt.naveen@linux.ibm.com>
 <20180507235317.fa04131c603dbe59ef78a829@kernel.org>
Message-ID: <1525772835.npvwj0nws0.naveen@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180508101111.nAs-lkkrtBL8Rd74bL7SAdZyy-9TZmg6Tzq7rlrJ_Ag@z>

Masami Hiramatsu wrote:
> On Mon, 07 May 2018 13:41:53 +0530
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>> >> 
>> >> I didn't understand that. Which code are you planning to remove? Can you 
>> >> please elaborate? I thought we still need to disable preemption in the 
>> >> ftrace handler.
>> > 
>> > Yes, kprobe_ftrace_handler itself must be run under preempt disabled
>> > because it depends on a per-cpu variable. What I will remove is the
>> > redundant preempt disable/enable_noresched (unbalanced) pair in the
>> > kprobe_ftrace_handler, and jprobe x86 ports which is no more used.
>> 
>> Won't that break out-of-tree users depending on returning a non-zero 
>> value to handle preemption differently? You seem to have alluded to it 
>> earlier in the mail chain above where you said that this is not just for 
>> jprobes (though it was added for jprobes as the main use case).
> 
> No, all users are in tree already (function override for bpf and error-injection).

Ok, so BPF error injection is a new user that can return a non-zero 
value from the pre handler. It looks like it can use KPROBES_ON_FTRACE 
too.

In that case, on function entry, we call into kprobe_ftrace_handler() 
which will call fei_kprobe_handler(), which can re-enable premption 
before returning 1. So, if you remove the additional 
prempt_disable()/enable_no_resched() in kprobe_ftrace_handler(), then it 
will become imbalanced, right?

> And also, for changing execution path by using kprobes, user handler must call
> not only preempt_enable(), but also clear current_kprobe per-cpu variable which
> is not exported to kmodules.

Ok, good point. And that means we don't have any external users any 
more.

Thanks,
Naveen


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
