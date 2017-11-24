From: greg@kroah.com (Greg KH)
Date: Fri, 24 Nov 2017 12:12:42 +0100
Subject: [Linux-kselftest-mirror] selftests: x86_64: kselftest
 mpx-mini-test_64 - no MPX support - failed - 3869 Aborted (core dumped)
In-Reply-To: <20171124111141.GA14922@kroah.com>
References: <CA+G9fYvishojFT=nAJ-ejrOo9KfsDKFOa=3Nzjep0H4E88fPJg@mail.gmail.com>
 <20171124111141.GA14922@kroah.com>
Message-ID: <20171124111242.GA25106@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171124111242.-4w0GT_-o_HmAkN0bYoEmVzZe-12l6Bo5vGZ_xAZFww@z>

On Fri, Nov 24, 2017@12:11:41PM +0100, Greg KH wrote:
> On Fri, Nov 24, 2017@04:32:42PM +0530, Naresh Kamboju wrote:
> > Hi,
> > 
> > We have found "no MPX support" bug while running kselftests on
> > SuperServer 5019S-ML - x86_64 device.
> > Please provide your comments to fix this bug.
> > 
> > LKFT: 4.4-rc 4.9-rc 4.13-rc 4.14-rc: x86: kselftest mpx-mini-test_64 -
> > no MPX support - failed - 3869 Aborted (core dumped) (edit)
> > https://bugs.linaro.org/show_bug.cgi?id=3497
> > 
> > NOTE:
> > Please add your self to Bugzilla to add comments.
> 
> Ugh, what?  Why not discuss it here, and provide the full log of what is
> happening and what you think should be done to fix it.  Don't bury stuff
> in some random bugzilla...
> 
> Perhaps a simple abort once you determine that MPX is not supported?

Wait, that is what the test is doing, so it's working properly.  Why is
this an issue?

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
