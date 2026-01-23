Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE8937FF61
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 03:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769140552; cv=pass; b=KX+S8IEghQZ65gZLcfsEfwqwq2IjwNyTV0xH1iSnaLQqHK0KAzIKhViMvfTBYTrwGVO1ch6uv/am/ZpDIIqyeKWDuHewIrQjGV0S1T5nSoGtuNCioh0p5Zkvpubib76zebxo0xsYgXEk4DxnvE5eDhQC4S20vtQWDGnIXfEpsbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769140552; c=relaxed/simple;
	bh=r9jHNWMSvfTiZP6TKyMQXs/9znXBmvFyE7ShBNFhg68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MCz9+q6GhsI++on9nnc2S3J4qpyRqLyYRjPy2tL/xdPVFF+T/WrvC29cRRHhw6CUhpg6ruriOD55DdiNqFTC64ZjbELFqtEAqVSPDbxbV8+sax9N4/46OmXTwdzXrX6fZqbRiCWCMsCSwLTiFpwYdW+Ai5JOODT8nY8tyzjtMoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wr283itV; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wr283itV"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359019da8cso1652444f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 19:55:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769140541; cv=none;
        d=google.com; s=arc-20240605;
        b=igSugHeB+LlVjBDTOVpJ7JTpI06e7qetBoyP+GxLvYJJpyfOVDPiUyo8NujoSZGF3A
         NrUQ/proC6DmtZV1rhf0ry/Nw8MJOPxGa+Sb10ojYDUejmPiigQ5pygzXKGqv8lgu+kS
         OVij6HJxvDQHaVy3veTxsS+zbKUt4Mj1LExSGwfwdAlqcA/wDeQcLhe+4suGAk5a9cqe
         Ng14hiERT6+tAoy86kIAs5AlkGND7RMDDMudpHczjWel/OqgvcjK51LdmxftYGdxh1d4
         pucuCKQFSPc8mAwjVHOjy13qOuAxRU7dSVxBSrnhzhVemCeQFRARKMHIznSOP1aY+vsc
         cSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oLUC+i+ADen7EDXOxfQZCpoTM8xhG1CfD72IdTQT+yM=;
        fh=XTOEQnoWcX0GfZ1Ph5oTpPprFSY5PIEXdNqQibDPP1Y=;
        b=KVmVyvyCx/OWL1dRvbo+Dv/R32ncMdnES7xZXm1LTcqIXE0hGEtyC5vwmVwm4blcXZ
         WK+9zOcSV1U8VhP6vTkzSOvuGH2rRyBLRHDObcMOOtOi7VP8grGz+cIhPOv1pX4JExE4
         YojQDhr1Iz+o8lU8rXCbGbBHDUV9DsdwFt4Kevc7qVNcWBwlCfXYs59IZgdlPWd5bzDB
         5rbYOACv5wK6Dwe0csTOCMnWNkhBdF2zabEPCDbYAjyIc1LqBXRPA3NyTyJgKYAIFbfl
         i7QHRcEY9XRRA8qGT/maIdPzKIwaHTWbxewuzfyaOqTNMBoVDhwttYwTvlHu16/UbqYl
         T3FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769140541; x=1769745341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLUC+i+ADen7EDXOxfQZCpoTM8xhG1CfD72IdTQT+yM=;
        b=Wr283itVQA/08aWtrCdvA/5rHxNYisE4bHuEllFQE4LnL1o+9MCovBMtwrEw1sCY4g
         hcsizIuKM6VKVLrCnRsq8fKb+9o4MTonWjtmRHcX5Yd9rjS3eAJUqv3ldWQ8PNQHfrb9
         Y3tNVZTTQVDtrpnR8SxgaAoJclF+UgMDmmpqNIOOVljRDNUcIN6c70tJvLPGsgXToAl1
         4eJI8X5TfcS6qB3RNr0FdTh1IzB1RAxkiipzlUZUqkIRrs1Dvz1z4Xeda0lU1gpjkGUR
         Y6qmptXFtnLTUQkmr8fWXs+/YUndG1jsTxSVFlmzmlvWMaSDSIIGn2x77KxUtOPOm/SR
         RzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769140541; x=1769745341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oLUC+i+ADen7EDXOxfQZCpoTM8xhG1CfD72IdTQT+yM=;
        b=OFrvt2It8Mn4NAampjZcQ0XoU2UepS4zxilnwjOq2/djcU363q5+3XsVzgM2pi5JY0
         uNDMMbjVCItTtMQfpTr8DuFkJuWmOI1tioDuBTJrSPtletVSetCMu21PS4SkM/xqI4ix
         QG/ZYDo8XFF1iY8SA7OAm8tZTFD31ILnqhG+/gpO8raLzUjeXuFx9ktDZTLSpkHNeCRN
         tFVm9HMvqXqW/0De+B62vCp5v+afDYbTRo3hYngNcw+UkfehqUFw9kDNbE+vdQezsZiM
         iZm8MzueWC7dMCPq5zC4yXUhuwEocAb92SeIWKNX++9vWRDStrFmeIHwU9BejMeFMLjT
         7xXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEqbvnyMIcpelO5KY6ztqYc/ZY5VkBcD6XdmMOwcgcwqfdGg4a6mhjCDwK53lbBjHWMAnYxlcYFJVrGsb5DDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHSXOg+kx2a6z4D8T+EEQQvW7jPgWI0VgPVcBRwiEoJUasQAZz
	HXQakradXdIbaDGkxYsgu2HZyGYv0YAlINyDA02UXQZMUPb1o3n6K4txxcHDOWMU2I3maqN3j8y
	9QObxGDi90LtYsoYTdRB6mxhuo+eBW3k=
X-Gm-Gg: AZuq6aL3K4XlzNarjeJ5b/XPVT7TPwjlgP9ldCD5GByUq1X3ael9AY+6dM68AMLFI1Y
	0zuElcjaC0BZRzplyZD/HZ7p0UuO9FS8P7zsum2XYwt2ivtFh4VA0kGKdPZfeutjlnxJqGu6H3o
	kp+Us8bvrHJ1nvUQR2w2ZwxHAw001sXzgI/MlER0QD0CTIeA1CISiwMLjz0N2ekAAWlhYpey3Jy
	Y84zsGdeIF3mVGL/sb9M8P7vzg2Uh4CCoFQqi29HZpfhiQBCjibqVpJC078u/7Un5jD1WXat74p
	+8yE4zf9L2uBd2B5sKL3lMJ0qfMW/5LxUZy0IFIKTM0zGqztfdf0ZbRzQudyXTw0X19LhCUYGwY
	8kfJsTr26k6OV6A==
X-Received: by 2002:a5d:64c5:0:b0:435:a0ca:bdc9 with SMTP id
 ffacd0b85a97d-435b161bf3cmr2680572f8f.44.1769140541425; Thu, 22 Jan 2026
 19:55:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123032445.125259-1-leon.hwang@linux.dev> <20260123032445.125259-3-leon.hwang@linux.dev>
In-Reply-To: <20260123032445.125259-3-leon.hwang@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 22 Jan 2026 19:55:30 -0800
X-Gm-Features: AZwV_QgqHod6Vo7nyP7nHa4qnphQWjyMdvjVdCTjYDN8Z6Yuxj1TGy-HCaBPn3c
Message-ID: <CAADnVQJLz+nMHCZXUgy2MOxwFczEHNbG8ZUgfZeUY4yXFUKcNw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 2/9] libbpf: Add support for extended bpf syscall
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Seth Forshee <sforshee@kernel.org>, Yuichiro Tsuji <yuichtsu@amazon.com>, 
	Andrey Albershteyn <aalbersh@redhat.com>, Willem de Bruijn <willemb@google.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, Tao Chen <chen.dylane@linux.dev>, 
	Mykyta Yatsenko <yatsenko@meta.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Anton Protopopov <a.s.protopopov@gmail.com>, Amery Hung <ameryhung@gmail.com>, 
	Rong Tao <rongtao@cestc.cn>, LKML <linux-kernel@vger.kernel.org>, 
	Linux API <linux-api@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 7:25=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
>
> +static int probe_bpf_syscall_common_attrs(int token_fd)
> +{
> +       int ret;
> +
> +       ret =3D probe_sys_bpf_ext();
> +       return ret > 0;
> +}

When you look at the above, what thoughts come to mind?

... and please don't use ai for answers.
