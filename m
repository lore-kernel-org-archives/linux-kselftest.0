From: yamada.masahiro at socionext.com (Masahiro Yamada)
Date: Sat, 11 May 2019 09:52:04 +0900
Subject: [PATCH 3/3] kheaders: Make it depend on sysfs
In-Reply-To: <20190510210243.152808-4-joel@joelfernandes.org>
References: <20190510210243.152808-1-joel@joelfernandes.org>
 <20190510210243.152808-4-joel@joelfernandes.org>
Message-ID: <CAK7LNATeJqmE29M=Y1Vexg8nnRdr3qUDkq1BejN7t2_106PgVg@mail.gmail.com>

On Sat, May 11, 2019 at 6:05 AM Joel Fernandes (Google)
<joel at joelfernandes.org> wrote:
>
> The kheaders archive is exposed through SYSFS in /sys/kernel/. Make it
> depend on SYSFS as it makes no sense to enable this feature without it.


And, it also makes no sense to break the feature by 1/3,
then fix it by 3/3.


Why don't you squash this?



>
> Suggested-by: Masahiro Yamada <yamada.masahiro at socionext.com>
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> ---
>  init/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index ce08adf0f637..f27138a8cf28 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -581,6 +581,7 @@ config IKCONFIG_PROC
>
>  config IKHEADERS
>         tristate "Enable kernel headers through /sys/kernel/kheaders.tar.xz"
> +       depends on SYSFS
>         help
>           This option enables access to the in-kernel headers that are generated during
>           the build process. These can be used to build eBPF tracing programs,
> --
> 2.21.0.1020.gf2820cf01a-goog
>


-- 
Best Regards
Masahiro Yamada
