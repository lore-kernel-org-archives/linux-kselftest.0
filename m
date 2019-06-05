From: brendanhiggins at google.com (Brendan Higgins)
Date: Tue, 4 Jun 2019 17:19:28 -0700
Subject: [PATCH v4 03/18] kunit: test: add string_stream a std::stream
 like string builder
In-Reply-To: <20190517174300.7949F20848@mail.kernel.org>
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-4-brendanhiggins@google.com>
 <20190517174300.7949F20848@mail.kernel.org>
Message-ID: <CAFd5g45WrARi7eXsVKyq2eJH5j+wSrCCaHHSHrMptG7+MnNiTg@mail.gmail.com>

On Fri, May 17, 2019 at 10:43 AM Stephen Boyd <sboyd at kernel.org> wrote:
>
> Quoting Brendan Higgins (2019-05-14 15:16:56)
> > A number of test features need to do pretty complicated string printing
> > where it may not be possible to rely on a single preallocated string
> > with parameters.
> >
> > So provide a library for constructing the string as you go similar to
> > C++'s std::string.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> > Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> > Reviewed-by: Logan Gunthorpe <logang at deltatee.com>
>
> Is there any reason why we can't use the seqfile API for this? These
> both share a similar goal, formatting strings into a buffer to be read
> later. Maybe some new APIs would be needed to extract the buffer
> differently, but I hope we could share the code.

I can see why you are asking. It seems as though they are trying to do
*similar* things, and it seems possible that we might be able to
extract some common functionality out of seq_file that could replace
this; however, it looks like it would be require a significant
refactoring of seq_file to separate out the file system specific bits
from the more general stringbuilder functionality.

In my opinion, a refactoring like this makes no sense in this
patchset; it probably belongs in its own patchset (preferably as a
follow on). I also am not sure if the FS people would appreciate
indirection that serves them no benefit, but I can ask if you like.

> If it can't be used, can you please add the reasoning to the commit text
> here?

Will do.

Thanks!
