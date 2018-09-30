From: peterx@redhat.com (Peter Xu)
Date: Sun, 30 Sep 2018 14:34:01 +0800
Subject: [PATCH 1/3] userfaultfd: selftest: cleanup help messages
In-Reply-To: <20180929102811.GA6429@rapoport-lnx>
References: <20180929084311.15600-1-peterx@redhat.com>
 <20180929084311.15600-2-peterx@redhat.com>
 <20180929102811.GA6429@rapoport-lnx>
Message-ID: <20180930063401.GA18728@xz-x1>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180930063401.d8xjKO9dtfVHvKfHL_zIK37n_t2px9dmWr_9aDhwpa4@z>

On Sat, Sep 29, 2018@01:28:12PM +0300, Mike Rapoport wrote:

[...]

> > +const char *examples =
> > +    "# 100MiB 99999 bounces\n"
> > +    "./userfaultfd anon 100 99999\n"
> > +    "\n"
> > +    "# 1GiB 99 bounces\n"
> > +    "./userfaultfd anon 1000 99\n"
> > +    "\n"
> > +    "# 10MiB-~6GiB 999 bounces, continue forever unless an error triggers\n"
> > +    "while ./userfaultfd anon $[RANDOM % 6000 + 10] 999; do true; done\n"
> > +    "\n";
> 
> While at it, can you please update the examples to include other test
> types?

Sure thing.

Thanks for the quick review!

Regards,

-- 
Peter Xu
