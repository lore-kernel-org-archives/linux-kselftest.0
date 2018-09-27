From: rostedt at goodmis.org (Steven Rostedt)
Date: Thu, 27 Sep 2018 09:22:35 -0400
Subject: [PATCH] rseq/selftests: fix parametrized test with -fpie
In-Reply-To: <1367962117.10271.1537897176578.JavaMail.zimbra@efficios.com>
References: <20180918135328.32034-1-mathieu.desnoyers@efficios.com>
 <1367962117.10271.1537897176578.JavaMail.zimbra@efficios.com>
Message-ID: <20180927092235.77282e35@vmware.local.home>

On Tue, 25 Sep 2018 13:39:36 -0400 (EDT)
Mathieu Desnoyers <mathieu.desnoyers at efficios.com> wrote:

> ----- On Sep 18, 2018, at 9:53 AM, Mathieu Desnoyers mathieu.desnoyers at efficios.com wrote:
> 
> > On x86-64, the parametrized selftest code for rseq crashes with a
> > segmentation fault when compiled with -fpie. This happens when the
> > param_test binary is loaded at an address beyond 32-bit on x86-64.
> > 
> > The issue is caused by use of a 32-bit register to hold the address
> > of the loop counter variable.
> > 
> > Fix this by using a 64-bit register to calculate the address of the
> > loop counter variables as an offset from rip.  
> 
> Should this fix go through tip or the selftests tree ?
> 

I usually have changes like this pulled through Shuah's tree with an
ack from the maintainer of the code that it tests.

-- Steve
