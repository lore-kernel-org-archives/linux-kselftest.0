From: Felix.Kuehling@amd.com (Kuehling, Felix)
Date: Tue, 7 May 2019 16:44:02 +0000
Subject: [PATCH v15 12/17] drm/radeon, arm64: untag user pointers in
 radeon_gem_userptr_ioctl
In-Reply-To: <03fe9d923db75cf72678f3ce103838e67390751a.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <03fe9d923db75cf72678f3ce103838e67390751a.1557160186.git.andreyknvl@google.com>
Message-ID: <7568118b-ad57-156c-464f-54fb3f90a783@amd.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507164402.GQBmlBVI2ZYblAusW8yuFDO3465_dms6wNSNOxXWBuE@z>

On 2019-05-06 12:30 p.m., Andrey Konovalov wrote:
> [CAUTION: External Email]
>
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
>
> In radeon_gem_userptr_ioctl() an MMU notifier is set up with a (tagged)
> userspace pointer. The untagged address should be used so that MMU
> notifiers for the untagged address get correctly matched up with the right
> BO. This funcation also calls radeon_ttm_tt_pin_userptr(), which uses
> provided user pointers for vma lookups, which can only by done with
> untagged pointers.
>
> This patch untags user pointers in radeon_gem_userptr_ioctl().
>
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
Acked-by: Felix Kuehling <Felix.Kuehling at amd.com>


> ---
>   drivers/gpu/drm/radeon/radeon_gem.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 44617dec8183..90eb78fb5eb2 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -291,6 +291,8 @@ int radeon_gem_userptr_ioctl(struct drm_device *dev, void *data,
>          uint32_t handle;
>          int r;
>
> +       args->addr = untagged_addr(args->addr);
> +
>          if (offset_in_page(args->addr | args->size))
>                  return -EINVAL;
>
> --
> 2.21.0.1020.gf2820cf01a-goog
>
