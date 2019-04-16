From: corbet@lwn.net (Jonathan Corbet)
Date: Tue, 16 Apr 2019 09:26:10 -0600
Subject: [PATCH] doc: kselftest: Fix KBUILD_OUTPUT usage instructions
In-Reply-To: <20190416142651.7048-1-shuah@kernel.org>
References: <20190416142651.7048-1-shuah@kernel.org>
Message-ID: <20190416092610.78b462de@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416152610.wuRVRq5xzQ5N6BMJauq4afkfDa5qSZbrjw3mcu9epE0@z>

On Tue, 16 Apr 2019 08:26:51 -0600
Shuah Khan <shuah@kernel.org> wrote:

> Fix KBUILD_OUTPUT usage instructions. The current documentation
> is incorrect.
> 
> Signed-off-by: Shuah Khan <shuah at kernel.org>

So I'll confess to being a little confused by this one...

>  Documentation/dev-tools/kselftest.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index c8c03388b9de..6c910ddaa9f9 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -39,9 +39,9 @@ Build and run from user specific object directory (make O=dir)::
>  
>    $ make O=/tmp/kselftest kselftest
>  
> -Build and run KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
> +Build and run from KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
>  
> -  $ make KBUILD_OUTPUT=/tmp/kselftest kselftest
> +  $ export KBUILD_OUTPUT=/tmp/kselftest; make kselftest

Is there a particular reason why this variable needs to be set in the
environment rather than just in make?  More importantly, though, I don't
think this would work if you run it from the KBUILD_OUTPUT directory.  What
you're really doing is running with a separate output directory, right?

Thanks,

jon
