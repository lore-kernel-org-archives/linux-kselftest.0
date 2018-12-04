From: brendanhiggins@google.com (Brendan Higgins)
Date: Mon, 3 Dec 2018 16:08:02 -0800
Subject: [RFC v3 17/19] of: unittest: migrate tests to run on KUnit
In-Reply-To: <CAL_Jsq+09Kx7yMBC_Jw45QGmk6U_fp4N6HOZDwYrM4tWw+_dOA@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-18-brendanhiggins@google.com>
 <CAL_Jsq+09Kx7yMBC_Jw45QGmk6U_fp4N6HOZDwYrM4tWw+_dOA@mail.gmail.com>
Message-ID:
 <CAFd5g44bmhAOLYeHX8timke-zSr_6AA4tuxQcfeyc6AHFAxHeQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181204000802.yVUtpOLsW0fpY54fzCFslC9zB5-_nX5Aujj8l6bkWGQ@z>

On Wed, Nov 28, 2018@12:56 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Nov 28, 2018 at 1:38 PM Brendan Higgins
> <brendanhiggins@google.com> wrote:
> >
> > Migrate tests without any cleanup, or modifying test logic in anyway to
> > run under KUnit using the KUnit expectation and assertion API.
>
> Nice! You beat me to it. This is probably going to conflict with what
> is in the DT tree for 4.21. Also, please Cc the DT list for
> drivers/of/ changes.

Oh, I thought you were asking me to do it :-) In any case, I am happy to.

Oh yeah, sorry about not CC'ing the list.

Cheers
