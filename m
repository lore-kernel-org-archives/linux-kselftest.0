From: mcgrof at kernel.org (Luis Chamberlain)
Date: Thu, 29 Nov 2018 19:30:46 -0800
Subject: [RFC v3 06/19] arch: um: enable running kunit from User Mode Linux
In-Reply-To: <20181128193636.254378-7-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-7-brendanhiggins@google.com>
Message-ID: <20181130033046.GI18410@garbanzo.do-not-panic.com>

On Wed, Nov 28, 2018 at 11:36:23AM -0800, Brendan Higgins wrote:
> Make minimum number of changes outside of the KUnit directories for
> KUnit to build and run using UML.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> ---
>  Kconfig  | 2 ++
>  Makefile | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Kconfig b/Kconfig
> index 48a80beab6853..10428501edb78 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -30,3 +30,5 @@ source "crypto/Kconfig"
>  source "lib/Kconfig"
>  
>  source "lib/Kconfig.debug"
> +
> +source "kunit/Kconfig"

Since this is all UML why not source it from arch/um/Kconfig instead?

  Luis
