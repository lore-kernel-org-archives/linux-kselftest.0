From: Felix.Kuehling at amd.com (Kuehling, Felix)
Date: Tue, 7 May 2019 16:43:44 +0000
Subject: [PATCH v15 11/17] drm/amdgpu, arm64: untag user pointers
In-Reply-To: <84676a97cec129eb7a10559ceae2bec526160ad6.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <84676a97cec129eb7a10559ceae2bec526160ad6.1557160186.git.andreyknvl@google.com>
Message-ID: <f452d003-157d-c307-3a27-fe5c3394e34e@amd.com>

On 2019-05-06 12:30 p.m., Andrey Konovalov wrote:
> [CAUTION: External Email]
>
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
>
> In amdgpu_gem_userptr_ioctl() and amdgpu_amdkfd_gpuvm.c/init_user_pages()
> an MMU notifier is set up with a (tagged) userspace pointer. The untagged
> address should be used so that MMU notifiers for the untagged address get
> correctly matched up with the right BO. This patch untag user pointers in
> amdgpu_gem_userptr_ioctl() for the GEM case and in amdgpu_amdkfd_gpuvm_
> alloc_memory_of_gpu() for the KFD case. This also makes sure that an
> untagged pointer is passed to amdgpu_ttm_tt_get_user_pages(), which uses
> it for vma lookups.
>
> Suggested-by: Kuehling, Felix <Felix.Kuehling at amd.com>
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>

Acked-by: Felix Kuehling <Felix.Kuehling at amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 1921dec3df7a..20cac44ed449 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1121,7 +1121,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>                  alloc_flags = 0;
>                  if (!offset || !*offset)
>                          return -EINVAL;
> -               user_addr = *offset;
> +               user_addr = untagged_addr(*offset);
>          } else if (flags & ALLOC_MEM_FLAGS_DOORBELL) {
>                  domain = AMDGPU_GEM_DOMAIN_GTT;
>                  alloc_domain = AMDGPU_GEM_DOMAIN_CPU;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index d21dd2f369da..985cb82b2aa6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -286,6 +286,8 @@ int amdgpu_gem_userptr_ioctl(struct drm_device *dev, void *data,
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
