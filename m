From: joel@joelfernandes.org (Joel Fernandes)
Date: Tue, 20 Nov 2018 10:39:26 -0800
Subject: [PATCH -next 1/2] mm/memfd: make F_SEAL_FUTURE_WRITE seal more
 robust
In-Reply-To: <CALCETrXgBENat=5=7EuU-ttQ-YSXT+ifjLGc=hpJ=unRgSsndw@mail.gmail.com>
References: <20181120052137.74317-1-joel@joelfernandes.org>
 <CALCETrXgBENat=5=7EuU-ttQ-YSXT+ifjLGc=hpJ=unRgSsndw@mail.gmail.com>
Message-ID: <20181120183926.GA124387@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181120183926.m9Dk6RpQsM1H96IWJTgh0__UQO1Uh3h3rzoXNyTNWHg@z>

On Tue, Nov 20, 2018@07:13:17AM -0800, Andy Lutomirski wrote:
> On Mon, Nov 19, 2018 at 9:21 PM Joel Fernandes (Google)
> <joel@joelfernandes.org> wrote:
> >
> > A better way to do F_SEAL_FUTURE_WRITE seal was discussed [1] last week
> > where we don't need to modify core VFS structures to get the same
> > behavior of the seal. This solves several side-effects pointed out by
> > Andy [2].
> >
> > [1] https://lore.kernel.org/lkml/20181111173650.GA256781 at google.com/
> > [2] https://lore.kernel.org/lkml/69CE06CC-E47C-4992-848A-66EB23EE6C74 at amacapital.net/
> >
> > Suggested-by: Andy Lutomirski <luto at kernel.org>
> > Fixes: 5e653c2923fd ("mm: Add an F_SEAL_FUTURE_WRITE seal to memfd")
> 
> What tree is that commit in?  Can we not just fold this in?

It is in linux-next. Could we keep both commits so we have the history?

thanks,

 - Joel
