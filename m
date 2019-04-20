From: christian@brauner.io (Christian Brauner)
Date: Sat, 20 Apr 2019 14:35:05 +0200
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <20190420122614.GD17468@redhat.com>
References: <CEB62F51-E8BF-4EFB-B438-8AF76633FF00@brauner.io>
 <20190419190247.GB251571@google.com>
 <20190419191858.iwcvqm6fihbkaata@brauner.io>
 <20190419194902.GE251571@google.com>
 <CAKOZueu3PzD_QgROXFRs8FvD=HTKJLsHDK9GrUdbFoMzx_7HEA@mail.gmail.com>
 <CAHrFyr4REuKFuARAXnhBC67TGzyDGmMONc7XjfUGvf+Qfm7EuQ@mail.gmail.com>
 <20190419212002.GB44851@google.com>
 <CAHrFyr6qqj-q9nSVuNhFL5WOcuQstAFvaDu2544OpeMe6jawQw@mail.gmail.com>
 <20190420115125.GC17468@redhat.com>
 <20190420122614.GD17468@redhat.com>
Message-ID: <20190420123504.gohscgeahp45hjd3@brauner.io>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190420123505.6sefYVn9sDzmwDrVXeLvzie6VtTkZXnPJO8E-7fPm4E@z>

On Sat, Apr 20, 2019@02:26:15PM +0200, Oleg Nesterov wrote:
> On 04/20, Oleg Nesterov wrote:
> >
> > Note that we need
> > thread_group_empty() only for the case when the task is traced,
> 
> Damn, sorry for noise... of course this is not true, I tried to say that
> notification won't come otherwise. Nevermind, lets discuss this when we
> have a patch. I already got lost in this thread and I have no idea what

Agreed. The polling work is not targeted for the 5.2 merge window
anyway so there's no need to rush this.

> are you all talking about ;)

Nothing patch-worthy comes without a solid portion of controversy and
confusion at first. ;)

Christian
