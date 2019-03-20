From: joel@joelfernandes.org (Joel Fernandes)
Date: Wed, 20 Mar 2019 15:42:18 -0400
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending
 kernel easier
In-Reply-To: <20190320113111.d68a7c71c2c163bbc7d5f6aa@linux-foundation.org>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <20190320113111.d68a7c71c2c163bbc7d5f6aa@linux-foundation.org>
Message-ID: <20190320194218.GA80310@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190320194218.QeXbZYGhWpNbWlvWbRNCMjEL_XPKZPqcl_sCGRukeS0@z>

On Wed, Mar 20, 2019@11:31:11AM -0700, Andrew Morton wrote:
> On Wed, 20 Mar 2019 12:31:14 -0400 "Joel Fernandes (Google)" <joel@joelfernandes.org> wrote:
> 
> > Introduce in-kernel headers and other artifacts which are made available
> > as an archive through proc (/proc/kheaders.tar.xz file).
> 
> Lazyass here hasn't been following the recent review discussion and is
> going to try cheating.  Are there significant outstanding concerns now,
> or are we good to go?

Looks to me like it is pretty solid. v4->v5 was just cosmetic changes,
rebasing etc. Unless Masahiro has any other concerns, it could be a
linux-next candidate. I tested it quite heavily, but would be nice to get
some linux-next testing as well.

thanks,

 - Joel
