From: sboyd at kernel.org (Stephen Boyd)
Date: Fri, 17 May 2019 10:42:59 -0700
Subject: [PATCH v4 03/18] kunit: test: add string_stream a std::stream
 like string builder
In-Reply-To: <20190514221711.248228-4-brendanhiggins@google.com>
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-4-brendanhiggins@google.com>
Message-ID: <20190517174300.7949F20848@mail.kernel.org>

Quoting Brendan Higgins (2019-05-14 15:16:56)
> A number of test features need to do pretty complicated string printing
> where it may not be possible to rely on a single preallocated string
> with parameters.
> 
> So provide a library for constructing the string as you go similar to
> C++'s std::string.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> Reviewed-by: Logan Gunthorpe <logang at deltatee.com>

Is there any reason why we can't use the seqfile API for this? These
both share a similar goal, formatting strings into a buffer to be read
later. Maybe some new APIs would be needed to extract the buffer
differently, but I hope we could share the code.

If it can't be used, can you please add the reasoning to the commit text
here?
