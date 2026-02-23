Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A03314A7A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864745; cv=pass; b=PNzP/L0xFtpmBYBiGd15VDv6Ots3wmMxbnpMX4TNlSTYO3d+ccH0jIyHn0+rPg3bbCRp/1PXOV5MAs26ehKnrTluZTUY14banYVUFnjLmt0UR8IH+yyXaRSWTl2e230kJ1hpCQKsenX1sO7k996YSHDgfaGecFjj7bZ1k/i9fG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864745; c=relaxed/simple;
	bh=6BMG4Aw9cTxQ9+0M97149ECEu9MA2fic37H9nokz5/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6FPa4F4WvYG9p2blpktdI1W0wxsLG8SKy+vyx+47FE/a3GiUMJ02uGvPXfroYo9WGvDJk/RFbUYMc/4l0YhxLgtZGUnUf0XghVsdCq7/4hsAKJmYNjcI14zn+XCAGnZKrWATX9paZnvicdJBU2oxmskafi2UT/jmsh2yaoMlK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vfg0mLJ1; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vfg0mLJ1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43767807da6so3391518f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 08:39:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771864742; cv=none;
        d=google.com; s=arc-20240605;
        b=XlgqTNu4luCGZmDiVFweBZL4/XXViNuSauzV+B+wQOLmrL1JipM+KAAhMMC4EDF4RR
         gj3HHFKMfvtJzsbEkopN2zJhUrtjGvRO9quLswzXwuBpEqBFyd34CDZpeS6ut8tMc5pM
         ehmIMNfMbaEhLzVawpCA7c28HZf5v7aHPkaEUHSO3S19S2OV4Vhu05q1FhYuMcwatAbG
         Ym4vmIcA/J+wQ2IEghVMCB2miGs8pehkQVt0KD3UZLmVH4vOoyGaWOXizkvmIqU1oipR
         H1thOQ/QlQwevM/4CQuM1dT2qOqSf90OkJlmOhw+mzwn5AUKb/5xyZnvRWKEEN6YV6kV
         0Q7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Btlg+v2s4Bj2eA79FYWO+v9doj0qL1zCyyDyKw2C9g=;
        fh=RImd6BDIIHA0YbuaUMxMBshA+fZwNAlsnTyL2NadQFg=;
        b=R+W5dWEDhsHvRTC+9G8JLqxR+DyV0FOUq4Gsa9X+ExK1REHH7+bWFWNqKmGwdsFXQD
         Rt1rYN6ZNEWGFDg2FXk8MpvVVknSCj1wrNUiC8WDjQzDxbDXHdroJjXo/cz86haqtm8E
         IOaMEW2WiLV65o35RN/bLa40XQYwsgXhu7PWq5r6qBou44dV9N+FIW0uiz6/RLoQWoLc
         T+pWoM6D8pWvVbiZ4ceyXQuL071TZwAe198vwxT5VZ5ilhZZWYmtPtveIt6jT+Ai98Up
         iJK68ki3/KyFCs0UubrIZAmA8o5xu02jE/QcuZqM6O2QuNCDNx+C7u4XlZejTqxr3lRo
         Ifug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771864742; x=1772469542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Btlg+v2s4Bj2eA79FYWO+v9doj0qL1zCyyDyKw2C9g=;
        b=Vfg0mLJ1k/XPortGSlRwBsGhmmDAiuwD3PfBM/gyQK4jkvK7qAhkbn0aFg5g/JydBU
         fEnl9USlhTpgCtkEOIkWLq/i8pEr3+08T3bm/joRgz8nOFux+JjDEEk0dVqiw9PhFpsT
         gk4P1pX4xd52gvTjnBxOcSVqL3kxi0VRSLGTDhUotprfHaI39n8NG30j+SRcvp5MbEWS
         mZK5Y+3h6lfxoz8hLmavGmCoH7AHkUal10iR9a64YpPuK+iR/rQqM9I1kSLcNXzWQN+9
         FlPT8cQ2mzzU7c+3vjLOS3TFrsGyCPBlpbusvsGxeP9Xq/tHf+b60dtMUMJ7Iy3OWOyK
         WRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864742; x=1772469542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Btlg+v2s4Bj2eA79FYWO+v9doj0qL1zCyyDyKw2C9g=;
        b=gdD+n1laLwhHVXsInE83xplfGShJ9qZKGcUFihtRnBXUm43TzoFHN1cXXejyjGnPTQ
         pt/G/5i1yo6+apJL6dPWBk/kQ3ELd/tB8n0Q/h5KVBZKWuCR/yY8Aj09xuKGnIea9g/5
         HvNU140P8WmMVwdtD6H/iAzUMjEyGJD6DRVrdF9oDSKkHWMzMagkM0gdJz+eXhmk2MXt
         XzifVT5XB0c2WtrpugW1bz4zqqy/4atFXcKiZP1vyOqnU/vndrzT+i18tZqf57oQ/UBu
         /qu3hinToLjTa+NJxfRhruBaEiAfRQMxx/nJRgaPVN4cHvpz1kDG9HEZ108jQdAUD/J9
         Og7w==
X-Forwarded-Encrypted: i=1; AJvYcCXRu07MeCIs8BJ+2TTqoF/GBg+1oovr56sPCDHmY7d5Avf71cxCuusxWa36i3eACOIDazqYAA4wolCKHfO4Y7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YybOf6Z9+z92uqlPOacmpPm6qXj73gXrAKImFdyMPa4GFw+fPJs
	/dKp/il1wtA/PAPSLgkN+4XJc5QpVXWr1veCkyZEPbr0TcySbxZKnIWwbAvbDvlKO0s0TfSeEEh
	Cymq/1m1nBBNQY+g+FtIKKcm3qMXbqkA=
X-Gm-Gg: ATEYQzx2egWjizPpifxY7xSM6CuocD/rkckZL0Qky8JZbN2VK6m63H2lkAB0kIC5+df
	Oks6jo2ofssjPIvMyuWO3vL3UGlQnRFuan7jmS1xm2b9Ws+BiBKnnf2iALwBXcYkr8i9w4+uVzg
	2d7z8U3Sl5YVM/XFquar3l9xov/Nz8k7W0KQQMuM6GMaL2tHxbplWpz3JnfsAcmt9/GM9PnELXP
	5xaCvgtdiPkjvV2IMkOX1gOR8Dv5lYgHCkEbO4Sl3dYJve78cb7wUg/Cauuk0h2XwBiAWhYFTzE
	QXv5mxV3/LdaOWD8zqQpaq/i6fwt08yz+Sh85sL2NQ60XoA6nYS98nP3QzpXI7nF9toykvBHO/C
	zW7jof4H2
X-Received: by 2002:a05:6000:40ca:b0:437:73a2:2d4c with SMTP id
 ffacd0b85a97d-4396f15a735mr16101979f8f.13.1771864742055; Mon, 23 Feb 2026
 08:39:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223083120.23776-1-slava.imameev@crowdstrike.com> <20260223083120.23776-3-slava.imameev@crowdstrike.com>
In-Reply-To: <20260223083120.23776-3-slava.imameev@crowdstrike.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 23 Feb 2026 08:38:51 -0800
X-Gm-Features: AaiRm51gzgi525_wFRB9fptLy63BCDSKPCaqKcQyhmb9W89_jXdbtCdsK1J7NFE
Message-ID: <CAADnVQ+50cMbAiTPEuPT_LZgPu3SuMDhemX9EpMLoqdCHvAXbA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/2] selftests/bpf: Add trampolines
 multi-level pointer params test coverage
To: Slava Imameev <slava.imameev@crowdstrike.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	DL Linux Open Source Team <linux-open-source@crowdstrike.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 12:32=E2=80=AFAM Slava Imameev
<slava.imameev@crowdstrike.com> wrote:
>
> Multi-level pointer params and return value test coverage for BPF
> trampolines:
> - fentry/fexit programs covering struct and void double/triple
>   pointer parameters and returned values
> - verifier context tests covering multi-level pointers as parameters
> - verifier context tests covering multi-level pointers as returned
>   values
> - verifier context tests for lsm to check trusted parameters handling
> - verifier context tests covering out-of-bound access after cast
> - verifier BPF helper tests to validate no change in verifier
>   behaviour
>
> Signed-off-by: Slava Imameev <slava.imameev@crowdstrike.com>
> ---
>  net/bpf/test_run.c                            | 130 ++++++
>  .../prog_tests/fentry_fexit_multi_level_ptr.c | 206 +++++++++
>  .../selftests/bpf/prog_tests/verifier.c       |   2 +
>  .../progs/fentry_fexit_pptr_nullable_test.c   |  56 +++
>  .../bpf/progs/fentry_fexit_pptr_test.c        |  67 +++
>  .../bpf/progs/fentry_fexit_void_ppptr_test.c  |  38 ++
>  .../bpf/progs/fentry_fexit_void_pptr_test.c   |  71 +++
>  .../bpf/progs/verifier_ctx_multilevel_ptr.c   | 435 ++++++++++++++++++
>  8 files changed, 1005 insertions(+)
>  create mode 100644 tools/testing/selftests/bpf/prog_tests/fentry_fexit_m=
ulti_level_ptr.c
>  create mode 100644 tools/testing/selftests/bpf/progs/fentry_fexit_pptr_n=
ullable_test.c
>  create mode 100644 tools/testing/selftests/bpf/progs/fentry_fexit_pptr_t=
est.c
>  create mode 100644 tools/testing/selftests/bpf/progs/fentry_fexit_void_p=
pptr_test.c
>  create mode 100644 tools/testing/selftests/bpf/progs/fentry_fexit_void_p=
ptr_test.c
>  create mode 100644 tools/testing/selftests/bpf/progs/verifier_ctx_multil=
evel_ptr.c
>
> diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
> index 178c4738e63b..9f6ee2eb01cd 100644
> --- a/net/bpf/test_run.c
> +++ b/net/bpf/test_run.c
> @@ -24,6 +24,9 @@
>  #include <net/netdev_rx_queue.h>
>  #include <net/xdp.h>
>  #include <net/netfilter/nf_bpf_link.h>
> +#include <linux/set_memory.h>
> +#include <linux/string.h>
> +#include <asm/tlbflush.h>
>
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/bpf_test_run.h>
> @@ -563,6 +566,42 @@ noinline int bpf_fentry_test10(const void *a)
>         return (long)a;
>  }
>
> +struct bpf_fentry_test_pptr_t {
> +       u32 value1;
> +       u32 value2;
> +};
> +
> +noinline int bpf_fentry_test11_pptr_nullable(struct bpf_fentry_test_pptr=
_t **pptr__nullable)
> +{
> +       if (!pptr__nullable)
> +               return -1;
> +
> +       return (*pptr__nullable)->value1;
> +}
> +
> +noinline u32 **bpf_fentry_test12_pptr(u32 id, u32 **pptr)
> +{
> +       /* prevent DCE */
> +       asm volatile("" : "+r"(id));
> +       asm volatile("" : "+r"(pptr));
> +       return pptr;
> +}
> +
> +noinline u8 bpf_fentry_test13_pptr(void **pptr)
> +{
> +       void *ptr;
> +
> +       return copy_from_kernel_nofault(&ptr, pptr, sizeof(pptr)) =3D=3D =
0;
> +}
> +
> +/* Test the verifier can handle multi-level pointer types with qualifier=
s. */
> +noinline void ***bpf_fentry_test14_ppptr(void **volatile *const ppptr)
> +{
> +       /* prevent DCE */
> +       asm volatile("" :: "r"(ppptr) : "memory");
> +       return (void ***)ppptr;
> +}
> +
>  noinline void bpf_fentry_test_sinfo(struct skb_shared_info *sinfo)
>  {
>  }
> @@ -670,20 +709,110 @@ static void *bpf_test_init(const union bpf_attr *k=
attr, u32 user_size,
>         return data;
>  }
>
> +static void *create_bad_kaddr(void)
> +{
> +       /*
> +        * Try to get an address that passes kernel range checks but caus=
es
> +        * a page fault handler invocation if accessed from a BPF program=
.
> +        */
> +#if defined(CONFIG_ARCH_HAS_SET_MEMORY) && defined(CONFIG_X86)
> +       void *addr =3D vmalloc(PAGE_SIZE);
> +
> +       if (!addr)
> +               return NULL;
> +       /* Make it non-present - any access will fault */
> +       if (set_memory_np((unsigned long)addr, 1)) {
> +               vfree(addr);
> +               return NULL;
> +       }
> +       return addr;
> +#elif defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP)
> +       struct page *page =3D alloc_page(GFP_KERNEL);
> +
> +       if (!page)
> +               return NULL;
> +       /* Remove from direct map - any access will fault */
> +       if (set_direct_map_invalid_noflush(page)) {
> +               __free_page(page);
> +               return NULL;
> +       }
> +       flush_tlb_kernel_range((unsigned long)page_address(page),
> +                              (unsigned long)page_address(page) + PAGE_S=
IZE);
> +       return page_address(page);
> +#endif

This is serious overkill for a test.
See how bpf_testmod_return_ptr() does it.

pw-bot: cr
