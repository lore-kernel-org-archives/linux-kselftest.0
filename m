From: keescook@chromium.org (Kees Cook)
Date: Fri, 7 Jun 2019 21:05:02 -0700
Subject: [PATCH v16 14/16] tee, arm64: untag user pointers in
 tee_shm_register
In-Reply-To: <dc3f3092abbc0d48e51b2e2a2ca8f4c4f69fa0f4.1559580831.git.andreyknvl@google.com>
References: <cover.1559580831.git.andreyknvl@google.com>
 <dc3f3092abbc0d48e51b2e2a2ca8f4c4f69fa0f4.1559580831.git.andreyknvl@google.com>
Message-ID: <201906072104.B6A89D8CB@keescook>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190608040502.pKmj28Of0lRqFWB7YZwCAgZG1-IEZVnQTC-65Qabko8@z>

On Mon, Jun 03, 2019@06:55:16PM +0200, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
> 
> tee_shm_register()->optee_shm_unregister()->check_mem_type() uses provided
> user pointers for vma lookups (via __check_mem_type()), which can only by
> done with untagged pointers.
> 
> Untag user pointers in this function.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>

"tee: shm: untag user pointers in tee_shm_register"

Reviewed-by: Kees Cook <keescook at chromium.org>

-Kees

> ---
>  drivers/tee/tee_shm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 49fd7312e2aa..96945f4cefb8 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -263,6 +263,7 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
>  	shm->teedev = teedev;
>  	shm->ctx = ctx;
>  	shm->id = -1;
> +	addr = untagged_addr(addr);
>  	start = rounddown(addr, PAGE_SIZE);
>  	shm->offset = addr - start;
>  	shm->size = length;
> -- 
> 2.22.0.rc1.311.g5d7573a151-goog
> 

-- 
Kees Cook
