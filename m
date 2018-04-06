From: pintu.ping@gmail.com (Pintu Kumar)
Date: Fri, 6 Apr 2018 23:12:01 +0530
Subject: [PATCH v2] selftests/android/ion: fix heap_type may be
 uninitialized
In-Reply-To: <20180405073907.30615-1-anders.roxell@linaro.org>
References: <20180308134845.32409-1-anders.roxell@linaro.org>
 <20180405073907.30615-1-anders.roxell@linaro.org>
Message-ID:
 <CAOuPNLhgAZB2w8eK4UvbtNo1mSXakpe3sKNbfSOzpoHB0iN3OA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180406174201.zIqiXaLLentrObhljxk1bLqpIYtdhI5wa9g5_yo1j8w@z>

On Thu, Apr 5, 2018@1:09 PM, Anders Roxell <anders.roxell@linaro.org> wrote:
> gcc warns that 'heap_type' is not initialized if we don't come through
> any of the two 'case' statesments before:
>
> ionapp_export.c:91:2: warning: ‘heap_type’ may be used uninitialized in
> this function [-Wmaybe-uninitialized]
>   printf("heap_type: %ld, heap_size: %ld\n", heap_type, heap_size);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> In the current code, we initialize the heap_type to -1 before the 'case'
> statements. We also change the print_usage function to state that
> heap_type and heap_size isn't optional, they are mandatory.
>
> Fixes: 47a18c42d992 ("android/ion: userspace test utility for ion buffer sharing")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
>  tools/testing/selftests/android/ion/ionapp_export.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/android/ion/ionapp_export.c b/tools/testing/selftests/android/ion/ionapp_export.c
> index a944e72621a9..67a0263a7f28 100644
> --- a/tools/testing/selftests/android/ion/ionapp_export.c
> +++ b/tools/testing/selftests/android/ion/ionapp_export.c
> @@ -31,8 +31,10 @@
>
>  void print_usage(int argc, char *argv[])
>  {
> -       printf("Usage: %s [-h <help>] [-i <heap id>] [-s <size in bytes>]\n",
> +       printf("Usage: %s [-h <help>] -i <heap id> -s <size in bytes>\n",
>                 argv[0]);
> +       printf("    Supported heap id's 0 or 1\n");
> +       printf("    Heap size > 0\n");
>  }
>
>  int main(int argc, char *argv[])
> @@ -40,7 +42,8 @@ int main(int argc, char *argv[])
>         int opt, ret, status, heapid;
>         int sockfd, client_fd, shared_fd;
>         unsigned char *map_buf;
> -       unsigned long map_len, heap_type, heap_size, flags;
> +       unsigned long map_len, heap_size, flags;
> +       long heap_type;
>         struct ion_buffer_info info;
>         struct socket_info skinfo;
>
> @@ -50,6 +53,7 @@ int main(int argc, char *argv[])
>         }
>
>         heap_size = 0;
> +       heap_type = -1;
>         flags = 0;
>

To make it simple, I would suggest, let the default heap_type be 0.
Actually that was my original intention but I would have missed it
during submission.
In that case nothing below is required to change.

>         while ((opt = getopt(argc, argv, "hi:s:")) != -1) {
> @@ -68,7 +72,7 @@ int main(int argc, char *argv[])
>                                 heap_type = ION_HEAP_TYPE_SYSTEM_CONTIG;
>                                 break;
>                         default:
> -                               printf("ERROR: heap type not supported\n");
> +                               print_usage(argc, argv);
>                                 exit(1);
>                         }
>                         break;
> @@ -82,8 +86,7 @@ int main(int argc, char *argv[])
>                 }
>         }
>
> -       if (heap_size <= 0) {
> -               printf("heap_size cannot be 0\n");
> +       if (heap_size <= 0 || heap_type < 0) {
>                 print_usage(argc, argv);
>                 exit(1);
>         }
> --
> 2.11.0
>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
