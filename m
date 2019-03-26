From: zohar at linux.ibm.com (Mimi Zohar)
Date: Tue, 26 Mar 2019 09:56:50 -0400
Subject: [PATCH v4a 1/2] selftests/kexec: make tests independent of IMA
 being enabled
In-Reply-To: <20190326074942.GA19708@dhcp-128-65.nay.redhat.com>
References: <1553283351-6310-1-git-send-email-zohar@linux.ibm.com>
 <20190325080935.GA12497@dhcp-128-65.nay.redhat.com>
 <1553546236.5561.7.camel@linux.ibm.com>
 <20190326074942.GA19708@dhcp-128-65.nay.redhat.com>
Message-ID: <1553608610.3960.37.camel@linux.ibm.com>

On Tue, 2019-03-26 at 15:49 +0800, Dave Young wrote:
> On 03/25/19 at 04:37pm, Mimi Zohar wrote:
> > On Mon, 2019-03-25 at 16:09 +0800, Dave Young wrote:
> > > Hi Mimi
> > > On 03/22/19 at 03:35pm, Mimi Zohar wrote:
> > > > Verify IMA is enabled before failing tests or emitting irrelevant
> > > > messages.  Also, don't skip the test if signatures are not required.
> > > > 
> > > > Suggested-by: Dave Young <dyoung at redhat.com>
> > > > Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
> > > > ---
> > > > Dave, if this patch resolves the outstanding issues, I can fold these
> > > > changes into the original patches. (Reminder, these patches will need to
> > > > be updated to support the "lockdown" patch set.)
> > > 
> > > They looks good to me, thanks for the update
> > 
> > I've folded the kexec_file_load changes into the kexec_file_load test.
> >  The remaining kexec_load change is left as a separate patch, since it
> > is dependent on the ikconfig change.
> > 
> > > Feel free to add my reviewed-by, I did some tests although not cover all
> > > ima cases.
> > 
> > Thanks!  Is this meant as a general "reviewed-by" for all of the
> > patches or just this specific one?
> 
> Thank you for taking this as a separate kexec tests, I think it can
> be used for these delta fixes

Ok, I just re-posted the patches, folding part of this patch into the
kexec_file_load test.  I've added your Reviewed-by on the remaining
patch.

> 
> I read all the patches and reviewed the kexec stuff, but I do not
> understand all the IMA logic yet although I did some simple ima
> tests.

I understand.  There are many different aspects to the integrity
subsystem.  I'm happy to answer any questions you have.

Mimi
