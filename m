From: keescook@chromium.org (Kees Cook)
Date: Tue, 2 Apr 2019 14:35:02 -0700
Subject: [PATCH v3 6/7] lib/string: Add strscpy_pad() function
In-Reply-To: <20190306214226.14598-7-tobin@kernel.org>
References: <20190306214226.14598-1-tobin@kernel.org>
 <20190306214226.14598-7-tobin@kernel.org>
Message-ID:
 <CAGXu5j+4hxuOcrm5mqHuUS4TfLZRrR7+uEUOr9YKsK7sAWJJ8A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190402213502.VWNLFapkM9ni8tnln00zdWv9twWNMOO81fiEPYoLpzg@z>

On Wed, Mar 6, 2019@1:43 PM Tobin C. Harding <tobin@kernel.org> wrote:
>
> We have a function to copy strings safely and we have a function to copy
> strings and zero the tail of the destination (if source string is
> shorter than destination buffer) but we do not have a function to do
> both at once.  This means developers must write this themselves if they
> desire this functionality.  This is a chore, and also leaves us open to
> off by one errors unnecessarily.
>
> Add a function that calls strscpy() then memset()s the tail to zero if
> the source string is shorter than the destination buffer.
>
> Signed-off-by: Tobin C. Harding <tobin at kernel.org>

Lovely. :)

Acked-by: Kees Cook <keescook at chromium.org>

-Kees

> ---
>  include/linux/string.h |  4 ++++
>  lib/string.c           | 47 +++++++++++++++++++++++++++++++++++-------
>  2 files changed, 44 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/string.h b/include/linux/string.h
> index 7927b875f80c..bfe95bf5d07e 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -31,6 +31,10 @@ size_t strlcpy(char *, const char *, size_t);
>  #ifndef __HAVE_ARCH_STRSCPY
>  ssize_t strscpy(char *, const char *, size_t);
>  #endif
> +
> +/* Wraps calls to strscpy()/memset(), no arch specific code required */
> +ssize_t strscpy_pad(char *dest, const char *src, size_t count);
> +
>  #ifndef __HAVE_ARCH_STRCAT
>  extern char * strcat(char *, const char *);
>  #endif
> diff --git a/lib/string.c b/lib/string.c
> index 38e4ca08e757..3a3353512184 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -159,11 +159,9 @@ EXPORT_SYMBOL(strlcpy);
>   * @src: Where to copy the string from
>   * @count: Size of destination buffer
>   *
> - * Copy the string, or as much of it as fits, into the dest buffer.
> - * The routine returns the number of characters copied (not including
> - * the trailing NUL) or -E2BIG if the destination buffer wasn't big enough.
> - * The behavior is undefined if the string buffers overlap.
> - * The destination buffer is always NUL terminated, unless it's zero-sized.
> + * Copy the string, or as much of it as fits, into the dest buffer.  The
> + * behavior is undefined if the string buffers overlap.  The destination
> + * buffer is always NUL terminated, unless it's zero-sized.
>   *
>   * Preferred to strlcpy() since the API doesn't require reading memory
>   * from the src string beyond the specified "count" bytes, and since
> @@ -173,8 +171,10 @@ EXPORT_SYMBOL(strlcpy);
>   *
>   * Preferred to strncpy() since it always returns a valid string, and
>   * doesn't unnecessarily force the tail of the destination buffer to be
> - * zeroed.  If the zeroing is desired, it's likely cleaner to use strscpy()
> - * with an overflow test, then just memset() the tail of the dest buffer.
> + * zeroed.  If zeroing is desired please use strscpy_pad().
> + *
> + * Return: The number of characters copied (not including the trailing
> + *         %NUL) or -E2BIG if the destination buffer wasn't big enough.
>   */
>  ssize_t strscpy(char *dest, const char *src, size_t count)
>  {
> @@ -237,6 +237,39 @@ ssize_t strscpy(char *dest, const char *src, size_t count)
>  EXPORT_SYMBOL(strscpy);
>  #endif
>
> +/**
> + * strscpy_pad() - Copy a C-string into a sized buffer
> + * @dest: Where to copy the string to
> + * @src: Where to copy the string from
> + * @count: Size of destination buffer
> + *
> + * Copy the string, or as much of it as fits, into the dest buffer.  The
> + * behavior is undefined if the string buffers overlap.  The destination
> + * buffer is always %NUL terminated, unless it's zero-sized.
> + *
> + * If the source string is shorter than the destination buffer, zeros
> + * the tail of the destination buffer.
> + *
> + * For full explanation of why you may want to consider using the
> + * 'strscpy' functions please see the function docstring for strscpy().
> + *
> + * Return: The number of characters copied (not including the trailing
> + *         %NUL) or -E2BIG if the destination buffer wasn't big enough.
> + */
> +ssize_t strscpy_pad(char *dest, const char *src, size_t count)
> +{
> +       ssize_t written;
> +
> +       written = strscpy(dest, src, count);
> +       if (written < 0 || written == count - 1)
> +               return written;
> +
> +       memset(dest + written + 1, 0, count - written - 1);
> +
> +       return written;
> +}
> +EXPORT_SYMBOL(strscpy_pad);
> +
>  #ifndef __HAVE_ARCH_STRCAT
>  /**
>   * strcat - Append one %NUL-terminated string to another
> --
> 2.20.1
>


-- 
Kees Cook
