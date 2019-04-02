From: keescook at chromium.org (Kees Cook)
Date: Tue, 2 Apr 2019 14:24:59 -0700
Subject: [PATCH v3 1/7] lib/test_printf: Add empty module_exit function
In-Reply-To: <20190306214226.14598-2-tobin@kernel.org>
References: <20190306214226.14598-1-tobin@kernel.org>
 <20190306214226.14598-2-tobin@kernel.org>
Message-ID: <CAGXu5jKs5PZquDwj3B_7P6UH7aahawDkTdf2RWooiuj1uJy4WQ@mail.gmail.com>

On Wed, Mar 6, 2019 at 1:43 PM Tobin C. Harding <tobin at kernel.org> wrote:
>
> Currently the test_printf module does not have an exit function, this
> prevents the module from being unloaded.  If we cannot unload the
> module we cannot run the tests a second time.
>
> Add an empty exit function.
>
> Signed-off-by: Tobin C. Harding <tobin at kernel.org>

Acked-by: Kees Cook <keescook at chromium.org>

-Kees

> ---
>  lib/test_printf.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/lib/test_printf.c b/lib/test_printf.c
> index 659b6cc0d483..601e8519319a 100644
> --- a/lib/test_printf.c
> +++ b/lib/test_printf.c
> @@ -615,5 +615,11 @@ test_printf_init(void)
>
>  module_init(test_printf_init);
>
> +static void __exit test_printf_exit(void)
> +{
> +}
> +
> +module_exit(test_printf_exit);
> +
>  MODULE_AUTHOR("Rasmus Villemoes <linux at rasmusvillemoes.dk>");
>  MODULE_LICENSE("GPL");
> --
> 2.20.1
>


-- 
Kees Cook
