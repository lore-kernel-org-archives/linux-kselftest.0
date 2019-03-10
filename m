From: zohar@linux.ibm.com (Mimi Zohar)
Date: Sun, 10 Mar 2019 13:48:07 -0400
Subject: [PATCH] selftests/ima: Add missing '=y' to config options
In-Reply-To: <20190228233030.10480-1-pvorel@suse.cz>
References: <20190228233030.10480-1-pvorel@suse.cz>
Message-ID: <1552240087.5062.9.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190310174807.m9ChDEzbcduroZ5tTTn_sHnnC_9P95_AvDx829o04EM@z>

On Fri, 2019-03-01@00:30 +0100, Petr Vorel wrote:
> so the file can be used as kernel config snippet.
> 
> Signed-off-by: Petr Vorel <pvorel at suse.cz>

Thanks!  The tests now read the kernel config.  Removing
"CONFIG_KEXEC_VERIFY_SIG" permits testing with/without it configured.

Mimi

> ---
>  tools/testing/selftests/ima/config | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/ima/config b/tools/testing/selftests/ima/config
> index 6bc86d4d9bb4..9b968cd55199 100644
> --- a/tools/testing/selftests/ima/config
> +++ b/tools/testing/selftests/ima/config
> @@ -1,4 +1,4 @@
> -CONFIG_IMA_APPRAISE
> -CONFIG_IMA_ARCH_POLICY
> -CONFIG_SECURITYFS
> -CONFIG_KEXEC_VERIFY_SIG
> +CONFIG_IMA_APPRAISE=y
> +CONFIG_IMA_ARCH_POLICY=y
> +CONFIG_SECURITYFS=y
> +CONFIG_KEXEC_VERIFY_SIG=y
