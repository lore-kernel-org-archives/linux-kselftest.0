From: christian at brauner.io (Christian Brauner)
Date: Tue, 14 May 2019 17:16:42 +0200
Subject: [PATCH v2 1/2] Add polling support to pidfd
In-Reply-To: <20190502160247.GD7323@redhat.com>
References: <20190430162154.61314-1-joel@joelfernandes.org>
 <20190501151312.GA30235@redhat.com>
 <20190502151320.cvc6uc3b4bmww23k@brauner.io>
 <20190502160247.GD7323@redhat.com>
Message-ID: <20190514151605.7aadxh6owlk42bwr@brauner.io>

On Thu, May 02, 2019 at 06:02:48PM +0200, Oleg Nesterov wrote:
> On 05/02, Christian Brauner wrote:
> >
> > On Wed, May 01, 2019 at 05:13:12PM +0200, Oleg Nesterov wrote:
> > >
> > > Otherwise I see no problems.
> >
> > I'll remove the WARN_ON() check when applying this. Can I get your
> > Acked/Review, Oleg?
> 
> Yes, feel free to add
> 
> 	Reviewed-by: Oleg Nesterov <oleg at redhat.com>

Applied to 

https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/log/?h=for-next

and targeted for the 5.3 merge window.

Thank you all!
Christian
