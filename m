From: broonie at kernel.org (Mark Brown)
Date: Mon, 11 Feb 2019 13:02:02 +0000
Subject: [PATCH 1/2] selftests/x86/fsgsbase: Indirect output through a
 wrapper function
In-Reply-To: <20190211084543.GA62722@gmail.com>
References: <20190203134017.9375-1-broonie@kernel.org>
 <20190203134017.9375-2-broonie@kernel.org>
 <20190211084543.GA62722@gmail.com>
Message-ID: <20190211130202.GB22391@sirena.org.uk>

On Mon, Feb 11, 2019 at 09:45:43AM +0100, Ingo Molnar wrote:
> * Mark Brown <broonie at kernel.org> wrote:

> > In preparation for a change to make this test run repeatedly which
> > would generate huge amounts of output as is indirect all the printf()
> > calls in the program through a wrapper and add a quiet flag which can
> > be used to suppress the output.  This is fairly quick and dirty, I'm not
> > 100% sure what would be idiomatic here.

> So this really loses useful output when there is a failure. After this 
> patch I get:

>   dagon:~/tip/tools/testing/selftests/x86> ./fsgsbase_64 -vv
>   [FAIL] 24 errors detected in 1 tries

> Not very helpful, and no real command-line way to see the failures.

For clarity it's the second patch that breaks this, though you're right
this isn't helpful and this patch needs a log level adding to really fix
that.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190211/1cad5a1d/attachment.sig>
