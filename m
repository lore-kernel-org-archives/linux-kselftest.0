From: kieran.bingham at ideasonboard.com (Kieran Bingham)
Date: Wed, 17 Oct 2018 16:29:38 +0100
Subject: [RFC v1 06/31] arch: um: enabled running kunit from User Mode
 Linux
In-Reply-To: <20181016235120.138227-7-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
 <20181016235120.138227-7-brendanhiggins@google.com>
Message-ID: <f0d64a0a-7914-f390-c0b5-dc7626b45476@ideasonboard.com>

Hi Brendan,

I very excitedly jumped on these patches to try them out, as this is
essentially something I was trying to do a few weeks back.

On 17/10/18 00:50, Brendan Higgins wrote:
> Makes minimum number of changes outside of the KUnit directories for
> KUnit to build and run using UML.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> ---
>  Makefile             | 2 +-
>  arch/um/Kconfig.rest | 3 +++

But this file isn't present on v4.19-rc8

It looks like the file is removed at f163977d21a2 ("um: cleanup Kconfig
files")

What version have you currently based these patches on?
Do you expect to keep a branch somewhere that's easy to pull in?

Please add me to the CC list as an interested party on later versions :-)

It might be of interest to the automated testing mailing list too ? (Tim?)

--
regards

Kieran


>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 863f58503beed..c8e659468ed49 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -944,7 +944,7 @@ endif
>  
>  
>  ifeq ($(KBUILD_EXTMOD),)
> -core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
> +core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
>  
>  vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
>  		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
> diff --git a/arch/um/Kconfig.rest b/arch/um/Kconfig.rest
> index 08327b9c0cbea..484c4cfcad1ef 100644
> --- a/arch/um/Kconfig.rest
> +++ b/arch/um/Kconfig.rest
> @@ -1,4 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
> +
> +source "kunit/Kconfig"
> +
>  source "init/Kconfig"
>  
>  source "kernel/Kconfig.freezer"
> 
