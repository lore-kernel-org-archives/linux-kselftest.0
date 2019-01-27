From: ndesaulniers@google.com (Nick Desaulniers)
Date: Sun, 27 Jan 2019 02:10:31 -0800
Subject: [PATCH] selftests/harness: Update named initializer syntax
In-Reply-To: <20190127094251.GA9391@beast>
References: <20190127094251.GA9391@beast>
Message-ID:
 <CAKwvOd=2ox6FyqSYfSTmc4yyKL7=pktdKJrdweS8wxDKc5a+XA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190127101031.FNBVChNHo0JGgS_wEh8CsKju7jt6Uds4aFoEnu3k7cs@z>

On Sun, Jan 27, 2019@1:42 AM Kees Cook <keescook@chromium.org> wrote:
>
> The harness was still using old-style GNU named initializer syntax.
> Fix this so Clang will stop warning:
>
> seccomp_bpf.c:2924:1: warning: use of GNU old-style field designator extension
>       [-Wgnu-designator]
> ./../kselftest_harness.h:147:25: note: expanded from macro 'TEST'
>                         ^
> ./../kselftest_harness.h:172:5: note: expanded from macro '__TEST_IMPL'
>                   fn: &test_name, termsig: _signal }; \
>                   ^
>
> Signed-off-by: Kees Cook <keescook at chromium.org>
> ---
>  tools/testing/selftests/kselftest_harness.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index 76d654ef3234..2d90c98eeb67 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -168,8 +168,8 @@
>  #define __TEST_IMPL(test_name, _signal) \
>         static void test_name(struct __test_metadata *_metadata); \
>         static struct __test_metadata _##test_name##_object = \
> -               { name: "global." #test_name, \
> -                 fn: &test_name, termsig: _signal }; \
> +               { .name = "global." #test_name, \
> +                 .fn = &test_name, .termsig = _signal }; \
>         static void __attribute__((constructor)) _register_##test_name(void) \
>         { \
>                 __register_test(&_##test_name##_object); \
> @@ -304,9 +304,9 @@
>         } \
>         static struct __test_metadata \
>                       _##fixture_name##_##test_name##_object = { \
> -               name: #fixture_name "." #test_name, \
> -               fn: &wrapper_##fixture_name##_##test_name, \
> -               termsig: signal, \
> +               .name = #fixture_name "." #test_name, \
> +               .fn = &wrapper_##fixture_name##_##test_name, \
> +               .termsig = signal, \

My favorite feature of C, stolen now in C++20.  Thanks for cleaning this up.
Reviewed-by: Nick Desaulniers <ndesaulniers at google.com>

>          }; \
>         static void __attribute__((constructor)) \
>                         _register_##fixture_name##_##test_name(void) \
> --
> 2.17.1
>
>
> --
> Kees Cook



-- 
Thanks,
~Nick Desaulniers
