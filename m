Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821133BADB3
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 22:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563916; cv=pass; b=H8LoGH3U0ourBgWav4a+Ec0T4425ohL6wgqv6nSp+FYiD2z+9RIzt/mQIfJ1+DcgHxoqSmYT+jL5AB9hcZZat07DZbmc01SsaR7S+lnTBU6M+zWMO3qnpXrrdKaow0CA3RviAefA8j0ZwfHeWOdZuhAX5hvv1/KzU4OXhlUwzOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563916; c=relaxed/simple;
	bh=tifnMs3uxqQLI6PjEM34afP6/zTTxzyFpcFDkVzMVEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVsCMKwnYQouUTX2qDriicnZ/aKkijg9MvR90WrSLCDlKulHgUqBBJb2pQFglq2D+/+7UkFnWQY5Um82Kv+P4VWMvjvsJO6JsF+/c6M2Q43MMFWsjromarDdEO3AChVRSj88nfJnoLLlMwzCLb7XPAxKmqxthw6t+h/3rVpNkvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gwRydzgr; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gwRydzgr"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13986d61b4eso338180c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 15:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781563915; cv=none;
        d=google.com; s=arc-20240605;
        b=bjzN+K5C72cLZcFwTrRvXZRb0tkq2QntjC0rjlDtgSaAdgIRPV4FGnAaeyKo3DRdiJ
         lYdKE00hOHEC+6rsS3reAcicR9NlL18i9cc+iKNpzKBWL/dClYqKTCl7vcKqas8GNXQj
         3fle8/k3WoGoOra4/6q0pSNhLzIe+5lWSDoCksdMdGr9TnsKW6Ow6oWWIHb9JYbL3KEn
         mB9VclXdrrCwo/kKuMrvstjgs1RKu9wX0iuUS8hVem4o9TKjbobYnMhfXwk+53RCyIB7
         DmZLlaT33Ago0vIBeu+Gtdzz/peLYnY6rt8ZWoEEpPcijMQlmsk21GQIS3N0txiZAPLZ
         a4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V7htDb+Jq/c33orgyhz/QuFvE0iXgDEbc65hqs+kuaU=;
        fh=WgqHrirph1P5Mz5VZXJjJ/Zb87J9cbg6MIFN5C+Y4sE=;
        b=MSW85o+N9cAhI6ccVj3NAKtR0vJdom5XK1l3KdyTtcAdElrztkaeBAKNY3WUh8y274
         CqmZl6ab+/yUNNTE/GTrvrtw6PFEhOunWZtqtl58WLQie8gkQNb3LcIvRG+kthpg8yTg
         FNrs4QSrxklGMxFrnWvpVna3P8UpX3r8SadkDJcH7vvv6XHDbJwk5pjp0NWPwSPsMzs/
         N2BgfqIvBLodn4u8yKiHiZWcwLqZlLukbY0SUd/54dkriq0Syq7NLZBrqnbDiPCQKivy
         9cNf+6SZvD6wXCxGiAxct3CnYimwpUm1QEt6TBblFAxV6jmfa0lUsh2QxHYS8q6dcGLn
         m/iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781563915; x=1782168715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7htDb+Jq/c33orgyhz/QuFvE0iXgDEbc65hqs+kuaU=;
        b=gwRydzgr2Wwh0p9Z2rFLJUbsuo9LDN8uStRFC/a77PTf/3Z6zR+pH2Mbwc80vPCPN7
         V6M4kCBb1EMzAm9aHOWcfHbmQL73g1FTkhStfYWjIgVtlpKRteWRAfEMhVxA3woUvsCh
         N375gN+FBZlVn4kDZ41RXEDpdOJKS7QFn9vUgV5vH6eT11zCfuzblVYbnVFF5KlOo5Wp
         0AcE43tude2GTcX8O39Awy4uOVs/PzNGxnu4j/H40iz0umnPQ9XgBRhn6l4CRM5D/Nml
         GH3Hk0BSSYRymKH0W8/nJ9yWYY0Lo8TTnSAwMYIvqiplR7vhgMCyHiSYC/P3wkKptvX2
         VXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781563915; x=1782168715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7htDb+Jq/c33orgyhz/QuFvE0iXgDEbc65hqs+kuaU=;
        b=jgtpHvYih6VFGxVSagHo2NsSpsXxHfKOdpYyxnmbRJNivtr5n9WNr+5IdkHrUG88jS
         6k9Ft5sMOkYSFryrX96ob0cfCcLhzeSN2Ymv5OFxj1b8KdqaAfKINlPVa4xuB5V3bRWd
         /R/rDu8RiKVdGvztHfsBFHaeyC7jld0CEK7Z77eB/mcwi0kZaUT8MkJVERunXTmeDOYP
         6isJYRaW0FUF8EDkUfe6QG1DkYhmW2vV6z7/Wj0Iv3MGob/rr1jziP4kIOUpYOg7n4MZ
         0UyDfGvxbvX168P2meTAHLkd3L52hpKzl5I9a5+zzt4Th8ZYFAOjDLKryl08vIGt0Zop
         fRDA==
X-Forwarded-Encrypted: i=1; AFNElJ9W3kGf84bMFOmy+2WEVTM6Ddy8KnIoN1pq2qJVKz5ca7f9chgrMYKW16Jpegwhmw73K8RyQaRTN8ScoohCrO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmGpMFO5W7Wc9gN03YdGlHSVhzR1kX5Kj78a4FoJg7COzHT71D
	qF06d1ECvwoT2VmwoK7nIc+1CT2/o73VUyl0N+wlWgK90ey5nODW9/a8u27o8PT5UWQFuk0lbeN
	qUYKKKQlEKsEouV6zDNkokLK4jbuc47Ccnzm0G7NK
X-Gm-Gg: Acq92OHLAYN/kmgQjwiZuikvuSCiTjjerW9iARm6GqQ5r0TrGzc73GAlyEdoDSS1VdU
	HwsTceRvv/buXbiDP5vg4B7zndgASzJMvwuqBDwWqJrkFUTrUs8TQd4C/oRporUXXlOa5x+J/99
	RWo6zCOmBH+JbrfhbaEpVEg97Rg1MP4tE2aOQSeoHbJxWtEEMLKhfJSQgJWiD0OksHsQYjMBpEj
	71xcfa+/l3bo2GmdsjZYS/mXWrd9DgXljRwqICppiCKC+U1bBSilI7CNXp9cX3wv14rVD6uADBC
	X+pM/V/49HdJBF97Pw==
X-Received: by 2002:a05:7022:2585:b0:136:c565:e83a with SMTP id
 a92af1059eb24-13985f08bd5mr605265c88.24.1781563913813; Mon, 15 Jun 2026
 15:51:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-scratch-amastro-vfio-selftests-avoid-vlas-v3-0-b3798415c72a@fb.com>
 <20260615-scratch-amastro-vfio-selftests-avoid-vlas-v3-1-b3798415c72a@fb.com>
In-Reply-To: <20260615-scratch-amastro-vfio-selftests-avoid-vlas-v3-1-b3798415c72a@fb.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 15 Jun 2026 15:51:26 -0700
X-Gm-Features: AVVi8CeNxoA54KcrcCyWFzTbn8RVwfvTsFJl5AP-We_ewnvrZTx2yIRi0SqUX1U
Message-ID: <CALzav=ekpRKjyUTNax17SRMHg21OHa4Jq3OGzu+Y0TXW12EeJQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] vfio: selftests: Add calloc_assert() helper
To: Alex Mastro <amastro@fb.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 12:45=E2=80=AFPM Alex Mastro <amastro@fb.com> wrote=
:
>
> Add a calloc_assert() helper alongside the existing ioctl_assert() and
> snprintf_assert() helpers.
>
> Use it for VFIO selftest allocations that immediately assert a
> non-NULL result.
>
> Assisted-by: Codex:gpt-5.5-high
> Signed-off-by: Alex Mastro <amastro@fb.com>
> ---
>  tools/testing/selftests/vfio/lib/include/libvfio/assert.h    | 10 ++++++=
++++
>  tools/testing/selftests/vfio/lib/iommu.c                     | 12 ++++--=
------
>  tools/testing/selftests/vfio/lib/iova_allocator.c            |  4 +---
>  tools/testing/selftests/vfio/lib/sysfs.c                     |  3 +--
>  tools/testing/selftests/vfio/lib/vfio_pci_device.c           |  6 ++----
>  .../testing/selftests/vfio/vfio_pci_device_init_perf_test.c  |  4 ++--
>  6 files changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/assert.h b/=
tools/testing/selftests/vfio/lib/include/libvfio/assert.h
> index 77b68c7129a6..f0490a403826 100644
> --- a/tools/testing/selftests/vfio/lib/include/libvfio/assert.h
> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/assert.h
> @@ -3,6 +3,7 @@
>  #define SELFTESTS_VFIO_LIB_INCLUDE_LIBVFIO_ASSERT_H
>
>  #include <stdio.h>
> +#include <stdlib.h>
>  #include <string.h>
>  #include <sys/ioctl.h>
>
> @@ -45,6 +46,15 @@
>         VFIO_LOG_AND_EXIT(_fmt, ##__VA_ARGS__);                 \
>  } while (0)
>
> +#define calloc_assert(_nmemb, _size) ({                                \
> +       size_t __nmemb =3D (_nmemb);                              \
> +       size_t __size =3D (_size);                                \
> +       void *__ptr =3D calloc(__nmemb, __size);                  \
> +       VFIO_ASSERT_NOT_NULL(__ptr, "calloc(%zu, %zu) failed",  \
> +                            __nmemb, __size);                  \
> +       __ptr;                                                  \
> +})
> +
>  #define ioctl_assert(_fd, _op, _arg) do {                               =
                      \
>         void *__arg =3D (_arg);                                          =
                        \
>         int __ret =3D ioctl((_fd), (_op), (__arg));                      =
                        \
> diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/sel=
ftests/vfio/lib/iommu.c
> index 035dac069d60..31aba9fda8e5 100644
> --- a/tools/testing/selftests/vfio/lib/iommu.c
> +++ b/tools/testing/selftests/vfio/lib/iommu.c
> @@ -286,8 +286,7 @@ static struct vfio_iommu_type1_info *vfio_iommu_get_i=
nfo(int container_fd)
>  {
>         struct vfio_iommu_type1_info *info;
>
> -       info =3D malloc(sizeof(*info));
> -       VFIO_ASSERT_NOT_NULL(info);
> +       info =3D calloc_assert(1, sizeof(*info));
>
>         *info =3D (struct vfio_iommu_type1_info) {
>                 .argsz =3D sizeof(*info),
> @@ -324,8 +323,7 @@ static struct iommu_iova_range *vfio_iommu_iova_range=
s(struct iommu *iommu,
>         cap_range =3D container_of(hdr, struct vfio_iommu_type1_info_cap_=
iova_range, header);
>         VFIO_ASSERT_GT(cap_range->nr_iovas, 0);
>
> -       ranges =3D calloc(cap_range->nr_iovas, sizeof(*ranges));
> -       VFIO_ASSERT_NOT_NULL(ranges);
> +       ranges =3D calloc_assert(cap_range->nr_iovas, sizeof(*ranges));
>
>         for (u32 i =3D 0; i < cap_range->nr_iovas; i++) {
>                 ranges[i] =3D (struct iommu_iova_range){
> @@ -357,8 +355,7 @@ static struct iommu_iova_range *iommufd_iova_ranges(s=
truct iommu *iommu,
>         VFIO_ASSERT_EQ(errno, EMSGSIZE);
>         VFIO_ASSERT_GT(query.num_iovas, 0);
>
> -       ranges =3D calloc(query.num_iovas, sizeof(*ranges));
> -       VFIO_ASSERT_NOT_NULL(ranges);
> +       ranges =3D calloc_assert(query.num_iovas, sizeof(*ranges));
>
>         query.allowed_iovas =3D (uintptr_t)ranges;
>
> @@ -424,8 +421,7 @@ struct iommu *iommu_init(const char *iommu_mode)
>         struct iommu *iommu;
>         int version;
>
> -       iommu =3D calloc(1, sizeof(*iommu));
> -       VFIO_ASSERT_NOT_NULL(iommu);
> +       iommu =3D calloc_assert(1, sizeof(*iommu));
>
>         INIT_LIST_HEAD(&iommu->dma_regions);
>
> diff --git a/tools/testing/selftests/vfio/lib/iova_allocator.c b/tools/te=
sting/selftests/vfio/lib/iova_allocator.c
> index 8c1cc86b70cd..2e7d54e1b4c6 100644
> --- a/tools/testing/selftests/vfio/lib/iova_allocator.c
> +++ b/tools/testing/selftests/vfio/lib/iova_allocator.c
> @@ -29,8 +29,7 @@ struct iova_allocator *iova_allocator_init(struct iommu=
 *iommu)
>         ranges =3D iommu_iova_ranges(iommu, &nranges);
>         VFIO_ASSERT_NOT_NULL(ranges);
>
> -       allocator =3D malloc(sizeof(*allocator));
> -       VFIO_ASSERT_NOT_NULL(allocator);
> +       allocator =3D calloc_assert(1, sizeof(*allocator));

Did you mean to replace malloc() with calloc()? Feel free to add a
malloc_assert().

>
>         *allocator =3D (struct iova_allocator){
>                 .ranges =3D ranges,
> @@ -90,4 +89,3 @@ iova_t iova_allocator_alloc(struct iova_allocator *allo=
cator, size_t size)
>                 allocator->range_offset =3D 0;
>         }
>  }
> -
> diff --git a/tools/testing/selftests/vfio/lib/sysfs.c b/tools/testing/sel=
ftests/vfio/lib/sysfs.c
> index 11415448b2e2..98a46a2543cd 100644
> --- a/tools/testing/selftests/vfio/lib/sysfs.c
> +++ b/tools/testing/selftests/vfio/lib/sysfs.c
> @@ -107,8 +107,7 @@ char *sysfs_sriov_vf_bdf_get(const char *pf_bdf, int =
i)
>         char *out_vf_bdf;
>
>         /* Fit "0000:00:00.0" */
> -       out_vf_bdf =3D calloc(16, sizeof(char));
> -       VFIO_ASSERT_NOT_NULL(out_vf_bdf);
> +       out_vf_bdf =3D calloc_assert(16, sizeof(char));
>
>         snprintf_assert(path, PATH_MAX, "/sys/bus/pci/devices/%s/virtfn%d=
", pf_bdf, i);
>         readlink_base(path, "%s", out_vf_bdf);
> diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/t=
esting/selftests/vfio/lib/vfio_pci_device.c
> index 94dc5fcecbeb..eb40f7159bae 100644
> --- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> +++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> @@ -343,8 +343,7 @@ const char *vfio_pci_get_cdev_path(const char *bdf)
>         char *cdev_path;
>         DIR *dir;
>
> -       cdev_path =3D calloc(PATH_MAX, 1);
> -       VFIO_ASSERT_NOT_NULL(cdev_path);
> +       cdev_path =3D calloc_assert(PATH_MAX, 1);
>
>         snprintf_assert(dir_path, sizeof(dir_path), "/sys/bus/pci/devices=
/%s/vfio-dev/", bdf);
>
> @@ -425,8 +424,7 @@ struct vfio_pci_device *vfio_pci_device_alloc(const c=
har *bdf, struct iommu *iom
>  {
>         struct vfio_pci_device *device;
>
> -       device =3D calloc(1, sizeof(*device));
> -       VFIO_ASSERT_NOT_NULL(device);
> +       device =3D calloc_assert(1, sizeof(*device));
>
>         VFIO_ASSERT_NOT_NULL(iommu);
>         device->iommu =3D iommu;
> diff --git a/tools/testing/selftests/vfio/vfio_pci_device_init_perf_test.=
c b/tools/testing/selftests/vfio/vfio_pci_device_init_perf_test.c
> index 33b0c31fe2ed..e1a54e153cd3 100644
> --- a/tools/testing/selftests/vfio/vfio_pci_device_init_perf_test.c
> +++ b/tools/testing/selftests/vfio/vfio_pci_device_init_perf_test.c
> @@ -45,8 +45,8 @@ FIXTURE_SETUP(vfio_pci_device_init_perf_test)
>         int i;
>
>         self->iommu =3D iommu_init(variant->iommu_mode);
> -       self->threads =3D calloc(nr_devices, sizeof(self->threads[0]));
> -       self->thread_args =3D calloc(nr_devices, sizeof(self->thread_args=
[0]));
> +       self->threads =3D calloc_assert(nr_devices, sizeof(self->threads[=
0]));
> +       self->thread_args =3D calloc_assert(nr_devices, sizeof(self->thre=
ad_args[0]));
>
>         pthread_barrier_init(&self->barrier, NULL, nr_devices);
>
>
> --
> 2.53.0-Meta
>
