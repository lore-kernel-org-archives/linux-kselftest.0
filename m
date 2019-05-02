From: gregkh@linuxfoundation.org (Greg KH)
Date: Thu, 2 May 2019 13:00:08 +0200
Subject: [PATCH v2 04/17] kunit: test: add kunit_stream a std::stream
 like logger
In-Reply-To: <20190501230126.229218-5-brendanhiggins@google.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-5-brendanhiggins@google.com>
Message-ID: <20190502110008.GC12416@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502110008.5M93jiex3xlzYtvtl2MFSJECIBDEPvXAOxLko348kI0@z>

On Wed, May 01, 2019@04:01:13PM -0700, Brendan Higgins wrote:
> A lot of the expectation and assertion infrastructure prints out fairly
> complicated test failure messages, so add a C++ style log library for
> for logging test results.

Ideally we would always use a standard logging format, like the
kselftest tests all are aiming to do.  That way the output can be easily
parsed by tools to see if the tests succeed/fail easily.

Any chance of having this logging framework enforcing that format as
well?

thanks,

greg k-h
