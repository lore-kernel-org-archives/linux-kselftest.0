Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795559124;
	b=eiy5KHgErQ3wqMqUf512xWHaTASXxZ7CpS/0vGk/Y435pIJA+Wqv6DUKOzKps3+reGg2
	 nOThsvy7ejN90Zuh+8R8+OOGulAvpRMmpG845LXmJl7aVI09TT25BYY0d8aVOZFRSuRO/
	 EKF6BqIh81BmdBtyv7X9Q6KQnnH0ZIoV8ii1+hdMHy4gxblnBqb/ldi48w5bo0zxRTD/F
	 WKaL7ifgUXRaY4VNO64Hs7l3oqZrMbLlNOC+nCVKwPWmyhGs8/BqHi5OLBzSOfWxkuaK5
	 pOuR2mI8lSog7yg+WE8QlcADB0DGS/tspEEj9Ya7T+jbJEoUIq7MMaaGRP7olkSLyiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EAJKFMsoiiC78zOtAoZbxgMl0cT/7CbdsqUgXu3XoJ8=;
	b=ZXjwK1U0SPAcTxBL8ck0IQFZV4ZhmeyOoHuBLUhcy6vF6PCKx5dUuPAfWpysprmGSh7n
	 KH51SvdgLCVfoGTRMGarQS8Ue0pP1O4D4zoc8VoBJ5s/XuvywWqHkAWR2J/yKuf+eaV0C
	 kuk0k+jgFVN7frAVShjx9Ff86YzS7IxQVyfOdhXF6WYsHs9JgkSop9TJ7GFElBS7TycEu
	 kW7DYR1oKM4OgYui9TPkYX5z9GCz5Tvdwz9CldV6BkZYYK8/R1yRG7Bu/LGnAYTZdAwbX
	 q1YUicXtyNENoOdn2sO8x1+Vw9zaT/zw+xGbowSGpCEYUSFplnXEr3TVftdJ3myu2BQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N2GWJCzq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB600606A31E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 22:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB600606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N2GWJCzq
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so202405e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 14:25:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795559121; cv=none;
        d=google.com; s=arc-20260327;
        b=K3cKq5C9M/L7SfDw11ibXzSW6EV7cCiH/EcWUCwG0Ga2/Z05cIk1qpgankwDOA+jnv
         WFnkkbN37LLmkElS4MS7HV4RfWuXF3wdacwIi5ghgWnZU0VOStoMqH1C3dnVe4kyQ/PT
         JsKYKBnp4CSBID8BQiCeHd/3D80v9XCN+7C3P7dIw39+JnBYxUNrZ8M9p8UryWtKOebs
         444Mx71fS5JP1HqYnZmEC8x93r2xQc69rEZ4TRJObXBOBFVup1bFEhBxDI+cNVA9qFJ7
         oDf2PomgWTSabaIBMThR5fB+liLKMz+zyVsGDItycsNOArCN+KAO7quez9Ur8KfZJzXz
         CnRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EAJKFMsoiiC78zOtAoZbxgMl0cT/7CbdsqUgXu3XoJ8=;
        fh=cYsj0Q0bLAkEUiVmC5yEAAoXmgajRUl7E9DbSMEA2O8=;
        b=dblzL8qXP30PaoLB7fY122SHqQeallNClZJfGkzNoBxJPtnG2GbG1yJUQE7TLoqp7/
         cmfUvD3gRsj8TDZPBZU/HlpDLCL2AfHuz6smfUFmyXe+mz8DiYMX30XJrf4SMGVw2zF8
         uLUFubZuqSFDGZjVQz1Mjtxb3bJuM7n1IgB7YdkKRl5q6I7eF5JZMMWzrWMqLLEZsjXa
         2/ZrJsojKIhmnJVsyIaYa6hJRz2qeNjD0OvuezvoVF/uRdgWhE7ACynb96sb7mKyRY5T
         4Wn6prlGsQrz4noSdQMfOGBEQ3ZVkpzxranzw8Qt6noQpaOQmmFzsM5MXSNiS6PKp2TF
         uHsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795559121; x=1796163921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EAJKFMsoiiC78zOtAoZbxgMl0cT/7CbdsqUgXu3XoJ8=;
        b=N2GWJCzqiaMrirNLibPnmyf6tjcUM9DrHFWhPhku4m2GcfQHoAucBnUQahQ2yo4eR8
         2MM3NHLDkcinEXO90EAiFuuY7PYg92givKT2uKNItdPgjQ9efrdnbjT1AFRj/tb6WMVn
         nuhuGPFwiZdJvHl1FarzOz36rHIXx2YpNy1kZ03hj8aT45jNliw3WufRm8bmo8vwUG2u
         IPrJiSXumFtsR741KL2k+F8gd5B7mlmmdu0IgwPbFtNUIOVFIyVVU6rvgd4NwuPjRd2Y
         jtgDUssk+cLci7e7rc9KHIkyftGsbxgKCzngYa+XccuyMygdQWyrsmPCf+TtJE78TTN+
         slKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559121; x=1796163921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAJKFMsoiiC78zOtAoZbxgMl0cT/7CbdsqUgXu3XoJ8=;
        b=KSeizbrLSb27s65nVwTGX2GG+gIecptkR/PNaGHTnNTYX1CznnfB4t1z76fsNOAQX4
         opWkN7wAUKs+F2IklzZQ5ojzaJE1fhH9JrY5NMC1bK/lSLlKNrCyNM3SJgHG7ZRqe5WB
         Ff19jZGIe3BnKVp5XQ/aRfpTgu1y4xHWHzBldK89Yj5qFbAK1ZJcaPe90U73PE3m6jwA
         epi7p31on1q7IEh/hYHFuiT4m0s93hYBEQ39VYMXNKIWAHOsDNS/Hv1kSiKwJrVFYdQK
         TA5oh33bR/B+UDPBg7mocDGEtiHFAiVfujqUYkgD8r+D70JVVssPs10Tfo3GpRFYCbpa
         6x8Q==
X-Forwarded-Encrypted: i=1; AL+hErHmaAS/xzitNfmfcQ558ECIJXsZa4fKAg7C6sBVtpKWEFCBilnWMwlXgGWIM34T/ca4HWdelZTW1wPrzqKrqvo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sJrfnMSewIMw09+g1H2w6hMeY6szqb/F4EGq5FxB9MBFY+WOG
	oEoIUlEPduvw/4fpXHP0VLxAzxNYF5qC8GAOSKdK2HbdKaXD8T1dGfVNibNEz3SOTec7A/xAWtQ
	W96xFu83n9elmX+t5BpJYJHF4xLwPQT7K7VProW39
X-Gm-Gg: AZFdTZfhe3ab+ndEyxedwqvBbJjIGn0bdHI38syDDK1z5LzGLd5F3jl0i7aUCoL6Y6r
	ObDbxIwRRKn3ecpmBJXZrGk1/b2SvidcW3vCDBjHvgzCDHMa12qcCud4GY+lJGm301QjoHnBlWl
	KfX0OTo8n57Aq/E4UdKCArPRkKDAXw8Llu1g+TFgXoHUZ+LH2yp6Jrhe6QXDuyBA81T6g8Tu0Pc
	EN7YZ2b8Kwcp6sy3dOh2xyzWnN5a2Gc1CRP0ehoa4yhTTpNqUMI/gUchfdwP9eazWpYxJ1SJJRI
	WH+dVmyiA7trbGXGsJacaZYGQ9YuGZ/ZxcjZu2ztitSAwyMyidjX9+oO8MM5fxNGKoTq71k6hEp
	kR4iHbvvwKhXE+mjD9GcKIhd3j2lIs9AkYdPvd8cBhEiGzwvHgYct/SR6zuALPEG/jRDktuWcBw
	6eYhQctdzND8FGbjjUAgC/4vXfUnlpmVcClaXgXp/RkfU=
X-Received: by 2002:a05:600c:2059:b0:4bb:5a90:8ca4 with SMTP id
 5b1f17b1804b1-4bb9163dd1amr2975305e9.12.1795559120990; Tue, 24 Nov 2026
 14:25:20 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev> <20261123-feat-udmabuf-huge-pfnmap-v2-3-3254f801fc36@linux.dev>
In-Reply-To: <20261123-feat-udmabuf-huge-pfnmap-v2-3-3254f801fc36@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Nov 2026 14:25:09 -0800
X-Gm-Features: Aa3M54pp6bpRCS8AG4iCULQJGiNccxTku4hoCoX4iAQklO5C46N0ugppOSxDFeI
Message-ID: <CABdmKX3EAHhwSWG+kJrNmyMuCF7uY4rdR6=B8hXX=TFaz==4uw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] selftests/udmabuf: test mapping a huge page backed udmabuf
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philip Yang <Philip.Yang@amd.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Natalie Vock <nat@pixelcluster.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:45=E2=80=AFPM Qiliang Yuan <qiliang.yuan@linux.de=
v> wrote:
>
> udmabuf maps the ranges of a buffer that are backed by huge pages with
> PMDs, provided the mapping covers whole PMDs at an aligned address.
>
> The existing tests of huge page backed buffers only map a few pages, so
> they never get a PMD mapping or check what is read through one.
>
> Map a 64 MiB udmabuf backed by 2 MiB huge pages and read back what was
> written to the memfd, with a different pattern in each huge page: through
> a mapping of the whole buffer, which must be PMD aligned for a 64-bit
> task when THP support is built in, through a mapping at an unaligned
> offset, and from a forked child that inherits the mapping of the whole
> buffer.
>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
> ---
>  tools/testing/selftests/drivers/dma-buf/udmabuf.c | 97 +++++++++++++++++=
+++++-
>  1 file changed, 96 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/te=
sting/selftests/drivers/dma-buf/udmabuf.c
> index d78aec662586b..6eaef1b3aee01 100644
> --- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> +++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> @@ -14,6 +14,7 @@
>  #include <sys/ioctl.h>
>  #include <sys/syscall.h>
>  #include <sys/mman.h>
> +#include <sys/wait.h>
>  #include <linux/memfd.h>
>  #include <linux/udmabuf.h>
>  #include "kselftest.h"
> @@ -130,6 +131,98 @@ static int compare_chunks(void *addr1, void *addr2, =
off64_t memfd_size)
>         return ret;
>  }
>
> +#define HPAGE_SIZE     (2UL << 20)

This isn't true on 16k or 64k PAGE_SIZE arm64. Can we read
hpage_pmd_size for the PMD alignment and Hugepagesize: from
/proc/meminfo for the MFD_HUGETLB backing size?

> +#define HUGE_BUF_SIZE  (32 * HPAGE_SIZE)

I think we only really need 8 of these for the sub-range test, and
this gets huge for 16k or 64k base pages.

> +/* Check that @len bytes mapped at @addr match @mem at @off */
> +static bool check_huge_mapping(char *addr, char *mem, off_t off, size_t =
len)
> +{
> +       size_t i;
> +
> +       for (i =3D 0; i < len; i +=3D getpagesize()) {
> +               if (addr[i] !=3D mem[off + i])
> +                       return false;
> +       }
> +       return true;
> +}
> +
> +/* Check that @len bytes of @buf at @off read back what was written to @=
mem */
> +static bool check_huge_range(int buf, char *mem, off_t off, size_t len)
> +{
> +       char *addr;
> +       bool ok;
> +
> +       addr =3D mmap(NULL, len, PROT_READ, MAP_SHARED, buf, off);
> +       if (addr =3D=3D MAP_FAILED)
> +               return false;
> +
> +       ok =3D check_huge_mapping(addr, mem, off, len);
> +       munmap(addr, len);
> +       return ok;
> +}
> +
> +/*
> + * Map a udmabuf backed by 2MB huge pages, which can be mapped with PMDs=
, and
> + * read it back from a PMD-aligned address, a sub-range at an unaligned =
offset
> + * and a forked child that inherits the mapping.
> + */
> +static void test_huge_mapping(int devfd)
> +{
> +       struct udmabuf_create create =3D {};
> +       int memfd, buf, status;
> +       bool thp, aligned, ok;
> +       char *mem, *addr;
> +       pid_t pid;
> +       size_t i;
> +
> +       memfd =3D create_memfd_with_seals(HUGE_BUF_SIZE, true);
> +       mem =3D mmap_fd(memfd, HUGE_BUF_SIZE);
> +       /* Give each huge page its own pattern */
> +       for (i =3D 0; i < HUGE_BUF_SIZE; i +=3D getpagesize())
> +               mem[i] =3D (char)(i / getpagesize() + i / HPAGE_SIZE);
> +
> +       create.memfd =3D memfd;
> +       create.size =3D HUGE_BUF_SIZE;
> +       buf =3D ioctl(devfd, UDMABUF_CREATE, &create);
> +       if (buf < 0) {
> +               ksft_test_result_fail("%s: [FAIL,test-8]\n", TEST_PREFIX)=
;
> +               ksft_test_result_skip("%s: [SKIP,test-9]\n", TEST_PREFIX)=
;
> +               goto out;
> +       }
> +
> +       /* The address is only aligned for 64-bit tasks with THP support =
*/
> +       thp =3D sizeof(long) =3D=3D 8 &&
> +             !access("/sys/kernel/mm/transparent_hugepage", F_OK);
> +       addr =3D mmap(NULL, HUGE_BUF_SIZE, PROT_READ, MAP_SHARED, buf, 0)=
;
> +       aligned =3D addr !=3D MAP_FAILED &&
> +                 (!thp || !((unsigned long)addr % HPAGE_SIZE));
> +       ok =3D aligned && check_huge_mapping(addr, mem, 0, HUGE_BUF_SIZE)=
;
> +       if (ok)
> +               ksft_test_result_pass("%s: [PASS,test-8]\n", TEST_PREFIX)=
;
> +       else
> +               ksft_test_result_fail("%s: [FAIL,test-8]\n", TEST_PREFIX)=
;
> +
> +       ok =3D check_huge_range(buf, mem, HPAGE_SIZE + getpagesize(),
> +                             5 * HPAGE_SIZE + 3 * getpagesize());

We should probably also have a test with create.offset =3D getpagesize()
to exercise the misaligned PFN fallback.

Also a test that faults a PMD, then disables THP and then faults
elsewhere to cover the v1 bug.
