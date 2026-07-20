Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F883B2D0D
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 21:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784582161; cv=pass; b=kPACxTu1VF1tuh+qIhT560bonj0NWR/AvrorpWTH4HRMiW0AMs2dZRe+fDLJ5/jw0X9x2OnbbdpZ6zCTaQnUtReVg32+lvls52kSnjJxG/3m4O3WZU4AHilRJryGXrNeKvtSATnKJEdapuYF8qTfrnHTPi2H9+vSYtbKZjJO7X4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784582161; c=relaxed/simple;
	bh=GYmozcAMwSemNlmhz+B3xhx2TrSFNt5xSE7k56r5ovg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uel4hPiFAyme8apF2dKx4wMkvH5za3d4VdnUh6hkSBaFAozO8PyV9CY3L+Dk3X/nekUaqo6g0qPrY6wqSp5iffAbJU94Agg2JqYCf+Gvy1TvolaQGsw3JQwWFJe9VCEQdDyCoPioovjMtGdBcuOhevWFkNG3pCW+L5Yeou/zrKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F5hO0hcB; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F5hO0hcB"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cab97c86bdso454135ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 14:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784582158; cv=none;
        d=google.com; s=arc-20260327;
        b=gDwas5oXo90vk9uvbBhZh406Y8Sd5I3EAKSGU2K8r1pOEOh1JILPqBfDB1vKe5l/+s
         pr5jVlTmn56xEYcBCttZYXeX7kWZf1nJvSwbKarWvJwG0ymD0oL4I7yVxOuOWnJDK6Z9
         RYFhyYumg/b4ltEy1JsSqO4QOIBsND5QQKCWbW7Wt+vZTrk8q4Pf0jIgPT4ry8IV4nYc
         qLO+ozMe2497/Lj8om6eWtiS11SyU6X8yVRAZLp0atmtJt6z3niWTQb1dj1M2yFhu5bJ
         oSnWjlTqffzkjC/KQggNwAED/tHKjhi5Ivyl8vdarKWmrL3sHnvmTlia452SD78sgIwF
         n5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AUz90BaUvuUhSt2RwJPSmjEfCptOlPXUUGIO067pPsI=;
        fh=1N4mCYee748IsD89iI48uxAFcoM4lNc5lNUNP9G/YDA=;
        b=p8XSUlLonDReaeGvNiAoYQJ1KjXZ+j0ayTsjbO8KfT4F8lBrP8cJXFVq+5cjgnqPow
         oRroxOMamDYg5SlxvmmkoqroxGo3adDy/PgFeZmthzEtrhBDHg+IR6y8hM/iTXqV347v
         xSqYg5Ci/UDsJqHRW9389lWH8RI2O0XY/QY1RySLB9r/mqw81WwkOkw3duP9Q0YZt19Z
         5po5FC2+sbFQjH8ZE/K8a7gMF8i2tAACBhAeJobgWBDZfUeEMh60bhBMwsFijFWlDZ1k
         tUMd/I/SadhYjTwpiXQIqYSIj3G8U2Sw65AzEWMPZeKy8H+qR3dliTUWBF68yp7wKpia
         axRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784582158; x=1785186958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AUz90BaUvuUhSt2RwJPSmjEfCptOlPXUUGIO067pPsI=;
        b=F5hO0hcBNHdKGk9M59qXB0EfAf1ZQL0kiD2GIokeaFPVUU7JE0sBVMIOaHAJJlbqf1
         hT0EOsaGQxdzfkSQxV5SGVl+QdL5b6YSb2ZjQcZcLVNAPL1/8wIsNcH96dHr/vpiGqUG
         I/27/r9cfrp5Ztsp3RVhurZRlE2qZSv42m69MWpB8o09v5sRx2Rp61wKfeDuQt8qOgV/
         5Npk2kIQYLRLDeexi5vPRbcgEYHVubzyoIEQIKsfg75YWhiyH8NwE+Gc22p4+NDE9kWL
         Kq02Bv1RfaF6OK4XicyN5ZimBBBuQoKC7Cd85xPJt3ndaYNSfPVYjdP+YdCYZm6nh5OX
         79lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784582158; x=1785186958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUz90BaUvuUhSt2RwJPSmjEfCptOlPXUUGIO067pPsI=;
        b=XVuxDqW3Qv9Dy9RApfI9tM+2bggLRlItbldU6XL4+mttEn5/LWBfLZHWZ84r0eknqV
         E4hql/IG4ffNfArfzlTjM9hYyaBsYGVgR/sf5aYNF5inGuY8McvlFqW0Kw2LmlmRqc4v
         z3zq76nINPqtm82QqL37HWHlSX+mlMP/SwBNGVqdmilkYVSwWGzT3rifORQwCk6oS7NT
         aJuaKo4hIZUCeJ4QLBh387oBoU6vtEkVkffOcGZ1iu6jMTXFn71HIWsqZpPyVffxRuoS
         +MIUf0rQDw0kKrs02fo3DamMlxTRFDToYCFfX94k0KipgN4lWdFBKnz8OGDnADhvYeaX
         bXNA==
X-Forwarded-Encrypted: i=1; AHgh+RqoRu8J8NOp0Ld+dPrE8GSqkuK/BGYOWP1/GgBod7qL5ICUBmFTmRF/10V4cWG8HupsJWinUXBs8hAV6qlUzW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnxnI7T69/whIbAzVDQ157gGUpykljPhG2tadOc6sU3mNEIVXb
	6KHnv4kkBsxYePRKqfrcq9pKzaStZtUr+Tt0SMUIgeB57Q0vz+3vGmPxtrDB2NiQuSsie5gVo/7
	2dHEQIohCqk/FFD0c5Ytv263KmrPDM7yfXwHZvcxk
X-Gm-Gg: AR+sD12HyYgn2yhHYxu5LQ9MO/WKBmduBMl3ZJIcuHzIZzWLrbBxndyDM+ZSbbLKryx
	uSCyY70ZXqbXbnCaZd89VYALwlXxtiEo7bT4i7cZr3sBaJRUU15onC715KQ82/Uzzk97l5pGW6Q
	L4jW0B6zkp4IYfasVLjyQ+aDJxOKUUD+HwpbgcA8G75CNJfuDPjIxPswM0ZfyxLl4Sp8tMAQN0q
	Lxvgx1ldBM04bQF0A66eJUo63HaCRx5ja//jDvbX2RZEbX6TNAnQsUs+FoZuN7RGrk0uFhUw5H7
	SA5n+QWRXc7pcfxcNdBFuhF0DbM=
X-Received: by 2002:a17:902:f54c:b0:2ce:7ae6:2a23 with SMTP id
 d9443c01a7336-2cf7b702c3dmr2558895ad.27.1784582156890; Mon, 20 Jul 2026
 14:15:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com> <20260708-tcpdm-large-niovs-v5-2-34bf6fac941b@meta.com>
In-Reply-To: <20260708-tcpdm-large-niovs-v5-2-34bf6fac941b@meta.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 20 Jul 2026 14:15:42 -0700
X-Gm-Features: AUfX_mxUXqtSIB0dpGSWPZIOzVEGjkP0LeV9jHf6fDBCDwwRrEGRR9CjBBihAPw
Message-ID: <CAHS8izMz_S8K80EXn3oFXiDNkGuPUMzjecaJjAvaZVky-7O40Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] selftests/net: ncdevmem: add -b option to
 set rx-buf-size on bind
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
	sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net, 
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk, 
	Joe Damato <joe@dama.to>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 3:55=E2=80=AFPM Bobby Eshleman <bobbyeshleman@gmail.=
com> wrote:
>
> From: Bobby Eshleman <bobbyeshleman@meta.com>
>
> Add -b <bytes> to request a non-default niov size via
> NETDEV_A_DMABUF_RX_BUF_SIZE. When the value exceeds PAGE_SIZE,
> udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
> hugepage produces one naturally-aligned sg entry.
>
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>

Reviewed-by: Mina Almasry <almasrymina@google.com>


> ---
>  tools/testing/selftests/drivers/net/hw/ncdevmem.c | 36 +++++++++++++++++=
++++--
>  1 file changed, 33 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/te=
sting/selftests/drivers/net/hw/ncdevmem.c
> index d96e8a3b5a65..a16e55af51ee 100644
> --- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> +++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> @@ -40,6 +40,7 @@
>
>  #include <linux/uio.h>
>  #include <stdarg.h>
> +#include <stdint.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <unistd.h>
> @@ -61,6 +62,7 @@
>  #include <sys/time.h>
>
>  #include <linux/memfd.h>
> +#include <sys/param.h>
>  #include <linux/dma-buf.h>
>  #include <linux/errqueue.h>
>  #include <linux/udmabuf.h>
> @@ -79,6 +81,7 @@
>  #define PAGE_SHIFT 12
>  #define TEST_PREFIX "ncdevmem"
>  #define NUM_PAGES 16000
> +#define MB(x) ((x) << 20)
>
>  #ifndef MSG_SOCK_DEVMEM
>  #define MSG_SOCK_DEVMEM 0x2000000
> @@ -100,6 +103,7 @@ static unsigned int dmabuf_id;
>  static uint32_t tx_dmabuf_id;
>  static int waittime_ms =3D 500;
>  static bool fail_on_linear;
> +static uint32_t rx_buf_size;
>
>  /* System state loaded by current_config_load() */
>  #define MAX_FLOWS      8
> @@ -142,6 +146,7 @@ static struct memory_buffer *udmabuf_alloc(size_t siz=
e)
>  {
>         struct udmabuf_create create;
>         struct memory_buffer *ctx;
> +       unsigned int memfd_flags;
>         int ret;
>
>         ctx =3D malloc(sizeof(*ctx));
> @@ -156,9 +161,14 @@ static struct memory_buffer *udmabuf_alloc(size_t si=
ze)
>                 goto err_free_ctx;
>         }
>
> -       ctx->memfd =3D memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
> +       memfd_flags =3D MFD_ALLOW_SEALING;
> +       if (rx_buf_size > getpagesize())
> +               memfd_flags |=3D MFD_HUGETLB | MFD_HUGE_2MB;
> +

The fact that you are using HUGETLM and 2MB mappings here made me
realize there is a pathological edge case in the code where the netmem
size you're requesting is greater than the mapping size, so you
actually get no netmems. So like if you ask for a 64KB netmem size but
actually you did a normal udambuf mapping and all the maps (sg len
entries) are 4K or something. IDK if the code already handles this
well with an error or what not. Worth checking.

--
Thanks,
Mina
