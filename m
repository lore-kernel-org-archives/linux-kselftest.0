From: oleg@redhat.com (Oleg Nesterov)
Date: Thu, 2 May 2019 18:02:48 +0200
Subject: [PATCH v2 1/2] Add polling support to pidfd
In-Reply-To: <20190502151320.cvc6uc3b4bmww23k@brauner.io>
References: <20190430162154.61314-1-joel@joelfernandes.org>
 <20190501151312.GA30235@redhat.com>
 <20190502151320.cvc6uc3b4bmww23k@brauner.io>
Message-ID: <20190502160247.GD7323@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502160248.nrrcrYC_LoKVXvxfWmHpeAIdqnI5EYtuGtHszWk7dLI@z>

On 05/02, Christian Brauner wrote:
>
> On Wed, May 01, 2019@05:13:12PM +0200, Oleg Nesterov wrote:
> >
> > Otherwise I see no problems.
>
> I'll remove the WARN_ON() check when applying this. Can I get your
> Acked/Review, Oleg?

Yes, feel free to add

	Reviewed-by: Oleg Nesterov <oleg at redhat.com>


Hmm. Somehow I didn't read the changelog before, I just noticed
Suggested-by: Oleg Nesterov <oleg at redhat.com>

Please remove ;) Thanks Joel, I appreciate it, but it is not my idea.

Oleg.
