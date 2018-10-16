From: shuah at kernel.org (Shuah Khan)
Date: Tue, 16 Oct 2018 08:53:45 -0600
Subject: [PATCH] selftests: fix warning: "_GNU_SOURCE" redefined
In-Reply-To: <1539287630-92982-1-git-send-email-peng.hao2@zte.com.cn>
References: <1539287630-92982-1-git-send-email-peng.hao2@zte.com.cn>
Message-ID: <5dbfc86b-17f9-4f56-ebaa-489f70436294@kernel.org>

On 10/11/2018 01:53 PM, Peng Hao wrote:
> Makefile contains -D_GNU_SOURCE. remove define "_GNU_SOURCE"
> in c files.
> 
> Signed-off-by: Peng Hao <peng.hao2 at zte.com.cn>
> ---
>  tools/testing/selftests/proc/fd-001-lookup.c  | 2 +-
>  tools/testing/selftests/proc/fd-003-kthread.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/proc/fd-001-lookup.c b/tools/testing/selftests/proc/fd-001-lookup.c
> index a2010df..60d7948 100644
> --- a/tools/testing/selftests/proc/fd-001-lookup.c
> +++ b/tools/testing/selftests/proc/fd-001-lookup.c
> @@ -14,7 +14,7 @@
>   * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
>   */
>  // Test /proc/*/fd lookup.
> -#define _GNU_SOURCE
> +
>  #undef NDEBUG
>  #include <assert.h>
>  #include <dirent.h>
> diff --git a/tools/testing/selftests/proc/fd-003-kthread.c b/tools/testing/selftests/proc/fd-003-kthread.c
> index 1d659d5..dc591f9 100644
> --- a/tools/testing/selftests/proc/fd-003-kthread.c
> +++ b/tools/testing/selftests/proc/fd-003-kthread.c
> @@ -14,7 +14,7 @@
>   * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
>   */
>  // Test that /proc/$KERNEL_THREAD/fd/ is empty.
> -#define _GNU_SOURCE
> +
>  #undef NDEBUG
>  #include <sys/syscall.h>
>  #include <assert.h>
> 

Thanks for the patch. Applied to linux-kselftest next for 4.20-rc1.

thanks,
-- Shuah
