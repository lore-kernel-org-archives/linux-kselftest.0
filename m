Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14D43911DD
	for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779621761; cv=pass; b=G7hW63qJ1IF6sWA7qSK1pvsOh+ocF7yoaa1FH77k6hDHcUDkKoLJUt2cyZUESk91zY+m71fSHliIBzNqodyl33boiuhgSD1BgQSAJ6J84A9Ptwk0t5IxsS6XqdWoPtPymleI+tQTMMrImgUPbSMA6QzmajlbCC485E9c3dyhRZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779621761; c=relaxed/simple;
	bh=O+JZPaK3uRnpTVdRdyFVDzHP/W2oZHJawf02YCzFly4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHtaQfp11VzYt3b0DybrmjQx27F9xFP7nWguB1IPyPAEW4zVbp+gIMhczk3S982yB3BA14Nm0lpuVHq7XN7zA6hqGPUAr9/sc8sAa31vUkBbPlntNF68WShZYGLOYNFo4+HXOip1y6XDXqDaRDK1053l94wKWsKP2vhPtVx7ADw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyW8SkrH; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyW8SkrH"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so4565823f8f.1
        for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 04:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779621758; cv=none;
        d=google.com; s=arc-20240605;
        b=kSC1iXVRF8CsiC/aGKuLWiR2SUqfWtJ6ojTABnVFNj+tRKrwpWUGEccD0RB7jCahkE
         x46ia+tHDlHiFtPLUnPjYRfwEpk662e0YPVve1HrcTr3WRtJfHmIS7BWck9FdC26Senu
         2Y+cXgyiKUFqN1rxrjiTfxaK0r5NTUZ0MFKaitNitQ3DR+Lxn5VusGU7CyYSrJZNwuQK
         fJqS7jga5iX0nLJk5fHAvHkMgtIgMz2gJuYjhX1tBYRL3ArggUhybVtM+vJFhiLlQKqA
         /00neoXreQwIOHWC/ZPIB7geGwHFyzO+4cvMc7PCrlrexDrkkCX67dyW6uygwHpqd99X
         zf4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JYSKa/1O4kDWFIkCrrL8W7AexNe9Onv81BeAx+bBfI8=;
        fh=+YyawgI2LA/HaDMNBwsqzPGSbiOTqpo9CwEExHkiK30=;
        b=Xrhs5bC85jzsGJzvlEJY29fn0aJuOKifuCVaSYb307OIio8+9fFhnLkGGLnja+8nHo
         x4asI+ggp1NfHAdCMzQu/a0khX49ytvhYCSxiPHn45LRGeY1v3sleIqvp8jyAI8H3htd
         JXVaZUIgV7C/aTDK1SYuBnDq4PpaOJQ49puXigiV1XT/NJ8p3stLvr5mwzMZKS/84mH4
         pS4wJ5ETbyQcA7s3kXAkmTnSPWh8vOIkqOz50R+yD0jezBeI2BBAjb38j6fEaqHfwsA2
         hHnl+CM3DTwn9Yqc9UqYJpW8Cyve1f/HoxKRvaM+mPywG3ZdEyIApuVS+KRzZKgf1uUr
         EldQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779621758; x=1780226558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYSKa/1O4kDWFIkCrrL8W7AexNe9Onv81BeAx+bBfI8=;
        b=fyW8SkrHpdAp0E10iPgLN4TZJpk2OlISyv5ozXCIVPOd7D2/eDJDYOH2p2jYkuoptK
         tzuaRtnwbECR2zjnISJcnL6m70BdPShM8C44Plua/pKRwW5E4j5RehDSkgIY6iEohDNw
         yHofDReNq1PN2D5LKlFEvPRUXYNWqJaQRqqnA/CbCo3gtfX22ZiCRM6J64G6jBkuq1Uz
         6IG8sczDjWpQ7MMJe6rDWMfmWumb7dFedFWztRBBc6hnbXrA9aiqhLcFmecXbm04GPAr
         V1wguZkwSSLZm8TaY886ZJ3n8UBqg3aOsfTmB2pSlsbnyzi03ArfyVp1cU9VaRTsXV3u
         6YPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779621758; x=1780226558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JYSKa/1O4kDWFIkCrrL8W7AexNe9Onv81BeAx+bBfI8=;
        b=YDlfUTxFw6HzUNS6mJmVNxKlcKyBU3zOI6578rriz8hueYXbwceHT8WIqy731jtsnX
         Yct/jtpt0VeIOPHZtZq9YcZhdup2coclJvK+WWtpsjG4252FayInyq7Fx2smpXMIpbdb
         FR3reKSKrkhc8ZgcCT0z4UHFIn5dft3cfS/wFzjMLEuNZndbsUjR9P9MTl4036ga2xBV
         clvdX0slc/UPAvDxTTBY/FubUh1CKi2ZShle6NSBCvDcQR89EjKzwcxb134bEMoRbCem
         jkXlAYVtKFWliF7mtqHcMOWroBAlxDkdbsq/P9cJDGaZi+FCOn2In/Qo9PqaFLU/OdU+
         I2jQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DEILppwtyMVbUViq4/F6eIir+ZCJkomu4nwHHVCmZZYLYHXx4hKyl/8DvDQoz+6EvT7P5+2K9cwLH6gkGIeE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz542X8Qhm4Frl6UMjQHYHbSC7vBiRnXPYWuyn+u26bJFSNZl1M
	6TcDRsKBj++oV9P4gY4zKZsrxSodsObwfKWHF2kA6LikyQ4P6cAiwEhFq3i8PwbK2VNJwXywr99
	mfTB3aasPY/6PiiCVL1uVJlSwrLCeGLE=
X-Gm-Gg: Acq92OGc9xzbdrFQUu+OV8kc7Dern2sw0iMVdVrluA8i4GqnTxzvjrmZmGnCQVYUYT0
	13Dnl25ARS3C5kN4hlzujmVgMJOtFQO6hEdPeCXt3FphKuF8a2oYo04z20CFE0oFEOmh8Mw6JJx
	AIq70QfhnaJDot+LvumLUza3ABako+iYvOSKNtFlYvl3v7qP/ZMSbdnFZsr72xBti1qeISxRziM
	IReJB3+2oaKB4fn6WyWX9S86OEcQZdHqDu1q7r70XS4/Sg1NuUHznxXxtZWbZPjyQDa86MXhGrM
	jsGc5AHbvLMSIOFjRrgzY2itvjzG65ZVm4NNON/7Plg7jLzCBjvP9UufAcZyoBZJmmDjqQ==
X-Received: by 2002:a05:6000:468c:b0:43b:5b25:67f8 with SMTP id
 ffacd0b85a97d-45eb38b392bmr12088047f8f.20.1779621757808; Sun, 24 May 2026
 04:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515071504.2054786-2-yuyanghuang@google.com>
 <2e08eb1ca27a9a2f8ad29e1c24f779b579621b0a648589f7044799d91c5e00f5@mail.kernel.org>
 <CADXeF1GVtFHNZJb8xwFh6aadR=H19S+kja8rF185XB5=fg0D0Q@mail.gmail.com>
In-Reply-To: <CADXeF1GVtFHNZJb8xwFh6aadR=H19S+kja8rF185XB5=fg0D0Q@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 24 May 2026 13:22:26 +0200
X-Gm-Features: AVHnY4I78oJkw5wlqyzmj1cIkIp7UAJvj1KW0IsPVe2CbVCPVcMgnKOQ0enezFI
Message-ID: <CAADnVQ+42+Th6OFGq2KawzvyKUAykazb4fXh2_uqss-T+R8VCg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: align syscall writeback behavior with
 caller-declared size
To: Yuyang Huang <yuyanghuang@google.com>, Daniel Borkmann <daniel@iogearbox.net>
Cc: bot+bpf-ci@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Yonghong Song <yonghong.song@linux.dev>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>, 
	Lorenzo Colitti <lorenzo@google.com>, Martin KaFai Lau <martin.lau@kernel.org>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 1:41=E2=80=AFPM Yuyang Huang <yuyanghuang@google.co=
m> wrote:
>
> >This looks like a bug fix for an out-of-bounds write vulnerability.
> >Should this include a Fixes: tag to identify which commit introduced the
> >unconditional copy_to_user() calls for query.revision without checking
> >the user-provided buffer size?
>
>  > Fixes: 3fe213c040b3 ("adding ci files")
>
> I completely missed this checkpatch comment. I will add the Fixes tag
> in v2 if there is a consensus that this patch is the right approach to
> resolve the issue.

AI is wrong.
The fixes tag should probably point to 053c8e1f235dc or a subsequent patch?

bpf_mprog_query() and tcx_prog_query() were only introduced there.
How come your userspace passes shorter uatter to query newer
BPF_TCX_EGRESS attachment?

Please provide more details.

I'm still not convinced that what you're saying:
"
For example, our Android net_test  suite uses this legacy 40-byte
Python ctypes struct layout:

  # legacy 40-byte layout (pre-revision field)
  BpfAttrProgQuery =3D cstruct.Struct(
    "bpf_attr_prog_query", "=3DIIIIQI4xQ",
    "target_fd attach_type query_flags attach_flags prog_ids_ptr
prog_cnt prog_attach_flags"
  )
  # Invoked via: syscall(__NR_bpf, BPF_PROG_QUERY, &attr, 40)
"
is a kernel bug.

Looks like user space is querying new attachment types
with old structure.
Potentially the check can only be around:
        case BPF_TCX_INGRESS:
        case BPF_TCX_EGRESS:
                return tcx_prog_query(attr, uattr);

to be nice to broken user space,
but, really, attr->query.attach_type shouldn't be equal to BPF_TCX_EGRESS
with a smaller uattr.

pw-bot: cr
