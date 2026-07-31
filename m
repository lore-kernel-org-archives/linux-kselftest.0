Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1218C442B1B
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 15:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511855; cv=pass; b=WSiyJS1NDxhnPrU30eSXXhZj3zy+1IiWIvBnGQLSgQ/j07yBclEd/HlBefz/UkpWmAQFufR5ggVb/5oI7U620M6P7UpR730Dst/Fkl/BIa4FMhsZlT4dJbWpTFzEPb5OFEC7eIv6BTKNQtzXnHQRJfu8ZIE/6GdSC6wm+JgvSak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511855; c=relaxed/simple;
	bh=ewX5vll4eCT221KLiCyTQCA4KARdLxwkCYF4FuZzmvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bev1DAMh3QlUnKW7+7rkEndKBM1j+/5tKo+F4xVrqy4Doshcfn0nTCv0FrKMkiT8zMIcu6PSmLB6byTHt0S+kP62m/hK0f7CQMNa5W9ICQkUHkYKzxqWEQa5jR5KD/36t4xVow9nQAl772YGf2QCj/XJ8h3/frlPpDlV2RsihJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dv7almrz; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dv7almrz"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51bfe810293so5324941cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 08:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785511851; cv=none;
        d=google.com; s=arc-20260327;
        b=A0RZfp0g0pRelkqhpcjSPdgaLNc51AuzPgNbjnbcIn6h/cZxI5PBm1LmUiSuTdU11J
         drpEN0CrLfMz1DIQmAvDPBocZBLUl7Xksyy50/1LRJ0MpXZuQxQCQhTdI1QpwRVKzPvm
         FwckXYOD2+6cipTYx4LxiFNGogQUtkz1r/kPxrtbx/SNKjyizG5gy6PBZv/B3AxF6B3k
         9LwYCgZ67con2gNqa7G/3373swJgKNZtPDOXwEee+QnfuA0iDVBT9vSPXJQ143RKhp0z
         xvKYgwHKJR/fqm0K24afntgQJ87x1195kVpYETO3az69taAcGbx+6doD54l9ndMoNep/
         O2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ewX5vll4eCT221KLiCyTQCA4KARdLxwkCYF4FuZzmvE=;
        fh=XgoybZORtptygvvj/I+QK6a9EcH1DYAADzScrKrWfTo=;
        b=bkJ8QaPVei6uzaS1309Jb0rrI6Eq8ielwnaLe8fdAEbBk3LkQKYMdv+qtpBtCyn8Pc
         Am6lGN8DA5WCdrmGmxB7/vpL8QP/+ue4Hh9WmoYjNQ2/xILPBlxGLjk4RQA491omrSRY
         6AD35JYtC6/Y9tfF3W2SdaThCclaLuvjrq7D4B5mAIJfS6guyjL2Na9SdXfQozLFdZgx
         Aw1UPvUWjpcAxOEcWhWNZMr12NVR8vxbKM8whjE3YLcx9OLhv8bOfgRMk0teOPmB/sJB
         hBtlE0ip+Ar8WfSaEW2UiJJM8xEyzTJSp+URrYhdl0HDvCFeJXi8yZ+RfBr2hosfCBvf
         jOBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785511851; x=1786116651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ewX5vll4eCT221KLiCyTQCA4KARdLxwkCYF4FuZzmvE=;
        b=Dv7almrzLgInu2aUvUTgDuu+AvSYoQPoJXwtqMKfNk2NvNgNV0ChgtOEbKITkDLxY+
         IK3lol9An0jJKwGRheMIA+9coU1UPxmoAQXv745nA3ijvQYWSKJZRN8CRoniQeol38ty
         TMd53QOjEyExUV3Dj2NhzYMcIEB2SYh1p/oTzzwX2fZkKSSZpAtVpZs4neDvUFx3FpTD
         vXMdnAtoW/r+VnbMyBqM44EFfSx+s6qUJbqq9+5447JTkLT55aJd+QYldBMRk5bXcXUS
         vDUN4pPibTIVAwUfmZ6U2mv9dGMTQrLPcQD1aCC+5XDH/zI3oiiwu0b/0yey5Qx8xxjK
         0a5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511851; x=1786116651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ewX5vll4eCT221KLiCyTQCA4KARdLxwkCYF4FuZzmvE=;
        b=XIbukXRqpSNfIjtRiqD7IWQiQX54CEX35YjtOWl/UeZVbBGXE0csJ3fJ1yenrsRIiH
         WIRKwB5XqURLlbmtldjnEfr/cSTsGQV+km5slXYC4us68xa/qaRz0zo3Nyhkgcijqjqi
         uhwuGSenX9Ric4nO690T+BtLwTRKRokKwInh+bSWxAUygUs+0XdDbNf86CJr/ep12KlH
         c8W+YveNNjCJEsBJ57gt4Ja13kKEghmbo4ontPAz+H84I8dQXEyVEhkK2XW2C8WVWqce
         C3Yn0TUpXKcigqFnwsKnaiO9GsNXUF0wHPip6A+uguzNqWw77WKJobMO696hf2XTrFnE
         UXYg==
X-Forwarded-Encrypted: i=1; AHgh+RrL7s8LDypC7CDv1ZN8iqsTbAOkFJlAbOD/Oe3KIT8hmvDgpBd3JjK9xjkEYU/oFCIygpSBKJrNtp4BvFibLLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoqbcUi3Kh+xkQYtpmQ8HG+qRuXJzwFZ9WADVxwPT4t92WqCj1
	Dxh9X+gS5phDl+jHPw8YcL/C9zMjVaPJw9AYduc0D4nO3yAWvIAj9ybCgSqgvWbdP9/BLk3yxKG
	idDW8lhERU3nD4t7zkrYCh6pi4S/uXnPrq/FWpqc=
X-Gm-Gg: AR+sD13FKv6yAsg8tpBC62ouBt/WHlkuAN16FPOkdKye8Sc75LFq6zQKmatIKJYSZkE
	YPOr0bGOjvFgQlDZrwCa9x4vQT3hlmpuX9WHQYm9mra/fp3ozu9MJZngyPMejmoSl4DtvRlToe+
	OBP/fBbnGrt6Z7UCfVLvL9KkiMfG6nXwyID7KvoqYrvi2qR+ATHTo5wV1mF4VJbel9CgEYsR72v
	jBrOd0VfT64m/lzoes/hNEMR22UqSEXyOHc1xlzZ07Pr5siaFkQqHpF548flX/zjLX1j15K6AsF
	COAgmTFvxY1CPq1ZEhX+AVrGUptGcWOoVci8HaYPmGzMaNKe7leqBoNMUdBn+BRkmSib+NaCVBU
	=
X-Received: by 2002:a05:622a:2590:b0:51a:8c79:a2d with SMTP id
 d75a77b69052e-52b56673ed7mr13843131cf.1.1785511851030; Fri, 31 Jul 2026
 08:30:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730234533.1912709-1-dwindsor@gmail.com> <20260730234533.1912709-4-dwindsor@gmail.com>
 <CAHC9VhT=m-GtOZx2AHym7uN1CNx94arKBiXeVC7LTEJ-b=1EVQ@mail.gmail.com>
 <CAEXv5_iiNspub=qE1YW-01sV_bxxFUrrcAR4KV4Ec5i_mePtHw@mail.gmail.com> <CAHC9VhTS7rSnBqg00ZxNkcZyh_=EeJmn_4z3CTCCxreEEDtTtg@mail.gmail.com>
In-Reply-To: <CAHC9VhTS7rSnBqg00ZxNkcZyh_=EeJmn_4z3CTCCxreEEDtTtg@mail.gmail.com>
From: David Windsor <dwindsor@gmail.com>
Date: Fri, 31 Jul 2026 11:30:39 -0400
X-Gm-Features: AUfX_mwCzstzsX_jENhs2p3EGP2HH7m68AkpKrdRcMR6AmexYou-kWEv9wNOVLk
Message-ID: <CAEXv5_iHLmzPT3Jj+qZsdt1Nk_5OD4Up3GGV0S9G7KyQshFhDA@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 3/4] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: Paul Moore <paul@paul-moore.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Matt Bobrowski <mattbobrowski@google.com>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-integrity@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 11:17=E2=80=AFAM Paul Moore <paul@paul-moore.com> w=
rote:
>
>
> Okay, it looks like there was some confusion/misunderstanding.
>
> My understanding of Kumar's comments was that he was referring to the
> exisiting LSM related kfuncs that are located in fs/bpf_fs_kfuncs.c,
> not necessarily the new kfunc you are proposing in this patchset.
> Kumar is welcome to correct either one or both of us, if we read that
> wrong :)
>

Yes, after another reading, that does appear to be the case =3D).

We'll need v7 anyway to fix the ocfs-related UAF the bot found.

> However, regardless of Kumar's intent, speaking as the LSM maintainer,
> my stance on this is that the kfunc you are proposing must live in
> security/bpf_lsm_kfuncs.c to be acceptable.
>

Ack, will do this in v7.

The Landlock series currently up for discussion [1] is proposing
placing its kfuncs in a new kernel/bpf/bpf_lsm.c. Should these maybe
go there?

[1] https://lore.kernel.org/bpf/20260731022047.189137-1-utilityemal77@gmail=
.com/

> --
> paul-moore.com
