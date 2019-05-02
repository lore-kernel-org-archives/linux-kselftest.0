From: joel at joelfernandes.org (Joel Fernandes)
Date: Thu, 2 May 2019 15:14:37 -0400
Subject: [PATCH v2 1/2] Add polling support to pidfd
In-Reply-To: <20190502160247.GD7323@redhat.com>
References: <20190430162154.61314-1-joel@joelfernandes.org>
 <20190501151312.GA30235@redhat.com>
 <20190502151320.cvc6uc3b4bmww23k@brauner.io>
 <20190502160247.GD7323@redhat.com>
Message-ID: <20190502191437.GA103213@google.com>

On Thu, May 02, 2019 at 06:02:48PM +0200, Oleg Nesterov wrote:
> On 05/02, Christian Brauner wrote:
> >
> > On Wed, May 01, 2019 at 05:13:12PM +0200, Oleg Nesterov wrote:
> > >
> > > Otherwise I see no problems.
> >
> > I'll remove the WARN_ON() check when applying this. Can I get your
> > Acked/Review, Oleg?

Oh, ok. Good point about the de_thread race. Agreed with you.

> Yes, feel free to add
> 
> 	Reviewed-by: Oleg Nesterov <oleg at redhat.com>
> 
> Hmm. Somehow I didn't read the changelog before, I just noticed
> Suggested-by: Oleg Nesterov <oleg at redhat.com>
> Please remove ;) Thanks Joel, I appreciate it, but it is not my idea.

Ok no problem. You have been very helpful so thank you for that!

Also thanks Christian for removing the warning and adding Oleg's Reviewed-by.

 - Joel
