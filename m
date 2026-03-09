Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B70236A02F
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042398; cv=pass; b=gxw8PS+0aVXCKwd9e9ijooSmuITgrY4RHPGwqsOZrYBFzsYdnkrrA8HtcwHFmsE6iLPYTaGvcSpRITZghBBHF5apcWypuSx4tliGSN1vLxT7//2M1gr3ISZtSFgF40h/lj8gQchCJ3P2dvOz89hXGbCQA91JrZNJ1P/NhLZwpK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042398; c=relaxed/simple;
	bh=eacRXzXf/aiA5OgRGa3k7SPsaozGRTTdOpU1VEE4zBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o3lbbkKuhqXwdXKVxEujedPo/+XtHSzqucopTaD2MuzFVSVat8RDmGfo2Uswc4Oe3rYXDOL4b0gZUc52HE9cU76V6hc50WFlCAtd4aVTzsLdn9L5+ehc1UXFyh4oh89z/E5uz/GBO/ViR2e2Oia48oE2xrALbOzz27eujm6JIKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CM3Z6Dxb; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CM3Z6Dxb"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-89a1d7cc7f0so42167416d6.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 00:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773042396; cv=none;
        d=google.com; s=arc-20240605;
        b=MElevJzdH0dvYWTuW3p2EIMxF2TiWr9TSFOu2X0Ntmo+3GFt3dhU/HnNAZnQr2k9zX
         iGIkZsIFi1om2JzHBd/mTeGSFOR+uI2/jQCW7pq8xzNQr1JNeaLKWhCJKTO6BQE+MMi9
         tUu8UGr3byqBZeuwJpqv4Ao0X1fjtrhjDVtL2zN3GBBXMlT9FY71sTr8gLgni2t9xjPO
         IHR5oxyOUIYuamOmFNTl6oM/G/BIe8pzVNijv/dDZKTJMJwq+E+MrC8sypitSISXVk9X
         xIR0IWBVmJivY7cdlvu9gRFOL1Y3rH+K7A5kqZYusOgp8zvlaQz5kjmQpoTEn/mumA3B
         Ec6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dy2wEMRvx8pDR1Qm7aqueQadBuYC5mw6ZCVKfgZ4OGs=;
        fh=SW5T06NpUK9imoZbHV9lmNslyPXrtAiFR8aobn4/Wow=;
        b=OXYLCSUMjTN/7U/G0bF7L/TixhMm1veycPO9c8SEaLLY7sqQsWrVTtJIAQoZTURr7O
         YcJ0N4D5h9cjGxwvh+iv4DTkxPG43mEHfcANnddO7f8b3kzzACBBEWcpvYCSW9KioZWq
         faIVFaFOyuOYE6N+NKL1vhVEswUDinAuPL9BSiNzfK+epiW/M0Bs5E3Jeh6LPjrMRXCB
         lHi9rNJAq4BI9CYYdtJf8rNb4QhsgY8a+nSejRe07IBPvyEToDLSrHk7zuTkN63Foc9c
         6fq4tdyl+ZGOe27zZ/6hArC1nFmELqy/P80pT3kMc+NU1thjBk7+9A25Z8eF9KbSt1Go
         L9GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773042396; x=1773647196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dy2wEMRvx8pDR1Qm7aqueQadBuYC5mw6ZCVKfgZ4OGs=;
        b=CM3Z6Dxbp7+Ddn//y5svnSSY6FXarjiZ5dEo/L8O44/6ecvDdJr7l3fKO/ub2GD/vn
         K0M0Zo5T738xnAgeGI/y5nSSLc29XyiYCXo9cMvcremUMi46bXsze8+eIu0iSLprQ6Vg
         gSvPI7TxolYx5J/MNPxpFzEy+VF+ZavGMnVz+88jK9A/Dbc4MFvI0/PNfdg3hO27xHfT
         BqKTV/Rdzy1S+s6kCyjztP+eKdP8Cb4YdSODXIr24fLCRjr6aa/wLZZgO0V0FKXFdtbx
         NQAMNPfDtk07kpMUooAk7V8yePGa+FBZZnGq2AoR12kT8EAsgo2qM4Eb8yCaus8tC3MR
         /Hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773042396; x=1773647196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dy2wEMRvx8pDR1Qm7aqueQadBuYC5mw6ZCVKfgZ4OGs=;
        b=p0alS2XHz+gEt/Ixnp9ch9X3hHEEEvA9EPYQb/RTun+j3WUsiTncZxxBdHpVQWmiEj
         1CdeEMXutCGGEjESc35IiZeLlMP+lc2yiVKybS1+bSZkjbE9QFzmL6eo45qB4vJ+f4h/
         pgEKVVrNMIzr3RAAovfXQ7igL0UpDfAasFdVRSdeRaXmL7cvQLNt4P4L+96upbQ/VcL8
         Wuww40Nb/et5ZaQyJMVjZx7iu+sQAAXiDnWprYL+49/A4PFeI1S4VE7LbLJlQ4c3wiMT
         LNs/SdX/kx+/ITQw44VNS8b6ZcENAOiLo1AY60GOgJToC26RKoli5EONFy0ZXyAwrFgh
         PbMA==
X-Forwarded-Encrypted: i=1; AJvYcCXv6Fk0iVlRlHQ6DBoWsD0Nslv7l97BAAufqiHkUPBywVR26E1bqGg4n8/+dVwYM3wCUtDpVKdPlIyHrbf+s3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhf/gLUuA1al85/liGOVO/hE6Y82oACI7Wt48mbvYhmiqRTXsV
	X+p/M6pEOz/ygNUaUQd0wHHpKaz9An2YTNraj24rKKTeAhAPhvf4pwwIaXAKhzAp9pxtufoYpeg
	iURRI4pnKFTBGKRkAFp8fP+4C8b5zMYlTTa38o/3b
X-Gm-Gg: ATEYQzzU+OJvTKHPHGzliHZkionUjOkZePyEvlL9H0Rxcy8AIZgyLtRcoGHuyarYbhP
	KLbH7lth6d/ItEHka5u2KrDzeO/YKcuBkG1F56Ca6UCQ+tKtTK1WQSxUL86T31NPjbtZhJksgCk
	obKd/nGupV895i8W5L5djgmBIaHKvGfKsDa4/MRqDrwf68fSU8Bz0RBs/Q5gNsT8PltTedUY6p8
	ML9RJzyOsxpi+xiETlVG9jfKsbjPTz9Cw+3l4/fpukzcS5UDr1xUjoB5V2sKPFaAulP03SsAYZN
	7SwhD9o=
X-Received: by 2002:a05:6214:f0e:b0:899:f691:fd3a with SMTP id
 6a1803df08f44-89a30a5ac53mr155765816d6.27.1773042395649; Mon, 09 Mar 2026
 00:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309030702.128520-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260309030702.128520-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 9 Mar 2026 08:46:24 +0100
X-Gm-Features: AaiRm51LwOtGnsLFGw5-TXI1ygOjcbArZhKBv2Arly_DVU4Sw2FiUsW3cGuVy-o
Message-ID: <CANn89i+SCJmUuQo2pSVv_4YhjvXGvnGDH_HNo2XY6KxDX1Kcgg@mail.gmail.com>
Subject: Re: [PATCH net v5 0/2] net,bpf: fix null-ptr-deref in
 xdp_master_redirect() for bonding and add selftest
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, razor@blackwall.org, jiayuan.chen@shopee.com, 
	Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Jussi Maki <joamaki@gmail.com>, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 4:07=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:
>
> syzkaller reported a kernel panic [1] with the following crash stack:
>
> Call Trace:
> BUG: unable to handle page fault for address: ffff8ebd08580000
> PF: supervisor write access in kernel mode
> PF: error_code(0x0002) - not-present page
> PGD 11f201067 P4D 11f201067 PUD 0
> Oops: Oops: 0002 [#1] SMP PTI
> CPU: 2 UID: 0 PID: 451 Comm: test_progs Not tainted 6.19.0+ #161 PREEMPT_=
RT
> RIP: 0010:bond_rr_gen_slave_id+0x90/0xd0
> RSP: 0018:ffffd3f4815f3448 EFLAGS: 00010246
> RAX: 0000000000000001 RBX: 0000000000000001 RCX: ffff8ebc8728b17e
> RDX: 0000000000000000 RSI: ffffd3f4815f3538 RDI: ffff8ebc8abcce40
> RBP: ffffd3f4815f3460 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: ffffd3f4815f3538
> R13: ffff8ebc8abcce40 R14: ffff8ebc8728b17f R15: ffff8ebc8728b170
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffff8ebd08580000 CR3: 000000010a808006 CR4: 0000000000770ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  bond_xdp_get_xmit_slave+0xc0/0x240
>  xdp_master_redirect+0x74/0xc0
>  bpf_prog_run_generic_xdp+0x2f2/0x3f0
>  do_xdp_generic+0x1fd/0x3d0
>  __netif_receive_skb_core.constprop.0+0x30d/0x1220
>  __netif_receive_skb_list_core+0xfc/0x250
>  netif_receive_skb_list_internal+0x20c/0x3d0
>  ? eth_type_trans+0x137/0x160
>  netif_receive_skb_list+0x25/0x140
>  xdp_test_run_batch.constprop.0+0x65b/0x6e0
>  bpf_test_run_xdp_live+0x1ec/0x3b0
>  bpf_prog_test_run_xdp+0x49d/0x6e0
>  __sys_bpf+0x446/0x27b0
>  __x64_sys_bpf+0x1a/0x30
>  x64_sys_call+0x146c/0x26e0
>  do_syscall_64+0xd3/0x1510
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e

Please, can you always provide symbols in such traces ?
You can use scripts/decode_stacktrace.sh to make the trace really
nice, instead of ugly.

>
> Problem Description
>
> bond_rr_gen_slave_id() dereferences bond->rr_tx_counter without a NULL
> check. rr_tx_counter is a per-CPU counter only allocated in bond_open()
> when the bond mode is round-robin. If the bond device was never brought
> up, rr_tx_counter remains NULL.
>
> The XDP redirect path can reach this code even when the bond is not up:
> bpf_master_redirect_enabled_key is a global static key, so when any bond
> device has native XDP attached, the XDP_TX -> xdp_master_redirect()
> interception is enabled for all bond slaves system-wide.
>
> Solution
>
> Patch 1: Add a NULL check with unlikely() in bond_rr_gen_slave_id() befor=
e
> dereferencing rr_tx_counter. When rr_tx_counter is NULL (bond was never
> opened), fall back to get_random_u32() for slave selection. The existing
> allocation in bond_open() is kept, with WRITE_ONCE() added to pair with
> the READ_ONCE() in the NULL check.
> Patch 2: Add a selftest that reproduces the above scenario.
>
> Changes since v4:
> https://lore.kernel.org/netdev/20260304074301.35482-1-jiayuan.chen@linux.=
dev/
> - Reverted unconditional alloc in bond_init(); instead add a NULL check
>   with unlikely()/READ_ONCE() in bond_rr_gen_slave_id() and WRITE_ONCE()
>   in bond_open(), avoiding memory waste for non-RR modes
>   (Suggested by Nikolay Aleksandrov, patch by Jay Vosburgh)
>
> Changes since v3:
> https://lore.kernel.org/netdev/20260228021918.141002-1-jiayuan.chen@linux=
.dev/T/#t
> - Added code comment and commit log explaining why rr_tx_counter is
>   allocated unconditionally for all modes (Suggested by Jay Vosburgh)
>
> Changes since v2:
> https://lore.kernel.org/netdev/20260227092254.272603-1-jiayuan.chen@linux=
.dev/T/#t
> - Moved allocation from bond_create_init() helper into bond_init()
>   (ndo_init), which is the natural single point covering both creation
>   paths and also handles post-creation mode changes to round-robin
>
> Changes since v1:
> https://lore.kernel.org/netdev/20260224112545.37888-1-jiayuan.chen@linux.=
dev/T/#t
> - Moved the guard for NULL rr_tx_counter from xdp_master_redirect()
>   into the bonding subsystem itself
>   (Suggested by Sebastian Andrzej Siewior <bigeasy@linutronix.de>)
>
> [1] https://syzkaller.appspot.com/bug?extid=3D80e046b8da2820b6ba73
>
> Jiayuan Chen (2):
>   bonding: fix null-ptr-deref in bond_rr_gen_slave_id()
>   selftests/bpf: add test for xdp_master_redirect with bond not up
>
>  drivers/net/bonding/bond_main.c               |   9 +-
>  .../selftests/bpf/prog_tests/xdp_bonding.c    | 101 +++++++++++++++++-
>  2 files changed, 106 insertions(+), 4 deletions(-)
>
> --
> 2.43.0
>
