From: mcgrof@kernel.org (Luis Chamberlain)
Date: Thu, 29 Nov 2018 19:37:04 -0800
Subject: [RFC v3 06/19] arch: um: enable running kunit from User Mode Linux
In-Reply-To: <CAL_JsqJLNSg-38hej8LV+Oh-YXBM2hRGomie3b_psa9LvzoRYg@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-7-brendanhiggins@google.com>
 <CAL_JsqJLNSg-38hej8LV+Oh-YXBM2hRGomie3b_psa9LvzoRYg@mail.gmail.com>
Message-ID: <20181130033704.GL18410@garbanzo.do-not-panic.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181130033704.F1xL90bGAn_a7YgZUxXW6Hzs-hFoiQsoe_vOe6v1RHw@z>

On Wed, Nov 28, 2018@03:26:03PM -0600, Rob Herring wrote:
> On Wed, Nov 28, 2018 at 1:37 PM Brendan Higgins
> <brendanhiggins@google.com> wrote:
> >
> > Make minimum number of changes outside of the KUnit directories for
> > KUnit to build and run using UML.
> 
> There's nothing in this patch limiting this to UML. 

Not that one, but the abort thing segv thing is, eventually.
To support other architectures we'd need to make a wrapper to that
hack which Brendan added, and then allow each os to implement
its own call, and add an asm-generic helper.

Are you volunteering to add the x86 hook?

  Luis
