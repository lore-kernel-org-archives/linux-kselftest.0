From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Wed, 5 Jun 2019 02:30:12 +0900
Subject: [PATCH] kbuild: teach kselftest-merge to find nested config files
In-Reply-To: <20190520151614.19188-1-dan.rue@linaro.org>
References: <20190520151614.19188-1-dan.rue@linaro.org>
Message-ID:
 <CAK7LNARonAGTShZTyiDL02qtP3PUg7jyYZRHG9C-MUY+zKY22g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190604173012.-GEYIDJ4GD2Cx8MCI5reIK6l7NPBHsBAFUPzZK0wzc8@z>

On Tue, May 21, 2019@12:19 AM Dan Rue <dan.rue@linaro.org> wrote:
>
> Current implementation of kselftest-merge only finds config files that
> are one level deep using `$(srctree)/tools/testing/selftests/*/config`.
>
> Often, config files are added in nested directories, and do not get
> picked up by kselftest-merge.
>
> Use `find` to catch all config files under
> `$(srctree)/tools/testing/selftests` instead.
>
> Signed-off-by: Dan Rue <dan.rue at linaro.org>
> ---
>  Makefile | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index a45f84a7e811..e99e7f9484af 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1228,9 +1228,8 @@ kselftest-clean:
>  PHONY += kselftest-merge
>  kselftest-merge:
>         $(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
> -       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
> -               -m $(objtree)/.config \
> -               $(srctree)/tools/testing/selftests/*/config
> +       $(Q)find $(srctree)/tools/testing/selftests -name config | \
> +               xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
>         +$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>
>  # ---------------------------------------------------------------------------
> --
> 2.21.0
>


Applied to linux-kbuild/fixes. Thanks.




-- 
Best Regards
Masahiro Yamada
