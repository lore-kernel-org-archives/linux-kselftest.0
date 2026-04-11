Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2B81DF74F
	for <linux-kselftest@vger.kernel.org>; Sat, 11 Apr 2026 17:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775928736; cv=pass; b=Y5ATR+ejqHe2tJoC43JRftPOb77OgR7oTDUBA2Ln/8e2RnIMdLs38BvWfBCBp3X+Y95rzkp+xyBX//EhLdl5SxHzUKisx99o04GqF+Pg2LS8WyiTkpPqWk0ArWc/3VacJj6QQDAX+8s9ldvmSXn3LQTRwtGbJBXxEstEd1btuXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775928736; c=relaxed/simple;
	bh=zCzbHvXTQGb4qzj7Y2lIkA2WF+YgRoElGChFQHdoMOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lE69USL19t93RKgBov+MsylDoeeTySqmfrB901lr03WhWyn4bYp30pGshaHb2OlZzqyD5XCA4AKf2emmB0MgiDxpjHM5BbIwnjqcGwnpjVhi6EG3jy5S0qo5FE9GZcBFSLvPTa+8uj0aXi9G2L7UDDomA+Hs9Kqkfbtuc4PDG4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENTV48O9; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENTV48O9"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso3155314f8f.2
        for <linux-kselftest@vger.kernel.org>; Sat, 11 Apr 2026 10:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775928733; cv=none;
        d=google.com; s=arc-20240605;
        b=ViApUmQWcqIcioiKJM1oOJ++uothh5loLYH0b5kvQujUD2ClqVrT+aYoe8Nz64vd/r
         h/O/thPrj4BbykLOansc78pPq3NLKq8y5TPW2MQwAaj0p0SUuAQRnRu3DmRMk4L8GFZv
         5RT3kEfuk/9V6DYPWxq5IdcxbElMylAKnrJUe2013rPkVIofluxz+2VVWjQl1eochthI
         emT/JEq7jIWRcMBkImUaZhwusPp1wpthY5mBbFi3pVXQMaOgpjPIMYiR+uIk3qFI+wwb
         PHPj6r63/Q8YaeF8gWq/+tO2C2hoDInil60JmpG0TWXvLP/iyKKCgZS3QvEU14M5yAoC
         gb8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MT939ZyPPp8a2PSu/oSmXUxeSc3VIzUtw8BETqqYKMo=;
        fh=RLhjqDGzqtZ6R2mON8AmhHgWlyzfPHm9pB8noZSXXME=;
        b=MVVkiz7I+OVgoJdr03COvqQ7s5w6AeBo43FOq4/Vp80DaKceWIo95pyFZ9GayzZio4
         B0dGGWkCjS4gfoiPV2zjYfqvsHsCjmhG4ufZUmB+hyumJnZqxvapSkxybiBGTagdLJL1
         iThovDX/JYgK/j5H41R/ssuYzVJpzSjy0oJICOGTyLrOQJ85iyCGfNQ/ozNCBioZ/isF
         eP2f6ykM/XO/2vTq5bjMsi5jV4Z+RplaE/29PYhaa/pVmP1ToqHm9PBDQ8voD51C0J3I
         34n5oXOPYIQZNmiDOioFTb9Pte7m9bwAoBWZXumRg4hMmoTrqt7Rzz1b1TfoSV6Y5gXC
         rKMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775928733; x=1776533533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MT939ZyPPp8a2PSu/oSmXUxeSc3VIzUtw8BETqqYKMo=;
        b=ENTV48O98bFK1mvfgxnfpwyhJiOFcbdhu6b4Prk7KMVn+OyGN2bnbYl3D6+aOYgeMT
         5PejMm5g5+R1/fY6AYSm/MxGRuCUMJOQDgzZIMp5nWWaI2eVKl0n13LTSkoyFTS0voLZ
         uhZ6KNBLSVu/VCgy08Miq2Fg2XEy6qCAW/nhw4qpyOtZaG9Grmd3Hxr0L9GE+rYnuia/
         kOTzCGD8PXJLti57NUJ9m16wmAtrDVSlfUVaHPA9bOaZJGzok5NLQDEVnNoEaa8RFclh
         BP7GwuE/QXXSAWXSrbpq5xq9VsbQAh4lTbFWcogKlyHtyuxp8nPHqKq8q7U3BTbGk5cY
         hYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775928733; x=1776533533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MT939ZyPPp8a2PSu/oSmXUxeSc3VIzUtw8BETqqYKMo=;
        b=jabGeLksCj0nJgxWAeyPaYKDzJOaUMkuDQZxU+9YG5LU4NQjl1sq0IPXBNsLOLdg48
         IUmyb2olywplCmUj5sc1tuqRtQC0N5I2pVBKBnoAj5W0suaQg+FEx7GlTTYmGl0Hm5XH
         oPt1n103555mhEV2y/twZ8rPMwfSt1QMRXk1pEIcxTGLSccfuwISjf1WrrMhCVNpBiMb
         K91reoIQkj0pK9VB6FW3nifiGsBtsvHqgopC2ITsTeH7iamnLToVg/F7AnHn7ota8GYO
         2UNYJbYx2EuNxPlQc5/Qa9Vu6/WAhTvzoVlupE+vFRkA4Pqt9w6R9cb6Bj5ha2OahhxV
         bLqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIIe6VAiQImZ+tOOIMAc4FSfExfFutkHfIt/8rs8P4A93BmJqyEhIgYCZPZ0rVuOypSys3nItUBi5OhE5zjt0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf3FNRV00gbgRnl5gfvh34o2P5NhXbGGCiMDSCFGP9lWKnGYGT
	o+bcZJe07z01leZBiA5S3ge8OeHfuMIsr5J0ZUiasL1lmAq//KI16psQeQ2SiUKKvXZLLjRW8JT
	MtbX3n5ogNwKuxLaGLJtsVovlafdVbis=
X-Gm-Gg: AeBDiesH9qHOtdvrL0DuhiWRYJOMiXhtC5nYxtsx5ldUUutjalobOGYg9sBS9yD1jdS
	Mep47oOOqGwNv7lxFBzWjMul1GWYCvw1sxVDXbfy5cQbNMVmMJlagLZM0VfXueGdQob5hPH7G6w
	Rg7ilhcNoS33rx/wMvCJOiiW6WiLd9ZTO/I5r+sr3QOQ3Yl9zmUjwlKHsQTyYZRDoDJG1HxmN73
	Yp6MB8DFuOyW0MDn2BxdfoXiQ7PKZ8CxD3CFPf2MNBokNEKCGdViCEkSj/mYFkDgK/MtiZ5MmUv
	jGq6F8OfnQxIdOKBPAlFcj659r8Ts2k3kULoofY+cjyHQIf8mLeBGbysaaz9vzHuwSXoFbwn8Zx
	pO90y3QF4WQ1zicUBI3qXuIJmig==
X-Received: by 2002:a5d:5f91:0:b0:43d:711c:d0f4 with SMTP id
 ffacd0b85a97d-43d711cd1c8mr359452f8f.6.1775928732272; Sat, 11 Apr 2026
 10:32:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411163556.8567-1-yangfeng59949@163.com> <20260411163556.8567-2-yangfeng59949@163.com>
In-Reply-To: <20260411163556.8567-2-yangfeng59949@163.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 11 Apr 2026 10:32:00 -0700
X-Gm-Features: AQROBzBM5w45iJ7IZhe8aNYPA9S3yOdAngB718VK1ym0apjejzhm8-3k_H0XpPA
Message-ID: <CAADnVQ+PE9t0XPM=k=mqpRd=efJ0KYFGbaadwfL5e9iS-pWWVQ@mail.gmail.com>
Subject: Re: [PATCH v3 bpf-next 1/2] bpf: Fix Null-Pointer Dereference in
 kernel_clone() via BPF fmod_ret on security_task_alloc
To: Feng Yang <yangfeng59949@163.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Matt Bobrowski <mattbobrowski@google.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Leon Hwang <leon.hwang@linux.dev>, Menglong Dong <menglong.dong@linux.dev>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Feng Yang <yangfeng@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 9:36=E2=80=AFAM Feng Yang <yangfeng59949@163.com> w=
rote:
>
> From: Feng Yang <yangfeng@kylinos.cn>
>
> Using the following BPF program will cause a kernel panic:
> SEC("fmod_ret/security_task_alloc")
> int fmod_task_alloc(void *ctx)
> {
>         return 1;
> }
>
> [  383.899321] BUG: kernel NULL pointer dereference, address: 00000000000=
00b99
> [  383.899327] #PF: supervisor read access in kernel mode
> [  383.899330] #PF: error_code(0x0000) - not-present page
> [  383.899332] PGD 8000000108a60067 P4D 8000000108a60067 PUD 104550067 PM=
D 0
> [  383.899341] Oops: Oops: 0000 [#1] SMP PTI
> [  383.899346] CPU: 1 UID: 0 PID: 12925 Comm: test Kdump: loaded Not tain=
ted 7.0.0-rc6+ #1 PREEMPT(lazy)
> [  383.899349] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS Vi=
rtualBox 12/01/2006
> [  383.899351] RIP: 0010:get_task_pid+0x20/0x80
> [  383.899358] Code: 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 0=
0 00 55 89 f5 53 48 89 fb e8 0b 98 0a 00 85 ed 75 32 48 81 c3 98 0b 00 00 <=
48> 8b 1b 48 85 db 74 14 b8 01 00 00 00 f0 0f c1 03 85 c0 74 27 8d
> [  383.899362] RSP: 0018:ffffd3ca0ab13b38 EFLAGS: 00010206
> [  383.899367] RAX: 0000000000000001 RBX: 0000000000000b99 RCX: 000000000=
0000008
> [  383.899371] RDX: ffff8b2c85860000 RSI: 0000000000000000 RDI: 000000000=
0000001
> [  383.899374] RBP: 0000000000000000 R08: 0000010754cf50c8 R09: 000001075=
4cf50c8
> [  383.899377] R10: ffffffff95a6c000 R11: 0000000000000024 R12: 000000000=
0000000
> [  383.899380] R13: 0000000000000000 R14: 0000000000000001 R15: 000000000=
1200000
> [  383.899384] FS:  00007f3eae907740(0000) GS:ffff8b2d05e5c000(0000) knlG=
S:0000000000000000
> [  383.899388] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  383.899390] CR2: 0000000000000b99 CR3: 0000000106a94003 CR4: 000000000=
00706f0
> [  383.899393] Call Trace:
> [  383.899397]  <TASK>
> [  383.899401]  kernel_clone+0xe8/0x480
> [  383.899406]  __do_sys_clone+0x65/0x90
> [  383.899410]  do_syscall_64+0xca/0x860
> [  383.899421]  ? next_uptodate_folio+0x85/0x2a0
> [  383.899427]  ? percpu_counter_add_batch+0x4c/0x90
> [  383.899434]  ? filemap_map_pages+0x3b7/0x4d0
> [  383.899437]  ? do_read_fault+0x107/0x210
> [  383.899442]  ? do_fault+0x1b2/0x330
> [  383.899445]  ? __handle_mm_fault+0x49b/0x7a0
> [  383.899448]  ? count_memcg_events+0xc4/0x160
> [  383.899453]  ? handle_mm_fault+0xbb/0x370
> [  383.899456]  ? do_user_addr_fault+0x209/0x680
> [  383.899459]  ? irqentry_exit+0x7a/0x660
> [  383.899462]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  383.899466] RIP: 0033:0x7f3eaeb426e7
> [  383.899470] Code: 5d c3 90 f3 0f 1e fa 64 48 8b 04 25 10 00 00 00 45 3=
1 c0 31 d2 31 f6 bf 11 00 20 01 4c 8d 90 d0 02 00 00 b8 38 00 00 00 0f 05 <=
48> 3d 00 f0 ff ff 77 39 89 c2 85 c0 75 2c 64 48 8b 04 25 10 00 00
> [  383.899472] RSP: 002b:00007fff23a2c838 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000038
> [  383.899477] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f3ea=
eb426e7
> [  383.899479] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000=
1200011
> [  383.899481] RBP: 0000000000000000 R08: 0000000000000000 R09: 000000000=
0000000
> [  383.899483] R10: 00007f3eae907a10 R11: 0000000000000246 R12: 000000000=
0000001
> [  383.899485] R13: 00007fff23a2dbe8 R14: 0000000000403de0 R15: 00007f3ea=
ecf5000
> [  383.899488]  </TASK>
> [  383.899489] Modules linked in: nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 =
nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft=
_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill =
nf_tables sunrpc intel_rapl_msr intel_rapl_common intel_uncore_frequency_co=
mmon intel_pmc_core pmt_telemetry snd_intel8x0 pmt_discovery pmt_class snd_=
ac97_codec intel_pmc_ssram_telemetry ac97_bus intel_vsec snd_pcm snd_timer =
snd rapl soundcore joydev sg i2c_piix4 pcspkr vboxguest i2c_smbus nfnetlink=
 sr_mod cdrom sd_mod ata_generic vmwgfx ahci libahci ata_piix drm_ttm_helpe=
r ghash_clmulni_intel video ttm e1000 wmi libata serio_raw dm_mirror dm_reg=
ion_hash dm_log dm_multipath dm_mod fuse i2c_dev autofs4
> [  383.899624] CR2: 0000000000000b99
>
> This is because
> 1. The BPF program is designed to override the normal behavior of
> `security_task_alloc` and forcibly return a non-zero error value (e.g.,
> `-ENOMEM` or `1`).
> 2. User space triggers a process creation syscall (like `fork` or
> `clone`). The kernel invokes `copy_process` to allocate and initialize a
> new `task_struct` for the child process.
> 3. `copy_process` invokes `security_task_alloc`. Due to the attached BPF
> program, it returns the positive value `1`.
> 4. `copy_process` treats any non-zero return from `security_task_alloc`
> as a failure. It aborts initialization, cleans up, and returns the error
> code cast to a pointer via `ERR_PTR(1)` (which evaluates to the memory
> address `0x1`).
> 5. In `kernel_clone()`, the kernel uses the `IS_ERR()` macro to check if
> the returned `task_struct *p` is an error pointer. However, `IS_ERR()`
> only checks for negative error codes in the range `[-MAX_ERRNO, -1]`.
> Since `0x1` is not in this range, the check `IS_ERR(p)` evaluates to
> `false`.
> 6. The kernel incorrectly assumes `p` is a valid `task_struct` pointer
> and proceeds to call `get_task_pid(p, PIDTYPE_PID)`. This dereferences
> the invalid address `0x1` (plus the offset of the `thread_pid` field),
> triggering a general protection fault or null-pointer dereference.
>
> Therefore, for security-related functions, similar to LSM,
> the validity of their return values is verified to fix the issue.
> Return value validation for fault injection is also added accordingly.
>
> Reported-by: Quan Sun <2022090917019@std.uestc.edu.cn>
> Reported-by: Yinhao Hu <dddddd@hust.edu.cn>
> Reported-by: Kaiyan Mei <M202472210@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Closes: https://lore.kernel.org/bpf/973a1b7b-8ee7-407a-890a-11455d9cc5bf@=
std.uestc.edu.cn/
> Fixes: 6ba43b761c41 ("bpf: Attachment verification for BPF_MODIFY_RETURN"=
)
> Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
> ---
>  kernel/bpf/verifier.c | 114 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 112 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 56fcc96dc780..8285f626919e 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -18363,6 +18363,112 @@ static int check_ld_abs(struct bpf_verifier_env=
 *env, struct bpf_insn *insn)
>         return 0;
>  }
>
> +#ifdef CONFIG_FUNCTION_ERROR_INJECTION
> +
> +/*
> + * The return values corresponding to the error injection
> + * types shall be interpreted as follows:
> + *
> + * EI_ETYPE_NULL
> + *   This function will return `NULL` if it fails. e.g. return an alloca=
ted
> + *   object address.
> + *
> + * EI_ETYPE_ERRNO
> + *   This function will return an `-errno` error code if it fails. e.g. =
return
> + *   -EINVAL if the input is wrong. This will include the functions whic=
h will
> + *   return an address which encodes `-errno` by ERR_PTR() macro.
> + *
> + * EI_ETYPE_ERRNO_NULL
> + *   This function will return an `-errno` or `NULL` if it fails. If the=
 caller
> + *   of this function checks the return value with IS_ERR_OR_NULL() macr=
o, this
> + *   type will be appropriate.
> + *
> + * EI_ETYPE_TRUE
> + *   This function will return `true` (non-zero positive value) if it fa=
ils.
> + *
> + * Since returning 0 from modify_return means not modifying the return v=
alue,
> + * 0 must always be included.
> + */
> +static int modify_return_get_retval_range(const struct bpf_prog *prog,
> +                                         struct bpf_retval_range *range)
> +{
> +       unsigned long addr =3D (unsigned long)prog->aux->dst_trampoline->=
func.addr;
> +
> +       if (within_error_injection_list(addr)) {
> +               switch (get_injectable_error_type(addr)) {
> +               case EI_ETYPE_NULL:
> +                       range->minval =3D 0;
> +                       range->maxval =3D 0;
> +                       break;
> +               case EI_ETYPE_ERRNO:
> +               case EI_ETYPE_ERRNO_NULL:
> +                       range->minval =3D -MAX_ERRNO;
> +                       range->maxval =3D 0;
> +                       break;
> +               case EI_ETYPE_TRUE:
> +                       range->minval =3D 0;
> +                       range->maxval =3D 1;
> +                       break;
> +               }
> +               range->return_32bit =3D true;
> +
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +#else
> +
> +/* The system call return value is allowed to be an arbitrary value. */
> +static int modify_return_get_retval_range(const struct bpf_prog *prog,
> +                                         struct bpf_retval_range *range)
> +{
> +       return -EINVAL;
> +}
> +
> +#endif /* CONFIG_FUNCTION_ERROR_INJECTION */

I recall people already explained that this is no go.
We cannot break all fmod_ret because error injection is disabled.

Also see sashiko reports.

> +
> +#define SECURITY_PREFIX "security_"
> +/* hooks return 0 or 1 */
> +BTF_SET_START(bool_security_hooks)
> +#ifdef CONFIG_SECURITY_NETWORK_XFRM
> +BTF_ID(func, security_xfrm_state_pol_flow_match)
> +#endif
> +#ifdef CONFIG_AUDIT
> +BTF_ID(func, security_audit_rule_known)
> +#endif
> +/*
> + * The inode_xattr_skipcap hook is called from within
> + * security_inode_removexattr and security_inode_setxattr.
> + * Since these two functions can also return values from
> + * inode_removexattr and inode_setxattr respectively,
> + * there is no need to restrict their return values to 0 or 1.
> + */
> +BTF_SET_END(bool_security_hooks)
> +
> +/*
> + * Similar to bpf_lsm_get_retval_range,
> + * ensure that the return values of fmod_ret are valid.
> + */
> +static int bpf_security_get_retval_range(const struct bpf_prog *prog,
> +                                        struct bpf_retval_range *range)
> +{
> +       if (strncmp(SECURITY_PREFIX, prog->aux->attach_func_name,
> +                   sizeof(SECURITY_PREFIX) - 1))
> +               return -EINVAL;
> +
> +       if (btf_id_set_contains(&bool_security_hooks, prog->aux->attach_b=
tf_id)) {
> +               range->minval =3D 0;
> +               range->maxval =3D 1;
> +       } else {
> +               range->minval =3D -MAX_ERRNO;
> +               range->maxval =3D 0;
> +       }
> +       range->return_32bit =3D true;
> +
> +       return 0;
> +}

let's copy paste bpf_lsm_get_retval_range() for no good reason?!

please don't send such poor quality patches.

pw-bot: cr
