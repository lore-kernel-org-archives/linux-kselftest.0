From: mcgrof at kernel.org (Luis Chamberlain)
Date: Fri, 30 Nov 2018 19:12:28 -0800
Subject: [RFC v3 03/19] kunit: test: add string_stream a std::stream like
 string builder
In-Reply-To: <CAFd5g46AXpnoWpm+aFNfvNm2-As5RCO7QdMPhcOMXWRPwHqrGg@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-4-brendanhiggins@google.com>
 <20181130032924.GH18410@garbanzo.do-not-panic.com>
 <CAFd5g46AXpnoWpm+aFNfvNm2-As5RCO7QdMPhcOMXWRPwHqrGg@mail.gmail.com>
Message-ID: <20181201031228.GM28501@garbanzo.do-not-panic.com>

On Fri, Nov 30, 2018 at 06:14:17PM -0800, Brendan Higgins wrote:
> On Thu, Nov 29, 2018 at 7:29 PM Luis Chamberlain <mcgrof at kernel.org> wrote:
> >
> > On Wed, Nov 28, 2018 at 11:36:20AM -0800, Brendan Higgins wrote:
> > > A number of test features need to do pretty complicated string printing
> > > where it may not be possible to rely on a single preallocated string
> > > with parameters.
> > >
> > > So provide a library for constructing the string as you go similar to
> > > C++'s std::string.
> >
> > Hrm, what's the potential for such thing actually being eventually
> > generically useful for printk folks, I wonder? Petr?
> 
> Are you saying you think this is applicable for other things? 

Yes.

> This doesn't belong here.

  Luis
