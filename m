From: corbet@lwn.net (Jonathan Corbet)
Date: Tue, 14 May 2019 07:34:22 -0600
Subject: [PATCH v3 15/18] Documentation: kunit: add documentation for KUnit
In-Reply-To: <20190514054251.186196-16-brendanhiggins@google.com>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-16-brendanhiggins@google.com>
Message-ID: <20190514073422.4287267c@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190514133422.gmj2NYVSOUNU-X3uiIO6NGOxIblJYXtWCaglM-gCaDI@z>

On Mon, 13 May 2019 22:42:49 -0700
Brendan Higgins <brendanhiggins@google.com> wrote:

> Add documentation for KUnit, the Linux kernel unit testing framework.
> - Add intro and usage guide for KUnit
> - Add API reference
> 
> Signed-off-by: Felix Guo <felixguoxiuping at gmail.com>
> Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> Reviewed-by: Logan Gunthorpe <logang at deltatee.com>
> ---
> Changes Since Last Revision:
>  - Addressed reference to incorrect number of sections, as per Randy's
>    comment.
>  - Make section underlines same length as the section title, as per
>    Randy's comments.
> ---
>  Documentation/index.rst           |   1 +
>  Documentation/kunit/api/index.rst |  16 +
>  Documentation/kunit/api/test.rst  |  14 +
>  Documentation/kunit/faq.rst       |  62 ++++
>  Documentation/kunit/index.rst     |  79 ++++
>  Documentation/kunit/start.rst     | 180 ++++++++++
>  Documentation/kunit/usage.rst     | 575 ++++++++++++++++++++++++++++++

Certainly it's great to see all this documentation coming with this
feature!

Naturally, though, I have one request: I'd rather not see this at the top
level, which is more than crowded enough as it is.  Can this material
please go into the development tools book, alongside the kselftest
documentation?

Thanks,

jon
